Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825FBCA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 07:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n0iL076pHUaLr+l14HbxfZqldd4j3905YwLicSMDih8=; b=fNOOjJTrbUey/knR9qfa9b/MHW
	x6PeiNWIDnBmdEQssITb3pdJyXc2Y32ruXwYgVlgFq1oazxKKo9VsQH9RmYNzLurbMIFNrbMvWmPO
	0XgiF8tU5fHCtTJJDOsXTbr2E9MOwnT5YC8IOYm8k6Jid4QIBUxnKALE8R6P5bmyIE7bXbeHuLMq+
	9Eqyo2SkAa440xAl4ICpEzn0yNRhHYxFDH/BJ+km0Z+kznsFnT2GgUdf8cWDlG4y3RRNhnZQy5Gel
	HSn1+o64Pn1u1ldYQfZTd7M1WfMQdZghLHDVi60ga/whBcNtNftMrOM7IK17+3bCjJCIsob2bIIIl
	yAuU9n0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiaf-00000003kk4-3sUE;
	Thu, 08 Oct 2026 07:30:57 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiad-00000003kgu-0PQo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 07:30:57 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cc52c1b8286so207220a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 00:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791444654; x=1792049454; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n0iL076pHUaLr+l14HbxfZqldd4j3905YwLicSMDih8=;
        b=c5Os7dl50L1i0BdCnODLvCbXRQ7cyAy11RAijNZhOqsKL1naVvTTO1gw/QSNoHctuU
         OWmUHKoQX9Ni7YE4IS/W9c5ZNmdeMchn/E/Dcq+Lq+hbQn30gAsPxYtQqVu73+5rjGWy
         PoVrj0oOSf5kZQtZxts1S1EkFwoB2EYKanAuPrxZhzFohJz4RgzBQ4zc9rNAijea0/Tq
         MleuTmFuzsr0WXMfvNKd1IgFFgMKwsZhIIo1rZwtR8OUKG6fjgErpmxojTBZiB4tFuS2
         qFHaUSArQoGhr3GI+0eNYH4Ih1MMLmAevtQhJVePLBz+i1owgBrRFXKTSM2jaXBFvAVi
         WG2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791444654; x=1792049454;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n0iL076pHUaLr+l14HbxfZqldd4j3905YwLicSMDih8=;
        b=S+bHGiLeF2M3RbAiYrL8RGcxL1ey0Zwtt1Qt8Gu6CWh831gYVR20ffeph45aVhlnjt
         VkCICizIyC5VChNEx24e776KH5jGbEv+X34DkGi2mCKik2a6vmyrQF2f/174oD8Vj0+0
         +KHqJLekFhbReni8qR0/0p4GgaVT3wNrFvVSAiDY8lnZj2Hc8m41ZvFbK6Ou1GX4iSau
         yz9OofWaub/ba8JAcL8SEozDuY1u/zOeoo8YX0EPGhSfTwriqP6gwt9tmG1U0iC/4Vio
         3LFTQRqJ4lMEoSAMcctvmzJP7nHhWKf5FasEmi1d7kj9TKaxEGZvhw33g3qNpRI4F4Yd
         CaDw==
X-Forwarded-Encrypted: i=1; AKwUvBzaRqzAlUOteHKqunvE30me7wKEP7aFg6e4ZrMd0zZpDekg79Gl68ofwxs+K6apoyucHEFid2dfYlAuBOyjvXfA@lists.infradead.org
X-Gm-Message-State: AFq9FYJjuI6juYKCKyEXSO9nATJNhNiYOoMGGJLcEf5qOY6tx0Fiv8+1
	rQshJ5ZpGtdpmbJYPQIR/AvyIWunFzuMyfuH51vHqkg9PxWz+gg6d5s+LCXyMHLlluY=
X-Gm-Gg: AYBFou1zQ9VVubKAFVLLKSqwzd5qJrmP5twQYuuRSwWya0TxfLlqWT+6XbGJhtaPvA5
	RZulD5Pl+P3ZxQN8myI3UzpzcueVsGlUufMSE5qAIKcW0M2uof0yzwgHPfRBNxCl4VGaBlz6maR
	o3i/gdzqbJtSMxSuV4S/ODbGTDryj0yjT4o/XLL8xfAuK1IhCYYwDxoyVcSQ6BbDg1wETQQmWCr
	jAuyMBtfxSeT6KKtwJYHZCTaJ+vhkZ54OdYm/YYJHnSQWLyDoMUQCEt3FKaMLxIV6PkKWSX9vKT
	arisroQNHUoRs1uqaIuAvJJHnyXHFamBTU8MBUldPZpWbOn97kDuyG9gN40Idtkm/a3JUCtFqUh
	1DdrQnci/rR1S045Kj4TADnll7oXUjdyZu9mAfq0h1D9jt1ZJqp7dUBL7/hLZlU9//kJAF8taOE
	lNEcM98FmxiAmANE7zqsjFHwd0OYwr7ht6Y+w3/9R7nh68cjjLgicdf0/Z3OlDDo8JNc2rcYdOB
	iDNj97Ude2OYRAazlge
X-Received: by 2002:a17:90b:4a50:b0:39e:6c68:fd92 with SMTP id 98e67ed59e1d1-3aaed9a2992mr859363a91.39.1791444653999;
        Thu, 08 Oct 2026 00:30:53 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a438f25dsm3114715a91.2.2026.10.08.00.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:30:53 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	stable@vger.kernel.org,
	david@kernel.org,
	osalvador@suse.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	bjorn@rivosinc.com,
	apopple@nvidia.com,
	linux-kernel@vger.kernel.org,
	muchun.song@linux.dev
Subject: [PATCH 3/4] riscv/mm: fix missing destructor for hotplug PUD tables
Date: Thu,  8 Oct 2026 15:30:20 +0800
Message-ID: <20261008073021.2512665-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261008073021.2512665-1-songmuchun@bytedance.com>
References: <20261008073021.2512665-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_003055_148677_9DE50C27 
X-CRM114-Status: GOOD (  10.54  )
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

Commit 8472cc4503eb ("riscv: mm: call PUD/P4D ctor in special kernel
pgtable alloc") made alloc_pud_late() run the PUD page-table constructor.
However, free_pud_table() still frees non-reserved PUD tables directly
without decrementing NR_PAGETABLE.

Free PUD tables through the common free_pagetable() helper so that
constructor-backed tables run the matching destructor before being
freed.

Fixes: 8472cc4503eb ("riscv: mm: call PUD/P4D ctor in special kernel pgtable alloc")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/riscv/mm/init.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 429a0b015ec1..62077539ee78 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1540,10 +1540,7 @@ static void __meminit free_pud_table(pud_t *pud_start, p4d_t *p4d)
 			return;
 	}
 
-	if (PageReserved(page))
-		free_reserved_page(page);
-	else
-		__free_pages(page, 0);
+	free_pagetable(page);
 	p4d_clear(p4d);
 }
 
-- 
2.54.0


