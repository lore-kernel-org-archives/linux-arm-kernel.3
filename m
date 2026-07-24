Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F39C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 12:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NBrUSC1O0WOQ9emuFEGS5d8tSVoT5Yvw626g9QceW3U=; b=13ymB5LRKzPAUl
	oQ8HuIWbjlwov0kNKgr0bLNAJWRAsH/w5XKdeCGMIGh0CM9Wu9ifiZYZ2N0mEjtwpWoq03nGfdo+m
	a73Qhl7U1QzdWe2AkPzY7o56e6rfW7zCboREPBsSIvH/QT0X/G1SM/DsTyLe9ETKf9ORPX24CZfEc
	TKfQcHoc8eEn2Ga03/9CX4h9Wa0hwidCTVxe3EC5orgcf0nkoidGQNu5x/+hmpSEvGoerO9fhyfwp
	UMqBfjNFK77TkoblaizxD3mphpQeqVMLSWMfR8fLS/Ai0qIhOq0+GjoLwqySZ15B67fC0hgbX9IyF
	yys2tz6t+KxZbgyxvY4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnFCA-0000000GOcI-1USk;
	Fri, 24 Jul 2026 12:40:06 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnFC7-0000000GOai-0zfo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 12:40:04 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso2969715e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 05:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784896800; x=1785501600; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NBrUSC1O0WOQ9emuFEGS5d8tSVoT5Yvw626g9QceW3U=;
        b=pTw6FMItquIb3JRCxMU4YPwj1uo7gw9CFx3JNJ7XiVCcmDNXSMWydfdo2ykX/p5nrZ
         MjmnH1cAITram34K9rPhYoPHz6bxr/df/GkiOpmny5dH15dz1KbxDXZ/pu2yxJk0HZjR
         5H63WGPPJGTL9u27gLn2czlUb9Rjqm65ssG6x6VHqgjIRvsx7hwHDfe/Idr1vniyrfMH
         AKMGBljnA3YCKz8qd7XGStB1OSzbYNMvlAfLy6J2ESkT/dwfO3JHglQ8x79usN6Mt1Y/
         Stm6D1CS3KzoLfCUnNiOQ6FQ4QroigL+AT5jJMrxAloCSxQBb22nMxGh9Fo9vcNiijhU
         ho0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784896800; x=1785501600;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NBrUSC1O0WOQ9emuFEGS5d8tSVoT5Yvw626g9QceW3U=;
        b=q5N43Z8QUKkJjfg5jCRZo5SSeRJljdZtz5S6nAvAejHn2o/7DZ+fydiGQWZUHcHyz5
         PNqGF443vvF9gvVmK6b7wyHm6nCqh4kK5dJ5CbF7zqNYSwT/5AjKLnPsrzKCM12L0/Zh
         h7X7JX8g/BxmMMpdY7XkzJNDDU6wXsEVipC1l1YDH0RrYxWnBaRRHeQ4pV6C8EpVOLdv
         Jq1KtHR+LCE7McjlVyTLYwtqlFQdmy43PYl6PwYXo4m3G2Uw+yVloY8OFZWy4pkRHlhX
         uVa6WS9jTbGy+9sRDuAs3fLX0vhsv/n3eIdc0Wa0eHZsjavuBeu1HGI4p9MmhIfiEaSS
         GdHQ==
X-Forwarded-Encrypted: i=1; AHgh+RpN3aTOLLJYDEAjQ5+LwABqVTSwg7j0Q3UnG4StB0flHo1z4oOjehnZxw9cDEWUJ1c4HjcvIcSxzVUnl7GHDq0H@lists.infradead.org
X-Gm-Message-State: AOJu0YyTY+kk5jxRKDS1cX7D884eoHEzqesyX5zjGW+C65BBwNNgKWar
	zdY76hMRZJ8soxuyCYWO3JSRaTejAL20IzsrG8lDBQYnXONUWFa4bmlssUdaG5HDm6I=
X-Gm-Gg: AR+sD13HK/Kx9BL0Zb0zsH9+LkWqRrx7k0WX2TJrkhnw3p35uoHQYgjo1xPT4NZiPf0
	rMj7Ijn0J6KDWZW5goUYEAUnHA6e14JSbXEygba6PyiLjMYmJ2R3WwSGGxEPXcenKum7dCskRKV
	MvoudThLCNibX7Xz6B1VhKE83JHdHSgKRokRX//r/d+p7FzyJXjSO2kU8ka5FF9AWyF+eqyk8Sv
	PiryIkuUW4qwlHzXXTmhrUH93AlQUdNj+yVZu/Z97qiHGBozkiQjnUiVKrt+gSLXs56/SStrqKK
	kN8uBWLnD2HCBB6yEcBrmSkL/tqb4wvYJQiL4FUt7VKeIbpMtcVV8vnMS7UBaKpIXybmXarPxyo
	g8LhjmrwJ8ITt/VvGdemorYpo9j2FT3oclUY1aRFQIDuwlzg1zcQkSw6N6Xd0RO5o//ZrMoTWiY
	Wyr6SlfEFwnNvNgBmu8I4biajCGTw3MuDKbqY=
