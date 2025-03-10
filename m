Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860BDC28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 15:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ma81+6yDVsQ/IjAHSfeuv7Yhl0CtA9j86woJnhcbnGU=; b=TuWjwkaZKzK7ZBPaYabt78ZfoN
	I5qYnnd46BPS1aKQIX1djTjnYUy6xkzs0PpJrHfSdJQ0lR8zMxr+pv5R/gj2ICMF4lBy67/DvFSQ8
	NP1ZmLaq3EbkYw1e9PWPi4rm5qpVba6VGNO8OT2tmF33jtWtCV6EoG8a05qtNqEaQBQ2+uDdBcezG
	HeN0dW/e3w15NzLrfkZz/NaehRc7ZYqPJJWS5+jkT68L3Qr/BU9Py0zcUi2sDzYpT5QVCpCkmCtVJ
	X058FRcxlS5WSBm2E0QQZ8s2KKE+zjKc4jXRHH+jkrbUh6HTmMoNmcNJcYEeoo290IooNAMX515fJ
	46nXFRvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trf52-00000003BOE-2BNl;
	Mon, 10 Mar 2025 15:30:12 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treDh-00000002wWa-3UJq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 14:35:07 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-300f92661fcso643184a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Mar 2025 07:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741617305; x=1742222105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ma81+6yDVsQ/IjAHSfeuv7Yhl0CtA9j86woJnhcbnGU=;
        b=VimL9+uVyxxJ82H5sROKmxby2toTcqT2d95u1KKAhNcyzOvUTX211kKzVhWh/qDfAJ
         eiaaLUIUU7zsG4TWlGp1dlByUTSrDDngJb0mJ8Zff9Wa/AEyt+mUVUf8yafuEUDyTnYc
         wBbaQ7zapikGIUm5lTh/6ZjzTEqrEEqIK59H+5ClBnBh6VrHJA4P9b9KEW3QxzLSjZ6L
         BAbOsXyVkmm3OoYUe/m2NbP+Zj4IgOIMUHZx5qv3uHXJHn1xB3lHoBz+p3t1taZI0kJi
         buvz5kl5K/l+SKn/asFXzcFWZ277qjeu4NYTM8fmovHa1uUtd3FUiC+b0cC3VovjNzcW
         QZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741617305; x=1742222105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ma81+6yDVsQ/IjAHSfeuv7Yhl0CtA9j86woJnhcbnGU=;
        b=vJ6MFyifpq6W5zOCW6BoPcjNb9qBBuwHtAXvNIbFermZ6f0g63yPVqBqewNosfrlXG
         RyhvwpUsPf15rpJkvL+CiL2itEnr7tZTv6duMoYh+JiEs3BfuUY77MlFXdbSWMA4Aef/
         4vwbpMsG3PLBuq0cY2SX69cLQMR8RgqZ1jl8LdlJJVNjc5RrGFyIeYsCop/QwIodDI5O
         2R5cqmoKNWe98yTRFcStYRyskjRn2UeG4T2dTWfIamhsfCrkjS1lx9cm8k/jtpclJNBQ
         Ny0sw4mjq6k6X2ppWcj6Sgkq6rFTgqrepi/IdjN+0WfdwjdHd1ElD+HvwOun+yz3cpmD
         Og3g==
X-Forwarded-Encrypted: i=1; AJvYcCWc00cDuy4+7NSOsxaok1DyxlCYnPZ6T7JG8ApSdJty+SUoLH5XnkIEOgk/XZ785k10b/HSzSJggsCiUDL6qKhf@lists.infradead.org
X-Gm-Message-State: AOJu0YylXNFocILrRJjuhu/PBaWRuGzVRBxeSfD8z5Wau2PW2llM1QyC
	7qKeE/6dMSsq9Ipvgpcl21As2BlLG9ZjqSs76ArPPb/FYLMwgvi2
X-Gm-Gg: ASbGncvjy25n5ssvvBNa72zDkGxFgetD+bnbYrqFXOo4lNm6GQzveZokFyVZqGdrNoC
	M7B1Q/NVbYRJU9htIDkijOKennXMB31dy51sSknZouLrYaff2dpJkzlJEJ2zUjX2QFqCAXVsrL6
	1kmK8d6QaePVpaAcEC6GQX6rzwqeoqKNnaNg0/Q9RCeiGlxRKF7pZpC+qNphIIG+RT0KLEJW7/n
	eP6/rnXg80uuKjlM4fwms54vfm24PV+Svnohc3Dng0JdGx+c4QAbdfIa+1vZ42Du3gozuNc3dA3
	NhJ98SlSHiV0ZKuM9wNLqHMF2PcfHt/Nt1ib/cvPNLURaugiYBwPEcdejMg=
X-Google-Smtp-Source: AGHT+IGhTdTIdVP7HB+PvUYMd+2NW/R90CRsL9UGSx6Uhzt1y34i69B3QZbu3IQFoa4tpOU5W+GfhA==
X-Received: by 2002:a05:6300:197:b0:1f3:3cc9:29f7 with SMTP id adf61e73a8af0-1f544af86e2mr23515419637.12.1741617304667;
        Mon, 10 Mar 2025 07:35:04 -0700 (PDT)
Received: from localhost.localdomain ([103.221.69.50])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281096763sm7785900a12.30.2025.03.10.07.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 07:35:04 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-pm@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v4 0/4] Exynos Thermal code improvement
Date: Mon, 10 Mar 2025 20:04:41 +0530
Message-ID: <20250310143450.8276-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_073505_868438_79202926 
X-CRM114-Status: GOOD (  12.10  )
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

Hi All,

This patch series is a rework of my previous patch series [1],
where the code changes were not adequately justified.

In this new series, I have improved the commit subject
and commit message to better explain the changes.

v4: Tried to address Lukasz review coments.

Tested on Odroid U3 amd XU4 SoC boards.

[2] https://lore.kernel.org/all/20250216195850.5352-2-linux.amoon@gmail.com/
[1] https://lore.kernel.org/all/20220515064126.1424-1-linux.amoon@gmail.com/
[0] https://lore.kernel.org/lkml/CANAwSgS=08fVsqn95WHzSF71WTTyD2-=K2C6-BEz0tY0t6A1-g@mail.gmail.com/T/#m77e57120d230d57f34c29e1422d7fc5f5587ac30

Thanks
-Anand

Anand Moon (4):
  drivers/thermal/exynos: Refactor clk_sec initialization inside
    SOC-specific case
  drivers/thermal/exymos: Remove redundant IS_ERR() checks for clk_sec
    clock
  drivers/thermal/exymos: Fixed the efuse min max value for exynos5422
  drivers/thermal/exymos: Use guard notation when acquiring mutex

 drivers/thermal/samsung/exynos_tmu.c | 87 +++++++++++++++-------------
 1 file changed, 46 insertions(+), 41 deletions(-)


base-commit: 80e54e84911a923c40d7bee33a34c1b4be148d7a
-- 
2.48.1


