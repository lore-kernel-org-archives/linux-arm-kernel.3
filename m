Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D483DC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 16:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WiSre9WglDpmIK4O0YsNl0nRwFB834XrXov3VRpC0FA=; b=yyWX/mOTNygsYxH97gQw5LKD6i
	1IQTd5G+6xfF0eU17IZbMoFl0S+gAWFIQFkr8ppK5/I3TCtGUl354jVPwKo6OTnONptFc6yq6gM48
	deHaimhStTFWf9/8nnpTvQH0JdnDhsiux/w90R8XYIBBja3Z+35ba/PuyEcMzF8N9sHbMTJWw6sWk
	wGYx/ieOw7VrLngy6uZBDEQIXv9aittprCcCz2a6Bi/GMciEXzp/f2ARj+GVudvwTX7NGp7QuNmVA
	K7lmVaGT3TC5huYLRmm0zyYdL1JLW9ySGPGLXajETwKvpNpzG85g/UYFC9sdM5du+xyAgLGOdJEnk
	ZLV8JvmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1tl-00000007U1b-1D4q;
	Tue, 10 Jun 2025 16:32:29 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOzIc-000000071ct-1xmB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 13:45:59 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-234d3261631so38085675ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 06:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749563158; x=1750167958; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WiSre9WglDpmIK4O0YsNl0nRwFB834XrXov3VRpC0FA=;
        b=mYZiOeHXeSWxqsuPYl7mpkOTe9YQttncS0Oh35JuPX4a1Kl7Ms4WzZIlmrxQYlO3in
         ba2ApPyQ3j9bHBxfOH4EQ//GUFMBJrLqYEkVHyX3MS2B6tgLCEqwIMhxDPqlvW11GpTR
         SMTO2S3QVUG63F97nBrly0Gxn/HalRgVq9QM8KRe3wDEydZWqxpr0mPNj57UCY/uaDni
         6InDk5Ubq6FWdi2CkjkYZKXLUtKt/fG1r5BBshLadSxoFrjNm+fLH90MuxWrjbjlGzPX
         wxlU4Y+ssgPtetYaDCzXvNZKakf8sE2QlQs33G8zO8nWhU/688TEoXfGO+pOahIp9eW7
         ETMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749563158; x=1750167958;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiSre9WglDpmIK4O0YsNl0nRwFB834XrXov3VRpC0FA=;
        b=NBErs/DEdZNeZqJV4tomHAlFZjLzD70RTPpk4r/5EZfDF2Gs38q359f13sX24Pp6kR
         DXp5wv7etqHCHK8rSIw3oU7EFAxTpHPwTYmKh8GthczPgvGOGgh3xaEpoisWUxZGXDNb
         I5HGPAwD7+ngByFWkS7Wn288qKRr0eXJlfikuHL+RBiA3aAxlzm/aNDyNOZIfNUskKHS
         8UquPn4gQZ7ljKSotqxzGIdvTV/KOU9kXzDwb5p2wkr0CrMO55XbQVK+xd056QYkX3O3
         b5lOXpGNNNmqLZyhFsaF99MSP8K+gx79ZqavW1ve29KdwvwbEILtaCSF/t7lYB1qx0jU
         k9VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKVlfy/gU/tTTsSEny7ry7y/nPZUyJghTE9F3/uLykoElTI1avhuBJiXK41pu79XNHtbdPYNP54Sp2e7oqRLRT@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6jf5ymZr+j4nul/Aa41m9LpDz086Vlfi5pxrOxly4CTwtGYWo
	9Sryyx9xQ60laHfZOKMzIBtJH3hpDbtjNgpo9H5+jM6Ks298uSJBv2pq
X-Gm-Gg: ASbGncs8ncFk7GUScxZT288/S4S1+n1IOpwrueIMUT8gKhsEA/rH25kUClqV1sM4flT
	fXhEH7KF2IXqykic9kON8jaJkzL2z7NMkd4vjyzlf5kfpNlDbJAyRfx8FA4nRqn8Sk4YXRlTkV1
	9unRFBsWxz5vJ6zqkNXKzg4peV+z89aDHxQbevCieeg5xq+EWCxEa9d0hV63cbrgT0wKxAThpIH
	IuoXkQGZpoYJq7aOKh/FQ6NxDRqvoHGQP0Vfq6CwRbRSGeqZ0REQCEsJO4Vv6quiqHYk16xdMva
	Q588JAENxb+yyULKclpFX894kDkc5b7y9hH9My9DOz08KPc8tCdopY7gKYTbNtTR
