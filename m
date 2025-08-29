Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59DECA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 10:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Mi+Q3MX+Nh87QtdSLZzXC7Ij30Ba/l8ZeRTlSODhCu8=; b=HtTavKj950THnl
	D3DJV0oEWXLeDJVFBd4SbmmmVMxV9KgZAvzWDpQHDtyGsgWz335whQKVJpGP7uS0tWXiPBRscfIQo
	48ME4gCuBsQ8AMt+cX3KZdWZBcFF8rW2QTOtAxZEc+J7ou2I3s0tCYeaWlPue+GnQZljkLltn4RTE
	eDa7k1FVFXyuv5xe6qw/ysM/AObOv605bKW4GIPbLK9lDMQnE0DCklXvO2Vu8HU+NK5zBRPjcbxV3
	+NpLHez8G9Ei4NbH42RZiPhmZrh9NCrllsgZt7N42TTa3zFEwqRXlRXPFDyqe28zVZI36CaOvO5Ch
	C/1heKh3ZFmYvbLRNeqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urvu8-00000005EON-2WG3;
	Fri, 29 Aug 2025 10:00:20 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urumY-000000051Xh-0LaS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 08:48:27 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2445824dc27so15932725ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 01:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756457305; x=1757062105; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mi+Q3MX+Nh87QtdSLZzXC7Ij30Ba/l8ZeRTlSODhCu8=;
        b=OK8qPYJHdI8AIVMEaWxoR3GrthTCbfTIncyZC4UvR8wlj6DtlGFQabwz5pXkesqxJV
         tYSeTwYxYi+5rzYRl0nmlgueAQ46VdCEEucFYIFrzKD7q39uldWOYLlFznx8ttXz4tbb
         UMGKm2Ho4Z343Tdon6ZAHRfD3/Z7JqWFczdDFJdgtt+tpbmYW9wG3jMPv17AqIEz0KPf
         io8JyGRht0xUc1OEL8b3Jk/AOjUWtN8bD0GSmvd3bdJd7pnYkrMooSRHOo4U5Rr9qslZ
         VXFJECj0ki4jaPvUHOl+50qdsF6WJih7uoRgoM2UylPcxWEd12YB3F3FUb+lu1LSLlE+
         MivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756457305; x=1757062105;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mi+Q3MX+Nh87QtdSLZzXC7Ij30Ba/l8ZeRTlSODhCu8=;
        b=MRR/j6K+Xc7zcnhbFbqf5OUopLIJb+52L38NBjf2WEgUguHeOrpZSw8l+Z1k5/O7P6
         PIrnX5Zx8Y7YFWBv68cJvOKOQmCTZEYveYwIbfnqwr4v5/Rl9YyYjVeeddVpXLrSo4ch
         6u2cuDMEjZYVucbJIBaOrScEPXMRYHPelTBMGhAkbEkWLZihuEenPXc0HcRI/Nnxh/DF
         an8jMixq/WZs13kq9erRcrdEG1qxI6xH+I5pZ+cX8XWbwiB9a3pt9slHFxle2JVYvGPL
         SaugB5RQ/d19rNrW1wVAGhtq8FVqcWHf0YTAYw3Q6nmJsL/vemM1rDh2MA2l677KqBpK
         06Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXCevlo0e6MbIxN3CVoNWxH+BLW3Gk7sTdRwC+tqx/wkYkhWk8749roeV7qrFdvY1sxbIY78ocbKQNCPExNOQ/5@lists.infradead.org
X-Gm-Message-State: AOJu0YwYTbHyGc1cLDE+9cSd1rPU1RS9b5ZDUVVIJA/J5134HVePusCh
	8FF7r7c2bHB9oyUyiNByLbizw/RWhFno95wgGd+Py1X0R9PBwTGmmzFuIAagrh0URRk=
X-Gm-Gg: ASbGncvDQe9+IqC9KyB2DqQ7xFGNEUVDcFEDJMswHRLDKlIMI2v1WNuCdMhELBuX0do
	ude5qKq7eiZBHOqy5oZ03drFxavXZmTnZOZQ+HtmEAipwS2Z+VeZlVzxvrVdR4lEI/7kzllZxAZ
	X9jbjg6Rn1GhspfJbd8IByvgj58X11Kx+p2SeA81YGIceGecU235ChDyWVt6nnLedSXRpuyH6SE
	yN45rGMEECf3jLU7OTS7PAtgr7ibeYE1IAI0W0mO+eM1aMXpZCf0BH5zumEjfVvysWr8y7fU6tj
	+QwBbtL+vhRxP832bPU/1oGCixf/Zb2Y1vF98Qt4F54Ob8ej+wnA5/VOZlv/OLa+yi1+AxSp6xU
	xsy3p6xQphDB2WMpDl6Rmx0r2EC1tQ+ahbwO5yQ==
X-Google-Smtp-Source: AGHT+IF92ta91tbD2snSJw5gReCXfDa49jmAVhH5Bgdtos5T47Tiuix39Bo6F4/vkbDn8/8BcAZjEQ==
X-Received: by 2002:a17:902:c406:b0:248:79d4:93b6 with SMTP id d9443c01a7336-24879d49805mr152138675ad.47.1756457305189;
        Fri, 29 Aug 2025 01:48:25 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-249066e042asm18162565ad.146.2025.08.29.01.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 01:48:24 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v3 0/3] SPMI dt-bindings and nodes for Apple A11 and T2
 SoCs
