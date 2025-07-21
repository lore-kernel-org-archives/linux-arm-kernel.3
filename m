Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC79C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 10:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uw1eDADEVnjLekcZOf8BqlzoLj1qhBCrbU+NvqhrVGg=; b=pV0MCUoGGP7k1UuFLXEYlq/uJi
	eywnftOPr9C99i1MOAVhPpD5rXHd6xpMAVt2HJc1M/MOuGLgNLkWHcuTcGX03A6uc7mqkr+A1HLkZ
	6ZfiTKXbEjUP4JRpSNzs+sls3FtKpvop7eZZrUT7jUc9d0r/b93hsnjZWFf864o0+4ivAOtTmY8mx
	Qbdfnvx5/ba4it9mlEkDzOVXwsmSB1OvSCpLHGC7dxXInOtFrFK2xhEn4GLgKqiNjgqe1LjsovmL4
	xne06TWuzoO8WadKW9mz2CDdNlrLsguK77JcNxl6IkxXgQ2hz1yv+VOmaT/jHLlqM50cSgWF9dn6T
	GVxKiwFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udnSu-0000000Gv9C-30Ws;
	Mon, 21 Jul 2025 10:09:48 +0000
Received: from mail-ej1-f44.google.com ([209.85.218.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udmfC-0000000GmQB-1gI7;
	Mon, 21 Jul 2025 09:18:27 +0000
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ae0bc7aa21bso803343266b.2;
        Mon, 21 Jul 2025 02:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753089505; x=1753694305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uw1eDADEVnjLekcZOf8BqlzoLj1qhBCrbU+NvqhrVGg=;
        b=SZPzAtb9mU0dYIha2zf3mUaE6+i5VlekB6rOyw4AOC2W7QZNj4Hy4LmxA8jQfH6/hQ
         OloIy7Qk7ykDYQdmDvLBR9MzbekClJPGD1s6nG6qZLTaeZWEmOIkuvR4KaIBnfT1yAYd
         UVYHXOCmhZ1wwaR2AXGSV6mljb+2JpX1aYQzwPCEJhtv32Ckryr9qaYwl4fPINzHrlYD
         yNUt0ehgn4zVjEht9k19q9Lks5QopH+T6G2tIBGt46zJooHvcAQ7+KUEmon/JiUO7Qm9
         COq0ISlfZB9kaCXt0p1EZ99dE2qpFyoQS/Xb1hGK1c1o/SDOWoDnMaIvmR4tx3+/VU88
         HqRA==
X-Forwarded-Encrypted: i=1; AJvYcCVC8p/d5EF141ROc7GWo95W6XUSIDsgwl9b+YpNXmRM3T57ywdLMA6Ve36Tui+WBr/Ecv6MWnHTt6EJbN0MtyM=@lists.infradead.org, AJvYcCXKjsJXpfW/GNkb6ITgiHYPn+4vvrkHH5COnlu2P+8vmshW6/UlapYImrYy0SLMe9In8fMUQzUsT+1+cBLmFc4B@lists.infradead.org
X-Gm-Message-State: AOJu0YyKdaylTZVW2Lv3iJ5CCnMyWViP4jABmnhRVViVh62FLsQ2/1JR
	Jr8dsMhufXw44MQeugtx7clmroRy+7+ToBuufAo+AGN3nr/4Jt6zBuZg
X-Gm-Gg: ASbGnctPvUGWZx3EjrQbmRBKQqLyU5+OzHCm3mf28FLik10Hbm7X5qf65qoirUQ97Lx
	OS75Ap1WCHh7Kyu0QMxJZvbAnJvIly+1142vO1g9TOBbqZX/xUT3ZCEXAR4EKzAgOS0tiO8vCzQ
	8WriPiwbEb2LiZrM/T0mMRqKLY7PqTY13hYLWoxsqKrjYfxfGeEL13FisKjnr4CGc5GwF/11jxB
	Rm4X2oBDhe9zsxz671q46SFNcU6FfLcUZ0iT4MKBxu/U+QdKrHdxS01FsNiNBlS4c+XJJb/z7Qq
	NgDwODdUNSe2QJxz8yvLYaLPL949RBewR8otk45lT+A6n/QJ9A7kWdEXrm/21chdOhVfkQfizIj
	jxWbQ7z9vBWZItchf79APFpDuvLcZpJmHhiAYfleYQfTL8PWHHz5EfgbB
X-Google-Smtp-Source: AGHT+IHsm1ePBUjMjzCvzap3g5+01eEdQ+wj7EdefzOzw9qpCsRvUCz/JpSRjM/NIMEES6ZIOqq5NA==
X-Received: by 2002:a17:907:c04:b0:ae9:b800:2283 with SMTP id a640c23a62f3a-ae9cdddb9a3mr1998711266b.15.1753089504662;
        Mon, 21 Jul 2025 02:18:24 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca2efc1sm643125266b.83.2025.07.21.02.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 02:18:24 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 21 Jul 2025 11:17:36 +0200
Subject: [PATCH v9 09/10] arm64: dts: rockchip: Enable the NPU on
 quartzpro64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-6-10-rocket-v9-9-77ebd484941e@tomeuvizoso.net>
References: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
In-Reply-To: <20250721-6-10-rocket-v9-0-77ebd484941e@tomeuvizoso.net>
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
X-CRM114-CacheID: sfid-20250721_021826_445624_08FC00A5 
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

v8:
- Remove notion of top core (Robin Murphy)

Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts b/arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts
index 78aaa6635b5d20a650aba8d8c2d0d4f498ff0d33..b2336c36da01af3b67fe347d5ff0b7c4ee6b0556 100644
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
+&rknn_mmu_0 {
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


