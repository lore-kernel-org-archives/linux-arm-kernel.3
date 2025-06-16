Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EC50C71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 18:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sWs8wQgAGPAM0o0VVdnXAORTFo9mCsk0jubxv6TpMv8=; b=GCZKMI3k2fOZCUrVwHPs9AHs7B
	JU8T1rXPjIaCjnW3P5nf7RoOwvvbHXEihb7YI9uZCy02IqlixqI55qYIqdlPcVfpjYa6oWzb7yYed
	iRjtu5lRwXYpav0TvWt5gf90Q90mwrnhDd5re5U96aLRckNeFeZ4dtzpVcCLuE2CyFj+IGTnCKW49
	942SQ2PdxeaQQ10mvB6hvfzubFWqzUzBIKm+wnQCfKH7xXslmtYIVXcujC65zrmMCfZLo15c6Swjc
	fq+J5QRJFOm4/Z9dlL/VjSkrw8xYjPsUp1PA3TqRWYBdbMQkLGDv/cX3cSgC46rks1nfOuc/7gTYb
	hTSjIE7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uREaM-00000005EEW-3e1i;
	Mon, 16 Jun 2025 18:29:34 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRCrG-000000051yH-1sFY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 16:38:55 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b2fa3957661so4059110a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 09:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750091933; x=1750696733; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sWs8wQgAGPAM0o0VVdnXAORTFo9mCsk0jubxv6TpMv8=;
        b=GrNefK1qh7zOEPj5wz9kYy4Mz7m+vM1F+NZpuGgRvrUUDmkBLvwVOdMpl70ZOPOeoe
         AAwXkcqkOTI7EsUXx+fsIdxu5k0WsEHTl7mgb9eN1kv/mH5iNkhQf6Y3XEKYDiWi6026
         JnnqSIqKEbk3xBMDKPsW9pJqfTMu5XlYOnCfB8ZPHMdcEwpjI/tZMS41pZbuNyltaHNO
         vW6XypDscj8xHjHqXnsoMPpnIjPqFzPiAmR3X6TcRKCg6bgXHNJeQ2DogwpWs9jjy1s+
         /lYB14RCT0J+pu+ukXgG/94dRIjbnQ2EHjtsKPJ3NFRfFuNwWh7sLyHoy/cR2q6WuS4U
         hRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750091933; x=1750696733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sWs8wQgAGPAM0o0VVdnXAORTFo9mCsk0jubxv6TpMv8=;
        b=jFXuJP9KTs+7noDKVdQi84kG8P7Tnpz6D5+RdiNwagRDIhQU3ry+sNXsrlwn11gQp3
         Ky5uq9GHUS9tzdFSwt3aQTyIYvgXdZXl0yuaXzOwioIExMAYihc8p3mQ5IAYiLyuWKTu
         1yleaVFpmG7Byn3ONsOfrfLJjam2jPVb/7WqFI6RN6/C0f8dRSxHitRonh/ROJK6QhWE
         bol7ce+MjlfbPKkxNPDfc2QVhngmYiV8ZvAduBl2P1jLo8LR4DZPco+OaNBC+EB/y+uu
         HhsbWnowMLFWyPOQDkUasa1w1CD8bBhRMu/bZK/Hi/V10Bjgn+atl/98TzFBWMtEyQN0
         1lrA==
X-Forwarded-Encrypted: i=1; AJvYcCU4OK776D5HkE7Cj53SzzVWgp2Kfgq2vflX7Axqe7zRM6dlsk73zeRahKIFqxrB5q8cTgjlbTXzfRGrZFHEdLif@lists.infradead.org
X-Gm-Message-State: AOJu0YwysGguv6hDxK/R0NNV83cMyjvAK1+p/66xTPWVxnBTd3C0Qgvu
	6P1piMcoV1w7YukOAB3Lh7D5C0qHBUieFJfSn3Q0qDspn6TSS0t7PD1f
X-Gm-Gg: ASbGncvyJMtcf8I0bKMzfdfwIyGdV33OkNNRxLeBgJz7YPz5hwkjlmXXcq2w5yxccZF
	tItOg6oP565/gtoreKWfmzyo8gtBW12B6ePVW/4RF5zGzuefbaA/taJbMJUUBWoy5sHo7+Pjxx1
	QITxq896Kjc/s5McAq59hBSQ2PRwojLm9qG4hGUH1YzH0hjEM8MHM4VUGnvDYj0Wm6BoT8lDvH/
	JAjLBgfqWbnlLeJ8bzKs/cSly7C8N3JXtm4+3n2BxxTluhgLO1nSuKZHcBj+DhrBj1zDpcaXfJd
	ne2QoWKw9YICqYkhgRvEhUkq7VsIL3MOGwMd5VUMcT8KGrvJHGGVYqCa4fAm2QRs76w63xhduto
	=
X-Google-Smtp-Source: AGHT+IH4xd4I2Qt7PPA+9XeEa/AfXG3Kby6dSj3ue9eZ8UR+VJKo7fekmIJ/oBsPB6H67fFEhSIn5Q==
X-Received: by 2002:a05:6a20:a115:b0:1ee:e20f:f14e with SMTP id adf61e73a8af0-21fbd668cacmr15317222637.38.1750091933163;
        Mon, 16 Jun 2025 09:38:53 -0700 (PDT)
Received: from localhost.localdomain ([45.112.0.181])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe1680c6asm6067882a12.42.2025.06.16.09.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 09:38:52 -0700 (PDT)
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
Subject: [RRC v1 0/3] Simplify Exynos TMU IRQ clean logic
Date: Mon, 16 Jun 2025 22:08:21 +0530
Message-ID: <20250616163831.8138-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_093854_492983_333EFEF7 
X-CRM114-Status: UNSURE (   9.56  )
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

As per Exynos TMU user manual the interrupt status register, maps the
active rising and falling edges of interrupt to the appropriate clear bit,
and writes it to the interrupt clear register to acknowledge and
clear the interrupt.

Refactors the IRQ clear logic in the Exynos TMU driver to eliminate
redundant code to use single unified exynos_tmu_clear_irqs()
function.

Thanks
-Anand

Anand Moon (3):
  thermal/drivers/exynos: Remove unused base_second mapping and
    references
  thermal/drivers/exynos: Handle temperature threshold interrupts and
    clear corresponding IRQs
  thermal/drivers/exynos: Refactor IRQ clear logic using SoC-specific
    config

 drivers/thermal/samsung/exynos_tmu.c | 118 +++++++++++++++++----------
 1 file changed, 73 insertions(+), 45 deletions(-)


base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
-- 
2.49.0


