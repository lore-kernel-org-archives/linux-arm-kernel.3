Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530F1C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bQZpQlnfxb8+AbjkuLqrM6+tWlLtQf4du/oIELr93aw=; b=qikmLF/dOJZSTCxo7EHB187TTd
	JukQrXPPaKQUlTgBd6XjL/MZWixgBZHLFhnf33sBR45qXhfTWhYLsIZMyi4kdhr/yvfkZCEIIc76e
	rl4fxb3mfWr3q8RSwIc6axXPL5oSX/Dmm3zZ0ulwIzcbD1B2TU5UdLxWaCeaoF6k2rqMsuKzHzuL4
	f3vXYlg9Cy/HqvY+RMZWG/3dzTXLn8dOiql+Lsk00ABzQqJgw0iucXEkzE/Z1vkTg3RChVJYVOHFS
	oegw7yetsRsmbY1NkwbAhUhdlnHIWumaQXzgGHqD0sTxZungYtQZDpifVQOPy+RJOaBYd2fh6u+nQ
	ulL+eo+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewO3-00000007axF-3ht7;
	Thu, 24 Jul 2025 13:53:31 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uettm-00000007JNq-22b0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 11:14:07 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-adb2bd27d8bso14503966b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Jul 2025 04:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753355645; x=1753960445; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQZpQlnfxb8+AbjkuLqrM6+tWlLtQf4du/oIELr93aw=;
        b=mrggxRkNXCnbJPPGmL5srDVneLpKR4QlrR7ws4C4FnGr8yofR8+f7dH4I263KJ+s3V
         U1CcjMmagkuFaWsBIu3tkO/xOZXhlUUiN2ujgAYzm4ORe3IHy3FEGWy2Br0QODzGwBJM
         nVjbE8MMcyUSwU1YCaYMKpITAkMpBnQsem4W5TqNJpPBluz0fUSN69TOlCSGSq24xOFW
         b8OTPk4Dnl2QOVcCpNnWBWXrtWpCQMzvxzMT6BLX+601zbK5xAvdqUSg7JlfjPnHuLNh
         Kp1O3lGqtGElhh47uu0GKVgyGJsw7AwlRpfDtReriLUtnMTHkXQCE3F6aNH6W+MPWMKL
         +WKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753355645; x=1753960445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQZpQlnfxb8+AbjkuLqrM6+tWlLtQf4du/oIELr93aw=;
        b=EMDdKLHW0SYZ/go9bPxtQzNoRVjTzNjPwjhftAnA3J/8WF5c58NdAPXQy8cRcPkExA
         sAbHg22JnHk0A7kHcKhaG3JHeL6E9xKf5XfYIayExeJBUkFAWVqnIT8f9pPOLg2I9ncq
         qiPwDOsf0BclqOJ0iV0ETi9yBjij2IFlvOYRqqZHBUERuy1+Trbspc8QN+mO8thLLh9f
         ugFz5UZceVXWlAjifx3QnaECuXt6TRRkabd173EL7DA3OLi/uPdQORw50jMiNv563Md+
         bZ8Cy2UjwVXaxuLcCLpFT5NCxoJASe28/KIK/+1BdoOEgjk0ftBpeiJF45crIldN7DUJ
         eS0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWwMw7U1ye3XG0zZiGFV1BbDZ59ZpKRUw85Rvb/KZEhgsgS2Lb08Z2yArSYp/xsAYX6n2Wbm3zStJPC+3S/MPrR@lists.infradead.org
X-Gm-Message-State: AOJu0YzsKvqOWIuI1TulzUiSnHX+EwZ+nPFOVekXoFpnu9vCnpI/HZ2C
	aRvE7Eekk2C0EhrlLUkFVkYmWpHOH/YSB8aYMzNi0uOQnD1j3ZXwzW80ZnGVrhLjUEE=
X-Gm-Gg: ASbGncvLty34nrZ5QJDFtDrEAIYFv51j5ptEYvYcZVR8177TLOI3f3kdeR2w+IvCB54
	Wx0xkHzhPYQrTenV8pYZ7Z4twGlWUjWBtQ0p/eC9z0TeTBGG7oMYfKqpO8sLXHnnqj2WcB2qZ/H
	ocaqRrb+LyBOkt5/u6QuzH6JeC31fptPi3ooymwuxt4Ife9nIj8UE3O+EXeTRJVZSqd1DnmEHdO
	TjZ+zVp3wt67onaCuLm9mxDiwKWUYodjrli9jt6qOvRtzidCZXNY2gJzSmyui6znuWLpKAzgQhN
	HhEYRJpdDC2qpmeqsFsCq+01iRfNn6CCWe2kqwcajb2Z4zEMtwe0nAYUTPn+BPPU/cIFlBOV0pB
	hgLrYce50GcjkdA1Vlg2fb0nA1XOVNg1w
X-Google-Smtp-Source: AGHT+IFa0qQb9reYIZm1YmnTMClWxGtJ7wMFuJjmizdol6uz/d8+OmMad9nebjC8fBgVpRYvCf7I3A==
X-Received: by 2002:a17:907:da0:b0:ae3:bd92:e6aa with SMTP id a640c23a62f3a-af2f6d21a13mr251363066b.6.1753355644977;
        Thu, 24 Jul 2025 04:14:04 -0700 (PDT)
