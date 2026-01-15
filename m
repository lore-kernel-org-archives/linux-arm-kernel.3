Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7F0D41176
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 11:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6BNeAKcW11oL+iAABviMYbNNLfmxyGYsliVava+u3M=; b=f3Hc+YxmnJn4bTqn0cUu17BKek
	bOudTVXGe1HqZZH9drCLa3O5UsBOHltG2nOxhRuEBd3gmQCIHB+yi1QX5+nfjE0F1e42x5ul7MRm+
	E9cXfGPaSLOWYCBs9h2bHD5bG9SsuxBs12GyohL58w+5V5nGf0AMk0/mznhgwfjdjRuZt1AyLpXxn
	vLBsIOzkYLgIE8DeGvF24TFtE3DvsymEgpSMlcoBFIc/s5BBAJGAdlr9xz0tS/thNDR8xg9TVA6ni
	WFRFeKqs8CWDmYRse9EoNsAv1Qw2af1nrs4wP/noG2A2zLoEFhtyjfECGKZ8YO9YV7PYL0lrA0im7
	MzUShAlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLjd-0000000CFZZ-0zy1;
	Thu, 15 Jan 2026 11:41:53 +0000
Received: from mail-dl1-x1242.google.com ([2607:f8b0:4864:20::1242])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLja-0000000CFYF-3EMq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 11:41:51 +0000
Received: by mail-dl1-x1242.google.com with SMTP id a92af1059eb24-121a0bcd376so2136397c88.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 03:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1768477310; x=1769082110; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6BNeAKcW11oL+iAABviMYbNNLfmxyGYsliVava+u3M=;
        b=iepho4/4LVZ0JX8eSzRqchXUmmBf7kUdoRu5nMpE5v/yzYWJGRDDnpKMQyG30Z+2Bu
         MBzzHR28yTJS22/HwUxlfY0iFEBEP8aXlzNjHqf+TSc4AXtWUaI0teD2QT2we0yCJbpT
         BymSgYDcO7ssrBCJ2zyPauR1PPguieEynU2aZ+Km0IzKlWMJM5hfI+HIk1urZboXdktz
         5lQosj+I9eZmFrXGywWra42zC259LvDaCeXyiWNs0gXIqCNeqAIL6eijfXSmSf7EfLRY
         JcdSLkwYo2z23nKms1OD2vlvkqweAiRDapAsp7iHq4k9Ebjs8QqRRZKZaNDu6dNt1F7l
         /mzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768477310; x=1769082110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z6BNeAKcW11oL+iAABviMYbNNLfmxyGYsliVava+u3M=;
        b=pQJ+eW2zSqGE7n1o1nb3XbZWcG02X4fFvTiEGuMW7/gpczHg/koSMUqIsfauUULOB6
         XOyaoQr+KFSaVGeiJzwghtKI+WOSM4Daa+qIul5GPO0wp00G1KyoTxDcjBrCP6cbbPIL
         1XxiAcMMHYliIQI2Uu1lCNwbtn0fZhDLV9fLn9HP2IFH+wqVhfvVVnjvFSn8TgcLppuf
         na/YTpxD7+Fcqbtk70sJuhRsq+KVOuA6wNYDg04V1bw/kiQrbj7ZjljHXFh+PI2NvY84
         pNARPfbKQB4awxGvHE7FQHqV8G8WKPi8llr5cYSEfGFUnBqX90Gg0iFRyMKTCLsGIUyh
         6bKg==
X-Forwarded-Encrypted: i=1; AJvYcCV6uDFb6B/pH4/kw4H3PM+uj211uS2DIaGCqAXg/gbqU+Y6tUShaYcH2NpnAzCLjpizEYNLURnFsS0flyA7rIpH@lists.infradead.org
X-Gm-Message-State: AOJu0YzS2D0ElKCFY/cNzxa22Xs8l6HmB4qHC900hgLXlLvLGAEKr2hH
	jF1muYkOKGKVZpviy3J9OZdXyIjawjHuasL67oOQ3ryIoPoLMmgvsJTGcfZmEeNYJmY=
X-Gm-Gg: AY/fxX7UmPxeH2HEIqKmOMjC7adE+PZ7R64/DFe0mYpahGd1HlJRP3o6om2mP/tVlNn
	s8vMT5dPvEu5e5iw1n1a30antrctXTWcZgOL9/2MXnXXs1Sldp+A5Jx5yF9j1YGfu3kt6eMrlZU
	3EmaWYecrglPeq0cYG6KO6QhmnyccX75uk07wPjRfcA/HzVOz586bk7EyMeyibFW4ejdCeyME+h
	zl5tDUHxBImoGzbREJ72pqHjyvsWqypT2dmPG7hR3ne9zw1M+TDiswLwsL+IaxG1WIuXuecz+6x
	LOnNQ7gJA+EBW+j/fZpEAS6vBRmR+GC8UwE61nRg1uvUmBhn1IcFggvu6mHzkOKSE+E6j5lHNeN
	qsEn9ZKAMwVeuBXrOVzWkRD6LyD4nSF7CIwT8VaVn8aDuFh5PP4yjt9sTAfFCvHNet9bTbuw2hL
	IqtI7el60rORhF8NOwy057ulI11SIFOCT8R0GW5RRSXvagj5y7Q5FEpVzWERBRXWsqqWLd2k6+H
	DJ6+YjB
X-Received: by 2002:a05:701b:2715:b0:123:3461:99be with SMTP id a92af1059eb24-12336a38feemr6814416c88.21.1768477309977;
        Thu, 15 Jan 2026 03:41:49 -0800 (PST)
Received: from fedora (dh207-14-52.xnet.hr. [88.207.14.52])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-123370a051esm4875347c88.15.2026.01.15.03.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 03:41:49 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	lee@kernel.org,
	andrew+netdev@lunn.ch,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	linusw@kernel.org,
	olivia@selenic.com,
	richard.genoud@bootlin.com,
	radu_nicolae.pirea@upb.ro,
	gregkh@linuxfoundation.org,
	richardcochran@gmail.com,
	horatiu.vultur@microchip.com,
	Ryan.Wanner@microchip.com,
	tudor.ambarus@linaro.org,
	kavyasree.kotagiri@microchip.com,
	lars.povlsen@microchip.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 09/11] dt-bindings: arm: AT91: document EV23X71A board
Date: Thu, 15 Jan 2026 12:37:34 +0100
Message-ID: <20260115114021.111324-10-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115114021.111324-1-robert.marko@sartura.hr>
References: <20260115114021.111324-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_034150_812775_8F9F08C1 
X-CRM114-Status: UNSURE (   8.14  )
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

Microchip EV23X71A board is an LAN9696 based evaluation board.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
Changes in v5:
* Pick Acked-by from Conor
* Pick Reviewed-by from Claudiu

 Documentation/devicetree/bindings/arm/atmel-at91.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
index 68d306d17c2a..bf161e0950ea 100644
--- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
+++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
@@ -243,6 +243,12 @@ properties:
           - const: microchip,lan9668
           - const: microchip,lan966
 
+      - description: Microchip LAN9696 EV23X71A Evaluation Board
+        items:
+          - const: microchip,ev23x71a
+          - const: microchip,lan9696
+          - const: microchip,lan9691
+
       - description: Kontron KSwitch D10 MMT series
         items:
           - enum:
-- 
2.52.0


