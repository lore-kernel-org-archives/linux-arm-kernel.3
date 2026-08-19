Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D889AC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 15:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kausCbxLwIghWU4PnoYJnwmtdtyTp1IAwzbVVzAkUnE=; b=sohKLBlGPG74WBN/qlvq04a4Ty
	djV+s32sV5K+phozKGYqIPcXQp7qIP3OWYaAnObeGfF+Fg7/7pUc8SZ1X3uFLzSdjy4N5Qw2oTJY+
	n2821ZUbotZf3XTosaFGFvycco7e+WCQknwZ1LYs8LanZfeB/dPzZ2JJKC2ZFtEdH+0rbpD4AmB8X
	U1e1HPh1QepdqND7jXZndrKWG64MIV1em5EWyspIegMkKZbeHk3+aO9d2rKKtZ3diuYhD5l0JOudH
	/DvEE4LeU8oJ3+UPTN0RuMdgF6LwJ+kDLoMXWgpeIh/7gw3xbVrdiSYLx+y0DFwLXyagdMoP1ANpH
	3XzwRnaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwiSi-0000000A79z-1oha;
	Wed, 19 Aug 2026 15:44:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwiSf-0000000A79Z-1LM3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 15:44:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B10014BF;
	Wed, 19 Aug 2026 08:44:10 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9991D3F763;
	Wed, 19 Aug 2026 08:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787154254; bh=qDgF7RlB394z0Pnv/6oKwgP89YUFVt5qNeaVL7nT+qg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GSQ7RlECIED18WsJfnCoHcPvwkCzua5PjBmNXVkDOGxqx06NdNiyVv0ItYPYp+S/w
	 zOnbiJudid+c3eoAexC6J0TTJzauUNhyBbsPgmbLZF2IlHJPDxouyAkJc2xW8Dywmm
	 fKEoBxB2l3a+2hInN25Pgzl8Ck6YqaIUqiO2lq4w=
Date: Wed, 19 Aug 2026 16:44:06 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org,
	yeoreum.yun@arm.com
Subject: Re: [PATCH] arm64: process: Fix context switching MTE store-only tag
 check
Message-ID: <aoXPRhobbPO0hTWf@arm.com>
References: <20260819144859.5447-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819144859.5447-1-vladimir.murzin@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_084417_490624_C4C65FA9 
X-CRM114-Status: UNSURE (   9.70  )
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

On Wed, Aug 19, 2026 at 03:48:59PM +0100, Vladimir Murzin wrote:
> SCTLR_EL1.TCSO0 is set when user opt-in for MTE store-only tag check
> mode. However, it is not part of SCTLR_USER_MASK which imply that on
> context switch we never clear SCTLR_EL1.TCSO0, so we are leaking that
> setting into another task.
> 
> Fix that by including SCTLR_EL1_TCSO0_MASK into SCTLR_USER_MASK
> 
> Fixes: 4d51ff5bba00 ("arm64/kernel: Support store-only mte tag check")
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

