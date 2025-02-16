Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DE5C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 20:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Re0gzQApO9EfPmEDRqpFe0xqY2fs/XQmv0KA/vyOfOw=; b=MorMo6gv49krDGjH8V/9VgoTFa
	8+hX/tnvtbw/HVYdFhPucOoXqqkPGVJKrNjpNbMBQxo1YCdTNXftEnJZofAa896PVx8L/N12N0DXk
	EN/50DtF/Lt52JIvECrXXwvfIPuN4uA+V1v1CPjBmlH0PIDMMhbO34/Wt7vdACCgjgFNpWbdftopQ
	XJofR01N+KlIPUdkvUwRsGHi8PoR6M+LxxlziqYaflSr7XT8DPBJGB2GHWJXOlWX606F1/jIuESK8
	x7/10ODo9a61Ox5LHHJfd9yaLANSyJ3bGwwaVsbR039c5ZapI33Mk+8M758WU6JbnGHoOT2hnAaHl
	Cqcvjj5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjkoh-00000002Vjq-3YGT;
	Sun, 16 Feb 2025 20:00:39 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjknF-00000002VTm-07bC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 19:59:10 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2211cd4463cso10391915ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Feb 2025 11:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739735947; x=1740340747; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Re0gzQApO9EfPmEDRqpFe0xqY2fs/XQmv0KA/vyOfOw=;
        b=SiamFjoxKZmrBGsHWQEUnDpCAVmCzFOfY15/uih1pjAVPGSP+KTNctaDbOhC8hkgkj
         HRNkTWMUeOK/GaJYxdAzdTlh0W0z74FKbJnYImhozOO+tVdlQ7HOdhxYCApbHoprevc4
         zSrN+wCQ3N3LdKktbcTM06QaKgiqst6lxJIrfF28PpUXtuYFQlvCFTfiz7SQ9yRqfitj
         YDzCmdSWZbWacuPWzGx/whicg0Z25ZBdOcbcGSUTtoj8+hWbDRXajBRwIJAL2gVPyuF0
         cpv00Lc1ekqqkOYyPATwCjZdWGTOnMOWpf0VrxegS257m8+CSrXKen8QO0wow1TIzTH+
         9mrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739735947; x=1740340747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Re0gzQApO9EfPmEDRqpFe0xqY2fs/XQmv0KA/vyOfOw=;
        b=IOxVd0ZTLWnSdtFDuD5NgjAAlezUAre6DPsgWhD70jsWg1/ALkZTIHcM0GpABlSgvn
         d9bfVpYgT4Vd6JCBXNFdwHL6TcQbi7+So6ENpeLEiENKvG7Q808m4SrZXeV1t9DdeRPT
         3n8xcHpK3pzuTj49fhXYIwAjQv1LE9PUwn3NenZ7l63Up7zFOhIz7sUjpFCXSK8ecWjP
         /MSHspeFV/Y5fu7GntDQcLMnUzxOtoTUHuI4RzOwwnhfbjEJ0pFnEecHgBmcY9IiGvQb
         6gD1sq8+TuQ5E8OXEHLAjQ0lSOWbAwpUbuKLDp2UB1Q0a5rW2uNX8LaCPxWtHrNQoXvG
         JicA==
X-Forwarded-Encrypted: i=1; AJvYcCU1csxaRhenUQTbSeaMjPzI1ekbTRXmBW1g55B7/CgGOn6gXiQL2/g2IYmDfPYTtPczoAxeX/2tWJZeVv+goINi@lists.infradead.org
X-Gm-Message-State: AOJu0YwH+OxIVM8pXLhco3RgM75lF3vtKlvMWguipowOdVARK/vegNt7
	tfJzYujgicgskRs9hXDCylhsoU2qLH7nBpZF66eS+65F9DpkeZiw
X-Gm-Gg: ASbGncuJMLq24Qs+Jj7AvApzSsW7qt9BNoGvplDIpx37WH5dvBQa8vnWdVfqR7jP7UE
	erPJ5jEu49IABwexkiPOWQCKTYmepNs1z96PVpzGYThuMkhWd/kEqsQtPrVhr+6LrlAwPfnLYR4
	2kbKqKEO2qggDPI1g3Bd2PWLYU+ymIbbSDp6xS4HqNw018Cj9Q8sey7LHZ3M7Asns7nP9ogFPIf
	kzyVOSXORfQiYCbnCseYk/LZo5QVLosXsVIHPmXaQRVT3Nt9zLlcD6o/9TUH54MR/JrJr3QzdxP
	cAx0/BRKzLg9yWDWfJquoFIWuSwcvw==
X-Google-Smtp-Source: AGHT+IFpRIUUjMumU1yZigYYXeQpl6ouiiG6kA3Wzy5akHaiQ9Q9WMcDvpoWIzUd5821ktni1tvZvw==
X-Received: by 2002:a05:6a21:b97:b0:1d4:fc66:30e8 with SMTP id adf61e73a8af0-1ee8cb098cbmr11194774637.10.1739735947571;
        Sun, 16 Feb 2025 11:59:07 -0800 (PST)
Received: from localhost.localdomain ([110.44.101.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73265098570sm3023559b3a.22.2025.02.16.11.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Feb 2025 11:59:07 -0800 (PST)
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
Subject: [PATCH v3 0/4] Exynos Thermal code improvement
Date: Mon, 17 Feb 2025 01:28:33 +0530
Message-ID: <20250216195850.5352-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_115909_071033_6BAC457B 
X-CRM114-Status: GOOD (  11.39  )
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

Tested on Odroid U3 amd XU4 SoC boards.

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

 drivers/thermal/samsung/exynos_tmu.c | 78 ++++++++++++++--------------
 1 file changed, 39 insertions(+), 39 deletions(-)


base-commit: ba643b6d84409e8a9057d5bdd6dd99255b1a88fe
-- 
2.48.1


