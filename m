Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9735DC531F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 03:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3SNYtFmJqSV95moRlaJ0QYmUhL+TICukmgmBhi3zA4c=; b=wi4QHA3JszRotAAXJips+3dYzO
	cMzrF30L0ae64G+2uJdHcBsPORt9u8lZF4mQyJ5kgZ9absWLSduIit+hePIHekbpYNxI+BqDRDW4X
	KKDm+dvT7eo0/ENe322AR9ceN0VUJVbROD7y/gE2oB86ovFC17U/35rTW5Hu9s5TcaJUE1oPl/H+2
	td5YAgvq6kYM3jSa97IsqyZrGddsnsqDsdWfb/lix/WRr9aiJKznopb2UEp1fFmLDC8kqBt+S+hAH
	0jUOv9iI2h/jNN5NFJpUWrZ5m8XrGjurlNbt1Ab4nTxk7q9INMh/YEE0mK2W/DQ10AqPYdZW6NUVq
	PvXONhPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHJE-0000000DBI0-44Yi;
	Fri, 20 Feb 2026 03:36:04 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtHJC-0000000DBGm-1iiK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 03:36:03 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-bde0f62464cso657850a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 19:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771558561; x=1772163361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3SNYtFmJqSV95moRlaJ0QYmUhL+TICukmgmBhi3zA4c=;
        b=j3M25dJmR6D+9nofGPWewK0wwV40KX8HYVNne+lAqixyafZTv4A68y78W/3g5jb19p
         vK28UxC4QbvLswR5ZGTVU/4WNN79HXyhudKj8+BTBYVIZGgxk3Zd6Tak82FBd5hs1Pog
         dVsf9m7aPBVCR+bHg5QRpUzI2VNbh8WK1/8lTzmV3XOD5EyUn8w2AH3Qoj9m5NAauOR/
         u1TwIE87KLukqoAECQuzu/HaoeF3BlaS8vs+tSsGMmC+r3N1zO9jvaseMzVNLU/fNttE
         +oc/T4HF8neejDBf1cQxhbFv8oske8vtru35yLIAfLUiwAHgwhUhQ5r3BhmjudYbgDHZ
         FyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771558561; x=1772163361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3SNYtFmJqSV95moRlaJ0QYmUhL+TICukmgmBhi3zA4c=;
        b=lS0WwT4o2Qrz4bhmjazYG1XSVa6i8R9+TZdJACVlayMJ06N0LRsRkdp0ixY5tHxfjx
         JMe8cnzEVawE8FHvnWPhem7mkICe3yxax1ZuorsLFpL9GM5f6KW145Fb1Le1AOSNc1xY
         7fxHi0LD8Kud2fOfMAYQl62MvZUag56G9f4vqvR+zrAmkgTifrF+yO2v7G1y8kmUy6OR
         j9PWzErgv+hTa6ekHVsgy4QS5BGYOst4rkEJnB8qG7Y60jekxEsFifgFNAYeilqB+gBC
         H6q5aEKri8/cNTieypqcuEYEa/EHJURz/qz+fHTL4d+nH3qJNDzct9G/Fhk8SXBxYFwZ
         H9YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXydTghVpHT+KlYMTuEohIi7VhbWOZH/wwWmfjCMxM9pcchciOy/vjM7wAduAt+XBaLZqc32pjuOnsZYZKpjPmu@lists.infradead.org
X-Gm-Message-State: AOJu0Yzzt9Wl5nTGOZ3hXew5pQxbMVALbLlQpxGKWcjC0PTWpyzAt8yD
	hzDueezo3+d53Ykra+iA7nwQatWEz9p499V8DPQ/iBldotWeyJf6yySx
X-Gm-Gg: AZuq6aK2t/xdeBRBoxUJY6lwp3DWEKBEE+OCK82TA1AjY3XllMgQHY38+vunEHIV0Yq
	HOgGR0PS00Sr4xwSpUzrUpbu0gDmOrZIxMC/U+/2mU76LfT9uZ4UBZUDsjOf6kI3S4H8WQ/KR2i
	XJ8bSyOqSwtqYgRp0ywzDeRtMdGCsAaK+OniU/xNKtdA1EweZHc1Djq4htlsNN8OyEGj4JuirAp
	usZ2TDbXN9SMe47aX4ZWEYmZyNZVFLrH5ZLurCgN2X9v+U9Ei0swF5vjGoDcAN2R2xe3+KZtjii
	sVQR1q18oclPbCVP7D4vpFKcL3h2LaOvtR43Dr63l2Xw0qTIrJ8rrT4Ap6B4EhEaEsxK9fJKnEQ
	6M7gb1eHvHHvknvT2emMhpdogBd2byLhusVsyklbiSNJxEYtlFRgCw4nDiHcEDoEh7Z/dLR0o5r
	Qu4Amr08tJvj680oPAJkWAutq90mc8WhZLJ16Jq/JxHDygDop3eIYla2pyDiO6
X-Received: by 2002:a17:902:da8d:b0:2a7:80ac:85b0 with SMTP id d9443c01a7336-2ad17431c2bmr182977825ad.2.1771558561498;
        Thu, 19 Feb 2026 19:36:01 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.236.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a9d5cf8sm177143675ad.52.2026.02.19.19.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 19:36:01 -0800 (PST)
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
Subject: [PATCH 6.19.y 6.18.y 2/2] drm/exynos: vidi: fix to avoid directly dereferencing user pointer
Date: Fri, 20 Feb 2026 12:35:50 +0900
Message-Id: <20260220033550.124346-3-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260220033550.124346-1-aha310510@gmail.com>
References: <20260220033550.124346-1-aha310510@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_193602_480022_0D8F06C9 
X-CRM114-Status: GOOD (  15.05  )
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