Received: from kuoka.. ([178.197.203.90])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47cc6b416sm98680266b.40.2025.07.24.04.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 04:14:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lucas Stankus <lucas.p.stankus@gmail.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Dan Robertson <dan@dlrobertson.com>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Dragos Bogdan <dragos.bogdan@analog.com>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	=?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>,
	Alexandru Tachici <alexandru.tachici@analog.com>,
	Stefan Popa <stefan.popa@analog.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	Ceclan Dumitru <dumitru.ceclan@analog.com>,
	Alexandru Lazar <alazar@startmail.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Angelo Compagnucci <angelo.compagnucci@gmail.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	David Heidelberg <david@ixit.cz>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
	Andreas Klinger <ak@it-klinger.de>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/4] dt-bindings: iio: light: Simplify interrupts property in the example
Date: Thu, 24 Jul 2025 13:13:49 +0200
Message-ID: <20250724111345.47889-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250724111345.47889-5-krzysztof.kozlowski@linaro.org>
References: <20250724111345.47889-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1756; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=b6N2umPNTV1IfL0+b1JOlj8SzHV/dhc713qHvi1TTIo=;
 b=owEBbAKT/ZANAwAKAcE3ZuaGi4PXAcsmYgBoghVv8JkjSZ8TS10rImPxhJU6HQEp0Ax8CdrPj
 oFHeCKo4tmJAjIEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaIIVbwAKCRDBN2bmhouD
 1+xND/dph6v3f/nk6xR6ZOVDJzqcxHAMQW0NMaZkXHLCSexCIrYiXqPYWGOTQr1kxGVpawORqWf
 WEys7LnslZMo0RJeJqF8MU49l5ngYTPO5r3uwWWR5ujBuBUgIWF40bZMZaNZ1jFzFh0x6NzQ8on
 fNRUkL5E+WhVNien8tpppc5W35sunUUoI67pNmo//pIbOY8l1YK4/z7OhPxQvtnBKTzq1/5ijPl
 emLzxmSY842kA/l4YDqE8VFKBmsR+nQA9jByliluWCNtbvkrQ8BVrXWFbnfeEo+Ts67krs0+Erq
 RdOszM9836SAecgYaVZyk/ChFftLLywwpXH/H0RUg0QKbBPYOkKDvj1wRYD9I5QHH0JHqyoLf0Q
 KkLiEFfGNQ/JZqaxildmiiHNEjQzacsj8YmT7HM5slfZoi6iWYz4WNHwzv55SFke2/1VNLEyh4C
 DsgO7tYJJ2HWrG+YPZTu6KohrQLV9M/CF7Gna6E/QGEI3FY4A6E8iSPvDNEGsZ03dfOkxOxM4Qm
 UxxJMk35cSze6vAI2pFfB03721d2x25Cf4RuX8hKGWUJ2yYM05eYGn1msvWybWR26ogcI0UG6Lv
 HvhlielC+QYEOhDWOSK7f2olNiVjRlngmx/32jTCIwy/0R+HRhYN/35eAAFRVVtmuuxE3sMMSym MHhpGZoVv9Prp
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_041406_536877_BE7D5E0A 
X-CRM114-Status: GOOD (  12.90  )
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

dynaimage,al3010 and dynaimage,al3320a are I2C devices, so their
interrupts are not routed to GIC and rarely first interrupt cell is <0>.
This looks like copy-paste from some SoC block, so drop it and also for
readability use known defines instead of hard-coding interrupt flag.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/iio/light/dynaimage,al3010.yaml         | 2 +-
 .../devicetree/bindings/iio/light/dynaimage,al3320a.yaml        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/light/dynaimage,al3010.yaml b/Documentation/devicetree/bindings/iio/light/dynaimage,al3010.yaml
index f1048c30e73e..1472c997c16f 100644
--- a/Documentation/devicetree/bindings/iio/light/dynaimage,al3010.yaml
+++ b/Documentation/devicetree/bindings/iio/light/dynaimage,al3010.yaml
@@ -42,6 +42,6 @@ examples:
             compatible = "dynaimage,al3010";
             reg = <0x1c>;
             vdd-supply = <&vdd_reg>;
-            interrupts = <0 99 4>;
+            interrupts = <99 IRQ_TYPE_LEVEL_HIGH>;
         };
     };
diff --git a/Documentation/devicetree/bindings/iio/light/dynaimage,al3320a.yaml b/Documentation/devicetree/bindings/iio/light/dynaimage,al3320a.yaml
index 8249be99cff9..d06db737cd9e 100644
--- a/Documentation/devicetree/bindings/iio/light/dynaimage,al3320a.yaml
+++ b/Documentation/devicetree/bindings/iio/light/dynaimage,al3320a.yaml
@@ -40,6 +40,6 @@ examples:
             compatible = "dynaimage,al3320a";
             reg = <0x1c>;
             vdd-supply = <&vdd_reg>;
-            interrupts = <0 99 4>;
+            interrupts = <99 IRQ_TYPE_LEVEL_HIGH>;
         };
     };
-- 
2.48.1


