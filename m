Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BECFEECD6CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 17:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zAwgc6hxhl6ZxWQQFcv4/s2l3P59HDS+gdWg9p4CwWE=; b=Os99VZYJwwL4F2oBcgeJPaShTk
	7DlkHShqP2CatWExteAVOUyzUYbjPj4SdjT5iID6nN1PTm7kj6ks6c4xW71OY/Yi0p2rH7PNjELjt
	qAfdzI6YKnVMfnJrTZs+2FWOchaeknLQe6winfx+1+wa81wWEe+cfCIpSu52Z0u7NqXflVo+udQN3
	FHS9BIVMwu8ZOvxI7twvVoqMLzKZyeW4WhTpgelztjNfG7rMUAjrDzJlwoR0Y0Ea7ImOU1rg3C8uF
	B3wuhnFWhUJokbXSTTu77PS6kgTZ49vcGb72EXN51q4imXShzPs8Ea6bvsTTLccoEUPHgkIFQizoR
	RrHqE/KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqDyX-00000000tT7-1Fo2;
	Wed, 11 Feb 2026 17:26:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqDyU-00000000tSk-2vfb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 17:26:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61377339;
	Wed, 11 Feb 2026 09:25:54 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C74A33F63F;
	Wed, 11 Feb 2026 09:25:56 -0800 (PST)
Date: Wed, 11 Feb 2026 17:25:54 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	bpf@vger.kernel.org, arnd@arndb.de, will@kernel.org,
	peterz@infradead.org, akpm@linux-foundation.org,
	mark.rutland@arm.com, harisokn@amazon.com, cl@gentwo.org,
	ast@kernel.org, rafael@kernel.org, daniel.lezcano@linaro.org,
	memxor@gmail.com, zhenglifeng1@huawei.com,
	xueshuai@linux.alibaba.com, joao.m.martins@oracle.com,
	boris.ostrovsky@oracle.com, konrad.wilk@oracle.com,
	Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH v9 07/12] atomic: Add atomic_cond_read_*_timeout()
Message-ID: <aYy7ogNXVaNNL5NC@arm.com>
References: <20260209023153.2661784-1-ankur.a.arora@oracle.com>
 <20260209023153.2661784-8-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209023153.2661784-8-ankur.a.arora@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_092603_227861_58007A05 
X-CRM114-Status: UNSURE (   8.07  )
X-CRM114-Notice: Please train this message.
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

On Sun, Feb 08, 2026 at 06:31:48PM -0800, Ankur Arora wrote:
> Add atomic load wrappers, atomic_cond_read_*_timeout() and
> atomic64_cond_read_*_timeout() for the cond-load timeout interfaces.
> 
> Also add a short description for the atomic_cond_read_{relaxed,acquire}(),
> and the atomic_cond_read_{relaxed,acquire}_timeout() interfaces.
> 
> Cc: Will Deacon <will@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

