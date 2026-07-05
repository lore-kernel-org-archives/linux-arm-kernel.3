Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB0AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 11:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6Oquh24DvrkOPCF2fJclrR7ZjjQ1IhHgVpf5JxW1uNE=; b=FYj4deZNt4eTE4Yarrd0o/4Gkm
	7EQBEUanfXWc1D+DWc/456CNM0cXlPAfPxhdCpNXd924EIqmWKCT19yCfWxDfPCLcvO2trTDg2zx/
	LnZkz99XkeQGQBQIdoiFlTBI5zaMgdfyMktp1tkLiBtyCzNOdHtvG1UfOoj5xQiTJjtnhnZpRsDb7
	GN87H7Pfjl0LouFV22WmIjQw81UaFVTgI7YSpJRQctz13PNeMzYaTrMFItmXbxLGTO42Ilf7pEzcD
	PIfVGTdrV9nkQY4cSv5S4HQDk8nIEnpT4KPn8YWW1S5xCqe9WvAL5AYp2H8AkFVvcSg+fa6ZZ5K+n
	pQyG6feQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgKce-00000009Fgc-3h8D;
	Sun, 05 Jul 2026 11:02:52 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgKcb-00000009FgE-2NPZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 11:02:50 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3817f800c8bso1292982a91.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 04:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783249368; x=1783854168; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6Oquh24DvrkOPCF2fJclrR7ZjjQ1IhHgVpf5JxW1uNE=;
        b=WrJMOEXfOGNA6Ym9zNMDN7PsR+ZNa1hub0QQg+u6CNYBWHbPYrMQ1hVHj9QoZ0uj4p
         rUV+4yk9TqbLyzxUWhxJepN01Ji87//hevTp3H9nn9Lbj/4QxF/dcuZWecEfVgkU1T9v
         Ohc/Kd9zpH+ijD0fmuUxp95tGnn8/eopMCMp910LfukH4jZsIs9fQlFLN/uwSl86RelM
         zcGULPdQiEp0HKkl1UPeU0BtFhp7LaMiJ4fs+Rp1EhHHNwRzEZrFMxb48DH9PIpfwlmd
         ut4QZMlr5c2ssNk+ShTiugiIr68Zh/kfGa+rsYuuIsRuCWgYV3EzDgN6ZToYDiLVSayY
         Pjyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783249368; x=1783854168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Oquh24DvrkOPCF2fJclrR7ZjjQ1IhHgVpf5JxW1uNE=;
        b=XsKrPNy0JbTq5tjV17l+xeEU2xtuC72SFE/ua9AxqQkELNNT0BbUMZX558hGbUXHXc
         z1lzyCfwjR7G6dWRImO6PVOev5tzYS3b9G0ISdrgOIFrtRYZ6eTBZMKNZTaZRvRO8tqy
         t2uz17X0e1JWbFbBz6fLVEbo+oIXFclToyvho5W9SKaaUIm2Kv9c9YvWkEPlk0P6vgXv
         pG2Cm72+z8klR7M4aoCtTY7gJ9VG445Ci/o4tAHBfjo2lF0qTIT1n5tKRqWkW8NUCUG2
         x6965mOMugfGmfa6m2jeU3/IvesnqKvmF6tvsTXI33sQpd0wdDmRp0x6D76YCIvTeE1w
         wKuw==
X-Forwarded-Encrypted: i=1; AHgh+RpDDvLAj9MU5+2lXGfnykZlSeoBLWpoZJMNx4tLMbRRdLn8yR5WAyAyGYgUI/QBZvZeLQ6dwj0k6sn2BUggLJFd@lists.infradead.org
X-Gm-Message-State: AOJu0YyhBpqEpkaU4UMoU7HghKc9h4I3okTn0PB6SRAZjfBCaGVxc3MQ
	ps44J9XUGztdPjG/ggLF2x/9NECixQgGzi4zXjEzdS7E96grMAag5Y6S
X-Gm-Gg: AfdE7cnCNxRbM75RmURxj3D5xR1YkttoUSzJztUPGgU1z0S36kQOe41wNUJ3pfxHPPL
	iJtlkTKNkfewd+Ty8GIq/uYZXBBpRmhgOsgXYWOChJfwqTi0zchkA+oQm8EqBe+uWSFGs7shPPz
	geQDgWkvnE3+kRnKOblSM9z07ecBt3AXGSPgyYERk1Cl3k10MzrqlWIAjmAv1VAa1X77+Qa6JKL
	eNgTzUqU9ZUAnA0YHeyNGjB5ggY9UI5+trflSZIOkKCGDfjGGtZBxydm6peHXktWWE5xiVk8ihe
	v8yT19cwiDew4UuFWDDM1NyLyWzbxsz/HrZVuJM0nl5mUKtmpW7FoxLzvuqY4d3iGx5N/xVkx6D
	n5pNc7jDqkig3O12Fk2SBZod8te46u0p4D1UC9HTrmfjBgDF4oFmhNUZHVbOwXG/lZ4J9DVVLiN
	TfpD/tnt9iWEw=
X-Received: by 2002:a17:90b:2886:b0:368:d839:28d5 with SMTP id 98e67ed59e1d1-3829f0074b6mr6040067a91.18.1783249367936;
        Sun, 05 Jul 2026 04:02:47 -0700 (PDT)
Received: from ubuntu.. ([2405:201:8026:213e:8312:822e:57c6:3816])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f38ee1333sm25067156eec.24.2026.07.05.04.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 04:02:47 -0700 (PDT)
From: mdshahid03@gmail.com
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohammad Shahid <mdshahid03@gmail.com>
Subject: [PATCH] drm/exynos: vidi: use memdup_user() instead of kmalloc() and copy_from_user()
Date: Sun,  5 Jul 2026 16:32:21 +0530
Message-ID: <20260705110221.153481-1-mdshahid03@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_040249_632487_FFA16A4E 
X-CRM114-Status: GOOD (  11.35  )
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

From: Mohammad Shahid <mdshahid03@gmail.com>

Use memdup_user() to replace the open-coded kmalloc() and
copy_from_user() sequence.

This simplifies the code while preserving the existing behavior.

This issue was reported by memdup_user.cocci.

Signed-off-by: Mohammad Shahid <mdshahid03@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 67bbf9b8bc0e..183671de711e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -273,14 +273,9 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 
 		size = (hdr.extensions + 1) * EDID_LENGTH;
 
-		edid_buf = kmalloc(size, GFP_KERNEL);
-		if (!edid_buf)
-			return -ENOMEM;
-
-		if (copy_from_user(edid_buf, edid_userptr, size)) {
-			kfree(edid_buf);
-			return -EFAULT;
-		}
+		edid_buf = memdup_user(edid_userptr, size);
+		if (IS_ERR(edid_buf))
+			return PTR_ERR(edid_buf);
 
 		drm_edid = drm_edid_alloc(edid_buf, size);
 		kfree(edid_buf);
-- 
2.43.0


