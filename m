Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D38606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 16:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2DTq3+2Z;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ZIsxHrMJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GHh0akm+nQYSDGsKa/K0+KoAPzN5SJ1wMHXDD2NJZ2E=; b=2DTq3+2ZDxt2/y
	RIv8YjX6TS9R0Q24etaioFARIRx35TD1C3AiFDhSMh1/ffzG6vbdDbpDSRryfRTbZIw4CdFSzghKd
	5jTDGuXbHXVvmrJ3PbB07fWGl47HIra0Qjy+nPypypE68tBdVET/3y+4nAT4YWsxMTlGLtZklfF8z
	w0uouYCiW4ur0Vw542CgpIVfme379IfvMSpLXW/A5oOx7xsSwDfA1kok+DUFcAvfxXtsAxc1Gyh5o
	S5jWCiDbCG7x+y+7zdiPFKfqR7rKyLyeO1fsCVJieWJMdw0Y2vpdCMj46LRgocOEB9Gz8/kXpiGc7
	4/V8TfD1O+duSRAz7Eyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8r-00000002oZo-0FgC;
	Mon, 26 Oct 2026 16:01:45 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8i-00000002oNu-3te4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 16:01:38 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so5504410a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 09:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030495; x=1793635295; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GHh0akm+nQYSDGsKa/K0+KoAPzN5SJ1wMHXDD2NJZ2E=;
        b=ZIsxHrMJqtZTpe4pRiZuB5quK+n1SrXQAcPFth7WSYIuYA9adeZwBYpLSF2zCM6aC9
         lnIzJcc396Xg3/JyA1469uCrZKdOkuqtWpMbjDKz6JTn5GOr7J8BGq96pVkOjLkZ4g3m
         tFZP+WQRW45uGcxtpU2t7VZqOQ77AEN5EFEkualaLBIrqTc6QuFOo4T2i9knpPPqsP8i
         BKIt73BwPWBGHqvQvhzoVF1QUn6fdCA6zHby5KvSnV1t1Q9s5B9Co4wgniiiMf99oY3R
         WoLXQN0h+9mlzWSmFUueMoo3mJf+FM2ttvOlLEiuhv4LKcaY2QQjrAFoXZ4kRG3e2QeT
         Cafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030495; x=1793635295;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GHh0akm+nQYSDGsKa/K0+KoAPzN5SJ1wMHXDD2NJZ2E=;
        b=AeFaQwxSdyIpJvxeDDJN63P1c9mwScKihxknmxacipyI5AIperRwqxbCf/3alA6aJe
         4rNbqaP3BSK6PWOOUaHhF2T+1K7xO23tB8pYQX/v6VSpcg3v7a61vh9jptRdzhByp+dW
         cAjCgRQEsb4PuWFjYrRjbbXksQYzgOqrjg1NjnD/rXnefrsZw3xwKO4C9mqBZd3v9IAH
         fNkqkmsmsjsrC9rvH+Qwtncr8MkCsZ37+n6zVALtGwtD1BQUB47kJq2VRnV6MPNvVEcd
         7jfCT2YrdCmneoSQvCF/XYnjGpGTfoQqEqq8ZQH+iCZDEXwwdgUTapUs4Pfd6H8K9PUs
         HhDQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4LPqOyRZ3MXUKFvFT0wqNPLx5l5MVQ9MV/dZdJEpSXdTKeC5GsIIkfLVckoMsx8MOMvS/dJ/zDLoeuoxbinO6@lists.infradead.org
X-Gm-Message-State: AFq9FYJJDbwmQPdEgvBFHFXRfLdOeXuumGpbRZ4dZxLN8h3K8iBJCM50
	79Bav8agm+lGVT7i6kXZSTAyJYshhI2UGd7NSR00BWoI/2LVXh+kI+ZlmVq8JLejrxs=
X-Gm-Gg: AYBFou1v6VHrni5Mz/xTEkb9DTUY+ExNZ01wJ105yA69HUNmBYmqPydxpwqQACyu+cP
	pu56AqMfdWJE3J6tD9q/+gA+2DxonEBEGvOW9ww9b9OZjnf012FsRFhoMnZ+dNNKklWNRTjSuyR
	mWDJM8dY07z3Wkr5Xc+GCGSt4yFiaV8r1VQNghJsUisCBGXq+1wV2kKw6Yn0ku8rknz4hCF2CKo
	TvjszBT0gtLHG2qq6wsSEqEXIGPBmQAElUdtfd+MhwuMpRKlUK1vNTtdj3LTExQyWh1tluVE8GP
	YmBU9JB2BgeTNsU5wb9iY4tOCjEKQEDabUIoMIb/8PndxEGGQC3MbhVbwl7a3IW+pk1NxdNhRFi
	jCmWYQZ7TsAyxDFcugnjNIr67o4yPMib+vj5W/fkvlx05X+JLtvcgO4cLq10DheG6XoYicxcDna
	mXrwh4PJh2PvLPFBTha8b29q6ZMH/mCxkqebSI0YWfAr3j/hAF2wLUerDhyNt3deDH/AYdhwNCs
	l2PeTQgWyjhdYCAlp4ZH7ZLQcpT+47I16C1jjxCtybq6HRHyGrgNf91wDUTlDQ1mqPqcGE404bc
	pN7dE4Gsj6kN808hsWcZhpiQCQzRMc2TxYFi
X-Received: by 2002:a17:907:7b9e:b0:c2c:d06f:cf89 with SMTP id a640c23a62f3a-c46bdacc54fmr886243166b.2.1793030494893;
        Mon, 26 Oct 2026 09:01:34 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:34 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:32 +0000
Subject: [PATCH 15/15] thermal/drivers/samsung: acpm-tmu: Simplify
 pm_runtime_resume_and_get() error checks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-acpm-tmu-fixes-v1-15-0637431b7268@linaro.org>
References: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
In-Reply-To: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Juan Yescas <jyescas@google.com>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=1473;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=lZVnFDVBHj1aJ/e5MIesn7vTgTEf09TNxBZ/LEj/mAo=;
 b=xzafQuLI4krITcIxtfwX7fRea8cl4qpZS/PU5TktcAFB9PnVEMuhm60+zlPME803xQgfWT0wq
 lnW1Df98m27DbAa2fERE3L8ODpFo5YZ7BhXIFwJqK9CL46OS5TS4oAU
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_090137_002350_4F1DD081 
X-CRM114-Status: GOOD (  12.44  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Unlike pm_runtime_get_sync(), pm_runtime_resume_and_get() returns 0 on
success or a negative error code on failure. Check "if (ret)"
consistently across all pm_runtime_resume_and_get() call sites in
acpm-tmu.c.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index bce4674be58e..7c30401f8fc7 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -161,7 +161,7 @@ static int acpm_tmu_control(struct acpm_tmu_priv *priv, bool on)
 	int i, ret, err = 0;
 
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	for (i = 0; i < priv->num_sensors; i++) {
@@ -205,7 +205,7 @@ static int acpm_tmu_get_temp(struct thermal_zone_device *tz, int *temp)
 		return -ENODATA;
 
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret < 0)
+	if (ret)
 		return ret;
 
 	scoped_guard(mutex, &sensor->lock) {
@@ -463,7 +463,7 @@ static int acpm_tmu_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
 
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret < 0)
+	if (ret)
 		return dev_err_probe(dev, ret, "Failed to resume device\n");
 
 	ret = acpm_handle->ops->tmu.init(acpm_handle, priv->mbox_chan_id);

-- 
2.56.0.257.gf7497c7d27-goog


