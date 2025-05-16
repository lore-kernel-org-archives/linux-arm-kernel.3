Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70B7C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 16:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JMvFo5QL3bZFz0qcgL/CL0qvkVwIy7LI7zBc66tFtZI=; b=bZrZt5pYaeMsPnZkswxLoyZzvp
	7JvPdnJ3kt+QS8POSXl2eO+e6UVBVZDJO7CddUTp/BfnTqJAb/ahxAFpugOzpMmD6Pbcw3km/TTB5
	gM09xGpoxpCqCj/m7kjxUMt3VallK/GfA/2NOHqtPFsIs5F+10CQeKLwU/lYf3aI74IiykubQa8z9
	0LIVDKoGGV9UENAx3tZ6z0dv5w2ImhWxD+iMgFErq/2yJ9dGQFrZY7x4Yxy191U/KMEhGrKHFw3s7
	bxEHRppr/QE946KeGN/SmMtXR+YDFDUL95IMKDOO28SrcJYMpxvfBuZSJgir7FRRJsbRN7eJa3xHU
	surAwVVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFyOz-000000045xY-2MM5;
	Fri, 16 May 2025 16:59:17 +0000
Received: from mail-wr1-f50.google.com ([209.85.221.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFyJS-000000044Wa-1wrQ;
	Fri, 16 May 2025 16:53:35 +0000
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a0adcc3e54so1451544f8f.1;
        Fri, 16 May 2025 09:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747414413; x=1748019213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMvFo5QL3bZFz0qcgL/CL0qvkVwIy7LI7zBc66tFtZI=;
        b=JH7Rn2aY1jpatpuVn5vOSCbA8k2od5N8hYKKB024R/RfTqV7snr7s2plJJ77Rnv3ba
         /UH7l6r7PxWqlQ3UtsRfgmyeLS2s9Q+8tNLyijBofLFFlbz07XdUhnak+cQYtiHIbmQT
         K6mvAxnhbI3nLoUUCeu/kgXpHsZI1zDaquLiwinhD+MmWZF+brwhNf678CUlP6WPt/k1
         rc0iP7M+5q9o9/pKHcqS9u7Wq0YjFq5zIH13WzOu6dXuH4zy8rkTJvH1+IsPCzYnAwuy
         G3Qna7edFoEKZxVSlUvqnWb+9rlmV5LVr/3ly3og2RVYRYSoXoT6LJcSxPYI+hTJKezR
         WvDA==
X-Forwarded-Encrypted: i=1; AJvYcCU3povTSxNLGMUt79WonXi2AH5ImBwrytYZRasibMy7EjOsSd8IbZtexz7r29aoLDK+IZwHaHjqtWyF1bRpkpE=@lists.infradead.org, AJvYcCU8aYuXCx+6tzINZJq7SLK6z4D+Y2vTDHsh/yL8+malO4IAwH5Ce4F63meIgcVJ9YQmzxNi93lT4FrWcTxB416n@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4F6QgyNUzYeGpud+Ny8L7F8bvi/HuMELpefaH+lINVIPdLrj6
	rvDoZa+7fct1X6zYTtgnO1du0WDewfictTgKuECs+cf6WaeRMBJfD6MS
X-Gm-Gg: ASbGncsJw3DIHlTkCa/7MAHWMWcdkIjF7XdE3sv6fhgFm0biu2K+St2SM1ZrzkfGNnQ
	8wst8khEe1is6cjRhQmx2mFhlRZFeo4dINJoFv63uyJlrzBuYsYUL5cDcHMON53386a/x8VkVt7
	0uWXzBUrktIgow9pJDuyPVbEEJLOhbzAnGFWXC1BBrbEwNkmthG4I7LEMZ/p3AkHe+Qq+Thu2Gs
	u0DiEopVlRW7Wp0vSZOtmNDhCAtMS/4PlAfegkNy9bNDAAjd4q60dmL45TxASTtEBlZfipGxBWx
	mV6Ttw+A4jqHPjvhfYR9jOW6jSy0rv15Ic5PMzaDG1Xc0QEwakrsgInsXtbDAKefBUzC9KnbH7c
	aVA4BZClbWg==
X-Google-Smtp-Source: AGHT+IE3kKJia1yJ69hIetn7LETCPISzu5AThEm8caL/gjKNo+SI7DcwJ/kykHCbu+Yw1iluEYSstA==
X-Received: by 2002:a05:6000:2af:b0:3a1:f5cf:9553 with SMTP id ffacd0b85a97d-3a35fe6628amr3027912f8f.6.1747414412687;
        Fri, 16 May 2025 09:53:32 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3380498sm116511755e9.11.2025.05.16.09.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 09:53:32 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 16 May 2025 18:53:17 +0200
Subject: [PATCH v3 03/10] arm64: dts: rockchip: Enable the NPU on
 quartzpro64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250516-6-10-rocket-v3-3-7051ac9225db@tomeuvizoso.net>
References: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
In-Reply-To: <20250516-6-10-rocket-v3-0-7051ac9225db@tomeuvizoso.net>
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
X-CRM114-CacheID: sfid-20250516_095334_505475_2DF2D18D 
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


