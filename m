Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1EEC531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 08:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7jU8sAnxwGBoGejjvqvQlsAlOL13cJWzk28R/0LodGc=; b=Mnydjm451iulLkrYXsDARIUGbf
	HGDmFom4iXXMfJXlY21BvqpCbrCMt/26xBn1V8vc/Nl078pbA6oX8Fm5mIbBTcCNVSseQVWHYJNFv
	wsO9MHj+rdHgcmQxic5S3iJyJvrzo0UrMP3l3ioRtmO0/J5kvFPN4iyMFApeTCy44ngq7yWB38m/l
	8tQhr19mUi4QAj0FbLwXvzDQW5hGPaNGFwYc+d4W0KB92rxP6GVnBVhUwlFgScf24ta7Y645L1fFt
	kfSWcCo47gxwzIJhii3VPdiSALgW7hLe37XqBKL7TKUxsWQNM4DSTFUmG6J6wBNOJuLowaep+lC4g
	C5qayzkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBUE-0000000Fq8B-0UDz;
	Fri, 24 Jul 2026 08:42:30 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnBU9-0000000Fq7I-2VXe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 08:42:28 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso151528a91.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 01:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784882545; x=1785487345; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7jU8sAnxwGBoGejjvqvQlsAlOL13cJWzk28R/0LodGc=;
        b=Z2hP+Fl62YcJAlINNyZhkc3B1Xc20BHov8UvStZJoowZ366Ijm0tJZ25YELx3EJkKc
         s3znNU1kpq75W+rNpcRMS7UmVlfkiz5ygPO9fn4LdR/y600mHWENh+3m8iYgjbIoguE1
         6yK7sPfm43Nlyr1FCGqnMLzU0xOd76auVUc9330kPVDfh1OoU5dM3df0ExNA659NZxzB
         a8JFDvgq/LH+HaGPXvCZlKmiq/dZHOFa6AW6VxBIC14iQx3MhcmCXp0yWYGMI7chaWjc
         KB93UEFMGSBXybyE1SRkDa0bZ1GR16qi58fGew/+5SohsuqNnguXf8pc3J7ro1+PPK3y
         0ekQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882545; x=1785487345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7jU8sAnxwGBoGejjvqvQlsAlOL13cJWzk28R/0LodGc=;
        b=jjBbEYkrbcxfaa+ve+tEPcljsbBYuFTGDTFje/b06Ot4OAPX9+TAPengnOPi9op0SV
         tuBO11OpeVCX9mQB7Q0Th2lYNQSBqrLg/6ocU2RmjoGR/f1yIqKL4WIoA+o+w6lAkcC7
         BsQ/EazysindlDTuMS4GxGixyic2tYdrYJwoV+VaPOpcakWTMFdCqgD8f5fS5+ZCR3V8
         BUboxjLSkP5vGDzuNvwLbJ3LBfi5/BfC8huAIE0RaG7l578hl8jt8GTpheMeFLOgaCOW
         TnrIBur0SPd2Ni8X0Dkx1CrSsjPNHcpqdkgmClE8ep2Hw+mWWULnE3AQPQr/Wrrvddn0
         mrZA==
X-Forwarded-Encrypted: i=1; AHgh+RoKQw4UrmUkRA+9jpvy5ZflbcKVixvjz5TVu9W4kkIPODYZoJ/Vl6AB4pVRCcu8n8Hilc3S89q3GFZYC1PaH02G@lists.infradead.org
X-Gm-Message-State: AOJu0YzfjjgIJI0G1Fgf0sqo++DN5rxBs98wf5nRDQRaW5NqiZhWj2Ko
	Rju7hrY71mse95gl3REss0bZPwd+0V2nApnRI3C7JqKGtod8zMwpyrc=
X-Gm-Gg: AR+sD12lBqX/mQziRI2rc8i5EZr/uDwthZeUMkZDoeg/Kbwcpjd71WKfxNkQofZJe37
	hjRnStRTX4py6jlsCy0sNdF+xZiING1pTgrFqfnHnvUhYFWTzh84bDBW6HzJbQt7bAzPo0M4MQt
	ySD4pLHuE3Jqlj7vQEixBF0KuUxyRlSfspEAIh3n9LNipBvAS7oF3FTuUjcmvM6zer2kHUZsbVP
	C+1nuibUQFunVjqeJIHVbgCyRD1MD6YBOgrC2tGYIi6PzK2ynFEIxHp845yyaptVCmWgeM/uvP/
	JCx+1aNRAyJK6+vvX5/HUjl69KBZtRp1AXhzELsx+NJ1ln8xWBT2SpbgsSNfL41IGEaE2oIDlRZ
	WDZtxdyRdQ+w/EqK1CmSikGbXeRNHEUnbkHAE0iceEh91HVyi4R1we+mQtoK612Hiozl41ePbdW
	p0nT57lDbGjHK70E/PnU0dodiWUH4XVeP1FUUhSg==
