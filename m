Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D876C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 20:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BUCZaITB+JbIKX4CqImv9IU6yGF5XIw9/F8cQCdwhok=; b=ahJ6B0g+kzvAZOct/54TYC4KW9
	2ilbNEyqy/aIm8TKuBYCPmJ3TkOeXwW5B1CarjFgD4rLXCU2R5BbKZGvauGV91PkZIWLr/bO2Cg33
	bF8lbj8T4P9BgGSs1oHrVGSTe/YxhWoOMKGHuZPNF4wdgQELiMdmaB8tw5iKMao3ymaWOSGZ8e1ok
	C5Ooj3BScPQJ0uOGS064XobEogcF/IfTkV2L7N20HsPwt+GUxwl8QRAIZsAlyOpiCZD1L8UIW84Zq
	3m1LWSD2Qz90Snq1Hf9+W4ZTjiQKeZmt9AJbwjSKkyuGu0paZSWAE3RudDbDHkSu3g1xUAfcUz6ax
	bwUM3Nbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXQzX-0000000CTGA-2GSx;
	Thu, 03 Jul 2025 20:57:11 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLbu-0000000BmGA-1yDz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 15:12:30 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-553b82f3767so12129e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 08:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751555545; x=1752160345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BUCZaITB+JbIKX4CqImv9IU6yGF5XIw9/F8cQCdwhok=;
        b=lWUIxYSi0UtWVXXYp8uL8R7dgcwBKoo/0rGzTFGOnKBEPkFsfx73KEI+hiqGnLQ1+1
         hJTaphziqEJTT8luLJJ81Y1fXEYZMppGLhs8W5sesr0q/20sT3bueleL+EdHsJmVh1+l
         n4zIgS7xg5Q7n5HA4N04PUdd6+tmDgq/hqlfaCB5eIAgtlNUhyr2Bq1Q3qiUyo79tn5r
         ZC5Z3QfSCjzMrTJSDeUqgMtSxdkJscVz/Kkyr+WO7moVkIf7H/e77Hfh4Ml7VL7PrBpJ
         eUQBhTgJ7eJMJY+GfIpVp0gdqtHyRFFYJi5AWuYxVRF+Wk+HlnEnABmjq24U9nR9J1Tg
         yPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555545; x=1752160345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BUCZaITB+JbIKX4CqImv9IU6yGF5XIw9/F8cQCdwhok=;
        b=T2B7aN0ahHopUC71B382FqRn1ZiPWC9VYO0OuVd/tDHjhH2qIBGh0Vzk/I2oC5cCyS
         wtthFIWJG5VusmZwI6lkQcCZKr7AjVJCjkNTfe6VmdHfSxAmHE8RCX0ZUYqXgmTtTLeT
         KPWrYRr1+IouSjqJ00J+S1MSAy5K5GFz3J0Ux2pnBhWAk5qvyfjq85yIU77aQdIdrJpl
         jHJ6WTmvFHiFNC7n5X3axzbJ4eMN0RQDMxFAdczhPvSPxks8tIZ39275ZndlJJewOjRu
         TsGa/x8bH+xgl7XQkwF4a4Ti8ReNzBEoKPi6LuTT36qfT6EtP1zcwJbXHHKcpDywH2Qp
         8+/w==
X-Forwarded-Encrypted: i=1; AJvYcCXa3oo+l4pv+xjqCIrV1haeuln6Jt2yx/jXb9wgla+qO6UbF2oQ5ADmuVWqIOKQBefwcPaCestMTbZDkOy7QcNw@lists.infradead.org
X-Gm-Message-State: AOJu0YxLEmJ0B9VujxrknNeMYEcs8LzzbEN2mv8NNdUpVgBtiVs13Iu0
	lm/Rs4ZrnAhYrIwQn0Ad7Cpn6O/r/tR+I4mgS4/3xLfH9Z6PjFhQFQMU
X-Gm-Gg: ASbGncuQgQgyF5RuDxM9as6VeIM41soKwhtyfccgkcCzi365LzH6Iz29IQ2w09r1TVQ
	zjr89l3fo/Zh3JeB/BvD8j7TMB50/xS5ei79jmLdFC1kEiIhG4JCpkLY0kMivJCeKxj0h7fQ2st
	FmbmdkTDO4Hl8v6ib4tlhfs4Qs4I6PgyK6b9r48/nbfpeizrJLepQ+MOTj6eRBbF70MCbpKaIex
	Q6/33EzL14kEuVTxqFfh/yG5Eiic+LSfw5c2q4O+8H8v3jWuU2bAh0rSOuUS6lWXRCY1TBL+wqS
	V3qqwC9D3b+RCcDz0fCzq31HZCTkNUBrQTytdFUpd6RYm6fQBuWI3/3cFRoZoeqy1u63pqqmljg
	sJnCksQ==
X-Google-Smtp-Source: AGHT+IHZy8BDgg1jwQmCpKDukxqhrE2LVb6Ay/AY5cKY8tq1yT7pP0bu22FEBsebRudNWJpZ7jrRNA==
X-Received: by 2002:a05:6512:3e22:b0:554:f76a:baba with SMTP id 2adb3069b0e04-556282e0d4amr3008654e87.3.1751555544426;
        Thu, 03 Jul 2025 08:12:24 -0700 (PDT)
Received: from localhost.localdomain ([212.192.12.80])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384ae15esm725e87.178.2025.07.03.08.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:12:24 -0700 (PDT)
From: iuncuim <iuncuim@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 1/8] dt-bindings: nvmem: SID: Add binding for A523 SID controller
Date: Thu,  3 Jul 2025 23:11:25 +0800
Message-ID: <20250703151132.2642378-2-iuncuim@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703151132.2642378-1-iuncuim@gmail.com>
References: <20250703151132.2642378-1-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_081226_508767_C7ECAE2D 
X-CRM114-Status: GOOD (  10.32  )
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

From: Mikhail Kalashnikov <iuncuim@gmail.com>

The SID controller should be compatible with A64 and others SoC with 0x200
offset.

Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
---
 .../devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
index 4424c3c5e..f67470b8a 100644
--- a/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
+++ b/Documentation/devicetree/bindings/nvmem/allwinner,sun4i-a10-sid.yaml
@@ -27,6 +27,7 @@ properties:
           - enum:
               - allwinner,sun50i-a100-sid
               - allwinner,sun50i-h616-sid
+              - allwinner,sun55i-a523-sid
           - const: allwinner,sun50i-a64-sid
       - const: allwinner,sun50i-h5-sid
       - const: allwinner,sun50i-h6-sid
-- 
2.49.0


