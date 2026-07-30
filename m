Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CA2C54FDF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 08:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GFIwwv1ZKlwIh2R3SG739aEFifVFKq7ZdG19KNvDtIc=; b=gwSKWDtDGsT7j6EUArbCeKKaDY
	oAd6mRfZd9LFVEfBAGKxjA9vchPZyGX50/EhVqubG3Dp+8Z0EsJN52J94uz0eArRSgTp7S69I0Tmw
	miz0NbjVIOt44U7Wid1acDOpOzArR9TbYl1ck7+4ItmzBxpXtnZgUksZRaVS7FAnZoqJd5d09Hpp3
	sNFUKCCTF7izB/WxqltnZLO/IkQZ2vRMRvQ0jG87rrLt8bbGNn8e2D+bZiaf+mRij9+wz8VY4F5u5
	rfqqBIJyxbgEnHax6zpsFpyyeDSWTSxZmF0Oc3SnZmmeQgyVBd5PMhbf8EVyfEs30Q0ExE8ypHddO
	sQGi8OOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpLlI-00000009nR2-1vrM;
	Thu, 30 Jul 2026 08:05:04 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpLlE-00000009nOH-0p1h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 08:05:02 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-47f752b3423so1114131f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 01:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785398697; x=1786003497; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GFIwwv1ZKlwIh2R3SG739aEFifVFKq7ZdG19KNvDtIc=;
        b=AY/VBU9Jpzp4JDZL/K8dsHIdqSt+nztYk0oryaosD0Bzb/NTNAX0+VZTqFkJZfdSib
         060SNTw45dISRgbkNOo2nh5IaWoFO/pY667YsiiRdeFpLbY5r5Jk/X2d55uRD3oj1iFo
         CM5A2xhpnKkm7BMhTmCBc+TDxGohWbgt9sZuEqdBs+WdbVoJZq085oMbdFjFMTz5LWlO
         eI1oRYwySwO5JJvR6vmvWouFk0iGlSCODgUEN9ru/x64alJ6ApOJFO3TAliZFJ9E8lKj
         rIfaCR2TZ4Fl89tv/xdxzQLPsZvFHPU1iqsR65gwPrBFW8H2dOM8nJN/2OBvPLXeCI2m
         L/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785398697; x=1786003497;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GFIwwv1ZKlwIh2R3SG739aEFifVFKq7ZdG19KNvDtIc=;
        b=WxDG3KHVlk9BqPlctexaGI9GeIssfzPkwqzBYZDOwhsrLaHSBs+FBeG47HKECF4f/C
         Ps3q6q7l7qpDh7k4Z6+xoDSKJPBg0QMv4YN9l7fkUesDgcU0hbihYTcqNSQIIjMrCcQX
         sRyMGfw2nKQGPvS8CblxwSO3O1GOTR4mdR+GSGC9EadGPXbW8mEbc1Zu5pQ4Brm09lEp
         bEWJYXdvK7LTujzrM0ESDDbDDxXCvyAI7zdBjxFAzJL6wUJHGZFhlnvnu9KegHYddkXB
         IuT3rc+BJCyVxJjCGE/Ru9RaSgEBFEeAktkuIFGLlWvxuERow1gFIt3KYiqgpzk7IGEr
         +ngg==
X-Forwarded-Encrypted: i=1; AHgh+RodxuS9taTOhCOYyqCa81YiQUDqG3eqsR/+wkGZw2xWdg66iHvai8MDtZdV8yTRZmie4/if/8RF85imN0WyVlgB@lists.infradead.org
X-Gm-Message-State: AOJu0YzoMaH9GqUGdSBmx9FK6hPBOE1rxD5bRS2X522Qs0xqlDIcCMSd
	m/acdnR6E9V+nGDT+/bmMuUfdPJGOvqSiCRRktjHDXt0fLcgCdiblzNys0BUt4BaPrM=
X-Gm-Gg: AR+sD12uzqx9aUqJORoZBmcs4+7iAObok7P0ZKD/N+yE+qnEZKTQJ0Fp/BCp6YEZUQe
	WRsqQo50HHSed0lTnpC1k/PAmDbRfZPLk7F8mM/PHRKlsTAw3D0zzM6YNH3f9Q3oCIcK6igfO1C
	T3Uk4+094/sQLsUXf2owMEoUZYEacXbZcbY8Hj5UY3Vu8+hPjfrydRi3DgHSsw6AOiDaAPYlMuQ
	ainVm4U7W0AbOx2/gojQS1NM8zMBXTXQvw7NSOHNRWK5FtSlWg3AMKwiMqZUi3G6TuEAYg+tJ+0
	xcmk26JG0NAhGMp4ifgP3h5G/fT8+kMPgYweknMXOi4IW6N/MM/Qbx7egoYx+K5/zjiE6aeTUmG
	6toBmdhlv/W1KLOOjzH1nipLp6TnrxgAOtO6ER3ztyFbdd0gQgE4Gyikss79Dcf2FE3X1drgfgk
	cmpvrzjFLt3yWJY6UW7TGLujpH1rrGt/+N+kwLH6oYrzOrmhYRJNw/6cOFvMZJjCUeaWZ/ERTCE
	SsztDYVYJe59uiyPL2/VarJII8mxfBDakKXSyM+WicR8xfgZ+ArKmqWprU=
