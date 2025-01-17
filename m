Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9784AC02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 17:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VpofVFRqOOEG6qf6RBN58H/+7B1FAaQ0YrVaEqz5D7g=; b=guLcVzjRFE7b7L
	pPAoqQBookrIntNt3s6Vc4rjuA+eCMfGRXiCvzH4B3VgPUDDaAimzh+M72RH89TMTAfcj+HvHCRON
	rYFT6RsO7Vd2YsGvX4TZXcw2NKkZ/6W1fVnvLeahcOODk4V2IQAHGO/952IoNZmUiTBWCGAtUAV3c
	KpwRkkP5X9HkXbpxctxzwoO2DWuNi6G5v2tqGueV6cSHH/xpHl1BGajiKvXGYomsdEY/pQvr8AiOE
	5XBUkGMtcDCO0ogY+5nLuHsqLUObjZq4q3PKhGdR5NqWwlkmjVQDB3YdsQ9lrJFyFjpAcAOt/avgA
	AxDSYqz5sT/+bYkU1Gig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpvK-00000000vu7-1HjX;
	Fri, 17 Jan 2025 17:14:22 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpr5-00000000uWs-20v5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 17:10:00 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso3796764a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jan 2025 09:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737133797; x=1737738597; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VpofVFRqOOEG6qf6RBN58H/+7B1FAaQ0YrVaEqz5D7g=;
        b=jpfdFCoyTF1RqQ3bu4Yiy8qLMrtASO/91rErDIyyz7lJ6VoTlbMCZAWtMgj6BrRkwR
         mGAAWemIjuZmlgTZviBRpLr8ymubIAjnDi/CVLwmOytgdVTa9RbOrq/3ZqWm85kSB3CB
         7+iZq8hVzTAN9Bw+8l1ZWuqWu3SvFxiGi2sU3/6yvcw+bJRFs/mUoEX5TdWrL+p+xWcD
         AR72blIWif7WjylpVWvOXfctMNtheJNmhFJLkY8VeZJhYafkIfrSQIPEfUlytvPHp9Cw
         ndzZZgDlXAl8a5yJJIL25tGhKeCP2TV3bHV6BLTDHLjWTJqUZgnbb9yQoLNFdGLDe90U
         7ofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737133797; x=1737738597;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VpofVFRqOOEG6qf6RBN58H/+7B1FAaQ0YrVaEqz5D7g=;
        b=Fqxv+k02ckyvDWMohqWPd2Y19nGGkAaKzTbOmVvXn1YLsbEhqptE/nfHcUz3wAK+C4
         bXO5aywOxBM+bQY8sExr9SOqVgDcTIeiGLkuzkassZFxbaPUJcdQ5jCO+cn8aRTfe9gT
         KBUxFjXetPkjZ5kWiLluOqg+YiwGqMbqe8aV0RZJOZleaE9FW2UpfDns0szI7W0YPeQ6
         W91SCG50UycD1KjTP5fO/8AGGs8IC/MF7zspB/f5iKGYt8o+PASBskzh8AGYaQya5Hed
         bgZusZpRmcspnzl5qGMn0ThnavtyzQjSQ9s7JOCj2UPcC3GWSErEQ96BVDkfgpvVLbgz
         Rt1A==
X-Forwarded-Encrypted: i=1; AJvYcCVv+swce8ubBlSeZ7NSFFsS5KaSj79KyASNja7uV0WmARooEHAKOwTQypEPgudWWRHLxkqoK+pZVTOMPaMuVhe5@lists.infradead.org
X-Gm-Message-State: AOJu0YxNYUVW5mDkxBcjzWvh/TiYnJUlI6sEaeVWZ7juw4roTBtrwRwP
	TIgN2wMdSwkLzj8DouUhFfDIU6inNSwCSDulLrSLPTVcMOnCXZOcYbpUMuYwhuyGOEL4seEfFnT
	ieio=
X-Gm-Gg: ASbGnctSdjtSfrPuoJeYTUbigVsRH6xXqwscWaEq8JnKr+VIenBqKnTdrtY7RQbM47+
	OjmPBPREpweMv7K1tVvAm9YcT9iNA3hk2qkHbU7NMIrV37Mge/sC7yRcjzHrZ5Ffe4/3g+NPxSq
	k1CVr8gh5OT7HDtoq96a2zwhbokpOU8+UzqVztEtNZuaUVRASmKzaA8A8IVYQDXiszNXUp3dVPi
	1POF3gNk/KRZGNfEzPDPBly3hreUDV8p6ZOHy0vfx2PQnAZueyTFrhUEZmG54iYY2r/0GywnY66
	hRwxI44vXHYnpx8+Cyl+heQBSVZDMiZy0TEl6rLV
X-Google-Smtp-Source: AGHT+IFs8RJ3NO2OT33SRqFUyUB/tvu/B+LNlrcE6krOU8A6UpaUH6OiJazjufKRn27kaO1pthKstw==
X-Received: by 2002:a17:907:72ce:b0:aa6:7df0:b17a with SMTP id a640c23a62f3a-ab38b29b08dmr459543766b.34.1737133797425;
        Fri, 17 Jan 2025 09:09:57 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f87065sm199197966b.133.2025.01.17.09.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 09:09:56 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v4 0/4] Google Pixel 6 (simple) framebuffer support
