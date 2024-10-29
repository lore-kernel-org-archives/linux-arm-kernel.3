Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA97D5B164
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 08:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nlHQgxHoo0N+w71NQjPtnfHRpsgGAqUyUZpSjSJNUE=; b=gwpzV+eXBWG/b3FopVoBNdQeqS
	VIreLqSkVh3FodaXnrMIqgBX1E2DbS9ERdPX9QzH6sJtLOBk768mGcFRd9OSwHSkt4JLHNDUgZZsT
	JhJAUs2/ozhfHzIGp1EMEeXVs39l6o5IA2fjA9NbOojSMWq/NRCjvKtnHpQc+XXmiT9+MwmaK82YU
	SvW/QzMb0B11MDs8vAQ7jJCUBBMbOPTDHXGIMTSG26VqiuBlMNRUGru3BUnumDTG1E8q1uFrUNbPJ
	/tj04u1y7/2Jql2zNpd6pa0/fRPM79GZVi5oHgnWqJ5d6r1yDK6+fyww8Kf9gHj+qb+xDJ5c1InDy
	6hFpjcFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hO4-0000000Ddtd-465C;
	Tue, 29 Oct 2024 08:15:36 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5hIp-0000000DdFi-0zu2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 08:10:12 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4315549c4d5so6446625e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 01:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730189409; x=1730794209; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nlHQgxHoo0N+w71NQjPtnfHRpsgGAqUyUZpSjSJNUE=;
        b=naGHs2DYv/Cn8s9YK3i+z7Eqp1p8R8QKQfaA51AF3Utc1DxDTQqpdJJQ7Blh4cl1FH
         imzVl1r57ElMB245XUC71rLpn9Ti6EzXfnuAf+vAYsfR/RDQNvO9J1gVtuv6nLE4BQrl
         OrDUh6QZpBBkrJzWGQZofCJsdHFm1uQv3bQdpz6XWVge33ECrIwPVMlxijNgKqROca2M
         XstNSX2LTPO7nfT+Wa7Kb68kRpESfEehlUBBj4cu1B40jDQXgJo5869abaqw2hDtZRwv
         Z5ryUlX2rOB3W5+xNDTQNCwC5S7l4LI2SH9QKn4xybSwC0btQ01W3RiVsNBMRKRHV6nG
         wNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730189409; x=1730794209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+nlHQgxHoo0N+w71NQjPtnfHRpsgGAqUyUZpSjSJNUE=;
        b=b7VxaoSt2o2E5OwAyKjExblfqWGsCrxDB7ShkdrDzStJhvJqxkklOJisiBZDOlWhZy
         eDuDGaPj70tCTlu63bYbrYiMjj/k6aM6zWRw58ge4ufUdv9AkpT88aTN7vtiz3nWToJI
         /EqL1OJ+856VvKU7nk33ebcCjRJmA9g4uVJW2dRZ5JgGJWlXpN3TmcBOSI53lLNYGfTH
         Vbyo55Tzx6ekdXSMRPweNifgOuD6iou5fSDXyZ5jGBk9hcb4042dLa0ohStgKqoQdJuj
         fq3ILKSQdn5ejh+4fI0TU8MdZlkK8mzFxeSogtVLII/d2ZoJn6W2OK2u5bU4yHdSs0Kn
         iNRw==
X-Forwarded-Encrypted: i=1; AJvYcCVa5F7zcvJzdXF6CkUT1Iahk9rc46gsCVVXQSKWYLCyf4tnHoYxmCqYW3dHDSuZ/jrFpuXFX8ZuiaZ1Bm2bS5oG@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0nquhfpF6GBnzJM616ZBP1Hy+oOE/xVXooBNxh4hVI1dmpEqF
	8vTR864H/4Py1vTRxkXXfdRtHmGIgtmQNqFyLEmMvZS7cmz+/6dwtMk6DWetJcQ=
X-Google-Smtp-Source: AGHT+IFBTmPkpYxqqzdZgLFMhy6wv545YoQN7O/maEIdRbbG/bFpFO5cny/nfyU9IGP8/iORnhBuaw==
X-Received: by 2002:a05:600c:3ba4:b0:42c:c59a:ac21 with SMTP id 5b1f17b1804b1-4319ac79b20mr37591015e9.2.1730189409495;
        Tue, 29 Oct 2024 01:10:09 -0700 (PDT)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b55f784sm165467485e9.19.2024.10.29.01.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 01:10:09 -0700 (PDT)
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
Subject: [GIT PULL 3/3] ARM: samsung: soc/mach for v6.13
Date: Tue, 29 Oct 2024 09:10:01 +0100
Message-ID: <20241029081002.21106-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241029081002.21106-1-krzysztof.kozlowski@linaro.org>
References: <20241029081002.21106-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_011011_301511_79D9D113 
X-CRM114-Status: UNSURE (   7.50  )
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

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-6.13

for you to fetch changes up to 3a6ad95d97eb62a7b7c804ef7eeb329a1f697d00:

  ASoC: samsung: Remove obsoleted declaration for s3c64xx_ac97_setup_gpio (2024-09-30 12:47:23 +0200)

----------------------------------------------------------------
Samsung mach/soc changes for v6.13

Few minor cleanups in platform data headers: drop unused declarations.

----------------------------------------------------------------
Gaosheng Cui (2):
      ARM: samsung: Remove obsoleted declaration for s3c_hwmon_set_platdata
      ASoC: samsung: Remove obsoleted declaration for s3c64xx_ac97_setup_gpio

 include/linux/platform_data/asoc-s3c.h  |  2 --
 include/linux/platform_data/hwmon-s3c.h | 10 ----------
 2 files changed, 12 deletions(-)

