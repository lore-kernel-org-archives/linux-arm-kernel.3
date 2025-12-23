Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F78E6FE2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 20:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PfrUlgr4mKAwpRgF31HqFmZ+jq2Qg/gWBBCl9WoQ4uk=; b=CCqEahXhppmnNUXNFaOafZab2H
	3d6lcbocjJhwr3ofobRO4WGz4kwDmyN95dT044ldwNyRYX/WDXeO0f+nIz8YdTKnl5THwdxkKVz1L
	bRecValyT3RgAuP0vRhFOTHmEoDxheX25PY+1dlqzepDeBNFwSUE8c2/ELTeUhyL4Xof7eDDRoVqj
	wnRghINveZ3yZPMggy2ow7gC75poqQ/atzM9LwCP/6ZvzDcY23ats5o1MQo8VY9NCre0/9n9BEV9G
	6+jEPf7e9Xm3TS2Tfa1twXZ8Y/eAcUAQE8A/0PHm+R2WwvOvhVTHWgXD5s97qpUFTR1FkKJnYyIKo
	kIVZOQhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8ry-0000000G2rY-491t;
	Tue, 23 Dec 2025 20:20:34 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY8rx-0000000G2q2-20T2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 20:20:34 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7b8e49d8b35so6588184b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 12:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1766521233; x=1767126033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PfrUlgr4mKAwpRgF31HqFmZ+jq2Qg/gWBBCl9WoQ4uk=;
        b=lcwUJImsGoUG4cmeWCytVtZZJxn0k28VPXTIf5Zf6O0SdX+7f8hkF5E1Z5smXNe7xI
         37ZId+Kk/fnKen4aSy2YG4m4/4XfPAllU61W8qGUgfW+QJojzt2NgPAqZKkaidQMMeOr
         VuUAno1wN6ROXv9oWWMPKIw5igRnYwbfUDZ+zAoUq7oDGwE/Z0VH8TJf7oxy0Xoj63UW
         TfFwu+jPcmgB87S3NZfZvibVC+ikZwz27+8Zl4ZZKJUKkfHtj/f+wFDdb3eoyREx2uz3
         qWYfT7CD7p6P3OT/r3/OcRdlcUob+ujV8dCX0j+oQmlvDf8q9BgcCjcPGFyijzYoeVq+
         Jdhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766521233; x=1767126033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PfrUlgr4mKAwpRgF31HqFmZ+jq2Qg/gWBBCl9WoQ4uk=;
        b=v8Vz5Cn/REfPSLp4j3sSeihbBT9qaM0lb3FuygLhEhfwIBVTsvmKCvUUeUx1tleqQw
         DVO1JZNDwfyOJWUBRcHOE4KUyOAESzzyHm1k5hgP6Q0uUMBs/P8/0G2Chcv+82YhHocw
         SVQtCUqhhAgaxuWUbQnDCncKn9DNnxvuLOjZpSzo/dDemVQcRFt8tqy2Duea3P0vvXdx
         D0+917Dy/Q/3lVsB/HE90hzQutWr43zg2zyarcLTSROxJ05ZuVwVbuzHRkJ9TooNRyjS
         xzlEy6LaXMfOzDkOhoRpSCGBj2aWJWzuhoaOg5+UsTyq3sxBdeI3fQLbQRVPQulWx77g
         o6Bw==
X-Forwarded-Encrypted: i=1; AJvYcCVOUfe38aNButGBPhwiv0UGTh5XKWERS70tP/Dpzt1njvc3jTlrb5egqzcVtDMbH0hC/BP7kw2R4Ki2W/PupmRA@lists.infradead.org
X-Gm-Message-State: AOJu0YweAn/seWt9vv5VyNsnV0l6OapT+6wOIpTUWqBcgindoPdHUNMs
	IfCGl5kPIlLPmC4kKzCHt3s4PwKIs8m8ipz4ZNnwgRMkY0aTjZOMHGcuPlrH0qUQMYY=
X-Gm-Gg: AY/fxX6HT11/vS2645mlZelMl5k6s1Jf9Q2sf16o2YmPQ3wV+yFLmrRXwIsB4RjcfCn
	GmXufRgT+6h9aDJjdr8pMfj0hPy9qUZADbjybKPreaXV2TuGKzuejVke0avLbO4NsYO/6QN/Y6A
	BRvVUhliauJfIbXeQ4wI/dd7dse5sOuESQF/LCYB/Z8XRcyKr25QBI+w3FK6+fHOOCHYPLsDzpT
	szGjx+gUNc3KhrGbA5fEwaYnVeKkZ1S9yom6ctNirZ+//MhfT1zTv+SGM3boDMpFR9HaH2mZ7Ay
	TnPGPvbJdqLOM+Ve6JPTA5LwozGrauKvEyB8D3MKrBfL4ZQarA8+YuGsX8RqjsA52R/U8BynIAH
	GLO5LYWLnqJZwcsdNUHMewyuBckClXnNhbSjCwk7mXz96Dqxx2x6L0p47A4aa+X6zqcML1qFhzr
	vX63aGFc49MdDAEXTGjIx7qlwix/7ebrPh83kRl9YLlap+qt6v4FpjLV6Wj+UrWkwlSZah3LW5i
	qR2keIK
X-Google-Smtp-Source: AGHT+IH+vGo67Kz7b+8QZvoO1bYGr/XHDGO/seoLyNk1DncRQFKXbN1uskDp9cfikbL8HUPUhf7HaQ==
X-Received: by 2002:a05:6a21:32a3:b0:366:14ac:e1e1 with SMTP id adf61e73a8af0-376ab2e706dmr14672619637.71.1766521232584;
        Tue, 23 Dec 2025 12:20:32 -0800 (PST)
Received: from fedora (dh207-15-53.xnet.hr. [88.207.15.53])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-c1e7cbfa619sm12567549a12.36.2025.12.23.12.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 12:20:32 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linusw@kernel.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	olivia@selenic.com,
	radu_nicolae.pirea@upb.ro,
	richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	broonie@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 06/15] dt-bindings: i2c: atmel,at91sam: add microchip,lan9691-i2c
Date: Tue, 23 Dec 2025 21:16:17 +0100
Message-ID: <20251223201921.1332786-7-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251223201921.1332786-1-robert.marko@sartura.hr>
References: <20251223201921.1332786-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_122033_524447_725AAC77 
X-CRM114-Status: UNSURE (   8.59  )
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

Document Microchip LAN969x I2C compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
index e61cdb5b16ef..c83674c3183b 100644
--- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
@@ -26,6 +26,7 @@ properties:
               - microchip,sam9x60-i2c
       - items:
           - enum:
+              - microchip,lan9691-i2c
               - microchip,sama7d65-i2c
               - microchip,sama7g5-i2c
               - microchip,sam9x7-i2c
-- 
2.52.0


