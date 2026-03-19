Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659D3108E1E2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 11:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zC6Y1AkSSP6gBbG0k4SbZrnCH1NvYvCklVNqT+RHEM0=; b=REEtcMfmNlMubDumFdh8DbVzuP
	wpSQCZF6b7IMHD7EFTGXp1JK7/6mGCBsUsSjSCc0qA1gfQXHoeR1Ir3oYrdrh7f4gND+G+A5Z/pSP
	W9jo/7m7UFgSk/wSS19u+/nCadFyBrV0qPJkc3KHE0cvwdSMOOv2/Erqj5X9D/UKtVZ4mAkP6e1oQ
	5Zt9bW6xTkYMdmy26no/kkgn8RNDQ9Oosc9dmGbwzIh1/Ib/TWDgAn23fnoiBQPHMeWS5hW6fV9UX
	DgOvtwOM6qahWGGjQAWZLPnC+rWpqW1ZGTlrEo3bbgFHuhMnnREnB5QO8UScVCI2uKd2LP+ZUnepf
	KfIFiftQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3B75-0000000ATKn-1TFL;
	Thu, 19 Mar 2026 11:00:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3B74-0000000ATJw-2p1J
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 19 Mar 2026 11:00:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=zC6Y1AkSSP6gBbG0k4SbZrnCH1NvYvCklVNqT+RHEM0=; b=EDxJSt5T9kJZLOn6GA4AQEbUta
	GHB8MQYcYHrxieU1k/sjq2SsOfP44iMADBpw8AQ0jBzeo0M9sk7o2ZrK3ieHvo6Gb6LgV2ryApMF9
	ZuOb/XzzLZMSDEU8XdQ0Yf5gNC0ZG/t5WUs+PJcOaTwjh2ndozvCyhtHwzUXhEHF+TrM/YD5l4n3G
	shY4jM+KcfdQ324GomNmHbDYSVg9cPNFACi0CGDblnOSO0cAh2OegagGIzyFR0bfpxYcz972u0PGz
	TxbgyZYDoY+KV6W/MNm/+wzwKAQOwNfnVEydqz5/qICks+8TEPC859LFV/237vBMSrG4T2ebnreHZ
	N6OVzclg==;
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3B71-0000000DIyT-2dcp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 11:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=zC6Y1AkSSP6gBbG0k4SbZrnCH1NvYvCklVNqT+RHEM0=; b=Vef3M3
	MZMMYT8RPLvd1Eq3WmfHKWQqATDW/hmqBvASwumh4Xnf6rfnsqDsKQ1HKRxN3h6L
	LU6FLsKYCdaNhYJgjiK7rMbRKWjRVTxHt/WTrf5VVe0MDCFQr/V6i6FZfKnXLgVs
	AAsiZodPtcmrySpT31FfDHmqNx0F1k658iF49PvAoam5g68okZpRZ73E/D5cRLGv
	Dmbm4q4P/d9lza9egT98n0pl/H4o1blkUhORZ659TK3DnaBYPwEQi9ivbVTx3TjB
	wFoK9R9Q5SdYeY7k8Zr1YuFHMslXdvD1JTWPZCAWaWtGIwO2fpEhEmmdG0MZTCWL
	/Ss4U0a0ZWgnyXvg==
Received: (qmail 1099649 invoked from network); 19 Mar 2026 12:00:00 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Mar 2026 12:00:00 +0100
X-UD-Smtp-Session: l3s3148p1@d9dHeF5NcpsgAwDPXzF+ANZpdrMKUeLI
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v5 09/15] hwspinlock: sun6i: use new callback to initialize hwspinlock priv
Date: Thu, 19 Mar 2026 11:59:31 +0100
Message-ID: <20260319105947.6237-10-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
References: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_110023_811017_9D538605 
X-CRM114-Status: GOOD (  12.51  )
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
Remove superfluous setting of drvdata while here.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/hwspinlock/sun6i_hwspinlock.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/hwspinlock/sun6i_hwspinlock.c b/drivers/hwspinlock/sun6i_hwspinlock.c
index a0c76bba3f05..c3db81cb1793 100644
--- a/drivers/hwspinlock/sun6i_hwspinlock.c
+++ b/drivers/hwspinlock/sun6i_hwspinlock.c
@@ -74,9 +74,15 @@ static void sun6i_hwspinlock_unlock(struct hwspinlock *lock)
 	writel(SPINLOCK_NOTTAKEN, lock_addr);
 }
 
+static void *sun6i_hwspinlock_init_priv(int local_id, void *init_data)
+{
+	return init_data + sizeof(u32) * local_id;
+}
+
 static const struct hwspinlock_ops sun6i_hwspinlock_ops = {
 	.trylock	= sun6i_hwspinlock_trylock,
 	.unlock		= sun6i_hwspinlock_unlock,
+	.init_priv	= sun6i_hwspinlock_init_priv,
 };
 
 static void sun6i_hwspinlock_disable(void *data)
@@ -91,10 +97,9 @@ static void sun6i_hwspinlock_disable(void *data)
 static int sun6i_hwspinlock_probe(struct platform_device *pdev)
 {
 	struct sun6i_hwspinlock_data *priv;
-	struct hwspinlock *hwlock;
 	void __iomem *io_base;
 	u32 num_banks;
-	int err, i;
+	int err;
 
 	io_base = devm_platform_ioremap_resource(pdev, SPINLOCK_BASE_ID);
 	if (IS_ERR(io_base))
@@ -161,11 +166,6 @@ static int sun6i_hwspinlock_probe(struct platform_device *pdev)
 		goto bank_fail;
 	}
 
-	for (i = 0; i < priv->nlocks; ++i) {
-		hwlock = &priv->bank->lock[i];
-		hwlock->priv = io_base + SPINLOCK_LOCK_REGN + sizeof(u32) * i;
-	}
-
 	/* failure of debugfs is considered non-fatal */
 	sun6i_hwspinlock_debugfs_init(priv);
 	if (IS_ERR(priv->debugfs))
@@ -177,10 +177,8 @@ static int sun6i_hwspinlock_probe(struct platform_device *pdev)
 		goto bank_fail;
 	}
 
-	platform_set_drvdata(pdev, priv);
-
 	return devm_hwspin_lock_register(&pdev->dev, priv->bank, &sun6i_hwspinlock_ops,
-					 SPINLOCK_BASE_ID, priv->nlocks, NULL);
+					 SPINLOCK_BASE_ID, priv->nlocks, io_base + SPINLOCK_LOCK_REGN);
 
 bank_fail:
 	clk_disable_unprepare(priv->ahb_clk);
-- 
2.51.0


