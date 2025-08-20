Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CCBCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 15:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DH177aI32fcw+0fi3Kr7cEylMFjtb1+kKdAUsXxCdWo=; b=G9DnJTdxQ/n8BfXxUX/KnhMj4A
	0iqYf8HgzPyuug5Mpdi+UStDFZqKXxmAi25JA+zmjCwsAYxSY191D2ZuZfZ+b4pRkpuFwWLME2rFE
	qowBZFNsseTzazbtUR2MaHSg+phv2BpA7I/Z2cIdb0xPBI0x0FHKSxoZ6nQTR0LQ8UkbpL+o/WofP
	9SihHr1ZHDr4rk83/avnHI/1KJLbJpDiQDB1HWU+GtTjUWF4tl45FZvEozWeKOiOqsJEB8KDC3663
	1XG9UvQzZYdGWYb+80apxwAf3omxqsZYv6dYIkrrf241/lTHtFgtkNEhvs+V1WKrSRY+E8ZOsWoSc
	rZBB9rqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolCS-0000000EK17-2LmK;
	Wed, 20 Aug 2025 15:58:08 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojdO-0000000DztG-1X8n
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 14:17:51 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-afcb74bef86so117322566b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Aug 2025 07:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755699469; x=1756304269; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DH177aI32fcw+0fi3Kr7cEylMFjtb1+kKdAUsXxCdWo=;
        b=HV44YOg2hD8WSDg6tsJBNjml9q8gD5TGG1vs6uELab5wPjg98RpMCsv8YXdcInuLhN
         HM0Ks7iW44p9uaKvVn5AB6KuEdbPtUt8MY+w23IVr4qDWp0ygVNZjYplVr/8yz2Z2BMD
         tuQVcLCZKimadJ0izVE20uizqs+f7JeCLfTjyfmUa2LI3cXxgou/qg2btdBREMG5WCuL
         EgR3ZScFjAe8U1u/3EoHmW4wThogFEIkbXKYPuxcmASorQmM6GZrDPwWEy+cxWlD0n9T
         xWn1DGGzCMeO9q8Ao9iWzGFCC1MLhltGS0LULQIvzKA8SBoM9XH9j6F028/l/Vn5f/4r
         3aig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755699469; x=1756304269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DH177aI32fcw+0fi3Kr7cEylMFjtb1+kKdAUsXxCdWo=;
        b=nlObodeE54rhrRYTKsLufhtjXFPP3WyIujEOWRb4MpUL9iCTPw1HBdkMLfVViQaVOi
         o/oNNG9d87k8gAY6a/uJQs2+72cK8WAlO1Ewl2sY+Utde9KWhHvJontbTsi5IeTN8gWD
         Pz4GNoy1OLCnODp8JCYKvMqmOE5fmaidqYhmfotZ87SsdU24xvNuogK3MNS+R7RxptXR
         rwUKeH7rhNgCqIYQEhjy4GV4PFYJty8Zre5WndrKyp2wpXLO0B8pKBzTih7tJo7ZYJUf
         Jp+VkUwF9mrmZeEzEaZ7Nazk6/BGZkHDXNYQ0bYI05yZqX2/wkkj6W4tdd4QHp4/t9lK
         S+Cw==
X-Forwarded-Encrypted: i=1; AJvYcCV6CMRYS4pLs/uCMnv8jWduPrvC+m/CIyYuVB6lhrIsSEV6LscoqaK5ijQtuvNm8fcedl2kF26WIxTksg5A87yl@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2hjnGDwhoqYCXvLbuNLpySFQbhBdKKI5X6Et499GkCXslTWUT
	tozRCO6PybaO2u8GuWmblg+Gtv+qqqoj2UF1xAwStvjoECyDDvdSqQQjywQTcB7zIY8=
X-Gm-Gg: ASbGncsfdD7Gfn5mnUZP5QDUEGWraoTX+tL7KYsheYJsfsy1e6hktHVbkpVGJ/DJSp4
	M8sR97cKNNfLljSJ2hWo5FZS/DL/5LvoVaV5UYifOCObw7bov2rWzzMJ4VVIBGkxb1LjPIefIBH
	/l+RQKXk3/tmdABdwwAWLaYpLtK9I7VLfagPDOPh7CwcfupYPnB0LUNGx+nvefaPj915ZId4xnS
	DfY17W+CZDI5YYKKt24XQYZJdwBtRRRbeZbTBLIdDGc2ANlySDZsY0sVKnofkCrAWICZPmztL0K
	fHLLe075qHjg0AFcdCOj2kWvWZ4HCjs4chNYZEg/NQSzBwtKg+q91yS3P+w8MN5UK4Sh+UcRVGz
	o6mvAx3YEtswJ1f3t2kxnCbDcGNoTaRW1/+aoJTs=
