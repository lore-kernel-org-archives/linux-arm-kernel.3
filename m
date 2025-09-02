Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A94CA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 12:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4A5fkthP3KXEpRu6BAtoU0UoZrqtT9TFK5zNXIFO6I=; b=HzTXBIl67np6NsZTOcAbQIzVQ4
	ynUcHYBNIesGULcJ3XnpzavlAQjgzbXQECs4WvSv5bmA5905kP3m1n9Re4b324MjV3X+t/kllLuJM
	y3jsfsUIWdlEuIL04efc/JYDYVZBaeFv7uiBnbzWfMAZTgBgHx/+7MnvdJBhRjlvHDStKR0UNRpw0
	zblxuEO60NJ3DdrlzJMINd/yplME7lVbVLLFWzbTsBY3/vZm+436euWxs4Ky6AsqGgSNol0Y5j0xf
	GbsSgT3R4fTrrD91mbjMp+otG5gOak/wQzR4SCPY9R3lDXyJEh3U0D/foNM64iNW0bFnvcOHUGW8J
	GpM64sLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utQVm-0000000HRvk-14ro;
	Tue, 02 Sep 2025 12:53:22 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utP5D-0000000Gtjv-3Moa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 11:21:53 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-329a41dc2ebso1377418a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 04:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756812111; x=1757416911; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4A5fkthP3KXEpRu6BAtoU0UoZrqtT9TFK5zNXIFO6I=;
        b=bvbUywRNZJ/xOUzeDmAIij50fG6GlnBLOyNETDHAr/9Nqolr3H1mqg9U+cDcT2qNPJ
         vyhKFEe8+NOIvBhfkXqT9fJ60l/IAKzJO0CCCS7lVy0AUvHVTFd5CFC4lx6l7ip+bdJL
         AlcC8iQF3oLnCg3xIhODr3wmw7UovKm74LgejQHYuSI/owmcjB5joeRiOf+Q9lVii/eY
         sf+uYtWVYb0P19ohrnJrVEJXh/huQo31KPKQrjlJgea77qJ9rDYZhmE0MIvAl5ZXi72d
         W+PayStRjHYrhxUYR+wgRctuEROp8EWQmmHWUNg2mzEJYR9+7TVkrKXJfXg8WbQL84FT
         3wIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756812111; x=1757416911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b4A5fkthP3KXEpRu6BAtoU0UoZrqtT9TFK5zNXIFO6I=;
        b=w7nqOUZAXIJ6gmpVu8j9KEdcBralHpbblW0ntPY6UKn6J6KvM3zbIkk8QpKC55y0PQ
         3UiKsYWpVw29e33S+2hRC7Lr4eSMqnePMqdCiUjep2Wc9iHao+WW4VJe+R5vB6MH+1q9
         ooBRzr2r5x0N2q1AFpnVc3jko2Cg+i0P/VrbxFUeWhuB1j5BfVhU4xPvzedWOzgyyaFB
         Xa3CmPv5Bj/UaBbQRxPJF/i1keLKsBgeTuqq1Ltrf4sRlqnJDAZZk99FQUR2NpYzVlfo
         hWA20HoNJ5UbRgLZNmF7s6dEmNhD2nN/OcFSAnIUMVPg7QPrk6i2lRb9BBD0XshUD0nw
         zF8g==
X-Forwarded-Encrypted: i=1; AJvYcCV65fTi1BfXLXxZUoTPFln114BUcUSNl4ZgzDZgxerASHQJyHzeWe5qETs47kCeQ0aTO2eHj8FqKTn7gT+V+Mzy@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw3bJEPzjRW4tJURgBaCFfPBGhZkUR4/MNVryVHh6kI+rBlKrZ
	asGV9/4n+2/PrlSjZ5R8iZCagCuUktkv/Ve3XlqLy/tbVY7lqrfvPX2H
X-Gm-Gg: ASbGnctBZgRLhPGmBmIGEh/qp04p9Syjsbay9IxvevcolTyVLMX9g4z1jXK1qdV6Ztc
	ovcclgGQGZ8QodbhvVpMTMg4vzpCPfZzFFIDpYQDI/cOef3LDm2X+8UKUExKz08VhXK2V/niJv4
	HLIUVXKGHldPlbCZ3c1COetyBYirUfxSX2piWbtQGk5lrdtFaKY0hSVugQdhGoOoV1SHkWaajFA
	41yasMyZVHu4+euC2u2cCy0j0vYXVy7FK/vKu5KcunthIB4sjV22gav1WLDiHZ6ZN12V/udzINX
	focVLnL3aq1xVBBHx7qD5+CDfMszBALTfwbHhCqLo3tjKRm9NsyHY0C6UgB+y9nMMpVTetyGNcx
	7lgExsQFJa3UljM4PoAlKH1qTJiDTUBJqWeRKg06gIYzrbxJkJTcORwl8TCSL
X-Google-Smtp-Source: AGHT+IH1KF6DJ5OOOOe1l7ldEAlzXJxUIBb9mE6VlKXMsVGCI5lGE0+ieIjUzywYE4Fa9tCwx8K4LQ==
X-Received: by 2002:a17:90b:5587:b0:32b:4c71:f40a with SMTP id 98e67ed59e1d1-32b4c71f85amr241852a91.24.1756812110843;
        Tue, 02 Sep 2025 04:21:50 -0700 (PDT)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e27d1sm13140645b3a.81.2025.09.02.04.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:21:50 -0700 (PDT)
From: Jeongjun Park <aha310510@gmail.com>
To: inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: krzk@kernel.org,
	alim.akhtar@samsung.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	aha310510@gmail.com
Subject: [PATCH 2/3] drm/exynos: vidi: fix to avoid directly dereferencing user pointer
Date: Tue,  2 Sep 2025 20:20:42 +0900
Message-Id: <20250902112043.3525123-3-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250902112043.3525123-1-aha310510@gmail.com>
References: <20250902112043.3525123-1-aha310510@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_042151_858752_3333AC02 
X-CRM114-Status: GOOD (  14.59  )
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

In vidi_connection_ioctl(), vidi->edid(user pointer) is directly
dereferenced in the kernel.

This allows arbitrary kernel memory access from the user space, so instead
of directly accessing the user pointer in the kernel, we should modify it
to copy edid to kernel memory using copy_from_user() and use it.

Cc: <stable@vger.kernel.org>
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
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

