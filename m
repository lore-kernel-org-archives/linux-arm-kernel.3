Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4071C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 17:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zr96JgiP4egzaGIJKICX4lchZUuxQ9WiGvVqK3+0YdM=; b=iiow9qk5XQ/TN7RIZ/fhD7ROue
	zb/MFnhphASZ8UZXxYxHzEfUAIricOjCLdV9/gDTYAss4KP6//W7pp1rD9kwp6bsU0pFNdHCBGSFj
	J4t0tADQj9cSDtMrbwe4KakpK1su0KE/NdSAVnIFbmdxLwKBcwbUK+HsfNInKkOupn2eHjkuqlUYp
	gF5N+pqJsgWxFjJM9ykT8mZ7LqKxD5lPaIdl/WrxxSYthO6Kzz5j3iQ40CCTUB6Nb7LP5m0sbDRfe
	KY6+dVxVQ2pQUam+zg/kkTJki3ca4Ot312uHFocyFYDcmIPHqiRkkpgpou9tYurItsHpk0UJfqy9q
	vtcctCkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whs6g-000000034xH-49TQ;
	Thu, 09 Jul 2026 17:00:14 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whs6b-000000034rX-0kpo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 17:00:10 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-470174001a0so102852f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 10:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616407; x=1784221207; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zr96JgiP4egzaGIJKICX4lchZUuxQ9WiGvVqK3+0YdM=;
        b=hg/UwgmzJVSXa9vTSWEODmqUxs+of83EXqRRkwY6/+IRRp7ZqNi3SDea4CWT+q8+/8
         XWIDYZbVqgROCfJ3u0+AT4hEgQ6cYFd6mPOb1qmrYGEcU4tpNibxnVmBdE2VYpP6phwW
         anhWFDqDSvuqOvIlkHsA7CFTcbPgrjjkj7gCgK61f8tgcd3YUc19syiplOUMuOWidbPn
         z7V7nu6NbbFZA7HMyvZjJx1dK1kYK1RE/ifzhvhwaO6OLMv10XImJJxFujICKZyrMI88
         nYrWdYFqLyERDR07GjukZQKqcFiPHTo/dD/A986EJnusDlDo7m/Cm0BB7y7bFfTnPsoF
         UZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616407; x=1784221207;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zr96JgiP4egzaGIJKICX4lchZUuxQ9WiGvVqK3+0YdM=;
        b=rOu+ZeV1wqNhGqziIO7g8upAVfkLgMH1aUDtMMlheE4wXLdwC4OEbu1qvoxnoJTsT/
         dyruV2CQexNsNkl0kg9ztiiLlVvycqdMkITUrMX/iZ1/xnr4hzXewUq0YfRCJUFQgYtO
         mMGC3PmR6g2m/c4nWQqvGp/rcQdu1yDfA2faftAi9oSvROSucbMCS61fYWaITzvcUy8J
         OlHBn7BfY7LYHAB46Xjcwf66hCUhvS4FidF7KMOfI7i20Zdx7M3UFAjWLhQTxLJv3P1x
         BYG20z9cIJw8iKaoUllxuaqQlHDo9m3HgfkEHqoG9vxQHc2azam0gAgGTVFwE7zTLw7g
         izCg==
X-Forwarded-Encrypted: i=1; AHgh+RoIkgyQ+8DNUg/RJ2qafiWf8knr17KuNQ/vlW3HC5XQ4ddN/GDYbvgKQfZB4mBHqe+D6HB63MEr2shOdhyWL9LJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyRTHyHg1TDC6pi8TyrFqbRNzPKAli8F5cOnpIV3Cqk4lupeB7r
	2HqoC8YgdJ7Ubsfa/S/RLWAsSLLDhTGhCtY7zdYfpFmXxHLUyeYU2xyDJEaDGdzh5uI=
X-Gm-Gg: AfdE7cmWjx6hDcEEKF0c+kG/fXQsNK7KVzVE4g52i1Etf+43AdocYpif9FP5th6rZGD
	e2yhqAK4dJ9Qpr5ROC3UyRetMRR5EI7vyThXmHTFsfDgYtQUI460RtXPDBy3IhiAFFcUOb6dKZL
	B6NgZkoqTei4upmO5blTJw2wx6BycC4RvPQ8DmSFGfrCug8LPWsu1Dn4R1DeQe/OFcBn3eBshxA
	8XumtQE5ayg3osuMIKPd4j4+VD/u2FWvm2c9jKRdlE4pimlveEuqSJW3i0vbegBJBDKhyftFImu
	dHOcg+zDaVeW8o1n+ZGervD+Mbj0iLFZxG9BxS+38WnQnpbkJNSdGmTqUny+Fkr2/HUGPBTt4yi
	8HdhKDW4pbwp7PStl4OHAWeJVekYxixUooX7o94QnxRLdZXdFYBIawdiCmC+OHs/02NpQfHQZSA
	5YO/xvm0iVf4d/1QiHeTqZusxjYgoYmSYI5s/IteXYolzXk1hhnF0aooSAkRcYUdY6XSd7fXIuQ
	H+6
X-Received: by 2002:a05:6000:2f81:b0:475:f0f0:9ed0 with SMTP id ffacd0b85a97d-47df081bb63mr8593347f8f.59.1783616407119;
        Thu, 09 Jul 2026 10:00:07 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9de1d8f1sm53469385f8f.3.2026.07.09.10.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:00:06 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 05/23] mfd: mt6360: Drop irrelevant __maybe_unused
Date: Thu,  9 Jul 2026 18:58:24 +0200
Message-ID: <bd2ff9c736d422e2e93c5d2f07d570d3488799d7.1783615311.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=992; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=RMStdZg/15uHp9XX3CRWrZzbzmqyNCoBwi5HiHoruCA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqT9M8JlySz7FGFfwSGIY044anhaWqL/9WnrZx1 qOveDYaMkCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak/TPAAKCRCPgPtYfRL+ TvQNB/4q2FKUoVolCJF7p3hPnCwnzgNfIwJLyGp0BQt+1XtRgmPT0eZuO0XuJCzHM5w7dR1dPX3 pOfWT/lqjZAn6Hs5OLuUtrim+2RiflnV4MHzbDQTLmB0tXfkdZ7ore0haDWYdzXTCLjaAPMbeu+ 1fb7iyZAoO2QLpTfVRYchd7ahUItAR2/xAlCAli4YDyNUYLz7/6pS5X4EDokt0vyL179m/AWEUx AL6j/fLuLhLpUQfdCeYZHlBpjbDrVLmLcfgySNY8MmYu7x09aXaYX1zOrq2LeED6FPx+Ll+rt9O rCEetzIJbkffTs7pDO1oHSkMt8xcVTQoMb5Krc/cEiNM6ETd
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_100009_237518_C788C12F 
X-CRM114-Status: GOOD (  13.44  )
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

Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
modules") MODULE_DEVICE_TABLE() is enough to reference a device id array
even if the driver is built-in. So mt6360_of_id[] is always used and the
__maybe_unused marker serves no purpose and can be dropped.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/mt6360-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index b9b1036c8ff4..254b00c905b7 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -606,7 +606,7 @@ static int __maybe_unused mt6360_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(mt6360_pm_ops, mt6360_suspend, mt6360_resume);
 
-static const struct of_device_id __maybe_unused mt6360_of_id[] = {
+static const struct of_device_id mt6360_of_id[] = {
 	{ .compatible = "mediatek,mt6360", },
 	{},
 };
-- 
2.55.0.11.g153666a7d9bb


