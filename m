Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB38106286C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 11:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HrjHSTa9JR3D20EPiyQHrtVUOWnoPldzyabk67FAT7c=; b=qIgpElVuIIk6oDyKxbwhd2ZJQP
	zKB+dl7RmrRzXJ2VRgBc4R20Pb4ZBr15kBIzz9gXq5LwdW2XS090EDp7O+1qVuxottKa2RWaN82qV
	ozbpdmBfDamx2CN4XMI+H7MjF3sJkmcB5y3UOyqA1IMmedJRCtFlbgCK4m7bURijZMvKEVVpkBL1A
	QWTsXM0TymZgd83ZWGojvy8lI8+k927aKzyfG5dJ7hJMNCKcSngaRr0jbYAN/jw4CwU6qMCNeSmZd
	8cg7dPnu/oCQdzSqdten61KFFquMIwe4TPclY/4RKIm7rXeeUHeesgIY/pxKzz2zz0YXjNUoMEdJu
	d+J7tZxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0I2q-0000000BVjA-2Fhh;
	Wed, 11 Mar 2026 11:48:08 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0I2k-0000000BVgQ-0rYm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 11:48:03 +0000
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DB4E5A5;
	Wed, 11 Mar 2026 12:46:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773229610;
	bh=UpCdeoAotGFrzkbYhdGq7UuCNNLz9pTlfRWi1V4zvJM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=V7FvJweq9I2Ub2vi//0H24rq99e0STd4Uu6nu30lgaHagplXRcYKlwgcj/CmD4R6u
	 f3NYRxnkRqYNUSSH3Bmra/cqz31FhX1nfqsASFvoomzhOAlXN40BuXCaUTXdRAoMte
	 ZhZcTi+h/NULlAR5jX5IvpoXIrMOg4hyjtPpPp6Y=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Wed, 11 Mar 2026 11:47:43 +0000
Subject: [PATCH 1/2] i2c: imx: Don't recover bus when arbitration lost
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-i2c-imx-fixes-v1-1-e625034d8202@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1009;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=UpCdeoAotGFrzkbYhdGq7UuCNNLz9pTlfRWi1V4zvJM=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBpsVZsIm9LnM5mRYvkLs6V3NTDX/SVzP3hLpQQR
 5VARND2QaOJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCabFWbAAKCRDISVd6bEV1
 MvZ4EACq6m83vIvK4eB+hyCgQ843YkE736URpfMxpMVWqHcjkb+poNcAV11cPph7LEsbU5qAPbb
 epyZ9JYYI9097b6+aSaIjmfc12zVMDV/3s2y1KHAWW4r6G0BBgHWXj+U7zOtwHBUgnhSCn5VHSF
 +ryJ5tiFauTD1EPI9ti2aA0r07nmv7HNNoOXFMB+0OBh/+doH+UL+xysmwH3X91b73iOVh5lnBM
 eCMLYYRBHd3GKVazRsunj0QF9O3OP2gVDONQiTIA+Kyo5+H+8rCXb1xZW06ri5apZ/ZhoN1V4YG
 UNCs+KUYxeYGj6R/t0SwHnWFSavdgw3duMX7OjmNFtgeTWf54cXT62zo4xbyKghqYyHc9HhyjvY
 ka/7gvJWhuRUC2TZjMTnYV6tcV8ybqEklYgnkypElJ022E7NcxUOl8RixqFu0Zpzi0jiuJN8XjH
 53eDplG2f2r+nBYcLU7Xod5ahQaegX3cSX0ZUrxeY+vTBJQ9yiWA/Eajog2/g8h1pWU/UZ60eAH
 C6e8WBqGON7/5KAvpsQj15WlkbLzl3kwusrP59J++w7l2r+AvbQ2T7OXm5j1k5TQpWJ0kCmhmPN
 a6LgpbzA7LikBf+SutHXE6Oq6Qb96OPnrOAUPguGbjAOfT1rZnwOTjXqgPqebxmCGWzYmyXgMvt
 0DP1VJ2hqbr19Eg==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_044802_406312_9DD38C91 
X-CRM114-Status: GOOD (  12.08  )
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

The i2c-imx driver runs i2c_recover_bus() if i2c_imx_start() fails.
One of the failure modes is an arbitration-lost signal from the
hardware however, to which bus recovery is not the right response.

Do not try to recover the bus if it loses arbitration during start.

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/i2c/busses/i2c-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 85f554044cf1eec7d28310c3d9e7a7346237afdb..ed2316ab1ba8b6261dabe8af4377136a002e2f0b 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1539,7 +1539,7 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
 
 	/* Start I2C transfer */
 	result = i2c_imx_start(i2c_imx, atomic);
-	if (result) {
+	if (result && result != -EAGAIN) {
 		/*
 		 * Bus recovery uses gpiod_get_value_cansleep() which is not
 		 * allowed within atomic context.

-- 
2.43.0


