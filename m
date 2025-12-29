Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C4EE92FD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 18:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PTgt2hO049DGrJM4Ny2YlS3thIKNeyR96EH9617zL0Q=; b=l6CHtVY9nM7wsXFPMYb4UTLoW2
	iFTtCood366q6L0nPlKY22Ud+fHyRGQUqHgbcW1FGYspU6UrzGm+6QPshXGhTXIE+ohIn5tToyBwY
	IJNTC38BYIcpuiJHTWlYKIcuUQ/HeQ+ERAU3pAGUmtFti6kuS7Mwf1qwOIlROhNCxiXz0r3IK0ZWV
	ZffCxckKUheZIabSWuQzKTtqcE8O+jPqROXfTImW5fWd9Vi9QipRg55Bvxu4LOSXMSLVwfRFevdnz
	1Of+RQJHAK5HcLbDbi6dGofyYpV4JoihSwUY7/ezsrO0Xi+zEpUqcRxkqOB8Qphh7PnFvugTIIjVF
	p4XpC/qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIAW-00000003xaq-1JOa;
	Mon, 29 Dec 2025 18:40:36 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIAI-00000003xTy-3NJu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 18:40:25 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-477563e28a3so57266925e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 10:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033621; x=1767638421; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTgt2hO049DGrJM4Ny2YlS3thIKNeyR96EH9617zL0Q=;
        b=VdPpe57paOIoQ55L5Lz4MqpzRTpyfJxgQauWI2q+gxqFm57PwSag9Fbf/zmUnSMtbm
         UyMxYJJ+D3woHDpSPcDL7E91riuDUAm57upCLg0BrWAfEdSucI3y0RVr1Gbvf5s/P2fx
         FiusCH6uOdbTqOfI4bwDd1hCI+fUbFUR7JEiL+7FVOXSnkzBSST5lVVYgsG3BWVceUyq
         7YuDz+kI6oOYswVlgcxdTOf6c8ulCHn3SmgKST/FiEkXavEZMy035x/VMxBnSPdlrstQ
         MXYbU7TsQ/kgTnxiCEiivifNOqvRPEkUoDEhdOYuEQFQ8NRljRr0Yf2GUqKHWb9LlghQ
         QZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033621; x=1767638421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PTgt2hO049DGrJM4Ny2YlS3thIKNeyR96EH9617zL0Q=;
        b=ga2PGOY1piP2i6Mc18QEAYj/G7HAfdop2XWK4/A7QIvVMnqyhgv+dBNWx/fgn8qK+z
         sOk4o4NJwKZVcjS4vw+AEkJ81nzBQFlJlhGPs037kqqJGDoK8eB140Q6BMcuv1pe5loK
         tDsdx8AYVk4xrK6pa9DdsWCdkq2VslDWsFpJKZeL6Rzu5S+8eZ5B3BfZI1ijeHZ68Mov
         0kXjW76pmglsQv2JI1zPBsgbF3UclGI6xlXfLbUQ9O9C1b+NIO/dM858++GC5pllQ6bX
         9rZRM9a1bWQwNRCTiiWoYS8JMWb0ro8alFiiz8uqZ3eP722SHHikHRtnbE5E/FNNwePf
         D8KA==
X-Forwarded-Encrypted: i=1; AJvYcCWbekaRLj2aGT8QOohabxt3eAHPkIUMhwpi9OS+ouUeARlRMr1GNzmRbnTROOfEQDVlUhCNVOhBVnWnpNzwv+ia@lists.infradead.org
X-Gm-Message-State: AOJu0YxSNcI1dJQ/PcwtadIFGHxC/KYqY5T8JrRSDHm4NTQklQ7kb58A
	u1YU9I4KpARAaFcf6TN1nPIGF5/Ar2Kd1UNjmAx9kPu+/buqnTU1eD0PMa90pvHO7yg=
X-Gm-Gg: AY/fxX7KjBsdFAAyuCfGzoXZUbKd+MhcLwUS2k2aTY3R6bQnft0Co81+TDjI94bCuR+
	UcRVXmmLwhbv2DAKobvt+KkbnomWBJbkOWQMOfXGHUh4FG9lSkemA4yUm7O4B9dWzp4BacBBLNU
	pngU046VG2X1155O5MxuEFQuKAcqbZE/NU3EMS65I64pCETtiNACht18oZLo7PPt5QTTD/IMBBh
	KNAL5/c1HwTxhFS8yRdgC3llEzsoZ6oOb00rmucl3ldotGVdtfzWq4KmJRvIaIC3vZkTbDVotOs
	GpCT75UPmKv3MBWg1pjlLYj/Ut3trGEITuXsIDAsfCrhE/7PYMXVN77wj4Nfmp9HzmRTqpBU6hC
	8kvY4VNU6zszYVubq1oTKANA87gCpvGS75prLHmHfv85SfAKdFYw4EwvINW1Eftq3GeEo2C1bCe
	6rlK0XQDbxR+xv8IMvLq4J9zcGTCLatu6/ecMw3/AvF9/+5fP/W7ajL5Zv5p/WTYt9r1MXPRAoa
	+lLiHprscHMFsSsMixqtGWOPNEh
X-Google-Smtp-Source: AGHT+IHraG/JyQO9QwP0oXSI7eMgGvD7CgkRfD8/mVOlJdqCEGZOX7/g3w8MfUOgGbFTAvRzzainqw==
X-Received: by 2002:a05:600c:c493:b0:45d:5c71:769d with SMTP id 5b1f17b1804b1-47d18ba7befmr332757985e9.8.1767033620871;
        Mon, 29 Dec 2025 10:40:20 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:20 -0800 (PST)
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
	linux-usb@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 04/15] dt-bindings: spi: at91: add microchip,lan9691-spi
Date: Mon, 29 Dec 2025 19:37:45 +0100
Message-ID: <20251229184004.571837-5-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229184004.571837-1-robert.marko@sartura.hr>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_104022_851188_C89070FC 
X-CRM114-Status: UNSURE (   8.34  )
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

Document Microchip LAN969x SPI compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml b/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
index 11885d0cc209..a8539b68a2f3 100644
--- a/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
@@ -19,6 +19,7 @@ properties:
       - const: atmel,at91rm9200-spi
       - items:
           - enum:
+              - microchip,lan9691-spi
               - microchip,sam9x60-spi
               - microchip,sam9x7-spi
               - microchip,sama7d65-spi
-- 
2.52.0


