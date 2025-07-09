Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11A8FC83F14
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 21:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LO2SvKCCqko+0I0eG/Gzz/cIcDsvNsYtE0Nh9DYuiN0=; b=EEuJ0HwT5ieoicIU0SNS+1cAWw
	+cgF8Vnmk8h38b4hKaxktIq7aY+v5MI6UxR/us4trM03Wl36zGAzDcBoj4tVh7JP6FGwyv61EPtzY
	ZDNipXDmSV2blu3NKr1fzZuKWnijqiJuU75cZNT6zqw4bZ8dk/GA9mcF/3OXzJfMxmdWXOxp1IExK
	IXrw9QX0AokcYJD4TDAWuXJUQeHSggbro+GIcdQn1DfgQ1XxlbxyulVNrWTW3mXCfEh0oVqtA4ZI9
	vrmJB+qTddyclfTgtkmR1hKpQPXGhGjV4yx4apJBLGPVXTwuYaJLtph+70uNoaBGn1VnRnb8C8vbS
	MDOft8sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZcor-00000009ydg-0Amd;
	Wed, 09 Jul 2025 21:59:13 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZaF1-00000009fTN-1nJL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 19:14:04 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-454a3c5d6f3so249305e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Jul 2025 12:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752088442; x=1752693242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LO2SvKCCqko+0I0eG/Gzz/cIcDsvNsYtE0Nh9DYuiN0=;
        b=I6MA5OfYmMnHQq3tpI7spweWZIuJ2g1S8/l+a9jZUVhTUovNZ47lfWqvtPCC/rv01n
         N2gUxC4kOd0iK0iTGyqh8j7zU47LeNiUFnz/TcCJbwoqP+ykUgaaYiS/22iAS+psqpMd
         SOFM9cMsxQM409IO4JXmABRE5v2jUbCo5nkqqwx+WjWKXEj5xiDDvBtes9/IlOte4eiN
         mLcDAgxVzmiHxQ87z7WkcnRvt78qlSqEv3yQmSya6GEcRLSH0CuXdoc3JdAJGXfBQEZZ
         CJaU+/V8AtAEn1FqKg2t0c/oLRvmCb0kqW//qJ4X1TbGcfzRR9mur/ogzFsTiKCKtjUn
         756w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752088442; x=1752693242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LO2SvKCCqko+0I0eG/Gzz/cIcDsvNsYtE0Nh9DYuiN0=;
        b=DjPxSduHfLLs3oY2WytnJG8QmvurhUv6IJNgSmVePrFS1o5frHwBUZoDWqo4GWufew
         k/U03s7kXgnQJ0ElFKUuLahZ3lalFxhLoK3ccy6ziStgrCPd7davH6t4AlGO6gB9/L71
         Mg0TGEhjW4yPUkjAN1ybulzb7B9uD4qOXzDTEYxA3a2N/U0MT/QinJAZ2DOumzBBQsF4
         /dbA+gWplJyAWl9PbdgSoS6S6xd0V30y+aDY2Oez/vJcYNJDz8fs8DwhQP9lLFOHE1nX
         0pyCMyRC5We5V35WTEsMrzKm5qgbxIaPaYSxzX3qAGeIjxa5IL2QTJu671Z9r4siw08q
         AAOA==
X-Forwarded-Encrypted: i=1; AJvYcCU0pLBe0kAo/zE7hUlaXLVmd0o+TDCVs8n8F5nERV90g689JP6w5GrFVlQ7C35lOjs+MKWRgVQFqFlZknGnu5lq@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0Y1Nhmp1wkhPtSUmpzPcgrSqF45h1xUOZ6zllR1lTCSrP9qdq
	UEhVHTN1FG2l06DIPkdSYoakzorGy4TDiDDM/3l59GWDqw2kfubuWKErRZcXhoM3b1c=
X-Gm-Gg: ASbGncsvuKYdAz0WEhVgy1nS0UzYdXuVepJ1xNQFzMzOmobE5WfAVrAASLAp1ccZ4Nx
	QWcJvDPOZjckwj0Ko1EQDHLmyruKtXChP67SNFuYQdMQzGdcV4zbCsomjJ7lC1d7DZVZLeM9yA0
	8RRQaAR64LLclujOMDRNt5w/5UUjjxNJU2hDl28YriyROIBMJ/wYxX+9zkKRN7NOhJPWET11j6x
	Gbv8BHt4wYgtQRy7RpC/UVBp5zrLyLo/MZWMwnVuyriCZGvvlQmiGWPojx7W1yba/oPXFmVoDXf
	6NlgJ+ufOsjQmfRg3CTdbY+jxaO8fgNqZ1A/GDYtk7J9ZtUsL+7amQkQOxspyZjoTjOzCPwQVgs
	=
