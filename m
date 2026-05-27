Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B511CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 17:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dr1Vh7T1FjGx+SxxnwuCbG7AIOfy8FpD/4EKhw7fhLY=; b=G0EMEiG2wqLHNSjuzdd0Z8kKs5
	p+EYx4znN4fTq5NWnof29K+wJpxrGrpUSGY/r5+1nRNhJxAcrsjJy9y2F5/RD94mtbJ9RMbqFvQSj
	xcf+arcciISeHgIcG7UJJLwz4MGiJzELEkXgJk9HGdqIvg1gLoPmICmjViRR52y7UfpC497geKTuZ
	6xZeT1iLw0R3nh3Hn8dks+lbVyRidekO5u07Gmz7u2IgyGKuBluC+VMgBe2icK/aQeluiPmGQyNRF
	Iy4xET/EZRYt59KOZyoSG5mEPlOvhWNYdnlvPU2mCYXIiYJHv4wEK++0+qdHtak7BV+uBX+wpvkcw
	mMyCgGzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSHm1-00000004ZCG-22nm;
	Wed, 27 May 2026 17:10:29 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSHly-00000004ZBk-0mvx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 17:10:27 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2bd9c3b550aso83113345ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 10:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779901825; x=1780506625; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dr1Vh7T1FjGx+SxxnwuCbG7AIOfy8FpD/4EKhw7fhLY=;
        b=XzDNJfz1SnpEBgbbt6HGa5djzYmenNRiaKj1OCxMWSbIKWWc2YZocIPpT2dWzDHH53
         xXmxa/zdWotH+GZIF+rGkRV0Np9ba6c2/vpqWOVq1NC1QeRex8p3HipP+Bm3+GnN1SqO
         ShNQq2j4Z+FA/S1BT7nLHZiTNP1fIWTKVP1pvRizmnkSq629lkSQjtL2FocG6lGoSAMA
         nWPlvO4tBav1HY1iGP88as21b/5xsmDBdZ/kbR75dYmvPpvqdf8oK+knd4/zz8rOyehF
         M5/wewAo8j69XW1QxJiuvrEjipBmrOpaQAkiyyJpWtmuEWXA+eBvL9ANEt5FuXeGKNZF
         44FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779901825; x=1780506625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dr1Vh7T1FjGx+SxxnwuCbG7AIOfy8FpD/4EKhw7fhLY=;
        b=FBgMjVLScrIzvOLPfI4I5BQRFExlaFFnUjPZPQGV4ZhQA/LkpHtCioG67TwXzoinB+
         hSpS5qW8pZ2UutU/RE/lbpMRpKgaeZzG8S4fQ7ZJuLU2t0MxBJIGHpfVOPvvTBAVS2NA
         BOhaBSEbuarIgFW1tV/J9YWsf0W7T6EaZMO6jXVCo3anxEXW0rhEgw0S8UuxaJ7HxdR/
         rLEZrovexY7O7NVVeLJK0iHj0GR433jkwrAsHMJNYuiz6OXWBrhqHfB/T9UsSEOclOVK
         WCMV0QSFQcb94qlzbAumCEdAtF/r5HLYTeXmJTMOroURguGcF2UtIOm/cnV+5/ccVsRh
         ZogQ==
X-Forwarded-Encrypted: i=1; AFNElJ9xNoo2WWJln6FLu80JFXp1OpgwS39n5UWi3F7WxniKpZdJ1liXv/C1roskTrFgH940i683KbfNuyfnO0RZoMFY@lists.infradead.org
X-Gm-Message-State: AOJu0YxyCm6g36J2y6g0v4STx96rczFPfSIU/EMIpYGtgWAeBz+dJ+jh
	enkwfwjhDOSEG1Qy7AL+7FfwvKMj2Kkq5dHwIFfGDMHABEkBsrk6aYXCrKcNLLQlduE=
