Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF531C7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 08:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Unci+r7LHL+lqoLwxDlrvWa0BMlTjBqi0rK62HQ+/+s=; b=C1ZEpJ2rMaOVyU
	gnTR0ZYQ/I/JhPJQKqxE1V/bNhllADYa1BoeudEyOma15/6pfdVjgoQ/Kop8W8xjUqMw+RBXQSQ0X
	YjDJGOdzwa1FxN1WVqUDsN7tlIW9Ln7Hk5PdAoGcvx/wDaL92q2xcals0+x1y2AGrNInvWQD34Q02
	InYgCx1aJuhxt3zvIf+lIlQ00V0SFxbTAC8YnoVwhC3TsKOcAaAoqyAJ82WwVfppNCvaSPoUHwvpD
	k83hc7JT1rUo6G/VskucjkHD9vQRKPuGBi2KrqCAXlJuHIXfJtpO6D8cCiSSwqpdqRjaDBSfapF56
	A/1MmE56zBfmnX1V9lBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV44P-0000000DuhP-499I;
	Fri, 27 Jun 2025 08:04:25 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV424-0000000DuLx-3Dcv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 08:02:02 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-453079c1e2eso2152765e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 01:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751011319; x=1751616119; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Unci+r7LHL+lqoLwxDlrvWa0BMlTjBqi0rK62HQ+/+s=;
        b=NT/FpP8ZPZ6qWAUYrpAqSioej4G7dsyMgOM17RNlD2+Ke5dV7RziNUBsZcT/6MpIlw
         xoX/ozDeqltxvK+Tqkhj2icagoKdPmwkoZFd5SBq3LSTjirZqaK0nxTS4A1aUpFlXS0F
         kkyH3OsEA3fq1wZNOgcNEkzzsq8EMYQ8L1Mw3Ag0s64jMjpmBWgi8dBkT828LYL9pRTu
         3UKT5TfHu+sSnUVl9pucw/dzDnBdEEc3aAUxOfdatAnq7OsNUnk3ZEbwS4k6DenfnfI5
         6ySkFkb9bWLgxuk+U3XbVHYoRulQsKrUNjr8EAYalmV5xULKy+FF3FfFBuV5Q4qAXKVc
         qUJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751011319; x=1751616119;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Unci+r7LHL+lqoLwxDlrvWa0BMlTjBqi0rK62HQ+/+s=;
        b=c4O7G60/yJTvQ/DUsPGfpogiuJE8zQuH02mg16mwYUzV5spc9nkbQz4f/MGtwCsUBT
         nWqT49UEmpQ3zIaaaNfVvZ3T2o0c/f4SLSfdtfjgfl4n7URF+gGX8sV7DTYbsTu52JgL
         ZIxDsmjUijB6vpPd0uc+BBsxlpMVQbLXsaq6x1FwSvjdkwMEhTDFZw5RbkLWgFs9q7l5
         PryVjoVbl7Ow/VJ3ijv4dckFq6eJIN7S6h52ktntl69C17KiBqVGbhT/GrUaCk4rOIAn
         mn39sC1JNXeg1r2WRtcf0IlP/ZXmcUjgA32bH1TYT7XBA8GLuc4yAE4E3Sy+7lLwpmfV
         jJww==
X-Forwarded-Encrypted: i=1; AJvYcCURl8RlU0eFgeQhdnVKkNosglbG1e+JfrufGnwFU3MJrwvndRfVrzOiINakaexy+aC7gYw93o2owl+nTLEXaBL0@lists.infradead.org
X-Gm-Message-State: AOJu0YzlAyLKcvrV6f7/HorZvz2OH3NBtvIDyYr1FBZ1ukZ85tDB0qou
	qOSFGMZCgoVeknnhXq92SdPdBzcG3MxU7lfCZDaa4CVEdCe1V0S4KTK3/HZ9c+tbABU=
X-Gm-Gg: ASbGncu13rmu2vLjWP8WxnX2e1N/4r9MQVNnOYImoWcByLJF43ctPZGeBM7npMLBRF8
	H+HJ6AMgTrWZ7AvERDPJlbambAnJvcBzV3x49V1ro37QV0VvQMjgMbTqYZWxoNXNsgytlIkuEpC
	qFOZQU54OP0Wkfn5usaWk3IWfGLQjRIvyN/h2/w0zAukx7kUQI/wr80wRVrKDMaBQDYzmXw7FsM
	DXbL5+hmgRdbWVJlqbTl/PdAjI2o6qwF3O6bGdXDVWg11uB/HVNC+2ugCfnVljXGHwpkgDRXwhA
	1Cn0Pj6PitKYyc36XgDnAhhCp+EVVBrlHeZwXTGp7OlWFHgdUjx5sEOgNnMFHH4Uc7FLROpjec9
	N
