Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78873C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 19:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FrwSPRAUeS/FW9rcjfQv/aQiMRZkm6fgGKtHd8d7S3I=; b=kqMGx2ahZLnSgHGq9/TNAv+bn0
	7sljL/CpDjSpjHQVdy51H+YxftIny773a5rX9Cui7wOvEW+Bboo8DF+GOGKXYTgTA9KvFk44QlCYw
	01qdiB43gCK3Ez4oZhNQo5/cWVy5hsuG/eaJhgn2k6FKFaALZdIbrBh9rsKHontUWh00GWvSuHBuD
	bp5hAWYxH9PUsxqzGm5f+EvHvVewMKZM/duATtTWeCsbLigpJm40c1Ew0YmJlUXh5dAo5MfmyxrJv
	BOQsQ6hefmMYmzYUEAPaJuXVfJyDMfgKEBZOoGUF1rQrvdm94PbI+UJbnQ5Nr0+ejslK/tqcDuSXV
	bgGBIDpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmeIT-0000000Ez7m-441S;
	Mon, 24 Feb 2025 19:39:21 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmeH0-0000000EyyU-0lyf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 19:37:51 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5ded1395213so8097106a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 11:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740425868; x=1741030668; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FrwSPRAUeS/FW9rcjfQv/aQiMRZkm6fgGKtHd8d7S3I=;
        b=C9SEvG6POid7k1DmqcR72R6GIk3B9rPYUvpp4rAYIbuWJ/u4GrAuVmKF9W69EYvmE0
         DkG8d5lsBSq+dTFimlCD0UyQmBA0IkRdJG+V9rG7RQD4J/kTEl/G51cMB68ApFfniVRn
         tA8ZPItthESlOW6PmQ01rXNnY2DaTpT6mRF8zyKTj4bNKFUt+zvru2Mqv+N0T5jq/VWl
         kEX9W8DMwgAvo/Yc7bEONFnabHgYBLCyphfvs181IGv0qrN1mj94VR5yyEE61y9/cvDr
         G1n0XlI6HoFmX1BuOeVRt+6RwY5ZXvmQQA7d/Za4oO42OJD0TwiLfIaLPTy7dibAcmAh
         mqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740425868; x=1741030668;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FrwSPRAUeS/FW9rcjfQv/aQiMRZkm6fgGKtHd8d7S3I=;
        b=MUGQSBeyD/aUa04dPQXAetSZoYWwY0qllFcpMyQbV3Yu9MbfsTWkQJAKwmTRvOmkw9
         IQ1yB2FlyNVySh8XLORvny3sWvCW5u4NWiOk96iyS0NXbPDkXXSWDV/5EoHUK/nH0Zdt
         mQ2yKDWD/YRQbrs8TAb/vsNajomwGkt5uRdXYuZC0iBpd6UWN5wAucHo3jF6xmxWj07S
         UM52ABA1EpHubpSr8Mnz4I46sOSfZl6ohNbBwD8wRyL2aC8xfJZt3LjvGB9a3/ruoG1e
         e3R4Pq+dmM1J/w033eXRPPkCW+EIQAI/YzJyLm4dieUPQpjp37HalBNednW22RzOlLpa
         WPHw==
X-Forwarded-Encrypted: i=1; AJvYcCXaGRioXXL4NGpdneUdltwK9tKNfIVXGZ2gTC95BqGtWsXsyPxpRi3AAPNjNfn4fPn5MAm1eEMjpt1zEZIBAOqz@lists.infradead.org
X-Gm-Message-State: AOJu0YzRNTRlg19Pd7ZN0duFqsmsc8siqCChUZfYuoqusir6NVLueH6H
	wcwbOtPCmrgjrffxpFEyoHdKSXlakHTlbWi5T3JWZ/ebALb9ChZb
X-Gm-Gg: ASbGncues/shgL1XsK36pa9C/RJhcYcfgdZ7NMCOACCJ6Qkot4rxTCw49Gyxo0tD5Zl
	bVK2otP+hkXNzEo49AnHqbzcLa2wcZoPb07WLUXKu4NP3pmX/Xhu0wTRqygzXKG+6aOv7YA84v2
	VcpH47bbYtJp1upJfw1GTbDBegZtLcig3yRLhuwnStYd8Fi6WolsliJ0bgLogl+U/ddVtPyZ4xP
	TYtNwPeJ28gWIMlseRHsRVrxkyRZHGPIkkWM02kEe2wNbqlqQvRe9HCxbytZyxyNkJCHCDa//k8
	kJeIIPmLeHiKmKOQoVPQ7jYvaUt5Ox7NamiRrqyLFASDNhGI4qgigQ==
X-Google-Smtp-Source: AGHT+IEXdSi+85TYw9BJJn9VPwkcYV5Sc2FyfubwpLvkmNaQfzvdmWiiBDyIdD2Y+3f3lnmdqrxljg==
X-Received: by 2002:a05:6402:280a:b0:5df:b0e9:a5da with SMTP id 4fb4d7f45d1cf-5e4469daa0fmr282521a12.16.1740425867880;
        Mon, 24 Feb 2025 11:37:47 -0800 (PST)
Received: from localhost.localdomain ([2a02:2f0e:c501:f600:21cb:f6d7:4e65:6e28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e459c3fa2fsm58852a12.5.2025.02.24.11.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 11:37:47 -0800 (PST)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH] bus: brcmstb_gisb: use dev_groups to register attribute groups
Date: Mon, 24 Feb 2025 21:37:30 +0200
Message-ID: <20250224193730.2698894-1-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_113750_221912_C8019113 
X-CRM114-Status: GOOD (  13.45  )
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

Instead of manually adding attribute groups, set dev_groups pointer to
have the driver core do it.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/bus/brcmstb_gisb.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/bus/brcmstb_gisb.c b/drivers/bus/brcmstb_gisb.c
index ee29162da4ee..91ef99c42344 100644
--- a/drivers/bus/brcmstb_gisb.c
+++ b/drivers/bus/brcmstb_gisb.c
@@ -395,10 +395,7 @@ static struct attribute *gisb_arb_sysfs_attrs[] = {
 	&dev_attr_gisb_arb_timeout.attr,
 	NULL,
 };
-
-static struct attribute_group gisb_arb_sysfs_attr_group = {
-	.attrs = gisb_arb_sysfs_attrs,
-};
+ATTRIBUTE_GROUPS(gisb_arb_sysfs);
 
 static const struct of_device_id brcmstb_gisb_arb_of_match[] = {
 	{ .compatible = "brcm,gisb-arb",         .data = gisb_offsets_bcm7445 },
@@ -490,10 +487,6 @@ static int __init brcmstb_gisb_arb_probe(struct platform_device *pdev)
 		}
 	}
 
-	err = sysfs_create_group(&pdev->dev.kobj, &gisb_arb_sysfs_attr_group);
-	if (err)
-		return err;
-
 	platform_set_drvdata(pdev, gdev);
 
 	list_add_tail(&gdev->next, &brcmstb_gisb_arb_device_list);
@@ -550,6 +543,7 @@ static struct platform_driver brcmstb_gisb_arb_driver = {
 		.name	= "brcm-gisb-arb",
 		.of_match_table = brcmstb_gisb_arb_of_match,
 		.pm	= &brcmstb_gisb_arb_pm_ops,
+		.dev_groups = gisb_arb_sysfs_groups,
 	},
 };
 
-- 
2.48.1


