Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67C5CD1297
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 13:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTKIOxHviJSuZyXfPdDaD8f53AbdDA07/I+kul6Gy1o=; b=QRQ5G6Jyrx4hS4Jw5cDjExHfG/
	gChQJlgnsz+RqM5R2eDbNQQMWgU630YCKwzKA8UzREvBNgOtpJjVR8nfqNJCuLZzmcLFds2ZZEtYa
	enpyS18ANPL7eUmglzhhRRL+BkylcZwFNxI5vGT7676hChfZIaoqjwqw7QJYP9dMRkYKitK91JMhg
	sl6E4LyTjr/epIX3AEg/Nap98C91srqswmCD3bxMW4vC2ITFnWqGoSNGgno8z2SbDm21jV0FkTeRC
	ycit2FuDJ/krgYheOcoSBqp4VT1GRDMUN0xfgp8NNrpIsRAAhfwePBPKB5a4ih+2IzFW0gZpIyaSb
	q56hg5YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4sW-00000003f92-378H;
	Wed, 29 Apr 2026 13:23:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4sU-00000003f7p-28Gj
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Apr 2026 13:22:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=xTKIOxHviJSuZyXfPdDaD8f53AbdDA07/I+kul6Gy1o=; b=LdA4yWjAmppJgKoNtt/FzBhe61
	9+WfrpNuA1PrEbRCfFpmGkO7StIc6bO5dz0VubSoj45rVCUMy320AlKg2PtaTAY8znQ+Ib5UqfnSB
	Yli3BgsRd+GjD7SEpraz3Cqw4C7X2s3LpVt4zVCVXzpHuv46udNdkmHbwP/7ntt5OMhxLSshEjANQ
	LdBcVjiRtzkSGJZQ5Ms9yQOOMJAx9LxI4QaQEjx6pdFa5fbu/UWL9fMdaCcnKE0X+NGUpopuTJ2CE
	hOAm02EEkhteCexs116QXWz1XbA5/hgGeNd3bey4sRjXj9AmzzAJ6nMCWG2yv32p077LbQF6FHz+7
	bJW/yMmg==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI4sR-00000005Nvp-2nx3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 13:22:57 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so152221065e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Apr 2026 06:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777468973; x=1778073773; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xTKIOxHviJSuZyXfPdDaD8f53AbdDA07/I+kul6Gy1o=;
        b=zpSn62Qm+sWJIBRD01pWV9m0eA7Qa8ADp2SWAtvImOuadGLk5UPNoQHjafCHxhcDbJ
         gUWA6nLj2en7v4Cxo3nDFTFb6eWIF5wR80SaSvXR/PUufLTGxZfeHPCnd3719m83hSiv
         yT0tEp37zgeE2jajKRpu29xzluJYXB7D9YI4iQKjPEI4HgBSrYE5WMkCyVA0KuUqoMXV
         pU9BvhfmnJvVqJ3srnzC+/oJp/9NDwJbuKGNais98YgX3CKGAAFnIrQznaR0ekDwONSX
         fKoYLdxr1uaZFZgmEJH7OCGbFO8AdExpsj+yWmL3MvBELbMR0Gnbi6b1d/W7H46bvyqY
         0ItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777468973; x=1778073773;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xTKIOxHviJSuZyXfPdDaD8f53AbdDA07/I+kul6Gy1o=;
        b=FMiCX7RBND7PlfMP0+9hGWEGyacEbt5mzAJDsUFMcb5BwjsV7rGVFI6T/JzeuDp1tz
         S9DKa+ylJHprmxSPx1pgOrbQ7mliZvue20r+jlKHcgNylTT6gBoAbcaNjdj4stgIGEq1
         6qOxhiVOxhZ1KxyImBE9PAmetVKkv8kp4pcKIg8tQCVtCc8e3gw/en670NVePa14Y+oa
         e8fYh2i73s8mYOrf+a7wGvCrIWq7WxUey7dKLk82nWRtqjMLYVftO1rkeK3coVtGpaZS
         h2/qAWo5MqMBadFaxKMJzOTx5e8+o4b8/W4KyJdGFbvyrQ2HaRPXk4SeFMTQN171q/au
         uuLw==
