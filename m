Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F8DBCA9ECF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 19:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iHHZH59qV3EnqbOQ3vYmK0JHZ+tuhXSFnyosgBQqvFQ=; b=zuyzghCMWB3rG3xWaBoke7KN4I
	a1hGCLdochJOhN+PGaXsG2qeresJAyfAexkFuxLHAlQXKX7Lxci0v6SPZT8TkghoHXvjO+OQ8VZTv
	a/4y/ZrB49dN7aOK3CGavgodUzHiu3M8Z0XovvQEkB4FwaxLEExRgJfqyX7qCwKUT5wQJ+EWW3YAY
	0hWHa6rLbCCMhAqtOqe4bR7DLlzaSXIUMlLn+7YYx2tMaiBpgpMQ90JZyFMSLbYlMCX/tJC8NV+Lz
	jZ3c3C0isc1kMmgXWu4z5pGTj/2WLFaMXgijg9a8H5gXVtVWhjAd69F2nAJaeke6AfX6yxo792ChL
	p7lKO8mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFzfE-00000009N7U-3xSm;
	Sun, 11 Oct 2026 19:56:56 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFzfA-00000009N6y-2kmP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 19:56:56 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-91968804af0so16473116d6.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 12:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791748610; x=1792353410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iHHZH59qV3EnqbOQ3vYmK0JHZ+tuhXSFnyosgBQqvFQ=;
        b=DvGwcGXQ2npGI+ljm2euJpyksH62Vv8Njr/X6VrJAvgbEDEOx2424wX0iCm/c1EFK4
         QuOlC8EB5qSAb6MQiykKwjGiGAKmyEy5xyTAuHIwkxdZqudmTxvcKuI1jFBzSRhe4E+R
         TtWnBwiblb00qx7AS1NeY28J+Jl9T8UA0u4deNb5LOXmVkUqWRcXDBFSUejhBJTuoGfI
         c4I/p/C04DLisDWDrTIlZyxabHaxAaZ0P1TYsX234vJPQ4CMYR5E6M/C7Z6VhFaptvx/
         qCezV5t83yPddOmPkZ15zRrHC1OVlL1LoSQ1gFeAi77ox+IHIq+xGEA+H2peg5SeB2Kk
         t9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791748610; x=1792353410;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iHHZH59qV3EnqbOQ3vYmK0JHZ+tuhXSFnyosgBQqvFQ=;
        b=arOPPHGVjZD3kglJlccJ5B3IzVNXgbiA7P6dfflbsPiIHRpOmp6cg14A5Z33Mtoef3
         FMdbZ61soe+jD3s2gu/y2J9n4y+gxUh+xtJFVKRNIcoUO3K+IW7snBZiAGkOBrHLIc9F
         Lxli2St3fmhxKl12BIjQ3qD++QBDM97uLj4wfxNV/GUU2evtAdcYjVUIgvAGxjXpYSeK
         GwocAZ2MWyVO35TqjQZl/cr4N5NiyObwsT6vCLwYDGxch2JxIJ/ZAKRLEGL/nlBoD+Xu
         WkE4b4jB70D5e/W1jcoaCKps1637usBuJ8NAi7y6Z68CMcCJoA+P7XbDFcJ6SsuKyrhl
         yFWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzvLvVXG1J145mvY68PDUGStqiw9DAQFfjBD/+LEr2V+m6yDQwppm8RopK59DiSevqUUnWIjslYLG/zTFj8z+5u@lists.infradead.org
X-Gm-Message-State: AFq9FYI3mz0JM5Uqs5OebmnMfvx3jXaICo032PgiHdKS+TmiTDDRDoPO
	F4RGoZtQmqCSE9jOXlZSipVlFFIvbjHbPY/yR5tQtZEgvszK0fri1KQ=
X-Gm-Gg: AYBFou3SOB4PnA3kAJW4xHxdmTLFVRdAnG0baIbMfsuXhBE3y/a5opl2xWSoe8dYzH8
	KULmy7M1GAep7zv7ApTbiUak6uYHV1zsK3DSV0lp8+gg8QFrQO3j8Rvm6EkmPL91vQvgKyS9Ahm
	M1FUl/4EJLjYxaM/SD6hlW8h+qrSH2UQDjhA7IpzgXlItl+w6avBKm/rkZQExfdo003O9k8YR4D
	hLR5qnz3aRWsLfTIVe7LGTEowG50lTdDVwa5tFF4xfr6ZWc25u/fWv4nLs1tK3MOFhSpsGPBSU9
	TzgXLQdJgvGAGRZcIJUC/SKXpyvGnsL5y1n+C7B9XXUalLq+QmkuAAziwQ0VQNLh/0lGsSiDXXn
	ztHFbiB4q0ZhxoeFIqUj9gfqDZBiv+vBVdXHP8lB8N6EDV3/TKhDPE+nBq1K/99dLk6WKqljAT/
	gEpiGbymdYJQxJp+sSd3GmBm38sNtfdPA+idceXrdThmO0b4MzFSiCsEIbHRybTjlHMULlWW2UC
	62uvqo19JNbbYiCVO3NILZHASryzyvb5Embbf3j4kKCFBLy5Bm3b5f6d4/7TNJtsg7LtLtHpuIa
	OQ7BW++4f2xwOlBR29l7x2G81S8Ar0fQxjab6No=
X-Received: by 2002:a05:6214:498e:b0:91b:5d3b:4acc with SMTP id 6a1803df08f44-91b5d3b4e26mr149047996d6.53.1791748610213;
        Sun, 11 Oct 2026 12:56:50 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b550dfb6csm77651326d6.45.2026.10.11.12.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 12:56:49 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Eddie James <eajames@linux.ibm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	linux-media@vger.kernel.org,
	openbmc@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: aspeed: disable resolution work before removing the device
Date: Sun, 11 Oct 2026 15:56:45 -0400
Message-ID: <179174852932.3.2170255507797724902.G64@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_125654_665596_AF7E3A7D 
X-CRM114-Status: GOOD (  11.22  )
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

A resolution-change interrupt schedules res_work. The worker enables the
video engine clocks, initializes registers and detects the resolution.
It can also queue a V4L2 event or restart frame capture. The remove path
shuts down the engine and releases resources without cancelling or
waiting for this work, so the worker can undo the shutdown or access
resources after they have been released.

Disable and drain res_work before turning the engine off. This cancels
pending work, waits for a running worker and prevents the IRQ handler
from queuing the work again. Keep the clocks and IRQ handler available
during the wait because resolution detection can wait for an IRQ.

This issue was found by static analysis.

Fixes: d2b4387f3bdf ("media: platform: Add Aspeed Video Engine driver")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with GCC, W=1 (arm64). No runtime testing.

 drivers/media/platform/aspeed/aspeed-video.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index a292275..4274b90 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -2360,6 +2360,7 @@ static void aspeed_video_remove(struct platform_device *pdev)
 	struct v4l2_device *v4l2_dev = dev_get_drvdata(dev);
 	struct aspeed_video *video = to_aspeed_video(v4l2_dev);
 
+	disable_delayed_work_sync(&video->res_work);
 	aspeed_video_off(video);
 
 	aspeed_video_debugfs_remove(video);

