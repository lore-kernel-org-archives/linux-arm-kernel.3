Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2B2C3ABB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 12:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/UmkYBDuhm77tmexgekeXNedIehqsLYbAaP26M4i/3g=; b=orkJoDGFpE4KmG5Cwuv+SwVhR1
	87ZHpWNQ0Q7dmwwwu3MtLcjs0JLk5KLuz9FTQvKI24slRJ6xf/vkvGEEW35JALbkhckjKr3Gwehr9
	ejAJLsMaCJk4JtxoYvCWQKZK4Qn7dzOXjsdsGOLVHxoBUGfTrybVmcTAgFJW8C3iHB6jP0xCnmthm
	IYlO5z5ToFZSEz77UKH3lZ0ItP6nCkSUoSdJmsJvyBi60lsMs+Tvp6ABmnD/jZoITnkBsclBN4w8K
	Fz1JzLIUpvm8AARJ8MWYG1/fKUPYp7ksm64G5n08E5Iui25HtrhYYiHQOGPdDaz0U+uy30RLAl0bl
	xSMPgKbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKFlA-0000000D5li-1bdD;
	Wed, 28 May 2025 12:19:52 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKFel-0000000D4TK-426a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 12:13:17 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-ad8a6c202ffso60434966b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 05:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1748434394; x=1749039194; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/UmkYBDuhm77tmexgekeXNedIehqsLYbAaP26M4i/3g=;
        b=KiN/IM7ITMMlQy72kEUIPzaSP/sbbUbAJWkwD+avlSDleBaEkObeQhIJwE8sVwFQ6u
         dY2EqDzlfsmCAh1RM1EYOg8Blr3YyfiacWpcRlyWriTrGlXFjm5qeALodgp7T7aa1/90
         6ZOAgT01IYgl326k1qaqwZcNN7Nkqx/NNffkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748434394; x=1749039194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/UmkYBDuhm77tmexgekeXNedIehqsLYbAaP26M4i/3g=;
        b=mEP7BX6xb4KvBYNiD5hMiTzJCLvJglVeyWYFznWs0A8Vjl+AC81tolz0CNPUqUMXsM
         DfwMQbwVyVTAvcOvC4ztvk2UN8+yoioxTeheFN7DHjj7/vtBWj7Vs2em3iSfCkOBKxmI
         B/ch7BFbD9309uISRXI6AeNmuPGp3rzo2cFQLGQSGlUQhF6uQcuLjAIKaRyyaMfcpqxT
         cq+6hmJoL0oykCHGYGhc3FNucvSk60JRhxGe7ZP62eWBytJbmmX9w9gMfExQD/HqHXV2
         CKXzMRS875sPGisjzea6z3U/DP+i60bL/S5cwehG2uddpD3i1ra9TfS56rXDhcL3bt+z
         NXZg==
X-Forwarded-Encrypted: i=1; AJvYcCVN1nX7UxERzmtt3sZpKTfvDuaVO2KXCogZpgSAyvboYM7dMgz/K6A/DEnCPevQC1DY9z/juu8eoEzSgtIHWV8W@lists.infradead.org
X-Gm-Message-State: AOJu0YzDFuZligiFmwJL22i6zHuCbpl+AMC6cxswNpQhj1ARt3c0FzGL
	rxLKickF52q/gV0YgPXD6mdmxefpch9fvZDJ51uscwERM/Ry6mmO/O7QvXSB4W2Cf/4=
X-Gm-Gg: ASbGnct3f6F7NAVDHHVguI/Ty8N4nSUMhAsKqZd81Pq1PEU2/cJRkrQWiGqIhXxmaNc
	leUB4s9mjEfyD2RyLn2eWWvtrFi2qe9N6D2aG8wnOi7XjXQZTVKVqQKDKjTWX1KI38Qk6NdLu8u
	BfgAoP9SyeM4ehCtCCReu1uImsjJN/POfamwaBWgj7lDA43rqNfjvToB/MYFMG1wQ3cwtgvuMyg
	gb9hcgPU87hqlvOWaQCF5tJwRO3pJjnMSqqPZeFU3S/4QoDBXaM7bPXkzp6lF2+cRhmqNjVJlHa
	Tobue5NMDhLg9P7twyNRu3//DdDpglMoiQWBDRBBhZbGKcBcPhBgtI2g4w9ujNU9tzqZqkX94F6
	xA18ZB+bxooRF
X-Google-Smtp-Source: AGHT+IGX/l3aYv50yZQiAwumavns5Baq8oSOepnjn19OavmavGdcIsWU1pqdCC9aSgoKvq+TMQezmg==
X-Received: by 2002:a17:906:f58b:b0:ad5:557b:c369 with SMTP id a640c23a62f3a-ad85b1c2be8mr1532953166b.33.1748434394098;
        Wed, 28 May 2025 05:13:14 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:5631:61bf:398a:c492])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a1b5b8afsm98523266b.170.2025.05.28.05.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:13:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/4] ARM: dts: imx28: add pwm7 muxing options
Date: Wed, 28 May 2025 14:11:39 +0200
Message-ID: <20250528121306.1464830-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250528121306.1464830-1-dario.binacchi@amarulasolutions.com>
References: <20250528121306.1464830-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_051315_998180_FF7906BE 
X-CRM114-Status: GOOD (  10.63  )
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

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm/boot/dts/nxp/mxs/imx28.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
index bbea8b77386f..ece46d0e7c7f 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
@@ -755,6 +755,16 @@ MX28_PAD_PWM4__PWM_4
 					fsl,pull-up = <MXS_PULL_DISABLE>;
 				};
 
+				pwm7_pins_a: pwm7@0 {
+					reg = <0>;
+					fsl,pinmux-ids = <
+						MX28_PAD_SAIF1_SDATA0__PWM_7
+					>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_DISABLE>;
+				};
+
 				lcdif_24bit_pins_a: lcdif-24bit@0 {
 					reg = <0>;
 					fsl,pinmux-ids = <
-- 
2.43.0


