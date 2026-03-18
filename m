Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3530E103E195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 15:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnIikZ33fceOx0YIGtLUvBXoWdyjzbgo3+1Q5/tnQ60=; b=BORYaqgVx4znlwKlRw4lDZFwUG
	PhLMAaYfXcGV85J1Eh5eRHR+RS1SV1Tzr4v8QHTvBX3LxPZey8fCgRRf6VubxYCKs55NP5Z8cg710
	LUVi8op9U5myu/zRP31qsK/r4SJBQvci5uKp0EGJ8mR3fQ8X8U9+Q26qKhRl/gnnFy1hsi9ew+mc7
	Mhp1sNuwyt6Ora33qpCSuQx4BMxMF3rDGo2w2YCJzrjsw3y43xj+7zNIzrCNgtIVuMiB9tJ3fv+dA
	qWwb/MnjvSDBGj89rZEOubdCaNSCM29NWqJXXT5GIq9+1uIZjkvDFdqxBF6M5C5BwDu4PTCTkEIgq
	g3wEPadg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sbM-00000008fPq-3a06;
	Wed, 18 Mar 2026 15:14:28 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2sbG-00000008fKw-2Fzj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 15:14:23 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so51923085e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 08:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773846861; x=1774451661; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fnIikZ33fceOx0YIGtLUvBXoWdyjzbgo3+1Q5/tnQ60=;
        b=B/HeI8awXouiw7Ezdoa4loJ9Q5KRITpkuIg5HOfpw2CyPuPGDyosNk5PDfyoJFqod4
         xVwB2QrxAf3bsXEeHR+bzyTa679f0dF32auP7KyQf26BThoPaEoCnhZNEGtuskGKbZAQ
         7pGW43nxSX9MiqL8wc7MQCi25Mw3hFqYVdkSWB61cu9ZLbDY03j+STLVQlbv0ZWKZwqX
         PLKg0UrtNxzxJXUm0REI2o8L8sDukA0Igb95QKhSWFVGuvsqA7KZQhMWlOII+UM8IF78
         2rVcUqBfRR9O3uEdam8OzxeBWx1Vqdl/egjI7JwhXlxMOtlu6lsvBACoiOS5v45x7wNr
         PY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773846861; x=1774451661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fnIikZ33fceOx0YIGtLUvBXoWdyjzbgo3+1Q5/tnQ60=;
        b=UeTCKIBqobzGnEM8Xsl014c1yBT3YHWl9VEM3J91GuoxrvhTSxZsPa5zLclnaplk91
         A3iv/OjNpraLPKxRQrRLz/HklelHyVDcCSL+nAKS78557Zi5E4F29mBu0NqSMk4oVyGk
         aRJKNnahR4ODrXQGEeAioFDiE3U5rTIm0YBfFOBX1BOrCdnRnCNledSaP/rW/ymiew15
         pnTEtMYbTzkSZNipMy5DH/istvNMGGh8r8+LOx83Og4hXJq+K+vPJD14Ke0EKohv3LcO
         W3Rka7wZF4egzN7Yj4IkHthA7gycrJKuTjd6S94iXxC6ezJg+E4X2AxX4X+JteYX9nSp
         HYWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWytRDJCNNJ0Fc40K0Ja+BThKV+9o2z5fKxQk+acQujPzna5oYBVOzGF5Poo98JY4T8iIFroXQ1mT+o/6pdyfbB@lists.infradead.org
X-Gm-Message-State: AOJu0Yzsn2yyUzII+x5bGRktVUR72zlfN0E/YEwhXQzCKP1P0h1yQlZb
	PPDBgpp+0xqZJdgiCGDSzx6tSSy2BoHVxP3T1ikMgdymOW7Auwzmj5EuFtYCzWf9F94=
X-Gm-Gg: ATEYQzyb0cq+geZgk8YRug6TlT7SX8FGUenGC7Z6KD8FfFBAZjC6eTGFLjL6diKErgY
	71Dl0BFxXULlAENGUTZ4qZ9Ku4mcliPUk5E7Nzx5OFlLgyzWmPeH4rAneWnmJILMPCtmn6Q17xJ
	JoIt/rPtYFGN7ihOIiEauxwZJp3diaLv8W6gJWg73vPnRtT3U3mMxUdsx2VeLyUHwEHhNtxWq01
	g3d2rnIxHdTI67tkARDDavIfMPH4sknmu5R2UqZINwvZk0MVZ/ACqB0JfzEEPg3IZDWA3gD4uD/
	J57/EkmSYt7VPlM9GKiw4iLRsA9xQnSG+AZQIRHKNFsLgAHaK7TrHwbPmaNo45eSNYDReCGtk0w
	LqhHVUr3CKUXliYgci00aqZZ+lOCWYITbyY/5o0NSEW9r9dRfVoUXjJqskiA+83GpNIxZgOX3it
	oh5lzKfdaXQ7ksk7x9Jv8w
X-Received: by 2002:a05:600c:1d0a:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-486f4429b1bmr67241605e9.8.1773846860878;
        Wed, 18 Mar 2026 08:14:20 -0700 (PDT)
Received: from localhost ([2001:4090:a244:8139:5278:cf5a:3494:5e80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f5e162cbsm26759545e9.9.2026.03.18.08.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:14:20 -0700 (PDT)
From: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>
Date: Wed, 18 Mar 2026 16:13:12 +0100
Subject: [PATCH v3 6/7] arm64: dts: ti: k3-am62a7-sk: Add r5f nodes to
 pre-ram bootphase
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-topic-am62a-ioddr-dt-v6-19-v3-6-c41473cb23c3@baylibre.com>
References: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
In-Reply-To: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1183; i=msp@baylibre.com;
 h=from:subject:message-id; bh=edVr0rbhOgkFhSfFFpjtgCVxX4FcaJ3T2Pi370Z0o0o=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhsxdB02OVr3o/S3NEN5WfPnCzrP8d5b+mCt7bfeuhDXbI
 spXC2zp7ChlYRDjYpAVU2TpTAxN+y+/81jyomWbYeawMoEMYeDiFICJsMQzMqxfsqPjz+3Z7lW/
 DfevSH2yiqklwTYpoUeP9fCJxTVtxVcZGSZEce3/ftKfa/YMmepXm/lP2wW/v+ZxzkbHa5Z7/tQ
 zjuwA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_081422_606683_6B37BFB4 
X-CRM114-Status: GOOD (  10.90  )
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

For IO+DDR the wkup_r5fss0_core0 and the
wkup_r5fss0_core0_lpm_metadata_region need to be accessed before RAM
setup is done. These are used to read the lpm metadata region in which
data is stored to resume. This needs to be done before RAM is in use to
avoid overwriting data.

Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
---
 arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
index c381cc33064ec427751a9ac5bcdff745a9559a89..46483d4085c20fc297d28a49ca7ef5d4bfc4ae9a 100644
--- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
+++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
@@ -75,6 +75,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca08000 {
 			compatible = "shared-dma-pool";
 			reg = <0x00 0x9ca08000 0x00 0x1000>;
 			no-map;
+			bootph-pre-ram;
 		};
 
 		wkup_r5fss0_core0_lpm_rest_region: memory@9ca09000 {
@@ -957,4 +958,5 @@ &wkup_r5fss0_core0 {
 	memory-region-names = "dma", "ipc", "lpm-stub",
 			      "lpm-metadata", "lpm-context",
 			      "dm-firmware";
+	bootph-pre-ram;
 };

-- 
2.53.0


