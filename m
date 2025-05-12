Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72425C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 08:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oKf9j4izYTToqxyJBnoPFJwtfX8Vyf7TI0IyG8+OfBo=; b=ooiGM8rNDcCR1qctRxhqOLihc4
	gyloMT7gJNMpgc7QDGwgKZI0f9uxirMPW69GHMzfrN1dC3YgGYAPBgsZJhAPC5TBaDJ0YWzVvK/cJ
	PuQyOY82tCws3DllhdXiotqEAOi3LOjH+fWah9YiOfPaxtO/6eu/wQSOVYrb5x6kq5vKGXRgJSQTQ
	sydQJIXGOPHmL8CrVX4QruPBDw8Fxazlsg+9hACA/qcrmpOP3SsyG4Aelt9pzinxtq3eMJuqBjEen
	sEBy5jr8cc480EOQvpmwwsPx08nX0SFOD6IVY2a9ddZvMFrdF+vf23IWg8CuM33E6a+yj9dsHdo2P
	BKHaDWeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOd0-00000008luW-3SQM;
	Mon, 12 May 2025 08:35:14 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEOXi-00000008kxE-1k3j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 May 2025 08:29:48 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a0b9e2d640so3803213f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 May 2025 01:29:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747038585; x=1747643385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oKf9j4izYTToqxyJBnoPFJwtfX8Vyf7TI0IyG8+OfBo=;
        b=kyDGt443Lb0nGE7uq1fXEM2GQJwUrity8iSSQVkWHeRP0uYIK5zirQRsaLINrGqbwH
         L98E+k/mcPVFHwtYK5S/kqLOfzlBSWKt2FCBT36drQZgWjx94379i01ACFSV6GkuNYsm
         ooSI/oWSKQn4hlyQdStNeUvEzbzEEF30QeHCZroLBQvaap0as8xzIP+edI7v/AWKR33m
         eU3/DF8/RVFwyOQJO8GkyzhWedCgOY7GXeDF4l8nnsx5sAyW39QRKPNF4MZdTmouEKwd
         +Zw/2YZuIH+bFLMboWxoFmftbRfgi1tz7XuVSRN/DWZpjx/pdoveT0d7lHtp4jbUxXbq
         pWPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747038585; x=1747643385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKf9j4izYTToqxyJBnoPFJwtfX8Vyf7TI0IyG8+OfBo=;
        b=Z1oSNY1gNLvXReXE7UVQUvl8uMPk/XXPS8EdHn5m3l0XKsBPD8fVWDGpkJloKberN4
         UETCrjZPjnQzinLAQhLf+rrjjk5oX2JhObAmobwvkT3OLlC/KRLsPPkdtStUZtl4IXfo
         9o0C85o8KhMB/MFMypHaG0N9iEa8wGK9kfsuc33SWFIpGUorS6ylPQWT5LJ8nU8ckah8
         T+LlxHMCmLMCGSYCmTJDgDtZe0NkuNFPvuDpwDXR32Mwgu7ZXMijFIstPc51LuKAMyVM
         9ehin23X2XJURQl3B05iWc7ad8KPzy01BwLrqseBL6XUF5pjThQ4D16vuVjCrYvYlQRH
         IBMg==
X-Forwarded-Encrypted: i=1; AJvYcCV8r7XEVD0MEUKyJjXoUSOqwa/hpJqLDyRL3qhY/WO5TWkDHs26QvYV5VOOr+rmm4PgcXH4zTgV1/TfppqNUhjw@lists.infradead.org
X-Gm-Message-State: AOJu0YwpRIZBLwqyJyr478rGeZl7cRNY9ZJjEBIwGbnzhx1XGissu2We
	ZzvTxBLBj1gh/7Om11AJSFVvY3Sv9yNtRK3biCw7CcZ5vIz3/wJbBTFM5XiHIe0=
