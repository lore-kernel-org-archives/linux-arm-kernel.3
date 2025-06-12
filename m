Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459FDC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u8sH7XD1bhCLGd8b7/m3tBTWjLXZyQ6KFK5HQTRnKzs=; b=suKojiFF2Cv3Do
	FwtMy1wALnK/PeT73ESGoDidupeqdIikyZGFyR4dcHfIke8kTGLfnG610bWL8rnEPj2w3wRRHgx/s
	VWp7Y1fwweHJ8NmdU//iS1GKG7cb3cfQPqvtg5qy0DKq7yia+wU/vHPTWesTXA4AlJphR/lrDMmKr
	cCLEVDCzXyY4o75SNBRewy5UMEfsbvTjSfsBI/C/EUtp/AJKtmBrU23EeB8yQQy5R0q9+fgKujJjt
	hDUhdLVaqaqVmzFbe7eleSBphQMkwfxfvrvpXyS1r0y3TXHjaMwhEuJwpPdQVilNm8IFE2KUwe7JO
	n7gAc98+2GTFxila1wRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPox3-0000000EYfm-3wLL;
	Thu, 12 Jun 2025 20:55:09 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPjmc-0000000DmEi-14T2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 15:24:03 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D0EDA25C00;
	Thu, 12 Jun 2025 17:24:00 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rzejOIWm-WrY; Thu, 12 Jun 2025 17:23:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749741839; bh=e2L+AV00TtnXw1GDXliijhYZY+VMGmWnxJeetHc99Lw=;
	h=From:Subject:Date:To:Cc;
	b=JoPZTG1K6VC45U7XtfBY06ap5s93Rik5lgGujH2W+JLf3pxrnEtJV/eH/p1ys7uG/
	 VyX6XBI4ef8t6H7fKaKACPhJpSXegVdZhYvqq+Rj1c1025y4n7efdT+oOpJjvgllun
	 uVyl3u911sKoWhpI7iRr8ShukuAUXK7BsU8jpZEqSY/2Z128kV4+REgD/9fpL4Ainw
	 WeicsoCcSLJ7MlTC3lIjhmBzHJklyBO9j70uPL8W0fso5rxLJPwv+dl/xkln3rot8c
	 ULI2Y5Hc/O1lPIl+MXuvPrvkDH0Rw+/AMGAJkEJaaIIlRuESLAiubQG2gCLPtn/1Dw
	 jNMGBjgTqUXlQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/5] Support for Exynos7870's display stack (DECON,
 MIPIPHY, DSIM, etc.)
Date: Thu, 12 Jun 2025 20:53:36 +0530
Message-Id: <20250612-exynos7870-drm-dts-v1-0-88c0779af6cb@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPjwSmgC/x3MTQ5AMBBA4avIrE1SFSmuIhb9GcxCSUeEiLtrL
 L/Few8IJSaBvngg0cnCW8yoygL8YuNMyCEbtNKNanSNdN1xE9MahSGtGA7B1nhvnakrZzvI4Z5
 o4uufDuP7fl9vAzZkAAAA
X-Change-ID: 20250523-exynos7870-drm-dts-87ccab731ba9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749741830; l=2522;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=e2L+AV00TtnXw1GDXliijhYZY+VMGmWnxJeetHc99Lw=;
 b=IvYVO6KFyABl3lbASbgkJhmTWfjQJX6zHF9WbeGzXKnrcA7VcRJxNE9s4peKlOdsfTDZmTNUH
 c36YxJ2VAD9Dnup2Mr4nBiKF+6E+kPQClh8o/Z42pDKgHfSiBS9zGVd
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_082402_429675_9CFBA659 
X-CRM114-Status: UNSURE (   8.47  )
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

Exynos7870 has a IP subsystem in its architecture dedicated to display
management. Notably, this block includes the Display Enhancement
Controller (DECON), and the DSI Master (DSIM).

The following series and its sub-series implement all components for a
functioning display pipeline. All vital information which helped shaping
up the patches have been retrieved from Exynos7870 vendor kernel sources
as provided by Samsung.

Testing has been done on all three devices available upstream, i.e.
Samsung Galaxy J7 Prime (samsung-on7xelte), Samsung Galaxy A2 Core
(samsung-a2corelte), and Samsung Galaxy J6 (samsung-j6lte). Regrettably,
I've only been able to test the functionality on video mode, as none of
the devices have panels working in command mode.

This series implements changes in the SoC subsystem, which includes
devicetree additions. It depends on all sub-series listed below:
(Legend: [R]eviewed, [A]ccepted)

exynosdrm-decon            - https://lore.kernel.org/r/20250612-exynosdrm-decon-v2-0-d6c1d21c8057@disroot.org
exynos7870-mipi-phy        - https://lore.kernel.org/r/20250612-exynos7870-mipi-phy-v1-0-3fff0b62d9d3@disroot.org
exynos7870-dsim            - https://lore.kernel.org/r/20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org
panel-samsung-s6e8aa5x01   - https://lore.kernel.org/r/20250612-panel-synaptics-tddi-v1-0-dfb8a425f76c@disroot.org
panel-synaptics-tddi       - https://lore.kernel.org/r/20250612-panel-samsung-s6e8aa5x01-v1-0-06dcba071ea6@disroot.org

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (5):
      dt-bindings: samsung: exynos-sysreg: add exynos7870 sysregs
      arch: arm64: dts: exynos7870: add DSI support
      arch: arm64: dts: exynos7870-on7xelte: enable display panel support
      arch: arm64: dts: exynos7870-a2corelte: enable display panel support
      arch: arm64: dts: exynos7870-j6lte: enable display panel support

 .../soc/samsung/samsung,exynos-sysreg.yaml         |  6 ++
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts | 41 ++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    | 38 +++++++++
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts | 40 +++++++++
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         | 94 ++++++++++++++++++++++
 5 files changed, 219 insertions(+)
---
base-commit: 0bb71d301869446810a0b13d3da290bd455d7c78
change-id: 20250523-exynos7870-drm-dts-87ccab731ba9

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


