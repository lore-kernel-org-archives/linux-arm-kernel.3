Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9E6DD69117
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 15:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C6Oue8dESN+KLG/ePe+fukJv5gryZ66pj0oCW9kKawk=; b=LTlrJA578dcGqu
	DF1LlSn5+iu4mmMUFHRCjdwSijudQvay9grspftoTjbNSkyPs+dbD9SZRvrEEBHvb3N64Bg2xq/vo
	IZUunTLtY8atORwnazr8nTXG8c1glhAPFofXjbdABY2v3Lke9YcVNR6x0bHAFL7U3MOo/aCrFxHmU
	NL0J/3lc7WAS673XJ0c55HLU25M0dQNsjCkfLKsuUMtfuxeIZsL7bmhPdCYoS/ho1s17VTl/W7s81
	zFCHNKgbzOmHgxwmbyzx892cPZIlb7ioApYdwfb2TeDeUpkZJ1ftTsf/mTVru6hNnS0ndQfsKZlom
	QIZxB8R97rkk5PmydKIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgO9-0000000FsiW-1VA0;
	Thu, 28 Nov 2024 15:25:06 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGgG8-0000000Fr3o-1zz2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 15:16:49 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-434acf1f9abso8372195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Nov 2024 07:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732807006; x=1733411806; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C6Oue8dESN+KLG/ePe+fukJv5gryZ66pj0oCW9kKawk=;
        b=bR22qh/i8QF4IegMqbKd8rDlSzQAV7UBtpvZNLG73NVJdESov+ooeH5uzIEtk7ZZsc
         s3xoaOo+67NRs0Fo1Depzz8RkuZhdheTI4TvBYtQe27+d/F49WBQffZrSrfPl7rtsg4m
         tyVsq1Rky5IuBgadpIk2Smbcilgemv5/zxQnsq+gaY01XcpJ6wRp+D5tPj28ybN75OMM
         B4sMt0mg9+aGpeX+jyvyzouXVmG9LpWHxBTyBvLLxcK8qNmCMdWHas0h7bETBajBsk+K
         gPNv22GI+3SyXQsfmMFVbHWLirKI3pJFu+g0oLDYuyKeKvWO4EDlKZot7mqclTxu5t9W
         2Gxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732807006; x=1733411806;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C6Oue8dESN+KLG/ePe+fukJv5gryZ66pj0oCW9kKawk=;
        b=hVo0LkzQWqlSmgl2oNuw7O54XVw3VY/2QuNtDxrD1vtfbBsZ7Zh+gWk/uUF448G42N
         rlorEIzB8OssSUfyszra8HhJskZe9Qzx60uEvl1Dv81XHX4ne+MnZfxF+tZmodIy2Q9E
         WEG//1EVy3LbGodeGlmpXGcvUr8bwrlRkbFuFwXSZEMEWc6iJPmQhclngOqoBFvDr0Py
         O0D7aaPyaA40bLUOfiE3ZYZb4dvBvHsGptUI1NQgDXWqC0Npi1PuofMP9COJ8087NsW6
         7Rwjg4hEXcx+7yv7R7ZlEH9FjD45e4pHDXlAQ+PJz3Z/HbWyEP96/4rdDdGdhK50GYVc
         ixGg==
X-Forwarded-Encrypted: i=1; AJvYcCVcqDNqp63Wf88ZFatAvPP7fQ4jOMjjSVHfrBb1MVCMSpksIFCoQQPU2VWG0KOWVQd0ddSEk7S3VYHx1WjshCyn@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq7qk3lMp2+BscTh9ZDxdv7ROiguZ+5LAKr3ZbgV6uu9vRi+gY
	bpxVH76ME+XrfS7RoS8FWepZ5J+8AUd/bmKpP/Rb/TgE7GNo/0SXVipGXHLKilY=
X-Gm-Gg: ASbGncttT02vJHJ+QJHAoq9mo19uP4dZ1wWCntw+qhH2cJWajYWV2BGVUQSOnibr4hc
	TURbSsxWMLwPhU0aJVLWu3nBl0VB70sCSf1LSD7lQIACvT9ZSYlp1rkR4lipl18KTqYMk7j/VBE
	QwuqLxDKnoAeAAEm0HmFVGXprnjljpa12+8eB2UpOdM1WKQi22Pf22hKc3qCyrXA8ofykadY8N8
	0ffjtWfIHwFpqnaAX8gmpnyvJP8INQogoofnWOiKz/SbhIal+mJZVZ1+0L5RaHX9qdkm8c=
X-Google-Smtp-Source: AGHT+IF/jKAgBSZytzXTCZWUxx4CJtAyPk1QsefLDdoBfKIXDPOc4pRQw/LQWLRG52QPYf41Dn28yQ==
X-Received: by 2002:a05:600c:4586:b0:434:a10f:9b with SMTP id 5b1f17b1804b1-434a9dc5069mr73836335e9.14.1732807006507;
        Thu, 28 Nov 2024 07:16:46 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7e4fe1sm55867025e9.38.2024.11.28.07.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 07:16:46 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 0/5] dt-bindings: mmc: document mmc-slot and convert
 amlogic,meson-mx-sdio.txt to dtschema
