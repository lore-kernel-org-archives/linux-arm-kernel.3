Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1613E668A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 23:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ErjFuEJhPVnB4S+GRnbOY1fFSnoTGmemqnk+wlSyH5w=; b=Q8PopsLFCCl17v57jUNF1/ml14
	hvuA54W58QkxmdP8XtJI/md/4yBPxpvWjZbt+rcl+MfCoQVZC2w5zzza05Rj9P7/ljnwZQWM7Sgs3
	8UqDXDBi4vQNFnF93o64lf3CQFinvsvUFyIxI2ybtzy+YT7cfzW2JGsa/djDEM80OkdG/P38jBywg
	Cqg3ZyP5IUEqeb2TkEUiH3w8w+rm6SAOfrG5O+j7kzuTbzxieLYAPFFAIXpYK/xPs2JBGc+m8Phci
	bISyO3LoKyD3jJBZz44pvQKXKYKvVcoRSFlyD00h4w6XlsByjcCR2Uj7PJw3IrypHLhRtwXqHMXeA
	/LkPW3eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWjuP-0000000B61l-0S8O;
	Fri, 19 Dec 2025 23:29:17 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWjuL-0000000B611-3g9W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 23:29:16 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2a0f3f74587so31748055ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 15:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766186952; x=1766791752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ErjFuEJhPVnB4S+GRnbOY1fFSnoTGmemqnk+wlSyH5w=;
        b=X27hOLgXCP4jLDJhZn98j3lfGlO+9RH3sbEYoCqOX7HzucO3C2919QH6H4oeek3tI6
         sUPwqvSB+RSPdpRwb0BwZIQR++is7LAOGxdcniLnbU09tlZ7BC7/VGVr8LKk5Vz89XUm
         wLrXNU2ZiKsW2RIjFGvaDc1+VsGLUxs9Q9Hc3e6atcOP6T2dfsIuh+plUWHn7yQihF03
         FOOrzVWxr6w2/Y/27kr+NufSpy34C/i7S9yZ87f2L/gHAftcFp3E7l5Slwdq5+7gZ/aX
         ObHBQukVwWXKSrGVOV+GLa+YH04UIilXDVR7uulaeXaetlQsCQ2o3rT1yZuNKi9PxVl5
         XdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766186952; x=1766791752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ErjFuEJhPVnB4S+GRnbOY1fFSnoTGmemqnk+wlSyH5w=;
        b=g/MdtswvHwpUdRne+2Cmo7/V2fM6tVRHwzegc7179lgCxEZBXZR4U6Du75b353vzdm
         2og5G/2DhGm7KYZLA8TXr6WgytXH6km2g/LMmt3V4ED1b0xw9Q8lesmlpYUAvLYiG7ke
         CK/vI+59nz3+p1E6qXGDuPtRNQUHE2Jy7Di+eVUs48b8xgFPLL1Llyi1m6z97PkAdeHv
         zhwWee7uVh+U/YFQAnrcD8XT4UpVRD+6BzvGUyDfDm0qhteOrX6haZHd4GMlMZHitGTS
         pM7w7a5d8HmdAfMAhZO0Kl5E27lKd14tOhx6y8O+IEYismIeRaIJd0h5CuNP3yBkjqxI
         YcBA==
X-Gm-Message-State: AOJu0YygnsC+38D5+wAPfPVZs+kgi50w2klsVS/JnpdmeTyHR3hfGi9h
	Be4TNuY9EtuIdq2qSrbMtfQ/Yej8IoADStQSekulrTobgXyIsMuhY0ea
