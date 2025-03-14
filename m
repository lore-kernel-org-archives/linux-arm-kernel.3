Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D209AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 16:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KhvzLiY857SGZEqzmins+PvzyIr/NTQcyLXE/tMCnFQ=; b=moJsSipRbMmVKO
	FxLic+mhIMdeu5r9d9fcwiqD3tePoQpv4z7XX6lzqYKTh021AHLr9GKsE+HY6WjXSVR6p9PNiV+L+
	w4eW/+aH7SJQW8B/05L7NSGt/OEMn6xjRaHbU6XuKRLyP1BXe1QFnKBzzOj30Quf/piiPGr+DQ096
	rnr7WJDIQakFePuy10u4yA7lo0clINtqG73AEk/c0bGKiM+RIC3Wbnv8bpF/9yaLnC8qK+uRIaB0W
	TPNopgNkeOS3/82jLDIhZ7dnmU3Z7bkAhpGnlVr9FfON7BJu7pc+1SdkdZWyA8p43516L929TS2oM
	y+ckmDgLrpce7tGnSCVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt86V-0000000Eluf-4121;
	Fri, 14 Mar 2025 16:41:47 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt84q-0000000Elha-2Puc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 16:40:05 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so4178973a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 09:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741970403; x=1742575203; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KhvzLiY857SGZEqzmins+PvzyIr/NTQcyLXE/tMCnFQ=;
        b=kicJo1owH3pduibQOf7V5aak5k0B/hbF5XJzfR7eHKm1n6jMmWzAMqlD4dQPRj8BAp
         s72aPcWWDH/B9tE0xHlTlFkY5InBfcjj7cj4UcZX8RqBwLxIOofDbO10hbjHP/owzFZz
         TIeomONDDn0XFbpbgxt2mfvglM58OEHi+lG0rINYmhNBvE3ey4M+OYsJxL9Kr3RbEDzV
         XasGWC672JWm3lQY50Tlm/aWQTC7ldkmoKtG+9JvMGKlmA7y7/bd0ATDg/Xghll9LGzP
         BmXNSoxkrfGTxC7H9G/YoPcXo5fRIhSbrhP++xgyuEKgI8U4iEpyDh8oBPfeh1AV1AHd
         EomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741970403; x=1742575203;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KhvzLiY857SGZEqzmins+PvzyIr/NTQcyLXE/tMCnFQ=;
        b=bGizWWepd6ikYraxAyykWpvVsHnnFFbpTO0QI23NXciW57Kcaxogl2jypfQV/wO6wG
         5bDMyiRwAJIo+Utuc/Zzkk8LAxSYctifrva1Iv4zDN8zS+lYqzpGkC363JEjHLf6d0wL
         irJLes/kTQ1hRELprDVMYccT+yflbaBnnMOUuTppWekd8P3Q61b88nwtxWfnYWppAa+F
         EeetAXNe1lsstgQ0+9V6WT51LGVURn+87GwbZ7bVUjTkDL0WLIHna/MNDzPUmCK8s7Cm
         HCJaZ2mOeVx4baTrctP2eoxLcRFufoQYTx3L1tanvE1R5mCWnkfNa3N7QNj1vrQlbaOb
         Q/Iw==
X-Forwarded-Encrypted: i=1; AJvYcCWoAAteFa+S8+SlJCElLktbV4HvrTZtoA2+ji+y6fFRcZdUX+gvVeuWaWaQb+b9aGME7/UD7SSW+rHjVBFGL9Kh@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0JsIZgqokSho3lOcMgh2oD6IQhFKoChjd6F6g79l9KVJSZEll
	ZYXpUFjCANMvmPgVsZqVTkBbsneN5CgPX1fFwIcfSnVPdVD+52arfF9x4vL5VzwCGbIui7x2HJK
	sd/U=
X-Gm-Gg: ASbGncuSGXkm1G2VFTs7AdMtAKeQu1b1OtKqDlJOFEy6QfLvvqR+UtbdMCdDMAoSRKb
	m8ASBgxpz20aWXlDH4ki5cj34re9Nt4HF4mFmNlfi9uoNY2qHFxq1ScHs5O2uByx84DD8EnnjMW
	+S30BBoznL5EFlBxNBd80S1okyNEjdT8psPbo8Qx5kFaru93pMGpoL8z/ksug5CTtiBSosu32Vc
	BcHI/0XNhrugMDFbPk+hVL5QWwnhdmM67+jeQwWyyvWvNFga3Wi968nLqR6CGhLUmvDmL3xFoLe
	IhWeVJ8pSqSZx0iwcB/14YRz7S3i4Kv4ZNdrG7qy7hoaJvbkDBCX3iGF6iSCm/PcR8TV+lZYU5D
	ngOtE8kVR8tkDo893qppteanO65fy
X-Google-Smtp-Source: AGHT+IFGfvz33USapJBinW272gepivtVA3O/20eKJ/+H17ddACPCm8qjeCgFc9bP4W9ixUKFcXUt8A==
X-Received: by 2002:a05:6402:4301:b0:5e5:bcd6:4ad8 with SMTP id 4fb4d7f45d1cf-5e89f24c63fmr3817601a12.9.1741970402855;
        Fri, 14 Mar 2025 09:40:02 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816968cd8sm2115727a12.18.2025.03.14.09.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 09:40:02 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/3] firmware: exynos-acpm: read fix & reduce log verbosity
Date: Fri, 14 Mar 2025 16:40:00 +0000
Message-Id: <20250314-acpm-fixes-v1-0-ab03ca8e723f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOBb1GcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0MT3cTkglzdtMyK1GJdYxOLZANTCxNzs0RzJaCGgqJUsARQfXRsbS0
 AgKKOcFwAAAA=
X-Change-ID: 20250314-acpm-fixes-348c058476a7
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_094004_620908_8830EC33 
X-CRM114-Status: UNSURE (   7.74  )
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

While trying to use the ACPM driver, I stubmbled across two issues:

    * acpm_pmic_bulk_read() doesn't return the correct register values
    * superfluous log messages during boot

The patches attached are the result and hopefully self-explanatory.

This driver only exists in linux-next at the moment.

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (3):
      firmware: exynos-acpm: fix reading longer results
      firmware: exynos-acpm: silence EPROBE_DEFER error on boot
      firmware: exynos-acpm: convert to dev_err_probe() in client API

 drivers/firmware/samsung/exynos-acpm-pmic.c | 16 ++++++++--------
 drivers/firmware/samsung/exynos-acpm.c      | 13 ++++++-------
 2 files changed, 14 insertions(+), 15 deletions(-)
---
base-commit: 0226d0ce98a477937ed295fb7df4cc30b46fc304
change-id: 20250314-acpm-fixes-348c058476a7

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


