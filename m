Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ACE6C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 21:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1jpsWQtqNEl1O8ST2vTlmcJR/phkOG8gheLQGm0LM9M=; b=o8UMXvTyjPFlquvQyZax0HAm3y
	48zgttdBhYFgaFHwe6MANZag6HFgzEB0kxXwhkdDVlnGH+ZNPXvGYdSduVxBwedLpBKG8n66rysmG
	7Xr4nBbuGe4M9FlkKZrtrVPr2W8kCCUk0Dc+Hr4s/TqtUmWkKWthNWnVXN/Rcpeztgpl0xksjyl7/
	jKGOZQq8r8J9svE5vEiux/o3gPbz3MwOwckIDIxDyDrJFntILosHvyHALglf40eVOC7eyI0vFHwuG
	awLUS+EK3ogl7vVT+ZxNX3RMahBBp+rMNfjNfbMFmGT5Myh+07FHRzYY2tTX1Fxzk7Z+g9mZji7YU
	7RrVbgXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2F3A-00000000f5V-3XHm;
	Thu, 03 Sep 2026 21:32:48 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2F38-00000000f5B-0gND
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 21:32:47 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2cc891373e0so3181125ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 14:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788471164; x=1789075964; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1jpsWQtqNEl1O8ST2vTlmcJR/phkOG8gheLQGm0LM9M=;
        b=XM03qHUxrsGW2AupEddHQ3lTcmaw+yodJGhaRl3VhUgAD5xuyRDUHSsVBx7uQDncXv
         LhW+YBb/Dzgj8aQUld6aPYzw/TxlH7ylVuV2JASjRhIcH4mzZLamd01e1awj5aTRubQS
         TnSp8mwr/ENKmhZja3xYcIBs9uLpxS7qKvRpgCT+TfQb3FVAk2WGCfz0mEscuIxPAVBx
         3z4BWa5KRmzC81rU/uP5GYGn+zugzCocBjhzKNk0ptP1eNZ40uC+CmXXHlNLacfMtFGg
         PZM/s8sfBP2iYAw//JRykiDbyCw8Ams221JOa9ufskUcJGblwQrLfvanIP0WoPq/3N8/
         q8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788471164; x=1789075964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1jpsWQtqNEl1O8ST2vTlmcJR/phkOG8gheLQGm0LM9M=;
        b=cSngPzn6QYMjz5GtkCnMWre4JqShSs6UCD1RrbVUrbqnRQ6ZJm1Rc6cLNAw+JmZbGs
         ln0/U2vHl0PcDEhUOF73MXyRlCW3ZjWURkkmU/7jhEC0I9Y9bxNn8uo0w71iC3Wjwaib
         qiI8lADVH1KOu8VXJy3NAgdSsxMmbd8m6SPXj8xacA9cAOHI4kRpQaqr8TtDhJN0AfQI
         QgxnPV6pGUJadVGBcPREHapnB0pmxpiMGWIjF3l8dCqlpbeL/BTUBIU29s6RCEAl2fLD
         MzeJgiC7/YjM7EhTnTM3Ih4OTqLKPFsuGWvG1l/5VLNuDCr455rr68/EaxgpybJnvBr4
         aqkA==
X-Forwarded-Encrypted: i=1; AKwUvBzAK0fScmKRbLZ8WP7k2chFsbZOSCH8ubmN0DVcsVRNrQXVrkZ9ArpyB7SfNnkrNGNxru6++ZX1wS2sTp1IG+nA@lists.infradead.org
X-Gm-Message-State: AFuF++ljHEq2Anb6T598WsskoS3HBkhjmzvFnR6JO52h8AytNtWHbriz
	muc9AoCua+mxYWAsHnS8SDqWIAyBJGKaZ8tLHb/LRAZVCXLuiAruWF96
X-Gm-Gg: AYBFou3awQKwJt52vHUXigslvk+hFJqEIHG0LiehfWQu83hPeMRpOgiTi54ew04IGOZ
	jw5ab9m85BuQBQh2ERwnS3VdabiLzLQmxKNNLxEyvYs+/MjRJ2QqnKrkKlU/2LImgStue54Gw4B
	/t6UM/ZptdjPvrcrGKq6WYJo5lnq7juxHbVaVhuk/0Z18NLtv9FiQPQY76jLiiVEjgmNrTmgcfi
	DlOjmVGEwd2UtjtE1Rpz4Mx5vw4Wgc6GRAO/6+ebZsIyJC0ZLU9nR8enMnSAcI3i34bICeM9zoC
	pute0MqLpgUEoZEkYVqOYqJe728n+h0BUMJrtLLwTGt7vUBhIIIiCq+e7WHfGPHngoqQFtn9Rfe
	P47GzW78EbAFphmh+6CrK+UqvtulRIOPdcN3asDXTzSlRlipYRnbMexqZ2iXAocCiy2buAC9FqY
	vTvRMpXTv7PNDpxga/ImXx0L79zPYQ2qG2QyV3jaiZhzfEyJ5eD+SzcAEgcQlrPyRPhFpQrnX73
	ilXa3KuztIXq469Dyqm1fcVnE1w86L1L/lMihe6Os7jQRThY93zK1UllvI36J2chf70hvyTLJGd
	ov8GHIQuK10EPDlRwD/QBtHekxsTd0ggKJlPXA==
X-Received: by 2002:a17:903:3c64:b0:2d5:2f49:b3de with SMTP id d9443c01a7336-2db1212f15amr28987405ad.0.1788471164358;
        Thu, 03 Sep 2026 14:32:44 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14845142sm1296195ad.5.2026.09.03.14.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 14:32:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Esben Haabendal <esben@geanix.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv3 net] net: ll_temac: Return actual error from of_get_mac_address()
Date: Thu,  3 Sep 2026 14:32:41 -0700
Message-ID: <20260903213241.1040204-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_143246_202942_1C9D37C0 
X-CRM114-Status: GOOD (  13.08  )
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

When of_get_mac_address() fails, return the actual error code (rc)
instead of the hardcoded -ENODEV. This preserves the original error
information, which may be more specific (e.g., -EINVAL, -EPROBE_DEFER)
and helps callers handle the failure appropriately.

Use dev_err_probe() to avoid printing an extra error message in case of
-EPROBE_DEFER.

Fixes: 8425c41d1ef7 ("net: ll_temac: Extend support to non-device-tree platforms")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v3: actually use dev_err_probe()
 v2: use dev_err_probe()
 drivers/net/ethernet/xilinx/ll_temac_main.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/ll_temac_main.c b/drivers/net/ethernet/xilinx/ll_temac_main.c
index 711ed9c2631b..ea0f54e4df27 100644
--- a/drivers/net/ethernet/xilinx/ll_temac_main.c
+++ b/drivers/net/ethernet/xilinx/ll_temac_main.c
@@ -1579,10 +1579,8 @@ static int temac_probe(struct platform_device *pdev)
 	if (temac_np) {
 		/* Retrieve the MAC address */
 		rc = of_get_mac_address(temac_np, addr);
-		if (rc) {
-			dev_err(&pdev->dev, "could not find MAC address\n");
-			return -ENODEV;
-		}
+		if (rc)
+			return dev_err_probe(&pdev->dev, rc, "could not find MAC address\n");
 		temac_init_mac_address(ndev, addr);
 	} else if (pdata) {
 		temac_init_mac_address(ndev, pdata->mac_addr);
-- 
2.55.0


