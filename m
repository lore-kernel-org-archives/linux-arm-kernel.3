Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397C0C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 03:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jYFEot0xG+gqPBMU77C4lYbv1Usc9k6OYGJ/3Ree3IU=; b=bPT8+erURAwJZ1XM8N72FCUbiU
	IaL9gLubUEjQViHfLe4DudUVDYeefdA5GfpUNyz0v6CRnKX9wiQ/CzxDVDQ4eJ2BklFaS+rX2u2oh
	MRCVL73Jgp2LCQnbh+0wFnQVhELDA3DcRPh7SchBdJaXOsOqr9wkbmpH3+7lfuxqa0XJLk0vvbhW4
	RUCXEyq1aPES4jG72yyH1C8D1K/IdLQo1ulh+wLYGCwEbf2FkO8KzIKO7AHEt7OyeT4Ts+aMz0TS/
	ETSu943Y5l0UGeW1wJnlZYH0qKz+vnEGX5Nc5Pf375TWZgQORuFeQ0XhDYxxs24kul0D3oO+Reoxd
	oM6rWyow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhR-0000000GCHh-3SbA;
	Wed, 08 Jul 2026 03:11:49 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhI-0000000GC8q-48TN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 03:11:42 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2cc8bde6318so5478795ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 20:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783480300; x=1784085100; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jYFEot0xG+gqPBMU77C4lYbv1Usc9k6OYGJ/3Ree3IU=;
        b=NTeAyRd2BDUc/LyQzS1dRPn7rPc6OhOWedSGP0ty+1CAmny8zGRjnghJhEor507+dv
         IxDocHJu5YX1gMe5EIExFI9VjXxKrjr2YjGVYuGZvbtY9D/2Q32EallGQBb4sPCYILOV
         /eoAwOLerMLmbEwABhSovJMPiFSTS5t+PdyK0A8X7OoZbgfHQVTHG8oGyPiWXS+envBu
         Bk//wwV8S2R3Ghep+aV2TUoPfWI+JdPemfo7DdHfOg+oEZktJnsf8E7QYbTqEJ7dpBy/
         pAlS5LNTpQPDXESsgF8A72OEYTRVwhg6u5JnxteDSOpx30shbPQ9Qc+gU7U4quUSYVhK
         iXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783480300; x=1784085100;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jYFEot0xG+gqPBMU77C4lYbv1Usc9k6OYGJ/3Ree3IU=;
        b=gTSZS/ahx2TNWtvlvT13YloDMRJIcc1mj4C0pfbyQFMB75ymagfN7wX0s+vNtaJoiW
         IIxF8ZKIbZdMAA6qeH2TxC9ez5oWv919u9lXmk9dFutJEfIbzWa+kzPBwGkMioPZTrF5
         S4aD6rKKzxglvziCQzk0ZTbwEpzqqcS7efjX3vtoI+JitwTBr4U0cd4Aig2YdEcROnvb
         vPv6DTxYoqoHE8KNy2nBKAjOUXmnl39TAZGyLSVlwOWiepbANdenq6L2wo1ZtGSZmZVT
         09j7bK41oAo60zHDBpM0xfxZIrh1o63+OXLnVgv4Z5QWD/jQsr+amf0gAD3O4IAH9BhQ
         H4FA==
X-Forwarded-Encrypted: i=1; AHgh+RrvxE3Fo/ShSNBskkyNBBXo3K5n6Gz8+s6ea4oU6KEAiQ2JZaZpbRCX99xXI/BUTH8VIuD8nflh+Qc9/IKMN/nA@lists.infradead.org
X-Gm-Message-State: AOJu0YwR+6cHLZVjgVamXKsPhw0qkYSnFfMe7tVABG54xN+KXAqpWZ4H
	3v74+1RSHKCWLuhdfC9cB+gkhrEC0+OyUwMQLUEuzAc6xBSxs0Z3LEVPKoDOVy+aCeLJbkFNDws
	KK7uC1n3He8Obgc6ErKLBjg==
