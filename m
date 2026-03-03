Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F250AEDA682
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 15:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WbJgbWAnfu0WdyiSKYKXFL9ucpwnq0NwS8nZPGPTy/I=; b=CqvrqVxUG1zEd3FvLcgo5ykEM6
	4gT9h9jOHcpRMFxwTNNEMZJ4g3jRdKquPCib9PuJJ2Vaosm9jFC+2HvU5QTEi7VcL+g7B/G1ugxkZ
	YwkTugLzW2E18FG4b4P/IXOGQVrKXbeO+Z4/0CHFHmEFzR49g0I69YaQUi87EX07cEN1JpH7BqnGE
	qYCIdCWBE53SawY1cvGc3OKv7ZmB9VEBxFb7VS01w+c+e02om3AGiO8Ykh3BHeawZjqvNbXzSnYr0
	Xldw1FHS6I0iJGTdjv3fTlDkHaNwLpLVUHQLDZ3UHOsMZljsPjSGi1iO1h+r/QiIxBjQGCF1BEUOT
	ZKoLus3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRRh-0000000FOuk-3xXt;
	Tue, 03 Mar 2026 15:14:01 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxRRe-0000000FOrE-0eLn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 15:13:59 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4837907f535so50947805e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 07:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772550836; x=1773155636; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WbJgbWAnfu0WdyiSKYKXFL9ucpwnq0NwS8nZPGPTy/I=;
        b=qSFQ+rsIM/XGRkc0ACsGWRuSYRX7d0odHs44K80EoMk0LzGG/ZnQq+NGmu8bVK5T3J
         bGRZl5j/l0rjGVcYiBUeHz6nUvx+ht1/Im17eAh4zR2L5ZwEtUHXoaMZ7OzXFbt8rMvg
         J01DnkJoAEfwdMHO57ImCTveC+G807FPGZ2CfNBuBRUAsKTLZjUHnNShQmhNmbKOHAJ7
         cHhmBl5lE6H0xYP7KIxEjA3D3wLwxqUW+xxokvt7zVq8yPYH7coIuJkorqPYy3ONmxip
         xIiA+y2y15ugDqRNN9rD9wX2ayhmVXrfY5yXXW+P2/MiLiQqD+/MFvRDQZqnjRE0MQRM
         FOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772550836; x=1773155636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WbJgbWAnfu0WdyiSKYKXFL9ucpwnq0NwS8nZPGPTy/I=;
        b=LFuAfySuWFs5GOVDIUKsGJGIPfypNZo4Des4TOXw6Iju2BMVU09ArEW8XQB7CP+FcX
         nXuXy1rwY8tk9DRHPuNVEAQDxVpjhSi/PdTZmwk0AkO/EZATcTojdsOSedzMmMexyes3
         mi3Bn9vdKqB0kWNpLzYELDTS3qZu8xcDuUC6KFwvnlCZ61uMe/uYUJ6zboy997rahSpD
         veqU4qpZ0iCltkRx2sddlbyazrNxRb1VFbl67h0Ee+qR3zKpsazXlg0dzI0upA/yA0b3
         oyDeoLit/0x5j7oIdkT7OSqgDX+lM94FKoINRfhD+x6C03cxCA5X/wCSQgrWKONA6iSa
         0Gqg==
X-Forwarded-Encrypted: i=1; AJvYcCUGu0YqoRYKNtbCHBqiscc5MKb42WBJB+2uyH5D/WuQCamgEOxeKl3Fdf8/Os3XvKcLDfn9FRyp7p7zYy8ou/4I@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg79aEEAqohUKCT4c4F9P/0ezMlU5bopFDKKrVA7xRkNYe4ZP6
	RJ7MsG6sQd0DvXNg9DAR1pny71Hmxhk6Ggtvy+V8OWjGbV170zjKl1A2NL9SeBaxIOA=
