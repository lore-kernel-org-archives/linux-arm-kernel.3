Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4F8C44500
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 12:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nE40RXPXCC4Y6jx2aaoYHGd5GnbuzIEXCGKvuCuNxlc=; b=2obsFE+PZmNXeEmIGeFwcHAtA4
	jlvtk5evGllgHKv61Fz2UEcMSo3xjZwWvfHjey3ozy093EelrA06fQ/AFX6VAMT9LOqbgiFtM0knz
	nelYdOj+OVd0SogGsjN+5pJAIEhWYGpj32G+XQ6BMhVo3tc6ZfK0IPJLBpsTqwtUmL+cqSYq7zqiF
	HExg/xiHio7V1zajeHJMtTD9sIBDwG27zWQL5PFNWiN8msYsgqE5L47IpIn+40Awdvt9FdK47B3O0
	JHUdBFdWxiYp1jyAiOtLMsGfUFOBJXZcjBNTqhQZOVolFjQoyVlFRA9q3GYfhl59V58yYx8XR+fqp
	UzNR8fLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuFW-000000021Wy-3E70;
	Wed, 01 Jul 2026 12:41:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuFW-000000021UF-0He1
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Jul 2026 12:41:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=nE40RXPXCC4Y6jx2aaoYHGd5GnbuzIEXCGKvuCuNxlc=; b=MDOYiHZMiIA4cq1yKFqHmLAUeh
	Yj9odZrF56ngYvd49Cfao4/dv6KcbcFL7A8GiMBdKhfp2T5cjTKJ95JY5q3X3WDVVqX8D2VuediRF
	wunYxy/DHqGJGeEjWf8CZvdcUPb1+f2Cf9x4v5GgJxLlV14r1RPI3useA+DcBik/tj17U9PH58C3A
	BHHMqxArBsf3c6QQBiaUzLSecMYbr74gEQ0AOpL8jiuHxkE3f+BQeBgI4lyTZoZ1kahm93pjS40ao
	jIz16/qOQmoGlLhI6zsA1c4M2TfqT+M133wMzXi3S4buxzosjzL16bpC/OitNWDd7DHhVdTKEP0f0
	5kZmWUQg==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weuFT-00000002lcw-0yOR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 12:41:04 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so3256885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 05:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782909661; x=1783514461; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nE40RXPXCC4Y6jx2aaoYHGd5GnbuzIEXCGKvuCuNxlc=;
        b=Z0huTbQ/qV7YEgdnM9z7nojk2+5xSWC08+XK7fmkdpm/AlB3xjQsz18NgrWGZF5qEN
         TbHMnx2v224r+U0lYQEGmDvpfU8jefJxp0cSLbkqAdV6K2YjYY0eb2usX8kCEfTW4mhr
         tOw/scYL1ChX0fF1rJqZ6xQUVFI1Q81WOmAgKHH3Cp7IY/yojFMz6o08qSH+yHVnhDt+
         DTxv6d1mUTJv3rG6767To6ThlZSDQQAc6Kb2lW1EZ19gic7g1JU3/UDuUDcfO16y/iIT
         W+g0NqfB0L7CSpiqmS6SO1LNlRXv0G5A0V4ZIRD+0sXnID9OhLy2PXg21k9vrRnaPqUO
         RaNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782909661; x=1783514461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nE40RXPXCC4Y6jx2aaoYHGd5GnbuzIEXCGKvuCuNxlc=;
        b=jmiyO58TNkIrRY4a3eImybRi3gOuYkEMoNJVWQAV46zmuiM6mk26ZWq3kZnImnzf/R
         pXgv066a54E+yeYvdjc46s8w18I8Z0LDOzpGemfKpwKmvSyav7fs6RpXAQ5ARF6tYCNz
         LZSA1pK2NumA5p9mLvVvvfRi2GMKROxeB4enfceqpfmax/3mJDTdYkMiV1dvcyH4FLao
         sgPZ474QKccriI6o6ML8sn/dhJjn4kVLJkDrcJGwl6CQE43Y+ik5CdesXcP/RADU7Yp7
         nIxwnYmuxGJrY1U4K2RNRvHRr2Csvvq/UELRjQRhMW9nOPBdCCPbl2Visr15HVAJeCLV
         wJ+g==
X-Forwarded-Encrypted: i=1; AFNElJ9dopiNmY1dV047ViCR3y9TPMRgtSL8RdiNga2u0dKsqtRTvube8gc9qUc+TMjA8gTGvZQUA9jumdrDbaFmiFnZ@lists.infradead.org
X-Gm-Message-State: AOJu0YwoyY5jZl+/jg1cwWEyx9VbKI1ptPF3p0C2plA4Eh6spL4Mtvq9
	5ZBew0PmHXJ2f3jalpuXOeyKcUcvbWCxuw21097olO/xQNODtYNywnoR6QHyPz5BLn4=
