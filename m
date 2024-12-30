Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E100E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 09:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VAJKsDdGNb+ALwQvMYs9Oz9Vq8VGrLJsA8GxB+kZmZc=; b=ailBd20igsJCpKeTHVjmV0QcHV
	BgCNWNjZde0qWpshJrVHcCdvRqdHywV4zyJXQZvUbU9HsvarsviBofMYSnqpZgfkVS75EPijjxOCP
	F/QFMiNn6SgplTmradebpcQNjFlAQF/KZBijIu5VCjSCx0HwIKegymeUO3FKX8tMz4fFrGO+f/Kb3
	PTI4ZLhtajlbc2IFzA3t1hcWqoTboakPMPZP7mE/5SEcGJPu0sCzSUMyngBGYu7ardsXFDqhCIj5v
	NUd2vgboC5FDHokjjBnp3i58zmSwV/Fy1BXXFnEK5apIp+NUafSz7XWS9Z7otu2xJmXyJ6NGKM9jc
	ZsBGK4lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSC5L-00000004w3T-3JHd;
	Mon, 30 Dec 2024 09:29:15 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tSBoF-00000004tGL-0I4g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Dec 2024 09:11:36 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-216728b1836so101133255ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Dec 2024 01:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549894; x=1736154694; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAJKsDdGNb+ALwQvMYs9Oz9Vq8VGrLJsA8GxB+kZmZc=;
        b=YbpxeGb5q8Imu3/QVcIT89m0+29EvlgIvaXTO5u/a4FdRWP7SYerPgMeEj6l+cu4MA
         wtcbuUvS1DjbCXxcE8jkM1d2PbsjLF7akEBPODyYOEgWC50afCEglAY9jiP1p/mfPpii
         ACb7IaW0gwe9e99rI8hrFlm4GIHWniL7J1PdzLUyzfevv2mjAa6SICatJOtkfzCwSOBf
         k8iVvMgQFKFfHD26GKsBNvdGdJq4quoZzPSuYFSocm0eEmgV2lCvY1sIB0IuWxgMLErs
         8i3pM+KFVeN+E4OKBUFdgICduIokLJcqjj9d+P6JbfIuB8k2C1qi+k7eQ1aEeYrZfSLl
         OBpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549894; x=1736154694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VAJKsDdGNb+ALwQvMYs9Oz9Vq8VGrLJsA8GxB+kZmZc=;
        b=sMmeO3d2ySWZrI7bMkuIwHr+QeMOEflGh32IXELwWpaM6fY6Fx0lHwH4jJhEF56y9c
         UKQRRWv4pe1+0odDlSuZpkZSADlXqBJIK4sshqA63QavzN6Qg9ZNTgYbmO9mDbArwt0N
         kQ9JaDFFj/Ef5WqAZ6a6RgKir68TMqArZ0kR76bH5ZgJnX8psBVcjVsSI9JsAO9VCsrC
         kBmL/gBxfI0Vb2C0FxUUrBFOkBUVakWZ3pfV0jLxO3gFKNWG6BECfuhHrYBx4AP78pFB
         bDITweYCYJ2GzXAmjr7y3/4UXVFyVyhoyMRfx08rMJZmZgktHXUAR6y5XRY9XNQ0djxv
         5Mcg==
X-Forwarded-Encrypted: i=1; AJvYcCWBoc54ZpZ77I4x9MD5VPH1mx88OQbNrF0QrjSeI2cYxdCEYEoTJ46Rm55C/PoIDZCJdRUYqMZRsXabj/aThd/z@lists.infradead.org
X-Gm-Message-State: AOJu0YxU3fnVBfKYvDaw7GHBaDEE9a/XFctqbRG+OXgO52Knhsh2UjhM
	Yk06KL4i8XRnJCh+EDX9jrk31sJQu4w9Gh8/c738sRu1q6V87Di0srvlppi7ikM=
