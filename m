Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189C9C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 13:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k3SNv/hlO2h0xkklONRKfGgBfOPQjFyFw6MzNkTps1c=; b=KNU4i5SxFjSXh0tzO5BBE2SuEw
	W4UWk95DyW6OIFaznuUqXPbHQ2GVGuy6iZvKQfIf3qA7V9JyA7OwOZkbJtfRyAWKCNqSHJbb21bzy
	E51VdCUxYJJK/lQ73Aj7PRoG5nkR//4q4NQnmReCngMkFRJqGEQa0QyuZcs3NIGdRfFpugv+Volq2
	cypUbFLx2P7svMFj86NDGwBbGY91GT2kaujtvjxZscDednN0IjM5lY71iiodMDmqZonM0eG/kN0S7
	oRCp29PjTZ4Sm3v50bxfs85q1//zI6YuffGsgLxza6Ox6ej8utnk2k/EKAG6BlrSZPoykGWskVEL7
	kD5Q8C4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YUb-0000000EUBy-3HKu;
	Fri, 18 Sep 2026 13:19:05 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7YUY-0000000EUAY-3S48
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 13:19:04 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-4957287363bso7023515e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 18 Sep 2026 06:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789737540; x=1790342340; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k3SNv/hlO2h0xkklONRKfGgBfOPQjFyFw6MzNkTps1c=;
        b=JQdNZxO06C4rchUAkaQpzzKcp+XraYaluQ0pHqV1jmrRJ54ywJtuN3ZUn5QtIV10mh
         YvmVr0oozUIKqlymoXaPOPGMwKVAtfERfFZ5qKXFcej+A7poOnPeDnfjjz4RprUoHu/2
         3wCiomaMlzJ2PdvcnxzAxxnarzNet4/fTkeP6lSHw2aw1RuKLT05CwR0Js4JHtLTuxVG
         Avwmv9PDqJR6GhzfA9NqG7qetnxvh2qmSqcsljYwOBT0qBSV9E39USFNgLLrnhqZFKbN
         TYy5MEUayu77uGxPB3TCUtgjjce4OagBDPjS2SuKwoq811I1N5VM1PVzaIOhvJOrUy5c
         x8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737540; x=1790342340;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k3SNv/hlO2h0xkklONRKfGgBfOPQjFyFw6MzNkTps1c=;
        b=iM+413HXo28I4LvUPi1zYr5QIQhuwyfIxZjNOzin9OZu2Z0DKctYLj11fkePlUy1Rz
         s3zk/+Uzs5ceno/Km7UVS/2JvH6Ma9+kPisIv4T8qMTKQopV9BkQ6fECbmwBWAScrGlM
         f9HcUlVOLumj+xzHPCIhlaacGGcTI9GvAQpHQaYozKGc7QNkSrlqApA2874mQpT9+1D5
         F6tMjZuiKYzzOwFC3L6ZCRyOoflYSmbwwFtYdSQDaL3htFLdkwsA4wWUgS7KvFzOD6mT
         1yd6O56vaUoSjZrnzAHsQTL/euAUdf+KXyRx2ALdvQm/2HB0V/GTTU2XDKc8iAAh/Sc/
         pSAA==
X-Forwarded-Encrypted: i=1; AKwUvBzctAHFsSpgsudD0K6rxRiL6MMuIrKF3QkZ3XlPsCD+B2k+rIP3RlYI2s3GSWGh7XMWCuTWpLtG/LjpG9ezQ7BU@lists.infradead.org
X-Gm-Message-State: AFuF++nHIx5Ybb5uPuSiHFkBCrP/XUfSU4pjzR+3u8YQcf1Djzz3qhef
	smxw9fie/BxxJfZjK5R9awEBOkU54+w+HVEqeoDM6ZmYZXVYWdW74K8yHOeccyqW8gDGE4xR/7L
	dHWddyREQk2YyWh8L6t5ptA==
X-Received: from wmrk15.prod.google.com ([2002:a05:600c:b4f:b0:49c:e349:ff6f])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f09:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-49fc56692c6mr32982165e9.2.1789737540280;
 Fri, 18 Sep 2026 06:19:00 -0700 (PDT)
Date: Fri, 18 Sep 2026 14:16:52 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260918131656.3710047-1-vdonnefort@google.com>
Subject: [PATCH v1 0/4] arm64: mm: Allow set_direct_map functions on BBML3 systems
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org
Cc: mark.rutland@arm.com, lenb@kernel.org, pavel@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, thierry.reding@kernel.org, rppt@kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_061902_867698_6FFCF80F 
X-CRM114-Status: GOOD (  10.08  )
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

This series is a fork of [1] which creates a new CMA pool for FF-A lent
memory which unmaps that memory from the linear map as a mitigation of
CPU speculative access to Secure memory. [1] creates a PTE-level region
to enable setting the direct map, but BBML3 systems shouldn't need it.

Currently, can_set_direct_map() only returns true if a feature forces the
linear map to be mapped at PTE granularity. This prevents systems
supporting BBML3 from enabling set_direct_map*() functions yet safe.

To enable them, this series:

 1. Use the fixmap for hibernation. This removes the need for handling
    atomic context in split_kernel_leaf_mapping().

 2. Breaks the dependency between linear_map_requires_bbml3 and
    can_set_direct_map()

 3. Allow split_kernel_leaf_mapping() even when no feature requires to
    set the direct map.

[1] https://lore.kernel.org/all/20260902104712.2399797-1-vdonnefort@google.com/

Vincent Donnefort (4):
  PM: hibernate: Add arch specific hooks for hibernate_map/unmap_page
  arm64: hibernate: Use fixmap for hibernate_map/unmap_page
  arm64: mm: Introduce linear_map_needs_set() helper
  arm64: mm: Allow can_set_direct_map() on BBML3 systems

 arch/arm64/include/asm/fixmap.h |  3 +++
 arch/arm64/include/asm/mmu.h    |  1 +
 arch/arm64/kernel/hibernate.c   | 12 +++++++++
 arch/arm64/mm/mmu.c             | 46 +++++++++++++++++++++++++--------
 arch/arm64/mm/pageattr.c        | 12 +--------
 include/linux/suspend.h         |  2 ++
 kernel/power/snapshot.c         | 10 ++++---
 7 files changed, 60 insertions(+), 26 deletions(-)


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.55.0.1082.g2b9226bbc0-goog


