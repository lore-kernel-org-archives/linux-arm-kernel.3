Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57696E7315B
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 11:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iIhY4QZTPPdLq2TRpxo21LNBMq6aPIcLWQcnhCbf1Bo=; b=n2u5AHaJYDiz011GsM7anwV9CW
	Um88GezO2OCwHIRMDD1+2o7toS0fac+GlG3gzl34wFnIvtqKbVd7N745yHN7fUTeIpVdt2irGyNjV
	1516XzN+sa4rYMtRGRo5fJpePpSsMJXBkGkfwiD3dyDVI16AyoN5/tW2LSvqT7EAYAGGlaQEUZ41u
	a9odKH9JfJLEtn8rcVfpZu71x7hz1XdGE20UQL0915JXeo2ueB1blaYAewwtkUzD8PDucOmJwUkXt
	O4JDxJpxPkLmWV+JSgqUXktbezgfE6CdPw0OTYwwhJEyq3IBNvrVBQ9V4arSkSwFpUI4Gj9kNq7hU
	tP/tXQGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmsAk-00000004u9D-3aSM;
	Mon, 02 Feb 2026 11:32:50 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmsAh-00000004u85-4A4x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 11:32:49 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-bc274b8b15bso2906274a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 03:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770031967; x=1770636767; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIhY4QZTPPdLq2TRpxo21LNBMq6aPIcLWQcnhCbf1Bo=;
        b=gcp/0MjMopQkKnWU9g/juORypftDKei/AHl3dpD+LoskE7p1zb2Z7skqa0zPUWatUc
         5jglW6IAaCAggI4o62zWBxrho3wmlIUs8Pg0GW4pRvu+Yz42j/ojSXE2tsXOclyoTgct
         abw6Sb9cmygJ7mdqjGbB+yjThESEuxagE7bv7gKCW36/RvO4g/9gusubgUaeZRXiU9fr
         oziPreWkj6OE/xIHiOpVg20KwSj0AfnWPEqLzQXYWSqB0+Ya8FiAdOa43Cbp5ZHMTbAr
         9Gqhrk6HoSqGPNWOohx9/OCDKO4/FdS5nhzCDPagvmYORyQoO378YD0gGknmU8p/L1X4
         mXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770031967; x=1770636767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iIhY4QZTPPdLq2TRpxo21LNBMq6aPIcLWQcnhCbf1Bo=;
        b=kw427RgPo7psCyG2EB3OzwDo7EFFIs1mN9BBTm2waFIfeKNxORdDVKnwKLLAksAryo
         R2sblSHeyVZZIcUet4/4Eox6NvePTid2m40GYcfFiGdN/GfNSSLSnT9dyiW8fImKi4eg
         uBmlMoydYGdp02h1OuoqUhGK50H8mY7DThnQJZC68xRSWle4XCey9VI5dhxq5Lzli+MZ
         CuMiER0Gx7xzF90WVPkd4HcSmMxYFFbJ0TuBQrcsprlUR02U/kbMe9clZ9Lc52iAuIMY
         5YCKN/S5W07dMzjvjCDrV198Mhk+T0ctQcr+N0nqeDDnD9JXr+5dr+2b1q3EArm4qEE1
         qPTg==
X-Forwarded-Encrypted: i=1; AJvYcCUg4lQIpmg4rJlEvjr1voD/but84/fP3sNJ9UTOACOKBtRitG5Stdh21HWnRq29dE6cc3BV9gwzikyz7uLwLswj@lists.infradead.org
X-Gm-Message-State: AOJu0Ywlr+4nin4dOLGwYmoIcghA/ygcs/ljQz1fxsH9t1zjJH0bqjfv
	0S/cV8yuaRECZ1agp1tkvY23DygQoKqiX7WA2TYHLf/0QnXOVbJ43d9+
X-Gm-Gg: AZuq6aKyabuzbjQBu67YNl8YU+1Dt9aUJLnqip2/Z0hD9HSdFkzlULssiWu53vKot0o
	/+ffE+9Cwz3vSQcYD5RGL/CXmrUkW4Y7MWNwOEIxOGnQqUr7J9ORoK3gfX3/J0FIYsU4Wjf93eh
	yM9XWSsHgsfAKKXSOIDByHQXPkCRpt5CNCXubPZAdbgRimeN3SmDGZFN2DOxgFrm8T+ApCR0Ier
	Xl91gEHwqwRiTvWdNNveVytUBenwuPafbtSKWx+sIxZ1oJN2m32b73rzdatfYAC+21fBlioX6Vu
	wwPBs0mSWNE9jWFlsHGp9xAIKaJ5G0Rev3bwEe/riGtJ6d3i9nuDP6xiPl2QbpzkfEcQf7hkX2A
	KNwYBfnOuPLOVHInmVFz3T1Zdvhe8AG+NiNPApzWyjg7C6zujeDvdTkbPJ7mrzozDKGBLNcw8He
	cy9vYGmIFpYnvN9OOhAGY0xQLuL84oGq7Krx4EMvCqZ7MyUoMs
X-Received: by 2002:a17:90b:2e10:b0:32d:a0f7:fa19 with SMTP id 98e67ed59e1d1-3543b39c961mr12734825a91.17.1770031967103;
        Mon, 02 Feb 2026 03:32:47 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a9f539dsm13743190a12.26.2026.02.02.03.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 03:32:46 -0800 (PST)
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
Subject: [PATCH 2/3 v2] drm/exynos: vidi: fix to avoid directly dereferencing user pointer
Date: Mon,  2 Feb 2026 20:32:33 +0900
Message-Id: <20260202113234.183393-3-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202113234.183393-1-aha310510@gmail.com>
References: <20260202113234.183393-1-aha310510@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_033248_039373_454A1977 
X-CRM114-Status: GOOD (  15.23  )
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
Fixes: 221009347844 ("drm/exynos/vidi: convert to struct drm_edid")
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

