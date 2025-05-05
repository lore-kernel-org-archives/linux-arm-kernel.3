Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D25C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 23:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itPZAH1kJAzQulrtw+aFR7P8i3T6Z1JydRbcxl2AKD4=; b=Rhhd8KESx9cB5WrZk06ZzqjDHM
	IOpXrb558qArxPur3JFkMtjtSZB8JY213PDwbYq8IbVoEdnH0IbC5BZFKVX6JdptBvG5voh0ZasKB
	9JxXj/4zAywIQaxR8rDLrqKcVRp9ddFHBc42f6ot+f6i/N9Qkw45Kprtut/BI3N9/EtMEJbqAkgp4
	XV7S5qLgdGMxnUWVs2V4q4838ot9oQ6P+6VuiND5CYbEAQaNUoobNoRF0dQHApqJwYquISIq3YMuz
	7pnpdCe0xm0c/HRnDBS1UzByksMYAzUMsfMVPO/LgxBXblucSb1W6f8EJdFg0S/C2oXehpu0klnB2
	2dGo3dSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC58h-000000091sE-2jkR;
	Mon, 05 May 2025 23:22:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC4Dv-00000008k46-2krl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 22:23:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF2915C55E8;
	Mon,  5 May 2025 22:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDA57C4CEF2;
	Mon,  5 May 2025 22:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483822;
	bh=qH/4V8g1hOBeR0gSsV5ofqM5SOOS8OTnIZ+lszszT/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XyFhZJcHKi4Rzq0SqOnyhx3K91mFnhI2TNrWQXp92NdtonoK6X1fDaMSGVPn3SSGg
	 NxGFZa86FdW9iE5K2BPTrgeO0Dc9r/k6YBUdTS20KfPCDATJb8jZq/cCsmVSSLiEAh
	 /GPDDgp0t2zxkKDsCvCfdI0Osi8VkdFG1yPiKsFdcAbdsGw406+z/2mc9GK8FrmKbF
	 +R8c7rbAS0eKSUsJajfxwd95nMiYha588MQtKYkaUInrpPJnNpygTlHFLjD0Ak7UEG
	 0NQ51wVu0NSxxjpfPGjtcEjStSO4CJYKIdYQi1UyUL4D1/S1pxrYG1E9EcISWVuWED
	 +pVonX0FuMt/g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Markus Elfring <elfring@users.sourceforge.net>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>,
	patrice.chotard@foss.st.com,
	mchehab@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org
Subject: [PATCH AUTOSEL 6.14 235/642] media: c8sectpfe: Call of_node_put(i2c_bus) only once in c8sectpfe_probe()
Date: Mon,  5 May 2025 18:07:31 -0400
Message-Id: <20250505221419.2672473-235-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_152343_738256_1A3F4457 
X-CRM114-Status: GOOD (  12.27  )
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

From: Markus Elfring <elfring@users.sourceforge.net>

[ Upstream commit b773530a34df0687020520015057075f8b7b4ac4 ]

An of_node_put(i2c_bus) call was immediately used after a pointer check
for an of_find_i2c_adapter_by_node() call in this function implementation.
Thus call such a function only once instead directly before the check.

This issue was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
Signed-off-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
index 7b3a37957e3ae..d151d2ed1f64b 100644
--- a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
+++ b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
@@ -797,13 +797,12 @@ static int c8sectpfe_probe(struct platform_device *pdev)
 		}
 		tsin->i2c_adapter =
 			of_find_i2c_adapter_by_node(i2c_bus);
+		of_node_put(i2c_bus);
 		if (!tsin->i2c_adapter) {
 			dev_err(&pdev->dev, "No i2c adapter found\n");
-			of_node_put(i2c_bus);
 			ret = -ENODEV;
 			goto err_node_put;
 		}
-		of_node_put(i2c_bus);
 
 		/* Acquire reset GPIO and activate it */
 		tsin->rst_gpio = devm_fwnode_gpiod_get(dev,
-- 
2.39.5


