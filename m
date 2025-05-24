Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA4AC54E71
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 May 2025 07:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LPYbsFUFe5r5FajPn8cUBtZRLS5+bX15I0y2o2098dY=; b=sJA8NN4iSWNhuj
	GLB5eGOeyngeTDpi9szikM0LR9CI2H93NkcwbZ9MmtfWWk/E1piUewdS0ibmvSLCmqrslxLdfa2w1
	huJjo487uE5VnbFXBBe5HEkCH2qRaCEwlfkdFYFDbWd8PfL7FDvOQDnwQr13BmX3BVSU27YLvC95k
	ndMsuJqnsB9fOMY/Qsfl6P1bfLFqZDrggciPFIL2kLiUgilDGPEzszNqi+JRMEk+9nSKRY24dhBx1
	ehFlvUN+Vo7FdQJJtamrG6K519dkSWZPf9IDTZFJTikDMD2nZSqZ2nf7eU2Ae0kc8HAg9EvpSo9Gy
	GZ4h3fSC2McVy5YmCUXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIjOG-00000005Row-0HkS;
	Sat, 24 May 2025 07:33:56 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIjLH-00000005R8k-2Wvn
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 May 2025 07:30:53 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-442f9043f56so2692805e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 24 May 2025 00:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748071849; x=1748676649; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LPYbsFUFe5r5FajPn8cUBtZRLS5+bX15I0y2o2098dY=;
        b=qVogxgLjQIxFlf7aitvWhDPSdQ6FtecGZnWmt6m+IGDEBI7ikHHFcilgVq2xpZgWNj
         IEZylboAi9XWDr8mSprLJreo45HuaU92tXdyi0mw/TsEaxC2fNnEZlhR8EggDf1g/sHS
         rx14uOYfJ+M/6r/k+KymfF3I4T6g/C6gBPQVeDSyjdpdbohdhXi1973VAHmqdvYRYMfZ
         9mhgPhKoKWZlbfKEGdZ4eH7XCJEpg/xDEoVqGnLp7gXJqzzkp3/T16G+Ida8ag329Rsn
         iQG45TiqEooITIAWRIrQZfrvJa0VxtSW5tv8iGiIkgGuwo8Zm3GBPfqW7Df65GE6Dwss
         BZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748071849; x=1748676649;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPYbsFUFe5r5FajPn8cUBtZRLS5+bX15I0y2o2098dY=;
        b=JmF5tVJtPSntSEJvxA+zBK5x2VlgD24E36y1N0WvgViPQephu4gyLDoyFBk9qoNgM6
         J/m7koLci9GG4p1jPYgZnQlZfx/GjHg/25BZ5aPTrMPdAuHn5ofrNy7TibZAxES8nsd0
         d4bpFvEo49jEfr+O0WLfTAMv6w/dd8YOL+Xrv2VpoTm7PABuq5Bq/h11DW8D7UXs5JOW
         hFWlOXNek334ptAlFbNizk8692zFyzU8ZADfVIxPf3WlxHIddyteFgfp8HEOEru4RMpP
         KpGnWyeXOjJ/cYucaven3t5UDV1TjX2pO36YG/SwlrimqRr9PXFZE55pRbOqe1Lji6GJ
         l7NA==
X-Forwarded-Encrypted: i=1; AJvYcCWJWgFVEZNjKRe6DfZ4wWbn3UYF3p9nDvVUzHdbfZkuIBC14Fn1DvO4ejlng6h93w/mWdAlJIm6CHdeHeEaG02G@lists.infradead.org
X-Gm-Message-State: AOJu0YzHxRBz1TdclcmlucnRBipZ9GgXd3Ykd2JWybamfzQHivkhGLkd
	jFmlv1j7GdVVnjZ/z+vLGm05Cc1d7SmJ6ysRisur7bfFNe2T95VQKJn3g+9wLezoBUA=
X-Gm-Gg: ASbGncvFNbbeKZ6W1vBsFDeEiUzVaFx932VpLNvP95+WM/ID2o1o8D8m+Q/so/uGaPJ
	yvaXFsX0c/27YcxGvUmQOlRigmpp5ZlKYOhTOM//MVaYkW5yQYbuE+qTy4X1LzfdHG+4E9xgRzV
	Tz1ccBqz8FGlHwjoQZQaiBO8iCWNxG4g5PCeKA/0KtLdZoOZ0/l3rrwtQx0fFcqD6HgLdBdIRzb
	lRjeSJnLZv7QYcZQ2Bx23H/RiiUEv3IAESBOZxSGrM6WEL5Fk3BaIdRBwPp77PQ/1Y2PPl337jF
	CJ28FyDogSwL8pqwARvJO3mNj5SqE4hYcupEgIKB7PimeABC9sqjDJNCmeQjZgp0KfKufJPI1h2
	nZHLYPxk=
