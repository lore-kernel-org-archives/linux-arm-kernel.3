Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDDDCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 15:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J2+GEmKa2OmE1NjrVANYz5XX9YGwV6aNe/Kh6e6q34E=; b=BYHYthdESQGecb
	1iDdWRii5ohfiRM7BLEFWP7dEN3f2YRYVt/57KTVLdzo9NR7jj3bViH7hsoCMQpaBHb7lP9Y9fjEz
	7201RSbvnXJZrC8BtajmTHcSfeLw0NSNvh91Uu9mAE+TjPPJQDKcpu3IUE29F+Qz8qUBucdw7iAJF
	mhdGuOEul86nICTPysiiRFM2P7syQs37565LIhPUY2+Oap+9sA6JTBKN76LTT2bQcZTOL12jmN1r+
	0iKwnY9QNmQgHk8i3JqbpxrRE/ESLIC3o/2MaH535QZ5PCuRDbSStPihYkXQFAv9LC/I+Nz1+P9tH
	uzyQuoLZKrH08jpxGaFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urISL-0000000G2ld-3TBI;
	Wed, 27 Aug 2025 15:53:01 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urFkl-0000000FVDD-2KiA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 12:59:52 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-45b4d892175so34511345e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 05:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756299589; x=1756904389; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J2+GEmKa2OmE1NjrVANYz5XX9YGwV6aNe/Kh6e6q34E=;
        b=HdDqy1LguvIsJRFSX/yZXBw/cHPlo/x2+HDiqjheGoq8cxpUkBtFONWlexFvCY7Xhi
         QuR8HcipCHtZZtLztdFcIyh1Q/pFWHCrzFQ8A38kThlUyTOmpY9U08mVxkl0NkzDpCTr
         32/SGfB76mFiGLVP76hspMFwmxUoa2yG26byDrtio0pexatEglyhBawsYNUkVeI+ujVG
         +8TP/j6o5gYiaZzXbH/yrNlo8YKaHdvXjQ1A9ZEvcxWCaglxRXR/jJsxRakR66S8sDlB
         y5fv6H6p01evz+JkSpY2ABlYAmn+BM7ArHa5rjifvCGMYoRtKiLy0iVfbZ7zwjRv6c4i
         tBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756299589; x=1756904389;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J2+GEmKa2OmE1NjrVANYz5XX9YGwV6aNe/Kh6e6q34E=;
        b=PBdr8v4Wzbg7L/hS2wAK2Fn+UEGphuTK8+te5DLTPqCdDmGGc4Cdus61/v2+gdEARh
         jASSNxHMAKYdZwxXupNqnnU8KGOCax+JfoRGzz0g/QSWdETEugo6OjnPb2e37ABTE14Q
         wjMJb38g8mfHmwJNbsd10yHqU97MoEEhL8cjT7hMRE2fS/5uLsxgSm/NafS64OuEhmQw
         MWyrinKBPCS6MkJlMsiAkFU6x7aXrPtKxEiBt8lj61Po1RVuxmbFeh4MgRAw5lEJlJpY
         lIKdUZ0sQxQvDerkaTAy9jM4TWjfNeXOW3N4lUsT6mmT1IPx+RjO8tweKPmg1LU4CaRS
         xOtQ==
X-Gm-Message-State: AOJu0YxrfEDh/kculMJBX0Hfv7El8kl57EyxiJQEd5CvnN0gIz+mgrTx
	7mgLkSW62Iiy/QPgYiGv5E9HK1guyIPFCRuhyRbMubsQ9aUyTUBaDAA5OAMD5nIrRdM=
