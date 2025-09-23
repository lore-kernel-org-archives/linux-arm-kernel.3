Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7C0CAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 14:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BIxVfZFoAEsIwCtiKpIw9ltXsqh5nL/d8yl3mBu/8Nc=; b=ueICZCLXjXLoaxLzBjG24NI2M3
	fuRlLSWaM5ce+UhTvS9STaI4HO/2u0xNpbu0aigjboEob31Ndk6nn/9pQ9JBeZb+QQjFYqsqJ5jeI
	fPD9/ZVPM6wUmXUjeJibMhyplQ8IduVJpxL5aRKRnZAF7Kw97m0aWQ9HZaS70LPR/CJDnGhK9rgFx
	5pyh7UD/Xrys9zRWUCgoPP2iWq1iEOloC3upPzcumnAML5j+ijz4fEUA6d5B5iYqhYhuKEcYILBH9
	w261AjozP4/WPUI8V5TnCgsmcdJ3UkfJEctzM2h60VjkEazBMN5m4DYnLShr2tBvZInC9HJNUsEbI
	ze9dEYnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v149n-0000000Dpb5-1gc6;
	Tue, 23 Sep 2025 14:38:15 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v149W-0000000DpJe-3D47
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 14:37:59 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b2b4096539fso377035966b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 07:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758638277; x=1759243077; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIxVfZFoAEsIwCtiKpIw9ltXsqh5nL/d8yl3mBu/8Nc=;
        b=kHypUJq61DmgCoyxiQxdwSUv3mr6QOWZFsmEEYg81TGDcg3yCrHSRQac5Dpeo4kcBn
         9YR5DfYC1AYf7wRALKK9oRSWvIBjbd5cLGnYv//UkP02Bl58TL8zyVxgf7rC29kZKtdj
         iccOP6X7xQJYDBdJw9CtuaYSl6USsOetmWxQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758638277; x=1759243077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIxVfZFoAEsIwCtiKpIw9ltXsqh5nL/d8yl3mBu/8Nc=;
        b=a7jn8akarpCFMTOjYZb9g0ADVpTh2CiKGFTaaJRoOWmJm8QQ32oysEE4fuQgJkEqu4
         eINLnh2apCJvN7fhQQNFIO5JtHFCyihya2o51IrjvmTpagyXYCqmmj8+7fgBzu6UnpjJ
         bcNdo2vFSZ8vQOCMBS7F+WVO65KsS2RfwFAynOTO79BeU6DNe2da37kkOQQRGVEdKWLM
         uFRfbJvlPFoQkZc5NNgJ78JALoYrZlbKogAmGONa0wPLQkWcUVdtVXnq6lf4qe3Wv9H3
         J4+p720sN6cCyK5u9qJ8kVmaB9kRnTcrgEtwLOLXIxrM791OzLXS6io6TtyGU3lcM8wi
         jRiw==
X-Forwarded-Encrypted: i=1; AJvYcCUPBRtYHk0I6HdCb1gbWSGfLFO15mm1BDJ7jFsav5HecergZbkvgZtRl4k4DWPd2O8lbzm60E4dH82vlsDOQDIP@lists.infradead.org
X-Gm-Message-State: AOJu0Ywf14FYsgt1fb6Y9OGEUkR79uWMdwzQ7vewSyKWd9MOaY4RBaCb
	br8lx54wWyeXdOZ2deD/JKfmdAehanHCSX2dahn0Lepr0E3zfA0wZeDeV+xNWjhm2s8=
X-Gm-Gg: ASbGncuDmw/UQasE+91pgbZbFrG6lXd/+zydwQJj+JGxWLz6KK4f6Nz1+77eSVkZ7DY
	5fPaSlkXE6oTUYYfdKnahtgJRDXrvGYMpHA5nZQtdCnpH9DIlRJN52y+5+majneKwENoiLzMtI9
	HH/ewXBKrMZr51WcqhwvaIen4ZQp1cLMp5qJ1YotnjX9X159MbRMkVkEx+rNguyDG6ujfIjWHWh
	DQKmdTwkJHxcjdEwiVxdLXclxD/SOyhMP6Y5IaUcu5bmMSptVppSYffJgfOjOXRqgEkhV+hvx1B
	1c0zDu1wc0ujZevgZsAgmLXor6WBnfGbLsRtupdGD0cxKHhnPaae+kfVABJ9yqVjoKRpwVcMMia
	tkpmaE/Pgg6Kk3zBVbvYIKAD+iTVvC6s5IAHRb5pQoLVyN4MKC+DgTrwyoqUgXdOTs30nDt6LBR
	r3AHbMHF5cHzmPb/ckcz455uoB0h4pu07UyJgnEI66XNxHEdFDAZrxZnb3pS5XfmZPjP11fp2mg
	8I=
X-Google-Smtp-Source: AGHT+IH9SMkFkR71Kx+KKn5T55TYlat8HlxhxiB+GViGIA9Vt0hQfUrdnZ3e8AKspkcyGYH3r9r1+A==
X-Received: by 2002:a17:907:3d8d:b0:afa:1d2c:bbd1 with SMTP id a640c23a62f3a-b301e5ad661mr314613866b.30.1758638277092;
        Tue, 23 Sep 2025 07:37:57 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b2a2a5f6c7asm665204666b.28.2025.09.23.07.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:37:56 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [PATCH v6 5/6] ARM: dts: imx6ull-engicam-microgea-bmm: set touchscreen glitch threshold
Date: Tue, 23 Sep 2025 16:37:36 +0200
Message-ID: <20250923143746.2857292-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
References: <20250923143746.2857292-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_073758_816032_F58C616A 
X-CRM114-Status: GOOD (  10.72  )
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

This way the detected signal is valid only if it lasts longer than
62 µs, otherwise it is not sampled.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---

Changes in v6:
- Rename touchscreen-glitch-threshold-ns to debounce-delay-us and
  update the value.

Changes in v5:
- Add Reviewed-by tag of Frank Li

 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
index 279d46c22cd7..f251a1028355 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dts
@@ -154,6 +154,7 @@ &tsc {
 	pinctrl-0 = <&pinctrl_tsc>;
 	measure-delay-time = <0x9ffff>;
 	pre-charge-time = <0xfff>;
+	debounce-delay-us = <62>;
 	xnur-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
-- 
2.43.0


