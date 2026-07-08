Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB754C43602
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 03:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CZhq9cReoiqut1+GTjIpQFS6vd7poDNcxevd58JbT5Y=; b=rOfNK3JLuWcFE8hxRXNttiDDik
	yUgVDgP6a6kOI9+VPq+uCV+R7NvBmlBNg60ntptKz9eRPrHT30pJcjGAVzsBVGLZ+Tm1TqiXeybJP
	l4zwDPmr7/hHRsr7KgM6M0K0LmD8DE5Cudu1OqV6Hvq24rh56AAIjzGRtcvqvwFAAHny42uFz1hlr
	gfT/HsknJLrlQO1tg84G3ZMCmBu3YQLBl3rIORXPD8Gyz+LfTgv1GMiLs947+8at5p0xDqrFdm7q0
	pP+du+u0Vc4vtNHQ6yWpyDTJULyIRdd09LE3gHpzcvqahDQQnrt0CqvwON/+zFcz4y24hEjlSr72b
	w9BavlSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhn-0000000GCnk-44B6;
	Wed, 08 Jul 2026 03:12:11 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whIhP-0000000GCCC-0EpA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 03:11:48 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-845e3ede1f9so302183b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jul 2026 20:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783480305; x=1784085105; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZhq9cReoiqut1+GTjIpQFS6vd7poDNcxevd58JbT5Y=;
        b=FnuW229W1DDHgP5SdXBy07HveFqrFUU2zuUJdZGManun1NGvN7dKWpJdJ50i+uOB/P
         cegaSs0BYgBv51EJhdtqKH+VAqTilmvDR9IrVPRCl+LO8YtzlFR1LTGyYoSJTg+5/56o
         hkJ3ztH5hs/GvxzIAmrTEfHCCfoqry0ZvDzZMZixX3RwQjlmufaqzFOeQoVpJDBw4ql7
         16G119GHeRsIip4inhze9umqUvUyQATMcA/S7OwKPPYn233WBvhBW0NL4ffMSsnjMohE
         4skxPaB2wB0CpdBlJGxPJFh+gKsF9ZjMgi8VRmrOEn3lkWsBLU9C5IHm+rviXc6tKSx7
         buAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783480305; x=1784085105;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZhq9cReoiqut1+GTjIpQFS6vd7poDNcxevd58JbT5Y=;
        b=dRNmuBXjpC81qDxKwOMSLRewLdVd8LRs0SVUGQvSdOHNiGiEU7brl1Or9lxih9fl4H
         gcFStQ5h3mp99EHcvxD2rHYCAK2/buEi8M3vPILezBtHpfng7G8OURmszr1wJsIu+Xls
         lX+kUHRQwsccId5dLgDxISJCwdrnLOsCb4B1ZfQH15mD+t/5e6BlmnirXve6buZRHyB7
         imHbYmpWJK3LKVb+xvBs1geAN2/oqxrsWhTUJkWum0DOC7QDJ87k2agxuYLA1Bz27YBU
         43V3vEHyE5XtsX470K8fWbX/38ATNEclA7EHun+TpqIBbzLScxrG4tIdfzBisbfnCfF4
         /New==
X-Forwarded-Encrypted: i=1; AHgh+RqPCONklZVcoVrLkm1am7yLZvEp9OzYBCJ1Fn2gA0yw8hy/TDlqTVkJkFf8k0BgzZlfTommoq6MjxNaGixjQUg+@lists.infradead.org
X-Gm-Message-State: AOJu0YwIZEVQMON2pLCx3SRoMf/ICfORWMycqvy2z2IOd+aXs0YNVFB2
	o7Np6XW6YgCupCsh+FhKDgV1gMtBUYWKJlOhu3G9+W/nMsLOjj29pMg5YxuDyz0pGm2I640sE1g
	9FzHEov7a944ACXA5f+JgJw==
X-Received: from pfes17.prod.google.com ([2002:aa7:8d51:0:b0:848:4733:fed1])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:39a8:b0:845:d285:3b6e with SMTP id d2e1a72fcca58-84842fce41amr674441b3a.58.1783480304616;
 Tue, 07 Jul 2026 20:11:44 -0700 (PDT)
Date: Wed,  8 Jul 2026 03:11:23 +0000
In-Reply-To: <20260708031129.3503195-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20260708031129.3503195-1-jthoughton@google.com>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
Message-ID: <20260708031129.3503195-14-jthoughton@google.com>
Subject: [PATCH 13/18] arm64: Drop BBML2_NOABORT requirement for HVO
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
X-CRM114-CacheID: sfid-20260707_201147_172680_742F0840 
X-CRM114-Status: GOOD (  12.91  )
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

With PMD updates being done with the Access Flag trick, BBML2_NOABORT is
no longer needed.

Dropping this requirement vastly widens the pool of systems this
optimization is valid for.

Intentionally leave HVO as opt-in, as enabling HVO still introduces the
following regression: if all boot CPUs support HW AF, then any
late-onlined CPUs that do not will not be onlined.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/kernel/cpufeature.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 3b9224b99a5f..c13433316e80 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2175,11 +2175,10 @@ static bool has_bbml2_noabort(const struct arm64_cpu_capabilities *caps, int sco
 static bool hvo_compatible(const struct arm64_cpu_capabilities *caps, int scope)
 {
 	/*
-	 * We need BBML2 to support Block -> Table transitions without taking
-	 * faults, and we need HW AF support to support changing the OA without
-	 * taking faults.
+	 * We need HW AF support to support changing vmemmap mapping level and
+	 * OA without taking faults.
 	 */
-	return cpu_supports_bbml2_noabort() && supports_hw_af(scope);
+	return supports_hw_af(scope);
 }
 
 static void cpu_enable_pan(const struct arm64_cpu_capabilities *__unused)
-- 
2.55.0.795.g602f6c329a-goog


