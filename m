Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9ACCAC582
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 12:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9hU2kDwn8IFHpbOTDX+dG8pysyvJ8KjOOASnN49MHHM=; b=YhKxNCgNEz9v7PIMobac4DyGLu
	wvIdq4ReYT1eM7vrZBTNjrVufy5QWk+Z+m6dequQyQSqy1wE9KpSV0bEXBwmyjr9hbouuIyGiDZsE
	2I21bF8ZotoKiUGg8QeCTGhw1NmSUAxsOtm3zm0mjGgfSoJQOpHl4qSprnQvMHNk3dM9km1LBJk3T
	7PCcS8GpWAFWH66vmOy7nNnwX1pGeKM5gJNDIp7L9LBWRtmKF2JNoN8Kx91ERkjUR2n16FnzishCo
	o6zbMIRIomlR5M0KlVvZKRQflG221M1Nixgs1gE498y8AgsoJ0SbeM++eO8Q6CkVvKpozkTE2vWLr
	sRxlfmPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxljQ-000000016li-0DLc;
	Sun, 14 Sep 2025 12:21:24 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxljM-000000016kp-446o
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 12:21:22 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45f2b062b86so2829815e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Sep 2025 05:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757852479; x=1758457279; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9hU2kDwn8IFHpbOTDX+dG8pysyvJ8KjOOASnN49MHHM=;
        b=jyfOlkx379BEduf4sZ9MpFAArWBBsOZ8gXQxS7AsT93x2/Loik6I3Sd2853/PCJSUh
         FDlG3u/fFt4CVGBpaXR7dDJiU4+cZxlW1V64sEHVwjWI8zWNNIZhMB40S2zX0MIBchWL
         OICD6mYPlu0B6l3bqXAo5KFH/xhWntKz37cdmkb7cbxb4HKbMbq95laFwn+S77fGDKkp
         vJz4IByPGW3nUiMuRiVlOrMQ0WCCNHHcrFNIKl611db8dpCeEtlTVjP8PhJ23nfUWv4h
         9pWrRA8mopRpgUVnKEI1mQsp0SGDIBTEqm3N1Q+HlwqNkLUzNTMzCYZcPWTxeruT47t+
         O0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757852479; x=1758457279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9hU2kDwn8IFHpbOTDX+dG8pysyvJ8KjOOASnN49MHHM=;
        b=bn/Nw4cPxaZBhpUnbBniemdDOOjqLyjTaAvR1xT6bgLk2T5YmZBtqjnFv1RKfmtaBc
         b0bAkT8/EOJuJxm+pL3OppP749QEcrMm0+Xfl9JbhT1jkV/X1Ujo5+8/jx2TiZLbZ/f8
         MXfwMBXFPmjJWH4tlr23fvIRc1aTY+ViM9664xA/17+Dlcgv7FEC9MZYIQLJjBjYzcbL
         OXx3zDUXK/YE2r6b9HrXCn7Nd8hqlLTSQ2JL6AlLxPywqtJOnj94n5kPc9R/aetwJTWs
         GqA+BS9TE9s0vTnnwsuCCVrqmJe9QyfuLm3LFggJx93eXw1utHhOTN/27InAxCJGxrS8
         wneg==
X-Forwarded-Encrypted: i=1; AJvYcCWwtWSzTJ3/jLi7gzK6ovVVbifNju2hC5qUQnrdsjoXkMRdfzN8OOBqVn0+teBNtA2Df/dkIs5MCv90Wzk/L8lY@lists.infradead.org
X-Gm-Message-State: AOJu0Yxutzqp0ARU6ukE/6dj1O++4iWeNCAnrExtoS4qNMFVRaVxLy60
	OWb2AYRztHrrDTwz5TbGBSRcpLQQ2BQsQZ6nHNqf27R187R69dBQE133
X-Gm-Gg: ASbGncs9DNYo9XgvTrYp4bOYxAy3gju2TVl2wVGWCsUcV7AEExG9nM3rtiVUmBcQlPc
	sIN5pXBACJvj19CRqgDOslPckYKCnAjdQH+rn9m3EUrh7IxV6ZU/T4fbdLYotZgL6L6mFso1J1e
	l6DVtxeOn5X7+1wJMYi2KkCOOIOxk7uuvLq707q37tfg08AqkvbJFTKqVKcXpXbmsWFejVFKM49
	pyKSWWBvnv2VvHg9Nn9tcQ7mZJaDOrRPr8OshGgTFsVE8v28Lb3aDIiyH9hAvX7GcQu0SylHSU7
	ZfvXe6Sf6a/MBQgSXf2YaZ6ysdSkeG5ZnDMQx/TMYuqlZqHLP2vQuqr5OInDID3jDxPpj2bSO9s
	mz/KrVqyv0xoArchD/01f0A/2QX2ciF44/+5K1AeafVE7/87EOCnwMjvrQ3NG+oB6hYZgNNYOEU
	H8z0/h1LKOVVvHfeSWmsI=
X-Google-Smtp-Source: AGHT+IHNLBsatSIb71J2GFQncSTA+a3kyt/UTKwYcV2O04qKu+uELYeEsk/eGdFPUJLCbm3RtTdvwQ==
X-Received: by 2002:a05:600c:5742:b0:45b:8f11:8e00 with SMTP id 5b1f17b1804b1-45f2120592amr59760815e9.37.1757852478915;
        Sun, 14 Sep 2025 05:21:18 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017b4222sm136476615e9.20.2025.09.14.05.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:21:18 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/5] clk: samsung: introduce exynos8890 clock driver
Date: Sun, 14 Sep 2025 15:21:11 +0300
Message-ID: <20250914122116.2616801-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_052121_017481_4679470B 
X-CRM114-Status: GOOD (  11.99  )
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

Hey folks,

This patchset adds a pretty much full (except for ISP and camera blocks)
cmu driver for exynos8890. It's configured to run with gates in manual
mode, which is done differenetly from other exynos SoCs.

Best regards,
Ivaylo

Ivaylo Ivanov (5):
  dt-bindings: clock: add exynos8890 SoC
  clk: samsung: clk-pll: Add support for pll_141xx
  clk: samsung: clk-pll: Add support for pll_1419x
  clk: samsung: clk-pll: Add support for pll_1431x
  clk: samsung: introduce exynos8890 clock driver

 .../clock/samsung,exynos8890-cmu.yaml         |  477 +
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-exynos8890.c          | 8695 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |   13 +-
 drivers/clk/samsung/clk-pll.h                 |   12 +
 .../clock/samsung,exynos8890-cmu.h            | 1279 +++
 6 files changed, 10475 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos8890-cmu.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos8890.c
 create mode 100644 include/dt-bindings/clock/samsung,exynos8890-cmu.h

-- 
2.43.0


