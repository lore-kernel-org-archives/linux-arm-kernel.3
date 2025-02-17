Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3809AC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 10:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S3eOW8UrFuxRaUp3//DxYdvLP38s+Fnhi3jsogW/ejs=; b=1Eu4zAV3/Nt5zwBL3zk4ZkGL/J
	L+Ww7V3LXrsOyFNAF1YUiHEJ8BcU0lno6g7Picp5gDAFWiErwzXvoLueRJx71/+JqwJzGC5AKCBsG
	tdqNaFna3BahUsV1EFmZbY7GJY2mnktTwc92RpuN1BXXpKzqB+fyb7hC8Qoia8nQx10ZiJMqHOiVw
	PuvOFtQ0pTvNLR3V6DyU7GtDvnwUW6g2nie0uTAWW4y7phjzZDGlECRp0toADYck+qfg8TVw/aJnQ
	n0x47i3cHkG5EYqjHf9ZYRWKFrzOS5MYk8i+++UekDqFWleMhBgrmI0c1dzrM/Yp0RRBRpPW3jmF8
	zrWsAFmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyl0-00000004BOd-2b2v;
	Mon, 17 Feb 2025 10:53:46 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjyCP-000000045Nw-1BSF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 10:18:02 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so838880266b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 02:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739787480; x=1740392280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S3eOW8UrFuxRaUp3//DxYdvLP38s+Fnhi3jsogW/ejs=;
        b=z0jv4Dg4Qrv7nTslNYQiLWrOLVGOLIIC3YnZ9TaXV3HiGkRPorAEnSjNi2DZ0KL0bg
         tByuCFgCglAyzyu0z46jmeoiu79xTnBOUjZYCg4VIL8N9C89hvpBlyjn8gpU4R1Jau1B
         K3Y/z0MFC3kK3UKHb2mHO7HRdoZqLjvBE7ychGFJBa3p9lbNShJgHEnXVW8Hss5EUei9
         H8q+6uUFevECHDT960Pzu6s0aZ2D9Axb+j7UNqWtZpu2eWVmhdMJN66HopkoLu0qp+8P
         sV0b8QIfDcnWBa92nqM2YsrXCsoiZa2nAcVP8K9jan8wiehpD5kZpfz5kDWzK+i1iNSF
         v7ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739787480; x=1740392280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S3eOW8UrFuxRaUp3//DxYdvLP38s+Fnhi3jsogW/ejs=;
        b=AxkWm6bwB8Q1bNGrGMEL1c2ZC//jkwnlbgVCKgWmOK6ktFG7mcvOdOyFf+L0y4writ
         jASFXGvXPQpBYCgHLanY8i8yVzoqGYlxyHTkmDCqU8H9LJqR87j0gYzB16yYRwVTqphg
         NdNzfTkp1apUHciC1Y4EQ8xQ/9dyE4x99VaNUnIXz2NsPf7VrxKBUU3vZp/eX7YT2r7s
         VYahJEo4SeCGQUNASdrH4gkv9zHqU5R5FETsrqIpal/Ah4/xmRI3YosVNyTFnbd4NzYx
         4cBb0nc5bgCV/XrL7qHIu8U5W+PoChoPjDaRAc1eFc7T2F+fBfoMiPfZMguqUsyeum/o
         xuog==
X-Forwarded-Encrypted: i=1; AJvYcCVlsms/9t477VKaVKjV/4SjchdEKVKdRAMPmPG9wNMN/S/c8ogEfEgMVA5SplLavEcm13YJzdSBK9JynJUNfChp@lists.infradead.org
X-Gm-Message-State: AOJu0YxpPKDrYqzkrvJhMmLJZw5heTEO3zuexhl8gI/hHcG/t2XT/RDz
	W2qOrr1nkbAPMW2sMuBJChu23HM3zDh/Qc5ad3/iSX48iIbV53/LyHQwK1scuO0=
