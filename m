Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8839DC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 03:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3qWnf+WjIw/N9fJ5EFWCJtG7j5Nn0VVg7E9Z8ZhI7s=; b=BK+XmjlgAaxSmR7+GCcFRaM21k
	cU30WH8SLPpW7frtHciNy6UslaSstL7OKFJxL0lzXTsYojEEIHgH8Ru/QcIG9Sx6T7cVbbjsPSuaJ
	KCz827JiCDAZbw8G5qbK7dxvnpeAtnCSWe5vNoB1NzTV5oUixKDZ6+yNz95VOKCbX3fifjNTwM3cU
	hCJ8M2ElqZ6soS0dCsxQGJ25WSkPBSPmrlNbEY///yyt1DBnlPli9p2PSeOAPSNxUh34LLKLFaKKw
	kNFUP9+SXzlUEShUbI0ulRwJmW2OxCIrPCOmvD+C865ghZ5R69sQ/GN2RRUIphqvY5fnNkmO5Sz6F
	U0PBsKKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhq-0000000GCrt-25i1;
	Wed, 08 Jul 2026 03:12:14 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhR-0000000GCFj-3G6R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 03:11:51 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2c6bbd0afffso5415255ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 20:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783480308; x=1784085108; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i3qWnf+WjIw/N9fJ5EFWCJtG7j5Nn0VVg7E9Z8ZhI7s=;
        b=hj8jkp6fp98QsEyPl/RtKIQ7JnDCAiU3TMnKDkCIbhyVBAfGR/tGMFf9a0J7U5xi02
         sZ0Hqf6FenZUp+iq55dqbeQqknhKFiO8CGipEcRChetVTarafyqMuL22W3G/CmkKyF6G
         uwBAjR8h5LWKnLvOde2z/IbGEa4Gtq+k+rBDPgKZ/wSWVwVFkpxufEZE1bdHMvXJ4qOW
         aFc0ORFB3wUNRAEKnqGx0JCRsxDmdL+99ghNjWOVrPIPzMXluoJ/wI1LpWYK1WROmeRI
         t6vomU0ILFCq9e71zga40NFZ+oLYx1PNNolH7CinBGTSj1qvNMSdMxzMiwDZA7PW543j
         dQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783480308; x=1784085108;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i3qWnf+WjIw/N9fJ5EFWCJtG7j5Nn0VVg7E9Z8ZhI7s=;
        b=fcAmsBTDZ5TTJpBKy0VAFLv8TPn6TR4tsCXdgzbaBfBArdc7t/rnjYgyFaT3wWvUPC
         k904RbC1Dxrwi/At/FnDtZytOvw4GWuK8zsXQr/4tpirUIt6j00+3qKYUqjgU+hiUACS
         yYIZwa3pfj4Nj/lS2yUCWiUsxor/eSJjwABRel26LQaH660+XueXCF9sURy99XAm18Up
         Wf0e8NzyIejQztHAZuMUmxsOKENeURnhwr6q3kSoPsG7FS6B4VojHSRE6k2NTySUOiXC
         Y6WiMXMAbjYpKeFQIwhK1Z1VKhMOgymEW7i3EvIIaUXyO6xfz4ZGUkKAFtK/Mkq42IZR
         49aA==
X-Forwarded-Encrypted: i=1; AHgh+RoWpMpbJa9oHUkewJ6G8DKwW8gD8yXBKQL7ara8tgJrUa/qbe9wEyl+JXjOeAlofTLsA9gw6XfLkx8LpIMiUA4d@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/4DLajGrHae0IhHIjW2V9wUimXlBnkDisTEpmD3g1f1hpWGbT
	st86ZhVZcHV9ahGNFxzeaESlXjMSVdTUQLNcRGZeo5kQ2hRCJ7vtSsn0x4zWjlm8Y/v50/vx3QU
	v+6oUNhhw22gYqmeuC4ysYw==
X-Received: from plhy17.prod.google.com ([2002:a17:902:d651:b0:2cc:c554:a93e])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ce0b:b0:2ca:d7a3:371f with SMTP id d9443c01a7336-2ccea45e5e5mr6630235ad.22.1783480307457;
 Tue, 07 Jul 2026 20:11:47 -0700 (PDT)
Date: Wed,  8 Jul 2026 03:11:26 +0000
In-Reply-To: <20260708031129.3503195-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708031129.3503195-17-jthoughton@google.com>
Subject: [PATCH 16/18] arm64: Allow "optional" CPU features to be required sometimes
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
X-CRM114-CacheID: sfid-20260707_201149_855648_FCF1EC4F 
X-CRM114-Status: GOOD (  16.70  )
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

The HugeTLB vmemmap optimization feature should be optional if HVO is
not in fact in use. Otherwise, on systems where the boot CPUs support
HVO (HW AF) but the late CPUs do not, simply compiling with HVO support
will prevent late-onlining.

It is desirable to always compile in support for HVO without regressing
late-onlining of CPUs on systems where HVO is not in use at run-time.

If HVO is in fact in use at late-online time, HVO must have a way to
prevent such incompatible CPUs from being onlined.

Add the late_cpu_enable() callback to provide this "sometimes required"
functionality.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/include/asm/cpufeature.h | 8 ++++++++
 arch/arm64/kernel/cpufeature.c      | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index a62c284962cf..d1504804f2be 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -367,6 +367,14 @@ struct arm64_cpu_capabilities {
 	 * routine must check it before taking any action.
 	 */
 	void (*cpu_enable)(const struct arm64_cpu_capabilities *cap);
+	/*
+	 * In rare cases, capabilities are *sometimes* optional for late CPUs.
+	 * This callback allows a capability to prevent onlining of
+	 * incompatible CPUs when the capability is in fact required.
+	 *
+	 * Returns true iff onlining the CPU is permitted.
+	 */
+	bool (*late_cpu_enable)(const struct arm64_cpu_capabilities *cap);
 	union {
 		struct {	/* To be used for erratum handling only */
 			struct midr_range midr_range;
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index c13433316e80..7e2c134f3b55 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -3684,6 +3684,14 @@ static void verify_local_cpu_caps(u16 scope_mask)
 			 */
 			if (!cpu_has_cap && !cpucap_late_cpu_optional(caps))
 				break;
+
+			/*
+			 * Some optional features may in fact be required due
+			 * to particular runtime conditions.
+			 */
+			if (caps->late_cpu_enable && !caps->late_cpu_enable(caps))
+				break;
+
 			/*
 			 * We have to issue cpu_enable() irrespective of
 			 * whether the CPU has it or not, as it is enabeld
-- 
2.55.0.795.g602f6c329a-goog


