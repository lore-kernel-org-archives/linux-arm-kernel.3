Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D992F532D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 05:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7ESEAu+z9qQDpWKYSwQTMrWov5dMVmlm0gnO2s95QVs=; b=xC8W31lazEmGqIFm9aetNbSBKk
	VTeqp8Q1RLs3iagaVZvTArTYnWECwbGEZ2F9Rjz4OhT63dVuuVfraj6W6bdydv6UbwYq461+E5Q2y
	WIFza/b0SzI0jDbNC1kItKCa/1CVS4tMYMmCkS3PGJ/N1UVrzYdLzQ0niIsveGIZQFGlTvvRJA35B
	HbglT82yjoHMAJ+ghAQp8mVlszmidPRDcWj2Mzq9n4Lq9+zrb8gqZbU1QZK2AOClIkGDYdYOKgEIy
	MMQ7I2f5dTCk+17E+V1yMUuxkudLs5P5/GtdYCgWoSeQj4oUrl/5svSYvHfVYM2MbKJ38CPvFNwyW
	o4YtJFJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uLp-00000000aPM-0S52;
	Tue, 24 Mar 2026 05:30:49 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uLm-00000000aNf-1aAk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 05:30:47 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3585ec417f6so2541646a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 22:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774330245; x=1774935045; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ESEAu+z9qQDpWKYSwQTMrWov5dMVmlm0gnO2s95QVs=;
        b=k7EzNXiOtLyBDGeRcOc8dnvBJ5RTgWEucdV6VpACbW3jXfuEr/samo1fKtUHsPlbKA
         7id3Tj6INLkLEaCWt2IL52mOxt8j65jBmhcoMErrjf0HnkKpzI+Y2ktKZViBPevR95wH
         +PM9ihjEWPKWfDckQ00l9sc4wzQwys61Qzj+A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774330245; x=1774935045;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ESEAu+z9qQDpWKYSwQTMrWov5dMVmlm0gnO2s95QVs=;
        b=qi92gEDHlAQVZ6Jy7DQM1d61jEUjsxdVEpSzua5/eZ9Kd4Wu6cBMWisNWjHxus7Gsx
         ZquLneXHeih4x33FUpIpn7iIM470dHVmPjTOfRPB5DHAZkbg7LjZc2pbgFwxZ0MDJXgr
         BNo5pL+VUOv76q6L4C8vFnmCwQqPfsmmpKoikJlBJXnoSKgtgAx1zl540z9JhF4qTFCk
         whodI5xRjfZQktaqktjrYNip1yuMcX+foK40tYQrX899t+kO1c/j5enbUOok/uzys3io
         iI27yXvfry+Gt6rlrHz2EHvvFtgbhVGsyWW1BlK8Hk9R/rd2fWDjCrO5ovHRNHliya6i
         I7Rw==
X-Forwarded-Encrypted: i=1; AJvYcCXQX39ezSgUXuNaSvnW8ZbTbBOQ7x4QCZrX++9kvpxT/YJKepOFM5gpqDHv9Y4d2QQ3mZAurYI6fmwSHiX1206f@lists.infradead.org
X-Gm-Message-State: AOJu0YzdtVO9REr6L4iFrQGtHKsh3qF6Oq5OKshOVFpbc1JOnDelVAKQ
	IQKi/yUR4rv0GPsDdATVeGFbAYdMHvhzHvjv2WkmBnOKxia/iOHw3/Jl8JHQbdIIGg==
X-Gm-Gg: ATEYQzzzAx+PW100sWOe95RdysVhLOFogP6ZuJAAxdhnPysWHDAvySYyNjtxinIs2PP
	bBgJjDuXLXb0G+bsV0suy86rdjqp0j+h5W/F7qPEIX+3fD8KpipTi8xY9oQubvISd5RYqejpgMn
	4Kuyr4bHNigOAIjtarDDVhesqq1ezSTTMTxZDSHvgLhGbb9yhyW22CDwMdyOSJe0SYGJvGEVaxE
	EkEcRUVyieiDUnlsUCUSDUwgoC8yc6O+A5cCPEetxYQhJT2r3ZaR+KQz7TXEXi1hj5aC0sNrGfj
	39WWXprRp0B/803UY+PW2He7st9btqOa30mL25ee9mQsiwLwjMk88FBTHfWoxjXAM6D5H8NUIlF
	mQSqQZttHhI5UVqby60ZaxLb1GxGJMfa20I6ythEU/RnHecmZp4XWDNJrUrQ3HXxrHiVCPAfBWT
	8p1N02dd1aaOLpMxDcONMtx82T2fx6m3vaJxx5PlesdVRBNxREsdSdGhMaj+T0gJK12qVNazJlG
	LqyVrrl
X-Received: by 2002:a17:90b:3a4f:b0:359:85b0:4023 with SMTP id 98e67ed59e1d1-35c008e2fc5mr1410367a91.16.1774330245449;
        Mon, 23 Mar 2026 22:30:45 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:19a5:8f2f:d584:8078])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03211351sm953507a91.15.2026.03.23.22.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 22:30:45 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH RESEND 0/2] regulator: mt6315: add regulator supplies
Date: Tue, 24 Mar 2026 13:30:27 +0800
Message-ID: <20260324053030.4077453-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_223046_454763_317A5675 
X-CRM114-Status: GOOD (  13.11  )
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

(Resent with correct subject on cover letter)

Hi,

This series is part of a broader collection of regulator related
cleanups for MediaTek Chromebooks. This one covers the MT6315 PMIC.

Patch 1 adds the names of the power supply inputs to the binding.

Patch 2 adds the supply names from the DT binding change in patch 1
to the regulator descriptions in the driver. This patch has a
checkpatch.pl warnings, but I wonder if it's because the context size
for checking complex macros is not large enough.

Device tree changes will be sent separately. The goal is to get the
regulator tree as complete as possible. This includes adding supply
names to other regulator DT bindings, and adding all the supply links
to the existing DTs.

Please have a look.


Thanks
ChenYu


Chen-Yu Tsai (2):
  regulator: dt-bindings: mt6315: Add regulator supplies
  regulator: mt6315: Add regulator supplies

 .../bindings/regulator/mt6315-regulator.yaml        | 13 +++++++++++++
 drivers/regulator/mt6315-regulator.c                | 11 ++++++-----
 2 files changed, 19 insertions(+), 5 deletions(-)

-- 
2.53.0.983.g0bb29b3bc5-goog


