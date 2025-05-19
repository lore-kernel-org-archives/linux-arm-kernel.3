Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623DFC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 13:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JMvFo5QL3bZFz0qcgL/CL0qvkVwIy7LI7zBc66tFtZI=; b=yWMh68Bs32EVR7i0OmO0sHiBnY
	6+YjxlQXGt0r5qgFNGGnFCQ8oa82/gE+4w0gCPrvE7MItO6f3JdpvsmhJ25VFzoJUEKOeWVPKZVNy
	2+TviWfzxGFFBy2cbCy8wsOf7X6yrg3N8VkZB0cE2oUioVRCoAiv0KMspK6Wy6/p3GDerhytyEWZ7
	bJKmZX392mGTsPmsTr/oPRXkK3XxNbaPr7bEsZwYDQbhyNTK0L4ZVSfp0oaFdY5v0SliwGq/uNGC7
	IbYdUB43lq0KOfyCexNQtc9Wxlxekj4JtBK0xrzLDxwMINM7dveXqAtHTpiZgC0QcPRFBKkR4MtbO
	A5vYAv+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH0ug-00000009LzG-1Eqn;
	Mon, 19 May 2025 13:52:18 +0000
Received: from mail-wm1-f50.google.com ([209.85.128.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH0mh-00000009Jis-2V2d;
	Mon, 19 May 2025 13:44:04 +0000
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-442f5b3c710so35099605e9.1;
        Mon, 19 May 2025 06:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747662242; x=1748267042;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMvFo5QL3bZFz0qcgL/CL0qvkVwIy7LI7zBc66tFtZI=;
        b=gk6BHJmEOiRxfqrXSr/KH+hBu1BBvqU4AJ5cHVe6x5QJPEOv7nN72O4+rfdpjNaKiC
         RssI3r9Osm9ixq/IXoxb9mekYZ++Ki4OvlcrgOERnpo6nyhn30e2TEP/mIzZQMdE1HYL
         3YvbTeUD1fkmRQQGtC6yskl6dYpMosLmh8SWo8RNKtRSCmDTYJfetgDHeJVQ3P0qm+mh
         ymPINAJtr59Vg4Zljy9NwEK3EauXggBTIE5tNCQ+hGGI/d0TfpzSoOB4llhrcyC3Oeey
         01NNdkdFaVNvehhESNb2YPZR3L5NunlSvHcmVyEaJb5/B1x3y/YW1mIG5nuSrDlBUuYE
         wscA==
X-Forwarded-Encrypted: i=1; AJvYcCXWaEe0R1yWSP8r70Byc0pOwC15MHl/OBJO4yIjM3S66dbtDzTRah71oNiZBpN5chzMEi3gAqrjfOHn2d6ne/gd@lists.infradead.org, AJvYcCXjQ45Z6TPIIV2Wir3qeNulWPBeSNMfHhyhdnloc7rzj3HDo8tlqNA+pqtmnkMbfJUp+DkW8E6yUpwFj04s18w=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/rWSERnl6Bw1F6cMBElDJiLIkcYvl9Ti0kg4AjwG1iEleGAzd
	5lN6i9ki/7lLzNgZ7JJ8qbTgara9AY/tmHs8ZWmv4K5AIZCiC9YA2BGd
X-Gm-Gg: ASbGncuXpOh9Bh9c+hi3jRbiR20E8nBVKKS5RaRsGl14fyXE+7GDhP+eDn3/xUzdab/
	btNdN3qMCU/4Ehh5jRSyV+FUircHJr6u2WxzL5KGHyVbJ3LsEQ6Vp5AwYhIfEYAI1hnhbvstHmi
	LxszBj58b710u9TO4x1dWY6LpXWK8nct9EpgTpG1ObXJ6phZyL0XRcR67JSAVFRK8w3aO0i1d4h
	bROrpE0qsfZbLSQiiQzx1YoO8xIcwK8BLR6x1pE34lmmC34Z/h2bY3b1CepvdugDSDSwWc9QaO+
	weehx4Tl726dF2SFLnLyY4cA/8ZZ4IaDKCPl4ouCq9R2BXh6do+e56lkyW6bg5ir+fl4v95alCz
	iSE4Uv8hT9A==
X-Google-Smtp-Source: AGHT+IGqaMWHqsYu3YzcAO5QAiGSlI1CdiHCVwdtYh347xJkvMrzMo1SL7n38SQ7xE6N+he27vPggw==
X-Received: by 2002:a05:600c:3114:b0:439:6118:c188 with SMTP id 5b1f17b1804b1-442fd63c6f6mr112316475e9.19.1747662241895;
        Mon, 19 May 2025 06:44:01 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f8ab839esm171263005e9.17.2025.05.19.06.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 06:44:01 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 19 May 2025 15:43:35 +0200
Subject: [PATCH v4 03/10] arm64: dts: rockchip: Enable the NPU on
 quartzpro64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-6-10-rocket-v4-3-d6dff6b4c0ae@tomeuvizoso.net>
References: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
In-Reply-To: <20250519-6-10-rocket-v4-0-d6dff6b4c0ae@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_064403_627054_A7D92328 
X-CRM114-Status: GOOD (  10.70  )
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

Enable the nodes added in a previous commit to the rk3588s device tree.

v2:
- Split nodes (Sebastian Reichel)
- Sort nodes (Sebastian Reichel)
- Add board regulators (Sebastian Reichel)

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts b/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
index 78aaa6635b5d20a650aba8d8c2d0d4f498ff0d33..2e45b213c25b99571dd71ce90bc7970418f60276 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
@@ -415,6 +415,36 @@ &pcie3x4 {
 	status = "okay";
 };
 
+&rknn_core_top {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_mem_s0>;
+	status = "okay";
+};
+
+&rknn_core_1 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_mem_s0>;
+	status = "okay";
+};
+
+&rknn_core_2 {
+	npu-supply = <&vdd_npu_s0>;
+	sram-supply = <&vdd_npu_mem_s0>;
+	status = "okay";
+};
+
+&rknn_mmu_top {
+	status = "okay";
+};
+
+&rknn_mmu_1 {
+	status = "okay";
+};
+
+&rknn_mmu_2 {
+	status = "okay";
+};
+
 &saradc {
 	vref-supply = <&vcc_1v8_s0>;
 	status = "okay";

-- 
2.49.0


