Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3498E6C5E5
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 01:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hywco0EOZS8UPtB5JNfLuOnac/kvQFRPXPjTcGdkjTc=; b=MUT6cbd3u4VWu3HiiKrnV+aV9g
	1iyCcNHGksnioPIymANN4bPn1+pcXiVf7UL2sXDmhY/rkx+D9eOMizCUHatbQqgJpPKqVejO9qOMQ
	FhHmS6ursP9ryMeeAWvzXegyBDtkybyFDis4Bvc4Aap3lwJpL4V5izNYRP0eHO3Uyn0PsWCU56cMK
	enJ2IsmhVti/3cnu1yBo6wZ2R7mgMZOjQMc7WUx6Uc+9SyFOiil3FULXUN0u1EvM6wsc1HBAqsGwr
	UI/EsZrntjmCA5Qq6wuBzcQv7r7RpQUGPqQu15We/rjbmsNwf0EcJKE2+hCJNhboAV2fbr8wRygoN
	muWadpWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIHq0-00000007w62-48Op;
	Tue, 03 Dec 2024 01:36:28 +0000
Received: from mail-m25482.xmail.ntesmail.com ([103.129.254.82])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIHoz-00000007w1R-2qw0;
	Tue, 03 Dec 2024 01:35:28 +0000
Received: from rockchip.. (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 47ff938a;
	Tue, 3 Dec 2024 09:35:15 +0800 (GMT+08:00)
From: Jon Lin <jon.lin@rock-chips.com>
To: broonie@kernel.org
Cc: linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	heiko@sntech.de,
	jon.lin@rock-chips.com,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org
Subject: [PATCH] spi: rockchip-sfc: Optimize the judgment mechanism completed by the controller
Date: Tue,  3 Dec 2024 09:35:13 +0800
Message-Id: <20241203013513.2628810-1-jon.lin@rock-chips.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQh9KQ1YZTUtLS0NDSkJLGk9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a938a28453909d9kunm47ff938a
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NT46Mjo6KDIaThAMMzYuCQoX
	URMaCUpVSlVKTEhISkNCTEpNSEpMVTMWGhIXVREUFVUXEhU7CRQYEFYYExILCFUYFBZFWVdZEgtZ
	QVlOQ1VJSVVMVUpKT1lXWQgBWUFKS0xNNwY+
DKIM-Signature: a=rsa-sha256;
	b=jfakQW/DxzWDCeZTFJ2qwv2/HsVuQYqgzlaPYegq/OXq4isHh+F6aAHyLpNRSw4WLNvJsq4pAnNrWnXWq7n8ufzjxVUWIVUEycO5veT9MxLfRRv4/UZQgLvROOjRtjTeXvX1MbmYZKf4Bjjzb3JdKB6hEGWulwKbSrPtO7vWLfg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=hywco0EOZS8UPtB5JNfLuOnac/kvQFRPXPjTcGdkjTc=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_173526_242846_E1F3145E 
X-CRM114-Status: UNSURE (   8.74  )
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

There is very little data left in fifo, and the controller will
complete the transmission in a short period of time, so
use readl_poll_timeout() for busy wait 10us to accelerate response.

Signed-off-by: Jon Lin <jon.lin@rock-chips.com>
---

 drivers/spi/spi-rockchip-sfc.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/spi/spi-rockchip-sfc.c b/drivers/spi/spi-rockchip-sfc.c
index 138508d2c736..14f5b9346050 100644
--- a/drivers/spi/spi-rockchip-sfc.c
+++ b/drivers/spi/spi-rockchip-sfc.c
@@ -472,6 +472,16 @@ static int rockchip_sfc_xfer_done(struct rockchip_sfc *sfc, u32 timeout_us)
 	int ret = 0;
 	u32 status;
 
+	/*
+	 * There is very little data left in fifo, and the controller will
+	 * complete the transmission in a short period of time.
+	 */
+	ret = readl_poll_timeout(sfc->regbase + SFC_SR, status,
+				 !(status & SFC_SR_IS_BUSY),
+				 0, 10);
+	if (!ret)
+		return 0;
+
 	ret = readl_poll_timeout(sfc->regbase + SFC_SR, status,
 				 !(status & SFC_SR_IS_BUSY),
 				 20, timeout_us);
-- 
2.34.1


