Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DBBC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 16:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5EHw6xE0g+7qki2CSo1YJpVOxoekKA/7CSCBUCVC664=; b=xsdoQSgBqGB/iNVe3CaflJzLMP
	qVM76xVdoa3cw6QgOHl1c6xRuf9VkFwA15tQ2ztasyjFtAmGBBJjxycmGDeqooNucktbDoApWNQwB
	ILoVD7TozJnbNjXibZWMTHyafvrDXDwOHAL6BZU7wyhLzgHkcqUhxNNWb1sea8ArbKpchSmk5ns0w
	XKPe7uVWS4/LpfWVDIcwhp5qwgeOdyGBZ82BSQ66KrBX/IXWpX55lOD950GRKor5cs0WxD4bwD/bF
	/1h7Te+PQ4p+G0e6ddTfPgnYNHV3pJBCjKh/TCNhFs4X2rncRN1yu8IFve/l2FwMKJIJ79REVUEWF
	3Kg4OOpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt89o-0000000EmfT-1EAT;
	Fri, 14 Mar 2025 16:45:12 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt84r-0000000Elhf-23BJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 16:40:06 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5e686d39ba2so4594075a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 09:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741970404; x=1742575204; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5EHw6xE0g+7qki2CSo1YJpVOxoekKA/7CSCBUCVC664=;
        b=fg06U2JA543ra7nvOMGFC3X4VqYzjCKJ9Jr897HoG1mUNpijv8lL9KZm3uzYvLPs/9
         jamrPlmCCrWBfftlt/xAURSiZJjhMYNK396mptiVhTCVEBPJwvIbXAk2c09Vi+MH6Oiq
         Q0ZTzjJBOF3Jf7Cexk4l01zJRLuzDTO2Gy9JzzIvJm/a9aL9L18J8CUhjWM7N4NOD14n
         BUYE3QsmjlA0aRP1owQT/W+s4AZRlYJM5/GAsfsAsMgkKrh15BKRSbsaY+G6lEm0w2Vq
         GCZkpQlhqp2TpARV2RXzNYG5yBVs1GfNyEooE6gEuUJXgCI2PVEGPezhJ/dESJvJD7xE
         EueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741970404; x=1742575204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5EHw6xE0g+7qki2CSo1YJpVOxoekKA/7CSCBUCVC664=;
        b=tbPHCDdmTL/tsY1EUrUE8cQTaUEiCegHUAtZIR9NtzrxR+oNla9ob2Jt8hNCPQA9Un
         CRKWrvh8U+sKvnUK3pRnfpEfE/pwZ5JPcmoYjlNOqCj7PlSjXE8BlyGwpfFBbarNXVy7
         CsG6axS1ICjH2LdHQnJIWnHQN507mtrEMbB4+n0yHI2wOjpBjoXp0nbb0G6JGPB7HahC
         JMwjh4pHlFKmV/4hWCoUCIbtw2RJARjIO//N3FlXjJmKRPvPUTFFhiilpJ7bZnN6ln+i
         R4TS2EzfhSM+ddeOlRgV0UDZ30hjpo8rZbkfla+b0/2ln0S6u4mGfv4okba9FcKoAv3J
         7PLw==
X-Forwarded-Encrypted: i=1; AJvYcCWOcl2qfzcgqYj94KvyG6M/MgJvzJsghpChdpci80SpOQNtV+6Q74OrE7e4H2QzO8JLcCKdZDMgQWQhy/OnLRyY@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb1PbFhLtZy7d2u7gHAHqudVSKYvS8tFPJfYS1v3qRRAPkuZVo
	zBT2t0ljKqspfqvb7Qwb8decMpPupyXeNZtSoZSG9eXRtQxT1ynkrl+BFSe5Vu6iPWqaJvXWt54
	ovw8=
X-Gm-Gg: ASbGncshEQPHVILY152/iG8w9q5VbgcPeU8hjmmIco626w+NEJhkBx3N48wRwatMuBB
	gxuyBhChkRSH25NrgxHe1JGaZ8XuuOot4WC3cf3ddPIe27inkm3e2ZXaZKI6SKjGRc5Z7owW2nd
	syJjfP0brN+HMe55bSsE46Im7pZoVBZ5JiYfzNe9SspnarjYpUOHTsjUQOwhLYtZG7Zni2Rd8nV
	lQ7rN+33mNek9z0lLqvze+l2M20/gb3CnmaxuAR06zURZM0CQnf3He0gvIxYm66mfJiq/HaTPhr
	PnAQK24CuXDlejKAaHJD4YwAL0mprxhEs4blT3mcyuZcySLWwwEVIBGVFkYTE4drl3K4fR86N/W
	kI5tXD32Sw2+OS10rsRbjAt5C11z/BAK4pDYNB0E=
X-Google-Smtp-Source: AGHT+IFm72MRO+sabSmFs08xZRpk0IIZks2PIM2q02CRV+JCE7zgfN2FDEwb9GyApg/KaKdRxs7krQ==
X-Received: by 2002:a05:6402:3550:b0:5e7:aeb9:d0cc with SMTP id 4fb4d7f45d1cf-5e89e6afc19mr3874499a12.3.1741970403936;
        Fri, 14 Mar 2025 09:40:03 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816968cd8sm2115727a12.18.2025.03.14.09.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 09:40:03 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 14 Mar 2025 16:40:02 +0000
Subject: [PATCH 2/3] firmware: exynos-acpm: silence EPROBE_DEFER error on
 boot
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250314-acpm-fixes-v1-2-ab03ca8e723f@linaro.org>
References: <20250314-acpm-fixes-v1-0-ab03ca8e723f@linaro.org>
In-Reply-To: <20250314-acpm-fixes-v1-0-ab03ca8e723f@linaro.org>
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
X-CRM114-CacheID: sfid-20250314_094005_524502_D66437E6 
X-CRM114-Status: GOOD (  11.90  )
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

This driver emits error messages when client drivers are trying to get
an interface handle to this driver here before this driver has
completed _probe().

Given this driver returns -EPROBE_DEFER in that case, this is not an
error and shouldn't be emitted to the log, so just remove them.

Fixes: a88927b534ba ("firmware: add Exynos ACPM protocol driver")
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
issue is in linux-next only afaics at this stage, as driver is not
merged into Linus' tree yet
---
 drivers/firmware/samsung/exynos-acpm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index a85b2dbdd9f0d7b1f327f54a0a283e4f32587a98..48f1e3cacaa709ae703115169df138b659ddae44 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -690,14 +690,11 @@ static const struct acpm_handle *acpm_get_by_phandle(struct device *dev,
 
 	acpm = platform_get_drvdata(pdev);
 	if (!acpm) {
-		dev_err(dev, "Cannot get drvdata from %s\n",
-			dev_name(&pdev->dev));
 		platform_device_put(pdev);
 		return ERR_PTR(-EPROBE_DEFER);
 	}
 
 	if (!try_module_get(pdev->dev.driver->owner)) {
-		dev_err(dev, "Cannot get module reference.\n");
 		platform_device_put(pdev);
 		return ERR_PTR(-EPROBE_DEFER);
 	}

-- 
2.49.0.rc1.451.g8f38331e32-goog


