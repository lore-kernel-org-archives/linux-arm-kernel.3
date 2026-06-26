Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF62CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 08:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WV5yYAQhu5LuQKYBaN1uWFLZmyuh5tReudUkrHR0RRI=; b=goR80IJgIVpmiFWEGAQb1YHKPo
	FOK3SGocfohrksfNyLWBtF9E7ZIWUgiJbxzwtGiIBh7mRha80BwC3aCG1TZRfAnjBGXVRRDhHhk6K
	bokZ5mL17u8qBVfzpDpl18LJNV+DYYgLwC93KH+pGt2UIRiyo3tvncCFa+WgjRoTS+6nJ73eNgzWR
	RK44c7sXJHOhtjybQXWDXI0HaIN/AkENrEJM8uLfBQZyHPTgoKhmyvkzG59fAR7a1IV4vTD0qwclJ
	Ujt0IkawpVqZDgpFnaEp6OsezpXr1uLqfRJ0sHHjMMv+WsOcaLk1D08HWld6qYk+djrlRG3hA0e/A
	0hqkVQtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1qI-0000000AqDS-1yt4;
	Fri, 26 Jun 2026 08:23:18 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1q2-0000000Aq4O-3KRv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 08:23:05 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2c81d799ef2so1158875ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 01:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782462182; x=1783066982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WV5yYAQhu5LuQKYBaN1uWFLZmyuh5tReudUkrHR0RRI=;
        b=JwWOq1IoCu9LpsBAP7h7ES4bll+M5la8H32XshJr8yfIT07Sv457Jofqmuq58q+AjB
         wEwVuizYmHndmiyDbntLAmc6g1/McqSWTeKP3Dmr/VXCkeTeTcdrXnOWz5xI20CNWBAL
         NFLS54Faelscr7c2hWSKN4JlRa4BSc2Xrvbis=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782462182; x=1783066982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WV5yYAQhu5LuQKYBaN1uWFLZmyuh5tReudUkrHR0RRI=;
        b=V/Yopo8N+6Ah4iyjJ3CmY0PxI28pvUHWkx9nwfF+43TywxXnZc3TLbTUca3IeE2WU9
         0Ss2oS5hAM3a1VrTwpHnq/lMtVbJN8YR0DCTq5gxX1Kq5tjvs4swl3Sa4ocOEp0MN6a7
         s6TfqmCNTywd2/B264BE9CrBalVgiJIkfgtjQXH/NVU+019YYvv4Ce5wS+iQpRi7YF/D
         0vLe3jqg9EPbTIpW6tE79npIjRcWlikmejAUxvnDhpGa5lWs3vJX55oMqnf12o2LmhD6
         JGI7RDoQtdywhmrL1owUjeLs6GGPFdUe+6CGWrWU9Z8q/MbCuNMoOGUNy+ORAkReIzEF
         QEhQ==
X-Forwarded-Encrypted: i=1; AHgh+RqyPpsow0iUJjpyLI2BjBTwFO5AJ9ok9nNjKpaIZERKsCg0DCa6EADSqZ2aa1GMAkZrUSHhdtZ/gBbMRJO/h91e@lists.infradead.org
X-Gm-Message-State: AOJu0YwSdYM3CANDXcLQC+B7IezxwCMH8x1LdLl1CeWo4s/UBeIMqVry
	gkU4pVZpGajtrUZfsz40V6tmR6uUNGwrYDf3qrYwba/a5jDNzY5HHX84lyDg318tjA==
X-Gm-Gg: AfdE7cmRkObEfB2USpu1SbtmbPCdPttr0xXgiLIaK2Jcwf76UJNlrtb/bA4gJw83H6H
	tj4O9g3u3OKmJdq58S/HFGlsBGE/PPcXRMyCQ+1enwkzVI1Zk3Yaa74+yeCwa6fH6uT058Z9VA4
	z0GWxAI3Y3J6mTRxJLaagPJtm8qtuUfkaEb23h6W9jNIgLEffPdCIcmtklfo3BW6O6Oby2l2uir
	ghggP/n/FjVJ8EqWXf7ijoj6VlcwSsMAiKzsKtO0rjp4jazBW7cGaijicwWpx5CUNg3ZE8H0x6Y
	10KouDz8mPrDD6p1M2GsvdRdUTbIcrB3655RRdhmesJn/tJjkkN/X5OsD2jfeAGadXQcu1eCuXt
	h+KH33vWiw/4eVU7t8VK1W9DM394kDPT1dZOBv8aaKMFdgl10yfWxtZNpwVBpB9d5TG+lvtgoR+
	/9svGDPRaVnctPb2QuUWEtMV6vBHTpVij8apTPp4qjM6+VFLwxetlofa+EWyLIQhfVVCOFW7ab/
	ilyrfC+CQ==
X-Received: by 2002:a17:903:1ce:b0:2c2:75c4:4b0f with SMTP id d9443c01a7336-2c7fc70a32dmr65200675ad.2.1782462181768;
        Fri, 26 Jun 2026 01:23:01 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2a00:79e0:201d:8:2593:3e55:e36c:f47d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f64dcc30sm34619185ad.66.2026.06.26.01.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 01:23:01 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Fei Shao <fshao@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 1/2] usb: mtu3: allow system suspend during active gadget connection
Date: Fri, 26 Jun 2026 16:21:51 +0800
Message-ID: <20260626082218.2750459-2-fshao@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260626082218.2750459-1-fshao@chromium.org>
References: <20260626082218.2750459-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_012304_439065_078ACE20 
X-CRM114-Status: GOOD (  12.73  )
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

When operating in gadget mode connected to a USB host, system suspend
fails with -EBUSY because active peripheral connections block suspend
entry.

Fix this by restricting the -EBUSY check to runtime autosuspend
(PMSG_IS_AUTO). For system suspend (!PMSG_IS_AUTO), perform soft
disconnect to disconnect from the bus and allow MAC sleep.

Fixes: 427c66422e14 ("usb: mtu3: support suspend/resume for device mode")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/usb/mtu3/mtu3_core.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
index 66dbfe1705d5..a40bf5bad2d5 100644
--- a/drivers/usb/mtu3/mtu3_core.c
+++ b/drivers/usb/mtu3/mtu3_core.c
@@ -1037,9 +1037,14 @@ int ssusb_gadget_suspend(struct ssusb_mtk *ssusb, pm_message_t msg)
 	if (!mtu->gadget_driver)
 		return 0;
 
-	if (mtu->connected)
+	/* Prevent runtime suspend when active connection exists */
+	if (mtu->connected && PMSG_IS_AUTO(msg))
 		return -EBUSY;
 
+	/* Perform soft disconnect for system suspend */
+	if (mtu->softconnect && !PMSG_IS_AUTO(msg))
+		mtu3_dev_on_off(mtu, 0);
+
 	mtu3_dev_suspend(mtu);
 	synchronize_irq(mtu->irq);
 
@@ -1055,5 +1060,9 @@ int ssusb_gadget_resume(struct ssusb_mtk *ssusb, pm_message_t msg)
 
 	mtu3_dev_resume(mtu);
 
+	/* Restore soft connect for system resume */
+	if (mtu->softconnect && !PMSG_IS_AUTO(msg))
+		mtu3_dev_on_off(mtu, 1);
+
 	return 0;
 }
-- 
2.55.0.rc0.799.gd6f94ed593-goog


