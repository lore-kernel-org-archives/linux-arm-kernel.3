Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135B9C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 09:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Aj4nRpIwchXIrjexvYOL05y/b5PvSBzLyScjI+iXpvc=; b=PNjM3Ie2J9WSGgKrc1wbQsFXaw
	WjmKMv5iyU1lbB1B+TptYE61waf6WRFb/lpQYMzPfsjNtYY80pT3RfHEE6wq8vwHovIdZRBdnwbQg
	W1GInAICcDe5lp/IoVUY0F8pMkkKzGIjd4vy/8C1MJOiap1HrR46oHB80j/BpVCowG9Sr8qtfQbMM
	b+FB5bhQef8thrLyqpLeEb6oGT8F0e3mw7wm8MTwMOJ6D3N4JIq+viQUVcBMt73FVN0f92yUmf/cO
	+CQvp5g3a0uJRsoHgybOChQer826bawvfGa87sZGJi8FtbKJJKleZVVrhZIHeg2drwkStcssHpdcX
	Tc3+jwrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taXUp-00000009rhh-00QI;
	Wed, 22 Jan 2025 09:58:03 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taXSG-00000009r7z-3rZI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 09:55:26 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43624b2d453so72983845e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 01:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737539723; x=1738144523; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aj4nRpIwchXIrjexvYOL05y/b5PvSBzLyScjI+iXpvc=;
        b=M+WvoFHRaLifYIrTIvYZg+oHxHdu+KnQGC/FXgr7DvLtLV5jam7VaPZbNvet9onN4v
         5xj3m7TCwRwZZpes8CefmpTO9vTr38288qWKK4Qyrq020aYOoDFM+wBWZYGMKdK/VzSx
         yFyVfK13JhlY8A3MJXwtYrBsZFCbPGVeR+Q3/7P54cEKyNdA7xrFDBuqOfR4KkQaBQsy
         1w9Xx1yQdUuyoUJdIO7PBWcj5xqijvwZiDuikF8j55sArUevK/uniKgNbClxDRuZfxBL
         fnMhWnceRd11MHOkTrlyqexqmD49pSVRmxcD+zX2ODXNWusQC+g4MvvoIJbFnEeqSKLN
         O/AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737539723; x=1738144523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aj4nRpIwchXIrjexvYOL05y/b5PvSBzLyScjI+iXpvc=;
        b=bXw5nGbRjiF+k7ypSy5RVm7cgsBqjTKyjQ590Z3c1mm8bJ8RMMJexWnuzHEgKY0LBL
         1JdfWISZPVVe9TzRj3j95i7EWLlS+ramXWrS5K9spWekskcRbBspQNRu4p/TTBOebnSU
         yX0SRvMxaOcSZtM3NdrOPBrAmU/qSU6OrjZn/I6snw+5qBAxVC06B51JdIl55pnWsHWb
         Ldp+1n979hBhOUWHh+U3IY4nL/1pq09shRDfdmx+7erpcF0qucaygRlEZEN0dP1IvTcp
         ctT5qulXOg0SnEU1U4p4Bbo38ClQypSYUoCArsMCE4+NJLgNSsnZasHHmTSlpPc+nFOK
         XL1A==
X-Gm-Message-State: AOJu0YxXicWdWenWMJVIUSi9hV9C8FUWGyhUhnWJTURiu4Jn6QLO41IR
	nUqqNwbdSshtOOCRxxFcGJmejot32uJcHzLfA6CWaj08cQRNiDiQ4X9Bs+NqD3Q=
X-Gm-Gg: ASbGncsJnEktLPDLcnfAc24CnV2+FfjoYw6A1jDi2KAsU5uxnlVjdLRjQdogFrqCOiP
	1DtIjRp3utPF4Bi8XGQ3x7XLWfk701RGxtNv/RxEuTDICupXZgzb4oh1oiqsgo1UKHdmfLRwLOk
	aNeMPoeiCOOJDzu4JJQHptTWJRTBl/C/Z/aP8L/xbPE5agp8KuZk4sfLE/Y3QBObEaQeVAu+EK/
	0uZHSd3YQjA6TFBnJSzLOWhrJShlauSdIHp+arrkEc1HF9BNRiS0VmYZUUv9roWkHM=
