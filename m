Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFFFC44515
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 20:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Message-Id:MIME-Version:Subject:Date:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Is7QXRJ9Lqxz/W/+MXTuCWFGjk5bJ6zhQmYPGnfDWvM=; b=f/pFXDZOm4wuarOKAdwTAQ1dk1
	DuieAfOHnhQYjFy5sZtv8729jXBO6WKb2gV3ywmxDR3XfGtGLWOawyJAeuEpFpv4buMYOTgc6LkD4
	joXERz3RCTaQML80rGCojygtVR3vzgayQYpuF845aoQJLMtJGKG+ejcg5Qf5B3TiptclKuznMp/Zk
	khxieraMhroMaP1nvujz5Zhubv2Gq8hvI2ysNWAaL7JnxGQ+6i8W0JegksbyBPB0GxleBm2Q9NpyT
	AF75ktWa8K42Wg/zdJ1Jy7ypcHeX98ULTxGlUuMIeVYcRRYbnbEp+Lw7qxju/h27wXZtyNOTFSayR
	PkuhVvSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkpJs-00000003Cz7-3sSZ;
	Fri, 17 Jul 2026 20:38:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkpJp-00000003Cyc-1QW0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 20:38:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784320679;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Is7QXRJ9Lqxz/W/+MXTuCWFGjk5bJ6zhQmYPGnfDWvM=;
	b=Xyopzxrd1/r069Qrdox2NoFqySQ4UjE6AwEWcQ9FDRieWlHHA5T0pSTcjgVwTX8N74yi2e
	HLiB1fiGRgnImnuVOo9ToBx10P9IKGqZtSChbBv8CNLGv2pIcDu/GMr+5uV++n0STo9b3D
	zWC0TjtJLw85/BZbW7zk+QoooQ8tlgs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-bhByMF7QMsGNHxn20kfXGg-1; Fri, 17 Jul 2026 16:35:18 -0400
X-MC-Unique: bhByMF7QMsGNHxn20kfXGg-1
X-Mimecast-MFC-AGG-ID: bhByMF7QMsGNHxn20kfXGg_1784320518
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e56b2b350so1747479785a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 13:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784320518; x=1784925318;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Is7QXRJ9Lqxz/W/+MXTuCWFGjk5bJ6zhQmYPGnfDWvM=;
        b=IoaWr0M299Gcl15fO4xRf8SsCLbPhCym7oJCHtwLJFiTrTl9INKBc56C5Gav59jS24
         Vd1lbjR70mKm8UjNz8aea61wr79ds2XF2bfrFEltTQQ94r1FcQFk1nP/BeLDlab2VFCA
         /UOoG4NjKmO5sANenxtiWW3H2xHn0k60xV20oU1XN+qDNtlnyZhj1FZqE4RdDny/cRWF
         KvxE7wcTzJ6jr5eIRroCCzOqHgYSR5sVylRoRjd+dZVeioI5Ix8JCSg0j0ReWfnBPaX+
         P9uPBWDZOVW/IbYQ0wA5r26tliyEuIYt7SxAEluhDI7LlnIzbKsP7jZyQ2mHbwyudP1j
         JFoA==
X-Gm-Message-State: AOJu0YzmfAoUnDA56ltPfoasOS6yWZX8HPJRB+Li30Dym7zTRgu6AT7y
	9kopd4HnlsURT+v5+OqAhRrBYy+enBnap5NlBkl2hjSuN5uaXE0zGig/r2IQRtJhfeUBL8n3SrE
	PaqYhNB2FTgLJ68k8FLx+i6i8DZNCyDMvoWKKcbX0V8qIXRzVEBDKuoxJAx8zW6YHaBivDO1jld
	a8
X-Gm-Gg: AfdE7cnYPxdTqmOK1ltYmecOUilvBGQs0eLdoLrcLR5IhhoKPk6Jrr8d2fj9gRHMB5T
	HrP9F/Xzuuh5NSWvEua40hBVcCPTxMbGXB8uKuPYTr7oQLfwV06sb5ByLOYF6FodURMGf/Xex1B
	pQnjgWoZTO9YOgSFwDvE2m4nbQxlUJvTkvaVHbnnhMDndZRp17biQFWIBx1o4sV3tr3A1hyHS9q
	uZnW5JaMiYafFvCP58s/ILqvyfTYJjO30llW1jO/0sg+1aI7vYGxeuMeb3ycotPi8cV55ktoj+S
	CPsvrmU/1UOWYPfCt6ZYjJl00n65H5UPdURDrUSXpjb1KwPwsA3BKqA6i/s9oKw/ikyfKt302nV
	qNqokf5PkCQtbb3z08DQTKHFTM+P3xLxb
