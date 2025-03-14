Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF7DC35FF3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 16:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FqlKsxagPbT76Z6CLNAsMWFx/025f7qb7NuOScguaQY=; b=OSYtoohUTpCMYbTkjVtLFAj03u
	2tF3qo8navEBT2Ac5Z4GowhCtRMKp2MzJCKBTFqu5Ln1PWoyhPgL6h7pzoLIiHzI65VajGtkXvXmd
	s4Y2e2/bTVIyKDowYT2x0yiFBPqMmAjbc8Fd4g/gnjAIJYUJG6GiHHoXqDgpPtjqtL2PPKBUj+C89
	6Ppr6eGS01xI33kSs1EKXHvIbrEY+XS6usc2EqtgNwIkho+Lu/BRSI/XNExbgM1So6i5cvuPZOBcn
	iUBbMlr+OSkqe6YEz5et/OwXF3T3sig6WONok/5Sl/yBZCzXetvWkMkn6ELY2IC3OOetuqP2V4duX
	inVt9sIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt8BS-0000000Emr2-0Ggj;
	Fri, 14 Mar 2025 16:46:54 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt84r-0000000Eli3-3C6E
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 16:40:06 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5e6ff035e9aso4586402a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 09:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741970404; x=1742575204; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FqlKsxagPbT76Z6CLNAsMWFx/025f7qb7NuOScguaQY=;
        b=aR5ZqBbTCfL9ftHdO2Rde7toAH7apeiCQk3Dyw7H48fnUg0ZR6TBEPRgU3cE2PHiqr
         9KMev9/8cMPts8HaT54XM7WZ2fdV6kUlI1vVGa/Xm2S3z5zTvmWjOMWjVjRaDpOAtfvA
         bteAIkll1slzlSOdFInKzBMLkiV5SyB8fEZyP4sxZs1STGRuR4Tg/nfI7xb9aqPFOmXH
         qKknZ4SZ2ZdxfdI5VgcYedTTwIMXutWcveMuG4j0rvmfgqWfc80wu88DvycZA9aNxysC
         z+4MVZxZr0MhUq4WdxIqor98Ir5A4bY4E645ebTD5l1JL5dEkiI1VVwVjqKxUoE4enTU
         zeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741970404; x=1742575204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FqlKsxagPbT76Z6CLNAsMWFx/025f7qb7NuOScguaQY=;
        b=YHIPCgf1AtopkhcqADYBYwqvOn1qEFc++JZZDmBDeVWFbyNjMtirW6ZfoqybiD1tig
         +L6r6q/tPMCqB2mjd/ekZbeIpSwXtIW/hStByikETeJkowDVZIVZ0Gx0I835oSkSqk+u
         nbjZL2BYdmLvrJ9/5HjhZE5N3cnoHXp/TyhUg+29NUeM3l2DTIGhDtSX9x6qF5nfsXn9
         h7PxN5uCts5/JpjQaIcFGNR5Mx26JmSlX51R9XsrMiygKLvsX1XQtnOTOSBOKODKIUx8
         7Yts6bccvF0BF6qa5SzVtnPH7H/w+yJ9Oa7nPOmXYPgcxwR0N1hSf1cr646ul2LR9zo6
         QvKg==
X-Forwarded-Encrypted: i=1; AJvYcCWQ9KC/CibGcq8/rEV5puXOTSM6511KBKB2p0iurTaOtGrrFMfpic8/eAavjbRIZARn8lUoqf9fcGE3HTOJYzUb@lists.infradead.org
X-Gm-Message-State: AOJu0YyDBYB8OFgAY4M80I4d46/bakExLCdSJviLLv3U88HVUqu7eJHx
	VztuMkNwmFB9BFMMyUGkasCJ8ar9mJKRpuT3jMZyP9MRdOwN19eAwOEre5gYLJABIGmdEWKT3LP
	gRLI=
X-Gm-Gg: ASbGnctK01VfhEDultSUHAjEdmVPnZBoJoNSwrsaoL+p3ODxDUeOUCOqDCLiDD/z+FB
	3hsOLrz0zh94VzAr/VeBH4JjW3Jg9zW5GsO7fuLGgHuSdxGoRt+OLduINjFemVojpM1WfPCGNbO
	zJPqS/Yi2T7rJWwBGuYG25zH8fmRPZDgN6SFMEhiH2wl4pc7pf2Ym5+eL5Kdjh+q7rp6D8NQBgp
	kkbebTFApTY9WYJDVG2dUdc6IDbstTEcqBZUwzf5T2nveC9lA23QuPpva3FvC/JWE2dCfpvY7Me
	wuad6QB1FeKXmxGvmWLFEbhD6g/H6w0CGAXYQPSVzkKuFPfs5JLOldyHkHOKGgv1mx99uE+uMrN
	UWKVuw5+nYGaIC7xt0aAPUluYSBPV
X-Google-Smtp-Source: AGHT+IHLsxwF/DHZEPhOyEzlgmcKjsoUUujUnQwnbW8+qgc574E5shkDM/HanOkkYGXBGqTnr36IXw==
X-Received: by 2002:a05:6402:254d:b0:5e6:267c:a6bd with SMTP id 4fb4d7f45d1cf-5e8a051fdf9mr4301988a12.28.1741970404463;
        Fri, 14 Mar 2025 09:40:04 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816968cd8sm2115727a12.18.2025.03.14.09.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 09:40:04 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 14 Mar 2025 16:40:03 +0000
Subject: [PATCH 3/3] firmware: exynos-acpm: convert to dev_err_probe() in
 client API
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250314-acpm-fixes-v1-3-ab03ca8e723f@linaro.org>
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
X-CRM114-CacheID: sfid-20250314_094005_801739_EB730E3A 
X-CRM114-Status: GOOD (  10.12  )
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

dev_err_probe() exists to simplify code and unify error messages by
using its message template.

Convert the remaining dev_err() in acpm_get_by_phandle() to
dev_err_probe().

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 48f1e3cacaa709ae703115169df138b659ddae44..03f907a95c6acd66d89cd8af2f52e7c6dadf492a 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -701,12 +701,14 @@ static const struct acpm_handle *acpm_get_by_phandle(struct device *dev,
 
 	link = device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPPLIER);
 	if (!link) {
-		dev_err(&pdev->dev,
-			"Failed to create device link to consumer %s.\n",
-			dev_name(dev));
+		int ret = -EINVAL;
+
+		dev_err_probe(&pdev->dev, ret,
+			      "Failed to create device link to consumer %s.\n",
+			      dev_name(dev));
 		platform_device_put(pdev);
 		module_put(pdev->dev.driver->owner);
-		return ERR_PTR(-EINVAL);
+		return ERR_PTR(ret);
 	}
 
 	return &acpm->handle;

-- 
2.49.0.rc1.451.g8f38331e32-goog


