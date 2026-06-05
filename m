Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41374CD6E74
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 12:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=shO4CEuYdjm6KH0/u78uU6qowwMulzIyxJQ1MR7e7A8=; b=qYWnht0e/gK0w+S1vYB7i62lb+
	Pjh/ZQ3+74vplSrsrNID+rc71PxnLQ5jqhQuAv+YU/qr0kLpV7V4B3NowvtFvy/pIofkIo1FgiKyG
	39iBzIuKFFiSUcZ4GVf7nOhhB826CTUTfeZSntaF02xW+Exzrr6FsOndjPbD8ZYh0bEyjo5EJmrh9
	Am1bGxRBKN3o2vcj8S7WsHHjQ6ljtHIiZPQBdBlA7TIv+9JZEV+xyYKDc/3LTP30LeRiyqIdsqZvP
	Kmioq64T1VwwVY5y5aO006y3HoXefse1Rxy71utAJpK5EhBJ8Fs/silh91rPkkIp7ax7pWUD/yTCH
	9EvtCUew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVU4B-00000000drT-3fen;
	Fri, 05 Jun 2026 12:54:27 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVU49-00000000dr7-23zM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 12:54:26 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-8ccf7b7d188so18859306d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 05:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780664064; x=1781268864; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=shO4CEuYdjm6KH0/u78uU6qowwMulzIyxJQ1MR7e7A8=;
        b=lG60csYmyybbCbfG9jhj1xQY/Cqrv77/ezpD8e3TZ/hGrZMBrYPh8FNRQSRM9ZpT0Y
         lp027DAJUWYLeiTgFFuKeSIP6ZL+t9rBIVhLOZNEzaDUYr9gO8fVT+f2uSi6ftH+XSVN
         BurQPwNO45tZvdqDZRoEAoqC9hcMOnbxEE8I3i0+i/iYeyN50DhsUtEbDXSY5HqhZB3U
         mRLZdLTl2gnaJSYHQehsQRwpBObzru0jBcE/ph+sTcgE0I41tHgYRmM+M7fOvNW2kYek
         SAiMxw9p8oYO/LnNqC7htWZ+I2N1xXSCqNxUBGqKSpg8VIHsoPRVHuNFhXsihDqESI3R
         Toxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780664064; x=1781268864;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shO4CEuYdjm6KH0/u78uU6qowwMulzIyxJQ1MR7e7A8=;
        b=JNBcnvmJN4LNoXd/LwgTwavtcqbAlyifABK9nVwOnvAWw14ychBH4tJeSlcseHLrw8
         JKDEIO2WhcgAg45JmonRun6OzK97bTkA+AXmKdtAoaSwU6hJgfKibEiFgq8IYnw+Rak+
         Bp4wVFwInluoCZ6fDbEzP+OJtKlNkcGBbZ427+8CnJtM9t80XW2YEnm13PyOBcHCdS9p
         8BSR75t68Ash2pHmjgaTNXJBDa1cacgQtEDLpcFU3a0z7ELFca4jcBopvUMKQ6rYk9RD
         eJhfPUnaDFHHo+wwCgaoUBysiRAa6ZSOEHGDGp95hbh4wipxXnZyJrHavZaszaQ46dxF
         6k8w==
X-Forwarded-Encrypted: i=1; AFNElJ/FCP8K2GfNEZ7MWOcQQRzFQK4K7yCYH63mnaIk1nVcNg/UsFwXqxzK9Isomk1AVCl+NqA2ZQDUT1yUvsFQPsGI@lists.infradead.org
X-Gm-Message-State: AOJu0YzdkdvIQ5ZivTdFM2XCD9RzkWfQJnPjRyRbZzr7TheiUFYfNDym
	pR9VhJGac9espEdWCEoIGiy+Q+3PDKYSOcftI1o2Yuwbtx05B97jmfwiINnqpxdifao=
