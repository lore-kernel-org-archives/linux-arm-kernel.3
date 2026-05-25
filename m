Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C039CD5BC9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 14:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MYwtJECaHP5wUeZHKflBOjjaT0Cdv+xswmxDcx7ZgJo=; b=Hme0n3ptFK8uCT8rME5m0VVT7d
	xZs8NpDe7eoeYYXX8lbbuC6ywfBs9SfLzK7chwcAX+bVFTzuoAEgh3ZU0OJLFUOuOssZeMGfEzqHV
	LgCsn5InlP6VKoldjOiNEle23lUnKZQHdj1WerP/iS5YU5KHY/W/hirVYCibwAi5q3xq2YynH9dyp
	DYHIxlWOgS5tlPcB9fzUasMedIv8dO/2fOt1PKPvsuBFyyYOlkQaVjR2+RJovTFiNqO6xP6+keDrx
	p+SziODrUDjSsRZqOsNNferakRKj3LDSFG62Lx4bDzW6blVjfi2MGBDEjsSELEDbhd5FNx5eN07gS
	cf6hgw2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRWaU-0000000HRaA-3rir;
	Mon, 25 May 2026 14:47:26 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRWaS-0000000HRZT-2PWr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 14:47:25 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-369576666d5so4580842a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 07:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779720444; x=1780325244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MYwtJECaHP5wUeZHKflBOjjaT0Cdv+xswmxDcx7ZgJo=;
        b=O40iXUoB0sM282cDeCfCQo4cN99wcBs4RV/Nu2EEDKbREUDnhs28c54adjNHnJ9pkx
         F+RdD+aaTHFuY2FeQsQFkwq6ZlWYQ1iqBgRvEEsR6uzmsTnvGWVKZy2I25DRK5y1VyJj
         04LeVPqDfbQwVIP7Qm1uJWgesg/gUPil69/xuJV4pkke6l6o0Ot4C81h7nnMNuTN7Gse
         6tC5mKWI2ohWKgY27BX+hg0JXfpJqUzFFHw3FGlTxRU39l9nU5/eY0DnFvzWm+pUKMbb
         jGgboBjbVyIZSGIERU3zPCycsWcFc/L7owzu5tBW/wjzJba6/0GjMRYENwY1xgGjpHpj
         yk2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779720444; x=1780325244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MYwtJECaHP5wUeZHKflBOjjaT0Cdv+xswmxDcx7ZgJo=;
        b=hJxdimJHcPmmvlwbU8+7J7MxiJq+9NiS19PhvxCQRFrGQtCKwpLjJLhIIhBzIT3fjY
         plasshJTfsaNPh/UAQXvOg5dnD8njH1+stL4YKJ8pwsCnZ51ARQGsJ3z/eEpHprUyRbH
         UKy7X5QT7h101pjwqpKavDjXvw+HNQzpv2l6wBYZlUSpdK9THLFkNYqF7RLvOUahQj1d
         rc1Tm/dZk/i+Gc+gzTMKDNWq3KDUD7oxvDyrmMXhuLKGWZibLnFHPBXfRhTv0A+jBIc+
         Lfy8c9izkW4v1oI8enNP9XjscR/N2U6FWWi+JplY6r4cGrMz/noqNrPRi1PZP5q39txs
         nGWw==
X-Forwarded-Encrypted: i=1; AFNElJ8cVFMeLEu+ASIANEfm1HbbdNEOYkAXJ49IFX6EE2vlFZQTWnbcCyfXeawQj0iwR5kt2cM+hL9tkUNZkBRhmlp5@lists.infradead.org
X-Gm-Message-State: AOJu0YyGrYUb8HG/qajBJDh5TbskxehqYrl904UP26pzOEPoGMNKniHt
	Bq7NAQGdenGtFIlgKKoKvzpNrNyuPLa16bvU0hIU2BD6QbCqU5cKu5Cl
X-Gm-Gg: Acq92OE3yLuM167RV26bqREmLGIvk9Kspz30WHMkUxPhrE6VKPOElDGqhplIIZR5niZ
	olQmTJBETDwBRyQ1j/IY0Comdt2958dI+w5q/iOlkH5XzjfKF056h+FgqAPs+B2ptwo2tDMuCLn
	Ajfk3wzM+8kJIF35lFEHr5bskxsWHof4hiJI9kG7CvciiPc26Et5Q1lDF6bmlXnYyjxkV3SKRXG
	UkPyvpF+/d3jwwFoQ+BdiBnAUqMHixZUfd+Exnvt96yPI2gDZQyXN9aLt21eNsnKr6svnJzlrUu
	+pket0vFgyooS5OT4L4TQbyojqqYPSv15FUGe6MhLjWGDFiDsKXPdAEYzU66Fk/B1+tKX2ug9at
	fTuEw14WgIjZqGHRpWGXQhU29vuIKQ5aIknQZCpjsYBsVBL+JIgSg1PFaJ+4SF8MVBBwXOKuoKx
	WnreCHUpBHinFM2MfvyWxgoJTcTh3ehJlQ9C+P8tQ=
X-Received: by 2002:a17:90b:1b07:b0:369:a9e8:dbf5 with SMTP id 98e67ed59e1d1-36a6749ea42mr13774833a91.3.1779720443648;
        Mon, 25 May 2026 07:47:23 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a5f:4fa1:cc65:18c0:209b:38a4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36abfe17c95sm2721993a91.0.2026.05.25.07.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 07:47:23 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: linusw@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Wei Xu <xuwei5@hisilicon.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v2 1/6] dt-bindings: leds: issi,is31fl319x: Update description for the shutdown-gpios property
Date: Mon, 25 May 2026 22:46:07 +0800
Message-ID: <20260525144629.498630-2-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260525144629.498630-1-jerrysteve1101@gmail.com>
References: <20260525144629.498630-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_074724_619488_187E1013 
X-CRM114-Status: GOOD (  13.37  )
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

The IS31FL319X series features an SDB shutdown pin.
Driving it low (active low) places the chip into hardware shutdown
mode for power saving, while all register contents are preserved
and registers are not reset.

Update description for the shutdown down (SDB) pin and fix the example
device tree binding.

Fixes: dbc801b472c1 ("dt-bindings: leds: Convert is31fl319x to dtschema")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/leds/issi,is31fl319x.yaml        | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml b/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
index 906735acfbaf..ebf2bed51e7f 100644
--- a/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
+++ b/Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml
@@ -39,7 +39,12 @@ properties:
 
   shutdown-gpios:
     maxItems: 1
-    description: GPIO attached to the SDB pin.
+    description: |
+      GPIO attached to the chip's SDB pin.
+      Driving this GPIO low places the chip into hardware shutdown mode
+      for power saving. All register contents are preserved and registers
+      are not reset during shutdown. The chip exits hardware shutdown mode
+      when the SDB pin is pulled high.
 
   audio-gain-db:
     default: 0
@@ -174,7 +179,7 @@ examples:
             #address-cells = <1>;
             #size-cells = <0>;
 
-            shutdown-gpios = <&gpio0 11 GPIO_ACTIVE_HIGH>;
+            shutdown-gpios = <&gpio0 11 GPIO_ACTIVE_LOW>;
 
             led@1 {
                 reg = <1>;
-- 
2.54.0