X-Gm-Gg: AfdE7cn4xF7+6UaP/5fcBPnxiPMbV0DFW82YB78BTDVrMPvdB0qsi9tx0EAx2uuV94Q
	7tbPWp6dKCT11603rtqdaYf56paHIv/corei2vsu7K6mrML01RKl7SUjR56D/YRBahQCsuEQMSX
	kxEI3MmNqnxWiLS5hIsIwc/8Ss6/N7cGvVMQHS3DeoVpV0s/cmtuZJpC682YwtlqYG7KakpL3ez
	5EIpxg4LpMK0rPkqTzIyqqxpPgwT65HjCfSWFdQFJPv14R2pquRFzTFV89ERQ7IIRYkjMmw2w56
	lSnBFCizE16rsqjgLGT1ewLME3dq8ACg6dFis8aS2vGrf6lBiifn1Y3c0okKGPwz1LEzzzB8JPv
	0EB8ZDjZ54mBbO89QeYHFfW1zYpkAg/JEk+uDCqH2RQPZGDkD61aGvCe0Vvm+arFKm+MkQz8zKn
	JqoBgVNaShlQ==
X-Received: by 2002:a05:600c:5307:b0:493:bfea:2786 with SMTP id 5b1f17b1804b1-493c3df38b1mr7549745e9.32.1782909661423;
        Wed, 01 Jul 2026 05:41:01 -0700 (PDT)
Received: from localhost ([2001:4090:a246:8638:a73d:f626:6582:90ca])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493be4d15ddsm72470595e9.6.2026.07.01.05.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:41:00 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 01 Jul 2026 14:39:22 +0200
Subject: [PATCH v7 10/11] arm64: dts: ti: k3-am62p-ti-ipc-firmware: Split
 r5f memory region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-topic-am62a-ioddr-dt-v6-19-v7-10-e9db8b16821a@baylibre.com>
References: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
In-Reply-To: <20260701-topic-am62a-ioddr-dt-v6-19-v7-0-e9db8b16821a@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Judith Mendez <jm@ti.com>, Daniel Schultz <d.schultz@phytec.de>, 
 Andrew Davis <afd@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Paresh Bhagat <p-bhagat@ti.com>, Bryan Brattlof <bb@ti.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Beleswar Padhi <b-padhi@ti.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Sebin Francis <sebin.francis@ti.com>, Kendall Willis <k-willis@ti.com>, 
 Akashdeep Kaur <a-kaur@ti.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Hari Nagalla <hnagalla@ti.com>, 
 "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2400; i=msp@baylibre.com;
 h=from:subject:message-id; bh=1HjXZU3N3yWNNw6i7VHEK3NtZRbPjnphoL+Zf42nRpo=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhixXrr3806ZIac/87yDv/G0e60K21tWLXFIly7QWGTI9u
 Kyqfre4o5SFQYyLQVZMkaUzMTTtv/zOY8mLlm2GmcPKBDKEgYtTACaieIThn8Hqot8VWi1HcqQ8
 N/zkFZPViGuJ/GO0OKe5K0RBnPXTTYa/ovelJjw+0aqgfTx8+VxWTb7r5eafhZmOh3JFbL+65Gg
 UGwA=
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_134103_409278_064A368E 
X-CRM114-Status: GOOD (  12.20  )
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
 .../boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi      | 38 +++++++++++++++++++---
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
index f77651109564224408723b72baba93e39a82be07..8f7409da83392d2d1f160a9645ef4d68f7aaa1bf 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p-ti-ipc-firmware.dtsi
@@ -24,9 +24,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
 		no-map;
 	};
 
-	wkup_r5fss0_core0_memory_region: memory@9c900000 {
+	wkup_r5fss0_core0_ipc_region: memory@9c900000 {
 		compatible = "shared-dma-pool";
-		reg = <0x00 0x9c900000 0x00 0x01d08000>;
+		reg = <0x00 0x9c900000 0x00 0x100000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_lpm_fs_stub_region: memory@9ca00000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca00000 0x00 0x8000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca08000 0x00 0x1000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9ca09000 0x00 0x97000>;
+		no-map;
+	};
+
+	wkup_r5fss0_core0_dm_region: memory@9caa0000 {
+		compatible = "shared-dma-pool";
+		reg = <0x00 0x9caa0000 0x00 0x1b68000>;
 		no-map;
 	};
 };
@@ -56,8 +80,14 @@ &wkup_r5fss0 {
 &wkup_r5fss0_core0 {
 	mboxes = <&mailbox0_cluster0 &mbox_r5_0>;
 	memory-region = <&wkup_r5fss0_core0_dma_memory_region>,
-			<&wkup_r5fss0_core0_memory_region>;
-	memory-region-names = "dma", "firmware";
+			<&wkup_r5fss0_core0_ipc_region>,
+			<&wkup_r5fss0_core0_lpm_fs_stub_region>,
+			<&wkup_r5fss0_core0_lpm_metadata_region>,
+			<&wkup_r5fss0_core0_lpm_rest_region>,
+			<&wkup_r5fss0_core0_dm_region>;
+	memory-region-names = "dma", "ipc", "lpm-stub",
+			      "lpm-metadata", "lpm-context",
+			      "dm-firmware";
 	status = "okay";
 };
 

-- 
2.53.0


