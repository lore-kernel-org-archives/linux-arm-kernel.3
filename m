Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C101CCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 18:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KmOBCXRMxHUy9xFI3toxiU28u5v8kqCzk7z0VpaRiLk=; b=3jThQE/PMbA5gG8GGkMC+p919o
	1AsXsqGFBPx5D6b+rfx5XE55JVJ3dMk+IAg1BP9bzzx1Tz8SXxpMTohyrPsMo4MQVKGn1S22VIRHP
	wl1K/SrRqR0SQB71YwdS2rfPiD7g3Vllem6b5TP5rKB26TbJkHsMn/snre3X4zeI0nM2zEGgQuFm2
	oIKcGMbaG8+MN1lx+QMZZFHHB+W4Q0B8It/ww0Ezym/osd6hoAfTbAOaA23nkMcUucGnNvTWB9Vzc
	WMCaf1JYnkF3pcBwWofkPefh4lzAVdtertlgCExjslp3zQpESKQB5jIOJ2x9//jMenhRVd9fehuUo
	iDf2Ivgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYo8z-0000000DC8k-2MhB;
	Sun, 14 Jun 2026 16:57:09 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYo8x-0000000DC8O-2Dn8
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 16:57:08 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2c0c1e0d00bso23164045ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 09:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781456226; x=1782061026; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmOBCXRMxHUy9xFI3toxiU28u5v8kqCzk7z0VpaRiLk=;
        b=ClVxGQ1cUnsHkQ5U8uEf/QWrQaDjyDSTtEE4DOJVKNbXOAwvGFR0wRM78hkNxmnNiJ
         5a8lkDHK+WvRMCJA/9yox0tYVySBWU1M2MXfxs/YtIhwctvE/5WAPRmnea9mhTRowyS7
         PPK4ZrcZhNNB8wJ5829IHhdAPPpM0LZki1FocIkDN1aCsaeGNPiy3f1HuE4NLYde/Y0g
         QV1T9ZXoRHK81ozAPrnw6Pb3baKSGnu9UIeseqnOemIIountuQeixiG27ZTmZcwlfH7B
         yzxezuKLvsYUPdHDchgTJrUeV4crG/akGSqGbEKGAHp5pj49RyVdJS0G90r8+qEwzWKI
         /dfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781456226; x=1782061026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KmOBCXRMxHUy9xFI3toxiU28u5v8kqCzk7z0VpaRiLk=;
        b=l9NkIh26e+sL4JBONDQ4vbXMfwHjMsCfuIkBlrU9E5FdGjlcE7fQEKh5sMnffWv0fx
         bmH1vUl5B2EC+B235AoC//MJFiY6Xxg/YC5hV1JLZhp41gXHUCD9/eSU12bFrPDb9Lp2
         zIoAGi8SfMXuh+QgI3UPID8BE78HtBKRB+KBzupN+pjUdANh6Vl24ZEONR0rFd93Z5S4
         plCz2Nh7DwWvzjGl8L/orn5490qIhiUXuDWXTY39px7oOcbx4RWnC82bDNHQkgXrrL9Q
         ZLNKa/ZW9gjUFmC6DsPTHeY8RorNEasXZfMHbZUKd+iHcfsLhkuG3k4Zoq89tAcJ8J9R
         Omiw==
X-Forwarded-Encrypted: i=1; AFNElJ9FULAkbyME5CypDVVOy8h6u7GR57T+SGFyXmx+Y+OJimQfFYDVDKxPX9YVBWu00RpCszEcEgmP8simjDLcMsup@lists.infradead.org
X-Gm-Message-State: AOJu0YwhY7+3lgRJDwpG+duxozE7hoJ6zf9RzT4hx+mIcbqaSYzs2e5I
	3GU1MVdHsFteN6aqm2D9uYrSWQfH8sUSy81LgbX/pa+3FNHss+Aw5Lnp
X-Gm-Gg: Acq92OFNjKmunZjK92X1Jqpc+wc1yDb/uc36GiQwObyG/6ElLpt0sEir1q72XAdTZ3A
	qizNWVzMEexLN1CaAlecuE0EVJcilwYCFAYbNMwO2+KHXbej8JL6Y9QVLarqqC/hZQBME5piJDg
	pvp4lT1aQF3zs6nZlC/bURnG2qY10D8Pb1w1iXeYEcB+45ajJjVqngcsNBiaofHokat+Ooa+p0L
	5NxURUrVUc6cxgH+h6PR1QfW5gxblarSMxm1M/XvLuPRh/mKQaDn/YkS1ChfGWrLGDB7F6r2i/h
	e882GyImzjwFGpPYwZODx3w+V/1oDlYJ9aEEaFfHY0qvUvy/baUyU5bC46lPxTihl2XqdFzfwKV
	5Fe2FkUAEy7gi5BNsWP0Y/hOtkF2Z+otnyea/6lpzOG+i7cykPFqoxzT99ZeDmIpOxb1U5jw270
	jF2QVfGXIFZ2IkEf7cVOQLNL8Zgi3oIbq8/82ohlBLJZ6d1VGh3jk/
X-Received: by 2002:a17:903:238b:b0:2c1:77cd:fb0b with SMTP id d9443c01a7336-2c412f17bcfmr118511375ad.37.1781456226362;
        Sun, 14 Jun 2026 09:57:06 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e5590sm85284025ad.14.2026.06.14.09.57.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 14 Jun 2026 09:57:06 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org,
	mchehab@kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/22] media: platform: stm32-csi: Add missing media_entity_cleanup()
Date: Sun, 14 Jun 2026 22:25:43 +0530
Message-ID: <20260614165630.3896-7-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260614165630.3896-1-birenpandya@gmail.com>
References: <20260614165630.3896-1-birenpandya@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_095707_591516_878FD5D7 
X-CRM114-Status: GOOD (  10.91  )
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

Fixes: dcb0f4c16be5 ("media: stm32: csi: addition of the STM32 CSI driver")
Signed-off-by: Biren Pandya <birenpandya@gmail.com>
---
 drivers/media/platform/st/stm32/stm32-csi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-csi.c b/drivers/media/platform/st/stm32/stm32-csi.c
index fd2b6dfbd44c..0847fd347d56 100644
--- a/drivers/media/platform/st/stm32/stm32-csi.c
+++ b/drivers/media/platform/st/stm32/stm32-csi.c
@@ -1060,6 +1060,7 @@ static int stm32_csi_probe(struct platform_device *pdev)
 
 err_cleanup:
 	v4l2_async_nf_cleanup(&csidev->notifier);
+	media_entity_cleanup(&csidev->sd.entity);
 	return ret;
 }
 
@@ -1068,6 +1069,7 @@ static void stm32_csi_remove(struct platform_device *pdev)
 	struct stm32_csi_dev *csidev = platform_get_drvdata(pdev);
 
 	v4l2_async_unregister_subdev(&csidev->sd);
+	media_entity_cleanup(&csidev->sd.entity);
 
 	pm_runtime_disable(&pdev->dev);
 }
-- 
2.50.1 (Apple Git-155)


