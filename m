Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDAACA1001
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ssij9SY5ZHsEeenXlxMWFiz5iGlvdpqLAMZCmsyuD7w=; b=gcsFtXbyvudcprDdF8escgr2i1
	heVp1fgOeT4z4HT6QZbHvaek+hKZHDfoeRWg9kZc4mIT90tK+piMMIOVifTJGS9pyWYZTXnxb2rPr
	cYPnvx1iGqUO6pDFXpQnfEoFhHkpzJi/yK9l99gvD2JITe4cO7uUURAb6SkKYuewFYFUEyYI9pZop
	G6NAEQLNWX7HZ6cAvwLL1sUfjjyULocTWxSSoEa9dUfyIE2SqQvkNIoyKXJWJWV4x9XqG7dbvM/YK
	51J0wf5+TjhlmqlbM6EAIPIckbSutK4GOOwoTUThTNQ7NV/wcFkPK6Wm+r6y3XCYzh7rrQzBN018C
	FgguYE/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9iC-000000076P3-2UWR;
	Sat, 30 Aug 2025 00:44:56 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urxud-00000005baS-05V9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 12:09:00 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7704f3c4708so2420054b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 05:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756469338; x=1757074138; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ssij9SY5ZHsEeenXlxMWFiz5iGlvdpqLAMZCmsyuD7w=;
        b=OVxSnZ6XD74t/dy/ILHPdmbqlPD/g+2wfJNttRl680Aw9wKAKh+sUTWtISVWblCa/m
         21xz8PTFJKZhfi6TQPC9YiVWQTi1lwC0YPoHU+eonYJpMv3uKY+lngXfNAnEa0sWKJH8
         kuu5zz6NoHbUmPc37eSq004GC4GJ+9L9zyrCUDh39PvC3X0TF7gR3lYgCMQn93OcZJ5T
         e182C0cci56QfpkrlhoEQA+YB63fXL+MGQXMhOdAqdIn5bQ4XxFt/WsNPP01Gy3yk9WG
         VuZDiAc33S4lcjg/E+GamivV939u1DjgDfpyWHmU9t+SvoNDsMfkBymENzQBL8foj5PR
         qgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756469338; x=1757074138;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ssij9SY5ZHsEeenXlxMWFiz5iGlvdpqLAMZCmsyuD7w=;
        b=r6Z953zxdG266I39BPtT1UpBC58yK7iov07F+VIuoIdqdIuQlY5aXFaR4LzT5/8FZb
         iFsRaQ8XZGKtbGhZ+X1q2ZPc9lqenMAfG7Xvdvy0CJuZQdNHcT7o5Gxh3TjYO0/zxecb
         4Tm9ddKeZ7pbz20orkD4Sk9CSWbtelLCpcKS6mgu04bLXLLlba54kq+EGYsUzNmbWTBo
         7tIiMpezDprNKZ/FnEXJuXAQYEs68u2kOIo7AIUTu+37zKfxm7bC2avqNsHMhQRxpgTp
         4GfjzFss/94US/m4pQijFTV8YRo6hKS4Ci+5LSUH/QYatWdzZ2o77xx73uLsB4GJmg3e
         xEYA==
X-Forwarded-Encrypted: i=1; AJvYcCUGHz6sD2Enp5KKzJg5nzmGn2Way5SHfh2h59QKF2C9Dyd0W81q6q/SUbKzIW+hCZpPcVXAU7LSs3CjirhsHOL2@lists.infradead.org
X-Gm-Message-State: AOJu0YxCTFZRhfSRaa2wRlzc8qrsm7wOQ9EfuSBbVDYsCBLnTjbIbUn3
	3FlaGG4g6jxdyVLVxcRzw71VgkR/nCiga89RWi2jI7tWdnC8iTGUmrte
X-Gm-Gg: ASbGncvjUgn9wz0NJzQyQU9akx9N5pwBGKHu2Rg4LxKyRiOMl/PuWA8FC61cuRnAsjf
	U44zvRHlO0hfyCUPkQSMdY6P64xdEjcKk40KKoBj8jPNq09K2UAgXmAuiRB1cXwXFKa3Lxz+oji
	KaLNNAnQbbERuj8mXXPlRUNGwmsnxroP+Rin7WwkJzDaFrAV8MTHszV6jKgqPSjASbRaClvJR29
	IVHDMNNKz+ysXpfM1KvmWmNXUNY3kK35ggeopYNUdddxJxwrx9JVI7j8mDVsoBgdcj8mtY5BKN+
	R8jHlaOKEzDuH5FvPhifBveRWd3pT25qQTV68Wp8J2+sCRAlUKWe2kp/DY8Fmt7mrNW9vlr6bV5
	xTHVrAmeo+9zgALUVIvMN/oSzUfOUPYZoAfWox5PmKZLzgVCqyml3+FWtIxvQ3+pjK+S5PRblhF
	9SKXBQm7FIbG/SClskID9jq/BVtZnnU6PBBh46SgtD9gEPoNCSbUrfaQDu
X-Google-Smtp-Source: AGHT+IHbYa9s53mJukTIQKYLvNji7ERSt0sQ7BQvGh8tc2UnWpHzLZYJA4mp+CXJze8S58TN6eDCnQ==
X-Received: by 2002:a05:6a21:8906:b0:243:be7c:2d63 with SMTP id adf61e73a8af0-243be7c35f8mr4973218637.42.1756469337730;
        Fri, 29 Aug 2025 05:08:57 -0700 (PDT)
Received: from vickymqlin-1vvu545oca.codev-2.svc.cluster.local ([14.116.239.34])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b4cd28aecd0sm2056031a12.30.2025.08.29.05.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 05:08:57 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] coresight: trbe: Fix incorrect error check for devm_kzalloc
Date: Fri, 29 Aug 2025 20:08:47 +0800
Message-Id: <20250829120847.2016087-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_050859_060251_E4CF257D 
X-CRM114-Status: GOOD (  13.63  )
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

Fix incorrect use of IS_ERR() to check devm_kzalloc() return value.
devm_kzalloc() returns NULL on failure, not an error pointer.

This issue was introduced by commit 4277f035d227
("coresight: trbe: Add a representative coresight_platform_data for TRBE")
which replaced the original function but didn't update the error check.

Fixes: 4277f035d227 ("coresight: trbe: Add a representative coresight_platform_data for TRBE")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 8267dd1a2130..caf873adfc3a 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -1279,7 +1279,7 @@ static void arm_trbe_register_coresight_cpu(struct trbe_drvdata *drvdata, int cp
 	 * into the device for that purpose.
 	 */
 	desc.pdata = devm_kzalloc(dev, sizeof(*desc.pdata), GFP_KERNEL);
-	if (IS_ERR(desc.pdata))
+	if (!desc.pdata)
 		goto cpu_clear;
 
 	desc.type = CORESIGHT_DEV_TYPE_SINK;
-- 
2.35.1


