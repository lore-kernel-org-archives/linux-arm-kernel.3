Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3CE106286C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 11:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=udVtyloGxZeqWyr14s5QxGkEjgrrq4lgXJZIZ8YNjM4=; b=aQ/lZqV0s/lfbjm4satzR9pEF8
	b7wH5uBmB+NLge6cRDjox0RD6cutX2k9I8zYGwGktYIB+03eZnc7YnkFVfgbvOoavv+ShEYWjiVjX
	MbVwArapjLRTllafSimR49uQ9QtvhoIhAA4bZ9GlZWPMxOoAIRd/sN5fzThn8V/c63n659CBi1cWB
	KychKYbYwt6CVqVGNlkLODWEH8QdNrPzdoZ16Psjj+VzQVORzdmenNOxLouNCxm2gYxfufmOsFHbn
	Ca1aeUU5nAyAkUMmJwPEd0mTVfH21FVYV2GYNIWa0DYNI3KhkCDkwtnaJ38Iw2T7aUwlsSCc8PYZl
	HXpO+X5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0I2m-0000000BVhp-11hg;
	Wed, 11 Mar 2026 11:48:04 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0I2j-0000000BVgP-3RTp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 11:48:02 +0000
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C42E882A;
	Wed, 11 Mar 2026 12:46:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773229611;
	bh=ofUAbbHRyPHF2+WZMsyv4sIjIxWIo36tBn4si/5B2oM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FKE1l2s4Of5i0HqjjK8dCromhjXVGu3GCseyNJOf+dZBoc+BHnwqxlcihU9m62kXm
	 dVcWJY4C429LGjMCg1S+EoBw0t9ks9pt1Gzl/e4bW0tdVPHKOUA6rDtpzBsnlk6wg5
	 1eLJwdCAzJBlAmTacYN57BUnG9nVVP8PsP8H7gXA=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Wed, 11 Mar 2026 11:47:44 +0000
Subject: [PATCH 2/2] i2c: imx: Retry failed transfers 3 times
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-i2c-imx-fixes-v1-2-e625034d8202@ideasonboard.com>
References: <20260311-i2c-imx-fixes-v1-0-e625034d8202@ideasonboard.com>
In-Reply-To: <20260311-i2c-imx-fixes-v1-0-e625034d8202@ideasonboard.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=899;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=ofUAbbHRyPHF2+WZMsyv4sIjIxWIo36tBn4si/5B2oM=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBpsVZsuZ91wkDZMsDS7+YdrSbe3ydk0V4fQTsFG
 an/LR2EMguJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCabFWbAAKCRDISVd6bEV1
 MtE7D/wKSfPxBRaS79FrKe7SK3ziz80lAe/tsm2IRlziuO+Sc9Yd61+5gREcH4wVpk3mc03JSR7
 0+/KMpkRryzCD/MjQeLKGRxuZLmrsFguCItFzlIUtzTKeAOUnCKDtfLL4XQutfMZ40g1C0trGP4
 kGP59Vc/cv73SQ7+6pxpGCzMPMiXs8Q6MJLm7GfrUIGCDqEiKPH6EQWU0lFZkuQEP83sNHZCx5K
 0gCRHlSctwMeQeiNErAw6NOlTC11xw9zF5ku/+HcYcd371R8fZEM5mbbazGpMdC4R42SSYEw9Ti
 vnoqasFP198wsFsfu/VjljpaOIxmkJe5DNR4H1TSq6YM0mVuzMA/X9cuuZlnBAWbG8Y4dd0jrUs
 XraLh/Av61DXCol201fEHXg8/XfTRndarVzP3wNn/2y4Ok9c2LmnWDoudPoYUW0DZ0CoRq79Z0F
 rhKzaRGXi23r07k7b40PxIkaQ4D/t3xGuL2U91bSiatwrtYseG1dKBeNSLs3t3kS41L9pOwGamz
 qNQQp14oQDVlyscZ+F6vZ1iMJgdO/P/Bkc9oKJ5m/CN/Id2QennMIxdrwizMufwc061w6d98vlK
 dVdudAd1yJmS/qhhfc3I86AuMuCWUZyBkD8MC1rf3h00aFjiY3T7841z9RHtDHxUv5rpF7VrIgJ
 uHg+a0eUj624aRA==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_044802_002206_15C2CE32 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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

Set the retries member of the i2c_adapter to 3, which will cause the
i2c-core code to retry transfers that lose arbitration 3 times before
giving up.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/i2c/busses/i2c-imx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index ed2316ab1ba8b6261dabe8af4377136a002e2f0b..fc807b4c19137b9451796d009094b26da59e8799 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1736,6 +1736,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	i2c_imx->adapter.dev.parent	= &pdev->dev;
 	i2c_imx->adapter.nr		= pdev->id;
 	i2c_imx->adapter.dev.of_node	= pdev->dev.of_node;
+	i2c_imx->adapter.retries	= 3;
 	i2c_imx->base			= base;
 	ACPI_COMPANION_SET(&i2c_imx->adapter.dev, ACPI_COMPANION(&pdev->dev));
 

-- 
2.43.0


