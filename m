Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24476D5B165
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 08:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UJk4K1NEYom8w+Pd7ggik8xB+/zfQw0G3X6wkeyzU9U=; b=ZtDTGiGexfWzYzU777d1dPVsoC
	bRTuncYeYZedghgZ1B+juEvZQDGlW/1mKGrHbVQ4xGhOFHaTVaTOBr86a+/yTiG4z0KFQmAYJ9BnU
	f18Mudd/8cfNxT3N5kVLz2+qmQoNS2tQ4k1itpP+CrAY4OnyuDZrCqgyD2pAEy3b0oowc9bmsyglb
	WrIi43KL+QK6H+wMX1OCz1CAWrkL0uFmzaij9qLwXPV8m4o9oeYfs5Gz6Tpp4ec2/dwmIvK0Q5H9b
	Bx/afU2AKlYyBjXjBgaw7scmVIqZ8kPcOHJYaJ1ELpoxj02Ii9K7vdvkeNpdokY9aAs9/+GkVDve6
	ZzgmpuQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hO3-0000000DdtN-3ddX;
	Tue, 29 Oct 2024 08:15:35 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hIl-0000000DdEy-45MU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 08:10:09 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4315b0bd4ddso6418735e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 01:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730189406; x=1730794206; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UJk4K1NEYom8w+Pd7ggik8xB+/zfQw0G3X6wkeyzU9U=;
        b=OI7juhvFDvhZc9G1u/JQR7ZRFs45JOm4asUXArHzSBo1OBjEUXW2KoKCOQPDRZJagZ
         DKz78ik4E9CG31yRfPd0CxBmRFWA4M8EAb7wu0aRwmnBkhjLu9wMouOnoOT6OgVgZIlq
         DQb4FbN8ob0JFvIFv4Y9zlUiY6uuSyxFYmGnk86+nIKQqOXg2YrSIja+mVjAih74biRC
         39C66j27MtYwV+Z6HbAfquk5LCzCBnOW2qy8DfprZIVsC4DDxlrEr6wUUaunGCfZXyxr
         uyX6X8ZsPzkVgot4xrhO7RRmFJyQ67OkHqA/NEFpO2X2VdgBiDYTZYLUvOG+xm4iW8Ql
         5PsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730189406; x=1730794206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJk4K1NEYom8w+Pd7ggik8xB+/zfQw0G3X6wkeyzU9U=;
        b=wy2US2vg0UKNFuDS1zeKvl83cKdoCUVrfk/veAKxE2JUUOcMH7SwNQV5zaHPEn8JbG
         /T4vbT28ko92B6rLUH1kP/OOujgr/drCC/6u5WM+zBIQ4rUI1982FwwakCbdUlRcKueh
         dtrLFdJQQe95RJ1A3vR9xapYTIlnQHPl9jAXZ3mJmJXxTyCUu/r/aZ31HPT7VUQtG0G0
         qR3mmJVubp3uhmZ1tOWfMY5eQGAaQOWXWRzXZ1LQCGiLEvByc4i9QYNySv77pfxZkwKF
         z0hW/miA9pQm+HMD9KXPd5JZNSdu/01TRmJDA8Q/RIJsj34/9AY7SGBGq7RuJRE9mdAV
         qGGg==
X-Forwarded-Encrypted: i=1; AJvYcCUMidDsLkqP+9LntVopA/OaJfjcYpe+Xlk9vE07XbdU/rlnvEPD7H48cFUZzhMqWOtBzlO+V9Hba/WgIuNDibIH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3OYLoH+6yZFuIW1ghoc9i4fSMgTcQxZKr5phRFTAYd5Fzf5BH
	A8ANqSHQzT5xUPzvyqpBpjqY+sXfjDqfLL0S45rMCPz4gLpQpg9NxRUUPeOcsi8=
X-Google-Smtp-Source: AGHT+IHnLTXH3vKK9bio7SjMSZy36YKvL0zVstM38RToyHUADBXCTaWksKX2nxZaf0pDqrVA4QHoMg==
X-Received: by 2002:a05:600c:5494:b0:431:4a7e:a121 with SMTP id 5b1f17b1804b1-4319ad4ee8emr37678985e9.9.1730189406260;
        Tue, 29 Oct 2024 01:10:06 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b55f784sm165467485e9.19.2024.10.29.01.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 01:10:05 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/3] samsung: drivers for v6.13
Date: Tue, 29 Oct 2024 09:09:59 +0100
Message-ID: <20241029081002.21106-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_011008_039778_15E43383 
X-CRM114-Status: UNSURE (   8.66  )
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

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.13

for you to fetch changes up to fd0b3581666860610ac770d4b582df42e0065c58:

  soc: samsung: exynos-chipid: Add support for Exynos9810 SoC (2024-10-27 20:53:54 +0100)

----------------------------------------------------------------
Samsung SoC drivers for v6.13

Add Samsung ChipID driver support for new SoCs: Exynos8895, Exynos990
and Exynos9810.

----------------------------------------------------------------
Igor Belwon (2):
      dt-bindings: hwinfo: exynos-chipid: Add compatible for Exynos 990 chipid
      soc: samsung: exynos-chipid: Add support for Exynos 990 chipid

Ivaylo Ivanov (2):
      dt-bindings: hwinfo: samsung,exynos-chipid: add exynos8895 compatible
      soc: samsung: exynos-chipid: add exynos8895 SoC support

Markuss Broks (2):
      dt-bindings: hwinfo: samsung,exynos-chipid: Add Samsung exynos9810 compatible
      soc: samsung: exynos-chipid: Add support for Exynos9810 SoC

 Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 3 +++
 drivers/soc/samsung/exynos-chipid.c                                 | 3 +++
 2 files changed, 6 insertions(+)

