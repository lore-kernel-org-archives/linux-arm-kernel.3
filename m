Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DC9FD9E31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 03:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tEZMCLSitvN/iHJxJSEfpap192KNREeNPS1ZmYp1+/s=; b=iS4bH+LPdS48YcxZPn77Qctv5u
	8YNWNZoJEigMVvDD/1lC7WzEhgyaVEmGR4FyxMQYdzroV/7W1+TV7mNFXQxAdNxWT08KAHtTfJFfJ
	oUhhEJLZxkUO556hFuUN92bLE8MIpBeLun2PntjCkw07zMKGkcZrFbB/MHPMjrJdXk51gJn1NcRXN
	c6/3Fe7PHrCwV+RuFs2+R0pp+q6AtR6Ylj6Wi46YPgRfDzrpiSRbHZo2VBSScHfPj7Wi6Vhexhj5c
	NuS1omFGNuerhf3SlxUSN6nkNDekudO0DZpoJVEvuXjKW8HRFxg8JOnDUCihwoLPMDQhdwht+FI4a
	3mKaFT4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvoLW-00000007ZLc-12we;
	Fri, 27 Feb 2026 03:16:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvoLS-00000007ZLL-3UZD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 03:16:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C53860054;
	Fri, 27 Feb 2026 03:16:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 773F3C116C6;
	Fri, 27 Feb 2026 03:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772162209;
	bh=P8eBGrp+uqGnWWDgS2XgmXVsTXESBka0HtSRij/S6pc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CF2EERlNwgZNhf7sKFq/KpBIU/svWjGm63+pmHx6CkGGDkYSnSwE+EE2YwP/mZVht
	 7MZVD/kqbLkXW0VeJGSawnq+p3ku+e++pdMveH90yl9bRyUdKec1+Eei93l/nLpAFS
	 zifduEwThOn7sSg8DfQR/2/BMVFTokPz4utUaJB9GwJa+s7VGfAnMblEq2M37WyOq2
	 YgXM31kL7NNbhaXOpBeYoOROw3kNI6uy4M93rd4PjPKso/vuPhd3HQVrw7oqSxOPnJ
	 aP6WQLY71pswKVVTthOkagLBblhFfuaoj1IHF9oVbgnlJnHScDxhUS0xHK+spoivbn
	 o7WtoHnrKks9w==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 0/3] arm64: WFxT fixes, take #2
Date: Fri, 27 Feb 2026 03:16:32 +0000
Message-ID: <177212957063.389801.16174235042958254939.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226082234.26707-1-maz@kernel.org>
References: <20260226082234.26707-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 26 Feb 2026 08:22:31 +0000, Marc Zyngier wrote:
> After my previous WFxT fix went in 7.0-rc1 as 29cc0f3aa7c64 ("arm64:
> Force the use of CNTVCT_EL0 in __delay()"), Ben reported that it isn't
> playing nice with preemption, due to the use of the timer workaround
> percpu variable. This series tries to address this, and propose a
> hopefully better alternative.
> 
> That alternative is in the form of a new "virtual counter" accessor,
> available in the same way arch_timer_read_counter() is, except that it
> is guaranteed to be the virtual counter. This helper (a function
> pointer, really) is updated on each CPU boot in the same manner the
> counter accessor is.
> 
> [...]

Applied first patch to arm64 (for-next/fixes), thanks!

[1/3] arm64: Fix sampling the "stable" virtual counter in preemptible section
      https://git.kernel.org/arm64/c/e5cb94ba5f96

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

