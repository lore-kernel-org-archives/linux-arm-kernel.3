Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868F5E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 09:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DeWY5GrZ+oUsk5L6PZfCgkhib35kaMkIvOwfSxSW9Qs=; b=mdW9TOu2ZGLtAy/j/p0jO/vYXF
	blORSWV58o4RBX1gxV3wb1wUTJQuZQ2lmlDN8UmHR6DSYdXGiXZeywR51MUI+XFkBxmxIcbIDFsFV
	iudBrlNsMMIwm2HaIreXsg6ifg88picnEmeVvhZoSHmjVRA1ZkRoTBDblWpJNbyAg1LaIzVhFmg7G
	iDbOFYAFAinDaRk3orRcm8ZriuXjp4AbSl+uyitRhCP10j2ArLd0Guz3T7JxceDq5ZKRRx8gu4VGG
	EBa2r80K6lkEGeM2sbWlinnJXAOiYtH9S2s/e6HX0d0Zu6WWo0aGJpyyASwQOgPy38LHPObWaEH0h
	StLh5qug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWtvr-00000002ONk-3caP;
	Sun, 12 Jan 2025 09:06:55 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWtua-00000002Nyw-1E8x;
	Sun, 12 Jan 2025 09:05:37 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-21631789fcdso56176765ad.1;
        Sun, 12 Jan 2025 01:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736672735; x=1737277535; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DeWY5GrZ+oUsk5L6PZfCgkhib35kaMkIvOwfSxSW9Qs=;
        b=kVt/2fFVtTfthLksSXEtvxWYVEF9qLC2uhh7xPSjvpPqws9w0FUH/bCn1NlbI4Qkky
         qODvwpc7+tYIU9r+BxycHedAC1WBk9jM6uuwPTtC8Pn8mFd4+fBhijw9z6YT2abHIhQ7
         NuxlVDo75/YjQuiM0U/E7DRltZHML2CpcAJ/bTL/XJtuM3ob/YrUYj0pqLT3bVNEFrZR
         /0XE8ffw/xfTRLZiwOuXzDjrdpN7IeO71x4j4uy/dsSYTyzAa2KDR+tnwUXK4RswBHy7
         AnJO4CuNh6x8LO8qSpN9r3XHyR5fsjU70ntWMEsYhSkvyPUdqqMnjSYoju/OaDKYOO5C
         X+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736672735; x=1737277535;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DeWY5GrZ+oUsk5L6PZfCgkhib35kaMkIvOwfSxSW9Qs=;
        b=oKrDqoM0SNFQawRMa6qUTJ2AmR+7xXYuLqVVEESZOzkdC5eDflJywxodvYQcCeQuMC
         hCELqSUllhUhP+X6rYPhS//ftY+ZNAZxQCVhaezBWwolbtwIbDx0YfDFpa4dvnxV7k6L
         ZL1/UhZIMORTpav/WwghkvTN3B/HlKrn32NCbsNxCzmOpV7jNI5weU8SMzTDybOMRmPE
         ehEJXON26kIdHEVdwNKtYuWXuJ+ZKLBiDp5/yL6mdxNngyY2UdvgGknADinFebHacKV9
         Xjt0J1OTMfCOTT4EgU48TZuWnfN9he1zN2as4GKntuuwt2hRHXTZK4Bxy/fZU1L5osl1
         7N1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWyb6atTKqvgtYwQ7dF9vReT9/m2KQ6LlykmCfKkg8oyCGQe683DV9T6F4RQvc7aApa68m74LApBWxkkkfTJbk=@lists.infradead.org, AJvYcCXHRQRK0Gj04xCie7fM2w+/wMcTqQwU3lgRzG2imiC7GIYsQUlhektnU6nVE5lm1MBJHK0EpsHGxrABMOl0wVrJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yy750xbw8EQICoBeYnNGvDjZyothB6BDrI7uoivRAXoxWpu1eBg
	BXwJhdCFlxB/rWi71Tyn4GXr7q9f2oWXJPvOXn/2H11gz08LA4Fq
X-Gm-Gg: ASbGncvUAx/d/Z5GAGyMlMpqi7AZgebYGLxl7A/4k7dqnnlnsqaQYEWhfNPdb8Mse8k
	NSwMdwlcEvmk/Y38h4Zqd191mVBqNSLRD9T4Z1Frj1FUT1/fXFiZ0Te0BgTNZKIHOLthFDLCDAQ
	2yKbx5WUjzYHsw/dabGkIzoLGVNZBaeQy8lKDOvqbWNg8ABDcjar434FZq1W6TCE3DVInp4Oqsm
	p5+6kDN4Tz0M0IaW0yF2AjKceCGNrgv+bJuVmEbSBj8f4M0WOzvmCE=
