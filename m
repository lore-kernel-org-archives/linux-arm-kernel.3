Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52715C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 19:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jE7YeOTH+Slgx2JFrDNEXYntxMlmYaSvMdCwqmpupuI=; b=HuLprmRAkr2dbbLZlPZ/p4fEnO
	jT85CzhKmGzpRGtAZCFvf4AEiy2w0GZqu9ORrwYaBO8L5bNsTzf0MYN5pMO1FYSzMVpQIyo4kXruz
	Nxsz0HNAY7j+0bOjJCK56j3At9rgM+nZsJngRSUZY8WpdJ2zkm06OJYl0ULmroFDn/pG24o3I25pK
	k+63+y/9JFSHvwUlFDChmEXNKkk6+PcJdWbkzG2jYk2CakRkgiKDpZkcmI09wRWOz//1+01a1HCR8
	HqWLb7bVydCTTgNjghZByw3bDJf6SSzRISlOca2sihYotnhsGRv4gayg6Q4NeWOiS2PHVfwshR2XG
	GHHGvbWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1UZv-0000000DGX3-476H;
	Tue, 01 Sep 2026 19:55:31 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1UZt-0000000DGWF-3k1d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 19:55:31 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-6b19e291cc6so192449eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 12:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788292528; x=1788897328; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jE7YeOTH+Slgx2JFrDNEXYntxMlmYaSvMdCwqmpupuI=;
        b=b1aIoohBJvkLvROKETE0bycfn3/Ulp8m15pUpOrYcsMtgTbq4f+PRCj7bWPHE0Y+up
         YCWN14RKJX1lyvNo0skClz4QWGU3UHDZu160ZTYm0lMAYpAHNKvxXKS8TIZQq36ZYlip
         R5H+pkjQWzIxuHoiR4AB6hA+8seRISnbisB0KVGgb2HmeVMHfJahDE0C3tDiisZjOE6n
         rafBYc0YqnzcbHi7pLHN3VPEvEYc3LKEsO3A3RTP42Wf19o5L2pK+6lsmTogD/yTXhSG
         1xO790WP8oa7IxvK7mtd0M5g15SRgtpxOACYQzZRnxm28jUfYiae7LbaP5TXoxCDFuJU
         v1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788292528; x=1788897328;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jE7YeOTH+Slgx2JFrDNEXYntxMlmYaSvMdCwqmpupuI=;
        b=GX7BQiiXtr+dNxPCq6HpynM3v91Yxa8HOdz4epwafRR6CwAmxadSOnvDNO/j69sXek
         oxKEiSiaTLRojVc+dMqCWNJF29+BEtnUQHILhjtFscUse6bVYhifh+A/n3XkCb+2lEjk
         zZTfMCFxqG1H492IuamTnVjodxdgrcPpEnkRNZDxvDIKzwpGSet9KQtOkVxrkMHK1reQ
         1U4IfXDT78YcZzWuMrtwibKzapDR7C/vEhhs1TsJm+vX9IMMsct511tZnB+lUJMFnINR
         xI+0r5OKLASEMDmwqF4tPCcGhrB4i6mWWOl10S12meEZgM5Xpbfdqgy2Fo4p99JPxKCu
         m4gA==
X-Forwarded-Encrypted: i=1; AHgh+Ro2UFCy3BAM3RNGfxwxZ1gyzaZFeMKKLu1ng2bZcF+OF5FLk+CK2/ZEsZQGxRDa2qZyV4jdq3Ucp0GT5Y8rfns5@lists.infradead.org
X-Gm-Message-State: AFuF++l1VcS5ORDgLd1g8AGh34mnKCMIapF5fb0icwfO8CnFU/l8y+M+
	yNQAfbtowUQaotYIEjdHYz8slbqFTCuy0QCwQAPQpD6fC/tREB20uklG
X-Gm-Gg: AR+sD10nKH0VBRIn38OhX4cfRzvPYwJ4PDbjMV9FnwDFoS2Njp2kFux9pZmNiW7APHP
	H8HdzHS7u5DgGKP03ZNEMn739z2o1UKZb01FQqXUT3rNJ0raLhr49sPABnWIdEXwrbZUKMJkB/N
	wIeMa9LKH/cFwt2ZsPXYGBqUPHzGLgp+VxtVDByioUPbXH3fLMwtXeVe0gqn9yMV8307CA6Wgv0
	prZO66bD1jsUCcvaUw5JIKmT9+d19Us7vHL6mWhhkFuE8h64i80MSL05o5SQ6BOvxr0n9yOWZWu
	/xEZPMD9k8EwpKcBOZTrmmfWXeP8ezp/CmhuPrDmm6dNXv2udhg0ecvWj15DmCASvKkasz9Tsai
	BE2MKvxjGeb8VRXvCJMQidrCa5HtqiZGWdsSKyTg0DiEH6zEWzvaB3N7H5YPOf0vl93jVl4GOYE
	3m2lVpaeoAZqKBKD4Flw/Sdr+QLT7t5qBcsMWtTUl4hoFbpX+fok+wY1LclwIZN69xH7bLc8Lhn
	W2lrXF4spPhWw0CdCpNFQIUTFhgkL4TsPPVn4xzHHkxbzs=
X-Received: by 2002:a05:6820:823:b0:6aa:cce3:ab61 with SMTP id 006d021491bc7-6b372d20e4fmr8604105eaf.9.1788292528131;
        Tue, 01 Sep 2026 12:55:28 -0700 (PDT)
Received: from memorizer.localdomain (47-163-111-11.bng01.bytw.tx.frontiernet.net. [47.163.111.11])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b40f81f374sm868636eaf.14.2026.09.01.12.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:55:27 -0700 (PDT)
From: Yudi Yang <2000jedi@gmail.com>
To: Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Damon Ding <damon.ding@rock-chips.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yudi Yang <2000jedi@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/rockchip: analogix_dp: bound endpoint name formatting
Date: Tue,  1 Sep 2026 14:55:11 -0500
Message-ID: <20260901195511.2761251-1-2000jedi@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_125529_939505_930BD84B 
X-CRM114-Status: GOOD (  12.44  )
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

rockchip_dp_drm_encoder_enable() uses sprintf() to format a device tree
path into a 32-byte stack buffer. Device tree paths are not limited to
this size, so a sufficiently long path can overflow the buffer.

Use snprintf() with the destination size to truncate the generated name
and keep the writes within bounds.

Fixes: 729f8eefdcad ("drm/rockchip: analogix_dp: Add support for RK3588")
Cc: stable@vger.kernel.org
Signed-off-by: Yudi Yang <2000jedi@gmail.com>
---
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 587e60232ec7..efd5a98e80bd 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -241,10 +241,11 @@ static void rockchip_dp_drm_encoder_enable(struct drm_encoder *encoder,
 				of_graph_get_remote_port(endpoint.local_node);
 
 			of_property_read_u32(remote_port, "reg", &port_id);
-			sprintf(name, "%s vp%d", remote_port_parent->full_name, port_id);
+			snprintf(name, sizeof(name), "%s vp%d",
+				 remote_port_parent->full_name, port_id);
 		} else {
-			sprintf(name, "%s %s",
-				remote_port_parent->full_name, endpoint.id ? "vopl" : "vopb");
+			snprintf(name, sizeof(name), "%s %s",
+				 remote_port_parent->full_name, endpoint.id ? "vopl" : "vopb");
 		}
 
 		DRM_DEV_DEBUG(dp->dev, "vop %s output to dp\n", (ret) ? "LIT" : "BIG");
-- 
2.43.0