X-Forwarded-Encrypted: i=1; AFNElJ9jZaPeIDbF6suVCswitkL/bhh9HYNZ/3Ik5XwXCPAMPbi0lJWTV9kpXlFskfxvheZziKf34tt4s5UmZK81/P3p@lists.infradead.org
X-Gm-Message-State: AOJu0Yyk+RwUTSnYXPwZ/5SSRWUvrSIX+G5HZFms2I7Z0M6jQBvg/QhA
	L+4TJ9mVeNMQDAF3sLdIk5fEUcjsE8hI2jh/1K0bLbs6a2f11Lw5GSFYfsbghImirHI=
X-Gm-Gg: AeBDieuwTLWNKtT0G1yFm4HF5ml9ldLVfC091xR1e0cU/o8Z34EoMGMFsrB4MrPsuMZ
	mUw13DfU4cRBh4aMHxYW904qF7wZbg3AYSnbX+bIyJbr5uwFhLqGHAiT4AeVVBOmgXrXq4L3EC4
	gBBZ5qGgbO6n0d5xPi3pXUf6FeQKLAXovv1KmigFe3en3fRAA+bk9tmzKHQ5k+A7KXOA3zMLIal
	iv2kpjyaTN1etPz3FFC0Tr93lE6Tj0Y/stJh9qrCof4YHo5MbFiTzPD5xYumXNRXpY91AfxG8lY
	h4ALq02d76bnxXLHjfNQlDsh57FGZVvPKGyb3I2cofZA8+2gJzVwglBbEcgVZS5rb6CVVbvW361
	gh4qlNSTmIs7sbvI+HRfCWamjP5e0sz5P4sh2x//0pe6c3JaVf58zLs3bc4iO3Yg+0dmnYHYKbl
	qHLpb0pXZf+9I+xa4PsIQ3pBvSDz6/8As=
X-Received: by 2002:a05:600c:a315:b0:488:9e54:94c0 with SMTP id 5b1f17b1804b1-48a77adc73dmr87486785e9.8.1777468973283;
        Wed, 29 Apr 2026 06:22:53 -0700 (PDT)
Received: from localhost ([2001:4090:a246:83ca:1917:a47e:1872:2063])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c2fb999sm27272745e9.6.2026.04.29.06.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 06:22:52 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 29 Apr 2026 15:22:08 +0200
Subject: [PATCH v4 1/4] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-topic-am62a-ioddr-dt-v6-19-v4-1-fc27d6ac753c@baylibre.com>
References: <20260429-topic-am62a-ioddr-dt-v6-19-v4-0-fc27d6ac753c@baylibre.com>
In-Reply-To: <20260429-topic-am62a-ioddr-dt-v6-19-v4-0-fc27d6ac753c@baylibre.com>
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
 h=from:subject:message-id; bh=URQQ9Z6jTAoqQ+MLUzm/WhCvSZ5DsHJ0Gwd/k9oBwGc=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxPbLwNny5P2dS6bpNoeqX514OlZ9ZZruoR0pyy9Hnw0
 9UMJWumdJSyMIhxMciKKbJ0Joam/ZffeSx50bLNMHNYmUCGMHBxCsBETkow/FN5k3/4zoRlaWFT
 DvWbrWKIKDXhdGH14/yWsdHO46Z/9UFGhinX13w+NffX9meK1xseeKgYpE2TmT67zlLH+u0jc4m
 /3FwA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_142255_798729_0079E4A9 
X-CRM114-Status: GOOD (  12.15  )
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
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 40 +++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index c1e9067b3bdd5ab0591541d4685bb17a5dac4f65..6f2ee93c7be141ee5ae3f1e3324d3a060db069f6 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -59,9 +59,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 {
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
 
@@ -933,3 +957,15 @@ &mcu_uart0 {
 };
 
 #include "k3-am62a-ti-ipc-firmware.dtsi"
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
2.53.0