X-Gm-Gg: Acq92OEVsI6PjWjzp+ZWu94QluHyYFrsRJZ6boD5Xa4Pn5XgX5qcJUlXyaD5ivFlTP8
	GeJux/1C844QETbB90tXFJhnW8vl2YCK+5WQsAhpnYc37LjFvQd6Vm9iUkDKSPbOOenxv/fl5an
	3KjOi6OR1uaYjU5tmdAGaQPC5Rx2F0JTYOhlflAGadcIPjBCPouzZ6LctoEcTVJxwybY67lTH0j
	n4E3hy7YObzek0g/oc0TpDTTMd+2ojQIzkKO+qF1irHxfJDgvZdyl4mLo+K0xny4+bGqK7bveOS
	Ytbg9nKrJ1TglZQpNOxUUXMfLuqMQPubgNp7Hs4csm4p1cTnwxiN+mhctad28LX96GIDJiMxRA5
	HgaJOsCiURKPtmDK1QFltMho+E/3OawEpJSwT41B0GDIbKZwJqkN8o+7uLa8jttL/+xIa+qX1dD
	jIPpOUDT/K3D9XQZr1mnt9mcXPSTRNfLzB1Q==
X-Received: by 2002:a17:903:3848:b0:2bd:8fc0:1198 with SMTP id d9443c01a7336-2beb0633629mr262545435ad.5.1779901824674;
        Wed, 27 May 2026 10:10:24 -0700 (PDT)
Received: from ubuntu2204.. ([240e:39b:ee1:f550:f34d:9da7:5be3:2198])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5900b8bsm155788875ad.76.2026.05.27.10.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 10:10:24 -0700 (PDT)
From: Liem <liem16213@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org
Cc: kernel@pengutronix.de,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Liem <liem16213@gmail.com>
Subject: [PATCH] i2c: imx: Switch to new reg_target/unreg_target callbacks
Date: Thu, 28 May 2026 01:10:16 +0800
Message-Id: <20260527171016.67020-1-liem16213@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_101026_232064_84F366A7 
X-CRM114-Status: GOOD (  13.15  )
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

The reg_slave and unreg_slave members of i2c_algorithm are deprecated
and will be removed. The i.MX I2C driver still uses the old names for
both the struct members and the callback implementations.

Switch to the new reg_target and unreg_target members, and rename the
corresponding callback functions from reg_slave/unreg_slave to
reg_target/unreg_target. This aligns the driver with the ongoing
terminology migration in the I2C subsystem and avoids future build
issues.

Signed-off-by: Liem <liem16213@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index a208fefd3c3b..c9ecca3ef580 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -922,7 +922,7 @@ static void i2c_imx_slave_init(struct imx_i2c_struct *i2c_imx)
 	i2c_imx_enable_bus_idle(i2c_imx);
 }
 
-static int i2c_imx_reg_slave(struct i2c_client *client)
+static int i2c_imx_reg_target(struct i2c_client *client)
 {
 	struct imx_i2c_struct *i2c_imx = i2c_get_adapdata(client->adapter);
 	int ret;
@@ -945,7 +945,7 @@ static int i2c_imx_reg_slave(struct i2c_client *client)
 	return 0;
 }
 
-static int i2c_imx_unreg_slave(struct i2c_client *client)
+static int i2c_imx_unreg_target(struct i2c_client *client)
 {
 	struct imx_i2c_struct *i2c_imx = i2c_get_adapdata(client->adapter);
 	int ret;
@@ -1704,8 +1704,8 @@ static const struct i2c_algorithm i2c_imx_algo = {
 	.xfer = i2c_imx_xfer,
 	.xfer_atomic = i2c_imx_xfer_atomic,
 	.functionality = i2c_imx_func,
-	.reg_slave = i2c_imx_reg_slave,
-	.unreg_slave = i2c_imx_unreg_slave,
+	.reg_target = i2c_imx_reg_target,
+	.unreg_target = i2c_imx_unreg_target,
 };
 
 static int i2c_imx_probe(struct platform_device *pdev)
-- 
2.34.1


