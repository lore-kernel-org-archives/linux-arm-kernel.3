Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF4FCA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 19:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qolo47kLruRZDje5v7puvJiYv8DgcRb8St2Hs5XCLlg=; b=ogMCAA71mDan43P/dYBHED9DCE
	FtJxaia+IfKGqGLuFkH0N8lX3qdjEyrxEh/ZF1qpn+8Fq8yduyPN0R2XQ/NVcaZ2mpJBk4jQK5bZ7
	em1f1MyBx08Q0THOVQ8egeoWKPtdYNITwPv7gyBv6mSia6WE4p5wQmnJixLDD5RMsYt1pG7n5PkPp
	gg4KE3Jn8wpBqNe70iYoIF91mGrghemQ/C1HKFrCzDVmyKQFk2luIbZzDjHTK6KH7YzOkYJlneyTt
	MTnXdePIQtnpwsQX6JvgDK6ZK8OLsd1eWQ0mEjtieT5Kh6fUeoGR7vDAcmhxIxdWNFOdHxZNgkZvp
	se9IBtBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utWOS-00000001akB-1hwK;
	Tue, 02 Sep 2025 19:10:12 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQyT-000000000ym-3olp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 13:23:02 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45b7da4101fso15048405e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 06:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756819380; x=1757424180; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qolo47kLruRZDje5v7puvJiYv8DgcRb8St2Hs5XCLlg=;
        b=RrMwxIwDUwjZK4sHbtGnPtpnVaKqlylvqQLeu2byO+iSC9QFyuZTHXBSCAQdfKCzap
         k1WJQlLZBBPv+tlIkR+DbrTi+MianY3KlcX8HDQMN8q69JOTFar7NbkY2CzBewbbZTcl
         zqpkUXtAZy2SgXa/8g7zIU31zXw5SJpce1WjfleL9ciJzsor/gGlT0i8kBq2QwXMRTuk
         zMtZDPPcmYqEe7YQO8bv4u0vDB+e5aetPvJF19oDBm4bkQYBpr1hcFti7IvWUuDwFVg3
         o/e79PlpYV/h2iZG8bvAsRQDc6sZ9qQWpp3FLbW4NNboYMJl1BoSn5eCqmtGBkOjAodl
         ifGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819380; x=1757424180;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qolo47kLruRZDje5v7puvJiYv8DgcRb8St2Hs5XCLlg=;
        b=sLRkuVEGXSpeSfTR4J3HiyRHEiVxwuPcTFk7t7N1AolIvt8u6csD9QwpX4FgKht0N2
         7MTqIksKA4SWlVdtUEEagvvCSvhYEYBynse8gJFxanc3KYbWuaFJi0iZsgFoweUB5nqZ
         bzAowdnyOniv0+8N0R4lqgWpBEMdpWOzyxMxIKSY0JVgXnI2rcHagy3Pdnq/2kvFVZs8
         laV3N/AVekct8AXWv2Qa9l9eqNjnqhENiJvHk0f6SshR8aetBDbdALRBVkyE9N0tExyp
         B4b35fdWqZLh9f6l+hOqcvLehgBaAFnjUGQlSz+VFdZ+WL1csPEwD0ui7iEYpc2+FZKy
         SzXg==
X-Forwarded-Encrypted: i=1; AJvYcCVj5P6dPO8SmpSo0ZZdQ4pKDo59PXNtFlz0vlmMFGvIoZ7d+nTM+IJ1bOBTiVTWzDNKqHgLVkLlrIu0DmnB7W+E@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1gjQnAt14I0nHb4U4Tby8kg18cOCiaJUY0DcoS+lBIFFuYz0x
	Sj+UMWFOvHXInbUXlWKo3UXiz22eyt0nXCbw63KtPE3Wv8lIMzt6pGEFWhWoDg==
X-Gm-Gg: ASbGncu0tbdhWjUtErDuiRhZ23Ivd8DFR5J9dJbHgodwV9ezA24YWRcQNrNbgpWdIpu
	GpmiFoNFtwsZqqPBy3tccdzfgx1Hbk+lZntQaKzfHCI7zw9qe8Oi7MVvINjtoLbRIMxmAoX5l84
	6uKI9tAFoAk9zUQ6DHjbBEsei23DKb7Z/wXJxxkGTjsxFALyb5sSSkotQeladt3JO+RA5VCEJBi
	L65827pfn/mmTQkC11fUJWfwn1RTIOqgU/JRVuy1SWrDfWw8gkrSdyaKTT9TZCD5Cd0HBtzXjtg
	zT/VjcPFBFFEaiw7TuCOFhGXduQQ6VFOx3K6Zy/MYZ5hBw0lVLqE4QCDOLZrxm9f0+MoGGqI/8L
	qYakWkLHk3mzZNhIsobIWWUHJhbru0Icn3Jb4pP6VblOk
