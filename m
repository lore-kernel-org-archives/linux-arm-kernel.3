Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15979C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 11:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IvRmj826ad4QUb971cjwKbsd9avSTJmnW3hYgxwozQA=; b=HnpH7H5EY1DZj6gPbnchJ7FghD
	Y9DYFNgV4XAfITzuAYIMgIVVYQUShic6wWFfnooQ+QMFVRo8AZMlRo1za6uL9h/wMMKgsBCr9C/nz
	PVBHFZdL1FSYysPhTxrRg2mwI80WSBIDW4YC3frTiuG4gs+pSGR5Bt1UQF67K79DqlAjhd4pCx0uS
	tOibAVRR3fEn8EUMOcvWee/8Z2hYxdZpmCZCEhfJGXFVdgYP2ndtNxJFqL/ub64Y8chH/aLuePjDh
	Z8Kpo0c2kwZwvIvZXWkm7X3cB/foAd2gaThCTjPhWfD0Hk3Wf1eVLAYyIjRbEgl0WtfvrUi6k4LhC
	eCgEfETg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEnOd-0000000CCm9-0rhY;
	Tue, 13 May 2025 11:02:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEnMW-0000000CCbl-3DUL
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 May 2025 10:59:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=IvRmj826ad4QUb971cjwKbsd9avSTJmnW3hYgxwozQA=; b=BQl3f5poYGRws+pi8qI2uqEBfE
	URqgCdduwd3MuZK0YppykCSygHpIrO3kP9KnvB3jCM+axPhQgr1A3tlECuGKpPM3wBPee6JLq9+uQ
	/bAZig47HlgMfd1u9LYYgiGmz/zZ/lT2cXhXMGJWVGrqBU3t5Rux78vJfiApraneNqRw9vmb3Kkzn
	lLCLV6Wxdb3Zr0pKo1D8OLUobItdIdsKNE84ApZG43GwgCQKsCGjIJQibdYIFl6ISVhlWmikmTdfU
	dJJLsl+dqfPv+nvL35Y+3igU9w2kclcYFnpfP27szUJsHGb7CNvrNfoXC3p2m2uEiq1Owkz+ydh67
	iPpURnrw==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uEnMS-0000000GxlA-3I0N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 10:59:51 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a0b4c828c1so662698f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 03:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747133986; x=1747738786; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IvRmj826ad4QUb971cjwKbsd9avSTJmnW3hYgxwozQA=;
        b=CMnh2XB66ZpGVsg+72JTsfcD0mrFu8HGyTLgC/tda2X9Onzqki9nAjhWY4ag77hbeU
         I4/ZPYudeNYbLFYcLTGDJW65Lde7bdbetcnoUeg2dBGLHtqb887LZvQUH4cPwVy189ri
         UXjOPwvYsL5SGrzluzoOvlKhtge7heByJqwEvKqLxyYK9IwltT1PO18hwjVmzTv03F+n
         eClIrJZiNzeSqF/x6zjhtgEMrqk2ulVoKA2I2b+xeFtXMXvH0gI480YVycHXIoHCbsqg
         8lSptNlUMSG5RKu4YpQTS/JC84ZMvcqLE9cPhzhpEfyhj77DtzTT1+rUT+0StHjVwZEy
         KUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747133986; x=1747738786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IvRmj826ad4QUb971cjwKbsd9avSTJmnW3hYgxwozQA=;
        b=SMAHujrWWBMGyrzhchjNH/NvdF8KT/uE8d2/F3Y/c7TARQO65UPj/KiqoC4jEmimiY
         71nyBboQeS4a7HAn2DjyN6B1f2uxFZvLJAvKtDylbVKw80sBxyiRz1kLTIoW2qwQZlAR
         P4sTfjZoV4DfuhIxpoN6hfqtnmAxUc5U47+ZHb5VOTgnafpISTdkd+trZSsSBdQ1AmOu
         bMAibfPhK1Ro6xN+Z3pQ8exO1gcH7TPIf7FZunKIJHpi/rYrgnItBF4RcgTdDthwe6Ua
         LeRo6HPr+HB1nAnIGazC9GGIeq0V8qhxovfaGUzrj6KMhZYnJF7S6gPw62p9gM6SFz9Q
         L2Xw==
X-Forwarded-Encrypted: i=1; AJvYcCUYWll/UopEHTD7CUVUq/zKTvszanaZ98fYGqqZTeI4zmOwSawo6f2EksmvmlfLj3eqlidIRTo381C8s4ISmbYt@lists.infradead.org
X-Gm-Message-State: AOJu0YzzARPlEvtoi15U4gzKNiwvDtWFMyRO1Qfib5gPDK5ELlUycq72
	oX+Qj3+FaFDBVR72Ioq2s/YoQpiS4/bXsznhJnKNAi+jas9qlt/IrH9f0PhPZvI=
