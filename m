Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF15D0BB47
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 22:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OWmtqH5N2P1BU0MprmjFDoO+HGgjxkNsdCcT7wh2gr4=; b=FHHTD/TAbqVFVT+mNN/oqCkMpB
	TVgoo8ZRJu4thn+cTHU5hyHRhLY808TkgScR3gRm4RhKc0TDy2AZ6nSEITPfgJpgmK/sOtvTIN8YN
	aMvR19evMDe2WBmkeMvfchT0bkvvKsXZsClBq2rI4UyLHaafkJHUTy8oCU2gL/Hmh71cGtvjtG/UJ
	OXztP0JK6nkvvbM8QGVErpjl8WqQM2xmMqNSVd+R8DO65sNrtrhKiYnDhE/MJ2RE48lkphnaLdEG6
	pkC77HdLfwpwNPV4DAtp+7CzP9g9l05VJuti0KAbDiVdcKtygaVOzBqPJ0IJ2E39OEw2AmORADCIU
	vgsYmtWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3kAS-0000000GA0O-2VAL;
	Wed, 23 Oct 2024 22:49:28 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3jyl-0000000G6xP-3Idy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 22:37:25 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5c9454f3bfaso245877a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Oct 2024 15:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729723042; x=1730327842; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OWmtqH5N2P1BU0MprmjFDoO+HGgjxkNsdCcT7wh2gr4=;
        b=judEBZuogzdp3ySmHxQeTZcQtxIOv/fEpA0DCEbV7fCo5WuVANcUEuhsgSi4Vizara
         fA2EvUBqNrMH3U6yeeS1G6zAfU7WIYofucBFmI3IJOp9rXfV+tO5fPkMgq/WWRDxWYAB
         ZIuoyMV/rsllM06St6Trdlpbl9XJ29ZfhS2P18sjilEMK7VzCxtx4eNshXvIgydAi01e
         hwCdH1RJEcIEJ2zEC7+HyAEjw8LKEuN132oWEfOvppg+q7Zfu8uipcO/Qbe+dQhA3iLK
         CGna8a8jcH6QChqo44Q31DrSu7W6s6e1VVVfYy322/FS1FnIMDzMSRwOLdGHsn8YMjlh
         ZdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729723042; x=1730327842;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OWmtqH5N2P1BU0MprmjFDoO+HGgjxkNsdCcT7wh2gr4=;
        b=gy60pl4xLup6gbVM+ZvG4Kz4V/VxF8ZL8fWxF6y7ueHvZFv7Is+5lLSO9N4tOU6qMo
         vVby367VOQ8Jom+WWO++KSzNAsK20jrNxsOPhO7I+ISIz7gH0aYX61/HSiQBvZiXgKwh
         7sDzQtl3iFmbn89bwww77gU6cBTiFs5BjfjEutAvaSUjfWcwLvt7wrfVYl4c881sQc3G
         dd77seZ32hTIjgiZ1aRMMavj9Qe080FXmpZE8/yZSQGWWEfJxWfFVl6qDA957rjbiPCP
         hnNUy8wC5ipy+KjQ+EeuVuvFsJW2NK3qNEz5xJK8kJr+vQucIsgfufZIll3N9ZZHdBEI
         L5Rw==
X-Forwarded-Encrypted: i=1; AJvYcCVCtWDE/OstIxEC91zUQlvjEkqtjWHN13LqxxMS5PQuUWuoargP4Kd855dvI1kCoyUhGVlN5pB+XMcvczuCtnRf@lists.infradead.org
X-Gm-Message-State: AOJu0YyEFrNXrsm2ypMEAFCd4wYNSil+16PK9YQKUowmvBeTMeel0AB7
	uz6F7T0Q06RaSGuqty1bDe+vA4zHz0ZrKgbCwcHA5l9yrsy3u1s5
X-Google-Smtp-Source: AGHT+IFzgo2JsQ869WZYlAgaH+b7Atn/Vy2II8EQ4rEQzpHOsgtaGvwMKQGxGaJKoqZmvNgB6r9Vzg==
X-Received: by 2002:a05:6402:1e92:b0:5c8:9f3e:1419 with SMTP id 4fb4d7f45d1cf-5cb8ae70636mr3554294a12.5.1729723041789;
        Wed, 23 Oct 2024 15:37:21 -0700 (PDT)
Received: from [192.168.122.1] (93-190-140-122.hosted-by-worldstream.net. [93.190.140.122])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b4easm4907816a12.12.2024.10.23.15.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 15:37:21 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Thu, 24 Oct 2024 01:36:37 +0300
Subject: [PATCH 06/12] dt-bindings: arm: samsung: Document Exynos9810 and
 starlte board binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241024-exynos9810-v1-6-ed14d0d60d08@gmail.com>
References: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
In-Reply-To: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729723025; l=1179;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=mDrRM2vw6yzIeJi/+7tORTimRHVKBC8rcLZLB3YC2lk=;
 b=dlXnErUtfJ/958tawHUHA0uCxWUUQJON3A0WPPEbbxCfpUTu6mkRraEbrWIh4MRKibiMhRJLq
 QLl7xL0FdHHCMI24G3+dDBIhfnL9b134SuVfqVs7zsmZS9MSk79W3ZL
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_153723_866219_B12F66A6 
X-CRM114-Status: UNSURE (   9.42  )
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

Add the compatibles for Exynos9810 SoC and samsung,starlte board to the
list of boards.

Co-authored-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index d25a17e697256f8d868e24bea47d21accd1184ed..b5ba5ffc36d687a6fdbc625e6d95c37a8a2e2b93 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -230,6 +230,12 @@ properties:
               - samsung,dreamlte                # Samsung Galaxy S8 (SM-G950F)
           - const: samsung,exynos8895
 
+      - description: Exynos9810 based boards
+        items:
+          - enum:
+              - samsung,starlte                 # Samsung Galaxy S9 (SM-G960F)
+          - const: samsung,exynos9810
+
       - description: Exynos990 based boards
         items:
           - enum:

-- 
2.46.2


