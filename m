Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B527CA5FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 17:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JDqPmLDFYlB7Z3ktQN/F8KCDkkX79VLLvZgcJBy2TBU=; b=YihzKWyNAD1i7rw0/iev1Jv7A+
	94LE/oTIiY5DmduSaXL1d4+QLxmgO83m7xhc4wE1R/mgAxji0mEUHg/JwbYSpQuE0yjSpSogwe2dq
	ZDl2EljsERUWMkEsAdvuFQ5BJ1LS+VY1I4L8nbfsANKVxjEqvqiW3nbh1r881X2DHOAs4xVXZs0zF
	GX96OGIRc4xfwzAoeyYtkq8ZAGUKpMADI+sXZire3YWtCKxarPcVvnP2rd1+9qS3TLQzUniGJUehW
	dphdU8E6UYr3NvMOYymlqCQeJhcn5y0q7rcM/tKRSY5Y2EMgcxvRqB2FdIIb/OSt+asc/W03xDdDW
	k8GO/nDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKi4-00000009sYP-3M2t;
	Thu, 01 Oct 2026 17:36:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKi2-00000009sVg-1ewL
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Oct 2026 17:36:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JDqPmLDFYlB7Z3ktQN/F8KCDkkX79VLLvZgcJBy2TBU=; b=jkGLx6FlMZFJ+iQ9bpzrmjl/uf
	r9iTbwNr8H6mBa5L2Mo5DdpI0Sx22J9Tcd0/6LPPdpfrIzkR2XmykI7PfijelDazl9adAx10TXfPc
	zMvQD2z+spWCREyhvyykVoBBuPOl0sULf38mZuhc/nHUd4wgvyPGVFSmVMkmQShqai0HXA+r9xvPm
	NFqyDGMaPMcsPU0MsN3J2C5Ie9uJf2THYd3ZpUTJWyY/fUU3tn31psDHQYc9kylqgLmuEbxSEOxD9
	o/6y52zljYfJd2qO+44g064wrZaPOL1Qa1AgwnoYC+W2TK91HTwHqOo8ZeqFPmhmx1OSTMDlVfhAx
	brz5YiNg==;
Received: from out-85.mta1.migadu.com ([95.215.58.85] helo=mta1.migadu.com)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCKhz-00000005GOU-063Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 17:36:41 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=+aL1i0lxNCeiEOWt9v5pY59s5NqU4xro0mHTazEQe6g=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790876196; v=1; x=1791480996;
 b=PGsVk0bAf7E2GjwQqubTwMs9wI2e+lsOvv8WHUkijTxzzr4eJxohuFWFwooi1JKCPIlkvz7E
 THa0cu1Uw/bgZBhyKyAu7qQAt6pLVF4E4+yb3KjFRie0uZWqUtolWGXpPe+XQ3H+5ZVzI+vtCcS
 PMQZfLNgMtO3En55v5mq7gjP38EQpJ50Fa9/W1OJgjLuyhaJ6QRPHhRg+R4fZQ2qzsudW2ygMVS
 9nUcauCBEVapvtgturtDIuSW3LEmnS0UTnE3FtCSitvRIK2Ztls05nPaCfKhOL6YMz3yIZUtdFk
 n/gtInFKXAM43YyO144lHaWEwWZoCdIVTxPSHeRc4SzLg==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 28778f0b3f296ced;
	Thu, 01 Oct 2026 17:36:36 +0000
X-Mizu-Trace-ID: 28778f0b3f296ced
X-Migadu-Flow: FLOW_OUT
From: Diederik de Haas <diederik@cknow-tech.com>
To: Dafna Hirschfeld <dafna@fastmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Jacob Chen <jacob-chen@iotwrt.com>
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>
Subject: [PATCH 2/3] media: rockchip: rga: Switch to modern PM_OPS
Date: Thu,  1 Oct 2026 19:34:52 +0200
Message-ID: <20261001173610.158931-3-diederik@cknow-tech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001173610.158931-1-diederik@cknow-tech.com>
References: <20261001173610.158931-1-diederik@cknow-tech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_183639_415320_BBDC159A 
X-CRM114-Status: GOOD (  15.23  )
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

A new set of modern PM_OPS macros got defined in commit
1a3c7bb08826 ("PM: core: Add new *_PM_OPS macros, deprecate old ones")

Switch to those new macros so that the PM callbacks are always seen by the
compiler, but discarded if not used. This lets us drop the __maybe_unused
annotation from the callback functions.

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 drivers/media/platform/rockchip/rga/rga.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
index b3cb6bf8eb86..f28c93d63760 100644
--- a/drivers/media/platform/rockchip/rga/rga.c
+++ b/drivers/media/platform/rockchip/rga/rga.c
@@ -883,7 +883,7 @@ static void rga_remove(struct platform_device *pdev)
 	pm_runtime_disable(rga->dev);
 }
 
-static int __maybe_unused rga_runtime_suspend(struct device *dev)
+static int rga_runtime_suspend(struct device *dev)
 {
 	struct rockchip_rga *rga = dev_get_drvdata(dev);
 
@@ -892,7 +892,7 @@ static int __maybe_unused rga_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused rga_runtime_resume(struct device *dev)
+static int rga_runtime_resume(struct device *dev)
 {
 	struct rockchip_rga *rga = dev_get_drvdata(dev);
 
@@ -900,8 +900,7 @@ static int __maybe_unused rga_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops rga_pm = {
-	SET_RUNTIME_PM_OPS(rga_runtime_suspend,
-			   rga_runtime_resume, NULL)
+	RUNTIME_PM_OPS(rga_runtime_suspend, rga_runtime_resume, NULL)
 };
 
 static const struct of_device_id rockchip_rga_match[] = {
@@ -927,7 +926,7 @@ static struct platform_driver rga_pdrv = {
 	.remove = rga_remove,
 	.driver = {
 		.name = RGA_NAME,
-		.pm = &rga_pm,
+		.pm = pm_ptr(&rga_pm),
 		.of_match_table = rockchip_rga_match,
 	},
 };
-- 
2.55.0


