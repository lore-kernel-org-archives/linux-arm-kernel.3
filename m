Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F0EC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VdmQiv6cMD0TtqYMo1t5mZtX9ofrz+6RM04gqc41y1M=; b=rVieyMyhTuDigxRVlJcKxCNgqu
	gitWbiiPIhlEUZ9oPv4geJKTjtXzRFDdGuKIoQKKtS1h/7as1mkQsc+rYFondpsJOG6XOcwoVbvk3
	t5WKMvc41O7zYFCEqT9sk5XgrBT2I3CwoFBbyo3Rvbxo77zSmamHsX9nZhN1Aq6SgroEHPZsLUd/q
	WllXSqHQAeLVTTYMYwqO5TfEG1VZzQymQ99LvTfpyV2wbk0l+MGooJHYda5T351QuZWNOfR36IzRi
	/Qs1y3Y3p8A8p523yphIUSAXbXYa35zHqPj+aWU1y8B7rerAtliDw9F/R78GbOQw5+RN1UT02KaWv
	cl/Nd26w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloIb-0000000Amxm-2QwJ;
	Tue, 12 Aug 2025 12:40:17 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ull7U-0000000ALlK-2g0R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 09:16:37 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-615398dc162so8206579a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 02:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1754990195; x=1755594995; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VdmQiv6cMD0TtqYMo1t5mZtX9ofrz+6RM04gqc41y1M=;
        b=PdvMPKx8CdQ4RHrX3RdNjUWR8ATNB63otkGLnmMGAqx++HyhHPasvUSVeA4Y38tpxQ
         0//jUkzp3FkujhWqMnhY2iD5tJZgdivRP6mNp1jTe50QWt912Reieo6heSpFAm/rJuqx
         ata62EIP2hbhq/H4RrN+Owel+j4S59AXB/C4Xu27sUcM2me8LA9ObA4B94wJjHA48cRy
         KqfCjZblB54velU+/yqnPkkkfefwdBCsYt8CkgiTPmMKbW6zwN3PjjCRkLMmX1ZqpUJ5
         DZP4YYuK5yQHk259AjeEaAMlVgdfpG40N14tn0ryJOrc6Sbc+UFYfT27wwuObBtlJtu7
         6PIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990195; x=1755594995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdmQiv6cMD0TtqYMo1t5mZtX9ofrz+6RM04gqc41y1M=;
        b=GDwwoGaI4PaM7nzeyCzAQ6QOizdfg2se5xY3aVUWgNIFWxJyFyy6rWoTPfe5ilOQ0I
         r+fU78m31CJGJ1lwEbD/gBrHyfbPP2FZmkSOavOzSn8wvSrk7EkK6KnheFJG+JJT2pk+
         5sTz77gKhMFk8GNH+5PVr6lp13zOc4hgDiU+5SHkdWR/HvcAWLz3+61jRZ1mNQl780mW
         iIEUvCagXOKsUn+MMTxklpWw5EkWzF3FYTEReVeZW4c6zPliqD7uMfsyiOY/7DUJHOrC
         nRx0ThnySlDAaXoqi9kk5fy5GmKmcvWUySKGz7Vqu/6GjW21z4+TFbXP+BEWalIMeNmD
         G33Q==
X-Gm-Message-State: AOJu0YxBWO1i7Gb9SdgfJ0nncNhEys9+pxz5Zh+tnDkpifPf9GtG9icR
	ANdxAf8SrSCwOGRD6wC/S6OvQDYvTas7KLVYL99OEMrmgGo5W/CTPoMUW4mAuPE+PjE=
X-Gm-Gg: ASbGncvxYsUBgNdUnhXk/tZM7o8NIBmm2jm0kAvo9a4ntcqAIrrVNhg8WCNqqYpByka
	OjwUOmXjoUqd64Nr7ydHqceZFYZGPngmv7V0OtR2TS7FAt4HqBA9Gf5VdJOwTagAiUXe45IlVPE
	44NEwBadARtoO4Rjp2DmYMhT+jsbl0Bzy8mbMee+MFuls5FJ4505w0bMwFbp2N8nsx03Xl8CkrH
	e4c9/qSICFvwz/BgHMFsgVlaPEaU54tawmgoIOWHUdK6lV0px0BlaCfMyDyDCw5i+gvL2eRP+eh
	4eE03DtAl4XZDmLNiw2JKJA7YNE2Q4TokdFDPlWW1ZM6Oc0F6b+dGkEup6RpUFr+oVB1VRzEAo3
	7eCiWnOwx80LCq0ukAg==
X-Google-Smtp-Source: AGHT+IE/lSF9QPDKTg/7UPE6qm2SbqVvO5lbJE13BB6VOVUHEyhjrw4Mzk8zczsxQOEGqPcBNfspwQ==
X-Received: by 2002:a17:907:3f1b:b0:af9:a162:7fa8 with SMTP id a640c23a62f3a-afa1e1ecbfdmr208931866b.50.1754990195168;
        Tue, 12 Aug 2025 02:16:35 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8691:4b7a:7bbd:bac:c56e])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-af91a21c050sm2165345766b.104.2025.08.12.02.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 02:16:34 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Tue, 12 Aug 2025 11:15:23 +0200
Subject: [PATCH v2 4/7] arm64: dts: ti: k3-am62p: Define possible system
 states
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-topic-am62-dt-partialio-v6-15-v2-4-25352364a0ac@baylibre.com>
References: <20250812-topic-am62-dt-partialio-v6-15-v2-0-25352364a0ac@baylibre.com>
In-Reply-To: <20250812-topic-am62-dt-partialio-v6-15-v2-0-25352364a0ac@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, 
 Kevin Hilman <khilman@baylibre.com>, Dhruva Gole <d-gole@ti.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1345; i=msp@baylibre.com;
 h=from:subject:message-id; bh=NQ0W2prGrb5FYMdevsZCsW42+VX/kA5sT9snVK2MjKU=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhozZbBGH7aZ+3HMy4fTC1QZs0a7zvAOTbBbMWPyrsHo35
 022eWeXdpSyMIhxMciKKbJ0Joam/ZffeSx50bLNMHNYmUCGMHBxCsBEQqUYGT6yvOwR/tv32ino
 n9IX9b7Y6zeD6mZNnBIcFMu3pcnAv5nhF/PNgJVtwQ98JB63R2gLPpW6s2LBz09Mu+2rw9PYN09
 OYgQA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_021636_683875_18D79A87 
X-CRM114-Status: GOOD (  10.23  )
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

Add the system states that are available on am62p SoCs.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p.dtsi b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
index 75a15c368c11b068430362fe0b8d2d9ecc052588..c69e16f16c835489f2bc5cba158235ab955347e3 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p.dtsi
@@ -44,6 +44,33 @@ pmu: pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	system-idle-states {
+		system_partial_io: system-partial-io {
+			compatible = "system-idle-state";
+			idle-state-name = "off-wake";
+		};
+
+		system_io_ddr: system-io-ddr {
+			compatible = "system-idle-state";
+			idle-state-name = "mem-deep";
+		};
+
+		system_deep_sleep: system-deep-sleep {
+			compatible = "system-idle-state";
+			idle-state-name = "mem";
+		};
+
+		system_mcu_only: system-mcu-only {
+			compatible = "system-idle-state";
+			idle-state-name = "mem-mcu-active";
+		};
+
+		system_standby: system-standby {
+			compatible = "system-idle-state";
+			idle-state-name = "standby";
+		};
+	};
+
 	cbass_main: bus@f0000 {
 		compatible = "simple-bus";
 		#address-cells = <2>;

-- 
2.50.1