X-Google-Smtp-Source: AGHT+IEPves9Z9ZVq/mhz6mgJlmIUE39OoniHpiNwnWv3yeacikEIo4HPGvzJFKEY0HfioUekMexVA==
X-Received: by 2002:a17:90b:1dc1:b0:312:e9bd:5d37 with SMTP id 98e67ed59e1d1-313472b5a14mr24196363a91.6.1749563157475;
        Tue, 10 Jun 2025 06:45:57 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-31349f32df7sm7288522a91.15.2025.06.10.06.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:45:57 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Date: Tue, 10 Jun 2025 21:45:20 +0800
Subject: [PATCH v2 1/9] dt-bindings: i2c: apple,i2c: Document Apple A7-A11,
 T2 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-i2c-no-t2-v2-1-a5a71080fba9@gmail.com>
References: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
In-Reply-To: <20250610-i2c-no-t2-v2-0-a5a71080fba9@gmail.com>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=959; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=/Aqo6eZT8yO3l/bSFL2DWbLRnUJ/G9BOeA6amkvZLD0=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoSDcLMj5ZKRfP6FDNrg/uoHt0VE03NHDCCsm/L
 tjy7gyFgTGJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaEg3CwAKCRABygi3psUI
 JON+D/9mWe1wzDkLw5zxCc17gmi0oLsWgTp/gp4uIg7bRtRXS2I8RHG3l15Ne96FHKoIVpycAsS
 Pm6XUB3Q4j7RgkL1X7IDSkzaJNK/nV67mFAuF7LtR6DQ/dqhniNCCzQt/3osg9oMYBPwBl400A9
 hdYDWAneazlwNY0LU6UQYdE1y2a0wv5V8QEpib6iW8V5C1CpmCE/BC9X9o63x78K38UAnLIr2qR
 8NygF5muZixISiWMFY73C3UpfxH/4paxsnqGJ0SiexIucrhKfGV7oEvHPYL+UlBYKeRsHrxNJ7B
 ooCaaDzNhzbKCcmTd6pMNrunOvoz+0OnA2OHT8F6im5h6Bz5hForG2hwBdi5jY29KE2wkBMJArX
 gJDJ2Mr95ON9GJuRra5EwENT/zJVTHsyPzDr/fe1GLgyDHhGXv1j937k4lNKJXsWlWtQOigxNzR
 c/Jjl5mgiUQA/x3nRh/jN8PGl47MAQvOvp3IVmgmSOl7yOO0K+6KSzIQny5dzs7HcNTik28NfwZ
 hNLHp8fNGqEuXlGN5K2qds1wvnubCOM3tvrjFS02nbDJbc06ybYjXSHx4Ud0PUuYrMmdXPem8Fa
 H7CDbAdAyxBaV4n4oHyWBTxIvfB2Nilu5711+drKFj8tUFhLkQ/HoqH3JtvuHZl3F1fdX8XpxB+
 Fn+WFJk5dw9uSkQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_064558_524889_AF3DD656 
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

The I2C controllers found on Apple A7-A11, T2 SoCs are compatible with
the existing driver so add their per-SoC compatibles.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 Documentation/devicetree/bindings/i2c/apple,i2c.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
index 077d2a539c832ea8dbf28d2f9b436cbee6fb5d8c..fed3e1b8c43f67b8f5a19e5c1e046b0e17ab8017 100644
--- a/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/apple,i2c.yaml
@@ -22,6 +22,11 @@ properties:
   compatible:
     items:
       - enum:
+          - apple,s5l8960x-i2c
+          - apple,t7000-i2c
+          - apple,s8000-i2c
+          - apple,t8010-i2c
+          - apple,t8015-i2c
           - apple,t8103-i2c
           - apple,t8112-i2c
           - apple,t6000-i2c

-- 
2.49.0


