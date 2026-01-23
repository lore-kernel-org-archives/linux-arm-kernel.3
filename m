Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8517D72348
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 08:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ht+Axk01jBcc8BkxZA2b6EMz2FfbH25naSWQ7Ih4pBc=; b=RZZw0+a0iKMTxIHL3vbEcRCNVl
	9sBxOXH1QkGV6NVV+RMJcrLOIntPa5V9e2y0yT4Lte254w3d8CvAffHBzlFa1DItcmvvRgntCEN1a
	6sXzAlYoOH2LhxslfNZWS6iODyc7s9x6DJPd5h1Le6A1Zdj7LBsnXrya4vU3fKPoW+pCDsamJefzY
	3UMeCnNfcq3/KbcYxvScyNj2f0iPvm6Iex2X9vt25p+Aoewekw04Zlf3WPaJ+WTou+HCCqhYD5qNN
	UJ8reBwODCfqqOGIuw/Fk5MJhJb5wIrtQJxiK+5gNcUzLLTcpjA7zVXnbmf5u0EfhR7CBcRPQo2ya
	qg/SihcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjC8J-00000008PUP-3bkZ;
	Fri, 23 Jan 2026 08:03:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjC8I-00000008PSq-1UT1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 08:03:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D06160134;
	Fri, 23 Jan 2026 08:03:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22BF7C19425;
	Fri, 23 Jan 2026 08:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769155385;
	bh=Xir6qCWx3Kn1i0hDSDtt04zmgse5Q9Xo6I9ownNJMS0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aTB1bj9ypXRsPTKwVFqV7xOuk8x07YzwHaFj4cIA8GQpq3hJnrH6WgvUB6NKE/xyS
	 stiAF0iVs8c2a2/7gv1Us6ULy3bUk2pdEUhQ+8996WAu5IQG7cg+QaL5CeMN3Oz+1I
	 Wp/FzNXwAweSuI8DDG+TrQB8uOhdZ80le0MDTJVuUhKrLC9W7jfFQO8V6BrRa0C5SJ
	 LYWH4N5cMc4dlHwa15EVMmi2YsZ2qEsSZQZNMGis4a/pl9rxHoeGpXMxhTzfvrQ935
	 6+rrOWDEnSCaY7iAyxyEadtxR5eXdIQetrH30TvrHutPkZ491r072JQ88943hZ+nLJ
	 qI33bJFiiMRBw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10565D72348;
	Fri, 23 Jan 2026 08:03:05 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Fri, 23 Jan 2026 08:02:45 +0000
Subject: [PATCH v3 2/5] i2c: xiic: switch to managed version of mutex_init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-i2c-xiic-v3-2-eb7cd4254dfb@nexthop.ai>
References: <20260123-i2c-xiic-v3-0-eb7cd4254dfb@nexthop.ai>
In-Reply-To: <20260123-i2c-xiic-v3-0-eb7cd4254dfb@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769155384; l=829;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=jX19wNjldXvkgpDnhpI8JjXsRDG7OWfTod3nsZBV2bo=;
 b=OKAesYfKMSjHZqJsxbM+6VRSrcQKeu5XI3rbg7EWS0f4Af49BaJVG/nmff/qmIVwbt+paDW+x
 R+cl09zLzWuACIoSgxvs6nRlqvCtIhtNyDVspfUPhXD0/C64d70dyZP
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
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
Reply-To: abdurrahman@nexthop.ai
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Simplify the error path by switching to a managed version of mutex_init.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 603a246a1445..79643c27e75d 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1461,7 +1461,10 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	snprintf(i2c->adap.name, sizeof(i2c->adap.name),
 		 DRIVER_NAME " %s", pdev->name);
 
-	mutex_init(&i2c->lock);
+	ret = devm_mutex_init(&pdev->dev, &i2c->lock);
+	if (ret < 0)
+		return ret;
+
 	spin_lock_init(&i2c->atomic_lock);
 
 	i2c->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);

-- 
2.52.0