X-Gm-Gg: ATEYQzzBs12gueUjkvbjNcShEToSIXysG0Nn0q5Ibz5a0iU03ciOGuznCmlSQDCoWFa
	Fkerg5xgjZ7oegBzsp77M9MV5acrDqc/GCBWC/5VNQhpZ+B2mCsKggcCbuvRPmDBX0T5DN+8OPG
	dF9USvgporKJhHAppxnZ/2IEiZiZNMIpJevK6cjfbODCZIsWyCYk0t346w9NygR66wAnc8/9ghg
	eJLQS2QGJp+iBbjNeohOtUatqmJMl0MiKCJI+uR0SvE5k3Zn9HEcABJgXYLrS8S080FqX+1jkdV
	rYI2gcH7p/VoYWQkq6qwc4lTL5Xj7aZk9oozuPkrcJnec+d+hfEh6+rEVo0D+TtFDKI9j5noXFE
	u0SGUaBHyF8eHMOkTP9DJPaS1dg1a5gxrAJ0gEPkbxnuk2TRtb368kp0XCyEvYaLVIxThvbYELj
	t6ooV9qbSF5KiO+6kLzcD5Ken9P+Eq2wc=
X-Received: by 2002:a05:600c:818e:b0:480:1b65:b741 with SMTP id 5b1f17b1804b1-483c9ba3aadmr304376075e9.15.1772550836189;
        Tue, 03 Mar 2026 07:13:56 -0800 (PST)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd75df9fsm574690085e9.13.2026.03.03.07.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 07:13:55 -0800 (PST)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Tue, 03 Mar 2026 16:13:02 +0100
Subject: [PATCH 4/6] arm64: dts: ti: k3-am62p5-sk: Split r5f memory region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-topic-am62a-ioddr-dt-v6-19-v1-4-12fe72bb40d2@baylibre.com>
References: <20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com>
In-Reply-To: <20260303-topic-am62a-ioddr-dt-v6-19-v1-0-12fe72bb40d2@baylibre.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Suman Anna <s-anna@ti.com>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2273; i=msp@baylibre.com;
 h=from:subject:message-id; bh=WyT89chcbmYqJC7DKZPxjAVElAXe9OzF+0pwJ2S76L8=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxlv+btWXQucSrb6dTV7a27za4J5sbas02ezip+R3/2A
 7fzjq2uHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCRkk5Ghl3TlqVpXM37a2Jd
 t3PdtwfL6jIO1/o6rW3+n2czMX6b2klGhr/eO05bXw0pktcycVlyVmXemfhN8m3PFgtUvK3eWqH
 8jRUA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_071358_216949_51281041 
X-CRM114-Status: GOOD (  12.43  )
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

Split the firmware memory region in more specific parts so it is better
described where to find which information. Specifically the LPM metadata
region is important as bootloader software like U-Boot has to know where
that data is to be able to read that data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts | 40 +++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
index 4f7f6f95b02ef94a140edcef595ad8f6cc4b4113..7fa4924ab52484c7ac4243a0cd6c0d7aacaf8b30 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
@@ -55,9 +55,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 			no-map;
 		};
 
-		wkup_r5fss0_core0_memory_region: memory@9c900000 {
+		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 			compatible = "shared-dma-pool";
-			reg = <0x00 0x9c900000 0x00 0xf00000>;
+			reg = <0x00 0x9c900000 0x00 0x100000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca00000 0x00 0x8000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca08000 0x00 0x1000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9ca09000 0x00 0x97000>;
+			no-map;
+		};
+
+		wkup_r5fss0_core0_dm_region: memory@9caa0000 {
+			compatible = "shared-dma-pool";
+			reg = <0x00 0x9caa0000 0x00 0xd60000>;
 			no-map;
 		};
 
@@ -833,3 +857,15 @@ &mcu_uart0 {
 };
 
 #include "k3-am62p-ti-ipc-firmware.dtsi"
+
+&wkup_r5fss0_core0 {
+	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
+			<&wkup_r5fss0_core0_ipc_region>,
+			<&wkup_r5fss0_core0_lpm_fs_stub_region>,
+			<&wkup_r5fss0_core0_lpm_metadata_region>,
+			<&wkup_r5fss0_core0_lpm_rest_region>,
+			<&wkup_r5fss0_core0_dm_region>;
+	memory-region-names = "dma", "ipc", "lpm-stub",
+			      "lpm-metadata", "lpm-context",
+			      "dm-firmware";
+};

-- 
2.51.0