X-Gm-Gg: ASbGncsymQqixJzYkJO5RjYjtzDpX0CbVfn8Wb2PXWG3afbvnbkMw77u+27wK5OddgX
	7Fs6l3OxP3lxZkS179e2gU6/jpUvy3dvI2VMK0DMbzsm+Jhadw6cdl6/XR5Yrzt66dgriFX+LGA
	ffx/jXXRDZ2Rr/5rY5LDy3c5S6xzuCxM1l8Knt5B6mS+BTGqzqcRQDVcuiNNfYmkl071puIC3RG
	CkcJHN1QTOG6ob8PcGcg/5tqb/gNNV1x1aUgFHjyGow9WQJyiE1Sl9EantROJiltrrlf7lqzJsP
	G2AWsXlXTYu1NG1/bz67Dciv2UjjfgOeXBgo4k5ukITYsazgnzQQzKXvIsZ+rfTIWIb11K2UjAg
	aJjZWfZWUahhmdDTzVGhS/MKKKjNEM6KITYpGJDGNCCmXAyoXW7Lq43eBvUmIFe/hy7bk1tHtx4
	zoJA==
X-Google-Smtp-Source: AGHT+IFYbOQDkswd8yZg7ePHjCvgvWKEUD2miqxIlRTjqnawegRIfM+9sdtjHuSQ/AW/K7wL9nEJSQ==
X-Received: by 2002:a05:6000:43cc:20b0:3c6:aa87:d959 with SMTP id ffacd0b85a97d-3c6aa87dab1mr11788600f8f.26.1756299589300;
        Wed, 27 Aug 2025 05:59:49 -0700 (PDT)
Received: from ta2.c.googlers.com (219.43.233.35.bc.googleusercontent.com. [35.233.43.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cc890b178bsm3272069f8f.52.2025.08.27.05.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 05:59:48 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 0/3] arm64: dts: exynos: gs101: add cpufreq support
Date: Wed, 27 Aug 2025 12:59:45 +0000
Message-Id: <20250827-acpm-dvfs-dt-v2-0-e1d2890d12b4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEEBr2gC/3XMQQ6CMBCF4auQWTumxaItK+9hWEBbYBJtyZQ0G
 sLdrexd/i953wbJM/kEbbUB+0yJYihRnyqwcx8mj+RKQy3qRmhpsLfLC10eE7oVxXWwN6MGZ62
 DclnYj/Q+uEdXeqa0Rv4cepa/9Q+UJQpU/qIH0yihrbo/KfQcz5En6PZ9/wLSjGgKqQAAAA==
X-Change-ID: 20250819-acpm-dvfs-dt-06bc794bdccd
To: Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756299588; l=1160;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=oYO2aZrhN1EN+TKF1UnZ/sK5wtemMH9P5gox8Ik8xhE=;
 b=vFZY7juelyD4nVnYQ7mi3pFO0bqjlNOteUib11Jccm9ahWUZSQbBny11zaRftz6LXZp8Erea+
 mOSitc7kKe9B+IHnTcctE0okkkdCgc7IFUPuhRPIxgN0UeqElkV7R2t
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_055951_608966_A7A76AFE 
X-CRM114-Status: UNSURE (   9.12  )
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

Define the CPU clocks and OPPs.

The patch set depends on the bindings sent at:
https://lore.kernel.org/linux-samsung-soc/20250827-acpm-clk-v2-1-de5c86b49b64@linaro.org/T/#u

The following error will be seen without the bindings patch:
arch/arm64/boot/dts/exynos/google/gs101.dtsi:75.24-25 syntax error
FATAL ERROR: Unable to parse input tree

Thanks,
ta

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes in v2:
- acpm node becomes a clock provider.
- reword commit message, extend cover letter with info about dependency
  on a bindings patch.
- Link to v1: https://lore.kernel.org/r/20250819-acpm-dvfs-dt-v1-0-4e38b95408c4@linaro.org

---
Tudor Ambarus (3):
      arm64: dts: exynos: gs101: add #clock-cells to the ACPM protocol node
      arm64: dts: exynos: gs101: add CPU clocks
      arm64: dts: exynos: gs101: add OPPs

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 284 +++++++++++++++++++++++++++
 1 file changed, 284 insertions(+)
---
base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
change-id: 20250819-acpm-dvfs-dt-06bc794bdccd

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


