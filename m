Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC42C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6hk0sQ453lNEysdZfourfxsn4kfTAj/appBmgqJA7CQ=; b=Q1JrP6M/g5UuxQ/GRKDtUTuU5x
	CY3UWDpGnPcp4qx9ipNj4WzsCKvfT2MMMUTcJeOVVDo0x+0ohfd/FDa2fEMAKNoimaln6SNXXmptQ
	ogCaxLzYV7pecHd6y9cZ4kzVTFpQsXFkKYuAKhhPLu7+lhy0iSXRwH9giCPiUkoXUu2aMEmqqtesh
	hYbTWKuUKK4/DD8zg/rY9WBCcc+mln7xHWBzkywiBDm6BHUEVXWGlV+6wvqeq5jGosdTdr856Zg3h
	g2A5AO65H81KnFC4OwYAAPIpXeG9q2LjFJ3ZHEHoIU3JR0qTD9HNHeeEVDgSz/IBmDLbyWmtkB6x2
	CQqzVOxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PHz-00000008oF0-33tK;
	Wed, 23 Sep 2026 15:53:44 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9PHu-00000008oE7-43NC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:53:42 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912df756so7931635e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 08:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1790178817; x=1790783617; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6hk0sQ453lNEysdZfourfxsn4kfTAj/appBmgqJA7CQ=;
        b=nUOwOoghGKzm7K9MbJ3uRxK+kPxCNR36M41M/HV5TXrFoY4KBbi0zgNwAT47Kp4a6U
         7IKTnixxHj8EdaHrBLcH+4de64+yU6PsVSX4EQpfXERCnjqQ7DJ/XcieWAPQuAX4fWeu
         U+6UdoIt0OuNRyP4hicPcG1yX4RU/kYfe4W/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790178817; x=1790783617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6hk0sQ453lNEysdZfourfxsn4kfTAj/appBmgqJA7CQ=;
        b=WH1IelZcm9aciN1plxZYap3YWHHq9ezS3v0rrdQjL2rwrIMAd8+cpnGEXTSNf6Bf2C
         JB3lxpUPsi8+0ptWoc2gXbHC6K3HUSQMshSMcgVUSvM3bm4doQoMB3oVyIuuXkNayjRq
         KPkhKGa/cY26tIuAWK2M6sVavm5+r2DkNDuihqO7lxPywGLgzH7bIJKtwJsvSpSToVSo
         NB113O9wTqhvrKeSzPDUaR6KqM+M2qJS5xL2MwGn3Y5K5vlBOJZMmes3nboaPIUD1/4l
         k+ofCFgRi7y6IlKT0KezkBHD+xCY69yxSo3QsqGS5M1OlFkpkbMWfZLjN5xY326ot5+E
         BGYw==
X-Forwarded-Encrypted: i=1; AKwUvBwoYNtWOUfpyfWIIAnHXo0pMylFqQBat6Zg+BxawC+2Ly91cvpzpdtUaPgCFThzMXUjKfOep+OThy+7vMlTZMff@lists.infradead.org
X-Gm-Message-State: AFuF++kUvLwl8vp1xS0AHJk9D6JUc3+X8RISCPR0ICOPedi9XD8kNUNi
	wLD+deXloh4FdMM1QVrJYo9Bfm4EQsElQS1pzw2qPw+KadrL33D50S0k8kAmfm7oYg4=
X-Gm-Gg: AYBFou3pPPlbvHWFBMF+7dH4wef537Vxd96v2c781RIv18ko8lX2qxfLkH6WkP5suwR
	yImffjpjskqN+VqEFliN0Po/a8a0ckmq15sDRbzsx6JwjodT4vrotzSu5acpttxe1wVJQpLMNUH
	daEdJYduH5MZBh8pCIH3YA0D+5zStTS2yZUg5S9qW6UFO102BBJZwBNhl69M42oCBKT5KV6/YJ5
	YZLfpztFrhgcHzScPtnk4NHFJ/exRIa53+tKw7GA83blUaWg5V6D5OUx6KtIfoYTYgH03IOFnf8
	ei1H6kHUEkmfuPWDdPJmnvwtPulHN3YGWnVueVC7lCHBla1Ixo3zIf3sn/pXyRUtvOBCGnGioyf
	20hLklaJuTgU4MyrcclxnJ/XxXOCRQtm4EJFiyIk+P++IhRG0rNUpPsmCWnV5QWT6yuY72fKlrf
	VHClbzZ2m1Qq6LmiM+H6Rka/rcCdkef1s69G/GS77BPbbiPGKi4OIFa7czqhKmUtkDY2a54eW39
	sLwnnOntYFMq87vnbSVRQFes5LHKnPih9te/rvj5eML+o/ZkRutpOTwPzm6VrFf8as=
X-Received: by 2002:a05:600c:609a:b0:49d:1842:f001 with SMTP id 5b1f17b1804b1-49fdf0f9fb7mr45229825e9.14.1790178817000;
        Wed, 23 Sep 2026 08:53:37 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:12f8:fcfa:728a:2514])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1d5f10sm81858555e9.8.2026.09.23.08.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:53:36 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: michael@amarulasolutions.com,
	domenico.acri@engicam.com,
	linux-arm-kernel@lists.infradead.org,
	Marek Vasut <marex@nabladev.com>,
	francesco.utel@engicam.com,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>
Subject: [PATCH v2 0/2] arm64: dts: st: add display overlays for Engicam MicroGEA-STM32MP257D-RMM
Date: Wed, 23 Sep 2026 17:53:08 +0200
Message-ID: <20260923155333.610134-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_085339_347764_2444D08F 
X-CRM114-Status: GOOD (  11.25  )
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


The board is produced in variants fitted with different displays. Move
the current RGB panel to a device tree overlay and add one for the LVDS
variant, so that the board dts describes only what is common and each
display gets its own overlay.

Changes in v2:
- Keep the full cs-gpios in the board dts, the overlay only adds the
  panel node. Suggested by Sashiko.

Dario Binacchi (2):
  arm64: dts: st: move Engicam MicroGEA-STM32MP257D-RMM display to an
    overlay
  arm64: dts: st: add Engicam MicroGEA-STM32MP257D-RMM LVDS display
    overlay

 arch/arm64/boot/dts/st/Makefile               | 12 ++++
 ...gea-rmm-overlay-am-1280800w8tzqw-t00h.dtso | 67 ++++++++++++++++++
 ...icrogea-rmm-overlay-rk050hr345-ct106a.dtso | 68 +++++++++++++++++++
 .../st/stm32mp257d-engicam-microgea-rmm.dts   | 48 +------------
 4 files changed, 149 insertions(+), 46 deletions(-)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtso
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtso

---
base-commit: 2f92d900f262a16c8ae02daf53ae2910d07185f5
branch: engicam-rmm-overlays

-- 
2.43.0