Date: Thu, 28 Nov 2024 16:16:40 +0100
Message-Id: <20241128-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v4-0-11d9f9200a59@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFiJSGcC/63OwWrDMAyA4VcpPk/DdtLE22nvMXaQYzkV1HawM
 9NR8u5zehgbu+YkfiH4dBeFMlMRr6e7yFS5cIot+qeTmC4YZwJ2rYWWupcvSsGaFp4AwzXN+8y
 h0/C5lDUTBrAcHce5gOcbFZhSrJRXCFRShHCD4jjB4HGU534ga41ozpLpcd6Y94/WFy5ryl+Pl
 6rat0fqVYECO1qPZMyglXq7csScnlOexc5X/YvU8ghSg4QzorHOk1To/5HdD6mkHI8gu0ai68l
 qPWk07g+5bds3Vzg4ifkBAAA=
X-Change-ID: 20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-6fa70546ebb8
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2010;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ui0mP4QaXAwRTet5XtxQbZ2onaCzZnY94A0/knFdcEk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnSIlbl1v/SzeCDnTLt0jn54/WnyuWpEmWI8EQLQM6
 mDe8wWqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ0iJWwAKCRB33NvayMhJ0eOHEA
 DKHXJGHdG7bZVbSN+tD5XHRT7cE/ob1hWy1g6Z1irfqd7+AYfA1CmQ8VSKUqBKZjzd1FGI2p+xxxBl
 1avXNVf1K1EwvBJsbNRYLEuZNnlPATZO8SHBnZt5NDWqNh+DVYDNlr2ADmadOoN8K4WRd1y0mSdNK0
 7ooADTOveygioQ7PZ/OvUi4Qbvkx/U3F/WSciPcPqPn8j6n4hsBGonkEL9/X6kYKX4d2yDLuY8s0k9
 5LXurZa0tqf9t0xqj9oj6RGbB8a/efkJ9yi9wok7+w+Lyon6Tr7H7P1ePqqwwInEPOGxIlnm/oyW9e
 Pg9J8EIN5u6UtF6c3R8YuMXuvuYJeFLZrGZI1iOpO7NB8/DUcVdguVvYRK+A4gGZ/2g/wQxeKfYAsL
 /A5UIGgpXHxVYeB5YtORC1iFK4EOJkLv5qPjS2lnSTs2LQ2R+N9D9p3I4B7Jnlspx37SibM7oYzDFO
 UkgwQj87b+HcFmDgDgk1tTGPm8IhPMrno3ws1E9ZUnf+9DmiLAosuzHPzvEFdcH+8i6++lHrwvpZYu
 i18100A9I7dw2RNt7g0dJ88ysmlVlnNjs/0rVGhZucAt9+TA+pFLxivbkT3vX9tolcO/X5MO2dqppu
 6gdgWGd7QfL1DORa+ru4OAHPoVJIDy0QRorhYau4ARkdVjZbL1x2kLR2g9fg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_071648_535059_788C283B 
X-CRM114-Status: UNSURE (   9.24  )
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

Document mmc-slot because used by amlogic,meson-mx-sdio.txt and
cavium-mmc.txt, so make it common.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v4:
- Fixed address-cells description of mmc controller
- Cleanup '|' when not needed
- Added review tags
- Link to v3: https://lore.kernel.org/r/20241007-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v3-0-ad4eb22c2a8d@linaro.org

Changes in v3:
- Revert and insteads move common properties between slot and controller into mmc-controller-common.yaml
- Fix other comments on patch 2 & 3
- Link to v2: https://lore.kernel.org/r/20240920-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v2-0-5aa8bdfe01af@linaro.org

Changes in v2:
- Fixed description, limited to 3 slots
- Moved out mmc-slot in a separate common schema
- Link to v1: https://lore.kernel.org/r/20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v1-1-b7bfae886211@linaro.org

---
Neil Armstrong (5):
      dt-bindings: mmc: controller: clarify the address-cells description
      dt-bindings: mmc: controller: move properties common with slot out to mmc-controller-common
      dt-bindings: mmc: controller: remove '|' when not needed
      dt-bindings: mmc: document mmc-slot
      dt-bindings: mmc: convert amlogic,meson-mx-sdio.txt to dtschema

 .../bindings/mmc/amlogic,meson-mx-sdio.txt         |  54 ----
 .../bindings/mmc/amlogic,meson-mx-sdio.yaml        |  94 ++++++
 .../bindings/mmc/mmc-controller-common.yaml        | 357 +++++++++++++++++++++
 .../devicetree/bindings/mmc/mmc-controller.yaml    | 346 +-------------------
 .../devicetree/bindings/mmc/mmc-slot.yaml          |  49 +++
 5 files changed, 504 insertions(+), 396 deletions(-)
---
base-commit: f486c8aa16b8172f63bddc70116a0c897a7f3f02
change-id: 20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-6fa70546ebb8

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