X-Gm-Gg: ASbGncsJOHZJ+VHODWJCIeQapyOcmtfYSdvs3/Zp4P8GCexRs2vFPfxV1mzCALaDo+R
	wPAZnFQqejy9k6BBxFQxFhXd+XRxUuzGiQtAH+Prhm3UOohIa4/ipvW04SAerkfRnUYcqHhQASL
	IzVnG0Qj4WGBdpCw2zVkoSNuGuW3mGKadKreBJwPVgdAvfqkUpsn8Fxi0sIjqo7iKyKAHDEkVzh
	1hs4IvB34hTzXaKPAgF/LACtQ19FagXccXNOM2nYMCXdMvPUE6j27ZcocskqZHX2z1rm080A4OH
	A4mChl3I6xEG0oAMxkZSxEku
X-Google-Smtp-Source: AGHT+IFMyTV+7dHiqvFGQ0qFOxy54cnyzBe3bzzybDkILWKhJuv8kUgpRDn4pTMEScsdo+ewcWeQ8g==
X-Received: by 2002:a17:907:7f27:b0:ab2:da92:d0bc with SMTP id a640c23a62f3a-abb70c01ecemr899083166b.3.1739787479826;
        Mon, 17 Feb 2025 02:17:59 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb8b1767e8sm308583266b.174.2025.02.17.02.17.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 02:17:59 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	kees@kernel.org
Cc: linux-kernel@vger.kernel.org,
	johannes@sipsolutions.net,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	pmladek@suse.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	quic_mojha@quicinc.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@quicinc.com,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [RFC][PATCH 09/10] devcoredump: add devcd_{un}register_core_area API
Date: Mon, 17 Feb 2025 12:17:05 +0200
Message-ID: <20250217101706.2104498-10-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250217101706.2104498-1-eugen.hristev@linaro.org>
References: <20250217101706.2104498-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_021801_318469_BE570934 
X-CRM114-Status: GOOD (  10.95  )
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

Add API for registering device core area for saving into pstore.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 drivers/base/devcoredump.c  | 13 +++++++++++++
 include/linux/devcoredump.h |  3 +++
 2 files changed, 16 insertions(+)

diff --git a/drivers/base/devcoredump.c b/drivers/base/devcoredump.c
index 2a0e0b2fdb98..2cf17b148c5a 100644
--- a/drivers/base/devcoredump.c
+++ b/drivers/base/devcoredump.c
@@ -9,6 +9,7 @@
 #include <linux/device.h>
 #include <linux/devcoredump.h>
 #include <linux/list.h>
+#include <linux/pstore.h>
 #include <linux/slab.h>
 #include <linux/fs.h>
 #include <linux/workqueue.h>
@@ -76,6 +77,18 @@ static struct devcd_entry *dev_to_devcd(struct device *dev)
 	return container_of(dev, struct devcd_entry, devcd_dev);
 }
 
+int devcd_register_core_area(struct device *dev, void *area, size_t size)
+{
+	return pstore_register_core_area(dev->driver->name, area, size);
+}
+EXPORT_SYMBOL_GPL(devcd_register_core_area);
+
+int devcd_unregister_core_area(struct device *dev, void *area, size_t size)
+{
+	return pstore_unregister_core_area(dev->driver->name, area, size);
+}
+EXPORT_SYMBOL_GPL(devcd_unregister_core_area);
+
 static void devcd_dev_release(struct device *dev)
 {
 	struct devcd_entry *devcd = dev_to_devcd(dev);
diff --git a/include/linux/devcoredump.h b/include/linux/devcoredump.h
index 377892604ff4..9d80e4ac91ff 100644
--- a/include/linux/devcoredump.h
+++ b/include/linux/devcoredump.h
@@ -69,6 +69,9 @@ void dev_coredumpsg(struct device *dev, struct scatterlist *table,
 		    size_t datalen, gfp_t gfp);
 
 void dev_coredump_put(struct device *dev);
+
+int devcd_register_core_area(struct device *, void *, size_t);
+int devcd_unregister_core_area(struct device *, void *, size_t);
 #else
 static inline void dev_coredumpv(struct device *dev, void *data,
 				 size_t datalen, gfp_t gfp)
-- 
2.43.0


