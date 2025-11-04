Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33835CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 17:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hoI9ateY+vDA+1EtryjWUfajW0+PdqAMdZ9UNQZIHKw=; b=0QIRbYaohTMstH7DkRDG4LYRzr
	8dhJ5g4Cs3XC4PnjINu/plHbLsViQ/Fyz3BVCrtOrYi+6DLMNJJXalYUrwhfd1XVRNaLZ+5bJsIXl
	1+Xh1q4nAS+Esljt4m3O/PiRA5iyaBzDE2KCkd1fLjiYZPNkZwNVTNxRyoFzbTR/mgO3jrusOuZke
	1UDXZuEcRqRkZoItbWJhks9zrTkY2Jzt2MrGffuHOa1FlcN81a7VYn47L5qtLVY8X/crc2Lx+aLUT
	sKeqCvPymxUzsI/4TbMlJS9QgZ7v1lzfgosalFcPERtTbK/pmz0ORXU2iei4VaH6NkZJpbkFKN/XE
	RS0AOJng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGL8H-0000000CIe9-3LLH;
	Tue, 04 Nov 2025 17:47:50 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGL8F-0000000CIXr-0l9d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 17:47:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1762278323; x=1762883123; i=wahrenst@gmx.net;
	bh=hoI9ateY+vDA+1EtryjWUfajW0+PdqAMdZ9UNQZIHKw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Dyj26viX0XVLthFxZYiCNIEVuynLerdJ8SBUZnqOxfiHf21jBLWIWg52kEjVVnTG
	 H6GL7a84k7iX5O1kZh5MbfUDKFHSFOEJvoZbMJC4m+4iFEQdq5sxWNFQJsbTzf2fz
	 UfmvnxTMzNaq05C17uoM4OoJkOtCDRgxyfDl503tUR0i6A6jWwVLEyq7Sm2ionYht
	 vwKpUCPYP3auez/f/wqDwhAO9pdEKi24py+RRCymMbmtC/nncJOhn1dgUm+9H/IPc
	 ivYy+xyzZnt28ro+OAjzScDrJZerIvBGVmqTobJmpvV3CEoGWxzMLwWWwvIG+C3HS
	 F7SKn3Ho/cwsfPumcw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from schenker ([91.41.217.223]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6DWs-1vIVsx1URU-00D3lw; Tue, 04
 Nov 2025 18:45:23 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	kernel-dev@igalia.com,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH] arm64: defconfig: Fix V3D deferred probe timeout
Date: Tue,  4 Nov 2025 18:45:18 +0100
Message-ID: <20251104174518.11783-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:WJ0QuRK/nd0ey7JH5ZrefPVq5Lr2KWaty49V2rpHcHM4d/uNL4l
 dHZirF+xZItdGEzoIVVYb5n9ds0HzCpHwzlAH5z2pU27rNQZ5iTvzQBZ2TSoXDvP6MmP0tJ
 3JFnREXwRENyG1cy1A71Bu34H6sRYWd8RvYaGfCOBUPcSoY2qKgab9JXDv2xGsAohtpxN4v
 6t03/BoxJkLRByCLcP9kA==
UI-OutboundReport: notjunk:1;M01:P0:G1QaQ/1llPc=;KDxoEsTp4Nxu9NC/hmfwGoWIbFc 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 EoM/5w5gAVjzAFfHFPzUc73H4o=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_094747_575424_E5637E7B 
X-CRM114-Status: GOOD (  13.26  )
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

The commit 4adc20ba95d4 ("ARM: dts: broadcom: rpi: Switch to V3D firmware
clock") causes a regression in arm64 developer setups, which stores the
kernel modules via NFS. Before this change the involved V3D clock provider
was builtin, but after this DT change the clk-raspberrypi is responsible
for V3D and for arm64/defconfig this driver is build as a kernel module.
In case these kernel modules are provided via NFS this takes too long and
the PM domain core give up before the clock driver could be loaded:

  v3d fec00000.gpu: deferred probe timeout, ignoring dependency

So resolve this issue by making this critical driver builtin.

Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://lore.kernel.org/linux-arm-kernel/9ebda74e-e700-4fbe-bca5-3=
82f92417a9c@sirena.org.uk/
Fixes: 4adc20ba95d4 ("ARM: dts: broadcom: rpi: Switch to V3D firmware cloc=
k")
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
=2D--
 arch/arm64/configs/defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e3a2d37bd104..1a48faad2473 100644
=2D-- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1341,7 +1341,7 @@ CONFIG_COMMON_CLK_RS9_PCIE=3Dy
 CONFIG_COMMON_CLK_VC3=3Dy
 CONFIG_COMMON_CLK_VC5=3Dy
 CONFIG_COMMON_CLK_BD718XX=3Dm
-CONFIG_CLK_RASPBERRYPI=3Dm
+CONFIG_CLK_RASPBERRYPI=3Dy
 CONFIG_CLK_IMX8MM=3Dy
 CONFIG_CLK_IMX8MN=3Dy
 CONFIG_CLK_IMX8MP=3Dy
=2D-=20
2.43.0


