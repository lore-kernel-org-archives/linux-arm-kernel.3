Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7474CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 08:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b4A5fkthP3KXEpRu6BAtoU0UoZrqtT9TFK5zNXIFO6I=; b=35mqGCDsNR/X1f6Y4+fpHMhjY8
	rpmM36kw56ocnDgW/1E0asJ70QaMwGluOhFEB8kdFmlHoS6QSgRi1OCK2bMndyS/i4pQct7bqbXRz
	9duvvCY7J+NdAzL4mJIG/U1D6UkSgqZo+YHbj5noyjti5oyGh54/vrTLDpIXrx1FwERM3x1MevFTF
	X7TxgTAKDT6BC/8441qVv7lLYGxIDHYRu4602MyYAhuWbVl7scvlBFLtEKqPdVoU4qJJ0Wmx+m4jw
	QZBBxlgQFUghT2MmgHf7+TodTWiQKNIP1wO3PfoAF9jfLkP9uWeWKcK/8GT4ML/UTUbrTScyuJIAs
	KCWGL9hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhkaW-00000001YiM-46TW;
	Mon, 19 Jan 2026 08:26:16 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhkaP-00000001Yfr-39vG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 08:26:11 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2a12ebe4b74so39108475ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 00:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768811169; x=1769415969; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b4A5fkthP3KXEpRu6BAtoU0UoZrqtT9TFK5zNXIFO6I=;
        b=a9z4NGiWP7oVlz4G80Y+qxbBPGHGY69tJRm9KtsLIwafzRKucvBuCofMuBEMB11Idn
         96LxWKOmFjUsQNbXhCcme/dTEx6VOXwMXBGuru7pzJbHRUgK0GtfCHFN2JT4zuu3VCu1
         qOiRxdO9HxVfa54UlIIMicyIjTZrPzjLCHy1ojLRfRPZum9UhMnj1XERSV3hZ/9awLVw
         pyH+6CO0jEx1Nu5DV7HKwqNR0L1pICES55OZJfKL3TH+yu3i4l72SRYSznMY5NhLNTQl
         Vb5AvTN1RAYtTeWFVxaitLVrsTcdSshRMB0nb+jVw5fXFqABcCADL4VNS1gPPG70Nkrl
         HGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768811169; x=1769415969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b4A5fkthP3KXEpRu6BAtoU0UoZrqtT9TFK5zNXIFO6I=;
        b=kibZiB5Xc5Z86ea6fcMghKuZyqoF0rFzXaUT/aZYmGdmEp5g7VGn7ttCnxrerTqPeR
         lhdQhtXEjCHiYupvU60gKwLADGyhLUzQihKkJ/aiwR+h54kxzk0hm400SMjiVc6SFVdF
         wBP5AdvnUEUgkHQ9OHTylLLLYGiGocDjT5CGq9qC775O0ekhPLyRFBuhJI3YSudv+GAx
         j05EisgBmpGkkY51a6Yv8ozA+joNNt8aNisboHioqbd++lFOUz0rNjRJemFcPSV5FhVX
         hIaCkP9uIgeg3lNqexh7bKV3w5FfQoRD8mEU7RKQgpurj7QnRbOWXtoi0liL48YHMFmY
         8IWA==
X-Forwarded-Encrypted: i=1; AJvYcCVcQWMbr0FlH2vlhNPZvcVBnuySGFZmogpv6kxA8i+WaDM4tRe9g6bzlJk5k3mQSeXGjshFiDtdY5VIo5nJl2Gv@lists.infradead.org
X-Gm-Message-State: AOJu0YwkJZ+0T2WyXofm5xPq2FbW3RjKICVo9qSdHztY4dg9P7nBkpg0
	m8kHZXoo/Hzvnu90+utwBYKRk55Cs7tLtEVoXffIMwlS78E9nkFuH7Vy
X-Gm-Gg: AZuq6aJu6bG4Bz5WFBtHwexs55lT3NwiHJ4dQnuQm9/B8N6WbxOpN+R8cTH+2mMkuFb
	cOiIY6EIVRQQLNag8uVQUD8toZKI5edpJ3KISN54mhjwg09r9ooJqwpwb7o9p9rJDPq1xGRWzSI
	dZlkWU7kEPtKYkAAmG6T7FgY/IT9siauH/YTMUryCqeu1CD5z9tQ+hokjE9d64DpKX324q8MojL
	Pgu8J2B0QwsAPJ9qI0nT07lcROoJ36KxIRWExVM/wWwtu+APVega7JG3wuD7EzCeCaZnSpIJgAV
	cNp6Tcl50eETIvDhhsispo1fBygO8pTmoP/KZylhpyAbfvGWvZAiX6jnUXpdxjoI9c92ie1F+b/
	qJX5TYcOWYYZ1YImlxjmfHfzAicNEC3LdSLM3JFNjv697FzBU5RvpKGTu/myd37k+M4demuFTuh
	rWPTmfqld192T5HLgzTbEfdDlIGA+uvR0N3I+gVQ==
X-Received: by 2002:a17:903:124f:b0:2a0:c84f:4124 with SMTP id d9443c01a7336-2a7177e2b6fmr92683575ad.52.1768811169196;
        Mon, 19 Jan 2026 00:26:09 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190ce534sm85699645ad.27.2026.01.19.00.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 00:26:08 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 2/3 RESEND] drm/exynos: vidi: fix to avoid directly dereferencing user pointer
Date: Mon, 19 Jan 2026 17:25:52 +0900
Message-Id: <20260119082553.195181-3-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260119082553.195181-1-aha310510@gmail.com>
References: <20260119082553.195181-1-aha310510@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_002610_325731_51A27E84 
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