X-Google-Smtp-Source: AGHT+IHcfWFGNWC16F+T/5JDKvwd7eGwjNT+A6IGrz+imkl5/bKkRK92RXClDJ3nlxfVmYvbeGIitg==
X-Received: by 2002:a05:600c:a08b:b0:450:d5ed:3c20 with SMTP id 5b1f17b1804b1-4538ee7446fmr8751165e9.6.1751011319205;
        Fri, 27 Jun 2025 01:01:59 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a423abbsm43490295e9.39.2025.06.27.01.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 01:01:58 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/2] dt-bindings: Drop 'db' suffix duplicating dtschema
Date: Fri, 27 Jun 2025 10:01:50 +0200
Message-Id: <20250627-dt-bindings-db-v1-0-d5c7072acbee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO5PXmgC/x3MPQqAMAxA4atIZgOx4g9eRRzaJmqWKq2IIL27x
 fEb3nshSVRJMFUvRLk16REKmroCv9uwCSoXgyHTUW8G5AudBtawJWSH7SjWEnXeM0GJziirPv9
 wXnL+ABL1hPNgAAAA
X-Change-ID: 20250627-dt-bindings-db-38eaa005ccd0
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=755;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Iy4rMuXXapFTx2kjSKugMlp9I0/iVWn0dY70WllqPHU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoXk/wcCM14kQDF1d79XXpGo8n5HZzTk1uWzDKp
 WTG1g2l4lSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaF5P8AAKCRDBN2bmhouD
 1ygSD/9zKEcjWzeAnre3VyS4sy8f/zuzk+6aiVwKfnQZNwMLddjHQaA4tfav4oTxeiUDcSNL+Wn
 OMw5i3B3nkWhbJbCvXb1c9IIs4qgDoSs4y/ZINqcWYZi7JuadQq3iAmvUQIDpctu9n4oDo2fPb1
 QldagXo4+4ICRKcYtBlC27JKFS5/Nyjk3RFHS0wii8DA+I6f3rN5Cia7d4KGVjP8sfI+lGSdpD6
 d2P/A+kT4bQA6Py7S8kPKt7QgqQbpRb8wi0+PE/J1TRQwyyfepG7WAZ3nxOzKvwcpRMnazhaCKz
 H5ADmhne9Co11Z0QG1QDO/GE5zh6jm0EmHfAOCBFNb8jEJWvsm8/eQkWq12GVPBeqitfEvycGBV
 0PVlCuEeM04wH5rKeXKYYILSX/G3EtUFBmg5cK5HRgvYb/O+H0o9PBz9UBf30NeqT96QQFl4PNQ
 lXTA2aPpeneel0hmnCgE/y2BRa2WQyIuz2VRRJQnPd0llunwXN+DfXjYoPs0nhIGTDX8so3mII1
 QAMHU+cu9+B05r4P9F06eEAGIqitbczfPPpIZ0ZL2F5PeLCAX/U4Qw+nnRfdMxbFX1oB1/xG4wm
 igtpvpkYIau9eiYialHk0wxplMxEBmIMR8/2wEhyEOmomVGoEaWwZLJixnDMgYzXoLLVSsGCSYv
 MF+OFeWgcqtydng==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_010200_824082_D7BEE2BD 
X-CRM114-Status: UNSURE (   7.46  )
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

RFC because this depends on dtschema changes and should be accepted
after new dtschema is released with this merged:
https://github.com/devicetree-org/dt-schema/pull/166

Best regards,
Krzysztof

---
Krzysztof Kozlowski (2):
      dt-bindings: leds: issi,is31fl319x: Drop 'db' suffix duplicating dtschema
      dt-bindings: phy: fsl,imx8mq-usb: Drop 'db' suffix duplicating dtschema

 Documentation/devicetree/bindings/leds/issi,is31fl319x.yaml   | 1 -
 Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml | 1 -
 2 files changed, 2 deletions(-)
---
base-commit: ecb259c4f70dd5c83907809f45bf4dc6869961d7
change-id: 20250627-dt-bindings-db-38eaa005ccd0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


