Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA791C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Mar 2025 20:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eOQV9UriWir+1uW8IbbnsFj+Wt+a9Lvs4iaFKUTxFLI=; b=RDFtwtTyW+KtF9BMHXTX1vffNL
	GhK9Myo2vP7YAwDyCRkqv1p26MkVYvtDsaKhyEqFweUg8Tn7bXD2RQDWrX4NTdHtaUycE0DXwmENp
	+YifMz+aVuNLmMbhNw8ux0bLcAWwZEC61uf/AgP/MkPMc2abjNN2b04AYJ0hf17zx2Q9l+cT/rndn
	tr3O8wY0BpAjlQYqXPp8PIUX5G+cTSdGRIE6GtK5NK+MvDynzKHbHVbtKFCfMFR8T73KT5o8v+3rK
	LW7S9x4ksKFYqKG9q8qwLTcxhKY7OL8jhhfveekVmd42xtsbpyeMpH34N3PX4QzHwFH+lsEyqtYm0
	hWR8aJaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttYV9-0000000GqqS-2oV2;
	Sat, 15 Mar 2025 20:52:59 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttYTT-0000000Gqjf-1l8h;
	Sat, 15 Mar 2025 20:51:16 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-225e3002dffso23244455ad.1;
        Sat, 15 Mar 2025 13:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742071874; x=1742676674; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eOQV9UriWir+1uW8IbbnsFj+Wt+a9Lvs4iaFKUTxFLI=;
        b=VwaYAWl7Tm6B/sDZuV5f4yMNLsO7sKlmVBJ2dE6XQy4G0fUmjbAB0VuMbBkQa9Y0ma
         +quRw8yUb9rDrSzt8XvsOzvuuvn0+cGmZR15ZDfy4sc/Bsa8CssKvPRjk+ZZMvPwoaBn
         /5xcgFTnBvGj5txsrgF0YNeq9nxoOY4HJoXr4540z4Oxk5cpshjk3RAULy+tF4j5HblY
         +1zhH20zd57YH5mHppTRfHapp3rjUJ9WrcLRzmKo0Vr1A8qKalT7EiD6NR7aYjPisQpo
         1CHxo4E0cTEufUK0F+8OC6lBVXLN6ihyYuGLnwjWVkN+JPnKCdSRWQ/hbZcuoSnxt0b2
         3Ucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742071874; x=1742676674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eOQV9UriWir+1uW8IbbnsFj+Wt+a9Lvs4iaFKUTxFLI=;
        b=v9ifWz+gpqqY18aLdVUyR7aw8sFtyHmBD4UtruQOw8yU7tvB1XplTFeuNV0abQOE4r
         rEGxTh7UiUgavezeTUuWjwXqI+7QYuf4TJgDZ/eb9QMMxUdqcK3t+1/lxp/sS6rFP4Sy
         aRq079TVKwMHDjbYB/mQlTe4dHlADSYNTIMVUo9IDEI7MajhL6I7vu9+TNgAgEjHv3nk
         OXy9axUmoPLhfMV3Z5jacX3+0Bc897a6UkwTjDQHeOqiv45bf2vJRnxSTevoy1/qGGoH
         GDsJH7usPxF+LHStGNUY70Q/dVIcndfaFxi2bHiu0xwdJBle5J9xzU2O4E9EXAfKUIpx
         08Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXyOTYEhpIn7O7I2fGlp80ezk9GweMLUM9dY6iB5UFu7Uf5VydlC4A+RHOJKnt0ON7DN/Z753mZzoZ4rQZ872aY@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4LowqIGKnD+Oh/aXq+7zCr+ci2Fg/GeOag2ouvRl72HCz3Jdz
	2YDNqdnJPbXyGT1tvycs9/ABn57zKlAJp4mX5p7+oSS+IxY+AGI6
X-Gm-Gg: ASbGncuEBl2miSZMulDTmgwt6Tni9QSuyzDq3ZFN/r3a7FYFAbGG1oVIoV+OKeDAA/b
	uvoTvmkweQztMGsoFQdImjgeJO70ZxtbyBEDe4mgwx2toyfFOw2W41DunlOlP90kcO7o9K7qjkN
	cwxmhsmjCeKQ3URWLrPaBK2Tm2fgzjrsKD2I+RNjtnISdlol+1ZOmktFZ+8EUfuEKKjVuxXsj5M
	RvfgKCjuGaRxxQ5mbUkn7rjRcHW4ukufGnBxHaFMavGx/2WmlXtBFZ2RcDCx2yTQkWf3qBzr9PH
	W+ODRF2lAoOqDKpy23AlM1CdMvsn8j8K3Kxx+YttPwJulhktl60C/sc=
X-Google-Smtp-Source: AGHT+IFVLYCoZq2pP9Vlw0LnPKrI3zK5MDYfruhyqs9zk9SjGpXA2MPhVVbp34HTKq/Km/vS3INVUA==
X-Received: by 2002:a17:903:2287:b0:223:62f5:fd44 with SMTP id d9443c01a7336-225e0aeeb6fmr90916475ad.40.1742071873809;
        Sat, 15 Mar 2025 13:51:13 -0700 (PDT)
Received: from celestia.turtle.lan ([2601:1c2:c184:dc00:f31:f69b:ca22:e094])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6888461sm48416645ad.23.2025.03.15.13.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 13:51:13 -0700 (PDT)
From: Sam Edwards <cfsworks@gmail.com>
X-Google-Original-From: Sam Edwards <CFSworks@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Daniel=20Kukie=C5=82a?= <daniel@kukiela.pl>,
	Sven Rademakers <sven.rademakers@gmail.com>,
	Joshua Riek <jjriek@verizon.net>,
	Sam Edwards <CFSworks@gmail.com>
Subject: [PATCH] arm64: dts: rockchip: Allow Turing RK1 cooling fan to spin down
Date: Sat, 15 Mar 2025 13:48:52 -0700
Message-ID: <20250315204852.1247992-1-CFSworks@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250315_135115_463793_24A3A8DA 
X-CRM114-Status: GOOD (  12.48  )
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

The RK3588 thermal sensor driver only receives interrupts when a
higher-temperature threshold is crossed; it cannot notify when the
sensor cools back off. As a result, the driver must poll for temperature
changes to detect when the conditions for a thermal trip are no longer
met. However, it only does so if the DT enables polling.

Before this patch, the RK1 DT did not enable polling, causing the fan to
continue running at the speed corresponding to the highest temperature
reached.

Follow suit with similar RK3588 boards by setting a polling-delay of
1000ms, enabling the driver to detect when the sensor cools back off,
allowing the fan speed to decrease as appropriate.

Fixes: 7c8ec5e6b9d6 ("arm64: dts: rockchip: Enable automatic fan control on Turing RK1")
Signed-off-by: Sam Edwards <CFSworks@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
index 6bc46734cc14..0270bffce195 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi
@@ -214,6 +214,8 @@ rgmii_phy: ethernet-phy@1 {
 };
 
 &package_thermal {
+	polling-delay = <1000>;
+
 	trips {
 		package_active1: trip-active1 {
 			temperature = <45000>;
-- 
2.45.3


