Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F412D58CBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 21:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n2BcmGWUlKjDNBV7X1EsbJrCzz3GciSU72UqjC/sO0s=; b=XPC5eIQeThawq9Xu+t0wsxi/Lo
	UtgyB6pAbioBnYqYtHjQCrzT2Ir6WG8zYMzdbJPEqBgDWF1Klc6XcINM3i3+g76eGAkNcJMa/6C2E
	cxmnaMzhlh60vct/FlaGUz5Vn9/yVhvzOMCkaa0Fr9DAma1iR27lCfw9exNJ+eba2Uxo24/uF60yM
	tKPqgZ9lbTRZ3NDY5Fvx83t+K9Eg7Hvcs24WQpUmIG4IhHqBEOufqNd2d0bC5sSyjQ4tTwg0MdGfh
	hg5bJCeNPuIn71/R0oYWdq4T7HcJXG7Eyk9iQgm5coT0LXGPJ6EpGQBXC/K3OqzhswUrpUAu0VaBv
	EPnJujXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4n1t-000000001xV-3P2P;
	Mon, 23 Mar 2026 21:41:47 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4n1q-000000001xA-3gAX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 21:41:43 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-486b96760easo5737835e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 14:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774302100; x=1774906900; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=n2BcmGWUlKjDNBV7X1EsbJrCzz3GciSU72UqjC/sO0s=;
        b=ZVXcnvfYmXpZhN5ZEXDzOedVjSSnYZREVoZO3223qarsIScbkH8NTWxSJCpuSsIYJa
         T+dl7KS3sPP/8dF0mFmUbv78hsVIcUDkPn6vAOtg6F4hEhwkkUD49BFDnLz83LfhZt0Z
         10ZS4GtAfz5FxoC3Y1dGSDz11bsJ3mHNYGxRfSIHKqTOrr8biJpW1Zr2ORY05HyT6fQA
         qSvTkVT47AequjzY9xpLKOA2cgEVxN9+wLoFEsr64znr6rRDj0LRBDXIen1IChSisThS
         pGHMEO9bkzSkf86ttJFV5P3COLwZa7wMJb1z7CTyeE4BFHt3zCcf/D91G6ZHKeawfh9c
         Y8dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774302100; x=1774906900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n2BcmGWUlKjDNBV7X1EsbJrCzz3GciSU72UqjC/sO0s=;
        b=Fu6QF6DXYUVqcvuxfKswzGmlLXMglHe6qu3dKnES+fuymcARsI5PpO+LiVGpK2rnCl
         S0jfZp4b/BljyyTg3CJOAXNzDJhNqCUvB39qnJs4xw3bWltBM4ojD6eozbqRBYSYKdFG
         VHNsbj7oL9yXsy/vFDPZpynxKMdpVSs7s1RR0lGpI3l/mD3GM6mZE9VT0i7710aHTFCS
         O7/9ZZBOM7GpjMS41eBSvvdAnQqU8UK29vo4DvdpyDVzFm2tlRszrJ1pPBpyjwSexet4
         5Za0REQBnZeM5wfrdt46MYN6HAU379nb0yPuSdMnbLOvrV/89zrDECqUfhjV6SbC0sd+
         TJQg==
X-Forwarded-Encrypted: i=1; AJvYcCUR2h2XJW1czq4d5gb4WWnxpZUxfCvSjWQMyFCW6lHg2Z4QLsg+Pw1+SGK1fskiaQThwelIFIcuZi1CniRodkbL@lists.infradead.org
X-Gm-Message-State: AOJu0YyIIfH4JE9J06rxHkrRdSGXW4G2neO8a+Hcn5tLlpgbuen+xL7i
	ZeRzAhJFZOFMkU6PzzJocAw+xPh1QkobalMhBhwUrlwyEdh8TjjEKMXH
X-Gm-Gg: ATEYQzyZPU3eVeQKdQhsD2PGffNm0vSrwtHWkOH+wwrxatAineTkHroJbV24Fqes7QK
	o62sRra/3ChInMI2KupeHYpSXlFKgLPIeFTUoRgYL4r+u46GMvWIc8Q6I7K+NA555TxybPqYSFO
	zKbD7mCf2tdyZwj4BOiIpWatP9cXiOawk3S1cC+4WfC7Y7jj+AWdefAIJ8OJ32Ca7zaHCExRqk+
	bF0dM6NUgTya0crlR+PR8Dcz1GZ3jycBsnscWTv/fsUHh3fl0hR3Rqs6od3AGuq/LpfuXuwdFda
	I89y89sHyk9OfjGtGn0Nute3DfKbgNeqxNXLcErVQrrjEYFzPT/zBtzzvVjHWupzWLPa236H17o
	GZHHXFncf0dj17h7myi3h8TYctXaYF3VU/X2ZLn5wTIQ4aOLnln3AVHf1qoMGTADvJrIHYiiqB1
	KlV9LWrQb0PA9HslHQ3U6hW1kuFDcjxqI1PVmQouXU6y/kRZpwWskV6tFObuQ=
X-Received: by 2002:a05:600c:608c:b0:487:1114:d42f with SMTP id 5b1f17b1804b1-4871114d526mr2635115e9.1.1774302100481;
        Mon, 23 Mar 2026 14:41:40 -0700 (PDT)
Received: from osama.. ([156.223.38.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4871105c799sm2133935e9.20.2026.03.23.14.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 14:41:39 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Osama Abdelkader <osama.abdelkader@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Jeff Xu <jeffxu@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: vdso: fix AArch32 compat init allocation leaks
Date: Mon, 23 Mar 2026 22:41:16 +0100
Message-ID: <20260323214117.241216-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_144142_921149_3FDB0FEF 
X-CRM114-Status: GOOD (  13.81  )
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

aarch32_alloc_vdso_pages() allocates the AA32 vdso pagelist, the compat
sigpage, then the kuser vectors page. If aarch32_alloc_sigpage() or
aarch32_alloc_kuser_vdso_page() fails, earlier allocations were not freed.

Unwind in reverse order: drop the sigpage when kuser setup fails, and
kfree the vdso pagelist when either later step fails (only when
CONFIG_COMPAT_VDSO allocated it).

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
 arch/arm64/kernel/vdso.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/vdso.c b/arch/arm64/kernel/vdso.c
index 592dd8668de4..9903bfdfd45e 100644
--- a/arch/arm64/kernel/vdso.c
+++ b/arch/arm64/kernel/vdso.c
@@ -236,9 +236,27 @@ static int __init aarch32_alloc_vdso_pages(void)
 
 	ret = aarch32_alloc_sigpage();
 	if (ret)
-		return ret;
+		goto free_vdso;
+
+	ret = aarch32_alloc_kuser_vdso_page();
+	if (ret)
+		goto free_sig;
+
+	return 0;
 
-	return aarch32_alloc_kuser_vdso_page();
+free_sig:
+	if (aarch32_sig_page) {
+		__free_page(aarch32_sig_page);
+		aarch32_sig_page = NULL;
+	}
+free_vdso:
+#ifdef CONFIG_COMPAT_VDSO
+	if (vdso_info[VDSO_ABI_AA32].cm && vdso_info[VDSO_ABI_AA32].cm->pages) {
+		kfree(vdso_info[VDSO_ABI_AA32].cm->pages);
+		vdso_info[VDSO_ABI_AA32].cm->pages = NULL;
+	}
+#endif
+	return ret;
 }
 arch_initcall(aarch32_alloc_vdso_pages);
 
-- 
2.43.0