X-Google-Smtp-Source: AGHT+IHu/GMQyrHeXHhW2IHCjlqDAL093DtUlydQHsY2SPkxdzqmE4DrqTy4VxiKykzwhI1RLWLgdA==
X-Received: by 2002:a05:6a00:3910:b0:725:41c4:dbc7 with SMTP id d2e1a72fcca58-72d324bedf7mr19906933b3a.4.1736672734679;
        Sun, 12 Jan 2025 01:05:34 -0800 (PST)
Received: from Emma ([2401:4900:1c96:bd6b:5054:ff:fe53:2787])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4059485bsm3950996b3a.83.2025.01.12.01.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 01:05:34 -0800 (PST)
From: Karan Sanghavi <karansanghvi98@gmail.com>
Date: Sun, 12 Jan 2025 09:05:30 +0000
Subject: [PATCH v2] drm/mediatek: Initialize pointer to avoid undefined
 behavior
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250112-uninitializedpointer1601557-v2-1-61ac4c80b76d@gmail.com>
X-B4-Tracking: v=1; b=H4sIANmFg2cC/42NQQ6CMBBFr0JmbU2nQEFX3sOwADrCJNCSFolKe
 ncrJ/Dv3l+8t0MgzxTgmu3gaePAziZQpwz6sbUDCTaJQUlVYJp4Wra8cjvxh8zi2K7kUUssy0p
 capl3lSo73RlIhsXTg1+H/d4kHjmszr+P2Ia/9z/vhgJFZWSudU01Fngb5panc+9maGKMX9SW+
 yrGAAAA
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Sui Jingfeng <sui.jingfeng@linux.dev>, CK Hu <ck.hu@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Karan Sanghavi <karansanghvi98@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736672731; l=1803;
 i=karansanghvi98@gmail.com; s=20241017; h=from:subject:message-id;
 bh=iKs2YT/O6O3hI6dqcd/Y4shirDLatC1bZ5lLLSgXYAk=;
 b=lVFZMQ2xtvXWpRGLSvR+s3AhcVB23qGM6qUFxsgC7Lmm1L3bGimUR3y+L/VRjXJNE1G5+XN7A
 bfG6MOMZjtdAmYBZBCgSTZnzk8UpmSGnoyrhrJcnCUjRhYr5KxeLxN1
X-Developer-Key: i=karansanghvi98@gmail.com; a=ed25519;
 pk=UAcbefT1C06npNVDJHdgpPqTm4WE9IhaA1fmJb3A37Y=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_010536_357890_C2474DCE 
X-CRM114-Status: GOOD (  13.83  )
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

Initialize the `next` pointer with NULL as the function
`mtk_drm_of_get_ddp_ep_cid` might return early without assigning a
value to `next`.

Dereferencing an uninitialized pointer can lead to undefined behavior,
as it might point to an invalid memory location.

Coverity CID: 1601557

Fixes: 4c932840db1d ("drm/mediatek: Implement OF graphs support for display paths")
Signed-off-by: Karan Sanghavi <karansanghvi98@gmail.com>
---
Coverity Message:
CID 1601557: (#1 of 1): Uninitialized pointer read (UNINIT)
3. uninit_use: Using uninitialized value next.

Coverity Link:
https://scan7.scan.coverity.com/#/project-view/10043/11354?selectedIssue=1601557
---
Changes in v2:
- Updated the patch subject and summary log
- Link to v1: https://lore.kernel.org/r/20241111-uninitializedpointer1601557-v1-1-7d03668e8141@gmail.com
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 9a8ef8558da9..bc06c664e80f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -900,7 +900,7 @@ static int mtk_drm_of_ddp_path_build_one(struct device *dev, enum mtk_crtc_path
 					 const unsigned int **out_path,
 					 unsigned int *out_path_len)
 {
-	struct device_node *next, *prev, *vdo = dev->parent->of_node;
+	struct device_node *next = NULL, *prev, *vdo = dev->parent->of_node;
 	unsigned int temp_path[DDP_COMPONENT_DRM_ID_MAX] = { 0 };
 	unsigned int *final_ddp_path;
 	unsigned short int idx = 0;

---
base-commit: 6d59cab07b8d74d0f0422b750038123334f6ecc2
change-id: 20241111-uninitializedpointer1601557-9803b725b6bd

Best regards,
-- 
Karan Sanghavi <karansanghvi98@gmail.com>


