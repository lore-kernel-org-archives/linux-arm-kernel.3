Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A185FFD9E3C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 05:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqIhYcF+CYSjiR8zV9a6G8BIYgFMg1pnmFFZ2FA8I4I=; b=ESDUUZjl18+ySsp3EUAGaSWMuw
	BjmG2amKtR9+KkZBxpXkShjfhYpYZnN+wwi2e3RjoV9mG5MCP+CL8Le7mMIfDFgjPg05/juwCkuyc
	TtINqUvHB2NY2EmNGDaNH3b8NKxu0JTo0Sv5URHnKtGxL0KfNBHxYHgQmX8ykePwsXnxEC1gtLtae
	3kDTsQ1IkcIVhsAoUyERh/qKg5LjtlYNNix3DlLG/E16MDyaBcSlN29dwRsIj4u+GBHBfyCYXott9
	GkRSk7QxUaLvJ53afxeiU5p/abZCtCPrQJly5CaY++GucwLN64TJqv/YsXh2zhA3/DpgotxeYfXUV
	jEOi0jWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvqTl-00000007ifm-2Br7;
	Fri, 27 Feb 2026 05:33:33 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvqTg-00000007idu-0imZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 05:33:29 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8274a3db5e3so419293b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 21:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772170407; x=1772775207; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqIhYcF+CYSjiR8zV9a6G8BIYgFMg1pnmFFZ2FA8I4I=;
        b=PQnd5+3WiNyvuC1tG5A7LRF2b8wBVjRS+fttsJjk80xyANjtymRcNicEuEZge4Ic39
         WcazUJCQLeND+9W8URH5dz4nkzIjb6TEDB2sM67v9/YrmoE5NT1b4hsPz6Y0Kyhsthgi
         98/JdT98W3sXHpu12d0N3Dm9msZVtDJ1MafbpUdiqsbfBCHRqOfrcNOtyA9A/H9yVMJf
         tLwty7LvCae/93FhJfV6dHcpz707vMNDrIFlV0lf4jXvmR4ELeRk4C5oIvTJ9MF3s1Fd
         EDOfAdaA65oQS1qAjyzo4k/+rnG1v2qrEq97BBLaKPLLU6wKr2GT/S+ZCdPfMR+jmFwE
         8quA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772170407; x=1772775207;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TqIhYcF+CYSjiR8zV9a6G8BIYgFMg1pnmFFZ2FA8I4I=;
        b=e+YN1hgXtGEXIt9zNV8AymPzq+iRhGbjbiug3gR7kz1edmjsr+c4AJO0MY82zWJNcA
         65XxCKQGiS2ZrSq4MwlyLzIoXis7alYIJZI39DSEw20fmSf0TiSwIN3BC0pYCNpY4cil
         WBnsIb7f03DyMaBIU6U55oPbTNVaomdczZ7rBZjjfW2j+CdrIyoUr+dgHVjiLzGHv5LM
         vyKuo6UTtMl6HgalbSHpEfGqTHt4vD9wIcr1Pq+c9i1EUTkGjNqg4Rj16idz0f3D3MZ9
         gUTryzaHbi+zRBcswhr1rfBT0H7eZm7RXtF1fSfHVA0JCav80Bf6TBvpsOrT8hoX5zVx
         ECWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFWeHL4NgbPofZy3/tV8WgtI1YBtlYKoVcKgd3DCIDH/4p7k8/iTbye3ZqD4rBnuT5Q7A+RNY3uyKL2JyjgFJF@lists.infradead.org
X-Gm-Message-State: AOJu0YybWw1/GOcGOzI1DOxhN84TGrrqhHV3GPdOYMJJu8KagNE86HGF
	WbUtuDBvA+QrUqe8TXAWqvR1RHpqy0uVaBsIJpX3W8lZaLOpnbiTU+rM
X-Gm-Gg: ATEYQzxOFi5HigOcgrvIzUx9qR5KnAJ6MaT2F0vA7Lc3MsfNzxLn8LKXfZaiTJYiH8c
	CHgVtnwIN2XlpiGF5A8x+uRqU4G26Yod1kqegMkIawvtmHSuBE1VeVq4WB3GksZ8L1vnnsns/rN
	rjoJgQ8H758ZYw7HKpwkW8NmfivOtkJC8o+YfOdHkh2t2AxMoMwEQfUXN7f+x5CnU0MxUD5jSqs
	OI/6iYGYvGxY8tkYbJcWj8bEAp/B66w4vG3LOB6owx6gm6ppHZy+32EO0Kp9HElAkAOCISMnUH5
	gwlOE3/H5XVTiTkViADg4YNQMqDsqyFc3hgK2gWMD+0bmuCHvs92QkQMbaGKQXatDV4Y6o1T/BC
	PGWDcW0y/0hIoXjt4yxAluZEnejILsvzxP3I3p9hdWDdBNSmLKmR2DyjEsjeS5P2+I5eYcHRU6c
	YyQiUHt5AGHaijbgopzTtb9sxFs2d29xNxHS96eTzqFIFWLtQlZg==
X-Received: by 2002:a05:6a00:94c4:b0:823:c59:9cb0 with SMTP id d2e1a72fcca58-8274d93b0b2mr1369523b3a.1.1772170407236;
        Thu, 26 Feb 2026 21:33:27 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8273a048615sm3815828b3a.52.2026.02.26.21.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 21:33:26 -0800 (PST)
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
Subject: [PATCH 6.1.y 5.15.y 5.10.y 2/3] drm/exynos: vidi: fix to avoid directly dereferencing user pointer
Date: Fri, 27 Feb 2026 14:33:16 +0900
Message-Id: <20260227053317.426000-3-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227053317.426000-1-aha310510@gmail.com>
References: <20260227053317.426000-1-aha310510@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_213328_231530_C0903A05 
X-CRM114-Status: GOOD (  14.98  )
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
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index d0e394397eca..576d79ebe9a8 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -252,19 +252,26 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 
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
--

