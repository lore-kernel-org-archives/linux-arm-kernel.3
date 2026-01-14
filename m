Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0038D38FEC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 16:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIEb3VZJ0Q8XTGJMW8slr83ViSzmP+lKhSkJV8L8qUI=; b=RTPeksImaZMoEp/UORzjBhFpWC
	0fLft136mqBabaOr0Pitd566Wmt3wVM+nKWOk2GMJ0DQX/OCRHrUWsN5d6SjMrzcnUhRmSYkRetqt
	oiyx8G5W07drFfzRhyqY0RYqtx2jlmPWYsWORYY7x3nUktaTMHQ2vAmXoWQXeZ+P579PxXMjQfJ8z
	CyYXrMOTcvJpKAZalGRJZcs/OF9HtHdfvj3T2et5yH/ojsI4l0r8VCkNz1CCeqFF/m2EdZ5H/Ad2t
	yIncugnmw+07CUNebzIL6/lfnBp0TasZzrt+81D7KAjiqHYKp6fel7a68hyPv10IFRXeP2XdNMU28
	UhVK1HSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg460-00000009zXK-1xft;
	Wed, 14 Jan 2026 16:51:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg45z-00000009zWi-0QlE;
	Wed, 14 Jan 2026 16:51:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8DDB56001A;
	Wed, 14 Jan 2026 16:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB8DC4CEF7;
	Wed, 14 Jan 2026 16:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768409506;
	bh=/tgfdZY8ioB8gIjvJqRjpf9WBA+xTl0wFAFGXzU2Z0s=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ogP5hRl7ZGHyboOHJ4LgSzWMelQsORYeIMLCjQGlLrnC64h7mettLRSmBvMavI+QE
	 36AE4qPgEXG5CWfztYQ6KYDF2p8d8uDcgvR3f8p3RHJ7IKggksgC9PkDMjZ48dlsBJ
	 oDoRmI/u1xJ3u6hdAqcsb6iAUoA8j6L41KOg9kn8m8CL8Kg1aJuzkldi632txUgKzi
	 Hd6UWRc24iw70mELDBw6tOBjVmluOgK+GJNkS1+Xh6zVyjZRV7HvfYCO0vTXFRD3mW
	 5uqzQWm4SeH05zN4XInRHpmDYxXOIUCrqsKVJYE52dliVS/nDtmGS7QJLg1JEO4zvR
	 74Lrsr5Ra8XNA==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rafael Beims <rafael@beims.me>
Cc: linux-phy@lists.infradead.org, imx@lists.linux.dev, 
 Rafael Beims <rafael.beims@toradex.com>, 
 Sahaj Sarup <sahaj.sarup@linaro.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20251223150254.1075221-1-rafael@beims.me>
References: <20251223150254.1075221-1-rafael@beims.me>
Subject: Re: [PATCH] phy: freescale: imx8m-pcie: assert phy reset during
 power on
Message-Id: <176840950251.979468.11893376937726009802.b4-ty@kernel.org>
Date: Wed, 14 Jan 2026 22:21:42 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Tue, 23 Dec 2025 12:02:54 -0300, Rafael Beims wrote:
> After U-Boot initializes PCIe with "pcie enum", Linux fails to detect
> an NVMe disk on some boot cycles with:
> 
>   phy phy-32f00000.pcie-phy.0: phy poweron failed --> -110
> 
> Discussion with NXP identified that the iMX8MP PCIe PHY PLL may fail to
> lock when re-initialized without a reset cycle [1].
> 
> [...]

Applied, thanks!

[1/1] phy: freescale: imx8m-pcie: assert phy reset during power on
      commit: f2ec4723defbc66a50e0abafa830ae9f8bceb0d7

Best regards,
-- 
~Vinod



