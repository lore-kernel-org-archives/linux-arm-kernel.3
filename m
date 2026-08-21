Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FB8C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 02:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jbtpPhjBOt68lCtkFvblCddC1916ShOnlAarOKi5cWI=; b=OZw9s/5b3fl950/D2sPPTA41+S
	T4bXg/TWx+oPQcYrAhRhpNm9b1wum6hN4wgE3c/UMVjP0k0NEdriyaDSoyqEgtmx7G7mCAMgmyQxV
	bgLOma9fzl1I0yFuIWnaTMlweyOOUzToEvB4XEQU1C+SEK5wSP0ZfvKhcIMRfKIsUDRcZqcSd++1r
	o9rJl2/PTKMy838/GaqAMC5zmKin09QPpWt0r8SDHaiymLItja8F2sLaPizNXzJusIZoHgbpivE4Y
	f76R0AF7Ugu+orLKQQyVcdGlrk1Xh5Rs1zMp4aEBX5NkHixTcNRoWzlVZUZxUsSKI8pHy+8187hzD
	0DEmBlLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxFAm-0000000CT1H-3LZa;
	Fri, 21 Aug 2026 02:40:00 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxFAk-0000000CT0a-2xk1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 02:39:59 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-84eb992a881so355439b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 19:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787279998; x=1787884798; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jbtpPhjBOt68lCtkFvblCddC1916ShOnlAarOKi5cWI=;
        b=mdBc3nFLxdHxKNeaev/R/YDXZ1TpKOK1RSrT3EYCKk+RVc91wgD6PKmR1c8QjodJoY
         3t3DrqvvwXeWiK9tAKB0zu7BQbjOEb0pzANzsxEEGYd/wSFoOffOYGcOZ2MNw3E+FULq
         aqkPBw8p/YR89C/AIpcX6Ocsx21Ht1ncSJs4wseToASYGoUQZn4M2Wvd1H+Ktwkb6LpI
         jTLFutv6sC/zf8Zqofh8gQ/ZkVidEEr3WKoc8/lQfBen5owCZTRemri6u/MKK6p18SIW
         He73Yu24Qf8OTZDpdMV/CS6IzvxNFDax9fOMTro7iYd8+lvxSMZmnfXBZlErqwR4VWtg
         mebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787279998; x=1787884798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jbtpPhjBOt68lCtkFvblCddC1916ShOnlAarOKi5cWI=;
        b=QVKCzCQMfgMy+62w8PBYEP+1+ULrMI/FqZuIe3askFdjwdjDWxuA/K3uUAXsRaN2di
         bNWcN4D/exrafPwDGGGgZ2cLogsGz+oPvLTMNQLode+SofpCBjDcjgV3Rm2vjfN0MomF
         2uRXDf/yg3oWQjLnTUV/WGpODijR9aTrmrJeqlD0xunRix+7HbzC16xYZFiQuQSngiXR
         93lstrfWSxs6wJtEPLhkMFT+5pmKeasqgVKMJCKRenhkAL2bQqbEE49wGEQ+NfdBLURa
         jE2MtPk+7STXqUjc6XTitCDOSWcayNtb7BIgpYkUzzh9HMSWXlEWuPrfwi8s5zGgY3/Q
         G7iw==
X-Forwarded-Encrypted: i=1; AHgh+Rr/KVMoOPYCnTcEloY21zmw9q9U7db6CzoFyvKenwTEU2fQzfM4gh9usB9g/L7WgUNj1dPwprjCcc+wqZIJudb4@lists.infradead.org
X-Gm-Message-State: AFuF++khK824veQAzDpiKfTZMHGEesjhuk1XhFsHxvUtzjUcga9tuMgS
	pg66tPf9oIuGJUDevBw88oWK2NA6LSAVeZRkpTQesPCijjSbcMT09uQ=
