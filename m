Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEB8CF3943
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AuFAdi/dQ7TYcP6kPKC/D+o7MTxWjWW8Ku2RD10GvbQ=; b=D4NKh2wCwUVTjG8vRldsO2cQma
	+GCocLcWUGKLJSae7R2c/tG0JHi1ke5G2oY5J6FPIap55GsYqQ0m06hxHcLYLj2d2rJig+vI5ZZM7
	6Hlk1hF0seqZNL75IMZTzCG7BKVnEaN87vZLhg4XmEmI/sBKlghZtfjFyzNZiRx9943JqWNJvnDCT
	V7pahPeY2/bNQQB4yjbiSUZjYcvNXL9MjcMwQeyRiLpYop/Tn7kqxpAWhRM9HJtQ1Ddsnt1lt1r4Y
	5tNR5xgK8ghVGZzW9MlYJC7EZquulc9Kx5II4wK5bDM1njcD8mry3Mtc4dqVgyHsVCoi3ddLqCGTq
	+ejINEKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNW-00000003WWb-4A2Q;
	Wed, 19 Nov 2025 15:45:54 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkNE-00000003W8a-0rrd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 15:45:37 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-42b3c965cc4so606802f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 07:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567134; x=1764171934; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AuFAdi/dQ7TYcP6kPKC/D+o7MTxWjWW8Ku2RD10GvbQ=;
        b=QF4KthcQRaDv0Xc30BdVBukaBwHUro6weigckzS4k/ppT5u03+uh1171qbkEuxfbXB
         M4AEOfmZWZSePnVftvrejlB6BcfkDc0bKt/UNuL1XB/ostJhH87do3BFu7Sr4WJ0D8oR
         pTgKnchwNJ+IyyeBcv2SoQIal5kl1Lnb1cbBgBvfdrZG88U/TWwE9OPuqFGy2pj3NG4u
         jcZStOCElDq5RUj8M/fyzhreklvgJdlOLkXtBICYg1tMHn+UiFKJqGJ59wToK/GG/Me4
         59bCm34CpigjZKHSx84W6nPWUsU/Wb+H5CXEwsp7EZbAliqGoOs3II4VpJULHGMuDYfH
         ohVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567134; x=1764171934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AuFAdi/dQ7TYcP6kPKC/D+o7MTxWjWW8Ku2RD10GvbQ=;
        b=o6LTRIJp9UZCJJkSMHzbSdXZGep+3mjztthmv7/aPJYjD6EfJNQHStVlq4TXtv2Bqk
         C27w133woU/EFHuc/oMjogvCbdEYOgMGCgGAyF7VVFjnAmfqMhUcGEnxm0vfOI8ZsCpY
         G1v2MO7BFLI4V4rJPoRZhMfHAJT7l2Rb1FMJquzMFXwUaVdIB6EBJ5flTyVE445kgUN/
         wWztiTcaxox8FQDeDVWwPeA0Nj3CPPuE9OL16X3H05p055trtF/q0wBq8AVsFAXhtOOH
         6LSz3eTnUn2yV5+U56WNDKNnJVcHdyEoZ/0B9W1Qapdqd6dvtVYdvFvOlE7FEy3b+Twy
         QmVw==
X-Forwarded-Encrypted: i=1; AJvYcCWF5UqUQbvnfu8gYy8S/nspAZLWVIMbx18msnyBygiYdNfo5TIOR95RPhAlq7D9qei2QwcEDCS7uvePt81DDcEw@lists.infradead.org
X-Gm-Message-State: AOJu0Yxqboxl8M4TOtTCuq7EpHn9loML7NM/t0k2S8sxQD+8TCskdz1i
	so1o02DnpXVtsMru9Eug5v4AbfBj9C/qPhpYtBwScecQS0geTG1cSsDX/6D+3xMOMEY=
X-Gm-Gg: ASbGncuMlPNHAXA2SZdrC+tgIqT6ACHaU4b20NJhtQLU4Iroaixw9NNi63t3V5d+U+o
	vI8BjFq4yVG+/p2OPY1J5T7e8a7UkUahgX3LfZ/Jwm4cFsefXP3bDSz+WPDMt6FWCBxVLPBBa59
	rwaIWJflut5FREzh+ArKCo7a+4lGds9KKhDoDK55Yx9qXsxzpVoeLRmW3OFDBe08SGuj+HeBdRF
	uyzUTjCc8h/D1WXT4DDC3h8MIwY2amMjBFEkCjWArELWW20LnNx74nCA90z/3eZYqiJAsdbPX2s
	josRMd6pQh6fG4l1D+0YD1BRi228C733/XZxkiLuH4g1nGt0NQf2ybGOYfdTzXIRsbIqqPB9i0b
	qEuDnYPw8FX9DWuA3MdVMcVk/hNOKEjf1s6WmXtKM0g6+LHhl0GxCmOzrDfDbYFJNav4KfC3iG1
	e19zO5TsgZgux4Wao7kutDX3GsoyGgJA==
X-Google-Smtp-Source: AGHT+IEEW1UNe8+i9pRkQXcVi1K6qHmkkggtbzPn6ocK+c8Bp9XYSPJPKkUMg9h5XQagLem1rvsEdA==
X-Received: by 2002:a05:6000:26d0:b0:429:eb80:11f5 with SMTP id ffacd0b85a97d-42cb20e4a02mr3468125f8f.26.1763567134112;
        Wed, 19 Nov 2025 07:45:34 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:33 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 10/26] mm/swapfile: Annotate static information into meminspect
Date: Wed, 19 Nov 2025 17:44:11 +0200
Message-ID: <20251119154427.1033475-11-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_074536_310725_814F2823 
X-CRM114-Status: GOOD (  10.58  )
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

Annotate vital static information into inspection table:
 - nr_swapfiles

Information on these variables is stored into dedicated inspection section.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 mm/swapfile.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 10760240a3a2..ee677be19041 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -42,6 +42,7 @@
 #include <linux/suspend.h>
 #include <linux/zswap.h>
 #include <linux/plist.h>
+#include <linux/meminspect.h>
 
 #include <asm/tlbflush.h>
 #include <linux/swapops.h>
@@ -65,6 +66,7 @@ static void move_cluster(struct swap_info_struct *si,
 
 static DEFINE_SPINLOCK(swap_lock);
 static unsigned int nr_swapfiles;
+MEMINSPECT_SIMPLE_ENTRY(nr_swapfiles);
 atomic_long_t nr_swap_pages;
 /*
  * Some modules use swappable objects and may try to swap them out under
-- 
2.43.0


