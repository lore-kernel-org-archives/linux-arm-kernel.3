Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA8FC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 03:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m8FXnxErYEXBEufif2ljGTGmGGFij1tLBBaVqaNV1c4=; b=RGLRr6CQuETFll13vYvPtHG+Pb
	3nz5EtKyWh2L3SKWGNTnRDc+OocE5zVqh/kif02EJ7vGlawiHPnivPSnT2eVB1tWBPcVYer1ti/xx
	r6f8MTN+pwXqaYRkNFVqE5GFbQ1ZaaZY3gs8HQNub8IuG1ZF08R8ZTsD/aA/s0dgQ2SHGZllH2UI1
	wEXXMwFoU+r4kM7clMEUnWKwbVt6/HMllSSJhOMnJkakjl351WqLUHreqII7QwcVadaC5e1s3YZ+s
	K299lvegF2LiilAo6mowF/FiaOrPi5xvurJfcnWXF1CyA1Fw2rYVSbXWxRUUMZeFjzg8MkW2VvlkK
	PpKXCwdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7m4Y-0000000FvYU-1SZP;
	Sat, 19 Sep 2026 03:49:06 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7m4S-0000000FvVu-1Prj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 03:49:01 +0000
Received: by mail-pj2-x10.google.com with SMTP id 98e67ed59e1d1-396ccd5cf03so1458372a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 20:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789789739; x=1790394539; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m8FXnxErYEXBEufif2ljGTGmGGFij1tLBBaVqaNV1c4=;
        b=Vi3PdV7nInIAPMBk/Vlsr2OJVPH/mEcaSc32HrLYhU9DK+E4oxVg7yvdCAbmE+FoXh
         tlbFMWL3FFbroV3ryzhq7xZGsuSJRrObGzQ5QLRGZutep/YlStF/jTOsW0oc94/mIiAB
         WloYg8Ch5kHTL4awsKJo4AdEW17YfT3dtr7v7gpFOuWXWjGID0duIasnvT380FMzOljv
         wa7q8Qsn2CNa+Xlq1Ga2g7fzajWPD0NxsGQ/3OIWF2oUIxCX3z5tQKKT8mZU5EXVQ5Q0
         KuFcty43Alpkk6asZJiXP/C2m9/QzQ3UB5EycxiSS0enZ37KCo3y817PumOMTko7v1up
         Gygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789789739; x=1790394539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m8FXnxErYEXBEufif2ljGTGmGGFij1tLBBaVqaNV1c4=;
        b=kOqFgYH6u6W37OdWjoXjvn1yHaOYyvVfoRdaBVncAMuSpB8m/b9CbJpeCo19g5Bkvc
         dXqS7RHDSROWUlxjauwA4ttCuUR0/xEmbWS2Ng9Pi+e3Gp/YLxDpNOYVFYo59tB60/Ag
         Vl83wR03+B+flL1oPfj9Nh1UJVVDJ9/OUL0lr2jigivLJUdqZwHLEuOgi/Ipzn98kMkf
         ZLNycDvEB8Cp/HPp5SFimU/+6EvrnpS00SQyAGhXPAF/2BlfD2/XiogTzlKkjhuUZk01
         3+yZ0kLgBXuw4pzZNeN788BgCAcaUOLMnAFg1M102tEb+fPqKgn2dFey+Ey0eoaB0UZe
         IvKg==
X-Forwarded-Encrypted: i=1; AKwUvBzq5I6kgR7lxIOmhD4780wsqgBlToN94wjss9xeFXSWl23POKatcC6am7DfR8jyxzJlGyaZ8cFpcXNMzh+gsmlR@lists.infradead.org
X-Gm-Message-State: AFuF++lajA4frJp7/mnNAETuteK2cds8tUNeAMLC0MaJQn6hS+uLoBVI
	GJH/tx0j4zN4OkRFfA7Wu6eQMhMYU3ctjfSYa5CmAMaKa0WPFblPZMfzEfmpRzL82A==
X-Gm-Gg: AYBFou20wbdwhgH2PkN6g38oknwwcML7bD04WXroc3Zz/i2+tNh129AogsyKBKjLMYL
	KsmOFGsgS7gz+THSxC8Oy3H260RJ7Ck3Dhs/xdRvLcG9E2bP9+8f7CuJ0U8Wn3iWf43Ut6yJKW8
	Ce+PipgTqABW0d30d1jII0+3YuZychTGmIt9806cjR80uoo5ibTka/9OEiuoseed4Q4JkDMctQQ
	hYIsNr9+nhrwUf2uQ+BsVd8cmKUMB+j0F+vp30bAzYRxmYqPoXJfAD6Wjf2bxOfpWmCOZIk6DZ8
	pUh28UT3KQJHX//1sy3oUUttftZjktjBY7kid1tPf809RRpVfA38uDx6hvKI7x04gvOcgyA36If
	fsGsht+Ykc1mbuWqT/JViIkeaWiL7ZDYxqyLaNzhaXlSwO3PRVFZntcEMBrE1HmeffDoYvNpbek
	MfQLoeTFtE1ONKdGodlveW4Ix0ag3EinxKmsSCJFBBc6ZQ0LwoQtuK1cXXmXNhWhTQh7hUv6dXq
	LUmH0bTyI9/CnQNGWs3i1bqV52iteKmg0apuK3qjvM2XEQyskR/CYh4w7KjLQfkfcCYfOnIdN5Z
	S4E=