X-Google-Smtp-Source: AGHT+IE1NDxPIblZHLyHWsai/l+RkUVe1BeuAZ+Wx+dsahTLJmxSzRi7+QTtrjLlctknkk8S6nYJVA==
X-Received: by 2002:a17:907:3dac:b0:af9:a9ea:f42f with SMTP id a640c23a62f3a-afdf020be3bmr125823966b.9.1755699468735;
        Wed, 20 Aug 2025 07:17:48 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded4796f3sm186541066b.61.2025.08.20.07.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 07:17:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 20 Aug 2025 16:17:36 +0200
Subject: [PATCH v2 1/3] dt-bindings: display: ingenic,jz4780-hdmi: Add
 missing clock-names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-dt-bindings-display-v2-1-91e2ccba3d4e@linaro.org>
References: <20250820-dt-bindings-display-v2-0-91e2ccba3d4e@linaro.org>
In-Reply-To: <20250820-dt-bindings-display-v2-0-91e2ccba3d4e@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "H. Nikolaus Schaller" <hns@goldelico.com>, Arnaud Vrac <avrac@freebox.fr>, 
 Pierre-Hugues Husson <phhusson@freebox.fr>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=999;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Pxy1ceX/K708ATMRkgiCl/qGBMScopnigW8cLcERjdY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBopdkGYy7rVicbfewwuVfkX00qnzDh4itZ/TN8Z
 KwT51inn6+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKXZBgAKCRDBN2bmhouD
 14mYD/9h0PiQE9dy5vwP7vBJ76dItA2byuWw27+5o/ZLt40o5X+7eBO/du6Z1luxBiHrjoaJJ6S
 7mJN66kdDvO8897oK9TTcu3tnulzNRtpPDWhgxc7Z5Tzh5Gmx6GejO4Kp8aZ5ytT6WXfliE0+UU
 CgRDbNXfZQT/zIfB6J6mOUN1RYjKa2OflnN+xrE3eTjZW2leo0IOKYKQRhLJ8OnXbIaoWY6q6Iu
 tUk0woil75PeoPrWdZSUHViAmDvB8BNDpo6ay7k/Ek3AqTerB/Y9hXiDjGACQMt8YhzCXKbWPyf
 GR9V53exquBI5VWe06gYpDvK8iPPUcuBzyxykT9iKC5h1ycyfD1AsZccdu8Mpe9J6sSG6fd/uSW
 +XoKrVNJynBpfz6eSvjzyW0zaMZlcYrUYc/b8WHOetPwkwxR62UHlf5gVVwzY8rQYm+I59tXkYZ
 ExzC6ZIo/BCMfd/tCel3Vpnj9zG/Uou/x7kOJVcQ2yxWHwwF/ZCufw4+bfF7WDwF9eSETLHwDtu
 Bz+aSxFJ9CXpRQE+NK1yzUsKZ/HemJ8xcjrT2HmXT5thnOxp1aVBHaXEHLsmdnBq8OapPAm5VF+
 bvyxXAJaOMyqKHirUtqCjvtneBDKwVP2elp9F2Ste5sVY3UewOrHlc1ygbZNOPcwtmfMma2KKsM
 PQjztLAysb275rw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_071750_402423_62B37EA3 
X-CRM114-Status: UNSURE (   9.86  )
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

The binding references synopsys,dw-hdmi.yaml schema which defines both
'clocks' and 'clock-names' with variable length, therefore we need here
also same constraint for 'clock-names' as for 'clocks'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
index 0b27df429bdce0b7e080ab291ee0c4c6b51f8e1f..84df3cf239d5bedf8a5806bb48507fea207c7167 100644
--- a/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/ingenic,jz4780-hdmi.yaml
@@ -26,6 +26,9 @@ properties:
   clocks:
     maxItems: 2
 
+  clock-names:
+    maxItems: 2
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 

-- 
2.48.1


