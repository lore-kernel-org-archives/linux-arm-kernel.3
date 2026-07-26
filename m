Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A90C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 18:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yup5bOkWn7IqJaUF5fjRsCEs3zex/YIAg6y/8ySFCqE=; b=gHS4JvHUnl9f36zIphss5jNouw
	PShMo8LaKeJLjm3/fiI7W/91jU/aIPsLTpHT6+dIAZfVIX9dehqHuf/Rwz0H7Pbg1AzgYsbm3yRLg
	2ksY3+XD5EA+Hhqkg4ufypI2Aq/cxNukeJdgm7WimNj7y3b5WKP2lEjX/jwapqNhx6ufelvxGGFlt
	BfaSYvLJY2CWdMoMxB8YHyjHUz651FYTdIK6Jh8Ig7kXp1/WO8+IkU0EKUah3mVvrErhMV5YP+/kk
	AqN1xRR3wn8M2fmwPqzW6Py857CFdeF0EX3cKDvwnS58LLOab4tchDH9ZQC+Ex774aAc1qfeHjmjh
	33lK1nNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo3UM-00000001TqK-2Iij;
	Sun, 26 Jul 2026 18:22:14 +0000
Received: from mail-wm2-x09.google.com ([2a00:1450:4864:31::9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo3UH-00000001TmC-3pOp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 18:22:11 +0000
Received: by mail-wm2-x09.google.com with SMTP id 5b1f17b1804b1-49553da76dcso9095325e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 11:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785090128; x=1785694928; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yup5bOkWn7IqJaUF5fjRsCEs3zex/YIAg6y/8ySFCqE=;
        b=CpWZ3E4Os/T1HqUmlL1SL4nIKOURLL1K0U88SBny5y45BlhGvsbmgM0m2czzXojWe/
         2ANGnxKZQfqTJc+GB8Hhk1feb63PhYbKYDCc7dGk2LIqZf/DDElK9MepT0FlEGA2v7Ll
         hznNVfvy6CDNjhSqp8n6tFf0lSkSG37lyNq04qEtswlioqv/K2h5H2C/7/JcZT8ZwHfG
         C5ToyZWQhPpSa9uAXxPqxWJKhSxQU8J+/E66aX0C1ByGVsH0HzwT2SqDCzW7h4LQ0QoE
         5m5yroHeMPRkJ6VaFF7EVyYP4azcNabh95VoHxY6R+Q6h3qVWSMQyAiIaPctT4fHp1oc
         6fhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785090128; x=1785694928;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yup5bOkWn7IqJaUF5fjRsCEs3zex/YIAg6y/8ySFCqE=;
        b=TllRkJinjotnqS3R3QAphdU91y2Ef5zSYTf9qm3Al3wDPfo+s9ZPShvgscMACiiF0e
         kiUTI+f1kkqlE8S6h368xTSdQXXS0Fv1CIgX4t6aEH+0HWF/qYgMkJybS6pQaEgjDKRH
         upJbrJOLu4JSriv67Pfv29CTQJIAkGXkTYI9ljVOk4igx+6Ge4GBeLgjUWfw+Z9CqlLY
         Qm07jiNraRdidtcdlxtt0wjVXXgjWGdRVQZjN2HPk3w3aG4BRbZdS2gOZdTDo0YQekCk
         /jSr3bcmwOIAwGzNS356Pcr/Uuy5aSsw1ZIj5Ce5crKxM6SJ9De3MWxpuq5SVqo9ykVU
         XSSQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp6KQwPatI73SLYJ9pJejEvlIKa/IUmM8Y3cY4W0xKhXW06YxjHiowVyyh0gAl/6YobWJN5DTDCD0jFLEb3r3Nl@lists.infradead.org
X-Gm-Message-State: AOJu0YzUhgSH9Lj78wSe2LpwkmvxMZrjdqWmLkbsLiivQVbD0cj7Vdjq
	vJCLMr/zSNn8VXDPJ2fMiRj34AgGD9gFKiE760YitMyfMqRE7eolTjKD
X-Gm-Gg: AR+sD139wDGExoPZER+PlY8YIvlGW06Rf6EM/rLYKBoyCMWe5pKC6KSoexGw8NPFmfB
	sdQB+e5crho2WQ7Gnroukk9w5EryvgLq/DUv3AnNC1exuRDDil/6j/RB3gMFfs65XlqQ7pVMN1T
	VWENbwhg1w20wtehZtpT2fUtQ0YIUIu8uNP074jGaJkLgjAliVawsvEEuAKfHXfb0+jAQVpNXW2
	AFTcUa8GPSKhmA9BV749SS+hnBJaOQ2uRgl3qwuoCEiodL6q2smPhBCv8hZfcpqpM02a8zdozwz
	0pNhf8JOHU07f9KcbpLTkBPsbc/y8SR2A/bzRjMCazBODsr6D0EpmRrIw5f20CxjKkFvnpdsxbj
	7Dm/OSa5WrISJPF5yOY8q+UtLmgYSVctskIgtZYQQCfw14rfbc37ur0FPTNqSCt3JgQoz+daPcD
	9cpxFZ3+Nelbw+Nn0OfIsweavmO9cpBTD1AAsU3g==
X-Received: by 2002:a05:600c:45d5:b0:495:52a5:8829 with SMTP id 5b1f17b1804b1-496b56c5ac6mr70333955e9.11.1785090127909;
        Sun, 26 Jul 2026 11:22:07 -0700 (PDT)
Received: from slackboot (93-34-145-231.ip50.fastwebnet.it. [93.34.145.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b52eec24sm150748045e9.3.2026.07.26.11.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 11:22:07 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: robazza.alberto@proton.me,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 2/3] dt-bindings: arm: amlogic: document Orbbec Zora P1 board compatible
Date: Sun, 26 Jul 2026 20:21:57 +0200
Message-ID: <20260726182158.249449-3-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260726182158.249449-1-robazzalberto@gmail.com>
References: <20260726182158.249449-1-robazzalberto@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_112209_968576_5F46E66F 
X-CRM114-Status: GOOD (  10.61  )
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
Reply-To: robazza.alberto@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Alberto Robazza <robazza.alberto@proton.me>

Document the "orbbec,zora-p1" compatible for the Orbbec Zora P1 board,
which is based on the Amlogic A311D (Meson G12B) SoC. The corresponding
device tree is added in the follow-up patch.

The "orbbec" vendor prefix used here is added in the first patch of this
series

Signed-off-by: Alberto Robazza <robazza.alberto@proton.me>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 9f73a0054..2d6ecdada 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -167,6 +167,7 @@ properties:
               - bananapi,bpi-m2s
               - khadas,vim3
               - libretech,aml-a311d-cc
+              - orbbec,zora-p1
               - radxa,zero2
           - const: amlogic,a311d
           - const: amlogic,g12b
-- 
2.55.0


