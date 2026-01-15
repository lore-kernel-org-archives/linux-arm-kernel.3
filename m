Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3BB0D3CCB2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 05:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CLWjl5YE/BZTrCnvKQJ3D1RjaRhW5vGK+LI2NZ6PC+I=; b=B6UvrXjlqaeKYpmFWTKaiXp0zQ
	nLyGjgDdLYAtVk0EY48tqRJnqz0P0OqyK6zPytmgj/pza/0A9TkXciqgWpM7Npau5392hZMcIC6b+
	e8PFDUoq47qOdlKQJWJDLfzVecfYqYcjDSr57PBAOwL/KpRo4qEsSlOUopROABqxu7OSFXN3dCEbB
	EYQu4ILWohqEjaBUnjACDYHSdTzMyvbGfeFaF+pgAZ+2Fb79hkNvPbsFeJNqK3SxCj/ZtFqmpJBNt
	gux6Gil5G/pdzWlgszqdHbMq1282CEgRbvo3PzWCnQ2xH7eZ5HW34zzOdKGaK66We4kchRifk0Obo
	MNDkF7xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgFxJ-0000000BnzE-0o59;
	Thu, 15 Jan 2026 05:31:37 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgFxG-0000000Bny3-1ZYG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 05:31:36 +0000
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-78f99901ed5so4668777b3.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 21:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768455093; x=1769059893; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CLWjl5YE/BZTrCnvKQJ3D1RjaRhW5vGK+LI2NZ6PC+I=;
        b=jhzlFnly61C0fOgkuDSaUHrRlrGwesXrWRV1q41BmxAcAdlbOFXbPY3a5vHHB3b/GN
         yD79UkZbX6yjAV7SxeyyelZitMlRTMktRth/8/IxYkS/XGwzB+zHXI0LkSS0AnRywVi2
         IwKYsCvBYNZwqqEChS3yQFA3wUsK4h0N+buN9nL+NZsK1lFq3coivGCEUzEX62CPlI/z
         FOeMsJN2fT/9T+aWcoX2sVxUHJ6AZTokt2pJ+ho3jWZN6OaxFiku0IZjIRaY75QkmuhE
         M/9zI8Lk/Ho9HH7+GnNuIhPn5lJwTdEEHCWByNiEWWJd8VfVlYHuHtpT67Ps3V9rTiXX
         FKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768455093; x=1769059893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CLWjl5YE/BZTrCnvKQJ3D1RjaRhW5vGK+LI2NZ6PC+I=;
        b=H12GbFte0AwwX+nX9epu4hlwrmWaksIsFrvvxBhDtJljXjwB32Q3QrhmyLsN29b+mG
         hcVSuMtZnx6EDYdH38oRxSMZUw+lJMG/fuuEAw2CYPBRgWP32/nDzmw4uGnhAiUH4gQF
         9w+3aEmfNYK//Jx56jn0ybyDP3Cuu5XvMk2iS72YvWhF6Q7y+yjCQIcVyf6v4JuP9Qw+
         CTKKey4MrpIc14Jwxws9+kfeM36jRwXbEPeBjfD4X9iA22KvMUPlocJ/vuuZ8upG/kF2
         h7GzMFQixLSzlw6Q0SPf1bc/SkwBg30ymqrqiUWoVWDiZjmVlqyL5+tbwj0ctj9afKku
         SAUw==
X-Forwarded-Encrypted: i=1; AJvYcCXKrpqK/bvKs8bBpdcWZXsGOYd/Lxc+CsYmaQb3qatIUzMIzXA9P9Q4GCi2u82oZKmcV9nm8szBGDNUifyJtcxG@lists.infradead.org
X-Gm-Message-State: AOJu0YzVa7hMvtURT8ypDIEeEDWZRB7mf5Tb1DlG/UKTvrUUYIwYbvas
	AaqOgJjcdzIdFWeX3BQcdy5Ch5qlxUrj9lnCqF5sz/aRbYF4psgXhpWJCwAUSA==
X-Gm-Gg: AY/fxX4oaPbdzUhNvXmMSk8ItMhnjyGUWkHHG/MyXoPgvnRp/5WbdZsRlEyLiDRCp7/
	zPv3fr4JQMsSxKI1kt0BD9qS3vL2GhDfS0geANuTG0sziJkEId+tnFLcyCAJiLp85Pp2N/1FSEM
	MLWYio1NHV84vSrtIqGC8VsDz80t6JQq1nNl1KhpCJs9fRVtDOj/QBP2ckwnl61e8HWj6CMB9LD
	o5SdN/AIX43AyuwnQ99DRWYvILRyAHhVkPKAn5zHWgOdwwqmiDz7rOFMHVtaJTM20y9mdMxpVNq
	7Y7+k/oZT9eCh46uilqgewijIPGaL+8tNbF/0UwRC/qkt7ujr0Me6YYYFezaGpK9WSooqN72Q4p
	KuEFqNj7ahASaIU4St1pHfaYt9ky1bIViISxv7rwHPiTMybUwTk2DBGkQOVytqVnpljPXc6shpm
	2Cyi1W
X-Received: by 2002:a05:690c:d8a:b0:78f:a616:7b99 with SMTP id 00721157ae682-793a1d9c70emr44480757b3.49.1768455093187;
        Wed, 14 Jan 2026 21:31:33 -0800 (PST)
Received: from [192.168.2.165] ([2600:1700:220:59e0::914])
        by smtp.googlemail.com with ESMTPSA id 00721157ae682-790aa553172sm99259437b3.11.2026.01.14.21.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 21:31:32 -0800 (PST)
From: Anirudh Srinivasan <anirudhsriniv@gmail.com>
Date: Wed, 14 Jan 2026 23:31:07 -0600
Subject: [PATCH v2 1/2] dt-bindings: arm: aspeed: Add Asus Kommando IPMI
 card
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-asus-ipmi-expansion-card-v2-1-12b72d20a9b9@gmail.com>
References: <20260114-asus-ipmi-expansion-card-v2-0-12b72d20a9b9@gmail.com>
In-Reply-To: <20260114-asus-ipmi-expansion-card-v2-0-12b72d20a9b9@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Anirudh Srinivasan <anirudhsriniv@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_213134_419180_C3375042 
X-CRM114-Status: UNSURE (   9.14  )
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

Document the new comptaibles for AST2600 based Asus Kommando IPMI card

Signed-off-by: Anirudh Srinivasan <anirudhsriniv@gmail.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index 9298c1a75dd13b447e5ddbc64c5e169dcd08fb15..2d5bec22387be59737474cb04d0c5f7bd589d1fc 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -79,6 +79,7 @@ properties:
               - ampere,mtmitchell-bmc
               - aspeed,ast2600-evb
               - aspeed,ast2600-evb-a1
+              - asus,ast2600-kommando-ipmi-card
               - asus,x4tf-bmc
               - facebook,bletchley-bmc
               - facebook,catalina-bmc

-- 
2.52.0


