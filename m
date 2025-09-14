Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76FDCAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 11:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cXrnMo8AcgyeVtAkkZty6h5coZF1I0BtRGtERaxF9cY=; b=CwcMyPs8do6As2l1V28ZF2G66q
	Q3owGOmEBt0y1CcOImfpSnPLSwjGlbXjDHjPb8xn/sQWj9ziVSXLImw0EviJpJkMYSehZ1Bei+4wW
	SCTXmNav02YtnEtfiQ29+BDPheKF+EvyPeCqqvjqbFDkS2oVNIL4wwp69s5lGDKsZW31U28X2amrQ
	/KNQI9wiFgl9uU19BoNcR7TT7w+Wko+pME9m24QJF+1alEBhoDr1vtIP5WKT25n4DWEIOs5wRUk0Y
	HUZNjwY3p8uYxb//8Us3E7W2RLBB1RR7VaAsscLFZuOOKu47UuKdeRfBy5JEX39nDUZsSS2ELRq+7
	UcydB3hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxlAK-00000000zpO-3ZD8;
	Sun, 14 Sep 2025 11:45:08 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxlAH-00000000zmz-48sl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 11:45:07 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3e4aeaa57b9so2860994f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 04:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757850304; x=1758455104; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXrnMo8AcgyeVtAkkZty6h5coZF1I0BtRGtERaxF9cY=;
        b=ICh/1C3Ebqd+u8V3rZb6novair/fMs7uy/V7GgGRqqnbT3wihkJH+kK9Wgh8r+zxYU
         Euk6tspNrhquxjEafORiXhm+xy7FeIGOfrzrQJ1h2XZirgQRYUyNwUuJomTTrD6SGyco
         gQCACSs6FxbRBY8ysc9pA1T/M2n8+BmIRQ4eTB9mhfHPOQCsEoxH0vosIDhUy1WxzVwP
         v6MfYrAO2uCPHwvMLN7rhZWl6NQIvZnG6oPbH0sJALtT0dB5DYHuadfQF358n50c/9y9
         +zbTEJUQ5sthk89OHnUcYIiFtA2GyShxfuRB2hLlXvcfYGcMSrZ1BJLGsoKK9cwxoRN5
         kb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757850304; x=1758455104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXrnMo8AcgyeVtAkkZty6h5coZF1I0BtRGtERaxF9cY=;
        b=XS/VVN75khpyUc2Urkgm4xQugdiHAUBtMJE+buwVUXt1W/FOx/XlhWesU+l1WqhZPo
         mpclTPLnliMBsy3xYn89wCAFrYeucgKR//IJybEqHm4Q5TInPGE15mhT++125mrLOPQM
         3PeMby7FQ+yksJUjpKW0mD70+jFiY9QECCZTA5OOnT4495A7sA8mmrbz34Cq3yccrSJm
         2dmCDhGobN7J1J3uNUYPg7sB80v2UOl3OMuFfWJNkyCO3N7ugXmCN3+PyGWDJNu4eO1n
         GAw5JnR6Ero5QuNSepY+jVDUNs2W5JqeUyVQR56CGdGOMLwtudG2oBwhfK2W/TzcyrYL
         O8Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUd0NpsNYEMhiHUajQKIK2vZ6CIAQZOIYyCCkyjSFjvOdHLrGBuslvW4bdv4FQF71Mtj1ik183a4RHTELGRIBFZ@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt/KjRIFOu2gLaiJ/siA2OtYj5icNy0p8u1ciExUM7AT2EmrV1
	H69umwl8XvT+kCWmMeCZemPHRBf8JM06MlS/K03NoDSTF5FQqiVfgYB/
X-Gm-Gg: ASbGncvgv7BuBk2YZa1NXP6bbsp89ma9S4YHW1UR96genFVa4KyPcaSY0Doiay0mcLG
	qA9tDDFT3mXN4SvYdZmUR9lwHwcqfTindvjrNrvzdNo1uJnXuLBwKViJOAEIHdbQMjBfPT2taY+
	vMKqi3IxUvswSy95XymC+E6qj7Y8y0/ujvVUPaa1XnzQ/a6I6JfMCgSxyDFxo7ALJaofO2ICOOc
	Vv8EtCl1rwcQXmJpSvbSe3idt3BX0jrdzoNJaWLvP7rRGm7fkI19W2G5l9GSK/XGfTmfMEaU5U1
	inboaL6P8v2DxS8lZHbTj+t+Uu8HfVd55TJ9revcj6MVtAXv6r1wx2NovuvBkpSGllBFog1A1oF
	nPeHnn+w33EfD2DCer35U5dNUPQiI0xPZVMlYibhZKN+5rGgtmOpihr2yBHKmMiwV2c2fBkKuoH
	2tCbjmuKF2
X-Google-Smtp-Source: AGHT+IESZdZImuHvupg31XiagY9dmwJfZhjEPnB8mK2o9JeW0P+8+vI82HCX5Qrgtqz633EQ0Ul55Q==
X-Received: by 2002:a05:6000:2284:b0:3e7:47c7:9d5 with SMTP id ffacd0b85a97d-3e76579652amr9007686f8f.21.1757850304075;
        Sun, 14 Sep 2025 04:45:04 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ea21a6e4basm1503252f8f.11.2025.09.14.04.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 04:45:03 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/3] dt-bindings: pinctrl: samsung: add exynos8890-wakeup-eint compatible
Date: Sun, 14 Sep 2025 14:44:56 +0300
Message-ID: <20250914114457.2610013-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250914114457.2610013-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250914114457.2610013-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_044506_041307_15725FFA 
X-CRM114-Status: UNSURE (   9.91  )
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

Add a dedicated compatible for exynos8890.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 .../bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
index 0da6d69f5..dcd96104c 100644
--- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
@@ -43,6 +43,7 @@ properties:
               - samsung,exynos7870-wakeup-eint
               - samsung,exynos7885-wakeup-eint
               - samsung,exynos850-wakeup-eint
+              - samsung,exynos8890-wakeup-eint
               - samsung,exynos8895-wakeup-eint
           - const: samsung,exynos7-wakeup-eint
       - items:
-- 
2.43.0


