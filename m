Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1665CD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 15:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pB2cQFjbuhjdNnTnLKqzrMd9wBQ0wQUJd1YqmbY53n8=; b=H66mw8D4Cfz4qvUG8ENwUtmwak
	MnlIz4Evr4y5RHWuCe7vEr0bBlmeUVeWd2wMDcdvg43BQ4az5qNs4KtvWgbj76BDoyRc1kYqOqjG0
	FhsnjXrM5XHiMS4uy+crD3E4H3tsn5a40JMkbikn0SZIpp7yudrJqKYXH26k0w87dN7q3EzlBwy4B
	UD+z1OmZQPPryF9OPdjVUOiw6sex9DY/8PiK7m/NNIWSPlSJlo9kUakmKYot3BWi9aa5K/tnbZ/ZB
	Dq3fnnwci2oSjseEJblJQscCCnU2YQhwHjgLRrR79gYFlDOMmEYyVx0QF89xlgZ1x6LxSQPJ5+S0s
	L8RBUouw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLN6O-00000006pEP-18rq;
	Fri, 08 May 2026 15:26:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLN6M-00000006pDv-3aet
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 May 2026 15:26:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pB2cQFjbuhjdNnTnLKqzrMd9wBQ0wQUJd1YqmbY53n8=; b=aDilEIhSY6a6i9l05IjLnBrczh
	ihzEvDfM6cxxHnkkgdvk6eWYjS0xrIVc5M3O6lOeUA5/1WyjtuQhyUWquA2SeI2xtRos5AurTDFZf
	FtRVTtSh+fi9bIOUST9MQmfMUVajApjy7bjDmTTetf3bKjXOY0Fz9nRRYUcRW6OdW8AXq/RL9o20F
	UupkWVpxk7kCF6pja9qfEF2Cn2n8iN55wwddtZjOEOkgbbq5X/C3/aWDm/UWG/n+DOBJcdS5RRzrB
	HnynmXZ1HU8k0aVOw8S39NcxQl8uBjYBjju+JN+pAx2aHa74Y1mcis7IiaAiKn/w0/MRyicDXn/4K
	baOWmWog==;
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLN6J-00000006hFV-2UFW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 15:26:53 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-2c15849aa2cso2750526eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 08:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778254010; x=1778858810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pB2cQFjbuhjdNnTnLKqzrMd9wBQ0wQUJd1YqmbY53n8=;
        b=YWOnjKHgUthUkAqbW0OF79mRBJSl3W1YIlyip6v/atbZ4d/I2QHInxhad8tR7nHeHb
         ieH/vGCvkGmpGL2MhsetiKsAlu61upua1R9N5sA7Vp8+Vaqqp9vCChs/jGTpEEdptCpo
         7KQATNAPZDkDaUMvj1ZKf7UgAaUFo1jXf5Vs8P21nzQAg4MjqlkvZIBzjykLs2E3moNU
         YWNCidnvcgmTmb0hw2Tv7N6c9gsTZvM7gp3T9dxynuHzo5W9DO8QLDiyaiRs+yGD/par
         bxYUGLKFEZOkKjLCUJ55qzmShQZQjE0iYEPorscETXGT4z+LORYeAI+tVBMilak40gMv
         7y0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778254010; x=1778858810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pB2cQFjbuhjdNnTnLKqzrMd9wBQ0wQUJd1YqmbY53n8=;
        b=rjjSFPGhLXIpo0bAxsWIc2se2pfkX59gduY/SMg1VT3OYIc4iAdC0blfrsea9/v9DC
         o1+vdGBbRJTRZkqxKgJ7a6rXcrkiJBzEKZ6lrgYY0eFmuoy+7twiwPz+xLbSlh16gdJW
         cNW2iRV0F2Kx8jZBIAqI+hAe3+JT9sY2S8L2SkR2IuXa5WbtbDUEp1bzJxirp86QAZnN
         sooFjnuWlj0jbPQlu4qjqS3tX3vjXs3RGuH5OSJeI8yffnTEsEv4LKWhDT3nGEE86E2l
         kHITn4UUzMYxfWIxRSC/ruUSqPBxM9Kl5GTa5LpSCWENk66HhuSNR1v/aYOvbTSfYCq/
         EL3g==
