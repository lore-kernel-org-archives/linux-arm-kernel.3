Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C862C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 11:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aZ4h7/VfporGRJI05sMYLRTIp37UC/VZX1ejowPlgvU=; b=4c1ZA73RJyj1n1XsgTlq7xtTVG
	1AaEGXH9pdWPJBz+VS1TFy6RLffU4LVQFabyk33jYBhZgFbwBemq4zTtiAH6oFmOQXSKOJchd3nfe
	56zcigUZuUkYIco2A7KVBGDLtoX+8ZVXUd6x+hVYMZq427YZHbZ6/r45+B6KMsx9Yibv9N4ika8Pg
	xY95675+pSymPkOVxa9iSo95Zrdqy7ejOmKAIebF0z2sJBdgtoxKLW3/m50F6rVShtdX9ve1lP/Xg
	ZMSRHgBvNhlekp8lw5Qub52Jk9MVZlan08vOqQsP/qqPg6yj74rP9/h9recpJhd637OfQDmPuucuA
	PCTf133A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjGVw-0000000HZN7-0wsb;
	Sat, 15 Feb 2025 11:39:16 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjGPy-0000000HYZB-0Qpc
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 11:33:07 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4395a917f33so22699895e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Feb 2025 03:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739619185; x=1740223985; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aZ4h7/VfporGRJI05sMYLRTIp37UC/VZX1ejowPlgvU=;
        b=kuIalk1ueAcXhPScAQnAHUZ2e5fRyc8Kwg1tfo46OwygJnKIFV1VTjzKs9iUWcBx1j
         xpCXEiUqm3nADE7FR+TD/wI/5CECyOtvJhkzIdnCk75sL3/Cf5TQfJZdkGeWqj+0IRYI
         DlxWiSCbsK3WFVh6Oh62PXXq+7ySMGFqyiIgIGmMpCPoIaQDmJdMlPrdlq5uRcw6CGL9
         nr5aSew7RkLJwcwZPLpXql++xJan2N4ipmRGBccryui4eRh3IzI3cYLmlLExchsl6wKl
         deCn31ypCOS3gfULPt/UkI+0gxpLehEO0sQpsoe+F20tAhHH4W5z6O+jBX46lbebmO8D
         QJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739619185; x=1740223985;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aZ4h7/VfporGRJI05sMYLRTIp37UC/VZX1ejowPlgvU=;
        b=JLma3OELIq2BkSAjruYTNV7+9yK0aui7d8eoDjMQf8SWUvoKNq8B/PbE6D43T7Qhf0
         c2YordpkObkO9MQfgY9AeFlB8PiCl4D49mBibipVIuutzbaeU6UaTlf48TSa6mQMdKjW
         9AHQqmC6HbMg8CfWG4AaBvxilr5SAszpbD2GKuDqSNRwxKvkxnWpkCa9KLNLi5VUrnFs
         LMKw9n5O/0WpX/53wiOyzVMZvsk/OxFOpWvyGxMCOpQQlX6yQAV1Msz7ItSSPv3GS5w2
         tgPd3AXaqCnwEx/SDBAblpvcfQGD/blXKQ76PTazx6YI8wgqJ39WL1LYHsQgzvtbAGnQ
         ZmSw==
X-Gm-Message-State: AOJu0YxRgmH3JjSTQzGQ1wM9DKv2MPnmBIMN8DxIOHBLWv17aPHWxIK8
	KQJ4Z9OOAtMtL9EqH8y35WIubRqFxgSiQEGc7ZeHQwac6Z7PEMQv
X-Gm-Gg: ASbGncvmD+hICGkgV5U9CNygCydu5RTTRiesRKHZveDm9KaGk6llxMW/bDxFO+sgQ7+
	3lBHtN/XoXy3T4pHQAF9aNd5Qj0FGzReGIwQ1auflSJzkF/q/SjdytXPQeUpdkLvmH6QqXx72WZ
	7hB6AGO4xWZM6RsfqIBnOrQIox4xpZI66HflBgZ61/XJ2Vy6+GmHhasfFE5sFHI1p+dkjhS/BzO
	Jg38BRnA0JhIxEbiUAC3WQbolDHv+c1Y4x+1U5A2Wu8AI1+D7S8TvmKHfU4MqOb37Fdd2KDu+Kg
	7Sognymz9T55odUa4QXyXVoH7SU8Zad1KmLFTLdmjl4u7UkeuzTCEIEdLJ1d5tEdDiw=
X-Google-Smtp-Source: AGHT+IFYiWapyROaWFGJrtPpnydYDug7fSPS0XbGrBAzQyfn9wLIe9lWK3e/1ZvQx9E1whB4ioWIbQ==
X-Received: by 2002:a05:600c:46ce:b0:439:5fbd:19d2 with SMTP id 5b1f17b1804b1-4396ec7c92amr28910915e9.10.1739619184524;
        Sat, 15 Feb 2025 03:33:04 -0800 (PST)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5e9esm7147538f8f.61.2025.02.15.03.33.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Feb 2025 03:33:03 -0800 (PST)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] pinctrl: samsung: add exynos2200 SoC pinctrl configuration
Date: Sat, 15 Feb 2025 13:32:45 +0200
Message-ID: <20250215113248.159386-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_033306_157581_B3D393BB 
X-CRM114-Status: UNSURE (   7.95  )
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

Hey folks,

This patchset adds support for pinctrl of Exynos 2200, as well as
documents the pinctrl and wakeup-eint compatibles for that SoC.

Best regards,
Ivaylo

Ivaylo Ivanov (3):
  dt-bindings: pinctrl: samsung: add exynos2200-wakeup-eint compatible
  dt-bindings: pinctrl: samsung: add exynos2200 compatible
  pinctrl: samsung: add exynos2200 SoC pinctrl configuration

 .../samsung,pinctrl-wakeup-interrupt.yaml     |   1 +
 .../bindings/pinctrl/samsung,pinctrl.yaml     |   1 +
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 168 ++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 5 files changed, 173 insertions(+)

-- 
2.43.0