X-Gm-Gg: ASbGncuVjS0HT+BiJ6qpnBCfOjj+BZ35vL4tzZ8iAJMaYt+Kc0u6zMr/+HSyJZRj81K
	k/vRP/MSzD14NS/IVoytMAXmdntPU1bRoJQjbemZyFspezwwGFca2ZCMdWCTEe1D5nUC9WouzYJ
	WlgKcC+JOsrAV6xj98nIryNKihZ2cQpawi3M3GZCNkaFwdl9yeCHTj0yXEySUT3v7h7Asz8rRAU
	Lp81dvBXGoBs+G7iZLOHgnlLYTXBHbNxgn0tAEgV7h5ylRmaBqXm5Y7JE6s/6ZDz0jp5ykJYr2N
	HqMpb0cYMDksDQvYmiaEnm25hIbQ21tKIEGiqK9N72p0bLnjD+s/qCY//XqvoDZ/zrcbV4NYY4i
	mCydRLb5v+X59/NVJpt20+xVQxO0z4ni5k9J34lo=
X-Google-Smtp-Source: AGHT+IG5fKMxvjjltTJpP1VGWjmB/2GOQg7Z1BsjigMi3Gmj35E8GZ5+qOXlM4koXQ1T7HjcmVC4nw==
X-Received: by 2002:a05:6000:40df:b0:3a0:782e:9185 with SMTP id ffacd0b85a97d-3a1f6423590mr4776881f8f.2.1747133986123;
        Tue, 13 May 2025 03:59:46 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f3afdsm16078670f8f.60.2025.05.13.03.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:59:45 -0700 (PDT)
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
Subject: [GIT PULL] pinctrl: samsung: drivers for v6.16
Date: Tue, 13 May 2025 12:59:41 +0200
Message-ID: <20250513105941.28448-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1442; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=GAD0kFJ5YJ2FK8mLZ5w9P8zRKTWeWXXWX86RwPrS390=;
 b=owEBbAKT/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIyYeXGYfRXBpOgZAbyMyM0G0gXfP7x4rVhaNG
 ZNlW5kBi1aJAjIEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMmHgAKCRDBN2bmhouD
 1/mMD/QJrD+uVxskUSpR2WCT2iO2+zMLNh2Y105Wpicr6Ppz9U1EayRxH/yzRm4FqlVITLwSXPi
 J7Wutiaf6sSE2g+LRG5mvicN5kctLn6jeKpgtCr7chJmHsffzJ24bC4MPO77a84H/0pItzLZYss
 W5bzXLsjUr8VMg/22ALBMREsx+wfGlD5wzSXf/eTXoPaIWktsTOaSMC6UQ1+kC5zLgUZHXVJdW3
 wf4gOksiN+SxVyQw1831nBdb4d3o68a5HtWw/q620FAkMOmKrur4T2Jow9E2eAaC3xjcE46cynw
 m/FXrz42LMv6FeI+6oPdkx1gn00Eeg4pM2LRIyTK9htDCTkC5DvNZvOwTbvobADJgAxopW8riR1
 9yEWXP0hQOTaoLnmWmatCcKRPhvFh3mScZ7aWEML5Vh/AVRVe/2vA2tyPqBi9kxePyQbTJjAKiE
 PkRTZ7gAgGxy2W6y4oXv85TbJgt7FYIQknSg4xPjnmkhrAcOXi77Q7hGQxDwh0bJzxL4bwgBikx
 ZO2Zh5Yi2T2TzlEffmT/iaq5GtwUtRkOdwuK6byXJJpRAL6GFlyAVKdXqxtRJzLR1EncdtF9c2i
 x3BO0yWGmDqHJXPZ6Ge0SoVyGhmn4vq+eo5UsX+5n6NqJwlqI5f+3YqjebieP9OZmVRz21iaKm1 VIdZZ7f5Bry/C
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_115949_251235_8A50D5F3 
X-CRM114-Status: UNSURE (   8.77  )
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-6.16

for you to fetch changes up to a30692b4f81ba864cf880d57e9cc6cf6278a2943:

  pinctrl: samsung: Add filter selection support for alive bank on gs101 (2025-04-08 20:57:51 +0200)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v6.16

Refactor the driver suspend and resume to handle Google GS101 EINT GPIO
pin banks and add the alive pin bank for that SoC.

----------------------------------------------------------------
Peter Griffin (4):
      pinctrl: samsung: refactor drvdata suspend & resume callbacks
      pinctrl: samsung: add dedicated SoC eint suspend/resume callbacks
      pinctrl: samsung: add gs101 specific eint suspend/resume callbacks
      pinctrl: samsung: Add filter selection support for alive bank on gs101

 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c |  52 ++---
 drivers/pinctrl/samsung/pinctrl-exynos.c       | 300 +++++++++++++++----------
 drivers/pinctrl/samsung/pinctrl-exynos.h       |  28 ++-
 drivers/pinctrl/samsung/pinctrl-samsung.c      |  21 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h      |   8 +-
 5 files changed, 255 insertions(+), 154 deletions(-)