X-Google-Smtp-Source: AGHT+IF+y4VS+J+ifAdhQiRONDZqZsKUZRm/2F/D1x8s7RGynhJsmman4W9nCsHt84pBRtIV7i+ROQ==
X-Received: by 2002:a05:600c:19d1:b0:453:9b3:5b70 with SMTP id 5b1f17b1804b1-454d53eeff3mr13735995e9.8.1752088441748;
        Wed, 09 Jul 2025 12:14:01 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b97353sm17115944f8f.51.2025.07.09.12.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 12:14:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-clk@vger.kernel.org,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] clk: samsung: drivers for v6.17
Date: Wed,  9 Jul 2025 21:13:57 +0200
Message-ID: <20250709191358.171004-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1801; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=zHDAgo+3usMVt1m3EEn01KDZ4SXsamOfc9Zt4WzYYcE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBobr928v6ljIcAcuQ3vV9rIKJq6n7Tm/0r2elL4
 FOSeEekazqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaG6/dgAKCRDBN2bmhouD
 13qOD/9pbiV+Cnbqp0KsjL6cy1H+uJszH7jFQPm4e7juzTsGXcLalJmneRiviNHPeQlhY4Re2Fu
 sHLTlU59BDYNC9BHWjmfHo4jqxNh3FWStRKxTWvurS4QzcqRXtmhjwQYHSc2aLRl48Lvt5gDur2
 RrNnEZ3l9sh1m2mV9wldUyBmloQwS08tIkYd9LQKLOJ2KWRr2PYi2H7ezKcVbCiqaNdua7eWlGb
 NGPeEMf+mCVnEz0zobdeYe8nzsKgki7BPDGbBR/hurovDsQSCwag7G+nuOM/G17yne6mKayaVfa
 8fpx5NWgQfZGFaqTuWJVJeruhv6P370Rme8tVIb1d/QgEUv99N0JiZqOFTmZtT1pSKvn+tigY2Z
 kLGHC6xW0/ZqexuNCujKcptcR7pDcBFxuzCiwufFjTyMFbWcJ9E991WA8GLKRBfArtcwACYxqPF
 /3Hp23E/jm/b0xsWKTVMuxFSrh0o4yoKZ3f99WAHWSpEWGaGADCLg5+hm7wiA23Lz6S3PQaywP5
 22cXVmRAjSkOes+0ADM3ViW69HlVCDoZ/FcN8o8xy0z4MyAIyZ5Mgn7YA86ZGu/dgr0BTgymzbb
 dfC003omx/U1bsB+mODbyrgVy9C/GE3PVFXOuafmfkb9undGYLEc/7NMzciiCwrRSRafYYoeA0R S+lSfuRP3SDJgEw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_121403_507552_53B19A79 
X-CRM114-Status: UNSURE (   9.43  )
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

Hi,

Clock drivers. The bindings were kept on separate branch, just in case, but
eventually they were not shared outside.

Best regards,
Krzysztof


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-6.17

for you to fetch changes up to 2d539f31ab0eb3eb3bd9491b7dcd52dec7967e15:

  clk: samsung: exynosautov920: add block hsi2 clock support (2025-06-12 17:28:11 +0200)

----------------------------------------------------------------
Samsung SoC clock drivers changes for 6.17

1. Fixes for clock topology on Google GS101.
2. Add HSI2 controller on ExynosAutov920.
3. Minor comment fix for Exynos850.

----------------------------------------------------------------
André Draszik (3):
      clk: samsung: gs101: fix CLK_DOUT_CMU_G3D_BUSD
      clk: samsung: gs101: fix alternate mout_hsi0_usb20_ref parent clock
      clk: samsung: exynos850: fix a comment

Krzysztof Kozlowski (1):
      Merge branch 'for-v6.17/clk-dt-bindings-headers' into next/clk

Raghav Sharma (3):
      dt-bindings: clock: exynosautov920: sort clock definitions
      dt-bindings: clock: exynosautov920: add hsi2 clock definitions
      clk: samsung: exynosautov920: add block hsi2 clock support

 .../clock/samsung,exynosautov920-clock.yaml        | 37 +++++++++--
 drivers/clk/samsung/clk-exynos850.c                |  2 +-
 drivers/clk/samsung/clk-exynosautov920.c           | 72 ++++++++++++++++++++++
 drivers/clk/samsung/clk-gs101.c                    |  4 +-
 include/dt-bindings/clock/samsung,exynosautov920.h |  9 +++
 5 files changed, 115 insertions(+), 9 deletions(-)

