Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3621FC72DF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 12:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CAxjuWc6K1jt8cRne9eiJroow903OnF7+g9JiBxwTFk=; b=091vnZU4GDMhYuCaFVI9080d5o
	578uRSzqzxS8Q+VmZl7BKtmmJy9FWhK525/DC+LJk7ySlNWiGyHM7FSmbL80S9Csi0fWXdXYA4eiP
	LWcd4YooG3E3+luWrOrV/PRRZwe9KM1OEzW/cMQkVaBI5w4t1c5Zq961J51MGLaKBYKYBppYW5bj4
	zrUwTOfo9b/kMsfkaUkOWRH4k5I4cKTq0V+3xRQSE34F6DdBQWZfP38F0HrM36iU8O/Kvqy3+5/gU
	afj7gqhBVi9zPFb3G/GAanylvl7yYLgt1bJ/0kb/op2tx/SsPrB5a5PfrUZoUPvI+mizc6qlbr30o
	mTgU5kaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4edG-0000000GiMr-37LU;
	Mon, 23 Mar 2026 12:43:46 +0000
Received: from mail-pl1-f181.google.com ([209.85.214.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4edC-0000000GiLA-1JsP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 12:43:43 +0000
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b04d051664so35880445ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 05:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774269821; x=1774874621; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CAxjuWc6K1jt8cRne9eiJroow903OnF7+g9JiBxwTFk=;
        b=GYdOfsjzGg/WliCQ90eRusknoRU8/0F+s1wAoLrDKtOm1xvtzs8+le8s/BnttEN59j
         U78F61jyqfNxOsW6LIdeZmOVW/tWdU48426B9k0LgOnlwbqPTOkUY7YDrcDjec99axZz
         vZGVsrRIh1GPrAB/WRyfP1fzNUBQOiVxSbSLkpJpp1iIYyczlvNOfOvvovfl3y8L5euj
         LvrqARKWl6FUKuSqill+xEb3Qa0ZuBs1Z7Xp76w+/0Ptg9DjT/wgpEu0gBSBHOfIfBNC
         kCZpQFaH1FD8oOfzAuQGjINUVYJ8YSmBWdRlfPWIoBPrZzzS51aurVpBTSluX5bggTYv
         1ZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774269821; x=1774874621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CAxjuWc6K1jt8cRne9eiJroow903OnF7+g9JiBxwTFk=;
        b=SLTzqBAaiS9pgAaELfrPJCrGzEZQumQS//+SC4MAIvENz6Dlah5fxd6NDLgaCMFNSL
         I6cbaaJEVFoDJGyk7MBlIK/cA0VjmMQ3mk5bqLwlLMGROl4r1rp3mhm+FIZrgGLkayQ3
         uVbzCfyLgHOOzJCeyKM14fNXV0CBLWAvmZrHCKoRyeAQUjYtzGl98/sX4lnC+DVqrXpB
         lX+B88PCjexF93Bz3QSO4lWPPagkKq8zXx4gQDUzlr11lG/j0QnfeHp/WuK687BTK+0H
         366OP/m3q1ybxz363OdoPPRVfkLQG4CRizSxlhtUQOKXfzhj7nJbEPNQT0BePG9fW7Pu
         5RKg==
X-Forwarded-Encrypted: i=1; AJvYcCX0Sh+PunzOJlRytbe5gMY244X2/Gaq3BmBGjYnzE8/osAAnC8BBruh4h4I2xJtKJVlk9X7lTj/DBeGRyHLVKup@lists.infradead.org
X-Gm-Message-State: AOJu0YyF+54H/mjHes15QTsgjoZmKALE3NITqWStgK3pkanqkNkclbzk
	/r8oan7rxWoU2kgb3o7acYW9ZlsA9JbSBOXofGXQjfa5yEpJvzAkp9BQ
X-Gm-Gg: ATEYQzw7X2lkMOQhC09Kis+NbydBx28YFfrvdpzp/fN7mIhkxB1PfaliPaNzct7nWPx
	ArWm4pLzdQAcFCvKQsj+Q/jnmMsOSMbr3v5bB0IWhzRmaJDX1cvug17XdKxdB+0WiGvHxSGWzEp
	eiGQNQTiPTqBPTtPrhWzukmmhTR257+fY72bycgdcoNu0tdQryBjIKCq5pTEEjEdKfTqCaAw4Jd
	olKlndO6EFUJxeTzKjkSLOzbdh/A9G9d2fz2i1FNJqIMg9ee+aMz6rdtYwPNP583s+AHJUbQDmI
	GMsiy1sSBVGSAf7m5SHMPAGpXCeo3el5ykW40oyB/VK/OJPWnEwuoYLERF7Ds3KtzYhDKpjzfEi
	C4kommCinf0I65a6TiMK0/PZmSbKTOH72q/Ulf4vI8QA9B15YKkxfPb3sLeXVdhJgvFozxq6pw5
	MyDttdIfkiH6mdN8PN52saeg06U5kYyWt87su3Y2rp5pZBNL5B151mUAWWrn2iunRE6Qcap+KZ5
	lk=
X-Received: by 2002:a17:903:244f:b0:2b0:5453:1932 with SMTP id d9443c01a7336-2b0826f785cmr120175515ad.15.1774269821033;
        Mon, 23 Mar 2026 05:43:41 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516ae1sm103668865ad.13.2026.03.23.05.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 05:43:40 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Mon, 23 Mar 2026 20:41:05 +0800
Subject: [PATCH v4 1/2] dt-bindings: arm: aspeed: add Meta SanMiguel BMC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-sanmiguel_init_dts-v4-1-caaa48a7f7be@gmail.com>
References: <20260323-sanmiguel_init_dts-v4-0-caaa48a7f7be@gmail.com>
In-Reply-To: <20260323-sanmiguel_init_dts-v4-0-caaa48a7f7be@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Potin Lai <potin.lai@quantatw.com>, Potin Lai <potin.lai.pt@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774269813; l=894;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=505A4j1K+3BVyfKFAUJFkb0POt+oWwmpy0RpscQYCVE=;
 b=/AEWcZkBMzMiJuEserz1UgyQ19R7bFmaQav+QptLCQ+XjFP3LFQsldiRbTTS6VLyoBuW+nhVk
 S2JcNJpv5lMA2+UH9ffIMhFTXP8McxfWZVo3RztSa03TuXxovztBu58
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_054342_357185_380695D5 
X-CRM114-Status: UNSURE (   8.36  )
X-CRM114-Notice: Please train this message.
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

Add Meta (Facebook) SanMiguel BMC board compatible.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9298c1a75dd1..6c84e6c80978 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -91,6 +91,7 @@ properties:
               - facebook,greatlakes-bmc
               - facebook,harma-bmc
               - facebook,minerva-cmc
+              - facebook,sanmiguel-bmc
               - facebook,santabarbara-bmc
               - facebook,yosemite4-bmc
               - facebook,yosemite5-bmc

-- 
2.31.1


