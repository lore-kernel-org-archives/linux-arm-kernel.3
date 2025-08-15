Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA4DCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Aug 2025 07:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3/iag55hYlHoA9rnpCQNvkxDZTtNeIJre3YWIpDvUXg=; b=pwMC7uCo5o8/+z7HNWolVi1gkt
	vxCTprvSnVBGSxzG7a3XViOl4JciEdZKkrdg+KdkDoRhIxSPVUNtL/PY0SGh0nSMCcghIUhgYAo5D
	fDiCSODqnO2KveJc9Y2cAQ4p4Ai1ZiZ7ZZnxtJ+mLApVyZgn8bnFWKI8jNHaoM+r9nxKk2Y7ox+DX
	OXvyUw/hbXbieTGO9+46HxMLpFNLp+l+/gDM52Oa1aQ8QkQ1rNTVgUm/QSl59gG+Lc23nM21wW+g2
	wh0dIBk7Xvs2y01DCow5l9Ef9AHQGnunVRtyMxBcawW0VLyetKtAO9BJjrD6sInIeJRed63nQGnWg
	vbEF1UtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umoXc-00000001gr4-1ykO;
	Fri, 15 Aug 2025 07:07:56 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umoV2-00000001gA3-1O92
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Aug 2025 07:05:17 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-afca41c7d7fso443833266b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Aug 2025 00:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755241514; x=1755846314; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3/iag55hYlHoA9rnpCQNvkxDZTtNeIJre3YWIpDvUXg=;
        b=lq2SZzJXC/fxvkOPr4gBiyxHulIBsAlMrFEzhok9TTpbG37VXkw8EQ7VwlgYkDKuMQ
         vsd5GjHitceAU/495G+T8fxzvPAmm2qW9zJkDb9yYURgL4i8kB6HkULmnEfSGDA3kmzh
         N/E1CtieoAzcfSo9nptCIA0rB6DBCvKkd6hJOPVadRNtaYy511WYOG/UfL3+VdUnWWUn
         Uj/50b46lCuuHgCi5g36C/GPOJ2F578fmdwjULkeUE0jL8NVh6lUmqCRkAIpVaT9nefS
         23dqPXz1XSMT9DJj1GjZzvbKZgZw3msI8UX7dqR2hnCI/DlCg0q0pe86uffolLjqz0U5
         +ZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755241514; x=1755846314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3/iag55hYlHoA9rnpCQNvkxDZTtNeIJre3YWIpDvUXg=;
        b=UZJrXpO7QVgk6HWOjXCLRHRa4OSZDITGrpPTSc8KN601K5kEClRSBGESt08QLusmW4
         IDF0WFw4E89aa6wqiwFl7qj6YH2IgqlDBU5AhmGsxSlgU2wL7FLunf/Piett48VnhxIG
         /80qzHt14NU/PH2fof//jsGOBCdQrUBMgoNhql8TMRjE43plJEGmgdxJLbh8xrAYBZHh
         21vy18wYjlqYXrN82FEVcZDp0y9NdcweeBjSCg3ihmqEs+L3zwPziPnjW9CM6JM+S5lw
         vMC2kWNCLKE2RDrSmRpH/sMQY5UkzUcDfmnuPTF6YB3FSPuye/XWAD/RUGKF2R7dPoxE
         AZlQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEB5hpHMX4q2EArU8dBmNAHeRGDtht+M+AnPxBsUQMamcL54v0M4rtt7bJZRSfF+HD8qO8653Z5cMn4Ku4sfHs@lists.infradead.org
X-Gm-Message-State: AOJu0YwvcBnoF6XMkh1qtbHw8eGaETKhWTFCzXTvw1+20yn7uRDX2BiG
	8IlWMIwO3xmtKz3eJgcHquA/bwrZfk7cTfHWV+lqv28luZXO8QywvM5U
X-Gm-Gg: ASbGncvoTG+4PKrJvwdd0nNQYPI6k9dkOkZZExcwzXEts9wX34bS7jeK1wAAZqG26Y5
	Pf2UYFKa+wcKO4HjT+u4VoIhIt/mau4t8xxZwUs9hQdd2FiEUbpep+gzAacvt2+3YEP2F/Zj1x2
	VMWPVCur25kqq9nxu3BRqukpbpAmpM+pYVeiZl7TDpsnAoh/iarqG1/sXpAJsicBF6IUsMJnUt/
	WEyNUJKVu0qse1Ud5xPzfpB7TZUv7bxRjH/SxMaG7V0Ht+sLtP5M+BRy42dBjxvgvZAZuMHcobC
	W7fFf97zvaR1Dy7WXX4aBjdwBZHstMSHwH34hqOL9Zz4fYepfCC+PB5bn2Ex9kMpjEwHbyN1Vk6
	cAlipFacjrrDhc+m5i9EGdz7F9nDrbSYUk/ZuV8l4sERxcnFGuKhEoeUU5FgPlCgwOvxZB+wseA
	==
X-Google-Smtp-Source: AGHT+IHr6wQG0PswCNw4vR3Wy1Wht3/V4Pr6akT/HuqhweLdwtaQD1imuiELwGEOJjYU60NXC5rzJQ==
X-Received: by 2002:a17:906:794d:b0:af9:3344:56d3 with SMTP id a640c23a62f3a-afcdb29cc4cmr102205366b.22.1755241514144;
        Fri, 15 Aug 2025 00:05:14 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdcfcb2ddsm74269266b.74.2025.08.15.00.05.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 00:05:13 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] arm64: dts: exynos2200: introduce serial busses, except spi
Date: Fri, 15 Aug 2025 10:04:56 +0300
Message-ID: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_000516_366886_C5C84F08 
X-CRM114-Status: GOOD (  13.45  )
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

Hey, folks!

This patchset adds serial busses, implemented in usi, for exynos2200.
It's missing spi, due to me having troubles with reads when testing.
Serial_0/1 have not been included in the patchset, as it seems like
they're encapsulated in usi blocks, but are the only implemented
protocol and/or do not have a dedicated register for setting other
protocols in a sysreg. That'd at least require patches in the usi
driver and bindings to add support for.

About the naming convention for usi nodes, I've chosen to keep the
downstream one instead of relabelling all to avoid confusion when
cross-referencing the vendor DT and to keep consistency with clock
names. They're labelled the same in the bootloader too.

Best regards,
Ivaylo

Changes in v3:
- drop the serial_0/1 patch
- add r-b tags from Sam
- increase the size of all syscon to 0x10000 and not 0x3000
- change description of last patch to be more meaningful regarding the
usiN and usiN_i2c mess
- s/usi6_i2c_cmgp/usi_i2c_cmgp6, following the TRM naming convention

Changes in v2:
- add a patch that switches address and size cells to 1 in /soc
- adjust all new nodes to define reg props with 2 cells in total instead of 4

Ivaylo Ivanov (4):
  arm64: dts: exynos2200: fix typo in hsi2c23 bus pins label
  arm64: dts: exynos2200: use 32-bit address space for /soc
  arm64: dts: exynos2200: increase the size of all syscons
  arm64: dts: exynos2200: define all usi nodes

 .../boot/dts/exynos/exynos2200-pinctrl.dtsi   |    2 +-
 arch/arm64/boot/dts/exynos/exynos2200.dtsi    | 1433 ++++++++++++++++-
 2 files changed, 1398 insertions(+), 37 deletions(-)

-- 
2.43.0