X-Received: by 2002:a05:6000:400b:b0:47f:8465:2712 with SMTP id ffacd0b85a97d-47fc8213000mr2091889f8f.56.1785398697420;
        Thu, 30 Jul 2026 01:04:57 -0700 (PDT)
Received: from [127.0.0.1] (host-212-171-227-71.pool212171.interbusiness.it. [212.171.227.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc877dafasm3797373f8f.0.2026.07.30.01.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 01:04:56 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 30 Jul 2026 10:04:41 +0200
Subject: [PATCH v2] arm64: dts: mediatek: mt8390-genio-common: add boot
 phase tags
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-ccaione-upstream-mt8390-bootph-v2-1-82f67feadf7a@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OQQ6CMBBFr0K6dgwdK1BX3sOwaMsgNUJJW4iEc
 HcLXsDlS17++ysL5C0FdstW5mm2wbohAZ4yZjo1PAlsk5hhjkVeIgdjVFIIpjFET6qHPlYXmYN
 2Lo4dkCoVCiFQomFpZPTU2s8ReNQ/DpN+kYn76m50NkTnl+PBzHfv79jMgcO1EMhl1cpSNnetl
 rfVns7G9azetu0L93RbKeEAAAA=
X-Change-ID: 20260721-ccaione-upstream-mt8390-bootph-ea7a2444292c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>, 
 Julien Stephan <jstephan@baylibre.com>, Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_010500_273879_21CFB044 
X-CRM114-Status: GOOD (  12.64  )
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

U-Boot SPL runs after the platform DDR loader has initialized DRAM on
the Genio 510 and Genio 700 EVKs. It needs the debug UART and eMMC
controller, together with their clock, syscon, pinctrl, interrupt and
watchdog providers, to load the firmware FIT.

Mark the nodes consumed by the current SPL configuration with
'bootph-pre-ram' so that the canonical devicetree carries the boot-phase
information and bootloaders do not need local overrides.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
Add the boot-phase annotations needed by U-Boot SPL on the MediaTek
Genio 510 and Genio 700 EVKs. Both boards use the same pre-RAM device
dependency chain, so keep the annotations in their shared
mt8390-genio-common.dtsi.
---
Changes in v2:
- Move the tags from the Genio 700 board DTS to
  mt8390-genio-common.dtsi so they are shared with Genio 510.
- Update the subject and description to cover both EVKs.
- Link to v1: https://patch.msgid.link/20260721-ccaione-upstream-mt8390-bootph-v1-1-5642198f979d@baylibre.com
---
 .../boot/dts/mediatek/mt8390-genio-common.dtsi     | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index b0c97930a0e6..6172160ea9f5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -20,6 +20,10 @@
 #include <dt-bindings/usb/pd.h>
 
 / {
+	memory@40000000 {
+		bootph-pre-ram;
+	};
+
 	aliases {
 		dsi0 = &disp_dsi0;
 		ethernet0 = &eth;
@@ -1586,3 +1590,83 @@ &xhci2 {
 	vbus-supply = <&sdio_fixed_3v3>; /* wifi_3v3 */
 	status = "okay";
 };
+
+&apmixedsys {
+	bootph-pre-ram;
+};
+
+&clk26m {
+	bootph-pre-ram;
+};
+
+&gic {
+	bootph-pre-ram;
+};
+
+&infracfg_ao {
+	bootph-pre-ram;
+};
+
+&mmc0 {
+	bootph-pre-ram;
+};
+
+&mmc0_default_pins {
+	bootph-pre-ram;
+
+	pins-clk {
+		bootph-pre-ram;
+	};
+
+	pins-cmd-dat {
+		bootph-pre-ram;
+	};
+
+	pins-rst {
+		bootph-pre-ram;
+	};
+};
+
+&mmc0_uhs_pins {
+	bootph-pre-ram;
+
+	pins-clk {
+		bootph-pre-ram;
+	};
+
+	pins-cmd-dat {
+		bootph-pre-ram;
+	};
+
+	pins-ds {
+		bootph-pre-ram;
+	};
+
+	pins-rst {
+		bootph-pre-ram;
+	};
+};
+
+&pio {
+	bootph-pre-ram;
+};
+
+&topckgen {
+	bootph-pre-ram;
+};
+
+&uart0 {
+	bootph-pre-ram;
+};
+
+&uart0_pins {
+	bootph-pre-ram;
+
+	pins {
+		bootph-pre-ram;
+	};
+};
+
+&watchdog {
+	bootph-pre-ram;
+};

---
base-commit: 11028ab62899e4191e074ee364c712b77823a9c4
change-id: 20260721-ccaione-upstream-mt8390-bootph-ea7a2444292c

Best regards,
--  
Carlo Caione <ccaione@baylibre.com>