X-Gm-Gg: AR+sD12vkFJSr+vjozbBuHBGbx0JEwynV7ElSTHru44VovuacenahYLMoPchYraI2wV
	MS+Udlhw9iynDGZ9f9koq0hGqZu0DJqREdI3fsfWrwTuAUVBtxG52JOlmDpuX1rRgX14/SlTOSJ
	ODlzkfIpVbNYH+cxchVoTrM7kzgJx1tMgD4Pmlez6eVkqd9u9HULmXdiIOMuB2tosgOlRznCNgA
	dF7Nywy6+R/Q6S82EP77FX+cILRBK8FbJE4NFf1vC8CqiKhB0zC41JxlC/VTbdOfYBmLIdqJtyV
	cl/hmyg2j/qMnP3ljFcSBi2plXtbdP3yGtSlBvazDZFdO0Zz1TTLBKOBQnJcS/dHHymgAp7dMOO
	Ujwb7/h3jV//dyHt2z8iMRpcxOWTEsqVh/olfSTSJo5MFBiDoHnrCr+u2/4ibi2lE87+lpCl3c/
	OMASZZfhJTVaANmVulKT9NnMjz5z2czbPMEsRr65n2+tv9E+WKbbQtPOF8Ia3vzWLlwWhmQnNv2
	A==
X-Received: by 2002:a05:6a00:a91:b0:845:ba94:a56 with SMTP id d2e1a72fcca58-851f987d3a0mr4634028b3a.5.1787279997742;
        Thu, 20 Aug 2026 19:39:57 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3617434sm2281487b3a.29.2026.08.20.19.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 19:39:56 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: dmitry.torokhov@gmail.com
Cc: linux-input@vger.kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Triet Hoang <triet.hoang.dev@gmail.com>
Subject: [PATCH] input: keyboard: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Fri, 21 Aug 2026 09:39:51 +0700
Message-ID: <20260821023951.53199-1-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_193958_745141_17233445 
X-CRM114-Status: GOOD (  11.71  )
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

Convert deprecated SIMPLE_DEV_PM_OPS
to DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr().

This lets us drop the __maybe_unused annotations
from the resume callbacks and reduces kernel size
when CONFIG_PM or CONFIG_PM_SLEEP is disabled.

Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
---
 drivers/input/keyboard/imx-sm-bbm-key.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/imx-sm-bbm-key.c b/drivers/input/keyboard/imx-sm-bbm-key.c
index 96486bd23d60..7fbbd44878be 100644
--- a/drivers/input/keyboard/imx-sm-bbm-key.c
+++ b/drivers/input/keyboard/imx-sm-bbm-key.c
@@ -187,7 +187,7 @@ static int scmi_imx_bbm_key_probe(struct scmi_device *sdev)
 	return ret;
 }
 
-static int __maybe_unused scmi_imx_bbm_key_suspend(struct device *dev)
+static int scmi_imx_bbm_key_suspend(struct device *dev)
 {
 	struct scmi_imx_bbm *bbnsm = dev_get_drvdata(dev);
 
@@ -196,12 +196,12 @@ static int __maybe_unused scmi_imx_bbm_key_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused scmi_imx_bbm_key_resume(struct device *dev)
+static int scmi_imx_bbm_key_resume(struct device *dev)
 {
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(scmi_imx_bbm_pm_key_ops, scmi_imx_bbm_key_suspend,
+static DEFINE_SIMPLE_DEV_PM_OPS(scmi_imx_bbm_pm_key_ops, scmi_imx_bbm_key_suspend,
 			 scmi_imx_bbm_key_resume);
 
 static const struct scmi_device_id scmi_id_table[] = {
@@ -212,7 +212,7 @@ MODULE_DEVICE_TABLE(scmi, scmi_id_table);
 
 static struct scmi_driver scmi_imx_bbm_key_driver = {
 	.driver = {
-		.pm = &scmi_imx_bbm_pm_key_ops,
+		.pm = pm_sleep_ptr(&scmi_imx_bbm_pm_key_ops),
 	},
 	.name = "scmi-imx-bbm-key",
 	.probe = scmi_imx_bbm_key_probe,
-- 
2.53.0


