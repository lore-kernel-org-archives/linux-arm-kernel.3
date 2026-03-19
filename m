Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F81108E1E2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 11:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJPnV6sWCqcikZmuYtUvxsV1HgXNWyKzDo8+0458in4=; b=Rk5OadoXMom2URJPLnaT75rmg0
	JbWXVaUuCgxkJABjQ4EOn9AE70KSuTohpdniNz/AWICWv46fRNGw1IxkV46K7xCsanKsgxJc76bud
	3EFZsWwmpmr+znQNg+A+nIAzMK43AQJR1FVefqdQA/jQ9rbswrM44UCgVKlkKaHnCKxPv6nBO7ZBd
	4c8q7Gvfo+00Xz22jYy32u3OpAkZ86Us/8AYnsrze4SXT4ALhqxjd3k3nEb41k9xtyzv5qIesDeK1
	FTjYYCFT1wbUVPVNVANIi3qA9DV9MaKBaXK9Dj53D2jdPr4twV9G+ITrf4pEg+7Nf7uEv5Kx890gE
	3EMgNxSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3B7A-0000000ATNu-0tiO;
	Thu, 19 Mar 2026 11:00:32 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3B73-0000000ATJW-3V8A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 11:00:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=zJPnV6sWCqcikZmuYtUvxsV1HgXNWyKzDo8+0458in4=; b=i3a2eK
	DxSBMURYHxV4OXoM+UKykTDNhOCzRHayQxgVcIUd+QIen0ieRn56eQCrHfQvUD4R
	uKZN/6u1fTHyr9YMdeKvdk/VWP4tz4AwGIVh4ZSuVDKTzGIy6zZy2W4jcYfNWH2Q
	4BDHHl5PW96xUcmGZq6EdSohg46AJr+0HpY6PC8wGT3z1PLjF/yMaSIRFLCPgmyE
	C5jJw/5W5DEdIfrxFYvlGpqYWbdqDA/GwcvC/Fco3N4voWMu3ZzML0Rr/JlCYHNn
	WqYuE1gq6Z6BLTBY9g3nXbniafKoA7lhbRGUVXV1KWffXQuzsuvsrH0iA6jmp3ba
	nvywWZbfAF3MKLPg==
Received: (qmail 1099602 invoked from network); 19 Mar 2026 11:59:59 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Mar 2026 11:59:59 +0100
X-UD-Smtp-Session: l3s3148p1@PFs7eF5NbJsgAwDPXzF+ANZpdrMKUeLI
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-remoteproc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 08/15] hwspinlock: stm32: use new callback to initialize hwspinlock priv
Date: Thu, 19 Mar 2026 11:59:30 +0100
Message-ID: <20260319105947.6237-9-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
References: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_040026_161641_5E2EFE80 
X-CRM114-Status: GOOD (  13.53  )
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

Apply the new helper to avoid using internal structures from the core.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/stm32_hwspinlock.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/hwspinlock/stm32_hwspinlock.c b/drivers/hwspinlock/stm32_hwspinlock.c
index 51e8e533ac31..62214f31f909 100644
--- a/drivers/hwspinlock/stm32_hwspinlock.c
+++ b/drivers/hwspinlock/stm32_hwspinlock.c
@@ -48,10 +48,16 @@ static void stm32_hwspinlock_relax(struct hwspinlock *lock)
 	ndelay(50);
 }
 
+static void *stm32_hwspinlock_init_priv(int local_id, void *init_data)
+{
+	return init_data + local_id * sizeof(u32);
+}
+
 static const struct hwspinlock_ops stm32_hwspinlock_ops = {
 	.trylock	= stm32_hwspinlock_trylock,
 	.unlock		= stm32_hwspinlock_unlock,
 	.relax		= stm32_hwspinlock_relax,
+	.init_priv	= stm32_hwspinlock_init_priv,
 };
 
 static void stm32_hwspinlock_disable_clk(void *data)
@@ -73,7 +79,7 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct stm32_hwspinlock *hw;
 	void __iomem *io_base;
-	int i, ret;
+	int ret;
 
 	io_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(io_base))
@@ -106,11 +112,8 @@ static int stm32_hwspinlock_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	for (i = 0; i < STM32_MUTEX_NUM_LOCKS; i++)
-		hw->bank.lock[i].priv = io_base + i * sizeof(u32);
-
 	ret = devm_hwspin_lock_register(dev, &hw->bank, &stm32_hwspinlock_ops,
-					0, STM32_MUTEX_NUM_LOCKS, NULL);
+					0, STM32_MUTEX_NUM_LOCKS, io_base);
 
 	if (ret)
 		dev_err(dev, "Failed to register hwspinlock\n");
-- 
2.51.0


