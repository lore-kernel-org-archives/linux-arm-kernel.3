Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C023F108E1FC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 12:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=2dV1m6FfCprlm6wAXLnTXDCffLu9avi+83gZs34ZUak=; b=Ne/fAD8GZicpR5L+PYjhkBz52E
	wOFaF26YYOssEttlHmkoJYLMw4IJfGre5v2b84K702WsYBz0+xle/6qPDjQlK/8jo+hsUYvWeGXBF
	W2qMYG8VXJtLqf9HQ1tenes6YIZlTjeo1Z8jJ6dr2IOd1+PtFQ9iQ0oYFdY0b33thfaKWxPRxkrPU
	gZu7tT0pICYmEbiwVrv91ByiWJzC4NHmFiQ0GWLPM1ZZ4GTh4VRtYCkVZkidW+ykWOGBZkEGc0+6W
	8l9l0ESIuiF+jyCvgYPhpJR7Upk5P9qCxAn47ZQwHfvh4BqeQF8Co0LlApVcaqMqFiofuGRwslpZa
	lkSvWSbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3C4V-0000000Aa3p-3Mqz;
	Thu, 19 Mar 2026 12:01:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3C4N-0000000Aa2S-13p7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 12:01:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 512A843986;
	Thu, 19 Mar 2026 12:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C521EC2BC87;
	Thu, 19 Mar 2026 12:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773921702;
	bh=VN6CnRcD1cEEmdKQOxkAcabrskj4q90iDzQnQm2rak8=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=DY58x/fsYrFcSvWC0zvxkISldjag1r1b71ARY0l+IzEk8PCQoqdxMETAXoRDEFBGJ
	 DKFW2GMzMP60oe10+jhTaP1wfF3BYkDOluLJRWCxgG/RqXjxjZfaGOE/F11Y/nzzfw
	 CBSOa62f0zpVbe1K9fj12RJl+EfeAkCAAA30RhNQ=
Subject: Patch "drm/exynos: vidi: fix to avoid directly dereferencing user pointer" has been added to the 6.6-stable tree
To: aha310510@gmail.com,airlied@gmail.com,alim.akhtar@samsung.com,dri-devel@lists.freedesktop.org,gregkh@linuxfoundation.org,inki.dae@samsung.com,krzk@kernel.org,kyungmin.park@samsung.com,linux-arm-kernel@lists.infradead.org,simona@ffwll.ch,sw0312.kim@samsung.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 19 Mar 2026 13:01:23 +0100
In-Reply-To: <20260227045953.165751-3-aha310510@gmail.com>
Message-ID: <2026031923-spinner-guidance-e9b7@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_050143_338426_0A187C3C 
X-CRM114-Status: GOOD (  16.59  )
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


This is a note to let you know that I've just added the patch titled

    drm/exynos: vidi: fix to avoid directly dereferencing user pointer

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-exynos-vidi-fix-to-avoid-directly-dereferencing-user-pointer.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-219910-greg=kroah.com@vger.kernel.org Fri Feb 27 06:00:25 2026
From: Jeongjun Park <aha310510@gmail.com>
Date: Fri, 27 Feb 2026 13:59:52 +0900
Subject: drm/exynos: vidi: fix to avoid directly dereferencing user pointer
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Jeongjun Park <aha310510@gmail.com>
Message-ID: <20260227045953.165751-3-aha310510@gmail.com>

From: Jeongjun Park <aha310510@gmail.com>

[ Upstream commit d4c98c077c7fb2dfdece7d605e694b5ea2665085 ]

In vidi_connection_ioctl(), vidi->edid(user pointer) is directly
dereferenced in the kernel.

This allows arbitrary kernel memory access from the user space, so instead
of directly accessing the user pointer in the kernel, we should modify it
to copy edid to kernel memory using copy_from_user() and use it.

Cc: <stable@vger.kernel.org>
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c |   15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -252,19 +252,26 @@ int vidi_connection_ioctl(struct drm_dev
 
 	if (vidi->connection) {
 		struct edid *raw_edid;
+		struct edid edid_buf;
+		void *edid_userptr = u64_to_user_ptr(vidi->edid);
 
-		raw_edid = (struct edid *)(unsigned long)vidi->edid;
-		if (!drm_edid_is_valid(raw_edid)) {
+		if (copy_from_user(&edid_buf, edid_userptr, sizeof(struct edid)))
+			return -EFAULT;
+
+		if (!drm_edid_is_valid(&edid_buf)) {
 			DRM_DEV_DEBUG_KMS(ctx->dev,
 					  "edid data is invalid.\n");
 			return -EINVAL;
 		}
-		ctx->raw_edid = drm_edid_duplicate(raw_edid);
-		if (!ctx->raw_edid) {
+
+		raw_edid = drm_edid_duplicate(&edid_buf);
+
+		if (!raw_edid) {
 			DRM_DEV_DEBUG_KMS(ctx->dev,
 					  "failed to allocate raw_edid.\n");
 			return -ENOMEM;
 		}
+		ctx->raw_edid = raw_edid;
 	} else {
 		/*
 		 * with connection = 0, free raw_edid


Patches currently in stable-queue which might be from aha310510@gmail.com are

queue-6.6/drm-exynos-vidi-use-ctx-lock-to-protect-struct-vidi_context-member-variables-related-to-memory-alloc-free.patch
queue-6.6/drm-exynos-vidi-use-priv-vidi_dev-for-ctx-lookup-in-vidi_connection_ioctl.patch
queue-6.6/drm-exynos-vidi-fix-to-avoid-directly-dereferencing-user-pointer.patch

