Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74747FD0048
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 07:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1y12jkKvqEPCOLPo3R+Q3mFyBRLHL7GmyTtHyjpWdEc=; b=kazmfcawjT9ko4/SNrhgDix1KD
	hpJXv6pJPE+2oQ6FQX1k95GN8+sIFy+KlUphxjZNkOyToWjhmPnVEuI8L9p+6LcVvEJLWiR1kAc3O
	3S84z+l6yr4mTAxZs3/biityRj+SKLatm+KSPe/ZR2Kqu12T/9n3HB/YZfRVXGgFmqWvg1Oxnwf/W
	8BR9jakARJsDRdQ2CY63Ug0WieL6dOYezx55iblC14L3yNTt1j6kDVXYUbSeX62IR/6tpDjOL+1bq
	GjynKipXMOgl50h6mhFmog1wRkoJhJ4U2dcNUAs0c1cYP6xwfbwzxm+JkMebdyWQZ0rcPTJqakmcN
	J6LIJlWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwbcP-0000000Avso-2Nlz;
	Sun, 01 Mar 2026 07:53:37 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwbcN-0000000AvsT-0yNt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 07:53:36 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2aadc18f230so23445985ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 23:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772351614; x=1772956414; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1y12jkKvqEPCOLPo3R+Q3mFyBRLHL7GmyTtHyjpWdEc=;
        b=aVrGMILveKJfe9fWGsvNxB269vFbGmdOmRqzSW/6xO4VNEDDGwI4UOvMuqKpBf5Sep
         dty6i/e9dwpMb78wLv/Gk6Z4goleAqD//a/0/Dxja10qcrEc+dFNl5hbmBFgb1/hpAEE
         3rVPSD/aSPYF3lGHB4yL8jffjkI/u+qJuNilGtp6Pvtf6z/3NVGncyNzKKc13+E/l5mg
         kQJu3tz0nP4h66oGKvGf92GmUsOPYUG0bbqUbXuX5VqyOpdIgnSI7lSyKYc5Op2HdFpa
         lf4tkqdTdtqF2PDoJXw2OBO4X0OqfFiZncPjfy6aPWrOaeCSHPGLL2eWqHc3/jB3+W6q
         xgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772351614; x=1772956414;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1y12jkKvqEPCOLPo3R+Q3mFyBRLHL7GmyTtHyjpWdEc=;
        b=K5jVW1l0LXMF1BdkFkQbSjY8nsZQYCcJ0w24dlyFMdcI49f8YtbrONGNNPJ4NB1ZiI
         8Qvb0deKEnDBNPNQpiQZUQhX3pA3WjvT/nGE7L+vzfhKhH1xBFHe/OJsMzB+H8QETXIt
         mVO31vF1TA8dJVLE+S/aryU061/+7VHSrc37ES0v0bN+FYyz2GNmkdustT/0Yt1pvXcx
         37NYJPgfh8BevUUrVMDANaOwlnSL2YuGnLehFM+gK6S1xnclWXqeyT5UcB1q+A20k7JR
         lIreX8bDllGNBoz8+Uw/LGe4KiNQffMZCCOIfA/yWXeGsLvA4lrwuAenrNKVJhz2c4Uj
         euUw==
X-Gm-Message-State: AOJu0YyZKDNUR9zbh7GnOUySQ7kFaHyNzNiNze+MyDdDXpp/8BZYIEFy
	4gMQgu/2/Fukv7M/pE6PCnkjtBsQlEnw6ktI69N9d0r9iRf7U97Xnvnt
X-Gm-Gg: ATEYQzw/Fz4bTkaZVhV67nX72S/eCryHSSsL0pISyh4WE9KniWZhTEJx51jFn8dwsnD
	oDilN4wgtpjGve0utSBbOX0Ar1rvX/lCwJyqrydGP4MyW/X0GMxFEbKLsYGhlzBNIbTey/JO6jh
	h4AQ3aTx6xca0OiIb8gIUXZCJzV6N3mBqkcb0dyhEGechVtzHQHHJ7l6W9f71i5zvSl08dIfENr
	pmj+4NiTwmwlmiUSo8lEpMzNlgPUQpgZuOXscRuuxvEZIFc5klzdiYG32dnq2MPQlVE46rdOrnM
	xFGYrEgoXg03hd4mZOSdso5t1LbmDm1F7ddA1Wyp+xA/JqUboIf2etbU75tmPliNDlZu+Wu5tDh
	X5+tK4vixsn9P2+4UzvmxMQUUSUBlw7iAh8LwUKfsiSkMr8WDUkwRJQanH4lf4ZY+TDUNDYUeED
	jWnjfA2G17SsRqOYMHKVokadWXclbokWWpsOvB
X-Received: by 2002:a17:902:da8f:b0:2a9:3396:738 with SMTP id d9443c01a7336-2ae2e4bb21emr91976115ad.44.1772351613828;
        Sat, 28 Feb 2026 23:53:33 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9009:3f2:fcc8:844a:f21c:8d7f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae4802645bsm13880405ad.12.2026.02.28.23.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Feb 2026 23:53:33 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 01 Mar 2026 15:53:30 +0800
Subject: [PATCH] mmc: sdhci-of-bst: Fix memory leak in
 sdhci_bst_alloc_bounce_buffer()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-bst-v1-1-ddbc22ec3ed9@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHnwo2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwND3aTiEl1zs6Qk82SzFHNLY0MloMqCotS0zAqwKdGxtbUAngFKnFU
 AAAA=
X-Change-ID: 20260301-bst-76bb7c6d7931
To: Adrian Hunter <adrian.hunter@intel.com>, Ge Gordon <gordon.ge@bst.ai>, 
 BST Linux Kernel Upstream Group <bst-upstream@bstai.top>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Albert Yang <yangzh0906@thundersoft.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772351611; l=1293;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=GLqdJ8P4hnRg5xWVxei1kADlcf95wZLXVGRFECegirs=;
 b=nI+wepdJSqBs2819GnK68eBfJYYFxHgaxoTIcEXYEiaBLm88VbliuCG45Uer5NNESZdCpZr1v
 0BjLo7aGC7ADEyjGCLkyl1oGy8Lhmz8eMKT/wU6M6HbMOaCWIV9SlZw
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_235335_282431_A6AAED13 
X-CRM114-Status: GOOD (  12.06  )
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

In sdhci_bst_alloc_bounce_buffer(), if dma_alloc_coherent() fails, the
function immediately returns -ENOMEM without releasing the reserved
memory, which results in a memory leak.

Add the missing of_reserved_mem_device_release() call before returning
-ENOMEM to properly clean up the reserved memory.

Fixes: 695824f45629 ("mmc: sdhci: add Black Sesame Technologies BST C1200 controller driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/mmc/host/sdhci-of-bst.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-of-bst.c b/drivers/mmc/host/sdhci-of-bst.c
index c124990a64f4..79c945f4858e 100644
--- a/drivers/mmc/host/sdhci-of-bst.c
+++ b/drivers/mmc/host/sdhci-of-bst.c
@@ -425,8 +425,10 @@ static int sdhci_bst_alloc_bounce_buffer(struct sdhci_host *host)
 
 	host->bounce_buffer = dma_alloc_coherent(mmc_dev(mmc), bounce_size,
 						 &host->bounce_addr, GFP_KERNEL);
-	if (!host->bounce_buffer)
+	if (!host->bounce_buffer) {
+		of_reserved_mem_device_release(mmc_dev(host->mmc));
 		return -ENOMEM;
+	}
 
 	host->bounce_buffer_size = bounce_size;
 

---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260301-bst-76bb7c6d7931

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