X-Received: by 2002:a17:90b:574f:b0:39e:6a81:f34f with SMTP id 98e67ed59e1d1-39e6a81fd3cmr3118804a91.41.1789789739453;
        Fri, 18 Sep 2026 20:48:59 -0700 (PDT)
Received: from codespaces-2db70c.ktkhmpmw22vebpok31ngjx2qsb.ix.internal.cloudapp.net ([23.97.62.118])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c4ba12csm2305479a91.11.2026.09.18.20.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 20:48:59 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH 1/2] firmware: raspberrypi: Handle device registration errors
Date: Sat, 19 Sep 2026 03:48:39 +0000
Message-ID: <20260919034840.28593-2-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260919034840.28593-1-triet.hoang.dev@gmail.com>
References: <20260919034840.28593-1-triet.hoang.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_204900_389568_2440EE43 
X-CRM114-Status: GOOD (  18.40  )
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

Check the return value of platform_device_register_data() when
registering the hwmon and clock devices. Propagate registration failures
to the firmware probe instead of silently ignoring them.

Use local platform device pointers so the global pointers are only
updated after successful registration. If clock registration fails,
unregister the previously registered hwmon device before releasing the
firmware instance.

Keep the existing behavior of skipping hwmon registration when the
RPI_FIRMWARE_GET_THROTTLED request fails.

Fixes: 70eea1bbb556 ("firmware: raspberrypi: Register hwmon driver")
Fixes: 91f2cf4a6b21 ("firmware: raspberrypi: register clk device")
Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/firmware/raspberrypi.c | 57 ++++++++++++++++++++++++++--------
 1 file changed, 44 insertions(+), 13 deletions(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 0aa322e9a2e7..88c3de9ce67a 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -197,22 +197,31 @@ rpi_firmware_print_firmware_revision(struct rpi_firmware *fw)
 	dev_info(fw->cl.dev, "Attached to firmware from %ptT\n", &date_and_time);
 }
 
-static void
+static int
 rpi_register_hwmon_driver(struct device *dev, struct rpi_firmware *fw)
 {
+	struct platform_device *pdev;
 	u32 packet;
-	int ret = rpi_firmware_property(fw, RPI_FIRMWARE_GET_THROTTLED,
-					&packet, sizeof(packet));
+	int ret;
 
+	ret = rpi_firmware_property(fw, RPI_FIRMWARE_GET_THROTTLED,
+				    &packet, sizeof(packet));
 	if (ret)
-		return;
+		return 0;
+
+	pdev = platform_device_register_data(dev, "raspberrypi-hwmon",
+					     -1, NULL, 0);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
 
-	rpi_hwmon = platform_device_register_data(dev, "raspberrypi-hwmon",
-						  -1, NULL, 0);
+	rpi_hwmon = pdev;
+
+	return 0;
 }
 
-static void rpi_register_clk_driver(struct device *dev)
+static int rpi_register_clk_driver(struct device *dev)
 {
+	struct platform_device *pdev;
 	struct device_node *firmware;
 
 	/*
@@ -224,11 +233,17 @@ static void rpi_register_clk_driver(struct device *dev)
 					   "raspberrypi,firmware-clocks");
 	if (firmware) {
 		of_node_put(firmware);
-		return;
+		return 0;
 	}
 
-	rpi_clk = platform_device_register_data(dev, "raspberrypi-clk",
-						-1, NULL, 0);
+	pdev = platform_device_register_data(dev, "raspberrypi-clk",
+					     -1, NULL, 0);
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	rpi_clk = pdev;
+
+	return 0;
 }
 
 unsigned int rpi_firmware_clk_get_max_rate(struct rpi_firmware *fw, unsigned int id)
@@ -277,6 +292,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct rpi_firmware *fw;
+	int ret;
 
 	/*
 	 * Memory will be freed by rpi_firmware_delete() once all users have
@@ -292,7 +308,7 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 
 	fw->chan = mbox_request_channel(&fw->cl, 0);
 	if (IS_ERR(fw->chan)) {
-		int ret = PTR_ERR(fw->chan);
+		ret = PTR_ERR(fw->chan);
 		kfree(fw);
 		return dev_err_probe(dev, ret, "Failed to get mbox channel\n");
 	}
@@ -303,10 +319,25 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, fw);
 
 	rpi_firmware_print_firmware_revision(fw);
-	rpi_register_hwmon_driver(dev, fw);
-	rpi_register_clk_driver(dev);
+
+	ret = rpi_register_hwmon_driver(dev, fw);
+	if (ret)
+		goto err_put_fw;
+
+	ret = rpi_register_clk_driver(dev);
+	if (ret)
+		goto err_unregister_hwmon;
 
 	return 0;
+
+err_unregister_hwmon:
+	platform_device_unregister(rpi_hwmon);
+	rpi_hwmon = NULL;
+err_put_fw:
+	platform_set_drvdata(pdev, NULL);
+	rpi_firmware_put(fw);
+
+	return ret;
 }
 
 static void rpi_firmware_shutdown(struct platform_device *pdev)
-- 
2.53.0


