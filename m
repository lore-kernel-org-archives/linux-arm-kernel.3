Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0CBCD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 09:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZzUxIkdaJ6gBxa9mowChRFjkNJFrAHd972GUGZ8zKk=; b=43oEruBMFQ4ZYKP+T1nyKZCkFu
	HneHqzbVhasTeS7tZqNXMglYdwGiN/cBiy/2m0jAZB1B3IGEgMvJkMKZWoeO/KRxq5PjJAnz+hlzK
	nO6f1XcmTBNxqVIwSUTYHyNv7V2GZPUernZhuOX/5trpT4L8G3nFqJmDlAyuZs173rfDb7AtKXj3d
	Vt10HGyt5tt85U60dFkBxFKhPbLABWWL6q10teOxZW1Tje1MPEh5oN8B17qhabs3/dPdpG00w5N8o
	aWPa0mk6El9g95PDij8+Y6KxkvyRzay8zO4UVm6UIfWsY6LYtNLneiShHEqAv7PBAdpMCkLrx9aOm
	ohfBlUNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMab-0000000ANcq-1zTt;
	Fri, 22 May 2026 09:54:45 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMaR-0000000ANXS-19G3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 09:54:36 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-82f9fdfc965so3327702b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 02:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779443674; x=1780048474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZzUxIkdaJ6gBxa9mowChRFjkNJFrAHd972GUGZ8zKk=;
        b=Y98IiIBSoi2YHbkfOmm0GobNl8HOU3VSy3IN1daRweoxEXk6Xn231YaP9y5fmVZ7DU
         tur+ny+yYPPtm7FgxOvyM3AOGEYjFSVtFsZlVLbMccqzc5e0gbKwcRf/dmNWa/mwb8ff
         nJKDIQFKvwJFhYLumJtYCytqR37EbgfIFLg2jNvlXrDyb+3qT6oYvvKuE28uK0rhPzhP
         UF7zjHj0nEbzWzPvBtzRvO4uc9l/lglLmwLXpppKJuHoCiB82S3hPVEzZgvR+DxKWcvD
         VqfxC5ZegXKZYC6hWhXMLktDqGmOIGKWeQnIfdhI7GZfNd9FiZs0YMki05yIa6ugQclA
         vzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779443674; x=1780048474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OZzUxIkdaJ6gBxa9mowChRFjkNJFrAHd972GUGZ8zKk=;
        b=PYcW2g5HHVJjOSqPGiQ7SUZF7rlwCZjLfExLrFvIK+8Rf7MvAzPNUDQJZLTiVk/hoJ
         yhhODOK2yiixaZeLE1m1FBrhrm7gvfjL0f5j7AxiRdRhIfPTKcFDNm6D4zG5DLFpA0sp
         M1KMuS0MG/HLfSZPOzWa/cCzn93+SAJl3NB1uhkG3ZkM2NQlZvw3y5pqUm0EI17mYEu2
         1C/uzglpPpVM307MjwFlLMePM1+XpVOIxCKP3VeJZK7XONufRDlK0FC9gD2KzT71TwqE
         mTDzbhGDYXxVWR4I3UNeUFwUqBt4E1NQo1Re3Z71UbLJqx4QyRZhrnZe96v8bWag/hcD
         mQ0g==
X-Forwarded-Encrypted: i=1; AFNElJ9Yu4ySwAB6lO/gR2pDB4AbhYRCoTwC2ke8UhLLQrk5OESka3WvdcXzMVRtbo8DVGxc7u84vvMmxQ3bWj6P6twb@lists.infradead.org
X-Gm-Message-State: AOJu0YwQtRhXvSu4KtlCVPo7CFFOOKKNREYWbtJ0kgNqlRta1aGYtx/+
	EsS5m5zLn57/PrUTkDLPe0+cLFbmL2AMj9EMxMS5Q6DxLP079FNaDIaz
X-Gm-Gg: Acq92OEyvJJM7GEeO7XaJO9rkbILTtDBr/NJo3EgRycHLs2Z4rCg8lIeaIzff3o52pX
	2yZpuR74n1sfwYLvggcP2dwD5oNVAPRPgzIlwtLpyjfscy1Ab9pbiu5Q6b2iitPOeyB3nzyWwHT
	K8rdMaO2qUDWo1XZ7c+Uzs7Ys0QIGKnt8QC2fwQgSWRXRXNxXB/mXk+wcNvY1U12Re9wYflMnrA
	HSP+MXfTRTdmqNvJdwmf+swgYk3UxipQ/8NNBJT+/Epjj3h9arVcw7vCmcDyaXf0xeCE7TM5jUH
	mC5GYVi60YiMVxrIUxiE/wwJjJ0orkJR7E43SxHXAeZNzQMNcqJBwiMQul/6jMm+S3z8Ksmm+6d
	0nlRtVLPmTrwz/Ow2IW5QehE2WK6YFgnfpSWOypAk8RtXnt1zrM+GFvSTEnWE+fX3crUPg/O6hK
	5RlifII1mMeWLwwpXCR5UaMwe7mVJBFxT1j+m25VBkH1x9oey358ShIP7VMw==
X-Received: by 2002:a05:6a00:17a4:b0:82f:5726:be23 with SMTP id d2e1a72fcca58-8415f3f68ccmr3185755b3a.49.1779443674325;
        Fri, 22 May 2026 02:54:34 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164aed7c9sm1757366b3a.13.2026.05.22.02.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 02:54:33 -0700 (PDT)
From: phucduc.bui@gmail.com
To: broonie@kernel.org
Cc: codekipper@gmail.com,
	jernej.skrabec@gmail.com,
	lgirdwood@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	nichen@iscas.ac.cn,
	perex@perex.cz,
	samuel@sholland.org,
	tiwai@suse.com,
	wens@kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 3/3] ASoC: sunxi: sun4i-spdif: Reorder clock enable sequence
Date: Fri, 22 May 2026 16:54:01 +0700
Message-ID: <20260522095401.72915-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522095401.72915-1-phucduc.bui@gmail.com>
References: <20260522095401.72915-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_025435_323379_C8FD1851 
X-CRM114-Status: GOOD (  11.83  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Enable the APB bus clock before the SPDIF module clock
during runtime resume, as register accesses depend on the
bus clock being enabled first.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sunxi/sun4i-spdif.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index f54eb14c9ed8..102db1a2afbb 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -643,15 +643,15 @@ static int sun4i_spdif_runtime_suspend(struct device *dev)
 
 static int sun4i_spdif_runtime_resume(struct device *dev)
 {
-	struct sun4i_spdif_dev *host  = dev_get_drvdata(dev);
+	struct sun4i_spdif_dev *host = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(host->spdif_clk);
+	ret = clk_prepare_enable(host->apb_clk);
 	if (ret)
 		return ret;
-	ret = clk_prepare_enable(host->apb_clk);
+	ret = clk_prepare_enable(host->spdif_clk);
 	if (ret)
-		clk_disable_unprepare(host->spdif_clk);
+		clk_disable_unprepare(host->apb_clk);
 
 	return ret;
 }
-- 
2.43.0


