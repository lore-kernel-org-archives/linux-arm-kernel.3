Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FB9C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 06:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JMvFo5QL3bZFz0qcgL/CL0qvkVwIy7LI7zBc66tFtZI=; b=kfTt1zw/CqvwIe/7cNNgbWBOa2
	/eYZqU+7uMSikAh5BFevZTbeDHRUGO1DKCdXdFWEDX2+FQoUCFEtLE+9a208FXYDgi+UET3jw4AdA
	+P6ePQO6qs/S6a/I3kjeKuktF4vq3g4a0u9f/JBuXPuauQGzOHd7cN2jrBmOTTw0NjRAGzh282sFb
	f0/LmaDY8gvaPtGpIcRqQS37es+kwVgzsncJPseu0OyCrv/AO5AZaj7L7eoV6A8/mVUplTN7Q7Bqy
	6+a1EgkSnU8sooWgOpA6ZsBNMFa7EbdQJMi8BXFcY77A2EPIIagns8R9XP7xxZz81XEenRpnBsG6H
	AZ7ocTdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNQtb-0000000HEnO-20lW;
	Fri, 06 Jun 2025 06:49:43 +0000
Received: from mail-ej1-f54.google.com ([209.85.218.54])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNQZl-0000000HBrX-2F0O;
	Fri, 06 Jun 2025 06:29:14 +0000
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad88d77314bso348351366b.1;
        Thu, 05 Jun 2025 23:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749191352; x=1749796152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMvFo5QL3bZFz0qcgL/CL0qvkVwIy7LI7zBc66tFtZI=;
        b=Q2bTGFehd3b9jblmGVe1Wj5Qq9LEoovuhsSpXeNfuTalLoQWc4SB63lH1naXu8a/H6
         46UtIWagchdp1Dcxu9N8d/Z16VVt76TTCcSTTtpgGj7KY9RxG9l8tet68xpC15VbGBVp
         Brc4tFGr+4EktVFBiJaMZzoyIYbYFDZF3vTvFrzSjVlbKqSC1h5BU/HAov9PbP8xDkr2
         ohwTddgkRDAmLbliuLG+dkhSkZM3cXSc55fgVwiCYP4xa+lXokkcvZrbPNVtWF6+nybr
         rjqKOZl+OQkN+qzO2ROJP8Wq/krxpMoPLqC3WzZj38WIqAIZQgWGCA17fic3BmJDf0Cr
         Gd8A==
X-Forwarded-Encrypted: i=1; AJvYcCV2/zhX96rUnuwv9auaVPdGbfl7a7B5XpEVfeSWZ0KeaMLgNiAt23+v8skH85vjv6uavLbVCMdvNx0DTqTdXZQ=@lists.infradead.org, AJvYcCV9Imln28gacHKKYn/xHCOvxlxh4+jn3N67LgP+k3pXmT/df3mHOLjqCfCoK1jz3cxLZ1Ir9hwLnDqFlI5WFNDF@lists.infradead.org
X-Gm-Message-State: AOJu0YwBKj7wG+ThsbSuBsXgmYaooyIgz5hegpWOl2WuUr8Z5feBBQfq
	zR8wpP2rTtesThCtY7BUuNlwlgzBm2Q6Z2wflW/ockf0qkm5OkVTaFg1
X-Gm-Gg: ASbGncvd+v3kSQ5k/AzcHjJfJDWi3mdrsnq/Q4GAwh7QwfbWbJTdKrda2PJJwSyKp6W
	RCwGpc77P+bvLVpa2wXmhEpWMKw47zFxPaiSWsmXEeoqZwzop+VtT5uNO5elZksv4hk16HHMg6P
	v97LqWWMZ9y6fH3illzCVKltyTgaXE2xe9orTnVpVMBrYDFCzouvPlGZIxwa6QZl3EQcuczoB0m
	KDYtpP2uqAiNSgSwA6SDDjc4qH54PhEHKUoP1/2YZBpg9kXZF1N8Lf9Qg57ZWPUc2IuO+j0OCiC
	PGGtX5OqzdOjNRcXsFc87StgkGI5tOGrp6idUNWbrYgZQoQhWU9Huuq0QZHKFn6gdDkom2cxMkx
	FbiXGtuEKpQ==
X-Google-Smtp-Source: AGHT+IH386t4fpjPSjXu6Q/P93pz2H4oKr1u5C7rbyqEt7KH415Hf2G+JglZ1eWXhfGWu7b+7DDqgw==
X-Received: by 2002:a17:907:97c2:b0:ad8:8efe:3206 with SMTP id a640c23a62f3a-ade1a9e825dmr164077166b.42.1749191351781;
        Thu, 05 Jun 2025 23:29:11 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d754653sm67989966b.20.2025.06.05.23.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 23:29:11 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 06 Jun 2025 08:28:29 +0200
Subject: [PATCH v7 09/10] arm64: dts: rockchip: Enable the NPU on
 quartzpro64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-6-10-rocket-v7-9-dc16cfe6fe4e@tomeuvizoso.net>
References: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
In-Reply-To: <20250606-6-10-rocket-v7-0-dc16cfe6fe4e@tomeuvizoso.net>
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
 Kever Yang <kever.yang@rock-chips.com>, Robin Murphy <robin.murphy@arm.com>, 
 Daniel Stone <daniel@fooishbar.org>, Da Xue <da@libre.computer>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_232913_572446_CDAC3F7A 
X-CRM114-Status: GOOD (  10.37  )
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