X-Gm-Gg: ASbGnct99UgXfQkU+SZZE83Q0TqB0sP+QPCSvplIcSJYlrvfDPfNdYoqtWs3AQio04Y
	ZkTKIjLaNr/QYZvkohZa52kpQ6Ms4yK4rehucK+VTautfnqOT3jb5tTTralI77cHvo0vky5mjrr
	CADj4xzFq/2InWGyGZZZ2kg1ZytUAqnxJTwn6imFb4VEA4w1s2WvqA8kBrbl1cQP/zzi6KWCZy4
	TvBu1kud5VtPi9LXGr1BgYi9+f2Kt39VV1hTN4JSBdzfIuFM27X36frDLr7QtIugn3bJFdY7JDb
	IQCRuRmxt79i2MBcHn75Mx+u9x4lpYtFZKAkmC+902VFEu7a7d2gMzBDZk8L5ukQZMM1a5+7BI8
	83QyafY3PHgymtfaVHg==
X-Google-Smtp-Source: AGHT+IGjXf4Unrsm51GneUC4EPZLhzeiZxLlsfKl0xT/3O5OvpeiW/E4y6GXvGgQgbxcg2NnnSkTSw==
X-Received: by 2002:a05:6000:2dc4:b0:3a0:7b07:157 with SMTP id ffacd0b85a97d-3a1f643a5b4mr9645069f8f.9.1747038584869;
        Mon, 12 May 2025 01:29:44 -0700 (PDT)
Received: from localhost (p200300f65f00780800000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f00:7808::1b9])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f5a4c78fsm11763007f8f.97.2025.05.12.01.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 01:29:44 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] PM / devfreq: sun8i-a33-mbus: Fix misconversion to devm_clk_rate_exclusive_get()
Date: Mon, 12 May 2025 10:29:37 +0200
Message-ID: <20250512082938.97110-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1235; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=nsQ1fQPsHSZmJleoO7Mt48MPFFf+ROc5x7XavMNRl9c=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBoIbFyhHzB+aUSUSLbeEfCi7zZNiGMzqylXq1y6 BZtbx09WSaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaCGxcgAKCRCPgPtYfRL+ TjvxCACXb0Ra2nxVT2aRbH4y33njLOk77dLGEOKSuZuC6RvYPXBRJaYPERDFCcN8ThbkctuNlcB 8MzqXk64dU729rhg9d3XRtlK8VVh979WSWXCBdoOQDvYkql6JPq+kvKedRHNWQdqBQ5l+9ZTWGO rqLBa/EzAjtJmrqVKUyiwRgZXCeQapTIvA3sBZh9pDq9WPZKdohivdRkiJ9572ecLjtOAKpnunI feKUi0eYyknRJf/pSh7PMO5sablBeN0xTRGlHaFJwIK2Gb6PpyCjuGQTxIfzcx294uLUdyAopWr NinBeJr4sSRu6NxXB7DatG/3cZGftmm94Nn5KjdyGAIQw12T
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_012946_617056_3CC13D4D 
X-CRM114-Status: GOOD (  14.78  )
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

The patch converting the driver to make more use of devm functions got
one conversion wrong making the driver not compilable any more. I have
no excuse, mea culpa!

Fix this by adding the needed device parameter.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/all/202412070231.MzXdNrLv-lkp@intel.com
Fixes: bc253b28a365 ("PM / devfreq: sun8i-a33-mbus: Simplify by using more devm functions")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/devfreq/sun8i-a33-mbus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/devfreq/sun8i-a33-mbus.c b/drivers/devfreq/sun8i-a33-mbus.c
index f99af530211d..4bd5657558d6 100644
--- a/drivers/devfreq/sun8i-a33-mbus.c
+++ b/drivers/devfreq/sun8i-a33-mbus.c
@@ -381,7 +381,7 @@ static int sun8i_a33_mbus_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret, "failed to lock dram clock rate\n");
 
 	/* Lock the MBUS clock rate to keep MBUS_TMR_PERIOD in sync. */
-	ret = devm_clk_rate_exclusive_get(priv->clk_mbus);
+	ret = devm_clk_rate_exclusive_get(dev, priv->clk_mbus);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to lock mbus clock rate\n");
 
-- 
2.47.2