X-Received: by 2002:a05:600c:4f86:b0:495:6a24:a92d with SMTP id 5b1f17b1804b1-49573cd8af8mr83332165e9.22.1784896800602;
        Fri, 24 Jul 2026 05:40:00 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([2a00:23c7:314c:4601:a07c:a901:acc1:9287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957af6b10esm71556795e9.5.2026.07.24.05.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 05:39:59 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 0/2] Add arm-smmu-v3 support for instcfg data override
 feature
Date: Fri, 24 Jul 2026 13:39:41 +0100
Message-Id: <20260724-arm-smmu-v3-instcfg-override-v1-0-e7acf4a8a525@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA1dY2oC/x3MSwqFMAwAwKtI1i9Q6w+8iryF2lSzaJVEiyDe3
 eJyNnODkjAp9MUNQomVt5hR/gqY1zEuhOyywRrbms7WOEpADeHEVCFHPWa/4JZIhB3h1LSN8W7
 yVNWQi13I8/X1w/95Xm9No+BuAAAA
X-Change-ID: 20260724-arm-smmu-v3-instcfg-override-b5650fdbfe34
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Pranjal Shrivastava <praan@google.com>, 
 Daniel Mentz <danielmentz@google.com>, Mostafa Saleh <smostafa@google.com>, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
 willmcvicker@google.com, jyescas@google.com, 
 Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2030;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=+LKKqb5ZqdPr77qli5tmJ/6wZb62O/rS93RulG8b1G8=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBqY10b8hqtiFJgZNPKKmccvQiXiJ207C2BIrxZG
 XX6WJTAaLqJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCamNdGwAKCRDO6LjWAjRy
 uuE8D/wJJ4iuiOHoo3Ba+E2kIrjoJF0Fvyyi8zfBoy0a23Ep3SQHV2ozGw44bn3MM+AnFDe0kQo
 K7n+PTewI3MkJc3c3ZQ0ERKIPmcEsiIsn2gX26ShPCn1rlmjJuEhpiBfXA7VU2++AVuTV07n6uc
 rLH6Zos/1Zuv6p/lZyzOd316J87sgMuNP+AYzfX8TWnGn0OYhxrltSPRBOuXFy2C/EG6CAlFMpE
 Myu8NAzTuIBjapLrJLT6JNILVZkAliNhmMZhXClskp7XqTcGxJrnu92RW0gq0zMndxQixO7AO3H
 se508EAQJvHN8sc+cHzOyV3PMsnX+6OmzWPf1ZZq5YcMFaec/bGJvHaSMCVE3zLSn53o41UL3q9
 McQs1kU7P0M3XH1COuT+ySU1KUbj96wW2bR4eDXmm9iJuk8nKGPP5EGeb9U8iAmz8zM3gv8z5MH
 TbABDCW574tZXzCJo5deKVsFzeIp6ea5zstz7iFiSAy34/IV9+520H5EjRtZFKI+MMszucOqiG7
 Zxr9bX8aw/T33kLylD6ih1LV0lW9Eabw7soCRVy9YF1Bn2r5GMIerZ/njASPT2lCLYv4193TXP8
 EH0i9rOUrX26e3ETtY1PY/4i5wSk8kTUR4Qz4x+Ge8KlX6MbADzr5auS6HEKqUnf5uJG/ULAM9l
 wtz0zmXjoy+6v8Q==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_054003_331627_F23FA1D8 
X-CRM114-Status: GOOD (  11.98  )
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

Hi folks,

These two patches add support for a new "arm,instdata-override" DT property
that enables the override of the instruction/data attribute of incoming
traffic to Data by setting the INSTCFG override bits.

It is intended to be specified when the smmu can't guarantee that these
attributes are provided correctly from the client device.

One SoC that requires this for some IP instances is the Google Laguna SoC
found in Pixel 10 phones. The initial device tree for the platform is
proposed in
https://lore.kernel.org/lkml/20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org/
but other drivers like USB glue and phy are already merged upstream.

Downstream code has used "arm,instdata-override" DT property name, which I
have continued with in this series. Existing options upstream tend to use a
vendor property e.g. hisilicon,broken-prefetch-cmd or
cavium,cn9900-broken-page1-regspace. So an alternative name could be 
google,lga-instdata-override or possibly google,lga-instcfg-data-override.

So far I kept the original downstream name as the override feature is
specified in the Arm SMMU architecture specification and could potentially
be useful for other SoCs.

Arm SMMU spec that documents these registers can be found here:
https://developer.arm.com/documentation/ihi0070/ha/

regards,

Peter

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Peter Griffin (2):
      dt-bindings: iommu: add arm,instdata-override property documentation
      iommu/arm-smmu-v3: Override for Inst/Data attribute

 .../devicetree/bindings/iommu/arm,smmu-v3.yaml     |  9 ++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c        | 26 ++++++++++++++++++----
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h        |  7 ++++++
 3 files changed, 38 insertions(+), 4 deletions(-)
---
base-commit: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
change-id: 20260724-arm-smmu-v3-instcfg-override-b5650fdbfe34

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


