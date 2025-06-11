Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2009C71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 02:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grWWpqkFx3VZeZHS3cu1IgF+mji/0suRYvkUNQaAo2M=; b=AIbB2v12kAqEn1ZGqg/Q9iLaiz
	92PiyCDFP1ZgYwaQ1gdygPzujr5xFeB9s2Is5NHdGtVG9Pb6MJGqEr00RmK5ylAyQ25ii5OgoN+Pd
	Of8IhgpvjEqZf5EbjuE+F2IXPDPu7oXnazOKaazfCLeiD61fOMify+AhC/pmWaUBQwQ8hdCJsTFp8
	L3HO3LtqHnWHZWz7biwJ4CKVJCB1lg/Cn3mBU4IO8pvmM1uxdP9hoSsqlGBgxz1OVLuWT7rm/Ypd9
	eLUuduEJ86kHFthWI8m8NSmXJiLUPuLxSI0QhXnEPqFsnBj9eoYlfTQ3JytjMO02O0lnWNEBD/E/7
	eutN/rvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPXlu-0000000Bypu-0PCi;
	Thu, 12 Jun 2025 02:34:30 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU9b-0000000BVXp-2ThU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 22:42:45 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-406e31162c6so124084b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 15:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681763; x=1750286563; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=grWWpqkFx3VZeZHS3cu1IgF+mji/0suRYvkUNQaAo2M=;
        b=uwIg2ZbU3qmNUOeT3ODu1KgyRAEDd66GQb4yOjylC1u3TjY16U/8e8Q0ZoGHrhSsKf
         1kBYdoLKBHkLNOgSc9PmP7KNM4wHL0FrRlojUGgm1Dm4HwqR870SEOJObC96O9nP1jH5
         bzs5VVBCDiBW2IHbFnYgvG6RzG1+MssqWsiPGm6MbpxildvLt5rUaNKvgO/hFj+to2xJ
         4qKFUHDJ3IMq4zGebMZqaVqBa4Ae8dL76kp2Q3RAcR5r8KMRZ2VYkioCPMDcp4X6rvRM
         YqH4Upyy6drWMlFNKhGJRxG2n/qKE21Ioi0pipXQ+u5zQOLqnZoOWLZ/FLTfwaIT3tg0
         9t5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681763; x=1750286563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=grWWpqkFx3VZeZHS3cu1IgF+mji/0suRYvkUNQaAo2M=;
        b=q7jnQFpRgnhilLnnkIU6Zu6EAI0knThtIQbfNeidlJvOy531Yp0KBMLiwFToWiJ0Kb
         nBvxzwAUB6mmTMdaaawCf/lWMfpumcGtVeddJykr4rOGQ8GJJeo+086sWOobngAof/jQ
         ivbDzt1LQR++Pad8JfRcs+8kjwB7YduhZ+FgLF7sUPceBdRDV9z1vG8nHUz2yUma+pMK
         aBOh5ovX09XYtrtPXJqlQuFkn9jJF+WolyN6L7Dyw202yTJ+ZlDi9Tca+yWzODbsZTvj
         Azpp40kWKhRh8mZ4uuIS5eV6bHeaMbhONn36iSCgrmBLO+DK5qGSd9xZrQv2FMFVDSkl
         tgsw==
X-Forwarded-Encrypted: i=1; AJvYcCUfPfQoqQMt2j7ziVzYEhr7RlaE1v3j/PPXxwSlHt9CxILsc9kLKZO/2y8e14C4JrLRRGShhE/5YD/6BcG3+FE9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9/KZvNLDdll0AkLG06KArAS5Jarf/VaAzMNkDbm0fQV9GwxV2
	jp0SXDz2v9Omd3iiuOLW1ApkedWQTMTpAGu4iC1Hc8ooKRzBUhp5yeHYW/ieO3SBypo=