X-Received: from plbkq14.prod.google.com ([2002:a17:903:284e:b0:2c7:e8ed:e941])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1b4e:b0:2ca:d658:d874 with SMTP id d9443c01a7336-2ccea45e8camr7594005ad.23.1783480299668;
 Tue, 07 Jul 2026 20:11:39 -0700 (PDT)
Date: Wed,  8 Jul 2026 03:11:17 +0000
In-Reply-To: <20260708031129.3503195-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708031129.3503195-8-jthoughton@google.com>
Subject: [PATCH 07/18] arm64: Add system_supports_hvo
From: James Houghton <jthoughton@google.com>
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>
Cc: Nikos Nikoleris <nikos.nikoleris@arm.com>, Linu Cherian <linu.cherian@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>, 
	Frank van der Linden <fvdl@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_201141_301970_69523059 
X-CRM114-Status: GOOD (  18.23  )
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

Track HVO compatibility as its own system feature. If every boot CPU
supports it, later onlining a CPU that doesn't support it won't be
allowed.

HVO requires BBM Level 2 no abort for the block -> table transitions
when optimizing the vmemmap, and it requires hardware AF management to
avoid taking page faults on the !AF translation that is installed as
part of the RW table -> RO + new OA table transitions.

Another possibility would be to disable HVO if an incompatible CPU were
onlined; I haven't done this.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/include/asm/cpucaps.h    |  2 ++
 arch/arm64/include/asm/cpufeature.h |  5 +++++
 arch/arm64/kernel/cpufeature.c      | 16 ++++++++++++++++
 arch/arm64/tools/cpucaps            |  1 +
 4 files changed, 24 insertions(+)

diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
index 25c61cda901c..6db3ef827f86 100644
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@ -75,6 +75,8 @@ cpucap_is_possible(const unsigned int cap)
 		return IS_ENABLED(CONFIG_HW_PERF_EVENTS);
 	case ARM64_HAS_LSUI:
 		return IS_ENABLED(CONFIG_ARM64_LSUI);
+	case ARM64_HVO_COMPATIBLE:
+		return IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP);
 	}
 
 	return true;
diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index e818ad1b56e2..a62c284962cf 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -885,6 +885,11 @@ static inline bool system_supports_bbml2_noabort(void)
 	return alternative_has_cap_unlikely(ARM64_HAS_BBML2_NOABORT);
 }
 
+static inline bool system_supports_hvo(void)
+{
+	return alternative_has_cap_unlikely(ARM64_HVO_COMPATIBLE);
+}
+
 int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
 bool try_emulate_mrs(struct pt_regs *regs, u32 isn);
 
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9a22df0c5120..3b9224b99a5f 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2172,6 +2172,16 @@ static bool has_bbml2_noabort(const struct arm64_cpu_capabilities *caps, int sco
 	return cpu_supports_bbml2_noabort();
 }
 
+static bool hvo_compatible(const struct arm64_cpu_capabilities *caps, int scope)
+{
+	/*
+	 * We need BBML2 to support Block -> Table transitions without taking
+	 * faults, and we need HW AF support to support changing the OA without
+	 * taking faults.
+	 */
+	return cpu_supports_bbml2_noabort() && supports_hw_af(scope);
+}
+
 static void cpu_enable_pan(const struct arm64_cpu_capabilities *__unused)
 {
 	/*
@@ -3067,6 +3077,12 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
 		.type = ARM64_CPUCAP_EARLY_LOCAL_CPU_FEATURE,
 		.matches = has_bbml2_noabort,
 	},
+	{
+		.desc = "HugeTLB Vmemmap Optimization Support",
+		.capability = ARM64_HVO_COMPATIBLE,
+		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
+		.matches = hvo_compatible,
+	},
 	{
 		.desc = "52-bit Virtual Addressing for KVM (LPA2)",
 		.capability = ARM64_HAS_LPA2,
diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
index 9b85a84f6fd4..630953d59c52 100644
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -70,6 +70,7 @@ HAS_VIRT_HOST_EXTN
 HAS_WFXT
 HAS_XNX
 HAFT
+HVO_COMPATIBLE
 HW_DBM
 KVM_HVHE
 KVM_PROTECTED_MODE
-- 
2.55.0.795.g602f6c329a-goog


