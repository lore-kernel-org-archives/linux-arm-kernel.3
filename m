Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D476ED41176
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 11:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tEJGOG9KziC5WmpmFadtMIPKcgD9jyuKUB8JZhjDo5k=; b=WN5LyRbKZuaNZzK/1eK28MR3bt
	2SFmH2Pi4cMEZDdYm/kNavgnuf9lH9Pnve1mApMMJNONvbqzKUYaq+IAZJDDdbOqa3H8YrSvQL4PH
	T6KSYMXc1huN5ZHW4dzwyzH4wASU76kmt7iuxMERQpVcQSfoTvQH+4NtEPrLaTkh+9SN6wilCFl9c
	jIxfyZnp72EdAMzaPaRZBNVSncBOrCcW/UYWurbLG7iEykhLfQYgPkg0AGaXNyKfekex2gQsfry5N
	qMUO3Cqt0JOyC1mZJ/5NLtEZfkSyp0rfW54bOjQruM2UeckfJdyhWdmfTbBdR+a8rZp9DdnxNW60X
	z/QZm+HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLib-0000000CF6A-35H0;
	Thu, 15 Jan 2026 11:40:49 +0000
Received: from mail-dl1-x122d.google.com ([2607:f8b0:4864:20::122d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLiY-0000000CF54-3d7c
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 11:40:48 +0000
Received: by mail-dl1-x122d.google.com with SMTP id a92af1059eb24-123320591a4so789734c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 03:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1768477246; x=1769082046; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tEJGOG9KziC5WmpmFadtMIPKcgD9jyuKUB8JZhjDo5k=;
        b=JmpEgwVHJxBJ7gLsp7yhoxo2ntaOEfvHXvkjKM+mZsnEj0FUR2cbk9mkWSIvrEcDs0
         wc0+9If70guCwiHibvU2qvcYXCzsFTUU7X1U1qREzau50HukjaS14TNZfbzyBMcSRm0H
         01g+XYLslmY19pX6ufAf3b1dj8F9Zw7d/F9ycPp75yD0tHtyUcf91mc4w33Zb33sd9Py
         F69280VNm16AhBYK9VWofmyrSO+/AjUPLExaICBKaKntLWhS9MXfMiy8uEDy1UdaN/Ky
         rcX3134BerWhVasQAq8KpR4liePATjAlviUxp+qPNzEIzZgfPDkbp47U1yPTAlNkqJUx
         CCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768477246; x=1769082046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tEJGOG9KziC5WmpmFadtMIPKcgD9jyuKUB8JZhjDo5k=;
        b=CvhTgUM9TTvSPVNuFKbvxko2iXd6ZK49fWEdKnNE7gg+r6GrUxRiCHPXWwcw8ZP+S1
         n3vcXQr3+K49gFgGMTsGzi+yAxr26bTqdl3DXIK4iSzWWnh4h0tuXeiFubCSGYLvUowh
         g9VBhyZf3xl1+4Tapb47yh1+fvnZ+sh5KBSPYzEoIDVuo4lOfKjGdZ8vV7sBBiGZquzV
         wAVoJT4RJc1IukDveYLZu0nNr8y/2Ra6aVhUYiOAnVt/8YE8rfbC+tAQ9DV75RpGX3/j
         3Vj951QqrUn38wXar8g+wUotbfEIh741O7xFi6uT15yN7uEOL0jZxm7p6Ldfw0jsE04K
         PGEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs2B0cabc6MyprBpIcPPdKZkYuzjCZS0IhRV1f8GaAjiesf3AJRFhs78YK1x9y/zZszg98SCnTP9lcUB1pwvGr@lists.infradead.org
X-Gm-Message-State: AOJu0YzdPnUY9yTqwPaJGwc74fiyg9R9+qHJm+Mschz0LfQmzE8QM2H8
	GZLblJLwexLgvYtcY6EYv20t3FoYJbsA9QfCftyb1lM3+d+shccpZjUALZATa519yuI=
X-Gm-Gg: AY/fxX6ftazJL5+xQ5IICCqwc1gnW7Xoi8nVR0aC5xS0J6KWWJs9r4XIH0CS5fdDasj
	grnTBW7nBJHjTUdd/R8E/GD3jyy1THOiyWiJ3ZYd8eRjYxAyaUD9CE2VIeDIxzwFPZExJmWyg5Q
	EhpdpE7wETOZOPvy6i9Zh944c0R5QaKBQVqshXBaVgDuY2gFaMzSsPnoQYZ/QsqSz1L8dyJ70Qc
	Ukh8V4wfiKk1I8hjNmWDbMBw+Ww/mh5qg0TQAfHUN9c03c2xPHctIQDzlSEdfrF/VyuQKz2g6jV
	c9jmTWvkjA5ZYmEcGHnPTwHhrZLDlRvM+RWd6w5w1XlTKqb2QLn1E58jk4QFDLQiY7qOQFlJ/iq
	rzlvENfEDGGuTN3Dq/v733BO159cdHKhOTjQ2LBaGl0A+27gqf3T0fkhr5d14Ry32yEsXZArik5
	bDfyYbCNf/RG9ZCJpyGw5N6bsf4WLoo7DZK9nj4NJg5XkyqW1QEGTWMbx0AO5eTGkmsi6OuLFRk
	dnuiFEP
X-Received: by 2002:a05:7022:4392:b0:122:2f4:b251 with SMTP id a92af1059eb24-123376fccd9mr8604410c88.21.1768477245907;
        Thu, 15 Jan 2026 03:40:45 -0800 (PST)
Received: from fedora (dh207-14-52.xnet.hr. [88.207.14.52])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-123370a051esm4875347c88.15.2026.01.15.03.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 03:40:45 -0800 (PST)
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
Subject: [PATCH v5 01/11] dt-bindings: mfd: atmel,sama5d2-flexcom: add microchip,lan9691-flexcom
Date: Thu, 15 Jan 2026 12:37:26 +0100
Message-ID: <20260115114021.111324-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115114021.111324-1-robert.marko@sartura.hr>
References: <20260115114021.111324-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_034046_910513_C4FF70C3 
X-CRM114-Status: UNSURE (   8.53  )
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

Add binding documentation for Microchip LAN969x.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
Changes in v5:
* Pick Reviewed-by from Claudiu

Changes in v3:
* Pick Acked-by from Conor

 Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml b/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
index c7d6cf96796c..5e5dec2f6564 100644
--- a/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
+++ b/Documentation/devicetree/bindings/mfd/atmel,sama5d2-flexcom.yaml
@@ -20,6 +20,7 @@ properties:
       - const: atmel,sama5d2-flexcom
       - items:
           - enum:
+              - microchip,lan9691-flexcom
               - microchip,sam9x7-flexcom
               - microchip,sama7d65-flexcom
               - microchip,sama7g5-flexcom
-- 
2.52.0