X-Gm-Gg: ASbGncugIPqcn0uYf+Y1g+9nR8H/klDVcpEzIaTMopQtHEBYiyn2nSvVywapc6A8bmb
	Am7rS5Z30jnwegGTem+9YtXHtBsyJzsTHwg2aLZhEAtkpuLjiBuFYZwr3Wa14j6uMQBxPr11Ov8
	38BneAmdvrISC+Dz6mabMf8xV/GGCB6bPb+CTzdIv6J3r/aq3F4znUCl0coLHM1FgTlASOmoJfo
	+FZsrCJaII+BBmyQT47veWpUVu6t2IaMr1h75pJb7FTH17SxhWTeEurmV3qY11leVyFexLF8TFj
	EMg7vJoVEJV0vVobNszY3g==
X-Google-Smtp-Source: AGHT+IF2zawjY8HUYTCaMJHzWmoJ2TNFStaqczmOTvWfDCo9S9fZfm/YNlaFMm14SUWbTnX0T2oRFg==
X-Received: by 2002:a05:6a00:600c:b0:728:b601:86ee with SMTP id d2e1a72fcca58-72abde82a17mr50548930b3a.16.1735549894520;
        Mon, 30 Dec 2024 01:11:34 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:11:34 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	palmer@dabbelt.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v4 14/15] mm: pgtable: move __tlb_remove_table_one() in x86 to generic file
Date: Mon, 30 Dec 2024 17:07:49 +0800
Message-Id: <286e9777dd266dc610de20120fae453b84d3a868.1735549103.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1735549103.git.zhengqi.arch@bytedance.com>
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_011135_120867_4126EE21 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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

The __tlb_remove_table_one() in x86 does not contain architecture-specific
content, so move it to the generic file.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 arch/x86/include/asm/tlb.h | 19 -------------------
 mm/mmu_gather.c            | 20 ++++++++++++++++++--
 2 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/arch/x86/include/asm/tlb.h b/arch/x86/include/asm/tlb.h
index 3858dbf75880e..77f52bc1578a7 100644
--- a/arch/x86/include/asm/tlb.h
+++ b/arch/x86/include/asm/tlb.h
@@ -20,25 +20,6 @@ static inline void tlb_flush(struct mmu_gather *tlb)
 	flush_tlb_mm_range(tlb->mm, start, end, stride_shift, tlb->freed_tables);
 }
 
-#ifdef CONFIG_PT_RECLAIM
-static inline void __tlb_remove_table_one_rcu(struct rcu_head *head)
-{
-	struct ptdesc *ptdesc;
-
-	ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
-	__tlb_remove_table(ptdesc);
-}
-
-static inline void __tlb_remove_table_one(void *table)
-{
-	struct ptdesc *ptdesc;
-
-	ptdesc = table;
-	call_rcu(&ptdesc->pt_rcu_head, __tlb_remove_table_one_rcu);
-}
-#define __tlb_remove_table_one __tlb_remove_table_one
-#endif /* CONFIG_PT_RECLAIM */
-
 static inline void invlpg(unsigned long addr)
 {
 	asm volatile("invlpg (%0)" ::"r" (addr) : "memory");
diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
index 1e21022bcf339..7aa6f18c500b2 100644
--- a/mm/mmu_gather.c
+++ b/mm/mmu_gather.c
@@ -311,13 +311,29 @@ static inline void tlb_table_invalidate(struct mmu_gather *tlb)
 	}
 }
 
-#ifndef __tlb_remove_table_one
+#ifdef CONFIG_PT_RECLAIM
+static inline void __tlb_remove_table_one_rcu(struct rcu_head *head)
+{
+	struct ptdesc *ptdesc;
+
+	ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
+	__tlb_remove_table(ptdesc);
+}
+
+static inline void __tlb_remove_table_one(void *table)
+{
+	struct ptdesc *ptdesc;
+
+	ptdesc = table;
+	call_rcu(&ptdesc->pt_rcu_head, __tlb_remove_table_one_rcu);
+}
+#else
 static inline void __tlb_remove_table_one(void *table)
 {
 	tlb_remove_table_sync_one();
 	__tlb_remove_table(table);
 }
-#endif
+#endif /* CONFIG_PT_RECLAIM */
 
 static void tlb_remove_table_one(void *table)
 {
-- 
2.20.1


