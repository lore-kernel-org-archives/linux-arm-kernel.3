Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F14CEC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 08:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZjST+tDBanh80dU/tgOfgWNh4nJ1bOb18ngSnNilxXE=; b=oofdWAKcw0JDTkllACTIZ/TdLn
	TsK8qQ5jB6NOW/D4OrKZF2AVlwP9sjem84WXx06rlBvpmoHFMFBaoP6CfRB/A1UXTkNmCiWYwL71X
	h6rY0yWbNSSLgeVNBsKoW+zI5QJWGoz/hE91RmFBtIA/caW+ohWporOjWFKzC6KuUzkQKurzRdMKh
	Hw9qAys/J5504XSV3JyUUFrLx52RZiDTkl6W/d2OwI4BIHjM2y9dvCIBAjNO9vKdEfxoTQ5MecGXe
	Dz/0APBRxnSaOABoaEcMQyW7E4eOBCyWXOqGT78kQv3cl1QNUH2LZP4n9efmgR+1vAp52oNYaxpY9
	Ncq6Eorw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmptM-0000000GJ2W-3h8P;
	Tue, 25 Feb 2025 08:02:12 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmpnT-0000000GHf1-2dDG;
	Tue, 25 Feb 2025 07:56:08 +0000
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43aac0390e8so10174275e9.2;
        Mon, 24 Feb 2025 23:56:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740470166; x=1741074966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZjST+tDBanh80dU/tgOfgWNh4nJ1bOb18ngSnNilxXE=;
        b=SJ1RMdK80950kpmixhOnHCJEEq+U7YzCglOGYf2TWryeDx/UTO54nL9x/W6lOnYyfy
         gA5XxOiOQQFQjcBI9N3QZJxxMYvLrAThhd4XOI2ikGhXyZZq3zZQ8ocIwF6EGXVZza+i
         MBIEqOLsVNPVbQBdRB/OHb6sUg8BjuZKbFfR3zGsE0YdNs00IVU5LIUjNJTCD6F/2pBd
         eFX4dZl4ohbrOt4LgvLZz650+y0LraRMLnb9fp7Ttzhd96Cve1nbPuh454MO62CfWkj/
         pqGf4B6Jv1ZbWeK3kA7sB4kY+fQcFpFcXYGHuOFO6eyreUD5OBmHP+SMcSdNrkzdoWhd
         ShwA==
X-Forwarded-Encrypted: i=1; AJvYcCVzp8ZEdPnnsRV5Hlwjp2ByA09+HT6JtJdBjsPi6bojuyKLHwFCbliXMb4dVaNvU1C1lAtkaKuXpkypcd6Dvf4j@lists.infradead.org, AJvYcCXBRPMjpdPmQubDgSQdSiOZ8AHx9gbXH0MnEf5et/TJ82Twjb4HB5N72C0tjChymGv8VW3ZFwJQYbTJdDu3oNA=@lists.infradead.org
X-Gm-Message-State: AOJu0YylTn9ig5JSzHaPXt3bDpe0NbCS+vyE82eXqwQSnF6hXtGNCt6t
	ey789pIKVUqX8jv+RYRHm/x8umYJKTDJuvw1kPAA/H7qzq8K05hy
X-Gm-Gg: ASbGncv12TKo3/aeeY0lOQ+PtJodMb10VpIea04AKo/KOl/7yaiVk3FRq/hs3YCCQLg
	IaQLguTEqDS6uvFCVnE/2hfN11gTTH/Pwj5xCLZPlbZVnNwfqh3eQrfnEhXOnkP7ZGPumHQyB4s
	lZSP6SJCdcbtzJhtzjkrDmPwb+rOJm2dALqvYO21umVqhSBYDH4P6c5YXLxIM9HTcPj79ygD3y1
	RIzwqtAwIQD8nMyqx+5pqwWsuJ0oReLrD7ROPAiGP5/RRm/3f/gLGVX/kjs7UQeh1vFgDMiBss2
	JqctXd2qaZzZBak2aQFu3X7J0e1dQHBuVYfP6QPpoVn/A3fe6u44pIGmBA==
X-Google-Smtp-Source: AGHT+IFBVupjmoCIi4Z8rhYBHew03hpkxD1lkVsBkpbYaL9RCDyWui5OGx8IsblEOSEcCQ6omhnnfg==
X-Received: by 2002:a05:600c:5493:b0:439:9e8b:228e with SMTP id 5b1f17b1804b1-439ae21cdddmr121462285e9.20.1740470165919;
        Mon, 24 Feb 2025 23:56:05 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-37-50.cust.vodafone.cz. [46.135.37.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439b02f2475sm130299475e9.20.2025.02.24.23.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 23:56:04 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 25 Feb 2025 08:55:49 +0100
Subject: [PATCH v2 3/7] arm64: dts: rockchip: Enable the NPU on quartzpro64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-6-10-rocket-v2-3-d4dbcfafc141@tomeuvizoso.net>
References: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
In-Reply-To: <20250225-6-10-rocket-v2-0-d4dbcfafc141@tomeuvizoso.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_235607_671829_778B30EA 
X-CRM114-Status: GOOD (  10.88  )
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
index 088cfade6f6f14b6383ab844fa174c69fa711fc0..5f6b87dc46361eea93ea2a1fa373cb9ecdb7bbce 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
@@ -411,6 +411,36 @@ &pcie3x4 {
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
2.48.1


