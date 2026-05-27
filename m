Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A64CD6E41
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 15:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kwo4Qh0di/1vFA0Eu7i+PSEhw4tHDX1V0gCvzn+6kjI=; b=ykQOTI2am21wU2peTNkzHPQYse
	Ezdk1Ys64hX6G5e6pGoobSi7WuQ84bNHh/ssnFBF8BjmVnTqaKQ9FaTYaNBdKEEpWxQtyDkjSHtSi
	cSsqZ9KEe17NVruFw5Fj8h/zMRo3dPy9X/7UGGnA68ft3re8hVvt8pvjWbQl4kzxr/xm/aFNhTklj
	jEDixL6Di8Wdzd2SnADB0dyZvBMhANxdL0HsMMrdwCQZXk67gMri7qfd0nCOxUKqG8GWre8R7vTgO
	SNvgyc4UAFWBM2v7/plzEzoUxL4NUmQHlXmySXSxBiQHrw38znDnqyMv7Tv4ElMtHi1rzb3FIxG+6
	r+CbFUgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFmm-00000004MOe-1kT1;
	Wed, 27 May 2026 15:03:08 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSFmU-00000004MBC-2yXT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 15:02:51 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-6872faa5ec6so6968486a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 08:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779894168; x=1780498968; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kwo4Qh0di/1vFA0Eu7i+PSEhw4tHDX1V0gCvzn+6kjI=;
        b=SUG0UqOS2ALrbFa12nmGjH9z73ncyTR/rex07F8dvZ/YG98iwfvlh0Y+xOCHiMfr/g
         QgzoPknp+A2gnf0e71ZhFHzuPOg0WcdrrRU3+JF90LYPdIb++aM3gXfpk237dLZ6ciVk
         SmSYc4nZXgpe/nm6WM/nES9jXZM6Sg1D6oUR3B3ScoOAl2Kxu7/vH1i7R0zh8TNl7wJr
         cwNqdP0kbvX/S4EZGGAHtzZWbA14Kr4uF9jlEbRj0/gVhdxSdHhVZLlrv7sDDX8e52tv
         voTvL4wXxyPmTdr2WdAjajDwTQ1L1gplB16pe3HennzGUzpabcLox6KyWEf9zimzrz39
         VxaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779894168; x=1780498968;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kwo4Qh0di/1vFA0Eu7i+PSEhw4tHDX1V0gCvzn+6kjI=;
        b=UrCrKd074sChoTqToTEBo3Uac629bN4DTcUaT26tPr2+XisDXLMuDGLIMNzh1gfb69
         Lmajad/5ASms1AzBdnObpKoL5zRZYOFXPg0HQU2R1+Zu4C5kXJAk8DuZiSpOXRRriZuX
         bXryquQsyrfGvryumUXwJFW8lT7fkGMLLfu4HFGVme3LkykeBg/LqWRjVdtJpHhGnG3r
         Njl3jLkhV6tdKyPz8EDMDZKGAh2ZHd3NRYGnkF7uldJ2V5j2Q2tvmynb1fF+RUGQhtEy
         9cmKloG81anPK/EhCDw3QKc23gQpiNXERlPsbHSMAq12W79y7Uu3oUIy4yKvlNRso+oB
         I4xg==
X-Forwarded-Encrypted: i=1; AFNElJ+Od7TGcv++GBelcXWatovK73lOSmq3LBVSMbrBRURTyAzdKaUwaE4HCA2q7sCZcz954OCTU2SZm61P/5r2YgCo@lists.infradead.org
X-Gm-Message-State: AOJu0Ywdkg38xnj10BOeV664WMFkzgnfVDMTRrXf1PRR+b7UrYcosTmm
	ovQZ1joEKr3rRV66dnVAHFsGiHUiDf5xjlnGzprNJGlniNrsnCxOaIsgpXRM49a2SQf6Ax4GuPD
	Bj4bw5zOOAdBh/w==
X-Received: from edyd3.prod.google.com ([2002:a05:6402:783:b0:688:c574:279d])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:a51b:20b0:689:6c2e:6cce with SMTP id 4fb4d7f45d1cf-6896c2e6e11mr5575010a12.2.1779894167979;
 Wed, 27 May 2026 08:02:47 -0700 (PDT)
Date: Wed, 27 May 2026 15:02:36 +0000
In-Reply-To: <20260527150236.1978655-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260527150236.1978655-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260527150236.1978655-7-smostafa@google.com>
Subject: [PATCH v6 6/6] KVM: arm64: Ensure FFA ranges are page aligned
From: Mostafa Saleh <smostafa@google.com>
To: op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, catalin.marinas@arm.com, jens.wiklander@linaro.org, 
	sumit.garg@kernel.org, sebastianene@google.com, vdonnefort@google.com, 
	sudeep.holla@kernel.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_080250_755356_3A04E6E6 
X-CRM114-Status: GOOD (  13.94  )
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

At the moment we only check that the size of the range is page
aligned, and truncate the address to the page boundary.
This make an assumption that TZ will do the same.

However, it might decide to use the extra offset of the neighbour
page at the end, which is valid under FFA if NS is using larger
page size.

Harden this check by also checking that the base address is aligned
and reject it otherwise.

Fixes: 436090001776 ("KVM: arm64: Handle FFA_MEM_SHARE calls from the host")
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index a12e01883314..daf0e328c847 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -352,7 +352,7 @@ static u32 __ffa_host_share_ranges(struct ffa_mem_region_addr_range *ranges,
 		u64 sz = (u64)range->pg_cnt * FFA_PAGE_SIZE;
 		u64 pfn = hyp_phys_to_pfn(range->address);
 
-		if (!PAGE_ALIGNED(sz))
+		if (!PAGE_ALIGNED(sz | range->address))
 			break;
 
 		if (__pkvm_host_share_ffa(pfn, sz / PAGE_SIZE))
@@ -372,7 +372,7 @@ static u32 __ffa_host_unshare_ranges(struct ffa_mem_region_addr_range *ranges,
 		u64 sz = (u64)range->pg_cnt * FFA_PAGE_SIZE;
 		u64 pfn = hyp_phys_to_pfn(range->address);
 
-		if (!PAGE_ALIGNED(sz))
+		if (!PAGE_ALIGNED(sz | range->address))
 			break;
 
 		if (__pkvm_host_unshare_ffa(pfn, sz / PAGE_SIZE))
-- 
2.54.0.746.g67dd491aae-goog


