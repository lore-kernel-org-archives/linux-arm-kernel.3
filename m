Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9154CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 10:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5sUn7QP2kz00DztPqMuLvh5JhaL5x74fWgbdKmTLlw4=; b=jVg0tno+Y6DZH5
	7BxGBG6abMw/mVZzXeIJbY3HzcIm98cNnJew2EVIX9Uu9U3L+4zsmjQiTcyAX8L8Jeh95lZ8wSLc6
	vGjYadx0RTiskIifeycPXojC6Gp8vMiPhVGKYbKRvHPMfhCnfxq6syhBbY03wTunkdZTr4lGYQ/Ju
	3WkT6jMIjJ39DxGGinTI1QOMu4hKEGoCgepjx72UpjQKhSy1nv0hdkFT7nMrN/SAAvVJ8bZlRJGFr
	3Xo0fVAQFckmKkto3SEuCIqLjcV7L7P3Lkz5g9QMzjEmWi8Uw92gJNNnxtSEFudsBJM8mj9cZeZwm
	TcmKRDk5FisroJ8znRRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usIib-00000007jZZ-3WxG;
	Sat, 30 Aug 2025 10:21:57 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usIfq-00000007jHB-2tNd
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 10:19:07 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3cd151c38ceso419988f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 03:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756549145; x=1757153945; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5sUn7QP2kz00DztPqMuLvh5JhaL5x74fWgbdKmTLlw4=;
        b=QilsoSSO75nApsR4bNCVNncSb111Mmp5R2E0WvHimV9/Sb8j0tQ3Wnv21/nLnRFvNa
         bJOEPLN9J78+YmPLfluI8rxD83et761fyasR/YiLsI5GJUFFN4LIaXWB91y9tUfZtoFz
         2iNVYpACt1DLHlAmRqmMyEZ9lD93V2/u9JaIKGkuzfx9dmydB949tiVkxuR3Dn/rUOMN
         bRFwzOR+0YYKAPEHqyKckjMnMEQpkX2YrClWdEW8h//rZFyXpclRRNMXj7SP+oL5oZFZ
         VQSTQaZ1h90C6uEj9waAZVIAzkJNHNwqJPm2R1+8lGm5GfrrYntsYgIIT/3/8GOrnKi1
         ktag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756549145; x=1757153945;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5sUn7QP2kz00DztPqMuLvh5JhaL5x74fWgbdKmTLlw4=;
        b=dA5Q+EcQP9nFfVTC0F0mRLmh7EycMjNmq0jT07+oMyPcTQfMFqqWrCafnQjZ7ymWCm
         6a1Gsd8X2E21SD360N2uQi58PXfsK5KXAXbrX3HgE5E6fL4AJeBMfIxm1qq9HDJTuDLt
         IYT2vCxiTPFoJ0Yz06zzAGTxeqJc2CD8OppSiJCxJD7BhE78RbFEY2iE6ztTRV1gsH0Z
         UndOSbVnd6rg7D3usgwC7FlBuSuD9YDKDFOdoHwWevYJ5/eBbakTOCIO3fbUbuSgiBgq
         vM3RMOoUvSKDq1X0jJMrIKFTT3mt6IUvU7IXN5qFJK8eIAKq0mVQ6oPgVOw9gLVTv5Ah
         DDAg==
X-Forwarded-Encrypted: i=1; AJvYcCULFwKu5GVsTcDyNuSOhjDDYFvyBmoPva2+59hNcPLYmIWdKITALd3EkvWsQ0VQ4aonZqKYjIYB/reDAZ2OefAY@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9i3II8k5D0fU5id8SIQlxZofF/BY2kVE8+ZpWgc7I7XNSZmpC
	p6Z/weCrOTI9s0WKOwmxaH9o9fgMWdQkWPRuAJv+Cy47oOa/K6gvSnZhTXiiIne1hso=
X-Gm-Gg: ASbGncuTDnkWu9ruWudU2x5hr/gSAi8yOl0lV5ZLcqXd52aI+XCj2kr9bAdRjWjzT6H
	zQBH78+HPz6fhYt/KzclVzV6Zrysl2peu8ElyLA+2L5h+i4ew8hkfJCauYv2Dmuy3SmXYn+PPx6
	2pZHT3hma0Rx98qYgCI0PUwoX8MnJ8qKfnGHKVvSMIs9IYh1T5NoGlbBiG5A8dMnnxsaP8doSxW
	KX/cOBlJ5s0sBMbCwvodO4t6rcdnBV/d7AfcKgCPZc6DvXQZdSnz5VBRardMJf26fRyHqreh3Qw
	yyxIYfdZTyXTcFoHOcZtXlBxVHUGO9RoS35l8n7U70/CdzC709vX4DAiPWGi+uEzEjqHV0lhN4V
	DQowrB4lrFpjrPrRY/1nhNnfLybegjqL9cv2AXLqQMYSuPvPKOQ==
