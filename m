Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE70C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 15:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1n52K2Ecs0rvNvb7Wx6zfsNYz+Pw0RbIiWPNEiPmYtM=; b=U+cugEd8AApb0wVoFmkdBTDVsa
	OdFNWGdZwbAJQWz0ED2ahmAgAtVAVPtAAXYCJyER0qmHi7NF/wtBzZX7ZuVSm7fWyJGXEKhN297YI
	TaFprdaN2MH/BPWRcJI69ieH1kgG+NGjVXx1OyKsFh94ffT/oUdR7rdu9uH2oAI7LohKTgEIhZIJx
	xvPvBlmsq0t0fW0SNv6r+9PdGqlB2AAayIQWhKyjjLEl1nYbQLBmml/Jovlv0LoLKCQl4NAPgG4sL
	DiF9EGkBF4b9Y0ywemQWeLLdGGanxUORBDxburZV2P8+K+kAPnwGjL5I+ZTkIjZLzNqPmFabaVEeO
	gVPW2mOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzHFQ-00000000qr8-2ZMD;
	Mon, 31 Mar 2025 15:40:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzGu5-00000000kA0-0IOk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 15:18:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1n52K2Ecs0rvNvb7Wx6zfsNYz+Pw0RbIiWPNEiPmYtM=; b=jq+J1FJhdA0ywdc2jT+QIw3sTD
	1xJw1BtSQHm8s912c+lbyA7F7E0z487dN8fquAfywdvSNtsNUDCe1XHRRPtQfbpFZwgAqTiLeNLI4
	4+F0kUqJC3U+jg0yTnfZQTt3SGrZSenwWgy8/TNpHgza0IzccfDjt2ud55FjVDIPAN2PpuHeEIagg
	WfxyrjjHpuek8ZAb9zMrwez3yjwu7JyCnAyw8vVdSvgwe1xQgeMA0/fXQSViZegTg6oY5ptz6phAI
	EKGjKJ+Pxr5z/GLqXk+ZSom4o3R6eD4KS9GYtEB3hcmZhb3/H44uZZ2Qbn9vsijnkSu9VqoXOvmDG
	/sFSjbUA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35078)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tzGtu-0004Hw-2s;
	Mon, 31 Mar 2025 16:18:10 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tzGtp-0001mP-0c;
	Mon, 31 Mar 2025 16:18:05 +0100
Date: Mon, 31 Mar 2025 16:18:05 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxim Uvarov <muvarov@gmail.com>
Cc: =?utf-8?B?6LCi6Ie06YKmIChYSUUgWmhpYmFuZyk=?= <Yeking@red54.com>,
	ardb@kernel.org, bjorn.andersson@sonyericsson.com,
	dave@vasilevsky.ca, ebiggers@google.com, linus.walleij@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	liuyuntao12@huawei.com, lumag@kernel.org, masahiroy@kernel.org,
	nathan@kernel.org, nico@fluxnic.net, oskar.andero@sonyericsson.com,
	ruanjinjie@huawei.com, victor.boivie@sonyericsson.com,
	Rob Herring <robh@kernel.org>
Subject: Re: Re: [PATCH] ARM: Fix support for CMDLINE_EXTEND
Message-ID: <Z-qyLY-Moj5Uo8XH@shell.armlinux.org.uk>
References: <Z-aWPqAUOIDEzzpZ@shell.armlinux.org.uk>
 <tencent_F967B6C3FF5405F2D17EF660590BFD213C0A@qq.com>
 <Z-qQuyG7rDeSF_oX@shell.armlinux.org.uk>
 <Z-qZ_4YmTJdFWAHF@shell.armlinux.org.uk>
 <CAJGZr0+zcy+28bJydUo88zpNBN-M2-qcaahr8Pxg=yfdT6RAPg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJGZr0+zcy+28bJydUo88zpNBN-M2-qcaahr8Pxg=yfdT6RAPg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_081821_108240_06A8A3D0 
X-CRM114-Status: UNSURE (   9.80  )
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

On Mon, Mar 31, 2025 at 06:14:27PM +0300, Maxim Uvarov wrote:
> It will be good  to have some constance here with other arches:
> ./arch/arm/kernel/atags_parse.c:#if defined(CONFIG_CMDLINE_EXTEND)
> ./arch/sh/kernel/setup.c:#ifdef CONFIG_CMDLINE_EXTEND
> ./arch/powerpc/kernel/prom_init.c:    if
> (IS_ENABLED(CONFIG_CMDLINE_EXTEND) || l <= 0 || p[0] == '\0')
> ./arch/loongarch/kernel/setup.c:     * CONFIG_CMDLINE_EXTEND is enabled.
> ./arch/loongarch/kernel/setup.c:    if
> (IS_ENABLED(CONFIG_CMDLINE_EXTEND) && CONFIG_CMDLINE[0]) {
> ./arch/riscv/kernel/pi/cmdline_early.c:    if
> (IS_ENABLED(CONFIG_CMDLINE_EXTEND) ||
> 
> Or drop CONFIG_CMDLINE_EXTEND completely or make arm64 work as others.

I'm not changing something that has had 14 years of being the way it's
been - people will have come to rely upon it. Changing it now is way
too late.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

