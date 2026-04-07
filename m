Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430FBFB5183
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 02:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3tzXALW9GZeqyc5QKG35qt3dt3tspf2m/av42ioKsDI=; b=XLh/+GoqygIp437RFsLHplxSui
	ilAO4y1aMUkO8mAi3RI4PbVAzwsX09kcs4jOcYopVq27ybNfUsV1l5+TlK/qrQKTbe+n3X+QEGQao
	VFkjTVBaOWo4PQ+kCE1VH4dFVSjWPOG3aNBRgUQ3o2kUUUPeeYFbG4a/8XkOEUWKdN0ZGimjaMK1Y
	wqzhP2BkUsJMTVcIfSDhIDeFXHRE1PK91eh0kmqOqCmruyZwP1/YPUhsCrpDkW5ye4MrV2ExUjeZc
	+jsqfpOuLIszu1xncAaY07j8ulHutnBiy3No87RTMs8KYalvoK1FafNOm4rsgAhurM9mwxHSsx4Cu
	ZtjnvkHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9vtK-00000005k6z-2UdD;
	Tue, 07 Apr 2026 02:10:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9vtH-00000005k5c-3QF9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 02:10:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7831040B5C;
	Tue,  7 Apr 2026 02:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD7EC2BCAF;
	Tue,  7 Apr 2026 02:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775527807;
	bh=/bV+bTTfPhODyuYodpZsbu0E+ohIbVKUHn1OOkkT/gM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H0kvEK4WdPguBs68FdUXumtOEYMcAARWdKr5U9iHRFFYdhHvbwdHcBhp+l/h6qAuC
	 n/M06MPGTRWbTxt+BiTqZDCiPXOc7l7Gj2QkcFZACW4PuO/SzRqjpHzzjjXeTIS1or
	 Rl8un6WwuDy8hcdeKI9J5bJ8R5vcgKBW7dLgW62MAasDUgxMn3Gamf0OKuHA+/deXe
	 Nyn1dYZgYlrfYEhU3d0X7o/FQ4b9d41mEPJ8ABZKfFHVqOi7Hs7+GcFTLjxy0kBG+t
	 088imVURnvi+0tCIo5SBq3diHslVrb7nqhmsFwmjGfbGQ0h9moqybpKh/HS8two8F8
	 4af+y58m0ms7w==
From: Jakub Kicinski <kuba@kernel.org>
To: jitendra.vegiraju@broadcom.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	netdev@vger.kernel.org,
	alexandre.torgue@foss.st.com,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	bcm-kernel-feedback-list@broadcom.com,
	richardcochran@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	rmk+kernel@armlinux.org.uk,
	rohan.g.thomas@altera.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	bpf@vger.kernel.org,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	sdf@fomichev.me,
	me@ziyao.cc,
	siyanteng@cqsoftware.com.cn,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	weishangjuan@eswincomputing.com,
	wens@kernel.org,
	vladimir.oltean@nxp.com,
	lizhi2@eswincomputing.com,
	boon.khai.ng@altera.com,
	maxime.chevallier@bootlin.com,
	chenchuangyu@xiaomi.com,
	yangtiezhu@loongson.cn,
	ovidiu.panait.rb@renesas.com,
	chenhuacai@kernel.org,
	florian.fainelli@broadcom.com,
	quic_abchauha@quicinc.com
Subject: Re: [PATCH net-next v9 4/4] net: stmmac: Add BCM8958x driver to build system
Date: Mon,  6 Apr 2026 19:10:04 -0700
Message-ID: <20260407021004.3674655-1-kuba@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402213629.1996133-5-jitendra.vegiraju@broadcom.com>
References: <20260402213629.1996133-5-jitendra.vegiraju@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_191008_149997_32CE6458 
X-CRM114-Status: GOOD (  14.22  )
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
---
net: stmmac: Add BCM8958x driver to build system

This commit adds the PCI driver for the Broadcom BCM8958x to the Linux build
system. It enables the configuration option and updates the MAINTAINERS file.

While reviewing this patch, I noticed a potential regression introduced in the
previous patch of the series (net: stmmac: Add PCI glue driver for BCM8958x)
that is enabled here.

The driver defines a global static array of software nodes (brcm_swnodes)
and registers it in brcm_drv_init() using software_node_register_node_group().

Since PCI drivers must support multiple device instances concurrently, what
happens if there are multiple BCM8958x PCI devices present?

If the second instance's probe attempts to register the exact same software
node pointers, software_node_register() will return -EEXIST. The failure
path in software_node_register_node_group() then unconditionally unregisters
all nodes in the group.

Could this unregister the software nodes that the first probed device
successfully registered and is actively using, leaving the first device with
dangling fwnode pointers and leading to a use-after-free? Would it be safer
to dynamically allocate the software nodes per device instance?

[ ... ]

> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> index dc55aec915a27..a1e39f65cd42e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> @@ -51,4 +51,5 @@ obj-$(CONFIG_STMMAC_PCI)	+= stmmac-pci.o
>  obj-$(CONFIG_DWMAC_INTEL)	+= dwmac-intel.o
>  obj-$(CONFIG_DWMAC_LOONGSON)	+= dwmac-loongson.o
>  obj-$(CONFIG_DWMAC_MOTORCOMM)	+= dwmac-motorcomm.o
> +obj-$(CONFIG_DWMAC_BRCM)       += dwmac-brcm.o

This isn't a bug, but it looks like spaces are used here for alignment instead
of a tab. The surrounding entries all use a tab character before the
assignment operator.