X-Forwarded-Encrypted: i=1; AFNElJ+FIrBIvS696lhz/mAIVI9JQlL+qoqY2ubR+/Eg/FhGU6nxQIKrc512EjHSyJXXzELiT+tb2F+tYjU+yR64cP7s@lists.infradead.org
X-Gm-Message-State: AOJu0Yyd5HCoZfXfUZvzHf5w9XmGGNh0K+vMis8E+wAHxaFg7oOKm4cZ
	zZMS8lwGIpHp4rco0u5X3MneBKBJnF/bw1uUX0eciwcI4P+VAfgluCS0
X-Gm-Gg: Acq92OGt0KrY8+QeT/qU7nTI2qHIvpppMAjdnPyWnbAih0wUqyizm3uGszEFiE/69hv
	o5XqY8je8vcKZMSjiMSW30oXr2KihXfK1zd/Ndv0KNNKRjQa31Ydl5HS3b7Fc4awA3wKlFqEPTy
	q4jxtAJtghBEEr00ZFwbQ7kjk8WF5LIHWU65yQf/yY0646f2oa3N3O1yGFLqMke5nIhP9H7sP8W
	bfhEjWKleoqniXzV41CviknUskwnTIQQfv+AINeid0fn+uP/5quPsUZECw1vsYCzFdtoDXGZOZS
	bZldruHVcYEQrXUTwlQv0JFNFCo5PxsolWTSY2IpUJ/HMCBNoCymRJw4QMokA43Ruy+aojQFICH
	vVxvuos2nSW28WOQQFGAV5j4dSAhwaTdFFhO8gWku51BWEQVHkT/hxC+7B5Fb9e5zO8gD432Nq4
	4DEK5LaieeFjoO/w0TXZRnXXar77oDMQUJh3IR
X-Received: by 2002:a05:693c:2c02:b0:2d1:d434:d022 with SMTP id 5a478bee46e88-2f544ce9df2mr5983287eec.0.1778254009639;
        Fri, 08 May 2026 08:26:49 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a53:11:5d6e:9aed:ce1b:4ae9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8862d43b4sm2535486eec.11.2026.05.08.08.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 08:26:49 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vincent Knecht <vincent.knecht@mailoo.org>,
	Grant Feng <von81@163.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Romain Perier <romain.perier@gmail.com>,
	Paul Barker <paul.barker@sancloud.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Robert Marko <robert.marko@sartura.hr>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Peter Rosin <peda@axentia.se>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/5] arm64: dts: qcom: msm8916-alcatel-idol347: Fix sn3190 shutdown GPIO polarity
Date: Fri,  8 May 2026 23:24:20 +0800
Message-ID: <20260508152435.21389-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508152435.21389-1-jerrysteve1101@gmail.com>
References: <20260508152435.21389-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_162652_019834_AE01766C 
X-CRM114-Status: GOOD (  12.65  )
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

The sn3190 shutdown pin is active-low [1]. Correct the GPIO flags
from GPIO_ACTIVE_HIGH to GPIO_ACTIVE_LOW to match the hardware.

[1] https://lumissil.com/assets/pdf/core/IS31FL3190_DS.pdf

Fixes: 1c8cc183d070 ("arm64: dts: qcom: msm8916-alcatel-idol347: add LED indicator")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
index 2de8b6f9531b..6d51d6efcbac 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dts
@@ -197,7 +197,7 @@ &blsp_i2c6 {
 	led-controller@68 {
 		compatible = "si-en,sn3190";
 		reg = <0x68>;
-		shutdown-gpios = <&tlmm 89 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&tlmm 89 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&led_enable_default &led_shutdown_default>;
 		#address-cells = <1>;
-- 
2.54.0


