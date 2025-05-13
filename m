Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2543FC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 10:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GpW/hDUMz7zX4tvSsgRzaXUuXymLo1IwYeqOqY+OOaY=; b=N8I4+DBS5FLwgx
	REjU31WKmkgX6IuAjpPGBzBWugLMUdcy7eIqDO3+5RZKXtqSW8ZI5MLpPdAYmwkFM3u5yDmoG8CeS
	fYMrIuNEcX3BPgFX6gzxjw3LPaDC4Oat/d+IrwSyXt7XcZaSisrB0GG5CLVprQzT+RXv22kU0G7fW
	or5SQFCxzhMmqeZcowFAEvXyvpgn0u/ZjqZHdQIqrmjxjYnXm+xrK5T929AsdggyYiqCyw3f7J8EE
	k18/pFwtmQs+UfpNwPXa2XCWI+X28sgG+FmXibr93VdMiX+c/gxslXCwAd9YCJPg7WdPZOb5xCdQw
	QzvOTOP3Ht9AmqWCQX7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmti-0000000C7Ln-3p7P;
	Tue, 13 May 2025 10:30:06 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEmi4-0000000C4EX-1Jff
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 10:18:05 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3a0b4c828c1so658574f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 03:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131483; x=1747736283; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GpW/hDUMz7zX4tvSsgRzaXUuXymLo1IwYeqOqY+OOaY=;
        b=Q6Rimvk9Ox4SztRUiRv7Itkasl6lOaaGTRbP527KPChq14d3OlSVtyyjnzjZmFZVCK
         Dt+ABrdwggfWBv9sQ883kJgyW6ekhwwHD0aDnb87w8BUalJULFfPWzvTH3/KEPczY1q2
         R0wI6tIR5z27CGFU6ev0urj7TpCaQkImkUWKXy8PLSBKq6ctptvEbBpl2ayDHwnykvmN
         2VvweNaHnnIl6wf5fvxvTK/BbJejo4/8v6rqQ+b9ibMouN7gbBO6j92h7bK1MemlRBuZ
         XD+v12wqaUziSJ+L0X8VBQskgyYBnUup+efywDdxCJkFCh2NlhVvvbvBM8DJNAQinPR4
         rdSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131483; x=1747736283;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GpW/hDUMz7zX4tvSsgRzaXUuXymLo1IwYeqOqY+OOaY=;
        b=SIenBWzcT7eLRyfMuTNICz72oKgN9oUU0ojMcHiJOFRKu4r8ybm2HdZhNJqW/cfAMY
         MdJva8UE7le/SbjHJ4zxlUfZpM1XhmcpHoYctGV8prgI8uOjDcoP4F+7Yp/cPrShiM5O
         gdQ1j0oOn/GOuhWrHGMXEuwRAErdcgsKk7pErXb8acfzmFbqDRzSRl0nzp4pkz19AKDu
         lNpcQNmvwyXwK6laUBUQEiTxSKb8NiXAkqZh+XbKY3T0Z7OZm9tYKMwiiKC/c90T9v7Z
         U06VsGFVjdH8tGIvfVKruU56o5cI2L070qnwyjgbLhn3cTkWSn/7akRhTihn5bAp2YU/
         eyZA==
X-Forwarded-Encrypted: i=1; AJvYcCXXcdXwZLdEi/tUSKRtuywkZPQYnqFbB93bmnBTyFNiOCsx4FT5uu3Kuak8qDR7ptcZpk1+YIPYmP5eelJB1cN6@lists.infradead.org
X-Gm-Message-State: AOJu0YxOCbE8x2kI7ll5LvuHmxUUviG+DJXjI+zfmpLw41H3vaNqLQZI
	iupELNU3EB+GXqODNLky/2K9SadKSiAcLkAlVyasBBVHInKwicGxZd4A/sVeMqE=
X-Gm-Gg: ASbGncviq46SQt2gAI311JglHy367soOgmGOZIlSotk/Rn4libFx2sl9aHPesOyTek6
	B+h7ZU0ibfqTDb/7VeyMVdsivH/pO/MdJcQThGFTuD2B7G72jdFTBmF4+B6aJUI6TC8s4H3QbIZ
	WzR/27PZGONYRAtH+it01WnMxngSF0iFfToFD/JLXG88gOZCBxvLrwAbEHORe/idCRgL5LGgtmF
	+ZXLjuIUkxHkYuGELRwGCUKzAwqsQEcXUVIDZtvPJs2t2d3TS4BMHkk5WMI1ye0n7v8ElJv/DRY
	HlPf350eKel6TyuZAsKYqQyWnIaSuVovWYHYFwCRA4TC5jQcBPy//8iYU0xlcDIE+aBP/SsjznP
	W2PJl7EQuSG3YCKoJR97fIIS2L7CSwxFSe0qMf68=
