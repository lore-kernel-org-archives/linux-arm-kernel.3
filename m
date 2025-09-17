Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C56CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 21:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0t+vzUv4eEyq+7X9KCxZxjlUuJ4kfiiop5UEdAli8J0=; b=CghkDnJeZg1hrwL886kC/VVtxz
	qBVRmF9rj7s3j6MIh7+XsSBM+I4+4FN9iMzIF93zMPLtFnZv6LUHeItoMhUFn85nsORgK9TMG0pX1
	QeCPeLfFkFdVyt3SLtkQpgWNtuNeQOxlLPsInntJLEI1459dfHg7p0+SnKT5PUTo09dgwBV7EHldm
	aoiOHzhIIZpQxexSpojuODLRGLqmstMRUb29ug4tB9uDwDnMXasdKGJ4QL3dCtrknC7W9os3l7M+l
	RzSY9+YTP6kYVmSFqumXfys0dZ7Ub/e1jXNbH/YS+9eO6cHAUfHoVG2FHF6dGxPoIbTpfBI8Q3gHn
	y3T6yE0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzKL-0000000Ekiw-42dt;
	Wed, 17 Sep 2025 21:04:33 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyzKG-0000000EkdT-3Vt0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 21:04:30 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-77dd76f6964so13655286d6.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 14:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758143068; x=1758747868; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0t+vzUv4eEyq+7X9KCxZxjlUuJ4kfiiop5UEdAli8J0=;
        b=mWkfqxH6iJO4IVC2XFnXwsXeGLKS7uhDoKAI6vy/xg3ulO3HSO7kUCI+Vm1gxtdZQo
         uKlVZ89LhA1+Pzi8Cg7OoVvy+vJTRh+XVufZk+RqxqDO4BVtkfYtFEQhF2iDPBOdjsII
         OivH5afU7DNQgSqcgVkPVnZ0/aS1E8FLrjr5hDzPU9AlL+ipaPIxM4s0ciDXYomHZQgB
         /6lcXNhdoqWdG75+C4FOUGgEodNO6ur+h0suqKtd9vIu1OqV1YzNo3lRovaR6SA6vntU
         wHD2frrsDSElruDF8o/Yay1DC3KhFHj20hiXfOdPXAiAZtgh6fbSnNtIoEen/USDKi4x
         kKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758143068; x=1758747868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0t+vzUv4eEyq+7X9KCxZxjlUuJ4kfiiop5UEdAli8J0=;
        b=ZQWv9O2zX4mODfuLISOsCE+EIpIxcoN3nVst9D8ualoy99tdcGWLtw7DKOGBNi4kGn
         dW+OliUuxeyF7+6fFOiE7gb5z0Llni5TQRoSYqJz1mVI1I8qscBhWHUztiE+1t99cJ2t
         EpG38g1LkJQwbK9ZrBDjSe8UArx+NFnl9Mzq9Cka4K3H9SQ+xHmK/61Xshn009HgVn+i
         hwOtbMO8AqYawLRTXZUy4C9c07CGUwc2rAp0uCJRHMDFIbU47WD+AlqRjMea183WhwvO
         YhDXS/jv3UAg8hxLgkgiBXeCy1OogL+1BHHYazqXXbrVUUBBYov5qbXylgJ5Uq4GeOUA
         HITA==
X-Forwarded-Encrypted: i=1; AJvYcCXAn3TnwO2EzO+6yGCGOS2CFYz6qYj21jn6qtxGKXG9I1cf/YINIVGxZhGcgxyMYmxreecb5EqgDPMRTAeRAnJL@lists.infradead.org
X-Gm-Message-State: AOJu0Yxgg83SXs7Fn0YH6CGM1pGtcoipxWCopLVUdNrv8XIGagkXu1WE
	bxbpIhq1Ser08ldCPcfuQ6DuvBsuJMjTP1WGhEDYsc0x9jJWKPusDFf/AOIPNA==
X-Gm-Gg: ASbGncspSHcWP6gLlsSlxw2i1H/7eqNu36H0+fGxRJ0ZWfdFXWgz8WdVkvgnG3hLjLY
	aB1/uMREDTnsVsu9LarU6n9OUwnq4d+Jc4RWf7oXFo8MBUHDUzOPuz+Vy7O8MTTyRD7kcBmC97L
	7o7/VzjsLhfC+Ctfmdg8qbxDueMjSiV4dU07C5BRbGH5Q+EDd9TS7Apssez+yI+Gy6h+B4ghSu7
	3EF9oYVXzXSB6/s1KO5UrWKES9AjhpCP1OX9HnSOESr+GVLQBlTFtiuHuB1TinZWRWxTTuzFqoh
	h01B1yNWdbQAL9+Lyk2ZuZJ+R2kRfScahgNvl7IyK8uJet39aKTqVuBATsK+6J7/lKne3ny8hAo
	4sw/sfAvBe1XK7J6nSoinAex/KEvq1GNCVyGmRQrrolJU
X-Google-Smtp-Source: AGHT+IHJJ7FxhXppLqJ5pbKIB4bHEdrdsbUH4s0x4UPdSktVG1rpEIlRtsQvoMJIpZSNXgt5/AVhTQ==
X-Received: by 2002:a05:6214:1943:b0:78d:592d:fd03 with SMTP id 6a1803df08f44-7926a5f662fmr12311516d6.25.1758143067540;
        Wed, 17 Sep 2025 14:04:27 -0700 (PDT)
Received: from [127.0.0.1] ([51.8.152.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-793543ffae5sm1897226d6.53.2025.09.17.14.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 14:04:27 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Wed, 17 Sep 2025 21:04:25 +0000
Subject: [PATCH v3 5/7] dt-bindings: serial: samsung: Add Exynos990 UART
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-perics-add-usinodes-v3-5-a3629e4666ef@gmail.com>
References: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
In-Reply-To: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758143062; l=896;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=7/q7KnmwWMN+hTZMk53R59gQ8vuRN9Xg0o9/pqcgARc=;
 b=zSJtklfi96dJ/A6QI2dd3ZrhnFeXwIcQhVDiDgn5BvYrAU8yIcIQ2Q9o4HXUTv5q1HGhchwqS
 BMrhT322R83D2qom3YkcUayxCcLHizrCd+0DeW7F4War6bIhHDCxbDq
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_140428_886173_79DC7CB0 
X-CRM114-Status: UNSURE (   9.74  )
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

Add samsung,exynos990-uart compatible string to the Samsung UART bindings.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
index 1a1f991d536491007c7a87b24a6efd4ec3bc0ec7..369eaa9054908f7e1b63bba2e83be612d22f0718 100644
--- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
+++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
@@ -49,6 +49,7 @@ properties:
       - items:
           - enum:
               - samsung,exynos7870-uart
+              - samsung,exynos990-uart
           - const: samsung,exynos8895-uart
 
   reg:

-- 
2.50.1


