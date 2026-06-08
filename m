Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333F7CD8C8E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 05:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=00X0z1cboQ6oKHbGCA7RyCrLv3pho/TkOSoPRKU0WEA=; b=1E+AScMPcFPQgxDA2WFBK8Rx24
	kjJIxIl5ZkDaPptUvYw3jzFFCbQP1G3KdTKDCVUg8aA5+2x/2lMWMbjiqIsQsTIlN+tJce0CnJNh7
	CFutImtRfjHzLBWPpnwQdX+/QqGE1Q/TXSvZmHzLh+WnpjDrB6aWueRkabfGVzuBAY+pd1Sd5mIIZ
	aCA3REYWzKRJ7U3GPm/DGzNmlwt7BLXMvd8lXsi/lakJFWWJq0gY9qkhrMdSp+DuMa5Yg8VwqFFwg
	G/iUw7UQZIspSlB4/yLEN/xP11W2HnVTxi0ReYZUZkNvAh6v5xRKYgtDRlC95PoAbeMW5611dZ2ei
	PSgI4tRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSPB-00000002pw7-3xjU;
	Mon, 08 Jun 2026 05:20:09 +0000
Received: from mail-dl1-x1242.google.com ([2607:f8b0:4864:20::1242])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWSPA-00000002pvk-0fcC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 05:20:09 +0000
Received: by mail-dl1-x1242.google.com with SMTP id a92af1059eb24-137ec563a95so4575200c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Jun 2026 22:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780896007; x=1781500807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=00X0z1cboQ6oKHbGCA7RyCrLv3pho/TkOSoPRKU0WEA=;
        b=O1UD17JQqT29/vQEG4t1vKnDyN7GPuEPwYhS2OD3CyORTyFBnAXuo1r54Zpd9rHhM/
         92ONHAixGmjP5Xzx7E9EFTvlGNEinlnMaJ6OQQM3DamTARz9itN/BrKs4e9osRdWqtFc
         wGQNOEa9+7V/oKgpUdQjTPv1ZGkl5CcSLM7smLjpsalPeSJ609aEPOYzUuEnHKVw6jVO
         m7lFrft0ckrna/9sIM8RyV20kq7BFFjHK/B+69jhtatZJx84NOYQkqM936IOdzmeHvWm
         L9lZoNFtAHVEY5cPZ9iMG417JJ0vUhRaY6R3x6kaOmnZoR3pphONnHpFWBC9vJPu4y0h
         aPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780896007; x=1781500807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=00X0z1cboQ6oKHbGCA7RyCrLv3pho/TkOSoPRKU0WEA=;
        b=q5XV+hWENWd/UwjnQ27sQD6onZpg1iJoUIriIcKZaigIPZ85+27C2fjUfkXuU5FuOV
         Ud8qegbA1ItGA8WejITXXOQTi7k2oXWnOz8gK9ehS6l+y4O+HFLKHV3QXA7xyoCvQeT0
         eBpaBUte/HgYMu1OfG1ekN0eWfqKuJ7jn9QaLGA2wqp/ate16Hu35HVD/NZ1NXmtYYuc
         cEGils9DIKzf+17uK3sC8nTUZYw0DIYGuZ7GZhHTwCPrp1LrxG+DQiNub0ckeIIj8yZH
         sv00YgaXYtOprKxu3+qLjqt2WPGMVNawVWAWy5SlhyvyTvFxT3CI7PuC19+LzPi95GXg
         AoiQ==
X-Gm-Message-State: AOJu0YyXOR5CsVB3gyfTRDSMRv4Tsb08SPkaMZ8X9DTTRBpMU2mEN/fo
	rQCauAWrgK7P5xh+RKLplJcWpOy87g0mYP7YZFHGhO4HNWxKGjLBriK8I4L2ent0
X-Gm-Gg: Acq92OH9Qbz1eMwYsR6RZqfs+eEy+HNB9PIxDKkF827B+zvSpsTZaaId0e/fHO9aUSG
	8gY5roljTHcDnT1s7cRpMhs+RcWzGp3SeVNEocswn3OuzBJBO1CJTXr9HRjrVFzpRdymCX9gqY+
	hmcWeaMYVeXvZ4sC4zVxL8nvBwEDO64k5HXi/AIINAUbmp8yCI7MI5UrlkwpiBGOEan8hK8j/TU
	JyhYqra6WExT+D/oQE8v3XvEHuRbC8yQn2j6VXmT1btTojjZsCdapeWiBIW7x3NQQLin1vry5Eo
	yNN/UztiO6C01XwlstW2cTWRzBqztjBfkoGJmguwyxMmqtfvulHOeK5SwhRLRdkHSOAEoHVlg8y
	NeJhU7B0toj8fGIuT2VyIov0b4cjxeAAXIPgzyqqBG/Bs3jU2jxwHuV8bcBmX/+2Zctmfxy7IYT
	UVkbGnI/wajlclRLXNjhNGB/+9pSOz1Q+d2+71F5SmVUaEKJxusBasMptJHHEU/XBPdyoRTci6d
	1p8vmNz8e7im4j9ufeo3UhApaC2DuzM9TCiNKWOGO434BfP4k1X5EyDcrHNujAKdyL/ypBFTjFB
	4Oy5DhiJn69ud91ObINOJHmkRvo/
X-Received: by 2002:a05:7022:6b99:b0:136:b370:64de with SMTP id a92af1059eb24-1380671273bmr7692171c88.32.1780896007014;
        Sun, 07 Jun 2026 22:20:07 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f549bbefsm11725310c88.4.2026.06.07.22.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 22:20:06 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-scsi@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
Subject: [PATCH] scsi: acornscsi: resolve set-but-not-used variable warning
Date: Sun,  7 Jun 2026 22:19:53 -0700
Message-ID: <20260608051954.109435-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_222008_239801_EB90A90E 
X-CRM114-Status: GOOD (  10.35  )
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

The variable "p" in the acornscsi_info() function is set but not used,
which causes a warning with W=1 builds. Remove it to resolve this issue.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/scsi/arm/acornscsi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/scsi/arm/acornscsi.c b/drivers/scsi/arm/acornscsi.c
index 79d7d7336b6a..ebf09b787dfd 100644
--- a/drivers/scsi/arm/acornscsi.c
+++ b/drivers/scsi/arm/acornscsi.c
@@ -2681,11 +2681,9 @@ static int acornscsi_host_reset(struct scsi_cmnd *SCpnt)
  */
 static const char *acornscsi_info(struct Scsi_Host *host)
 {
-    static char string[100], *p;
+    static char string[100];
 
-    p = string;
-    
-    p += sprintf(string, "%s at port %08lX irq %d v%d.%d.%d"
+    sprintf(string, "%s at port %08lX irq %d v%d.%d.%d"
 #ifdef CONFIG_SCSI_ACORNSCSI_SYNC
     " SYNC"
 #endif
-- 
2.43.0