X-Google-Smtp-Source: AGHT+IE9nIa3Z95Svj6jEfCbrj39rj82MmwJlGv/5CpxRLj8l6iGYqEF8+ydtTi6jSTDL0dicvuciQ==
X-Received: by 2002:a05:6000:1848:b0:3a0:b294:cce9 with SMTP id ffacd0b85a97d-3a4cb46378dmr1740124f8f.23.1748071849419;
        Sat, 24 May 2025 00:30:49 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([212.105.145.168])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a3ca066eb7sm10924273f8f.2.2025.05.24.00.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 00:30:48 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 0/2] Enable CPU Idle for gs101
Date: Sat, 24 May 2025 08:30:28 +0100
Message-Id: <20250524-gs101-cpuidle-v1-0-aea77a7842a6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJV1MWgC/x3MQQqAIBBA0avErBNUKrKrRAtxRhsIE6UIpLsnL
 d/i/wqFMlOBpauQ6ebCZ2xQfQdutzGQYGwGLfUoRz2IUJRUwqWL8SDhrHdmQpwHg9CalMnz8//
 W7X0/n6hfWV8AAAA=
X-Change-ID: 20250524-gs101-cpuidle-cafc96dd849d
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: William Mcvicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Will Deacon <willdeacon@google.com>, 
 Youngmin Nam <youngmin.nam@samsung.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1972;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=2jML4/3kd5s8fLqJjcQSqvi9wZI8zPxe/sQgWxHfyK0=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoMXWlx7vjsMqlGbR7cLc1qEzooZmx2AVmGOCuY
 8VMrGLOR2OJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaDF1pQAKCRDO6LjWAjRy
 uqXnD/0dLYPbDiWZjJRTyITURtSjSFF/LvctWlYwx8nuFy4GYJpm5AaiTF45kAWzpKe7qu3OEAD
 GSf6sxnrgT+qNsfyu4SMEiksZZFi+J834QcMcziRKd1WP9/DdJOijZuqcPq8e9zkm8hBF4TIWsu
 F80DehSiqSKKT7IKBBV5QuxEeYhTUKRZBd4eLQNfkpEKKUft6fbx9YObeuOfUDa1y+aUSl+/Bqw
 v0Gx2pUaO58IexchV2YfCDKJSJ5ZhXKjRqV80etD15B7LIDOdbif0u4BAV9nM4mZgeazfDOEEwR
 OTNIcUlx9E21Cy8Yr2NAV4ioBdCQDI7RYxcdfUteR5H0W3pJpJK+PhpbIvEYW3ylWdXepNKotgv
 jHHZTXz2SRDfoJ+pSxXqOwnN0Dugtc0xANAYqM5nOtwC3svA6CZcPkrweDlwDAlxDDwknwZRf3m
 ZUBkA5mG3PTTZ3+7HCv9Yu++KmumB12Gno2DNkYh7IBoZoANuYfc/G3PtDuzZ3UMMZ2l6bZ/vO2
 SrPnTD3yOgwlmaTAa6X5xLQc+zoeHUiJ7qAWYutJu97qNuxzts/zk3gaT0oL9iLB4+LiseoJC8x
 L7krP18Y16EncIZffkujj135CoFByxbsq+0IOQ5uAcIDDL0X3CE4w9zIL/jR9e71i2PoeTohEnw
 Rz4f6/rU0Mxxi/g==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_003051_658925_773FA360 
X-CRM114-Status: GOOD (  11.94  )
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

This series adds support for CPU Idle on gs101. In particular it
achieves this by registerring a cpu pm notifier and programming
a ACPM hint to enter the c2 idle state. With the hint programmed
the system now enters c2 idle state.

Note: the driver patch has a runtime dependency on the device tree
change to add `local-timer-stop` DT property to the CPU nodes.
Without this DT patch the system will hang in early boot as the
local timer is shutdown. The DT patch was originally sent along
with Wills MCT series in [1] but it can be merged independently
of the rest of the MCT changes, so I've included it here to
(hopefully!) make things clearer and easier as it has a strong
dependency with this patch.

We can measure the impact of these changes upstream using the fuel
gauge series from Thomas Antoine [2]. With the ACPM hint now
programmed /sys/class/power_supply/max77759-fg/current_avg is a
postive number around 150000 microamps meaning we are charging the
battery (assuming it isn't already full).

Prior to programming the hint this would report a negative number
around -150000 microamps meaning the battery was discharing.

Thanks,

Peter

[1] https://lore.kernel.org/lkml/20250402233407.2452429-5-willmcvicker@google.com/
[2] https://lore.kernel.org/lkml/20250421-b4-gs101_max77759_fg-v3-0-50cd8caf9017@uclouvain.be/

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Peter Griffin (1):
      soc: samsung: exynos-pmu: Enable CPU Idle for gs101

Will Deacon (1):
      arm64: dts: exynos: gs101: Add 'local-timer-stop' to cpuidle nodes

 arch/arm64/boot/dts/exynos/google/gs101.dtsi |   3 +
 drivers/soc/samsung/exynos-pmu.c             | 135 ++++++++++++++++++++++++++-
 2 files changed, 134 insertions(+), 4 deletions(-)
---
base-commit: 176e917e010cb7dcc605f11d2bc33f304292482b
change-id: 20250524-gs101-cpuidle-cafc96dd849d

Best regards,
-- 
Peter Griffin <peter.griffin@linaro.org>


