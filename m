Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31348C83F20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 09:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ARZBUzEfFCMAq5v8g7vjIVwF7+PfjU6DnKWe8vqNJQ=; b=yk3O+ToWJ9yrdfFEbBsBaK5B5Z
	NWOc5Gxf5WpjzrSz9CKgnl0OfH7fOTtgYcaOhL59Y4RXEOAv/6WKqOW4jNxz5TwNEOnCNF/phw6nM
	X1ZcszNY/a5AbaYEvyK7TOqcwAB38J5f7s/PGvgSlMYJ/RV3JZfoKL+2fss6gu9+LpRpCKksf9m/T
	5ZdQNlAxxc+ncNEgl9zSL5Dpup07Jgv17yKVekh7YdefaKk/yXjCjMJX0eP9NX9aW9x2Wn1efNaO0
	aK9m8fah6kpakFApseM1rNq2JP9OsiCrJ8fCeAVmIvsiI68wCbeLoxEMAwjTMsuEEtBfWBXQ6382T
	kk4QWWjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaskc-0000000Hagd-3Txs;
	Sun, 13 Jul 2025 09:12:02 +0000
Received: from mail-ed1-f43.google.com ([209.85.208.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uasF1-0000000HXIH-01AX;
	Sun, 13 Jul 2025 08:39:25 +0000
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-60c01f70092so5704181a12.3;
        Sun, 13 Jul 2025 01:39:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752395961; x=1753000761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ARZBUzEfFCMAq5v8g7vjIVwF7+PfjU6DnKWe8vqNJQ=;
        b=RfCpsqMk33Cc9IgNDariiyXiB9YEkThWm3sqtI3iQyM9kV37+AlDqY0ARXKTccPUPm
         zLxQJtAaEeVVXIPPPxou93CSeqINs5Ujy5VwOFAJEAtuwWwhi1BHbejDHosfLDa0bAuJ
         xk8cQEzG1qCZKXpjl2lWvfYkNVjs8BdPqWR6+ol+bN0XP6pa6taJ2dNrDBF5JxNH+LOe
         TtWwXCc+W7y9JZedZLlTThls/an4jsgYfPB6jtknKIoFKC7+Ehe7YkcAUcv7RhPnGEkn
         yDkzdj+a4f31Xp2CIAdBHKI/OsS4z0xFa2UCEa/g8tMJkMlBTnvU5UKyinelZLZrcE2b
         4mCg==
X-Forwarded-Encrypted: i=1; AJvYcCVGgqT8aGKKRQY6f6eoyEhKJdjABeyd0/4mmZwjiA8fhNjhr0Q4vXJMBWkK49HzqUGGc1M7eV/KsDQSMmOLMZA3@lists.infradead.org, AJvYcCXxuKKjhU+n5jx+5Z/cFPT9tzEX7CbTFyNqeDsARmWVaPLtaE1jMnSqwomnhoDkb6zC0WPmqhYVhLzEeOCeo6A=@lists.infradead.org
X-Gm-Message-State: AOJu0YzH7Gpu5xHFjqXwmb6i8tY+K/ubCTsTz1O3gfU+qB4iBKBKLwWY
	Oeq875O+wHdT3fVGBd9ViukwUUJOKFk7tkXJsITIoUJbTglkE5eT4zJxhz6NyXGC
X-Gm-Gg: ASbGncvPDgrAzJDiI2c8jbKWekAJwCqjVFpfN08jPkUT7rXpnHlYfXLdSlkacQKqdEi
	Xjxepdo2SfovFp0eOfUVTzUCkKUBpjjmxJTlBP51rXLqCKSdB8H4/cQszE9MBVTWS/+eEuSd56E
	jE8IgRBGJa/tfi/7yvUm3ELJjlM9rR9oqCnjbMzUWk6f2brKTgzRpoJXBO2/ZhsN0XWR6VcCYqW
	hJUxsBfxuGTDro2E/KyaJdGeqMt6S2Xf5l9IZu2oEboYvmg1emzXShAy19d5FJ3k9oL6/bprCPK
	hjrhoBySJ2LsHKJ4wbRudc63u/+d5KAnXJF4jh/F187I1MNIq6dZ/Fj9E8g6RhPTbjUjNSjnYK5
	7g01p5YQjbBjirsu7ih4WtIWwu7v2hEeaGXu3Vm6Q2NMEi5zQj4poyjtK
X-Google-Smtp-Source: AGHT+IExBlEevT28yq3f8GIk8BvM6vD/0UZe4pkBaz+41fUQECzjnBCvYRpaZSboFe48piBAxJ1srQ==
X-Received: by 2002:a17:906:c110:b0:ae0:cbc1:3468 with SMTP id a640c23a62f3a-ae6fbc886eamr1032521766b.15.1752395961350;
        Sun, 13 Jul 2025 01:39:21 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e90a42sm610876266b.27.2025.07.13.01.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 01:39:20 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Sun, 13 Jul 2025 10:38:59 +0200
Subject: [PATCH v8 09/10] arm64: dts: rockchip: Enable the NPU on
 quartzpro64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250713-6-10-rocket-v8-9-64fa3115e910@tomeuvizoso.net>
References: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
In-Reply-To: <20250713-6-10-rocket-v8-0-64fa3115e910@tomeuvizoso.net>
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
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_013923_054247_716952A5 
X-CRM114-Status: GOOD (  10.49  )
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

v8:
- Remove notion of top core (Robin Murphy)

Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts b/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
index 78aaa6635b5d20a650aba8d8c2d0d4f498ff0d33..f8a0c95be58dc6c60ec0d48a327a9151a66fec5d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
@@ -415,6 +415,36 @@ &pcie3x4 {
 	status = "okay";
 };
 
+&rknn_core_0 {
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
2.50.0