X-Received: by 2002:a05:620a:8807:b0:92e:7d1f:d3aa with SMTP id af79cd13be357-930b3f45332mr464674885a.31.1784320517660;
        Fri, 17 Jul 2026 13:35:17 -0700 (PDT)
X-Received: by 2002:a05:620a:8807:b0:92e:7d1f:d3aa with SMTP id af79cd13be357-930b3f45332mr464671285a.31.1784320517096;
        Fri, 17 Jul 2026 13:35:17 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4480:2110:932e:45ef:6b6c:ddd0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b545e253sm232859985a.36.2026.07.17.13.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:35:15 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
Date: Fri, 17 Jul 2026 13:33:56 -0700
Subject: [PATCH v7] arm64: dts: s32g: Add GPR syscon region
MIME-Version: 1.0
Message-Id: <20260717-upstream-s32g-gpr-syscon-v7-1-ee198f287682@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQ6DMAxA0asgz1iiARLKVVAHBE7wQIjsFhUh7
 k7E+Ib/T1ASJoW+OEFoZ+UtZriygGkZYyDkORtMZWzlXg5/Sb9C44pam4AhCeqh0xbRtf5trO9
 sNzeQ8yTk+f+sh8913XcTkxpqAAAA
X-Change-ID: 20260717-upstream-s32g-gpr-syscon-75f926f868d4
To: Chester Lin <chester62515@gmail.com>, 
 Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dan Carpenter <error27@gmail.com>, Jared Kangas <jkangas@redhat.com>, 
 Dan Carpenter <error27@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784320513; l=2673;
 i=jkangas@redhat.com; s=20251111; h=from:subject:message-id;
 bh=Su44JoHUNIT+NILqohVHQyIxNtJALtkgLhgf6U3PzRs=;
 b=yu/MhwLbciKwwtbena2H4ob80CIrdSVWImmgvPDfdQYil0HgnUhDWGX8kWATuLCNUqkPL5X2N
 wWNF+/HbdMLDhuEOGC3Q65MuEZGnrTmnS9P3sZgL8Fmho2Q0bTXkoZZ
X-Developer-Key: i=jkangas@redhat.com; a=ed25519;
 pk=eFM2Mqcfarb4qox390655bUATO0fG9gwgaw7kGmOEZQ=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: D42jyiOnzEE_9RXX0VuWXXr-4qmVhIo2KA8VDTsk_es_1784320518
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_133801_466329_A62573FF 
X-CRM114-Status: UNSURE (   9.74  )
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

From: Dan Carpenter <error27@gmail.com>

Add the GPR syscon region for the s32 chipset.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
[jkangas@redhat.com: GPR syscon resized from 0x3000 to 0x100]
Tested-by: Jared Kangas <jkangas@redhat.com>
Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
Revision of Dan's v6 patch based on discussion in [1] to avoid a panic
when reading the debugfs regmap's registers file.

[1]: https://lore.kernel.org/all/aej2X2Gp-UI3Vmvo@rh-jkangas-kernel/

v7: Shrink gpr size from 0x3000 -> 0x100, add 'arm64:' prefix to subject
v6: no change
v5: no change
v4: no change
v3: no change
v2: Remove #address-cells and #size-cells
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 6 ++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 809019ea0e299..81280ec6b07a9 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -325,6 +325,11 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		gpr: syscon@4007c000 {
+			compatible = "nxp,s32g2-gpr", "syscon";
+			reg = <0x4007c000 0x100>;
+		};
+
 		ocotp: nvmem@400a4000 {
 			compatible = "nxp,s32g2-ocotp";
 			reg = <0x400a4000 0x400>;
@@ -795,6 +800,7 @@ gmac0: ethernet@4033c000 {
 			compatible = "nxp,s32g2-dwmac";
 			reg = <0x4033c000 0x2000>, /* gmac IP */
 			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
+			nxp,phy-sel = <&gpr 0x4>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 22e80fc03f9c7..da35083a5e0e5 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -383,6 +383,11 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		gpr: syscon@4007c000 {
+			compatible = "nxp,s32g3-gpr", "syscon";
+			reg = <0x4007c000 0x100>;
+		};
+
 		ocotp: nvmem@400a4000 {
 			compatible = "nxp,s32g3-ocotp", "nxp,s32g2-ocotp";
 			reg = <0x400a4000 0x400>;
@@ -874,6 +879,7 @@ gmac0: ethernet@4033c000 {
 			compatible = "nxp,s32g2-dwmac";
 			reg = <0x4033c000 0x2000>, /* gmac IP */
 			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
+			nxp,phy-sel = <&gpr 0x4>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";

---
base-commit: fce2dfa773ced15f27dd27cd0b482a7473cdcf2a
change-id: 20260717-upstream-s32g-gpr-syscon-75f926f868d4

Best regards,
-- 
Jared Kangas <jkangas@redhat.com>