Date: Fri, 17 Jan 2025 17:09:53 +0000
Message-Id: <20250117-gs101-simplefb-v4-0-a5b90ca2f917@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOKOimcC/3XM0QqCMBTG8VeRXbc456g5u+o9oos5jzowJ1tII
 b57UwgK6fL74PefRWBvOYhzMgvPkw3WDXFkh0SYTg8tS1vHLQgoQ8KTbAMCymDvY89NJZXWrIA
 KxXUhIho9N/a5Ba+3uDsbHs6/tv6E6/s3NaEEqYzRNaoUSOGlt4P27uh8K9bWRF+eYOcpeoOgV
 VNyVkK18+nH54CY73wafU5sdKpzRVXx45dleQNfaq6rLQEAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_090959_523220_9E9B50CE 
X-CRM114-Status: GOOD (  20.67  )
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

This series enables simple framebuffer support on Google Pixel 6 and
Pixel 6 Pro.

Even if simple-framebuffer is deprecated and DRM should be used
instead, having it available in DT is beneficial for several reasons at
this point in time (the phone uses an OLED display):
* energy consumption goes down significantly, as it changes from white
  (as left by bootloader) to black (linux console), and we generally
  don't run out of battery anymore when plugged into a USB port
* less of a burn-in effect I assume
* phone stays cooler due to reduced energy consumption by display

Since Pixel 6 and Pixel 6 Pro use a different resolution display, this
is the time to separate them into their respective DTs, and provide one
for each of them. There are other differences between the two, like
battery design capacity, but they don't matter at this stage due to
incomplete upstream support.

* dependency note *

None (anymore) - earlier versions of this series had dependencies, but
those are all part of linux-next already, so none remain.

* dependency note end *

For those who want to try this out:
The stock bootloader disables the decon hardware trigger before jumping
to Linux, preventing framebuffer updates from reaching the display. We
have added a work-around in our Yocto BSP layer for the time being
(until a proper display exists upstream). An alternative might be to
port and use uniLoader from https://github.com/ivoszbg/uniLoader, as
seems to be done for some other Exynos platforms.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v4:
- fix an unintended whitespace error introduced in patch 4 in v3
- Link to v3: https://lore.kernel.org/r/20250115-gs101-simplefb-v3-0-52eca3a582b7@linaro.org

Changes in v3:
- back to using separate DTBs for Pixel 6 and Pixel 6 Pro (Krzysztof)
- update name of common dtsi file (Krzysztof)
- use 'memory-region' property from the start in patch 2, don't
  introduce it as change in patch 3 (Krzysztof)
- Link to v2: https://lore.kernel.org/r/20241220-gs101-simplefb-v2-0-c10a8f9e490b@linaro.org
  and https://lore.kernel.org/r/20241220-gs101-simplefb-oriole-v2-1-df60e566932a@linaro.org

Changes in v2:
- We now have a generic gs101-based Pixel board DT, which can work on
  any Pixel 6 / 6 Pro / 6a
- Pixel 6 (Pro) are overlays onto that one.
  This has the advantage that all boards can be supported without
  having to have a full copy of the DT for each of them. We still
  instruct kbuild to create merged DTBs (in addition to the DTBOs) so
  that existing scripts can keep working while giving the option to
  just apply the overlay before boot (e.g. by the bootloader).
- The binding has been updated according to the above points
- I've changed the simple-framebuffer node to specify the memory via
  memory-region instead of reg, as that avoids unnecessary duplication
  (of the size), and it avoids having to specify #address-cells
  and #size-cells in the chosen node (and duplicating this in the
  DTSO), which is otherwise necessary to keep dt_binding_check happy
  and DT validation working in general.
- sort overriding/extending nodes ordered by label name (Krzysztof)
- format patches with diff.renames=copies (Krzysztof)
- dependencies have been updated, see below
- Link to v1: https://lore.kernel.org/r/20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org

---
André Draszik (4):
      dt-bindings: arm: google: add gs101-raven
      arm64: dts: exynos: gs101-oriole: configure simple-framebuffer
      arm64: dts: exynos: gs101-oriole: move common Pixel6 & 6Pro parts into a .dtsi
      arm64: dts: exynos: gs101-raven: add new board file

 Documentation/devicetree/bindings/arm/google.yaml  |   3 +-
 arch/arm64/boot/dts/exynos/google/Makefile         |   1 +
 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 267 +--------------------
 .../{gs101-oriole.dts => gs101-pixel-common.dtsi}  |  22 +-
 arch/arm64/boot/dts/exynos/google/gs101-raven.dts  |  29 +++
 5 files changed, 58 insertions(+), 264 deletions(-)
---
base-commit: 4e16367cfe0ce395f29d0482b78970cce8e1db73
change-id: 20241216-gs101-simplefb-8aae80278ed7

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


