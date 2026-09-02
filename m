Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A828DC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 20:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4UbAnf1a6CiK69QYEYFjB2Egx33UW0sHKquJ0GMWF0Q=; b=EndEqMh49HpYnW4w490eQ+LeBB
	mUfdAP3y7aO/PpDiQcDH7rHK5eN3KZe5pIjgrgW0B/bX5sFZNvkr6zNPwckvqlDgztgdp5qxZ2xfm
	Yyc4Wkmo1MtIkB7MML/C01ftoZQc14R4qjP932xDObyP4XyUhCzhQzKry+/HG+QqTLVqAmVSOl0iG
	P8c/MyAHqF+RKHxUXKIkOb9AKyITh2sodNUa4hLi8W6VwiwjK5vu/1PlsXb+IeJOpZ8QemXtSaOmo
	ts3Xj9jR4085jMc1ovhxoc7Dm8chgvZV1uqklHj2+GJbbdGKacZ/qnyfMXdU9szuCPPVLO+u3kBBH
	xLBn+KqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rOc-0000000FqRZ-11dP;
	Wed, 02 Sep 2026 20:17:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1rOb-0000000FqQM-161X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 20:17:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FD7E437EA;
	Wed,  2 Sep 2026 20:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FD261F00ACA;
	Wed,  2 Sep 2026 20:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788380240;
	bh=4UbAnf1a6CiK69QYEYFjB2Egx33UW0sHKquJ0GMWF0Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZUkZjW9c+WE7uqat1HYdkJcO1QPmQ14H/iGgqBcrnsD+mUDkQdA4gxNyvRN+uYYns
	 YbkoPXsCShJLpFBfHmV2EAGdJqJTFij+LjfuZAi2Jd9g0tYUNk4dX8dDLRjEqJJuWK
	 ehFONmWe6Plr/fZZoaLII3X+pWLTsLEOr5lDj3shL5aBZd6o7t2TWmzBjx2FvO3WA6
	 eiKa+RmycBsi0vmmNcdmM+FUHMpLahFvpYzE3MjB7z+DQFh/5TB0I7IRwqLaW6aBPc
	 mPejXrmhLQZ3Tv7UjpnAxWILIxKzXlpms5uyMOV6laIRBjJfmBcYo0J+UsDGrsUk5O
	 s7PuIV8srTXaA==
Date: Wed, 2 Sep 2026 13:17:20 -0700
From: Kees Cook <kees@kernel.org>
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Cheng-Yang Chou <yphbchou0911@gmail.com>,
	Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: arm64/aes-neonbs: transition to kmalloc_obj()
Message-ID: <202609021314.8A9C0B8@keescook>
References: <20260830101714.625728-3-manuelebnerli@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830101714.625728-3-manuelebnerli@mailbox.org>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Aug 30, 2026 at 12:17:14PM +0200, Manuel Ebner wrote:
> I have a couple similar patches lined up but they could be automated or maybe
> the script is already made by Kees.
> Kees can you make a script assisted commit (again)?

This lead me down quite a long path to try to figure out why the existing
Coccinelle script (scripts/coccinelle/api/kmalloc_objs.cocci) didn't
catch these. The answer is the cleanup.h macros and poor interaction
with Coccinelle. I think I've got a work-around built now, and I'll send
a new tree-wide change to Linus before -rc2 gets cut.

Thanks for noticing these got missed!

-Kees

-- 
Kees Cook

