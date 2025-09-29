Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41C00CAC5BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 11:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0mIMwirLGWfi6Q5dJnPwjrLRkS6cp6VZXhnc2huda+M=; b=IbS+J1ejQ4s1quOxevveXOc75M
	ADjE5dq100hykp0adMSubLO1wvqJhvniAMltErWbhgDyhy8ZCD3FcYTJVGZwSsYlrvEgOAph9BfBI
	WUoe8uL7IYDHDhqSZUy14+GPjNeRuS/ShvHpaEwWklmQg52hL5gN7ljGs3WrFoOyOMiEJvT4rHq+T
	0DaJYPxt0a4fp9vLDsrlpm866nH/1A9qLsUlYXQ0oyU0WEGhaTvJJTGOTk/47qnbre89szmfi7H/m
	FgQRW11LBfMahO5wKp4Duz5tk7cNOnzWmNIPMnmhkwIPFDLZij6FfKdQuVdnpxje1BEe29gBRdVV5
	czc6fh3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CNq-00000002Ocb-2x3Q;
	Mon, 29 Sep 2025 11:49:34 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CNn-00000002OYm-0NYn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 11:49:32 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-46e3a50bc0fso28853245e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 04:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759146569; x=1759751369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0mIMwirLGWfi6Q5dJnPwjrLRkS6cp6VZXhnc2huda+M=;
        b=a8UwSuaK+CHP4K4oCpXkcne78DvupsF01rQkWgLfgPpKHAPvRKaphAzOd4LqN2lahV
         kiOssMCtjbltL3Y3TtuaMN5Hdygcy0KIGFwr4WXgQq6I6iLKxwayPp7Hbgtevao9mb43
         NGgRqgzfyaxdCe2JXM1EV9DrhLxdC7AzGkyCTmBF/1Vc41PX3guX4fKq/TqQjXmFdOS7
         H3M+lmfmhYjHTjsj+fNlYMnd59TKWovED7KgSWn8yyQjUxv6EtAVW5vBXlzycntczLBD
         gLYVoTTemmlb19fpCwTErJAUwfk3KFVM74yTepV/jflth7xlNdojXTswsa7SI/3uSuYL
         waew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759146569; x=1759751369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mIMwirLGWfi6Q5dJnPwjrLRkS6cp6VZXhnc2huda+M=;
        b=aZI0770FMh0k2d0q/hnUixaX1C2NzrNNZM0JS0mfylCB3xs1Cdp6L7FPOSQ2B9WRlK
         EQyhMuF8C584Rgt/KpfxSJu7odWEWrla1Eqci9ON0XBkBNotFWEnMhsUVgJVBj0Gzlhw
         VXxarA65gckCFsMLnYM5JLmfUuvlqXCwsRx8vJMBoXuCiGlXZORb/W6+9LTs9veYusF6
         uUpnOt11SoeoS0aD4IlYUul+0KnXtwzipYYi0X6WHtou0p9m/3Eh3AgUdMuxVS11mClN
         20TlH8Xpfhdx3abQo+40xfLocQZ1aqMYZg+3xpdpk8rpELO2OCDkfgtL4fvTetTlqM8K
         z6TA==
X-Forwarded-Encrypted: i=1; AJvYcCUaQdsKzYdzkuXjCWo6otYx0/64Pwvb8epealUrhp2Zruaa50eqKgywvw8huCtpi080y/nkx1eaeQP0CL8irVzJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ2hfava3zAF0i91tuGx/+0vbAgYY0UhnCD+9plUmmXJ+zVNR5
	REURtj6uF9ijhmXFlv08a2GT/tObFFqC95D5Vw+gM0xPIdabaji+5RwI
X-Gm-Gg: ASbGnctII6oSxWEA1P5j5agWVcvNL+ZVeObMcyMrsZckbX6WLtDC93GipnA6pi5OLom
	9qdDpfK/LkRq5JWz6DvMHAEilWz3Y3ojZRDPnLawCcZR0PWGlTRgIVJ1r6X8/Ip7Q8ba4KQqkh7
	JPr921K07Joyyt525QgZwb1w4CymdG/+khFecOz5bfmq8ZVWghVkCFaTIsf1/ribOlHOuvLfXMV
	oPETsvR4HsXACXyDTujxuPUv1IkpXKqGpJhjY7yZHGm3/8vQ5ZVpvQifI/XTvVQuerZlBzUq7ml
	hMbQWFrb+GbzPgU1qqDkZu23i7YuORGCnSCi2vKoyYhQqapclgUQEw+SrJL5t6DAgkkt3tMEEWq
	ERmZt809cqwuxjT8IPv7GXFWUHGTTvtl3Mbl2FZAYxqpTRjsUjVH64xMttAOaTZjQtdrYohTsK/
	UCOz3/Ag==
X-Google-Smtp-Source: AGHT+IHHeeXxNQFuhvyiL0e2I2I/uphT8IlYRgLGojEB+ic7yYz9UM+mWAZxKobXSmkeRjFhavSFKQ==
X-Received: by 2002:a05:600c:19d0:b0:468:9e79:bee0 with SMTP id 5b1f17b1804b1-46e3292ea3emr151179445e9.0.1759146569045;
        Mon, 29 Sep 2025 04:49:29 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e56f77956sm10030835e9.20.2025.09.29.04.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 04:49:28 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 2/4] dt-bindings: watchdog: airoha: Add support for Airoha AN7583 SoC
Date: Mon, 29 Sep 2025 13:49:13 +0200
Message-ID: <20250929114917.5501-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929114917.5501-1-ansuelsmth@gmail.com>
References: <20250929114917.5501-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_044931_153298_7F95705B 
X-CRM114-Status: GOOD (  11.63  )
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

Add compatible for Airoha AN7583 SoC. The implementation is exactly the
same of Airoha EN7581 hence we add the compatible in addition to EN7581
ones.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/watchdog/airoha,en7581-wdt.yaml     | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/airoha,en7581-wdt.yaml b/Documentation/devicetree/bindings/watchdog/airoha,en7581-wdt.yaml
index 6bbab3cb28e5..6259478bdae5 100644
--- a/Documentation/devicetree/bindings/watchdog/airoha,en7581-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/airoha,en7581-wdt.yaml
@@ -14,7 +14,11 @@ allOf:
 
 properties:
   compatible:
-    const: airoha,en7581-wdt
+    oneOf:
+      - items:
+          - const: airoha,an7583-wdt
+          - const: airoha,en7581-wdt
+      - const: airoha,en7581-wdt
 
   reg:
     maxItems: 1
-- 
2.51.0


