Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F73FD9E34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 03:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3SNYtFmJqSV95moRlaJ0QYmUhL+TICukmgmBhi3zA4c=; b=FlNl3RCSskP/BwLzduQ5Xf2g/5
	vUaLYpvOkOQXQTHHKaY8fNhCgng9QJ682DpanmhME2HUYbpdI1LISFqBi9VjVlM7MWohi4Xc7EQuN
	eqLALw7eJUktdwXarXnXkGGhD7B8cWrciX2bY1dmb+m2OR8fwD31aH72FkxCEJ+q/lxBafb4ijeCB
	+tWveOrED3Hz+OBfC8slkGHSQonipqJEyAaks4OHvpH9rlyY2PHek9hcRayl2Y06PBINWRRtjjyrl
	8ILmNX+4ekKmuUwviFNdH2GYWkPoqz2FPtBf4ydStEANShFtrHqL14f9DJ8degooMH/qhaxpqN2/4
	H5fy/9mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvoUq-00000007bFE-0DPj;
	Fri, 27 Feb 2026 03:26:32 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvoUl-00000007bCs-1SYJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 03:26:28 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-35691a231a7so931321a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 19:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772162785; x=1772767585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3SNYtFmJqSV95moRlaJ0QYmUhL+TICukmgmBhi3zA4c=;
        b=csTLpOk7vsmNNIS1E40PWNs1YODV26TFrl3q1OA8K//t3xRkHrsEM+FcG/zX7xP+c0
         L6Z2P6sxGyXwpQ35FvkUx6/dHmqOZE6eeGvZN/YLEIePp/O1J2AAi/qwW8U54u49RJ8s
         PIPo2twPkQlwT9tgWPDCSRkAT6CHgULfOl0dGAI86Z+IgKoPSK8u0fTZCZB4/rM1wqYP
         TRUgVQ/nJptRLiJL0rcZXqEOQmHVr1vm1JwcbTm5GLqzS8Qfy5n/RcQZpfsizKWQU4M7
         BtH4Vy64PSdJsefR854ODgiUCUnlu/OBAbnVhZUVJGSXkCNjwrUFK+phmXR6K1oevX0v
         hrHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772162785; x=1772767585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3SNYtFmJqSV95moRlaJ0QYmUhL+TICukmgmBhi3zA4c=;
        b=TkkdTtR377+KG9tZ74zJq7CrgBHOLrFU4wRVt+px2rM35jreasIJxol4AzjVyWLzyQ
         OLA+ZGXBl4qi8WasI/kwdmZ/7MrqB1fKohSsY29eRnr/QQEqcBBYjkwR0gcniyoTbLr0
         ccIn2NN5ah6imgMDXxQ7ZcGQEG0TbemPNEu3XPVd6DN+ikoEEznq5n4ogxH8D9xioytC
         3Ifsuw7qbBu2168BL01zyNqRjW5kYSBvHFQk/D1sV7XIn/IQ/dxiaftKTGqiQoV+XbS9
         w3qqCYXsHx1tq6tT/uYJCyfShhzNC5LYqi/BOWFb4SstZUw5+mbpH+T1m3UQgR9V2Jda
         8Qhw==
X-Forwarded-Encrypted: i=1; AJvYcCUf1Dc4XEYYR7fVgrhdwrIKV5vAj/FvHZYKJCYuvmdIKgrorAn8064Xdqw1mUANZZLv5Qh2Z1HydsvgSZjehq54@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/4V396AxZCeRpe64ySuVezSLQBshprODPNA7HmJ8/aqSkOAW8
	dUTYqTPGeXL59r3/k9tJOX29sPalltDPtRYritsUhUgIuTAfsSaFnO+j
X-Gm-Gg: ATEYQzxXNCBOorUUZctXMHQbqYXXvje3eY1EBJcVaGB3DQUmZdwDingkv5JwwdqwgTS
	rJaixwR0X2I+PH+xZoGCdPxWQxY6CrBwMhz4KgA1I1Qrk0p2EhlB5IPxWHipDcFRrtYDrInfV0t
	0dSwn/OF4EeTLy7XaEXv5EF+43Y3Xv+JpoKoFyxBbrXrcXAn52EWftO4K+opjEZJ4YTrAN2lijZ
	dT5GN7KVFzNDfOYXgF929YVso2LdrwZUoMAHgGjBw+e4arY0/WofaGgxLu2NRFHQo77ejoXUJt2
	jh0mhjfnqC5I+hyRD1G1LfCb22kepI/ZJIoC/tlduLROPjb/pryuxlAgwcUhDGSyUmNfI4exCgD
	KT8cuPHUvmcG+/yB3LzGjetKEN0sauV3Nru9DbghkpcrD0ndMO1maXWGpIuBl8H7tKHRxI+XfJB
	uCLA78e/uWypnDN++pJ+jsp+KdkIy+R5uosSpOTtPK5bfqDegrZg==
X-Received: by 2002:a17:90b:3dc7:b0:359:28b9:5f64 with SMTP id 98e67ed59e1d1-35965c17095mr1275630a91.6.1772162785515;
        Thu, 26 Feb 2026 19:26:25 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35912fbc363sm4501887a91.2.2026.02.26.19.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 19:26:25 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 6.12.y 2/3] drm/exynos: vidi: fix to avoid directly dereferencing user pointer
Date: Fri, 27 Feb 2026 12:26:14 +0900
Message-Id: <20260227032615.108139-3-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227032615.108139-1-aha310510@gmail.com>
References: <20260227032615.108139-1-aha310510@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_192627_402411_9AB6A0A7 
X-CRM114-Status: GOOD (  14.85  )
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

[ Upstream commit d4c98c077c7fb2dfdece7d605e694b5ea2665085 ]

In vidi_connection_ioctl(), vidi->edid(user pointer) is directly
dereferenced in the kernel.

This allows arbitrary kernel memory access from the user space, so instead
of directly accessing the user pointer in the kernel, we should modify it
to copy edid to kernel memory using copy_from_user() and use it.

Cc: <stable@vger.kernel.org>
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 22 ++++++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 1fe297d512e7..601406b640c7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -251,13 +251,27 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 
 	if (vidi->connection) {
 		const struct drm_edid *drm_edid;
-		const struct edid *raw_edid;
+		const void __user *edid_userptr = u64_to_user_ptr(vidi->edid);
+		void *edid_buf;
+		struct edid hdr;
 		size_t size;
 
-		raw_edid = (const struct edid *)(unsigned long)vidi->edid;
-		size = (raw_edid->extensions + 1) * EDID_LENGTH;
+		if (copy_from_user(&hdr, edid_userptr, sizeof(hdr)))
+			return -EFAULT;
 
-		drm_edid = drm_edid_alloc(raw_edid, size);
+		size = (hdr.extensions + 1) * EDID_LENGTH;
+
+		edid_buf = kmalloc(size, GFP_KERNEL);
+		if (!edid_buf)
+			return -ENOMEM;
+
+		if (copy_from_user(edid_buf, edid_userptr, size)) {
+			kfree(edid_buf);
+			return -EFAULT;
+		}
+
+		drm_edid = drm_edid_alloc(edid_buf, size);
+		kfree(edid_buf);
 		if (!drm_edid)
 			return -ENOMEM;
 
--