X-Google-Smtp-Source: AGHT+IFVMpRzBsmi4JxaTIrSD5qdn6LF3a/HZb80zXbTgRnBpIOBBAGYwh5jd/sYemoWSplteKfu3A==
X-Received: by 2002:a05:600c:3b28:b0:456:201a:99f with SMTP id 5b1f17b1804b1-45b8730d443mr85114285e9.18.1756819380078;
        Tue, 02 Sep 2025 06:23:00 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b945332adsm44452155e9.4.2025.09.02.06.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 06:22:59 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: clabbe.montjoie@gmail.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org
Cc: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH v3 4/9] crypto: sun8i-ce - add a new function for dumping task descriptors
Date: Tue,  2 Sep 2025 16:21:29 +0300
Message-ID: <20250902132134.3287515-5-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
References: <20250902132134.3287515-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_062301_948980_E219058F 
X-CRM114-Status: GOOD (  12.69  )
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

In order to remove code duplication, factor out task descriptor dumping to
a new function sun8i_ce_dump_task_descriptors().

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c    | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
index ba30859e749c..b7093fbb8e9d 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -169,6 +169,12 @@ static const struct ce_variant ce_r40_variant = {
 	.trng = CE_ID_NOTSUPP,
 };
 
+static void sun8i_ce_dump_task_descriptors(struct sun8i_ce_flow *chan)
+{
+	print_hex_dump(KERN_INFO, "TASK: ", DUMP_PREFIX_NONE, 16, 4,
+		       chan->tl, sizeof(struct ce_task), false);
+}
+
 /*
  * sun8i_ce_get_engine_number() get the next channel slot
  * This is a simple round-robin way of getting the next channel
@@ -183,7 +189,6 @@ int sun8i_ce_run_task(struct sun8i_ce_dev *ce, int flow, const char *name)
 {
 	u32 v;
 	int err = 0;
-	struct ce_task *cet = ce->chanlist[flow].tl;
 
 #ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
 	ce->chanlist[flow].stat_req++;
@@ -225,9 +230,8 @@ int sun8i_ce_run_task(struct sun8i_ce_dev *ce, int flow, const char *name)
 		/* Sadly, the error bit is not per flow */
 		if (v) {
 			dev_err(ce->dev, "CE ERROR: %x for flow %x\n", v, flow);
+			sun8i_ce_dump_task_descriptors(&ce->chanlist[flow]);
 			err = -EFAULT;
-			print_hex_dump(KERN_INFO, "TASK: ", DUMP_PREFIX_NONE, 16, 4,
-				       cet, sizeof(struct ce_task), false);
 		}
 		if (v & CE_ERR_ALGO_NOTSUP)
 			dev_err(ce->dev, "CE ERROR: algorithm not supported\n");
@@ -244,9 +248,8 @@ int sun8i_ce_run_task(struct sun8i_ce_dev *ce, int flow, const char *name)
 		v &= 0xF;
 		if (v) {
 			dev_err(ce->dev, "CE ERROR: %x for flow %x\n", v, flow);
+			sun8i_ce_dump_task_descriptors(&ce->chanlist[flow]);
 			err = -EFAULT;
-			print_hex_dump(KERN_INFO, "TASK: ", DUMP_PREFIX_NONE, 16, 4,
-				       cet, sizeof(struct ce_task), false);
 		}
 		if (v & CE_ERR_ALGO_NOTSUP)
 			dev_err(ce->dev, "CE ERROR: algorithm not supported\n");
@@ -260,9 +263,8 @@ int sun8i_ce_run_task(struct sun8i_ce_dev *ce, int flow, const char *name)
 		v &= 0xFF;
 		if (v) {
 			dev_err(ce->dev, "CE ERROR: %x for flow %x\n", v, flow);
+			sun8i_ce_dump_task_descriptors(&ce->chanlist[flow]);
 			err = -EFAULT;
-			print_hex_dump(KERN_INFO, "TASK: ", DUMP_PREFIX_NONE, 16, 4,
-				       cet, sizeof(struct ce_task), false);
 		}
 		if (v & CE_ERR_ALGO_NOTSUP)
 			dev_err(ce->dev, "CE ERROR: algorithm not supported\n");
-- 
2.50.0


