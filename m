Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76353CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 23:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ibTL9LFMoaISY8GQE81Db1c/RUt2bsWCzKF7aX8X54Q=; b=UhHPqM30W+alL3DFMG1FGcU+Dv
	SQWPOjX7bQmsq/lygz9Ws866n5/RyN08mS2ZCUi1zbFW7zIvktBgMLTDE2UdFJlsRcIfeYhLEEkbC
	y3r2By1HEzVcHmO4Dv5AJiJOCFSvZPH/A/L9vyro4mY3ttjVAVGiymkGFzUwqAD6d0CcLfQxvvpPz
	JYT33Ap0Kz3JL1hhWbC+5enScTSGZJQBofVjupnr6m/kx8Z0OR3SDpK56XQT96mXZ4mV3Q+9vyzHL
	HP2QfcS2IUUd4b1DG7Ml4kdWAnzzSPGud0QtQ4CD9dY3VfHlNTklBXJkiDSDj//j6HaSX2qS82Qtc
	bSIOa/Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHs7U-00000003YRM-148q;
	Sat, 08 Nov 2025 23:13:20 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHs7Q-00000003YQQ-3vwg
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Nov 2025 23:13:18 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-640a0812658so2927657a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Nov 2025 15:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762643595; x=1763248395; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ibTL9LFMoaISY8GQE81Db1c/RUt2bsWCzKF7aX8X54Q=;
        b=fuE/rkyJvoiP/S4xoQSKYMKaj5xYtEwgoRp6TLU2ZRE+cu7Tp1FbxRq6ck0nnXNs0u
         dpHWuzBuzwa3Md54l6HD9Y0RjCH2kFWVS1gTW42Yopk24Ej/dANDusZNfXzYH1HsxgcQ
         k4uc4L/Hx+ce+56gYjE8WDyGOyC4b+sMBQxTnMFd2apmfA3XtqycwtPZlCYjnDqEKwMH
         iyH/K2A9OWnnZ3z7cmpiPKuTIKgCUTmoGhfCpDFwuttoWpL/5qw2G/F6qZT5C7IaemJn
         r1Tw33FIAYgoKivqCFrox9Jp7SCdLq0yVbtUvaxNyci3FO/vIyCfAPSlFGWpt3SPHagl
         nc9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762643595; x=1763248395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ibTL9LFMoaISY8GQE81Db1c/RUt2bsWCzKF7aX8X54Q=;
        b=nHGR/0hl/MHEAaf2rYxJU+7iDMRqktE+7+KEagAtCP+beAAwIix9mBOA3TK3R4ZyHu
         byIjOP4BZyOOAW8mBW9XYOCbXZnBsf+2YDUEnqfzEYJgflsn1z//F1ZkWomsev8YVaI4
         xZ4qoaB0Jvs8dcytiUwiN9UuHA8xSrENznE7y4884chw46LoaMVa4OxlaFbvLtmvf8es
         a2oo7I5fVDYQO1oahuXYb+IsISmW8rKecjHfhskB6J3bgxYr/gFYAXdNHv7CrIUmgR2I
         CBcAnQpWxqJxVTvfQPOxalLmEgkuW5XDd9cf2sM5UbBezqMbIJAMoK4XsJwTbNtZSowE
         bUjw==
X-Gm-Message-State: AOJu0YxGEPYbPJ+pIn+obMi0ZqNE6tjUvs/gpGSPSYglTIw980cBma7e
	TPN/zr1Hic0rAJj1FFhlGNRI7IM9H1UICqIymSN03ENQw51Oj8ckkOx3
X-Gm-Gg: ASbGncvoUuDmGPrkOoRzBtTsxXKgJ3KHf86/6J4xk8trTKAy3lpwvuqn5p4bSHnd5rN
	Cvk9equkgnLRU6ce0dJ2UGM7ftw4GmyjFlJvkjV+xVw5HeRRrhUh5G2UfRdukHCsD/n3KM+hPa2
	cy23cbzwlAf3L3plaYwHLh+PIQGX0/6twMEJUnWJYUBa0RfGcXTQLdT7fmEq9LZ97Zz5pJa/3eT
	Z0MSzMHC3A1arSrXP9oTFIttcNYrIkunosi0wiPnbYN5Blura/Zf8qxzc1e5/wanvpto11czog4
	2wkbo2okHAXlZb7gwSaqvb0C2DrpEpNS12PcL8hMCPmHJHm9zK5/NvjIPmmG/HslMGngHa6iXek
	Wid7iNXHcm262BHWAsGh6YHzZsU6W9bAkvEixxacKIqSD0//pgSQLecDdRPM+zg6gt14Kl3+GlV
	ebWQPoyc+uyXBloA6YzOIXM/8QX34AyPo1Nja74lW6n0lFs0DwqgbKnW4JmP2imNnInYa3s+isS
	MhTUX2fvgTs5s8eMel3IiJ6tfg7RXB+FU/Yiq4p2ro=
X-Google-Smtp-Source: AGHT+IHojjSOYkU74h70pOz5Juc0qTwy5Qm9aBj39UgCLbnQKLDh8bnfGClMfrPjx5Lm9oFsJdZQ9g==
X-Received: by 2002:a05:6402:40d1:b0:640:bc0b:887d with SMTP id 4fb4d7f45d1cf-6415dc03146mr2946757a12.2.1762643594925;
        Sat, 08 Nov 2025 15:13:14 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-a9b3-6600-1e86-0bff-fe2f-57b7.310.pool.telefonica.de. [2a02:3100:a9b3:6600:1e86:bff:fe2f:57b7])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6411f814164sm7642807a12.13.2025.11.08.15.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 15:13:13 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	linux-mmc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ulf.hansson@linaro.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v1 0/7] mmc: meson-mx-sdio: Various driver improvements
Date: Sun,  9 Nov 2025 00:12:46 +0100
Message-ID: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_151317_683783_AA68851F 
X-CRM114-Status: GOOD (  10.65  )
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

This series contains patches to improve / simplify the code of the
meson-mx-sdio driver by:
- using regmap for simplifying register access (patch 1)
- switching to modern clock functions/helpers (patches 2, 3) and
  make the clock code not interfere when switching to
  devm_mmc_alloc_host() (patch 3)
- making use of the devm_mmc_alloc_host (patch 4)
- using modern dev_err_probe() for better error handling (patch 5)
- indentation fix (patch 6)
- ignoring disabled mmc-slot device-tree nodes to allow describing
  all slots in device-tree, even though the driver only uses the
  first enabled slot (patch 7)


Binbin Zhou (1):
  mmc: meson-mx-sdio: Use devm_mmc_alloc_host() helper

Martin Blumenstingl (6):
  mmc: meson-mx-sdio: Switch to regmap for register access
  mmc: meson-mx-sdio: Use devm_clk_get_enabled()
  mmc: meson-mx-sdio: Refactor internal clock initialization
  mmc: meson-mx-sdio: Use dev_err_probe() where appropriate
  mmc: meson-mx-sdio: Fix indentation in meson_mx_mmc_irq_thread()
  mmc: meson-mx-sdio: Ignore disabled "mmc-slot" child-nodes

 drivers/mmc/host/Kconfig         |   1 +
 drivers/mmc/host/meson-mx-sdio.c | 339 +++++++++++++++----------------
 2 files changed, 170 insertions(+), 170 deletions(-)

-- 
2.51.2


