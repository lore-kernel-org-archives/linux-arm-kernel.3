Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29DA2C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 21:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9j2lA1EMTdFSxUbGh/w2aFGWW404Bip7eSa8WNABgmI=; b=n7KHQe7u9fHy+UO2vJLCDuD5eH
	AHATZRc86cpP6nHDfdQc7QfQiSXNzREGRk7mEc0wQpgzFHBAkL2j1wdv9814Xo2tPSIZcmGZ4IkS+
	tOZHII8Tb/yDE+QhnATJDpbDpKvJhrlA3DY9DZn7MAxyMjBfHrJKQx8WsUS9Xl38HiG0hK8/pIMf2
	MoVzypByJV5/mVgyV7ypfy8p7KdyP+p6GMpJBge6JTIAsaPf7cfkhTjAOao/jO3YjbE30WqLQ9AiX
	pN/g1yBwXw8JJP3qVp1GHRuvaE8maE46ncjl6RnxAUuqaRh9letGr4+6tqrYBEcNNXQOBA2dP8rsn
	FoW50bhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEavV-0000000Al2E-0eSE;
	Mon, 12 May 2025 21:43:09 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEahq-0000000Aii2-3SFe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 21:29:03 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ad2414a412dso353587566b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 14:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747085341; x=1747690141; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9j2lA1EMTdFSxUbGh/w2aFGWW404Bip7eSa8WNABgmI=;
        b=HLY2MtkglxNgotOboC+BcZHWlhs+fXfP/AGlqUehTv4ZrBa1RZs4iKclo/PZrVb2kA
         BFzK7XpIkIs5iGSrcc4Gd3U2cjVuggZWSO98wFK6Yj7S+OUp966Tq20CuljFlq3DOL/h
         Q4NFsDNDUv2na9yjYtMp0SMSKn6A31goPzUra2Y9GDe8ObbBVjXLTrOvLITFxKScVThU
         ZBxUJbOnZRZzN7lcR2U6tt2ArT66bYys7/y5AKdyw8kH5X/nv4qlg6ineFn4dSz2JlvA
         tej1JiTNU0H4Vbe6aT0wtZsAyrMou14zrwpUQVJSibiqSIfkOY42LLDpFkdXJZhi1Tr1
         hJZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085341; x=1747690141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9j2lA1EMTdFSxUbGh/w2aFGWW404Bip7eSa8WNABgmI=;
        b=LtXlb5oEMbZ2DRzxdTz3J33yR6zfVkKGHTkZ6kijoOGZQ+G6xgPUm9AvHk204tmgdC
         aapwh6hPTivJmF/4ktkIb5ZC4AY1/nEf7AM3S6Tdo/aXxZQEPW6rDG5pGBpX8U/vKQKw
         F/PSLtX2c2RVE7IojUPKyIIZ1IdBlZ0XGq8Lilxxra3YtAgoSdxK0l69ZDdZoMr7oQED
         zAB2mQfXCAUBebOqZtbuFT/ubb20+7kI6Sz9uZX6rkO8mn76IhFXv+sYeE/wqNPDJ/3f
         P1vwmFU3ijvl4LZyFsUvA3OL7va/MEARnYdxfNDJX+kb1IqWAJHdIAqZ57l/Ad49L/7C
         hdwA==
X-Forwarded-Encrypted: i=1; AJvYcCXHTRL1/K2MUoNMtOm4yMseFqaeZwsn1axlBL8YwgmL+cTxj0z2eUCBwpl3CcCHbftGaZK+k/JMhtuWZIMezx2X@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8CN72pavlWML/XYqEXXXmREkbq/SRXdYS+zL8cvvVeu0/qaQl
	nqijE48oH+wQ8xKj3qln7L78PSQwFOLKU7YoiIGWidGDJeE/lGBf
X-Gm-Gg: ASbGncuCZ3lRX61dma50LpaNbK1HAo7hHRZF2OAyr+r5TyVdanQSd7BM+TtPvkfhNmH
	p3vCFB3ckPIvk/Z0dxW9O6ZmzzTu6bjYZqbqdVlAwIfeqTsfYryH7jaAeNu96gzs5QW27gtICAT
	5LjgNES4Ef5BB7EPBvc7NNZn2obmUJJHn+TgBGoB4uPGWOXuYVMQw6eisnYfUQ9/fF8677RindX
	d8QjXk61l7uB9wjuk8/fuW5kUsjLL7h83xTHWFV33/TUcvCU2IZwW1K0C2WTtTwrhp+g0vnax73
	lOrg0qFPhUfT0azEpVPKQkBzAt0Vq0TP2lFhidl5HCBxD2hnN7cU8Huem3w+zCrSbdMph9pQMg=
	=
X-Google-Smtp-Source: AGHT+IFOOtRWKQKAOEfYjriWhASXUPsC1Ft2pAi084Z0/XAKj0GzAdO7h997QXgzay9OEo+vZzgtoA==
X-Received: by 2002:a17:907:6a13:b0:acb:6746:8769 with SMTP id a640c23a62f3a-ad218f48713mr1441083566b.18.1747085341045;
        Mon, 12 May 2025 14:29:01 -0700 (PDT)
Received: from demon-pc.localdomain ([188.27.128.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad23a5552a6sm472861466b.30.2025.05.12.14.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 14:29:00 -0700 (PDT)
From: Cosmin Tanislav <demonsingur@gmail.com>
To: 
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Liu Ying <victor.liu@nxp.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Zhi Mao <zhi.mao@mediatek.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: [PATCH v3 05/19] dt-bindings: media: i2c: max96717: add support for MAX96793
Date: Tue, 13 May 2025 00:28:14 +0300
Message-ID: <20250512212832.3674722-6-demonsingur@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512212832.3674722-1-demonsingur@gmail.com>
References: <20250512212832.3674722-1-demonsingur@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_142902_881746_2E6375C9 
X-CRM114-Status: GOOD (  11.69  )
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

MAX96793 is a newer variant of the MAX96717 which also supports GMSL3
links.

Document this compatibility.

Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
---
 .../devicetree/bindings/media/i2c/maxim,max96717.yaml          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
index ab46a5f0bd7e..23f611177a87 100644
--- a/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/maxim,max96717.yaml
@@ -30,6 +30,8 @@ description:
 
   MAX9295A only supports pixel mode.
 
+  MAX96793 also supports GMSL3 mode.
+
 properties:
   compatible:
     oneOf:
@@ -39,6 +41,7 @@ properties:
       - items:
           - enum:
               - maxim,max96717
+              - maxim,max96793
           - const: maxim,max96717f
 
   '#gpio-cells':
-- 
2.49.0


