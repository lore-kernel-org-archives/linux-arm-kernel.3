Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA5BC021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 15:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ih/+2A3WZbQ5wsR+LDXs5XUfJzJaHQlaqkNsPAr1kV4=; b=jgRdJRLrA+q54CCEm6f2NhpEn3
	xtfiFeZ+dEEu+n9iaKq1WgXY4asDadcbP6KDhHBg1ZsDEnUHhzSOP2EJncAqnZOCiZF/Ew9bTcZpW
	kk/VHIk0pT8JHd+HAkNCBuoVV7BU/F6uJvXKObmNktjImdMG4eVVrjArfeECTszYQ7pR57eFKNlt/
	zRzYOGGyijDVxwxIG+wzxU2IZVBhUlftuH4S1B+XlISknAxpCTU5nGJnGX4GWA41l9IEK+hAco1Re
	KZxAbvz/sB4Ggn5yX5RxyZDpC8sWatlLtxwUqkbLv8soAyR5nyai9IvgU1bf1aW8xMNoh13rjkluH
	59NR2PWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2hq-00000004zAu-3LJQ;
	Mon, 17 Feb 2025 15:06:46 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk2ZI-00000004xdw-2e4j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 14:57:58 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-38f22fe889aso3475084f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 06:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739804275; x=1740409075; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ih/+2A3WZbQ5wsR+LDXs5XUfJzJaHQlaqkNsPAr1kV4=;
        b=RxKaAeckpvz0VeFKTYqLz7+xQN/RfDkiWbymLIlrK7KQi5+9+g87BUnhnrlwQ3nZpU
         y0su0rgAAo+ALx3mVMOnZ6g2HAu6unTXJkVa1BT5BrLfkRdUgx0i58VZi1ECmoT1MCMn
         GcGU5dTzztCiHs7pv1YS88O2QLsgr6e8tu+YGDz2Wm/0flR2q/wARSd3jCgda38P5lC6
         JRnwzl1TcYRR+hJV6XaMtjG+PhBjItNhn05wHSYCrC/ruP+Zp5fS1DKTxh2HqzyazF1k
         RSoYYCjoy0XeUqdf+wDpsh9DGvYAv0rb1elw6NFfjcUaYoXFshw/sZyqSaOe+OqsD0ZB
         JWxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739804275; x=1740409075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ih/+2A3WZbQ5wsR+LDXs5XUfJzJaHQlaqkNsPAr1kV4=;
        b=REUh+CqlWY36qa4cJdFuU6+Ik7WQBsjCrGZ0yIpAraed7fxY9wQw+U2fHBLjoZ42Gw
         jY96+7UUsWeFC4wvDNmn+246asphMLTzfDF9s1BtVHUcgZFE7m31UN2eJO89woT8if33
         XbOMz19glb/y8oEACcwrMtm0m5HM6S963GTtL5btKylp1Bi7xiaNjYJWLK95nBdv46HO
         5WClahKV6FVGLtaUdOvSzAGZ9UNP4yHnCN6/x2vZmxprIJrinhyNLZA0v72d+sHA6YvM
         kEqxISV2kOaFQS+iXnygQHvkop/2zjdROguC8fKVfnaylPqpZF0SW+7EM+MfHlKrSMMp
         l9QA==
X-Forwarded-Encrypted: i=1; AJvYcCWUrPyUxIB2eSsmmjS0gVx3FT9cT6UKGEEcVCA15GGnOxj5s1TEhw73waSWUiHIASy6FdayeA3O3f1xc+MD8vLl@lists.infradead.org
X-Gm-Message-State: AOJu0YxxL45bFXMC1EPvT98lD9fwh/Dz5Vtx4tYYhw7NSHfYkU8qzJJb
	ITFLDYHhWR+duYiEakNLj1iZrznDS6CGksS6ODsId9FG8PI+Jsx5
X-Gm-Gg: ASbGnctS4jHJ36uM+3bNRS0I6eOj65YDrz2vd4+uK/zHvh3dEVgcNTlMb4z9Ur+uuap
	qX+aKi+kmeJGyw2foA8sgiWF+aEKHd4SltP3Ua8upOIzx+pEhN5M32g71c+iyy82nQlEHf4B5VT
	GjWctx+mhD7vyro7DNcFyu3G5XFljE+iAElHLfnoSO7XLwSj+Mp/K6bktbx+H/1Z7ZNf8f2LY+1
	Tmn7bOsSvm8dwHgrY4oyNLv34phwrQqYZg9pziZfapv+WCAwjaSDHWKFkK5BeA5Pc1zu0NYVwvO
	6ybQRSKx88vas4z4lPEfl2EC+6EYFmk=
X-Google-Smtp-Source: AGHT+IHjp5xkbSer+ukVA4n6fLYTh4A8nSLa3ksBu6rUSbaeoJGAAh6W2etq0RvQn+XBG68Y744nOw==
X-Received: by 2002:a5d:64e6:0:b0:38d:c9da:d0d7 with SMTP id ffacd0b85a97d-38f33f125ebmr8481928f8f.2.1739804274990;
        Mon, 17 Feb 2025 06:57:54 -0800 (PST)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:48e7:ac19:aeba:f677])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25915146sm12645020f8f.56.2025.02.17.06.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:57:54 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v1 2/2] arm64: dts: freescale: imx8mm-verdin-dahlia: add Microphone Jack to sound card
Date: Mon, 17 Feb 2025 15:56:41 +0100
Message-ID: <20250217145744.179213-3-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250217145744.179213-1-eichest@gmail.com>
References: <20250217145744.179213-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_065756_690637_B2ADA549 
X-CRM114-Status: GOOD (  11.75  )
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

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

The simple-audio-card's microphone widget currently connects to the
headphone jack. Routing the microphone input to the microphone jack
allows for independent operation of the microphone and headphones.

This resolves the following boot-time kernel log message, which
indicated a conflict when the microphone and headphone functions were
not separated:
  debugfs: File 'Headphone Jack' in directory 'dapm' already present!

Fixes: 6a57f224f734 ("arm64: dts: freescale: add initial support for verdin imx8m mini")
Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
index ce20de2598054..3d0b149681310 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-dahlia.dtsi
@@ -16,10 +16,10 @@ sound_card: sound-card {
 			"Headphone Jack", "HPOUTR",
 			"IN2L", "Line In Jack",
 			"IN2R", "Line In Jack",
-			"Headphone Jack", "MICBIAS",
-			"IN1L", "Headphone Jack";
+			"Microphone Jack", "MICBIAS",
+			"IN1L", "Microphone Jack";
 		simple-audio-card,widgets =
-			"Microphone", "Headphone Jack",
+			"Microphone", "Microphone Jack",
 			"Headphone", "Headphone Jack",
 			"Line", "Line In Jack";
 
-- 
2.45.2