X-Google-Smtp-Source: AGHT+IGOsMe0dJV9o7lF57/4pcu4vQWVPlAoCIketp1VfdTXI6zME1oniG3rGWHLTkoIM4AiRRbSrQ==
X-Received: by 2002:a05:6000:4011:b0:38a:4184:152a with SMTP id ffacd0b85a97d-38bf5669eb5mr21886502f8f.28.1737539723122;
        Wed, 22 Jan 2025 01:55:23 -0800 (PST)
Received: from localhost ([2001:4090:a245:80cb:f705:a3ac:14fe:4e1b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31c7cc6sm17631285e9.36.2025.01.22.01.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 01:55:22 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Wed, 22 Jan 2025 10:54:49 +0100
Subject: [PATCH 1/3] arm64: dts: ti: k3-am62a-wakeup: Add r5fss
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250122-topic-dt-updates-am62-wkup-v6-13-v1-1-f74835b91da9@baylibre.com>
References: <20250122-topic-dt-updates-am62-wkup-v6-13-v1-0-f74835b91da9@baylibre.com>
In-Reply-To: <20250122-topic-dt-updates-am62-wkup-v6-13-v1-0-f74835b91da9@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1468; i=msp@baylibre.com;
 h=from:subject:message-id; bh=4lbgavZsydQCQC3ftLFQIVuXaot+GlmQOz/MdBfvMME=;
 b=owGbwMvMwCGm0rPl0RXRdfaMp9WSGNInHKhyWbZwlZ+QrczRj/8jz/mbLp/Yt4uv4093/JQyk
 e8/9ItyO0pZGMQ4GGTFFFnuflj4rk7u+oKIdY8cYeawMoEMYeDiFICJHJzEyHA49Zd91qu5nj8O
 8HAsf/zGy+tDwaaX0t0biwVS9yWYJ01h+J8aFuQWYyd16MgJ/fCttqFHm6dxuwcH+J5t7tLqPbG
 zjh0A
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_015524_963529_4BF135A8 
X-CRM114-Status: GOOD (  10.25  )
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

Add r5fss and core0 nodes to the devicetree. This is the same as present
on am62p.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
index 0b1dd5390cd3f42b0ec56bab042388722b4c22a1..3555d8d8ad3c1999e772376758047f6f3500fb7a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
@@ -88,4 +88,29 @@ wkup_vtm0: temperature-sensor@b00000 {
 		power-domains = <&k3_pds 95 TI_SCI_PD_EXCLUSIVE>;
 		#thermal-sensor-cells = <1>;
 	};
+
+	wkup_r5fss0: r5fss@78000000 {
+		compatible = "ti,am62-r5fss";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x78000000 0x00 0x78000000 0x8000>,
+			 <0x78100000 0x00 0x78100000 0x8000>;
+		power-domains = <&k3_pds 119 TI_SCI_PD_EXCLUSIVE>;
+		status = "disabled";
+
+		wkup_r5fss0_core0: r5f@78000000 {
+			compatible = "ti,am62-r5f";
+			reg = <0x78000000 0x00008000>,
+			      <0x78100000 0x00008000>;
+			reg-names = "atcm", "btcm";
+			ti,sci = <&dmsc>;
+			ti,sci-dev-id = <121>;
+			ti,sci-proc-ids = <0x01 0xff>;
+			resets = <&k3_reset 121 1>;
+			firmware-name = "am62-wkup-r5f0_0-fw";
+			ti,atcm-enable = <1>;
+			ti,btcm-enable = <1>;
+			ti,loczrama = <1>;
+		};
+	};
 };

-- 
2.47.1


