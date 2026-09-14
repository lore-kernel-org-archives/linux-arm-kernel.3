Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 762D2C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 09:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wvFBiMkRGjwoloZbq9nwDlVvLI1OyRNq467fT53sktU=; b=OkBe34U2Wu1uEZmWMuRP6Hw7YO
	ZsECsGG0SR06PIkwGaH+YUhNDWnhLrXgRfUDfp1BO4OaOdZeI7kHD1k9bUsECddZflHJ6xE/w1AXc
	5AWU4+EsY9ri7Tt+vdEQypCqQPVQcqSJz5WEq1D4pegqgyJEBiIBYUHKiziOGmypSAZxdXXvrcVXY
	6g0M7P0mAvRYpLTNN56+mseib2MHKcEuS9vjya812vyu/SN1MvoIkcRHgIAucy5r+XwUD3jce9TO/
	vcCdcYNr59jLOYcNeEtSmqRCQcvlFlwobkvDYm7EKinVgTcLjGMB87Vm5KyVZ2vklj9x7ILgCXLVI
	XW/JmlzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62f0-00000002rrV-11WW;
	Mon, 14 Sep 2026 09:07:34 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62ey-00000002rqn-2ifo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 09:07:33 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-869d181419bso2790622b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 02:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789376851; x=1789981651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wvFBiMkRGjwoloZbq9nwDlVvLI1OyRNq467fT53sktU=;
        b=WhcQ03c4tbYIdUL+n5IYX6KHQ10njfniq870w7z9L3whLL6JIcRwM9AGLsHYSgsu9d
         ctvOH4ig4k7ZK7CCRPmm4gV8VpjA0kM/BMHtq/kQmBeyhSUz0HumFxec2j/5U5eZ1Tbl
         OQZrtD96fESzTN1w66u4p3JWKQkYYeMkxM4vcJHwXgiW9g0PKfXaEhjJyQHF/EP7IwmB
         NznYbBlswJkFQmX+EdzhswKwZ9CQ2XbvjpBkLW0aBlbeUJROnc6Dc9gWbPqzi5qx8a1v
         yLkjGZLMgUbZBxcB3dHzeDuHCCcfYPcf6DN/mE67cybNhrQetPgwBALhdBPT5lBWWIUV
         MEsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789376851; x=1789981651;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wvFBiMkRGjwoloZbq9nwDlVvLI1OyRNq467fT53sktU=;
        b=I95fKvXx8orpiWDf9BYwMsECCteVnwSB2s1rBc5x7SVlZH0qALFgisN1T9h12Kw34q
         SRXd8xTg7mkk5gnWTZW7xcrpNsmjvQcrCFhdjznZjuxOkHhY56blnAWCYkNPSnQ94uz8
         pEPYLfc2vc7YqWJ6eDAPBpW2fcOp11e+YKW1RtuN65Tt0G2my7WBAGS/i822JMKAayf8
         y9Zh+qPwuC+TItd9Fc3C10z0pcr2JknpmVT2MSAsDT0/PhsV6Eh9SOq9kCnwPoJZzkhG
         7p6lZh2Ozc3Lc09bpyyg5L2KVXSK29DdmSjMk5cvHxk6ELvyN2E2BClLbDbJrjwOi3y/
         Uiyg==
X-Forwarded-Encrypted: i=1; AKwUvBzUWvCxBkrgzrkyjwtzU4R632Os0Tn5/uXuPGU5+CW+MZuC1C5QwhBHhDwugvoZDt37NgulOOSuMosEiOkO4eBz@lists.infradead.org
X-Gm-Message-State: AFuF++luI3leQNlxGv3m0SyUPFSs4nWYGdTfbLHFx7bHPzPaRvGTVpJz
	9Wz6zigy6TNvt+aIkd0y6F6Se52xc4Xqp26ZTW4SRWg3BPmjcXRoen8q3LAa8dOZQdk=
X-Gm-Gg: AYBFou2/STJuV30ZqIoHLkfxWu8Pjaznt2tXcW2dmvHBhDXxdwSKEoDsKF0pEFohwYu
	Zg8TZGvZXKG8jVk2s4C48BoMJLwLNhTn6NJ7NJf3jOwRKa3K99C8S+P0fqmcq6ehNj0ySQCKY84
	YpYk7qhH2Y6Q2etwuKfA8jE2Ou/bomeVkymJlqmvswMginRbr55JGU7ZBmOWt0FHPOgQbExNiWo
	QLDco1L/LZ/3Xarikw9ZmBT1BKxlBmgPq3O1LjRkiMIL2a8bTCz9oK8xso7lEbPaT/fuhskUjsv
	6htfaXS7wLkdDoISuUJqZi1qcBcokFaHMkIkumfz+A30y88vhm9kcZPnnO1QavsOAupCmzC0ALr
	jpVh9Wkop8YhZeeKOHqItlOtvu81OtDczYt9NAXshkJW/fjY0o3N2QApatplu3QSi197+SWQOV1
	kR+bkkSHZcnZsKRZ5Utytwq9gcB8MqSAoOXbgqKq3u19vdRvOETyxmMws=
X-Received: by 2002:a05:6a00:8d8e:b0:84e:909:ac03 with SMTP id d2e1a72fcca58-86f83b3b22fmr3682395b3a.10.1789376850775;
        Mon, 14 Sep 2026 02:07:30 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b291c1601sm4365005b3a.31.2026.09.14.02.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:07:30 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Dong Aisheng <aisheng.dong@nxp.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Wolfram Sang <wsa@kernel.org>,
	Fugang Duan <fugang.duan@nxp.com>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] i2c: imx-lpi2c: release clocks on remove
Date: Mon, 14 Sep 2026 17:07:18 +0800
Message-ID: <20260914090718.1666333-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_020732_696284_9E2C3FF5 
X-CRM114-Status: GOOD (  13.68  )
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

lpi2c_imx_probe() prepares and enables the controller clocks before
enabling runtime PM. After probe succeeds, clock management is handed
over to the runtime PM callbacks.

However, lpi2c_imx_remove() only disables runtime PM and autosuspend.
It does not ensure that the device is active before teardown or drop
the clock references acquired during probe.

For platforms which do not require clock prepare/unprepare in the
runtime PM callbacks, runtime suspend only disables the clocks, leaving
the prepare references held for the lifetime of the driver. Since the
remove path never unprepares them, these references are leaked when the
driver is unbound.

For platforms which prepare and unprepare clocks during runtime PM, an
unbind while the device is still runtime active can similarly leave
the clock prepare and enable references outstanding.

Resume the device before disabling runtime PM so that the clocks are in
a known enabled and prepared state. Then drop the temporary runtime PM
reference and disable and unprepare the clocks during final teardown.
Mark the device suspended after the hardware resources have been
released.

This issue was found by manual code inspection.

Fixes: 13d6eb20fc79 ("i2c: imx-lpi2c: add runtime pm support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/i2c/busses/i2c-imx-lpi2c.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index e1a4338bc51e..481950004b2a 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -1604,8 +1604,13 @@ static void lpi2c_imx_remove(struct platform_device *pdev)
 
 	i2c_del_adapter(&lpi2c_imx->adapter);
 
+	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
+
+	clk_bulk_disable_unprepare(lpi2c_imx->num_clks, lpi2c_imx->clks);
+	pm_runtime_set_suspended(&pdev->dev);
 }
 
 static int __maybe_unused lpi2c_runtime_suspend(struct device *dev)
-- 
2.43.0


