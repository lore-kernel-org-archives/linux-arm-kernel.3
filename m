Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5BAD41176
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 11:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cYThfrCqrT00LXV0OTAO8hRxDqFU2JdJDLnv+fTCySs=; b=uinghe0PzYSHte2AOhpw08EXFz
	EOiWF/MRYW7bti1nkPk1cmwAaJuyJ8BgI+eXSGRLL4IEpYAaDU2w525B/prteq9w/R9P/lZz/ejQb
	cqu+nyWmPUL9wMHoVGI78cLTD1PrOdZf+6oDiFHDXzNWzr0+D8j5Sdgv+tEkGpfnGdOkpyd3o28ig
	aG/ElcMry2HK2XrpYLli/y1yantdjfSWJQnxnro+TBOI2IguC7jQSlMrfydUHIk9CM/kKgor3CooL
	o89eJ5yz7+cS5jB75h/+yNk5zrvgsAQ0++pBS/GIOA+UivyzCFyW5tuwj9ueVFBx++WWUi0yQCfgb
	aeNm1snA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLir-0000000CFBn-0gSS;
	Thu, 15 Jan 2026 11:41:05 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgLio-0000000CFAZ-3tYZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 11:41:04 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-1233b953bebso1971533c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Jan 2026 03:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1768477262; x=1769082062; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYThfrCqrT00LXV0OTAO8hRxDqFU2JdJDLnv+fTCySs=;
        b=VphwmEAdtOJj0Al0yEmMiX4jaqiIUCL2oClzVXB2K2jS+qLndbN3i+saav7TcBsC24
         iGWR/2i9dR/sVpvZ4LsAAg4HAzoGDqd5J6pim4TCmCQMLJP+we8D4VPtZQ4EgyRLIerM
         p2tCDPYts3Hdsm0OtzN3Bgah56H7guiesw41UO3Im5i72g2Szz3nZ+zFso60DBjzrVzZ
         KDcGYE8s14c7ry1LC5qH+9HgdUS1cyfzvmm5Nrikz9YEieHmWYxMPNt2vrDvgWObVwEX
         tneTazTJ8Z7q/dP1WRIAbFxEdAOR4CLC9IHOZ/P9RZFg7BlnEa576TBXIzMDLvTy7nwI
         dCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768477262; x=1769082062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cYThfrCqrT00LXV0OTAO8hRxDqFU2JdJDLnv+fTCySs=;
        b=Q0whheckziOyWy2KaWykzi8qA25wHTHV6EFrL6snVt/uXZ6w24SfpqQcXbVp3SvUBz
         mXQXySMzsBjm/TplzICuctG2ZsLptiqlgAv1NNq0Yp/CbXsqpbnXh53LmH5rh0ODeZA5
         Sc96HKqskzRVVBicOGiOjfY0CFhb7x0D1Ux7lCZdJai59mUZq0D3dZ28+/l9mB1VFIcI
         eqJibh1rADxf7B9vkT+PBDzd8MsudAj9y7SzQcEXYzMn0nIUUoW/cL8AJ/cFIahMyGxs
         HxznCoyAP6B9DjrQn1gBBhiBjUt/PyN4LeCHOr4wnj3kgBvFHnJKIms5hGXsC4mYJzHy
         Okxg==
X-Forwarded-Encrypted: i=1; AJvYcCWEkXTfGeQHqVivbWJMo/IfdsqkmpN0fLkwxcDh9VlG6MKkva2G0nPAvraNo8EZOqOgeyTldVYFqM+AzVVg5EXr@lists.infradead.org
X-Gm-Message-State: AOJu0YxQqaOoYPgQR2FcurjstuT9lBZ40rA6ySeRBJNisP729pszXMg2
	Fz5NRiXvemUX0NvfVEyFJHYsmzqyU0/uv/8pXIMMaj5JKDrPaLSA7sU27jlSEPt8yd0=
X-Gm-Gg: AY/fxX6MKIurqED21x338qRPTxcdi/nK8N3SFTmk0/KeeS5r6qKLOH1J3OkMcdMr6mK
	MmXT9ciPb7iM4+YUR33UUV2tQD5zrdq0HRPdbwqW9b85OvJarvWF122XRr1hf1VROynty5OKz+H
	txk3CTmqdgupcrHOgbPwbUVBmjip8phMVqrVRDxYZBmLYw9sFkjPXO7y51yvqwexe/N3y8vPkj0
	VXxaQTI1TmAfYa1NXXMh1OfUXDeqiQwjb2Ap2W69xI9TqB0lolio5yk/ig9jtP1tGSMS25jxGOZ
	Ml5EvEBUkQ1QqDMC/yanDvtwH6YfCLgzx9aK/eRrKIcRIWnzK3I132SzsjbGjvdB8qncwbqu69U
	fuXmnhWF/byLVNyi4Ju86Wov839V/E+zhrb9AGTrCqM3l6a8Ke6pCTLwar8X0hfz+qGjqvcaeQD
	5sW/Gr9FdidiMwvXRGNqI3+eufLyBzEmUsGbxaMjkOpIO6Ilugm0KMmCJKkgOTCpQxMmUbxa7cq
	2MB/xy2
X-Received: by 2002:a05:7022:1101:b0:11e:353:57b0 with SMTP id a92af1059eb24-12336aabde5mr4547440c88.50.1768477262077;
        Thu, 15 Jan 2026 03:41:02 -0800 (PST)
Received: from fedora (dh207-14-52.xnet.hr. [88.207.14.52])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-123370a051esm4875347c88.15.2026.01.15.03.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 03:41:01 -0800 (PST)
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
Subject: [PATCH v5 03/11] dt-bindings: rng: atmel,at91-trng: add microchip,lan9691-trng
Date: Thu, 15 Jan 2026 12:37:28 +0100
Message-ID: <20260115114021.111324-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115114021.111324-1-robert.marko@sartura.hr>
References: <20260115114021.111324-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_034102_969000_B429F307 
X-CRM114-Status: UNSURE (   8.32  )
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

Document Microchip LAN969X TRNG compatible.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
---
Changes in v5:
* Pick Reviewed-by from Claudiu

Changes in v3:
* Pick Acked-by from Conor

 Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml b/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
index f78614100ea8..3628251b8c51 100644
--- a/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
+++ b/Documentation/devicetree/bindings/rng/atmel,at91-trng.yaml
@@ -19,6 +19,7 @@ properties:
           - microchip,sam9x60-trng
       - items:
           - enum:
+              - microchip,lan9691-trng
               - microchip,sama7g5-trng
           - const: atmel,at91sam9g45-trng
       - items:
-- 
2.52.0


