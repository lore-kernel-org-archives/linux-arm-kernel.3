Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70131D0C604
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 20:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5RxyOtzTNaPKWcI+VUBDYXPbW1xC12WwCJqtMGjine0=; b=I++MdfgNirjaISaEMEAq7MYKuZ
	SA2c+6rUa3jVnsbuteQ0hvlS/k8NIQZ5ASpmggEzbcflwbmsva+CK0XdIWCjbpy/M+uC3u0/68Hmb
	DFIh7CBlfmD/ZhbUNGSYHAvVn8cwQFFeEWl3SrMwTHaM0pq5EvK0bu4QDN8Kj4FzuKUMy2JhfzbOQ
	ouhAJNKhP4bYFt7INmfbih7L69GCrh7PQOQm/9bA0JFfHOIHLcM1THqoxgvrfVwuA76mlkdMIf5yj
	kAzlzUY5f2jDlrhSsZ0Ni7bVFFg+XBUf2g14pRi1CQDasQhKMD4WSDZZ6sZBYol9lUXKRIIXJfSck
	Hk4uFmzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4nhg-00000007E33-0RyA;
	Sat, 26 Oct 2024 20:48:08 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4nSx-00000007C9T-3bu7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 20:32:57 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-539f6e1f756so3488344e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Oct 2024 13:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729974774; x=1730579574; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5RxyOtzTNaPKWcI+VUBDYXPbW1xC12WwCJqtMGjine0=;
        b=OnFNS+ifs3XUfCVF8OousYuUi3Vbr0mZqXyjUL+ZhxZFu05Hukn5aPWpodbgb7YqPh
         WnTOhKOLnFY95CNOos7/d8ZmOB+Ocoelzy3UYFBmdz/u/e0wlFYNLQfRWsQDZ5inIffu
         tUb99UiAISJgGEEmp17vJbeegBHyFZ9kqqsb+07M6WwIKrLb3VfuFVZKktg9kJkkxGiL
         8JzKXI1IY7bad2cekadJcfl9kdgFaEWeMfwTnC6EY/oy+9gwG9c3Th+M5pZIcyWtPTPQ
         eZ6hcYDrGF0lkqKkfHN/DGZf3lFZSxzEp4mYmvnLKteMW/6LoVxQzf8isoDbI639U0zY
         eXyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729974774; x=1730579574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5RxyOtzTNaPKWcI+VUBDYXPbW1xC12WwCJqtMGjine0=;
        b=nfemfhW9t8pNl2MPA6gQjvm5C53qaEW7iyzeGWNbdwzNF9iakXiyZU6AE0VhycwTch
         qk1MSKd8WTeGfz2kwvREBQpoy5L+inw9BiyLpcIC2N946/jKDM4/GCkqIKDQwY9hxUrD
         ZGKveL0LihQr6e0jyfwjFm3F8yXtz26qprs60COxwcEFweMwV1q2DfdP2Vl5jyhx69TY
         tloTIH21XmcEIus+oThSKKF4cbMZzjIrPZHroSqDL8YgFU9pJPNE0DAtGWEY8JgUp2tE
         EOM15e3jEPL+BttCqZ4yZwmOrp/+AkpS0FFfPIVM0Ez3LF3gXP4QQYvQsfxfuPWuG2eB
         4sXw==
X-Forwarded-Encrypted: i=1; AJvYcCUMZUfpOY7XVNJ/dkQ4WuPpTtH/o1ng/l5v1XnG6HPvM5CRJhfwemfP9o+RXyL1a49iWUe0m9VjKEcQgFqMwd3S@lists.infradead.org
X-Gm-Message-State: AOJu0YyIfILFSMbIS6i+VEDzUKJd0F812mMGerQy3Aaes5iGpt6OGWwN
	+5vLA/Y+Gmzfbcf1eRDzp54XzAWiUTYMro+IwTYVak6IbuvX1Rgz
X-Google-Smtp-Source: AGHT+IFiuAmfPjlgB/C/2gEPUhMkLfqDRejoEvfIm9rhcA2aU8Ra0zcTZ3+8dY70y76GcxBaBc8BZw==
X-Received: by 2002:a05:6512:12d3:b0:539:fb49:c47a with SMTP id 2adb3069b0e04-53b348c38b0mr1707159e87.4.1729974773683;
        Sat, 26 Oct 2024 13:32:53 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1c9439sm595872e87.200.2024.10.26.13.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 13:32:53 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Date: Sat, 26 Oct 2024 23:32:33 +0300
Subject: [PATCH v3 02/10] dt-bindings: hwinfo: samsung,exynos-chipid: Add
 Samsung exynos9810 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-exynos9810-v3-2-b89de9441ea8@gmail.com>
References: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
In-Reply-To: <20241026-exynos9810-v3-0-b89de9441ea8@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729974770; l=1257;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=L3bYZfWAgZW5JNaWDhl/QF4KE7601D4KEfmVId1ELs0=;
 b=dRSYGEsoUXwVRZD/3jxhOaqXTUZub/HGYwcxzy8l+bUINvG4QBuof/tzu0RzyIco7LwH5IdrZ
 LKDQOtiIY0aBqWdLPB18QU3D3w6OI344UqMsVux+L0nw9u+iYfoDauJ
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_133255_945465_F6549594 
X-CRM114-Status: UNSURE (   9.55  )
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

Add the compatible for Samsung Exynos9810 chipid to schema.
Exynos9810 is a flagship mobile SoC released in 2018 and used in
various Samsung devices, including Samsung Galaxy S9 (SM-G960F),
S9 Plus (SM-G965F), and Note 9 (SM-N960F).

Co-developed-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Maksym Holovach <nergzd@nergzd723.xyz>
Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
---
 Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
index 47a8d98346ebb83a7ea4d11e2fc7fc87df6bc5ad..385aac7161a0db9334a92d78a57a125f23ca1920 100644
--- a/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml
@@ -24,6 +24,7 @@ properties:
           - enum:
               - samsung,exynos7885-chipid
               - samsung,exynos8895-chipid
+              - samsung,exynos9810-chipid
               - samsung,exynos990-chipid
               - samsung,exynosautov9-chipid
               - samsung,exynosautov920-chipid

-- 
2.46.2