Date: Fri, 29 Aug 2025 16:46:59 +0800
Message-Id: <20250829-t8015-spmi-v3-0-58b15ee2c825@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAANpsWgC/1WQy07DMBBFfyXyGqMZP8dd8R+IxfjVWiJNSUIEq
 vrvuO2CdnltnzN3fBZLmVtZxG44i7lsbWnTsQf9Moh04OO+yJZ7FgqUBau8XAnQyuU0NkmaYjQ
 ha8NFdOA0l9p+brL3j54PbVmn+ffm3vB6etc4CI+aDSXIqJO1nAFNwLf9yO3zNU2juGo29Y8S4
 hOqOsoqIKcK2bjwiF7uleby9d3XWu+9ROSlyH4/tnU3gFNRF8NYiaAiGKZsYoDonfdEnhyzj55
 u2/GaDv03dkOfzzZC7K+KN9bqmjX04V6bEiwFTglC9PWZ0h5TRkPkUlLJZlddoUqFk8HqEaJyy
 YDmXvzyB9NwkumXAQAA
X-Change-ID: 20250527-t8015-spmi-838bb49d34ae
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Stephen Boyd <sboyd@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1659; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=nEV1xIt3tWltM6HcFTPL9++suMELB5ydP0fIn7qC2Sw=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBosWlJqPJ+FMi+FGW4iwdzV8JA3JwejRSBQ7RSN
 uoR4j9ldGGJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaLFpSQAKCRABygi3psUI
 JMm1D/9JBtSzUGlRr9Qz9q6BQLrnRboncw4vE/O5VDaT1Ij7tH3FjTj308oOERrhEIh04am4TzK
 Rc87KTt7RV1qa4tRtD6pB8R8ryFCRbILCSOfsX10qZ7qGzywHjzRuE5AxkAnx1udo1EJBHzkOf9
 eZTdzLTkUUZgVOnZHKlm2nJfJRYPPmwsWt6N+w6CHMF0Z/5m6pj4jpB4WzOujxLUABNEv/FGB+A
 WgsCxFnnxcRABvNT3wdvo/3ImgMx9tVWVYYmuSD7Fcgj7T1jUZ/jcnJRr8AW2en+99kMofqlU9S
 m9Due3Ro99t/v9dPa5njKOxp6ZDReJeFTfCK/8u93wwTDa5AaF5IebJgFmw1cRD03l8YvfNzAay
 JIoyQ609UPvblr++fpNSKNu66BowEUtjh102O+NpV9aaz/aR0gEmW//hRU5pQ5bo74jA2muwpNq
 DSpFgKfVYptWJ6BajKk/UD/KSNooQCCxldWmknRpGUC4AcHR7BcvBTnw6KYq3ToCkK8s0xTohQY
 JowmN0V2OrIUbzERglSYtBt+4vUoD9uPGCv+bQB4W6bapuSDIGwqV78+JqYUpZJCJIg5CwrBYT0
 YJ/FWk1bxUWdBSswi06Cwzl+z6UvC1MVbLXVX3md3lnTeFKIIWQR27A75UchzP0hMLCO1/6qrxO
 UZcES3UbvUGRneg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_014826_127431_14E63305 
X-CRM114-Status: GOOD (  12.30  )
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

Hi,

This series adds dt-bindings and nodes for Apple A11 and T2 SoCs,
and the existing driver appears to be compatible. Drivers for the attached
Dialog DA2422 and DA2449 PMICs will be in a future patch series.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Changes in v3:
- After discussion with the DT maintainers we agreed not to extend the
  generic compatible[1]. Change the series to the agreed-upon style.
- Now depends on a patch[2] adding the t602x spmi compatible.
- Link to v2: https://lore.kernel.org/r/20250811-t8015-spmi-v2-0-a291acf0d469@gmail.com

[1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@kernel.org/
[2]: https://lore.kernel.org/asahi/20250828-dt-apple-t6020-v1-22-507ba4c4b98e@jannau.net/

Changes in v2:
- Rebased on top of v6.17-rc1
- Collect Rob and Sven's tags
- Link to v1: https://lore.kernel.org/r/20250609-t8015-spmi-v1-0-b3c55ad01491@gmail.com

---
Nick Chan (3):
      dt-bindings: spmi: Add Apple A11 and T2 compatible
      arm64: dts: apple: t8012: Add SPMI node
      arm64: dts: apple: t8015: Add SPMI node

 Documentation/devicetree/bindings/spmi/apple,spmi.yaml | 6 ++++--
 arch/arm64/boot/dts/apple/t8012.dtsi                   | 8 ++++++++
 arch/arm64/boot/dts/apple/t8015.dtsi                   | 8 ++++++++
 3 files changed, 20 insertions(+), 2 deletions(-)
---
base-commit: 062b3e4a1f880f104a8d4b90b767788786aa7b78
change-id: 20250527-t8015-spmi-838bb49d34ae
prerequisite-patch-id: 801a5b0bb76e74553fd30469734e9589acc09b7f
prerequisite-patch-id: 371cd14886cc2c5d6f6e8f8eac41f710b26c403a

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


