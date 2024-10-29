Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C89D2AB15
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 20:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UiZ7/G9UNkzspOjV6MuvUoqfRxBzDKu6uAviqklHEbU=; b=5FFBQZafMbGYnsFHGNKoXy0rxp
	F9J1bBr49nHR+j3o9pwrC8g36cpI1JkpGsmSoa+FMQUf7lQ1wTl3suT1zIEaPhW3vV+rZbkNGJtb6
	aRaVtKckSjAUGT+vUHRVvCC6PJNYZC9bAnMiserFeJj/btmBs7vGfP15Vawm/huV+MfSQibSG+D29
	Ma7tAUS+Mq814vRUsgUJUvt9C7belWen7OGBcB8tOXFK9QWaHEb3P5G3SkOOqqaWz8w+luPMJj1MB
	Bcknv5LB5iaAzdZusXbexZxCs4qMlpjpBPUNB7Ixv//L3jQ1L1y26JCqHVT8ZVAgGONnRZnY3aexe
	dgEz9Azg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5tGE-0000000FtH1-3dOU;
	Tue, 29 Oct 2024 20:56:18 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5slN-0000000FlIb-0pqs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 20:24:27 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-37d4ee8d15aso611396f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 13:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730233464; x=1730838264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UiZ7/G9UNkzspOjV6MuvUoqfRxBzDKu6uAviqklHEbU=;
        b=DOaLBoBqQDwm5zynJLjCBv25qRkZkgggixCqkqo5FiwUXX7qcbpqeZsqU4AoNvBwbo
         UwkAzVEpBiDxlDDJltI8QIkzbO4Q4T510/o1Y6jKqJlNHor8pac3awytOx7KiTcJsLQ/
         n0B9JP2W45KxAooHCB5S3ZoCrSU6J0YwPZm30AyTFo1eExVbLRuT8aHOMerX+vVDZyUE
         yQ/twemOw/cuI6LHG5ewBQnRYoELAjpTEfcr+4ZXi07OPFLXv0KF6fdfYms14xIJNtWo
         i8TayUAIboJ/oEIY7NbPhctCHSHWOKx9dyBHaecN2/3JGIee6j39Rq0ouOEJlSj9lzOq
         fDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730233464; x=1730838264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UiZ7/G9UNkzspOjV6MuvUoqfRxBzDKu6uAviqklHEbU=;
        b=pTQKPQMsmnGt6byu7w/QJPBJgBz/xEP6fhAQn28iwl4iyS/8/KB409uGBj6HhLm9vo
         qRuDz+WlP0pP+zbGLrNV+S6N12p3eHzylw8zz7rM01E/e0ltiCx/KAiZcHNTFShRp3i1
         duvKwI/0cn0ncGEoUgyLX1WybCwvB//VNTrEUxHh+QNgjIFniZ0OMYh2Z8GPVf19MApu
         uVfs/4NePTSwv85vgqllACcsfS5olzTTA+iYePaDBLiz71wknbvg9ldn3n/miQy6BbaG
         1eUQ8JgTs00bbkF3AgiO44tB060M1EUBnBVUZwvie4FNRuf+aLQ8xdmQaEGNKS0Iv/ik
         0Z/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWvr3MB8j6oMno+GNgRZOySjJT0GvPSA3bRJOB1LcI0RCxRn43V+5NUMTL0/00KHOcstBE6Hj6eyiV14/KltnA6@lists.infradead.org
X-Gm-Message-State: AOJu0YyJM1XD5c0TtA+ws2GT5UMSFBEJG95G/fXrYwx8jX6P5UL7ad85
	e5dAkIl3SuDy4Mwb2CuxDH/VBtQgMYzPGCqPEAuv+mcARh3N7fBy
X-Google-Smtp-Source: AGHT+IHyg5QfVoIB0g8cY8WdGJ+yLFIaLjBBCklyUO2y4aO27Z1LJKejcrpTkw72xrOIrnw0gtfwbg==
X-Received: by 2002:a05:6000:184e:b0:37c:d0d6:ab1a with SMTP id ffacd0b85a97d-3806121f5ebmr4369116f8f.12.1730233463587;
        Tue, 29 Oct 2024 13:24:23 -0700 (PDT)
Received: from 6c1d2e1f4cf4.v.cablecom.net (84-72-156-211.dclient.hispeed.ch. [84.72.156.211])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bf85sm13619976f8f.42.2024.10.29.13.24.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 13:24:23 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	a.fatoum@pengutronix.de
Cc: conor+dt@kernel.org,
	dinguyen@kernel.org,
	marex@denx.de,
	s.trumtrar@pengutronix.de,
	alexandre.torgue@foss.st.com,
	joabreu@synopsys.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	l.rubusch@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 18/23] dt-bindings: altera: add binding for Mercury+ SA2
Date: Tue, 29 Oct 2024 20:23:44 +0000
Message-Id: <20241029202349.69442-19-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241029202349.69442-1-l.rubusch@gmail.com>
References: <20241029202349.69442-1-l.rubusch@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_132425_285727_2B0C1C1B 
X-CRM114-Status: UNSURE (   9.64  )
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

Update the device-tree binding for the Enclustra Mercury+ SA2 SoM.

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/altera.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
index 87a22d2a4..31af6859d 100644
--- a/Documentation/devicetree/bindings/arm/altera.yaml
+++ b/Documentation/devicetree/bindings/arm/altera.yaml
@@ -61,6 +61,16 @@ properties:
           - const: altr,socfpga-cyclone5
           - const: altr,socfpga
 
+      - description: Mercury+ SA2 boards
+        items:
+          - enum:
+              - enclustra,mercury-sa2-pe1
+              - enclustra,mercury-sa2-pe3
+              - enclustra,mercury-sa2-st1
+          - const: enclustra,mercury-sa2
+          - const: altr,socfpga-cyclone5
+          - const: altr,socfpga
+
       - description: Stratix 10 boards
         items:
           - enum:
-- 
2.25.1


