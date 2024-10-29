Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37FCD3E2DE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 07:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4XhfsmwUj+X8iEqSXpw7DJyfNK0UwrOSOb7rXfFCTvk=; b=dekYvSr5x/bHfXR5fPiSF+H+/C
	BlJODkVCm6Bz9A4abZbD46DfJzjQd/giJO+QU/UR3CzIjQCr1b2Fw7OY2ya/GCa7IXcIzYEPc/xo5
	0ArJoj9Y1+W1jbrJu2I5yQrZF0g9HCziZWXffX9ODmgHlKg+euGqzXCZlkIWACNPXioFM8rU0U4SK
	M+awBa0mw7jdu9TcYYQoh9UHFVu0FIEuWObsrIGWgl6TGiZeHBEbC+64jYtd326y9eBx5eZWk+pJz
	vgMi9zpcCzIwo/TAlndn8MTRlPfqfy+i+02mqGCW1LJ9OH9jZCsV1gIIAeER0w+qYAtuSorUwS0nm
	CY8hqmzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5h2B-0000000DaH8-3kYa;
	Tue, 29 Oct 2024 07:52:59 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5gyQ-0000000DZS8-2tuf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 07:49:08 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-431506d4f3bso5659235e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 00:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730188144; x=1730792944; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4XhfsmwUj+X8iEqSXpw7DJyfNK0UwrOSOb7rXfFCTvk=;
        b=DtnSBDSNXmNgApeKekBmVNr3vx+ncd9F4uaSupgWw1Vtn2nCMnkqkcYUI+RJM/OW3p
         0bVy3r11gonl95l5UbG6LrA+YdMecfIAfua1OrV5SghNPnIdj14PxwFivY1XovpnQdRU
         2Mg6JTx1zq/nL3LaZywZAkg41O9nBH4JMbIAR8lKvw40taSlmUIE908fE//jj5W/04PH
         +wX0cJEK6crJXRkjbb8GrnktCxQGWhiSJl8A98OIUaEflvaJD0G/TjbeSZBsICcDuKq7
         86fsb3+1TzZm5bHvJNjnI6kL4raC5PTmAjWZgOkYLLVlZ2AXa0A/HkPov9Nr003XipUg
         tSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730188144; x=1730792944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XhfsmwUj+X8iEqSXpw7DJyfNK0UwrOSOb7rXfFCTvk=;
        b=IKLNocQySXCzKmQ/ZyWQnGWWpuI/GMAF8vEqERPgg0MoPbGGlX5RZPBUV/IsxCKoHf
         JSYCP3cBtGUcMGOHPWMFvn+Ubw/gw5tf3Oc76smHOaZsCQZDIELCIzuzQ62d5yfbAU3p
         VymX18hx4JJxeK3b4fW/VLkIY7HzXS8oXmFH8YWuRyBiH+PBjCNEq3oafgi4xi3AMO+j
         GYG7oqXxE739vrTmVskz+dwzcIj8YIV15JcL17c81RYP2eL8SE5ffRk/+nUiiLNO3UGl
         UOxVis+spkv2EJMYZh9za28CzZ9BVk+TeMDoAghSt0y2BExyY53NX5hbpRMd2RnvtoFv
         q+tw==
X-Forwarded-Encrypted: i=1; AJvYcCW1OYLcKzSmciXwei+gI94cpipigvpLWyeMUhZycwPKpH4dquswaCj5LLlCo+Rri9Y0V4Oqc/EDA+DUdoKxApui@lists.infradead.org
X-Gm-Message-State: AOJu0YzCIuGxq+q727gqBB/75/uE8w7EtbhoRzwRpkaM9OaWJd6z1wki
	uYUTi+bNxCj010AazzEE7+HzNiI4hAPae5gGiOGF8SZNrQhFE4drsy48hoxcd00=
X-Google-Smtp-Source: AGHT+IEjldluzPS+mbSRbpzoiA8QHGhxGv3xtNxXkaRT5kOdZUeZudVSGvXVTF69IiXysRbTVe04jA==
X-Received: by 2002:a05:600c:4f10:b0:42c:ba6c:d9b1 with SMTP id 5b1f17b1804b1-4319ad236dcmr39811725e9.4.1730188144508;
        Tue, 29 Oct 2024 00:49:04 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b3bdafsm11691358f8f.30.2024.10.29.00.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 00:49:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] pinctrl: samsung: drivers for v6.13
Date: Tue, 29 Oct 2024 08:49:00 +0100
Message-ID: <20241029074901.18977-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_004906_757154_C68D74C3 
X-CRM114-Status: UNSURE (   8.60  )
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

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-6.13

for you to fetch changes up to 6d2dbd4cec8939ad2b813b8052eb12406db528d7:

  pinctrl: samsung: Add Exynos9810 SoC specific data (2024-10-27 21:02:08 +0100)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v6.13

1. Add new pin controller drivers for new Samsung SoCs: Exynos8895,
   Exynos9810, Exynos990.

2. Correct the condition when applying further interrupt constraints on
   certain Samsung pin controllers.  The condition was simply not
   effective.

----------------------------------------------------------------
Igor Belwon (3):
      dt-bindings: pinctrl: samsung: Add exynos990-pinctrl compatible
      dt-bindings: pinctrl: samsung: Add exynos990-wakeup-eint compatible
      pinctrl: samsung: Add Exynos 990 SoC pinctrl configuration

Ivaylo Ivanov (3):
      dt-bindings: pinctrl: samsung: Add compatible for Exynos8895 SoC
      dt-bindings: pinctrl: samsung: add exynos8895-wakeup-eint compatible
      pinctrl: samsung: Add exynos8895 SoC pinctrl configuration

Krzysztof Kozlowski (2):
      dt-bindings: pinctrl: samsung: Fix interrupt constraint for variants with fallbacks
      dt-bindings: pinctrl: samsung: Add missing constraint for Exynos8895 interrupts

Markuss Broks (3):
      dt-bindings: pinctrl: samsung: Add compatible for Exynos9810 SoC
      dt-bindings: pinctrl: samsung: Add compatible for exynos9810-wakeup-eint
      pinctrl: samsung: Add Exynos9810 SoC specific data

 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |  23 +-
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   3 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 431 +++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-exynos.h           |  10 +
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   6 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   3 +
 6 files changed, 468 insertions(+), 8 deletions(-)

