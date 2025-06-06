Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FBEC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 06:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJr+6I0y8wgx5+GjQkoroOueGabTjocLtcws9SVOMk8=; b=E1V68evIlY13xNkIeIdGPEWGwj
	A2Qb+NoFQY6QuiWV4ZIvck3jZvIzyN1NmBuXKQo/AlK+nQYLZDzzSFUS8OdRrIR0Viofvw91KHxoh
	FDSUkVXN7R+VTCK2e8POvz+h1kjWVsDj03/ouX3XfprhoK5ndgjNMxkXmHK+yX1yh6jVhxD1iAZTk
	+wC37piJODkcMe4WO1IL9AE5BUI1esjAk+jOCDQhsEABj8wtHdvPug0d1KeDC7voytNIMsP7Pv66u
	x1X3h3PMh8jwe2YrqLeAIRg4mijPC9QXdzf2a89oLa35ASSZcGPKLa1uNlCqryYq880uqNVeAulMl
	wHW+0/HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNQpI-0000000HENw-3bL6;
	Fri, 06 Jun 2025 06:45:16 +0000
Received: from mail-ej1-f48.google.com ([209.85.218.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNQZh-0000000HBpB-3uU0;
	Fri, 06 Jun 2025 06:29:11 +0000
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ad1b94382b8so295547966b.0;
        Thu, 05 Jun 2025 23:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749191348; x=1749796148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJr+6I0y8wgx5+GjQkoroOueGabTjocLtcws9SVOMk8=;
        b=Cq8f0KbgGeNCf6PswCgLZe12yVryqdPxGLNlPcvY80k/NFcGdDQSdDtKEUmWCt2UcV
         tes28G2yV9+39ItV4o5yjPjBGM4dsdiVn4ZPsCH0uaXzO27d9qTKi8XW9K+nTNo9p1JO
         KAxBsGB3ROLvyEbcuAgH4iU7JGDlvldLRCceltqGizXcL6tPlXd5MrmIt9Viv4PccZkZ
         sRKpDZYthRyYf9qUB+hZVAD2D4eLM6YeeN8UvnBxkt8NxJ3pFYOPk3Vl0faKVEc/H2rt
         UMIRA/HrHukkgBrQJknQT3Tx3ijEYYYRqJXH6s7cUgcI8rhMwcE7zTzrFVq4fv8YP87J
         yDzg==
X-Forwarded-Encrypted: i=1; AJvYcCV9ERFm9jfB33/3mamyOKZYJqi1rtSI3Um/1C1M3Y5FPLeXICr791hBI4K+Z98FG3XUyihoKXVKreaUUPHjPS8=@lists.infradead.org, AJvYcCWK5rf8Z7dHpufSoCiQgsXMzx5MydjRbWOzfqxG5bJGFjYfSHznAJtFR5fJefpoHrNdIGwvHAP0cnnJ0U735N11@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh9CPVHSo2MCAGx3g5YUFc4me4pGiul4q7NmcGbVe+7xnc2Gz/
	dbnMabXa7G4nkAdYFMbCfa61yKOLmRXSCzi5Wj1WGJKEPFadR9wyy5wQ
X-Gm-Gg: ASbGncv1cxmGjzxEqugGhCuRIj+olTnlD+J2NoUX20AtpGLqxMFc2X22pnGskrzaAki
	HDKqlrFj6TfWBRQpZKlQiTucpjViT5uBWm1PfPl+eWFpTXy7dBOF4UMaPu6GJx+vs55RCD1XFxV
	RPpLK6TKAna1LxifoYzXK1hxTc/Mdwxcnqyj77/xfe2PgNe/HF8LkO4dkEwqGHTOmR5hZMgJoKL
	qx8H21cc/RKBf/ZHzC/H/zxwrxdIrURmMubp8wK1b7LGkg7xgjWiP9fk2psNdpgKhvtPgvuZCsN
	97uKKzdP1XPSkHJUR3vKKGajvTV1jFqgeS3AdiQZyahhqFhVke5nZR6s5MWeuUEJKpmcKdrmjLq
	nPrm4OVGtEFi/nVRTpTOA
X-Google-Smtp-Source: AGHT+IHnyqurZxzafHeloJvbM/ETAgSyRUe/eH/yNdQk8BARF2W2S6z0ut2EY9GgmVYWL9DWoqgdpw==
X-Received: by 2002:a17:907:9694:b0:ad8:a9fc:8146 with SMTP id a640c23a62f3a-ade1a9e82c8mr145557166b.44.1749191348270;
        Thu, 05 Jun 2025 23:29:08 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1d754653sm67989966b.20.2025.06.05.23.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 23:29:07 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 06 Jun 2025 08:28:27 +0200
Subject: [PATCH v7 07/10] arm64: dts: rockchip: add pd_npu label for RK3588
 power domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250606-6-10-rocket-v7-7-dc16cfe6fe4e@tomeuvizoso.net>
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
X-CRM114-CacheID: sfid-20250605_232909_987844_4309D932 
X-CRM114-Status: GOOD (  13.38  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The NPU of the RK3588 has an external supply. This supply also affects
the power domain of the NPU, not just the NPU device nodes themselves.
Since correctly modelled boards will want the power domain to be aware
of the regulator so that it doesn't always have to be on, add a label to
the NPU power domain node so board files can reference it.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 1e18ad93ba0ebdad31642b88ff0f90ef4e8dc76f..335b4489691b6299c4fe28342e827f07c920c665 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -837,7 +837,7 @@ power: power-controller {
 			status = "okay";
 
 			/* These power domains are grouped by VD_NPU */
-			power-domain@RK3588_PD_NPU {
+			pd_npu: power-domain@RK3588_PD_NPU {
 				reg = <RK3588_PD_NPU>;
 				#power-domain-cells = <0>;
 				#address-cells = <1>;

-- 
2.49.0