X-Gm-Gg: ASbGncvhAxWvItbc2nebyni8CxuqGQGl2tKmqwDWxgTndkhARSF2pgna8xXHccVC0lh
	Zz97TLDC6XtWqf78CmuwfgYqKrQ2jW4Wz2GLxzvQAVbs+C3A2nEeyWsTSYg+fB0didCYiYnaEaD
	7WVytT3OnSqkvRr7K//NdbMEZvYMzFHwTFMPK8CeqI5K1GCoWrcjSdCxMUFLoqPL3Hvl5yvwMh6
	XgR28BElcikOgkPOg20RDVgK/D+EmIa4Hoz+CmnHjZ2DVyOi8VqlQ37PH+urE3DD4lvbiyaDQM/
	xhqgB1YobE2bD3s5XkqWkiLwpuprgsGzmXACYlXREYH4BE74UItuL14FjWbZrdKAnMy90NZpU9M
	s364=
X-Google-Smtp-Source: AGHT+IEcwqu4j736p3LcoP9RK7c1t3h3vtLigrmQmQXvolB9PCLNg9UOQOYCbdmCSMZJHTC5173d2A==
X-Received: by 2002:a05:6808:178d:b0:409:f8e:72a4 with SMTP id 5614622812f47-40a5d05e776mr3722453b6e.2.1749681762900;
        Wed, 11 Jun 2025 15:42:42 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:42 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:05 -0500
Subject: [PATCH 13/28] iio: chemical: scd30: use = { } instead of memset()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-13-ebb2d0a24302@baylibre.com>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
In-Reply-To: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
 kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>, 
 Roan van Dijk <roan@protonic.nl>, 
 Tomasz Duszynski <tomasz.duszynski@octakon.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Mudit Sharma <muditsharma.info@gmail.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1024; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=5XDESMLoIhQpWzCEq2C2tgUyVZF/Bo3//3/twALhLps=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgXZRwKjwWR/y52G6u0y4MdHz3+z3OU7EB2di
 1dhrLGz2YmJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoF2QAKCRDCzCAB/wGP
 wMtsCACJ/xWk2LPxNgDVgxzxAyBLwPF0PwZ+uQ2OnVZ/GKv4J2FuZDLTEK8T1XbSMOtLfNe3Emp
 g1WSmomvx01TlhG5cJCNgELnTbtZDAKvzuZ3aJ0YaAlab0axLhbvOxxqK5KcfI7G1vuzwrVwjRD
 txipOkAWnZ1mGS1U0hXSv4oYKB16S5Z56mkqqgOjtzjZEb1+YGybjl73FD3eN1K5SYYrp2Z6aqV
 glfuOs3MYd4xbj9SpdPMC+zKvBKyjga031caed8DL3D7MvrboWa/CoWmmIAJfMRFoeO2+yr84yT
 zqstaruPKxBUMHnLEBtRUeoXXFrx6mJM3kA7FDJl/xC7bJkC
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_154243_678125_6BBED3A0 
X-CRM114-Status: GOOD (  12.40  )
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

Use { } instead of memset() to zero-initialize stack memory to simplify
the code.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/chemical/scd30_core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/chemical/scd30_core.c b/drivers/iio/chemical/scd30_core.c
index 8316720b1fa32b9746b4aeefe7aedc77b3ba57e6..5df1926cd5d985a60c7095f692a63093d522d434 100644
--- a/drivers/iio/chemical/scd30_core.c
+++ b/drivers/iio/chemical/scd30_core.c
@@ -587,7 +587,7 @@ static irqreturn_t scd30_trigger_handler(int irq, void *p)
 	struct {
 		int data[SCD30_MEAS_COUNT];
 		aligned_s64 ts;
-	} scan;
+	} scan = { };
 	int ret;
 
 	mutex_lock(&state->lock);
@@ -595,7 +595,6 @@ static irqreturn_t scd30_trigger_handler(int irq, void *p)
 		ret = scd30_read_poll(state);
 	else
 		ret = scd30_read_meas(state);
-	memset(&scan, 0, sizeof(scan));
 	memcpy(scan.data, state->meas, sizeof(state->meas));
 	mutex_unlock(&state->lock);
 	if (ret)

-- 
2.43.0


