Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B954AE92FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 18:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pe7/bfwW61qpTH+JIS3AKR1VkqKbIoFXot2V67cYu6g=; b=UeXySShme+YRFIEZyVG/6YIvhC
	JfzBdN/IMDvL9WRwvX4KFTixlUEf/PUCG29zUic2NYojcDoP/KoQPPKRn1r/MpIO+pP+H0IxadYjy
	AI4as5G6olt7pLstYODXLK0BRLCEAXUJr+nuOH5FzbU15+/AK0RhZnoFtAgIhWwABvNDLFu607dve
	udnQRQwoGAx8bxwt7mGUG8CeYXmuXXexhd+8CUpukOL+Zb5UN+N0bMRzCSsWS9vUHhjMhdjjeQUxf
	CiJJPyedCQkbB8aZXQuwsdICSqDidNEmmUnRQCYjsckOat0nQkwrNp5pEm5EehFRi+FJ58QMDnFoo
	lNnOpAEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIAZ-00000003xex-0Xwg;
	Mon, 29 Dec 2025 18:40:39 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaIAT-00000003xZ9-3scw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 18:40:35 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so68343465e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 10:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1767033632; x=1767638432; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pe7/bfwW61qpTH+JIS3AKR1VkqKbIoFXot2V67cYu6g=;
        b=nKwx+66vCc9dJKkbegcthJOyrtSfmlGAzyToffFDx005KdPq37fPSoNE0JWUzvVR0F
         X6W9rKR7MxkF8SdpuZEa4f40sTS+zhXpRrt+/QjyNTwNS0pjtEujS1OSRyapgajDv/gU
         8djoTDz58jIP8H6Wam7WsduSxeZa7dI3jiLOIV2Ti7WQWsGWb0al/m5x7wTM+Aoadsps
         AeAXm3bpHKFJY8E0fyuXkuZIJTBM68VzM5IydQc0A0K2lNaSWN7CBMd6aCVLABz4+vJQ
         ofWeavKDTTI/YZx8yksFuL3P+H2ctgFeFjLLaJ2CAE38p6I/M1Oy7IJHsug9Ol2+r8ZV
         Y66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767033632; x=1767638432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pe7/bfwW61qpTH+JIS3AKR1VkqKbIoFXot2V67cYu6g=;
        b=fr0grZeK2uwQSZqud4oY2ipoLQfoZ+2JNix62nqY5L+2fuGAVWwrTVXHJn5NR/K7fF
         V/M0N89hsnB1T3u5uo9U6aB+4JRjsg5ZogDXtiWOm5JAhTEM1S5DGdd1ZwGN1rL2yb+7
         +R1LkMTHFGb58CbYaPWeNbcAvYDraIKwWOAqESGBzYQPUGOKs71yUj7vyHRWtq0ureaY
         Ku0M5NG64I3DBaTxg8xjR5iOUPl+YFk5JQKMiuh/FqZOtlu9Jb19keNqNB9ccaifaKt+
         /b7tGjUk3gDOK++J3bjzg2KQ0/iwl0Iqd9oruzgyRVWNAq8JroAsJZF6/qfWKcaH2M6D
         umdA==
X-Forwarded-Encrypted: i=1; AJvYcCWHkCGi2geLIgmuggZ0VRRYW6NbOSz3/hSbrxJJX+f7rffh1cLkx/wyrGh0GEDLhFXXXqaxEBNKD7SVXGRcy19F@lists.infradead.org
X-Gm-Message-State: AOJu0YzpOJ38KW1wXWR9aWdpJIFYPMnnov9RQTZPxw6f8JS1KhWVP82/
	sz+gbiyvf/y6CpKtt1fsmWx6JvvdgOj4XqCyMK9xhmrpqLnmjI36VuS372S2IK5hiMc=
X-Gm-Gg: AY/fxX6sbU7a2GArEDdGk4HVTKCb4x8LnOFIkysDsCmMRVXuWd7JOX9g75le1PhrXF6
	3elgX9a80QfFA8y+u3FS11ZzuhshtzlOQIvp3+Vxi7d72ZSCetk2e9fpCAMISFJcV1qLnAvcxOm
	pqr1eV9mzNfsUdE1x+pjUaPk5jAlKgHg269I6DozZ6qtwBcUarj8xpNawb1VCLr+IQe49UYtD9v
	YEKptktjScirEQ1wmxD7RMSTcxsR2ZfEASj41zezqx5Ui8F6Q+FP8AcvTw4209zI+mdHK0bhKmb
	0JOWfqmzlle2WrX73WIaUvXlQNEp5/PfxzhAMyUwzrnmOQP3WgL/cnINeWFNkqdkLz3SsDFZZXY
	Hy0vXaTH9wI+yz3i+ET4HfaZ5cZb+8/Kh/3C2Dukdld8BsWkwoyh2nHryNDcctl+Q0c5OcdULQT
	ngI0fPSvH5qWNsnUFWZ/o180GDc6cXFnwMoSzwkjHIZ5L/wI7INumwWdChubzm1FBiKMqz53mo7
	xDecX6oky7OBnbI5YWhT1tk442c
X-Google-Smtp-Source: AGHT+IHMeEPdVuxCEsr3HbzwXW9O9zK0z+wZ0vfJLANR2lbSoc703JFfFuycpKgytpooUs272ghcDw==
X-Received: by 2002:a05:600d:108:20b0:477:9986:5e6b with SMTP id 5b1f17b1804b1-47d1c038664mr255232695e9.28.1767033632356;
        Mon, 29 Dec 2025 10:40:32 -0800 (PST)
Received: from fedora (cpezg-94-253-146-116-cbl.xnet.hr. [94.253.146.116])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47be27b28a7sm604907455e9.12.2025.12.29.10.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 10:40:32 -0800 (PST)
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
Subject: [PATCH v4 10/15] dt-bindings: net: mscc-miim: add microchip,lan9691-miim
Date: Mon, 29 Dec 2025 19:37:51 +0100
Message-ID: <20251229184004.571837-11-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229184004.571837-1-robert.marko@sartura.hr>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_104034_373076_213B4B98 
X-CRM114-Status: UNSURE (   8.94  )
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

Document Microchip LAN969x MIIM compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v3:
* Pick Acked-by from Conor

 Documentation/devicetree/bindings/net/mscc,miim.yaml | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mscc,miim.yaml b/Documentation/devicetree/bindings/net/mscc,miim.yaml
index 792f26b06b06..2207b33aee76 100644
--- a/Documentation/devicetree/bindings/net/mscc,miim.yaml
+++ b/Documentation/devicetree/bindings/net/mscc,miim.yaml
@@ -14,9 +14,14 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - mscc,ocelot-miim
-      - microchip,lan966x-miim
+    oneOf:
+      - enum:
+          - mscc,ocelot-miim
+          - microchip,lan966x-miim
+      - items:
+          - enum:
+              - microchip,lan9691-miim
+          - const: mscc,ocelot-miim
 
   "#address-cells":
     const: 1
-- 
2.52.0