X-Received: by 2002:a17:90b:2d10:b0:380:9504:9780 with SMTP id 98e67ed59e1d1-38ec6631fe3mr6482760a91.29.1784882544572;
        Fri, 24 Jul 2026 01:42:24 -0700 (PDT)
Received: from t-rex ([2401:4900:7b31:234e:4988:bf77:ef99:7f27])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm38261529c88.15.2026.07.24.01.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:42:23 -0700 (PDT)
From: kr494167@gmail.com
To: jassisinghbrar@gmail.com,
	gary.yang@cixtech.com,
	fugang.duan@cixtech.com
Cc: cix-kernel-upstream@cixtech.com,
	peter.chen@cixtech.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Surendra Singh Chouhan <kr494167@gmail.com>
Subject: [PATCH] mailbox: cix: validate channel parameters early and convert to dev_err_probe
Date: Fri, 24 Jul 2026 14:12:15 +0530
Message-ID: <20260724084215.51749-1-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_014225_647000_A14B6EAD 
X-CRM114-Status: GOOD (  15.82  )
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

From: Surendra Singh Chouhan <kr494167@gmail.com>

cix_mbox_startup() checked fast channel index constraints (index < 0 ||
index > CIX_MBOX_FAST_IDX) inside the channel switch block after
calling request_irq(). If validation failed, it triggered a free_irq()
cleanup path. Validating channel parameters prior to request_irq()
avoids unnecessary IRQ registration/teardown churn.

In addition, cix_mbox_probe() logged property errors referencing
"cix,mbox_dir" (with an underscore) instead of the actual DT property
name "cix,mbox-dir". Convert cix_mbox_probe() error paths to use
dev_err_probe() and fix the DT property string spelling.

Fixes: fe2aa2361ddb ("mailbox: add CIX mailbox driver")
Signed-off-by: Surendra Singh Chouhan <kr494167@gmail.com>
---
 drivers/mailbox/cix-mailbox.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/mailbox/cix-mailbox.c b/drivers/mailbox/cix-mailbox.c
index 43c76cdab24a..24cea67c407d 100644
--- a/drivers/mailbox/cix-mailbox.c
+++ b/drivers/mailbox/cix-mailbox.c
@@ -403,6 +403,13 @@ static int cix_mbox_startup(struct mbox_chan *chan)
 	int index = cp->index, ret;
 	u32 val;
 
+	if (cp->type == CIX_MBOX_TYPE_FAST && priv->dir == CIX_MBOX_RX) {
+		if (index < 0 || index > CIX_MBOX_FAST_IDX) {
+			dev_err(priv->dev, "Invalid index %d\n", index);
+			return -EINVAL;
+		}
+	}
+
 	ret = request_irq(priv->irq, cix_mbox_isr, IRQF_NO_SUSPEND,
 			  dev_name(priv->dev), chan);
 	if (ret) {
@@ -448,11 +455,6 @@ static int cix_mbox_startup(struct mbox_chan *chan)
 	case CIX_MBOX_TYPE_FAST:
 		/* Only RX channel has intterupt */
 		if (priv->dir == CIX_MBOX_RX) {
-			if (index < 0 || index > CIX_MBOX_FAST_IDX) {
-				dev_err(priv->dev, "Invalid index %d\n", index);
-				ret = -EINVAL;
-				goto failed;
-			}
 			/* enable fast channel interrupt */
 			val = cix_mbox_read(priv, CIX_INT_ENABLE_SIDE_B);
 			val |= CIX_FAST_CH_INT(index);
@@ -587,19 +589,18 @@ static int cix_mbox_probe(struct platform_device *pdev)
 	if (priv->irq < 0)
 		return priv->irq;
 
-	if (device_property_read_string(dev, "cix,mbox-dir", &dir_str)) {
-		dev_err(priv->dev, "cix,mbox_dir property not found\n");
-		return -EINVAL;
-	}
+	if (device_property_read_string(dev, "cix,mbox-dir", &dir_str))
+		return dev_err_probe(dev, -EINVAL,
+				     "cix,mbox-dir property not found\n");
 
 	if (!strcmp(dir_str, "tx"))
 		priv->dir = 0;
 	else if (!strcmp(dir_str, "rx"))
 		priv->dir = 1;
-	else {
-		dev_err(priv->dev, "cix,mbox_dir=%s is not expected\n", dir_str);
-		return -EINVAL;
-	}
+	else
+		return dev_err_probe(dev, -EINVAL,
+				     "cix,mbox-dir=%s is not expected\n",
+				     dir_str);
 
 	cix_mbox_init(priv);
 
@@ -613,9 +614,9 @@ static int cix_mbox_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, priv);
 	ret = devm_mbox_controller_register(dev, &priv->mbox);
 	if (ret)
-		dev_err(dev, "Failed to register mailbox %d\n", ret);
+		return dev_err_probe(dev, ret, "Failed to register mailbox\n");
 
-	return ret;
+	return 0;
 }
 
 static const struct of_device_id cix_mbox_dt_ids[] = {
-- 
2.55.0


