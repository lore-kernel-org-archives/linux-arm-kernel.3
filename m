Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C788CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 May 2026 11:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZrLinQWyFKg2m6ErNGuwXnFHhW5qOEbX3IE7Ywix0YI=; b=AxpbrhocclekisBRhf2/mkVPpp
	ThhUb/orcl0xGsp1MIiJ3cJIJp/r58IFufL9u8gtq7wkwx82WsKNpqvGtZ6A3AKNiRWNcO3TMArXD
	OI4lj52CgipdGlJj86vdlOKrxrZnbHmeLICy53tPAOow9UQLaHa34mLPH25Dxx2/y/G6Q40v8EDPs
	Cf2+bxPu64AYSJjIhW2l5VFDbSF5bUP97tySf211i7Qq0ActSoinWP3iITkePr2+2iDac7t4qgCuT
	hVf3ytqvOdUexnEBNrRR3LU+GsjmDnh0WiohD3In1rMWpWGSD/CoVd2cfOfXxWthc8am6N7MpGRLm
	iO7p7uiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlwY-00000006er4-1kdE;
	Fri, 01 May 2026 11:22:02 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIlwW-00000006en5-1N1J
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 May 2026 11:22:01 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b9bfd3b1c92so185451266b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 May 2026 04:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777634518; x=1778239318; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrLinQWyFKg2m6ErNGuwXnFHhW5qOEbX3IE7Ywix0YI=;
        b=Gomimt2MeWV10my1QfcHUl8D+nUHuZM//q3KVBn6iGAhbMOxUzhjIG3KD9xe9EYj0H
         9Dnp+7oUAN6x/r6uM4S0hZaIPcfMclEx/lqOReliT6CAnkaiUa8GZDhuThIHEdDFyRmJ
         qEBYqsRd8hj9O8Wol0CH147MuVbuH8yfzY6xKSITfC1h5rGeC3tSTIl6vsfTQNZw0uZH
         vlfws+n1X0PtDgfgPcVB3NG2gJFgiWt1FfU2UPMKHAvDP8N6cRm7Goy8AVaMXhb2XIAM
         DvGZmKl2Fnlcvcz9ciuHdAvU5EE0R91NaShd9cbfk13K/GMsxA+vVXPHA7z73KI/A5rH
         1O4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777634518; x=1778239318;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrLinQWyFKg2m6ErNGuwXnFHhW5qOEbX3IE7Ywix0YI=;
        b=CVEMbAUKseOtJHpCKOd15WFeG4JuJel3WxCT1oTc88XSET1jJp119SXjox4I+Ibs70
         Mfs/eIX92zHZ/E6LihP+K0GjijU81LLdmPp6pl5Fc6Bqy5S3S8vXZ53pO8nLUEORFXPx
         AOqaiuAYiZet8N2LLzVxql8QZo3/jQt7J+DXNDkGyFrJ3LiyfWwT+aNzM2gVplBLVQ4w
         lVLrCV7nK6CbYNnUFM3c4AxGYyfR6ADuO5DQHc9NGooW//L1fsDShh8rI0p1+bWU8Myl
         zePu+aBI1a7SYbleUQmVPdEoNucLqLVY03+PX+JvUu9O76T6kCdGhi+XRhkWAPHKfCcx
         U/9w==
X-Forwarded-Encrypted: i=1; AFNElJ9Fdp1jUqViiHd+encEqE3JT4WQPwtn3I+Rv+DbXjJETEE4zvsvVA9gjhNMmEzWJqSZtnYGx5ZuwQpW2rU0tIZ7@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2IHXiFKMPAgAL3avFEEGdiabq0aWecub9YBWVfvxos845WLLO
	cdnYDpbhCEnAid/ezw3loMJMih4NCg1nn2J9Y/Umnavx4yUr0jIEs0QQxo6yjt9JLKtwYi5F/Je
	J1w==
X-Received: from ejcdn19.prod.google.com ([2002:a17:907:94d3:b0:b9c:aee9:a002])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:f588:b0:b9c:b069:8ab6
 with SMTP id a640c23a62f3a-bbac47d4717mr450739666b.7.1777634517844; Fri, 01
 May 2026 04:21:57 -0700 (PDT)
Date: Fri,  1 May 2026 12:21:49 +0100
In-Reply-To: <20260501112149.2824881-1-tabba@google.com>
Mime-Version: 1.0
References: <20260501112149.2824881-1-tabba@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260501112149.2824881-7-tabba@google.com>
Subject: [PATCH v2 6/6] KVM: arm64: Pre-check vcpu memcache for host->guest donate
From: Fuad Tabba <tabba@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: james.morse@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	qperret@google.com, vdonnefort@google.com, tabba@google.com, 
	catalin.marinas@arm.com, will@kernel.org, yaoyuan@linux.alibaba.com, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260501_042200_373235_0ACC84BD 
X-CRM114-Status: GOOD (  12.64  )
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

__pkvm_host_donate_guest() flips the host stage-2 PTE for the
donated page to a non-valid annotation via
host_stage2_set_owner_metadata_locked() and then calls
kvm_pgtable_stage2_map() to install the matching guest stage-2
mapping. The map's return value is wrapped in WARN_ON() and
otherwise discarded, asserting that the call cannot fail.

WARN_ON() at nVHE EL2 panics, so this assertion is only correct
if the call genuinely cannot fail. kvm_pgtable_stage2_map() can
fail with -ENOMEM even at PAGE_SIZE granularity: the donate path
verifies PKVM_NOPAGE for the guest IPA before the map, so the
walker must allocate fresh page-table pages from the vcpu
memcache, and the host controls the vcpu memcache via the topup
interface. An under-provisioned donation request would otherwise
turn a recoverable -ENOMEM into a fatal hyp panic.

Bound the worst-case walker allocation alongside the existing
__host_check_page_state_range() / __guest_check_page_state_range()
pre-checks, using the helper introduced for host->guest share. If
the vcpu memcache holds fewer pages than kvm_mmu_cache_min_pages(),
return -ENOMEM before any state mutation.

Fixes: 1e579adca177 ("KVM: arm64: Introduce __pkvm_host_donate_guest()")
Assisted-by: Gemini:gemini-3.1-pro review-prompts
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index e428304f94f2..c7f7149c4796 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -1404,6 +1404,10 @@ int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu)
 	if (ret)
 		goto unlock;
 
+	ret = __guest_check_pgtable_memcache(vcpu);
+	if (ret)
+		goto unlock;
+
 	meta = host_stage2_encode_gfn_meta(vm, gfn);
 	WARN_ON(host_stage2_set_owner_metadata_locked(phys, PAGE_SIZE,
 						      PKVM_ID_GUEST, meta));
-- 
2.54.0.545.g6539524ca2-goog


