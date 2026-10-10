Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC168CA6004
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 11:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DKSY00uXgysUXVkY7SlpnwG5DQxZo+OZZK+2IbfOVaE=; b=GKynJk2PUxXBOX9sjn/0nq1OFN
	1z7x5KBj6+G3nHez4J82LwoLD/s5qaYBA4sMWqcabR9YT6uL6PjZ9Id/g1cO2wOIIeiyTz+ZNatAX
	4Dtz6oh0MdqhAkp2ZYg2TDEIczs02LAUHDv7xSDHofYsrqcfyWSCNpj+cNGKgkCjjl8Do6id/kJwL
	4uv0AbBtUtHX8z2g1YtO7nG9fNxZqDqYMt8a5PTrnC9r1RQwvwNfdi94aPdJgVnlwkPZLlIQEOB8T
	4djyHfmMc9JEh7pu3g1rx3c7k4N9xlwbcNBat/bF5tRIzVMBI+sR9PyBBoBrFcp5I2wupPXHvHys9
	ftIHN7TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVDY-00000007uoj-1Xgg;
	Sat, 10 Oct 2026 11:26:20 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFVDU-00000007ulh-2hid
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 11:26:17 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-3ab41538192so347286a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 04:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791631576; x=1792236376; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DKSY00uXgysUXVkY7SlpnwG5DQxZo+OZZK+2IbfOVaE=;
        b=N5guzU/jZRXgGcMkP/zd0kT9mhWm6Y8icLuZ60ZOFvsi7luT6o+ewDWKW8Zh5vr5kz
         R6SvS9AHrDuOEQiJ8xHJlMwyNR67P+XmgJW2BrZ/FJDXyVLug9DY5y58AaBCpFPMvPLW
         SiIBUeMEYJ5wmkqqfUnbcafB2f8ZS2oKdnJga/FcJ2OOVspPNW4SAWJBlPzye0t7DXqc
         19uLUXxs9MnGKkxqG4TDbB+pa5fV/p0Rwg91+cwzlskzpY+0B7jQQGR/V27UXiVHv7vK
         pZAVuE7cpcJaPyQUA0NKH8+FVqk339mlmLU7zKvPLrjwn+eAt8L8K/ySWWNC/AJvoN44
         niYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791631576; x=1792236376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DKSY00uXgysUXVkY7SlpnwG5DQxZo+OZZK+2IbfOVaE=;
        b=2w3X5chKqjXVemnE/F0Z7WJj434j3+kwgRdyTV/dcIYMQzOLm5xLaOxK1ZCDjNhAP2
         Xsr9vgZyJuIYeskhYNLHuBRNkWPyWm4SVb4Whq5trnoVDcvvwOztYcCMucHIruz+8X7s
         5KlilLRclyqyoWMP5Rb4cRPxuxStf3MG/6w876pwpdSC4Lw/96dXr4mrSqix/+mUdv3+
         0A6vQsDe/kmTpT9L2LH8z9wpk94ude1/1ZzjXlvUv3f50HoaOw5QsobsRWd1fLHRJT/A
         4tBoJehqrxeNBtYd6lLL34DJ1JbW4Lq+gcNJAN4lqHmBoUsjqa2fPl+t8gMI7CA4cHNd
         LAoA==
X-Forwarded-Encrypted: i=1; AKwUvByMd6yp/Dh9pmEozlku01UpxmAPZpI/iuC9RupSU5Ik4w5NMimOtrluGcLnMkpHz08ewjVxJmrM7vr3C8gPrh4T@lists.infradead.org
X-Gm-Message-State: AFq9FYLKuhxcDrKqH0a9M7lr9Fue7Gsf3dwu9rnfvrFX9m+r8xQo2fCe
	oHCsBV8U0vPznPMwd3y7Go+bS4fVvVpCLLIAYCCwYeR2OrgPqtnUcToLp9MEUZ7XiSw=
X-Gm-Gg: AYBFou2cHQsw3YBLqIZERPSNRTqPQOVipZHMQmBZmeBuwffWFxk2XHZ5yyYLHkoRu7V
	9M5tV8+5pY+trYoCbYFxDpxAEOwz1G+rKOL7G1GiwL7V/noAMFqz/jfvTYJl89GwedwtU9pyPYC
	Rc4yfkG0CtMa1iYrZBvQ2QiaFGGKnr6Nzs6N1EQ6W4HFKi/8qAJwg+jVq3FvJ0pHJSq1urifztm
	iaY8U8UCcaKaWMDEUqT98Ct3QUK+rtmtx84sy/TUa8HFUg+f1dAJ1VG4ova2eTi/cN1refiVrvm
	OsJRbnKeCQCGoN7ns/YiXOAN02GfR1j0W21VzsiEXAvH/Rx2/z7SEzls1zO1yvZ/ATCvQN7lx1V
	vUoqNvVvrZpnoS9HZBuH/BbeWjYu4LdzMqQ811UL5vz9NH8t2yg88iBDQU3rlWd2oxxNKRk1yqi
	ZaaYiBPR9ru67AnWl8BJsdfbFvxYS7uuof93ErfhrIIpiIyBNgZbC2QH7DFBzoOGAwbjdARleCB
	ywBmT0pLPH64ukro5OLR/+HsJmhBKtCuKOVKg==
X-Received: by 2002:a17:90b:1dc1:b0:3a8:96cb:fe8 with SMTP id 98e67ed59e1d1-3ab3a2fe583mr3989437a91.9.1791631575680;
        Sat, 10 Oct 2026 04:26:15 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([139.177.225.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3690474esm7900233a91.0.2026.10.10.04.26.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 04:26:15 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Dave Hansen <dave.hansen@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alistair Popple <apopple@nvidia.com>,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 3/4] riscv/mm: fix missing destructor for hotplug PUD tables
Date: Sat, 10 Oct 2026 19:24:56 +0800
Message-ID: <20261010112457.49485-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261010112457.49485-1-songmuchun@bytedance.com>
References: <20261010112457.49485-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_042616_685691_30835FB0 
X-CRM114-Status: GOOD (  11.91  )
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

Free PUD tables through the common free_pgtable_page() helper so that
constructor-backed tables run the matching destructor before being
freed.

Fixes: 8472cc4503eb ("riscv: mm: call PUD/P4D ctor in special kernel pgtable alloc")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
v2:
- Collect Acked-by from David Hildenbrand
---
 arch/riscv/mm/init.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 151eb197cb09..4914864cb350 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1538,10 +1538,7 @@ static void __meminit free_pud_table(pud_t *pud_start, p4d_t *p4d)
 			return;
 	}
 
-	if (PageReserved(page))
-		free_reserved_page(page);
-	else
-		__free_pages(page, 0);
+	free_pgtable_page(page);
 	p4d_clear(p4d);
 }
 
-- 
2.54.0


