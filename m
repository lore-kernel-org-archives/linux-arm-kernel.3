Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C26CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 09:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vdspRS+hKmJQmW0Wsieo4FX+5eK/WlAigCd6WtBtyGk=; b=cMaidoB1q+nfnSoBW635TdBmft
	8A6mAxIdB6EqgEEcHn62hh+0K5Ll0QsxzgA9WNqcE38/k3+MZyXgCt2K2ZCebiZGmYMDpnJI/0Jdq
	I9NjNuwXbWobJpKrQSB5pvWN45UsXQ8k7oLXX0QoNlaozIZXfjal10cHTS72QvtS0g1JJE1GPgd0o
	QVLy/ETLOLhe1K8lD7RdUEqZea/cII9SEu34P9z9uM4kpCeWlrKfo4cq0bcSrvhcrttH5UskhsN1A
	v0rAeY+Hwt29B3n6j53oHkw6jEJ7Hk00owMPMOeDSzT3T1Mj837EjmTXoerVa5NmgNWpyLiQ4YO3n
	hVaaUMRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMbq-0000000ANxa-3FVy;
	Fri, 22 May 2026 09:56:02 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQMbm-0000000ANw6-1ANg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 09:55:59 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-82fa8d6425bso3274124b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 02:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779443757; x=1780048557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vdspRS+hKmJQmW0Wsieo4FX+5eK/WlAigCd6WtBtyGk=;
        b=IZxYudqcYg4xsy6KTyUB5JSUf93mXt2yBQFdZBAVSra+wPe7VfbQLezDLYfJNYrViC
         9Vcb3Y+GDvefRX+/2vooTwHGmZiraFGzGOouJsJmtl+fKpzOJI7Jg0ExbZbRpBcy74oW
         eNQloMnNlsr9zJOgx9yDKGRqtyVAd/UKglJtgD6k5J3Xq0hcxRxuEobVqGnZLKN9/B+h
         L8tIGK+h/tTew25ZU2XzD3BTHAkDNbiGG3VIn36UmD4eAkHGAT1KYDXjakrK50AD9vKj
         AdoqFHm6ERH2i5QD+JYJcSqbTx4Dy/M3NQk0krG8gk5zwsnHC5iheWACCEgyp8RVabvY
         xgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779443757; x=1780048557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdspRS+hKmJQmW0Wsieo4FX+5eK/WlAigCd6WtBtyGk=;
        b=bFMEQBaZTd0TsdMKh0UO9GeEleHJ18Fyj4TFA5z4xONuLMXSi1LksjkuA92eZJQN7D
         JjddCbT0fH2Yz5pNMWd/P6kI6pGvsFuJVj3G+cNjwvleOPd/FPdJRFZmglwvTpmODXdD
         p3j/VCgzQ8Wst8cMyB9Ki/ejk98wVk/kL/movRb2aV4q6XBlf/yHfoTpj536EwKC3Dhn
         2nygEDkl+Fh5uI7WAABzLK8YCDnQQHaXCUhKQRI0nGL9IAKIKe9UGDkM0dma+rX6i+oA
         +JkzEefBApnn0QgvMxPgoaxWc3zMgJIo1c5IUvsaZkNcT0e18Pnoief6p1dWPYewJxS0
         kv3g==
X-Forwarded-Encrypted: i=1; AFNElJ8goZdF880EgGjPy7z9iP74p6SiXyA8d39huyZMTytIjzKkfOck93E+O4j8IuZPxWEFpTeMuXtQ2u27xsth4W7j@lists.infradead.org
X-Gm-Message-State: AOJu0YyeWjmhSZN1xLlrUWdC2Nt/pF7F9N/GmUVpSRI0qiwjBG6jIq33
	VsALH79E2BK6yOBtZcPIsN5830yGag4at1SJfHl+UOOV/ycFTDdCkZQU
X-Gm-Gg: Acq92OGjT7rmWzAzqbnNoyN6ssqEV/0wlSp9V0G/b3SM9YhTdI1bg9+H+jNh6Uotp+t
	vQ90P2KdA7h1S1BXjR7bLAFThY9/UejXR2ZMEhmmhwiT1S1AC4pMssCPlYy68XL9BoVL5J/r8wy
	4+VYeKjuFIUdkbLdz7ul8AJ1S/bOY4zGW2kLMqYVD0OEs/NML8DjA3dW7Nm0xYSw4aPb62MCrSx
	N4XtsBuVrsrcLM7aJMD6Y5VDb9OzVPv+mzwC3iiAHpXMa6i110EZTa+H9sFb25LwZFd8wCM8OOG
	NHnlVKvhzwaRk6BFQvWaYB5AOlLOAUyo6EGlxGLW4G84qfd9poMY6esf6TOH0V5nLAwheJz+K4B
	O10bsoaeq0HAXQuBUeO/ii/qeSsPeKi4czvSgRulbKJkPRW02smAuT/jMG32T4i1d7stPLVm6re
	mxfd5fzn3G0jIopsoITRzbN2i0HklyfQ3F4IGUIvoinvctHxmSOiirL+kJpJpf5iW353fV
X-Received: by 2002:a05:6a00:3020:b0:837:e9cc:d470 with SMTP id d2e1a72fcca58-8415f330e98mr3144147b3a.20.1779443757359;
        Fri, 22 May 2026 02:55:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fe0bb8sm1338786b3a.51.2026.05.22.02.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 02:55:57 -0700 (PDT)
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
Subject: [PATCH] ASoC: sunxi: sun50i-dmic: Reorder clock enable sequence
Date: Fri, 22 May 2026 16:55:39 +0700
Message-ID: <20260522095539.73025-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_025558_323569_30F698E4 
X-CRM114-Status: GOOD (  11.74  )
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

Enable the bus clock before the DMIC module clock during
runtime resume.
The bus clock provides the register access interface and
should be enabled before the module clock.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/sunxi/sun50i-dmic.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
index eddfebe16616..7aff1afdf265 100644
--- a/sound/soc/sunxi/sun50i-dmic.c
+++ b/sound/soc/sunxi/sun50i-dmic.c
@@ -323,16 +323,16 @@ static int sun50i_dmic_runtime_suspend(struct device *dev)
 
 static int sun50i_dmic_runtime_resume(struct device *dev)
 {
-	struct sun50i_dmic_dev *host  = dev_get_drvdata(dev);
+	struct sun50i_dmic_dev *host = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(host->dmic_clk);
+	ret = clk_prepare_enable(host->bus_clk);
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(host->bus_clk);
+	ret = clk_prepare_enable(host->dmic_clk);
 	if (ret) {
-		clk_disable_unprepare(host->dmic_clk);
+		clk_disable_unprepare(host->bus_clk);
 		return ret;
 	}
 
-- 
2.43.0