X-Google-Smtp-Source: AGHT+IHbvCTcAI6lW9P8ZAuKzeHNMi6YmoSOvGR+3NoZENtf5TPqRuQC7jK7/7r4VeX5isvy0wOxHQ==
X-Received: by 2002:a05:600c:8289:b0:453:7011:fcdb with SMTP id 5b1f17b1804b1-45b81e930bfmr19246945e9.1.1756549144734;
        Sat, 30 Aug 2025 03:19:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf276c8eccsm6547492f8f.20.2025.08.30.03.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 03:19:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/4] watchdog: s3c2410_wdt: Simplify, cleanup and drop
 S3C2410
Date: Sat, 30 Aug 2025 12:18:56 +0200
Message-Id: <20250830-watchdog-s3c-cleanup-v1-0-837ae94a21b5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABDQsmgC/x3MTQqAIBBA4avErBswJZCuEi10GmsgLLQ/iO6et
 PwW7z2QOQln6KoHEp+SZY0FTV0BzS5OjDIWg1a6VdYovNxO87hOmA0hLezisSEFp60P1ntNUNI
 tcZD73/bD+37RmBCIZgAAAA==
X-Change-ID: 20250830-watchdog-s3c-cleanup-cfa28bf8bb2c
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=823;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=mBL3wH8Zv3gv3XD9pXxPdu8BLbNtjAnS1/nt1THHYdU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBostASNGDkfBHqdI8SdUYlxbtH7WC94z0R+uy+A
 mta0ZnarceJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaLLQEgAKCRDBN2bmhouD
 1yUzEACOf59cQzzBtTDBnQpXT72uFzQBgLc2W63iuHo7n8Z4baF+xyrn3IfvoPv2BnIthmCepvu
 oyNYaxkaA7XirALUW05Cz/y07xi/hqJanb7ZuNWqSZgBA31+V5Za+6iWFcb40Ik5bfBDMYALJb/
 iDPMyE9/20a7onCLRgGmGKhbnxHIXw2RoxZ2l888N2iMnf3/NuZcUVRtnfR/Qz5G2W+FvgejKd0
 9j7gUwxSZ0VCM7LlbBHSW/+1th8Ab8xvcRAnlnRa0/E/xv7usrcQbDtnyqf2xxScVeBjYoOYniG
 cEWMSjCBnUv9xRJb0+vY0W2T/GFXqsoNFaCVNqbMGzU8q/AFDvekCz1R+welxjn7DzeXihYpFF6
 FXKk2BtaYFdtJ7UuV+ID296cy+IsRraPW1llrw/D6iSd22SGT+IL/cCn1qJ0InoQyC1yaHoviZD
 TW/JVxzqS1ggNI/ey2P7ogV7OCWnpFZCeCiRu3Q9yPyQGRasZbXUwV8AoqjqJG9JjYzlU0ohGmj
 dBYSo+BI4/+DU7Mc3wgaBRIXJc6yCt0k3aryAmtxz70PVjfKgjJIl+6gjltG4Jr/v/7kI3bL6aj
 WFokFak9Ri+IneCymYbboyPmhNB0LyKW/7E7AwjdnN4ds3naV8e7J0Fz+L/ph/cz3KNUdEvG3Z2
 N+1dsLyX4sVubZQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_031906_746564_63F6EC4E 
X-CRM114-Status: UNSURE (   7.18  )
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

S3C2410 is gone from kernel, so we can drop its support.  Also cleanup
and correct a bit the bindings.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      dt-bindings: watchdog: samsung-wdt: Define cluster constraints top-level
      watchdog: s3c2410_wdt: Drop S3C2410 support
      dt-bindings: watchdog: samsung-wdt: Drop S3C2410
      dt-bindings: watchdog: samsung-wdt: Split if:then: and constrain more

 .../devicetree/bindings/watchdog/samsung-wdt.yaml  | 72 ++++++++++++++++------
 drivers/watchdog/s3c2410_wdt.c                     | 22 +------
 2 files changed, 53 insertions(+), 41 deletions(-)
---
base-commit: 3cace99d63192a7250461b058279a42d91075d0c
change-id: 20250830-watchdog-s3c-cleanup-cfa28bf8bb2c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


