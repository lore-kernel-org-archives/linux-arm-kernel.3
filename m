Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB5EC88E40
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 06:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QgMX8CiibWPEaVVcLSm85/QfWicxIoxBAscuNI56DwY=; b=w8uWAwZcbmo3LCCC97HW9p9Cwh
	duYzWAl5LwxmxXFSlBlXD0vxylxhNZ6NxGgkh6/LXSAt91xbipkdRXshpFGDU94zvsUj7XFo19eYE
	niYUS+oHtcvgEUOabLCKkvuFuvdbS8BO44WHp9aLPsFacyRknHnd4J0g/nkSmbvPoNfXexvHuh4GW
	uHwvchXiFR0Jilykqgu+7kchPCuxp4ggDRWGx8XSNIAr5HBV1+kZUzTqjlDbI+RuCeoTF7MDNvOTa
	Uzo6xi4pSfawFCXoO3lrKjNqxdHL+tn5qXgz4IWM4QMbKsiXzFagggneaWc+IIyIRK7wIEBLAXn0O
	brqZc/Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5dIn-00000001Rs9-2NXM;
	Sun, 13 Sep 2026 06:02:57 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5dIl-00000001Rrj-0DAL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 06:02:56 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2db18fe459dso3611735ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Sep 2026 23:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789279374; x=1789884174; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QgMX8CiibWPEaVVcLSm85/QfWicxIoxBAscuNI56DwY=;
        b=Wj2j2vTl4PReUKLxoyxb+Kntiyf3BuDhoRBxkfUFeaMe32g49YTLwcIHyJxA7liMvI
         Y5nwgZxF/pytRFxO/tVNSecxD5LVVbYgOG1Ru98/5ZlKls/RpfIQ/r5g+uUeOdTGGx1O
         Nnsq5eiuAaWwYotyR+MhwUBDquVQvOXyem4T6OTobmBlUd4c24EMaj3Ew4t8wt41K7bk
         ovps+WQNMsyrC/D2tg6t5zPvTZmlTIcUuxd9jWrYWEVCRm5FXmu0numMr9hHbqyASRnq
         mGOffjy2qllnnwDvJqQ/Nuq/THw//k9uuTHf3zQmtWXvIW1N0/aNQyFXRRkCTRnOCwDl
         lzNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789279374; x=1789884174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QgMX8CiibWPEaVVcLSm85/QfWicxIoxBAscuNI56DwY=;
        b=aqHiT3UWSsITljtBITViB3OZpPmFIUnRetWwjuLVDyzldiW0OjI6Q5gMvt/35IzvMk
         s+eys+UoeO+YKKLoHdcRu3GPBOFYzi2RGc+jPZ/FpjNK50Sn34W8lNFgsZI47tWRi3Vg
         JDJ25QH1/hee9NAmYq4pOQlgooP7YBPqKqK99tisL/5gOVT7s7ePr4ILNQZLVYYR5kdF
         /meR2T2WgMhNY5fBFtW/43tYz6ADOshUV+FuIxaRotr0XdIV6dvyXLzQcZMvgN6RqF1L
         L5QHhurSy9tG5reJ0q52vDzFuUrTjzSUWNWmSDtgjmiO0S+iERBPw4QR/bjcGtyp5LYl
         VqvA==
X-Forwarded-Encrypted: i=1; AKwUvBzZjEeQgf+oCxaSwHYAfKDo95fJst+l1Lr9gpPVRSIl9QXWd8Ijy+di336zzXiF+LAbittFM3/NFlfM1SQBmVCr@lists.infradead.org
X-Gm-Message-State: AFuF++l/NidyMKxD8YK5L3N6Z9BkSIZhxWrFoIFkzcQkUAaMilCr7eRG
	Y4Eeyx9icGnZKzu4YHs0Cq/Qf1FenSG8j6+939SAB6TSzNcoxD8r4+hp
X-Gm-Gg: AYBFou1CRDZ3yPhUx1+/iL/jDWF/Ykyq4ZMLCQNgeE63IdkgIaKmRb4mC1f2219QTTU
	xUBaAty3UB13YCenXtirRpiOKJ9yIHrqGEVtJMLQeZaDimOyetqDwVVWDdWIMbdE+YcikthXhBZ
	KjHocYHrCHG1YqQZB0Qo/CZhWnBN1/3ucXRcsfyw/EF2+NnShKI6jRmptek5ZocQetrO68O8UWs
	umIK1OnG/NaoCdCwjhP3tuIhXF4QHhK9eBDlvwNFMDKQxGEcGjD5Ej0o//ZQ9yKkYMBfZJ6NDbu
	Y5bxLk5VAXeXmcRLlc9C/HkZHsDcVBPljT/AHYSu2+7dQLe6HXKPEATwRbQJZOUfrYkaQfkVj8j
	HqDnleoS3Gk0CkIYiR0K7HlYLWVu3uCLcv1hFGUuPkshhaSRhDf0oPHi5dKCiYGTGpg+gjcL2pB
	XGDi5G6KK5TnkZnKLYngBwnz7LmEmZBhCwF0u5WDmm0ehRRKoDYnABLA==
X-Received: by 2002:a17:902:c947:b0:2d8:d4d3:3fc0 with SMTP id d9443c01a7336-2dd4bdaf9bfmr98050145ad.20.1789279374119;
        Sat, 12 Sep 2026 23:02:54 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd3f0faf19sm23811575ad.12.2026.09.12.23.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 23:02:53 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Eddie James <eajames@linux.ibm.com>,
	Ninad Palsule <ninad@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Alistair Popple <alistair@popple.id.au>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fsi@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] fsi: aspeed: fix memory leak on remove
Date: Sun, 13 Sep 2026 14:02:42 +0800
Message-ID: <20260913060242.1426845-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_230255_104221_5204D87E 
X-CRM114-Status: GOOD (  11.97  )
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

fsi_master_aspeed_probe() takes an extra reference to master.dev with
get_device() after registering the FSI master so that the aspeed object
remains valid while the remove path performs its cleanup.

However, fsi_master_aspeed_remove() never drops this extra reference.
After fsi_master_unregister() releases the reference held by device
registration, the extra reference remains and prevents the device
release callback from being invoked. As a result,
aspeed_master_release() is never called and the fsi_master_aspeed
object is leaked.

Drop the extra device reference with put_device() after the clock has
been disabled. This allows the reference count to reach zero and
aspeed_master_release() to free the aspeed object.

This issue was found by manual code inspection.

Fixes: 606397d67f41 ("fsi: Add ast2600 master driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/fsi/fsi-master-aspeed.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/fsi/fsi-master-aspeed.c b/drivers/fsi/fsi-master-aspeed.c
index aa1380cdff33..d21d06b44350 100644
--- a/drivers/fsi/fsi-master-aspeed.c
+++ b/drivers/fsi/fsi-master-aspeed.c
@@ -652,6 +652,7 @@ static void fsi_master_aspeed_remove(struct platform_device *pdev)
 
 	fsi_master_unregister(&aspeed->master);
 	clk_disable_unprepare(aspeed->clk);
+	put_device(&aspeed->master.dev);
 }
 
 static const struct of_device_id fsi_master_aspeed_match[] = {
-- 
2.43.0