X-Gm-Gg: AY/fxX6RNkBO9/ZYIjNPugmWuEy4XYmLlt95XXeH6tJXbvw4tz4N8uqDxSUC1rzfs/K
	CPcjYqbY8zBWE9XHtsvQfWt+sOwx5kHnhx8Oh03fCRMgr+IbGFEZBWm9ZQvo/qYslZA+lEMrel5
	iHD7DB1mszd5QkDChhWCPZKe0L1JkAHaJU5RgWzTNUnNCKAnZLPWz/qOjEXcKxrio7W8SmV+Hyv
	Z+VLmX54FO+st7Kn2v3s8s17E+dl9vWjyB685Jx+t3HMDHCR7QhTeRvbIt/+YCwDu5IKyKLfLVp
	PY8alwVFcf4SSVa+rSFEqGwrq0jIgd2kktbAuwWD6NX2RzvBXyI1b3Sg5M9lGba43DoLkI1vxKI
	G1cOowq1Lu/lIrdntw5o+ugHbVpFm/CPSmNl7yUnoWNvhwrx2KTkA2GY8xHYfhNxTLq2ZYqnfZZ
	pDDHPpHnwCBr4/JS1E9FU7iiRxgldswGuBZ71FnxgbiSLCZmc=
X-Google-Smtp-Source: AGHT+IFBamXzou/oh7mGxZfRc6PCq8nbVOl9oxyNqBD1zmlXSfuI/gIlWD5JXgOfYVY0WlEzZGORsw==
X-Received: by 2002:a05:7022:1a81:b0:11b:9386:a3cc with SMTP id a92af1059eb24-12172310afemr4232239c88.45.1766186952099;
        Fri, 19 Dec 2025 15:29:12 -0800 (PST)
Received: from localhost (ip70-175-132-216.oc.oc.cox.net. [70.175.132.216])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b05fe99410sm11055685eec.2.2025.12.19.15.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 15:29:11 -0800 (PST)
From: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
To: will@kernel.org,
	robin.murphy@arm.com,
	joro@8bytes.org,
	robin.clark@oss.qualcomm.com
Cc: linux-arm-kernel@lists.infradead.org,
	kch@nvidia.com,
	Chaitanya Kulkarni <ckulkarnilinux@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] iommu/io-pgtable-arm: fix size_t signedness bug in unmap path
Date: Fri, 19 Dec 2025 15:28:58 -0800
Message-Id: <20251219232858.51902-1-ckulkarnilinux@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_152913_978041_CA158E7B 
X-CRM114-Status: GOOD (  14.32  )
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

__arm_lpae_unmap() returns size_t but was returning -ENOENT (negative
error code) when encountering an unmapped PTE. Since size_t is unsigned,
-ENOENT (typically -2) becomes a huge positive value (0xFFFFFFFFFFFFFFFE
on 64-bit systems).

This corrupted value propagates through the call chain:
  __arm_lpae_unmap() returns -ENOENT as size_t
  -> arm_lpae_unmap_pages() returns it
  -> __iommu_unmap() adds it to iova address
  -> iommu_pgsize() triggers BUG_ON due to corrupted iova

This can cause IOVA address overflow in __iommu_unmap() loop and
trigger BUG_ON in iommu_pgsize() from invalid address alignment.

Fix by returning 0 instead of -ENOENT. The WARN_ON already signals
the error condition, and returning 0 (meaning "nothing unmapped")
is the correct semantic for size_t return type. This matches the
behavior of other io-pgtable implementations (io-pgtable-arm-v7s,
io-pgtable-dart) which return 0 on error conditions.

Fixes: 3318f7b5cefb ("iommu/io-pgtable-arm: Add quirk to quiet WARN_ON()")
Cc: stable@vger.kernel.org
Signed-off-by: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
---
 drivers/iommu/io-pgtable-arm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index e6626004b323..05d63fe92e43 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -637,7 +637,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
 	pte = READ_ONCE(*ptep);
 	if (!pte) {
 		WARN_ON(!(data->iop.cfg.quirks & IO_PGTABLE_QUIRK_NO_WARN));
-		return -ENOENT;
+		return 0;
 	}
 
 	/* If the size matches this level, we're in the right place */
-- 
2.40.0


