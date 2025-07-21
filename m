Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB19C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 10:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=petoWFIc1yVrUA7vb5hl0SJbICvldq7drqIuMNaVr3w=; b=Wn5Av5/yDMDelqIG7C4my6Y9AO
	Vq5R4BVm9FNtzAEq+m2iJj4UXchpK4XkXW+4GX5D1mk2hi+BENhZXW8625aA7C2neigIU6nyctWGT
	sMdNaFQ04hMJy2SanuEi5SePEyvhXrfJ8ijiXs6dAOWJI5+jeqbtge8DlGrfBBpgXVi777u1gt8tn
	wkEW3cT3YVbG0PAtCMLdjwnoS2wigef43OJc+2bAdc/UMznNRBNVp24X1Kw1eJ/QYHkXZxmpcRVRV
	GLO5ohIR64uuzzvtt0C2/Nc8Yzo5xUn0nUaSmiQ3Q0GxS/hZzzMFTqhD4hWCkBX5Dk2WFnNhbAaWR
	D5ZJOTUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udnO8-0000000GuNi-00iL;
	Mon, 21 Jul 2025 10:04:52 +0000
Received: from mail-ed1-f50.google.com ([209.85.208.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udmf7-0000000GmMN-20YP;
	Mon, 21 Jul 2025 09:18:22 +0000
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-60c60f7eeaaso7117472a12.0;
        Mon, 21 Jul 2025 02:18:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753089500; x=1753694300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=petoWFIc1yVrUA7vb5hl0SJbICvldq7drqIuMNaVr3w=;
        b=EMbibmeNQ/lR5jdgG4GbabFWWnRn2rXYfv0zTjLnbdGQQSELdYoFCDT5y5nFirt1Ok
         /Uifi8wwVg2j2OPlZ444yN6H6Ur0I/ox0c07UUM5f6ZXr5CS91/4Ixbfwtg9QIDZt75u
         JKoR16quKrYO4MN0MP5ds8S632URmfaaYmGxomPDIXRRErcLoqwOBPxCKuuPIFOPzMy1
         puOEzJLFTluU59+tkqT5TGLQ383QCN1Y4jXP039qUEqfwCsfqi9mZrbMNzMF077cvYSh
         m5eg6lH22NNoPEnmWSyvhkCFbx/WNnjc3icGN8kjaYsPmXK+0gcfOnsavRCH/8Ldc+JO
         QFUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWr8ol3c8RhuKZ7mgw4tg/8UdnY4hAvjn+m8Gu8RJKvsQWu6vBjyt+xDTNmUJ2ZAVvC82gKswziELAgsBHKRkhN@lists.infradead.org, AJvYcCXm+GAptV9d19h1CvdNoG0YPandgjbvgIyMPExjporEHf7M83Lja+RlRzGIx38YvoRu0vobjtgZK5goieQrv6w=@lists.infradead.org
X-Gm-Message-State: AOJu0YzkGrFZxPT/Iu876TWsU+BKkFHGzMp04vS/+QktzNi74HB24Rvi
	aJFJwCqq5pEqtYHcHKEoQbeY6H2+5JPnTsFepK0+qddGyYaqikAb1cyR
X-Gm-Gg: ASbGncsockj8SuOAv5dWRNjK03g4L4XBL4M0MRu8SlIQc+lpBmRr8ouCoj0GeoMcdI7
	9OVKuiYbY3P9bRCmMP81+GgLlzaTdUShPXt6Q2TooyR8UJVq0mz8Vx5XP92Uj4QfiX7a7Vsmza9
	aQdxjI1B/4oyt1810IOCx2p+WlMqG4HSSIJUK8jZol5tESZWCva324LH6EQP4/QU2w16XhoWO29
	BqIZ67m5UzeeKtGFKwhzB/icOXCbs14M6e1koTtydVWimZ6TBt8z0a0xrXYRaLr4k2YI6e5WSXb
	TZDsRsSwNH2sO+roctsDaEj+YfGVWyimdnKF4o2722yCpKLhV3LuwlwkHiq/ont+ist/ErAk6FR
	TuSGGfgi6I2bMis2byvn4c1FLJNslEGdc8nx+Tcc6jERJiD7RKccbykUQ
X-Google-Smtp-Source: AGHT+IGczU3qNrxFunoCGEDGeA0G1E/ZGSoC4F1+GJF6HBHUDUmYhKpCzIqdyOaA9bUQmJSSnrGq0Q==
X-Received: by 2002:a17:907:7b8f:b0:ae0:b33d:2a4a with SMTP id a640c23a62f3a-ae9c9ac0695mr1863454666b.35.1753089499696;
        Mon, 21 Jul 2025 02:18:19 -0700 (PDT)
Received: from [10.42.0.1] (cst-prg-46-162.cust.vodafone.cz. [46.135.46.162])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca2efc1sm643125266b.83.2025.07.21.02.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 02:18:19 -0700 (PDT)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Mon, 21 Jul 2025 11:17:34 +0200
Subject: [PATCH v9 07/10] arm64: dts: rockchip: add pd_npu label for RK3588
 power domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-6-10-rocket-v9-7-77ebd484941e@tomeuvizoso.net>
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
X-CRM114-CacheID: sfid-20250721_021821_524461_A80C8F19 
X-CRM114-Status: GOOD (  13.76  )
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
Tested-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 70f03e68ba550d6b9142131dcca86e8ded36e2f1..1eddc69fd9c9ed95cdc810ba48d9683e3f82489a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -841,7 +841,7 @@ power: power-controller {
 			status = "okay";
 
 			/* These power domains are grouped by VD_NPU */
-			power-domain@RK3588_PD_NPU {
+			pd_npu: power-domain@RK3588_PD_NPU {
 				reg = <RK3588_PD_NPU>;
 				#power-domain-cells = <0>;
 				#address-cells = <1>;

-- 
2.50.0


