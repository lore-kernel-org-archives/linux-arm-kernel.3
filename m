Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AD2104891D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 23:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8fWIWwmKWIt1883L9mAf7k4c23EGAyZcTji/w/u6Qv8=; b=kWWIr6aq4dRPW56DhFSo+KFyO5
	r7tbLAuq72NZ7tJhPG4u7g/A60F4sSzwL97iaHjYGzKGYHMdCqey4cH5Hnucl5lGGy3Hk54RNYmC5
	SJhHkMD9hFaGSyUb/nT585h9DiSo7GgjJDKxIYPEX4sUXzujp7FunyFS5n0KYhotcTFIY3JFEj35z
	BAxs0U02WUu+OanniioCv1zo9azxkmGEZTD2hnhP3XTrT1YdJVgq8v3NTFNEr2v3+YuB826kDOVfD
	syORt2xPhKly3iWJnklHqJ/t05GpURAqq3M9dI/bQVdWK2OUQLydXJ+jHOxsCxl+RfNClH/R5aBmB
	+pJ3BhzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw7LK-00000009Gr4-2nKR;
	Fri, 27 Feb 2026 23:33:58 +0000
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw7LH-00000009Gqi-3WIM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 23:33:56 +0000
Received: by mail-vk1-xa33.google.com with SMTP id 71dfb90a1353d-5673804da95so1152428e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 15:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772235234; x=1772840034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8fWIWwmKWIt1883L9mAf7k4c23EGAyZcTji/w/u6Qv8=;
        b=GgCY2F72+PJG1++7DnlBv2NAJ3/sGUft6uyRskfYpFGCbpusPbIFfICj0iWqdZjo4A
         zI8ZsSqeqTQyyk4rqFp2g0nfHdIXrZtFRKcibh+ZLZzmIABqpM0C4SbQjWLCUABJlgvW
         GxUCzXvpBwAuOkR6vxnr6E55K3tEpwS/yHrBrpPjXhjyqN03Zku4hcNFvJ4+LOy1AgEl
         +SQR6DiUb+Tk7U+ptqEqlOKSQn9PLiFjafFgta5tss2Bs69lEBfMi/XCrKfVPscLTtcy
         7TXBEEjfNJD/2JqLu/+QsBAPAG8MUkR8kk+/mOk075O7N7+pvA82Lh9jEKMkOPeAhuiN
         SqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772235234; x=1772840034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fWIWwmKWIt1883L9mAf7k4c23EGAyZcTji/w/u6Qv8=;
        b=usULBHpJovXaV6OZxss6GDstdDkReS90umXcQduXD0jVuvqbbpZ1wmVbIwytPv3JmM
         SVAVpWGcIlhjVsV4xXFn1OQHWt1MbHClcSIN6HVJ6HLoCIkclIj8OxqNykaYq7snd4TQ
         Nwzo6N1D2D/3NWC1vEV2jINSZMGroCuIBfjaJX7dc3cEhHn2Tl4Zg/ORcmo15uQ74HUQ
         DCjorw3C2wBFWZeB/e/Iq0wEvXLHuNXDjr9HWSvOlFKG5AcAv3lgQ/VZ5pHdxzNb99QF
         2AU7E4BVASUN2WqodDoQCOsxXW9F9jVAG2cSLqqetvpKPWCX5JuAFi9gInD24glNOOeD
         +XhA==
X-Forwarded-Encrypted: i=1; AJvYcCXdfMtR+8RwMBiTt7/WZShmSEQtdvi9NS/BnxYkeFxyO/MFBiud7oX9T9Q/VoDMzGGCX74h6Tg/MP5fVov+U7AR@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6mDxhNSArnXLYvgEWYBC9A2LLFR0LRbiMa4sBUEu6HeX3DvCi
	SneyBX5daR9JfAAwV/qEdcVWQp4Upk+2FsAjrKrYsdT3UxrCBGcKS8/a
X-Gm-Gg: ATEYQzzR57a7o7QJUbhZb7PGEGRCbgXMLRz6ZXYrBCrBHmEMTa5bEl818jhbFABq3Vp
	QUOAtn4dmCAb4ssNrSuDGufzZ/p5kFxXgYLp0sAXYzVnrO+eTyt9e9JD0h6sKbhT1h8RMPj5hg6
	W9bhn1Ee3td1YIUo6U08T2UCwmobulI28gHMKmo5xpR6hQtMhw0N3SbDzRC0V2N5C+UCTDJ9OKT
	bdUNPSZoxFz6cjXGPcEXnk4fYwdhGBZ4bxKGCOWDS/bI5io8pKbK5as8O1GUX0C39JIQ+0ER2Wh
	sqNuuMDOAC9/2ZklSQEgAvkpm9TfYtyN+LOtr3c3TYZkBMaT+H3PIcEfALBBwhZDTKEXm0RRcjp
	fY8MUxIQtyOfS2OcZV2qrC9u2/OjrNSYr3/9lc7m2t5mRT5paZIyliB74YYuoBPHIF90+oNwXwN
	+iaYH6sJcAK1JlZ1akRyWZuHYhcL6/g46I8r18mccG/w/moLz4BaGIOVeqV3FX2Ui82O/11KU=
X-Received: by 2002:a05:6122:1684:b0:55b:1a1b:3273 with SMTP id 71dfb90a1353d-56aa09edea9mr2266680e0c.6.1772235234067;
        Fri, 27 Feb 2026 15:33:54 -0800 (PST)
Received: from fedora ([190.97.237.135])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a9228d776sm8069541e0c.18.2026.02.27.15.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 15:33:53 -0800 (PST)
From: Elsanti <santiagojoseleal27@gmail.com>
To: suzuki.poulose@arm.com
Cc: mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Elsanti <santiagojoseleal27@gmail.com>
Subject: [PATCH] drivers/hwtracing/coresight: remove unneeded variable in tmc_crashdata_release()
Date: Fri, 27 Feb 2026 19:33:45 -0400
Message-ID: <20260227233345.1064567-1-santiagojoseleal27@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_153355_900910_5264C5E9 
X-CRM114-Status: GOOD (  11.27  )
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

The variable 'ret' is initialized to 0, never modified, and returned
directly. Remove it and return 0 explicitly.

Signed-off-by: Elsanti <santiagojoseleal27@gmail.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 36599c431be6..e29012c451c5 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -401,7 +401,6 @@ static ssize_t tmc_crashdata_read(struct file *file, char __user *data,
 
 static int tmc_crashdata_release(struct inode *inode, struct file *file)
 {
-	int ret = 0;
 	unsigned long flags;
 	struct tmc_resrv_buf *rbuf;
 	struct tmc_drvdata *drvdata = container_of(file->private_data,
@@ -414,7 +413,7 @@ static int tmc_crashdata_release(struct inode *inode, struct file *file)
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	dev_dbg(&drvdata->csdev->dev, "%s: released\n", __func__);
-	return ret;
+	return 0;
 }
 
 static const struct file_operations tmc_crashdata_fops = {
-- 
2.53.0