X-Google-Smtp-Source: AGHT+IExUE1z2q+MGTB1BjX3tNGd6iZlgfApNxaHiNcVQa6gR897h0allbxYsieVlwmVMw+6ixRyLQ==
X-Received: by 2002:a5d:59a8:0:b0:3a0:9dd1:bb59 with SMTP id ffacd0b85a97d-3a1f64a1f8dmr4843504f8f.15.1747131482665;
        Tue, 13 May 2025 03:18:02 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2d37fsm15914997f8f.68.2025.05.13.03.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:18:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH PULL 5/5] arm64: defconfig: enable ACPM protocol and Exynos mailbox
Date: Tue, 13 May 2025 12:17:54 +0200
Message-ID: <20250513101754.23158-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=FwRadgPxJRm5xEAehJ8JywumbY0idjddVQyEPezOekk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIxxSNRzisqVNsQAPPyyKC0GMYtidRZ+mahC2q
 7a1kCi49W+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMcUgAKCRDBN2bmhouD
 1w3qD/9sV5S/8zWHdb9HmJxyJzng+j2RQ2MTrzMvGp10HAMWKOtVz9EDQHAJMQMdafDO+uf0Rcn
 +BEeZ1ux9bk0u+rnA6dUyLWCOj24BWQE1C7RdSLNJkxclO+6Hw9SGS+RXnfOTFibwP9+dVgAyXE
 VVyYEWajD26bKBNBuE3UZjRnT/6J4z6V/tOZtQHJ+13yYFIrHSjLL0btX7NYRXxET4WD4LsgWHe
 374UyWm0OSfJSjFUbcaHZmBAnG2pRtYvt1nCQkkKFsNRnIGEwWWu7PuyUjIXpRX1f0kOwHdy2ve
 wdxqllBxYV+WuXXVdwXxE/bqEmhzRpkYpywjtbdle1n74T2y/xXSbTDrvJUSCcHC9GUl9RRZh4f
 IewbY7pR7uJz1FACllnaVt530k0XgjglyNAddTkdg/dyfCw89dXLU98eFZS1TmJAWv9BJDdkfh2
 rGF1BubmwZZlS0Fsk8W6axywjM6j8Lbnyz5R3kZlUDA/vxOC+oFkuEGljRkELxTDOh2NgoF8grQ
 YCatdNfWkqRROfgpNl4Qd3o4tD7SzQ8rRmy3/l0Ooyl1NtsYotU5osF9iYZd3CFpH1I/nfPz239
 qFYG/WtuE2OOjlNc2Mlk+acCDrCiGU7c6f2OmCM6NXc5N8LZzm03jpLphu5Wn3UQjk7XgqU2ncP zt+WBUBpI6quNpQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_031804_354801_6FC8B6AE 
X-CRM114-Status: UNSURE (   9.33  )
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
Reply-To: 20250513101023.21552-5-krzysztof.kozlowski@linaro.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Tudor Ambarus <tudor.ambarus@linaro.org>

Enable the Samsung Exynos ACPM protocol and its transport layer, the
Exynos mailbox driver. Samsung Exynos platforms implement ACPM to
provide support for PMIC, clock frequency scaling, clock configuration
and temperature sensors.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Link: https://lore.kernel.org/r/20250207-gs101-acpm-dt-v4-4-230ba8663a2d@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..5c85e5da152f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -265,6 +265,7 @@ CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
 CONFIG_QCOM_QSEECOM_UEFISECAPP=y
+CONFIG_EXYNOS_ACPM_PROTOCOL=m
 CONFIG_GNSS=m
 CONFIG_GNSS_MTK_SERIAL=m
 CONFIG_MTD=y
@@ -1416,6 +1417,7 @@ CONFIG_HWSPINLOCK_QCOM=y
 CONFIG_TEGRA186_TIMER=y
 CONFIG_RENESAS_OSTM=y
 CONFIG_ARM_MHU=y
+CONFIG_EXYNOS_MBOX=m
 CONFIG_IMX_MBOX=y
 CONFIG_OMAP2PLUS_MBOX=m
 CONFIG_PLATFORM_MHU=y
-- 
2.45.2