X-Gm-Gg: Acq92OG/87nbw6gzFRcbqvI9KNoS/78zfapyy86QHCi8HA123VEfjW2/60uJMVCdola
	LtNq/m6yLxZKhptRj54ww45hwWD5n2/OssWcNBeRqzMoiYi2q4tBc2H6XaNg6m40Xk3Dc4Hkvjn
	mluBpD2x5UGyEBNq45otcLDcNAZtmW381cOYJUkJXvYrZKWPkY+aW60ZhqAXV7xYibfZmLtulfK
	/BHGR3sn6qTx/AvCoFtQQSxk+oNyUjTxUAOisiBwJVLAUNkjdarBpgqnTU5ErRUTyw/mKsuWCSk
	DMgzazlmzkUPAwYW/3JJOHlgutir7Bi6g7Eghr/ENdVca8YsPbZzijnIgN6YolEvJ7DJSFb+4kA
	HJ0ZbAq+7z+zFMdWaWqarG7xwitP/5dG/iSfrZToRu8ybpawGDdt+RfoygYuSSIId5ytVN+4pIu
	AXfSNYAoUFiV39zYE+nWacqhGjSB/cQa8RxiTiWm1kROBU+77q7Jzciu7ea2jWew==
X-Received: by 2002:a0c:eb09:0:b0:8cc:15e4:1208 with SMTP id 6a1803df08f44-8cee6156373mr46026746d6.32.1780664063708;
        Fri, 05 Jun 2026 05:54:23 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd0535b0sm81783306d6.28.2026.06.05.05.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:54:23 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Borislav Petkov <bp@alien8.de>,
	Tony Luck <tony.luck@intel.com>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-edac@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v2] EDAC/synopsys: Fix cleanup on injection sysfs failure
Date: Fri,  5 Jun 2026 08:54:17 -0400
Message-ID: <20260605125417.2348115-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_055425_556202_EDBD192F 
X-CRM114-Status: GOOD (  15.52  )
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

edac_create_sysfs_attributes() creates inject_data_error before
inject_data_poison. If the second file creation fails, the first file is
left behind.

The same failure path runs after edac_mc_add_mc() has registered the
memory controller with the EDAC core. Jumping directly to edac_mc_free()
skips edac_mc_del_mc() and leaves the registered controller state
unwound incorrectly.

Remove inject_data_error when inject_data_poison creation fails, and
route the probe failure through edac_mc_del_mc() before freeing mci.

Fixes: 1a81361f75d8 ("EDAC, synopsys: Add Error Injection support for ZynqMP DDR controller")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
Changes in v2:
- Remove the CONFIG_EDAC_DEBUG-guarded del_mc label.
- Call edac_mc_del_mc() inline before jumping to free_edac_mc when
  edac_create_sysfs_attributes() fails.

 drivers/edac/synopsys_edac.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/edac/synopsys_edac.c b/drivers/edac/synopsys_edac.c
index 51143b3257de..9ca2a842612e 100644
--- a/drivers/edac/synopsys_edac.c
+++ b/drivers/edac/synopsys_edac.c
@@ -1120,8 +1120,10 @@ static int edac_create_sysfs_attributes(struct mem_ctl_info *mci)
 	if (rc < 0)
 		return rc;
 	rc = device_create_file(&mci->dev, &dev_attr_inject_data_poison);
-	if (rc < 0)
+	if (rc < 0) {
+		device_remove_file(&mci->dev, &dev_attr_inject_data_error);
 		return rc;
+	}
 	return 0;
 }
 
@@ -1431,6 +1433,7 @@ static int mc_probe(struct platform_device *pdev)
 		if (rc) {
 			edac_printk(KERN_ERR, EDAC_MC,
 					"Failed to create sysfs entries\n");
+			edac_mc_del_mc(&pdev->dev);
 			goto free_edac_mc;
 		}
 	}
-- 
2.43.0

