Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4587FCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 16:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k4zaJq9JJc/9ryK6cY2Xn8ASZ9hmcyfG8y41VjWW8NY=; b=uG/BQBO/h/5+JfH7EaGJVdFBTM
	Ul7vCJcdWRIp7rqXjDIQWE5KaXQUtH9tHsZd1lxGSXVf9gdFHPI8FWsNImKN9qRv4UhhEgOdrnAs1
	PNxzMe7vB4iiBhE2vPSWhXKBefRcZHAnecANhiY/gc90Ez2AWujcbFvpo3582yTBJtwTGvjZ6wTPJ
	nNYmJ+An35q1/BcOlWY6nsIF2/t0oFJRXY+mFey4914Gz7OU9L2YpmukJKKlwd2jTFDBzyW/jcOoj
	isLXIwaYZhpJ0uiQv3eWfyDgcnwFoaoBq0Y8NFZeVwQvCDmk6f7Q+v7bU0z/MBrYOVdK5HksysUZV
	zNb17Qkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1p1c-0000000BD06-1yJp;
	Thu, 25 Sep 2025 16:40:56 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1p1X-0000000BCt5-0LXx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 16:40:52 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so1146817f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 09:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758818449; x=1759423249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k4zaJq9JJc/9ryK6cY2Xn8ASZ9hmcyfG8y41VjWW8NY=;
        b=FbQcYtL9d2YgsNRb0iMiEFJh4dFvfNLtFzGIFNk5Z9aig97t8gJVAfrbDP8tE+bINz
         GKOnDc2IHbaDP2Sa4/ozPuHc0+iY86+5hLO2v8rYZ3O8fwYxZ9gbTQWZ/H1u5TcWYebq
         jNTueF1deBhrzhCcfj1imxcsgbzb9WTidIhZP/JhAlRqXzfjmUUz75yknngPHXH01IPl
         kCDEi23EuLH/Qig2OjYtE3gHwBGkH5WCHK7l2xT17C/AV3ZFmiMDc46e2qUYmvOIvJ3I
         XzoY6kFNkUYAw0mdiGkksNDhBA/JF/Lt2ivptziUm8Ouhb3XwVcxoJbJfYmgQxw+PM6n
         zWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758818449; x=1759423249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k4zaJq9JJc/9ryK6cY2Xn8ASZ9hmcyfG8y41VjWW8NY=;
        b=oyUaQ/aLbz8BUoEWVLT713UsxI9Il5juzEiPA35kT/KnkEkLuyVwLestvOW3L7Tflr
         cnOJ6INovEqA9eQjZDyY95orrOsi2uPyG+jHix2iJ/qAtmiJXS1JEnACzIsUO2OTDi1p
         NsEO+81q6IFTvr8Mitqv6FBJ5io9C5vFnC4lYWiW1nUK4OBisnhnzUtA4xM3Re7pxx12
         6s/lEV+9JATwz7mrwC5r7COgymUxrHX5oj8DTY/E2k7KgHmA5f/02p7WyoRszUYlcz45
         PzPF36dGzXrlPOYyX3oecoAdfzssogcITd8e5ZFMnXkREO2xAWRuiA6K8yVq0FD6SH90
         zEbw==
X-Forwarded-Encrypted: i=1; AJvYcCXj2PWE6fBUiTvNrnM6ge3NmcNucZ4ABxFizaqB005lK6TN63mZaISne702hpXgxx0X/nIUg8EraWFE/tfLKqxI@lists.infradead.org
X-Gm-Message-State: AOJu0YxNNKZAggZp5X5NRBNpeI5OdwMEmmujRRm3b1meqfdqCcQv7Hvl
	onnkScNgKhszuHEkumQWZktp6YBII4daUkmo6qnhwawTq9g7oPuMbOXL
X-Gm-Gg: ASbGncu0uIOhpxywvbyUCvbtqHlIQTli94LDHx9jcexkDZgo+JCSwpNtujhNzJr//4Y
	UoYrOeBm6QIivgLSq2MW4RhchcgX5BgoGB/CqhzFGAVMU43M/Mk6Qd6G2Ung4dioOAULGkJWJ0E
	5a3x/7ndah5Zk325QPMAD+cqrc2KtQcncQ5ZpHxqhVNAZI0razn5twcCpYha1LBu8XU6u6GZ15M
	LRdzgdjZcq1VshBDAFlLi/kRacSjRxJmGB9CGyQbMKSVSx25vwAGbcTOuqSq/eq63vXiNCDdgrP
	VLojt0qIVp29jevFC6aoVitAzXnlow4q45oI9SHkmZN/O+Th3NOU6x+2gXG+OzUkIRXn0P2OzWI
	/meUQpXS3T5maUfZGaGGPCb6kw2SG4wDBG/9/GhOW1L/9QdEU6Y+Nz31qQcxuBtAOmIgPL+U=
X-Google-Smtp-Source: AGHT+IETYpPO9LAGX7zUAqFXRCr1IR36jr+nRkmsy96nynVShQ03CfruIEzXhdMASLXdFRjMR/RaLw==
X-Received: by 2002:a5d:5f52:0:b0:3cd:7200:e025 with SMTP id ffacd0b85a97d-40e429c98f2mr4337564f8f.5.1758818448972;
        Thu, 25 Sep 2025 09:40:48 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-40fc6921f4esm3591904f8f.44.2025.09.25.09.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:40:48 -0700 (PDT)
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
Subject: [PATCH v3 1/4] dt-bindings: crypto: Add support for Airoha AN7583 SoC
Date: Thu, 25 Sep 2025 18:40:34 +0200
Message-ID: <20250925164038.13987-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925164038.13987-1-ansuelsmth@gmail.com>
References: <20250925164038.13987-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_094051_145366_A6952B5B 
X-CRM114-Status: GOOD (  11.45  )
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
---
 .../bindings/crypto/inside-secure,safexcel-eip93.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
index 997bf9717f9e..2269d78a4a80 100644
--- a/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
+++ b/Documentation/devicetree/bindings/crypto/inside-secure,safexcel-eip93.yaml
@@ -30,6 +30,10 @@ description: |
 properties:
   compatible:
     oneOf:
+      - items:
+          - const: airoha,an7583-eip93
+          - const: airoha,en7581-eip93
+          - const: inside-secure,safexcel-eip93ies
       - items:
           - const: airoha,en7581-eip93
           - const: inside-secure,safexcel-eip93ies
-- 
2.51.0


