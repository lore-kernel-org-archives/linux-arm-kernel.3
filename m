Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572D0D68B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 16:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6sBEsvd+dgZ/xP6/kn7wo3kVN9KTyz4HVn9G9Q/OIqs=; b=A3qtwsYs6v1JTHY8qjoBYzKCF9
	EJ5fTRmV7kQfHJk3737RxHFeXoBW+Uq4gzMqZ28eAfvmauoyKXhFCRvs+KLYM1eRNSu3dJ8Af3DRZ
	jTLcUtBg5t9v2ayF9AbBuZ/w2qSuzTQw+p3ZDqKYWOYb801Y7899D2YJ3dSHuxc+6hpG+r1s89Q6h
	6OnsM9n/fwjx5RDvBoIlvs3esSEvMIZax2+K/KK2mgJMtuFZH8/IubJ7U0gE8OUH2YXR0Pa2TjVnW
	XD2A7+SzOeDgapm4061/lEvEh1PZ8/emdwGdPhCmkA9gONcMEHyFO6kTkOY0H1wX/Re71XNXnJFw1
	RWbjy2qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcKn-000000001X9-19NX;
	Thu, 14 Nov 2024 16:04:41 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcI0-000000000iU-2PCx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 16:01:49 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38222245a86so195915f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Nov 2024 08:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1731600106; x=1732204906; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sBEsvd+dgZ/xP6/kn7wo3kVN9KTyz4HVn9G9Q/OIqs=;
        b=CAH3H+ytJyySqTH1fQRXHImWmM91D5yWCh7asCp51J5a9doXdgg7RZKYsxXGEj0V7O
         ugehTFNDGQ37IEJ6+qSGslH2wvdz28SlZCd7gAg3U+VQNBtdLgbN3CxjcCmklQnbRqFL
         /OB4rbbC0mC//KaDKJ/Src4R/qcmcPDAzjpiGACmkofhaJDuvnoVd8tfIDJisF7s4WvD
         p7H5edRyc2dixpZVQNjbNGa8IpF/gzgUWNVd36mx1M2p5bs0PVv13qtKm04NUXa/vre6
         XqLEZzcRsVCxCGEeelR7FbnDIo0lq4DJT//Cjj/ayZS8yXo3scQkzjiTX84NNP1OdufE
         mk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731600106; x=1732204906;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sBEsvd+dgZ/xP6/kn7wo3kVN9KTyz4HVn9G9Q/OIqs=;
        b=uGYCYcTTBrpLWgvr3j10JVALslGjnY592P5sBEjXxZC1WargW+dGFOdR0reutoZkHd
         sy6gO0dhyXPURIPH05tSpwKtZwZZ5F1fENBP5BYsQubG1dZZbOSs9oxImVOXwrtkEb8c
         LRJ1mofola0HwKFMHsa+yjzU1HPdvnQSp7M/Cfmp/NiXHgbwNATU4vDWzLVt1HOnJ4d5
         Pd9PGYQysq6LTpglQIm4mxjAxU/uL/dzUUaz7YStLmE2qsynr0dFkTdjoFJWzrdzz6dD
         B3QhW/7rnwL/zZ+r+6X8Lb0CE11Mwlui9DC6xV5Epp/mLJ8adPjR60GhS29bJSqmNp8l
         Df8Q==
X-Forwarded-Encrypted: i=1; AJvYcCURp01xWTM5w0B6y4Sdv18aHZddjfp0qhKyTk4gdjSt3XdqWcgOVWzBkAn9sdaKx3Fws5NWqdgiEwaLIPLZTf06@lists.infradead.org
X-Gm-Message-State: AOJu0YzX1UtmpJMZH5kgaplUl9W+xm9YBAKxOAZbpSD/X9ahrFButW++
	vBh4QKVY8OrFKCQinl9hoBCyuXMtcn2ITEURPa5TacQ353DijHwlVTAFJx078+4=
X-Google-Smtp-Source: AGHT+IG4Sy0eRFWGgQ022WtiTP8SuksgBmcBl+ihey6/w0qCP+GyJB1dxeBjLookfEv7e1llkV/zYw==
X-Received: by 2002:a05:6000:18a9:b0:37d:4ebe:164f with SMTP id ffacd0b85a97d-381f1883d96mr22287017f8f.46.1731600104522;
        Thu, 14 Nov 2024 08:01:44 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-382200fe00esm1139024f8f.42.2024.11.14.08.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 08:01:44 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 14 Nov 2024 16:01:14 +0000
Subject: [PATCH 2/3] media: dt-bindings: media: i2c: Add IMX462 to the
 IMX290 binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241114-media-imx290-imx462-v1-2-c538a2e24786@raspberrypi.com>
References: <20241114-media-imx290-imx462-v1-0-c538a2e24786@raspberrypi.com>
In-Reply-To: <20241114-media-imx290-imx462-v1-0-c538a2e24786@raspberrypi.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_080148_616114_6C884476 
X-CRM114-Status: UNSURE (   9.58  )
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

IMX462 is the successor to IMX290, which is supportable by
the existing IMX290 driver via a new compatible string.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
index bf05ca48601a..fa69bd21c8da 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx290.yaml
@@ -33,6 +33,8 @@ properties:
           - sony,imx290lqr # Colour
           - sony,imx290llr # Monochrome
           - sony,imx327lqr # Colour
+          - sony,imx462lqr # Colour
+          - sony,imx462llr # Monochrome
       - const: sony,imx290
         deprecated: true
 

-- 
2.34.1


