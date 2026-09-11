Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FCDC88E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyZHHI9O+Y8MPWjOIqoFkiQzmwGCk/ETPmyIccR863I=; b=LYbUozxemfUINruFOqRkeTlIBD
	W5MxcGCWtRMqsslWJV4DlZvHlqwJGum2rGwP7tNjDJo8jYKI2nFFUM8ttl6Dlirgdim8eJrffRQjp
	xWkVZDSZd1VFWHwSei6ljtbhJioM5iB388DzpJoQrQa+CUpPTqEqnXjFRHtXm+bH5NpQCGw5C9RlI
	el+JONSenN/P4Jpwx965U8/snRpAyGimME+54wrfwJv1AlAG2sALdw3GGk9pkDZ0Orbtgtg5QTWvh
	YWUKL0oE8HCOfM8KxLtzBQWRy8v/HITHewAcCGpsBwVTkJ0O78PunI2B89OWurivj3MWjHgs+f2TW
	uqMwNZtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51et-0000000Gnrr-03ux;
	Fri, 11 Sep 2026 13:51:15 +0000
Received: from mail-wm1-x346.google.com ([2a00:1450:4864:20::346])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51em-0000000GnmF-2lTZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:51:09 +0000
Received: by mail-wm1-x346.google.com with SMTP id 5b1f17b1804b1-49cc954a3edso6882425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 06:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789134665; x=1789739465; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vyZHHI9O+Y8MPWjOIqoFkiQzmwGCk/ETPmyIccR863I=;
        b=JuKZ5tT3QLyjog8TnKoDJ+SD9hou3XnbfgWxIEv8AzQfrOPLpPhJ27/dqoMpOb5/GW
         q8jWLO7gTwsNnORpahF659ssANJ5R+Kn5zQeEdlRxOnuA8d4BcMO9yUScVDPjQJEy8X+
         NrU1MqdQOaskOqqHuonWOldaK5hKk7JEaBjMzlM0/6pUiQ30TuCQO15ArGfZTw6cz91c
         kXtJqt+crP0t9zkD8rHF8/e5HMN/SNrjvils1DAV/Ioqn+6ufTa+A8r74qX3Pi1pffdP
         /UhyGlT+p+J3qgIJJGLCz1HRAMxrkHmmr7xkRovLx6JMZvQrVIl71wTv4sop+3nbLdWa
         ZhpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134665; x=1789739465;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vyZHHI9O+Y8MPWjOIqoFkiQzmwGCk/ETPmyIccR863I=;
        b=kW6alH2f0fqF57ApPvW9omm/cTxeZzDTrGeuwi5HZ4UCFJXdj3HjH5Wdfj8Y01jPCQ
         s3xk+vTLcIPBdsO2C8bpSfaHVS232U2hy2LUAWN+B/kyVsn/utN4He7OAuYjDrZgbmuY
         rE9lKh/AahZFsqme6uSt78fYuDhSjnUJCnaz9Raek2JgDXNJ7CO9xDygReFEyMNvg+LE
         NmtiO1OaUmMMFmaWvtSUJDi5GK2v6Nvt15W3eL6UHcmw75sMs+oH31cA0XCnRr6LzV23
         JvSrA5FpTgS0lRlyNIWplhhqFsvTY1TsXyANnE1dAOgVeMvGlbMJifTSO8TCbtGogKG2
         7hvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzOFi+eEWg1uUhUgWFOWADRDWNqItoET5EUpDF0S8yEd7JO6rEXycwum8IHXOXaD9L+LgaGZwlrdNTSwf28kgef@lists.infradead.org
X-Gm-Message-State: AFuF++luhihxEhTIBXHzKTLivSiDVsTdiqtqpbtdHqud7X3fZ3WUkl+J
	3UQ2VJs9C2gov2j2gF8oQ12BWgpqg+c0HoxXjyqUzrbbuADcIBLhIJ3Hvz5YjV7d8L4fVPYbA9x
	AoCc8TI4UC38/MvOM5bYphw==
X-Received: from wmhn1.prod.google.com ([2002:a05:600c:3041:b0:49c:da85:4930])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c490:b0:49c:ffde:45ff with SMTP id 5b1f17b1804b1-49e619c18e0mr50622335e9.17.1789134664664;
 Fri, 11 Sep 2026 06:51:04 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:50:34 +0100
In-Reply-To: <20260911135053.146435-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260911135053.146435-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.1007.g17ff1f9808-goog
Message-ID: <20260911135053.146435-4-vdonnefort@google.com>
Subject: [PATCH v2 03/22] KVM: arm64: Allow block-level stage-2 annotation
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	weilin.chang@arm.com, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_065108_709137_4FB4EC7D 
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

On host to guest donation, pKVM annotates the host stage-2 invalid
entries with the GFN. Now that the host stage-2 preserves annotations on
block split, we can allow these annotations at block-level. This enables
safe support for guest stage-2 huge mappings.

Allowing block-level annotations also reduces stage-2 fragmentation when
unmapping a huge region, and reduces host stage-2 memory usage by
avoiding the allocation of intermediate page tables.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 0ca157ecee64..c4ebae0544d4 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -947,9 +947,6 @@ static bool stage2_leaf_mapping_allowed(const struct kvm_pgtable_visit_ctx *ctx,
 	if (data->force_pte && ctx->level < KVM_PGTABLE_LAST_LEVEL)
 		return false;
 
-	if (data->annotation)
-		return true;
-
 	return kvm_block_mapping_supported(ctx, phys);
 }
 
@@ -1178,7 +1175,6 @@ int kvm_pgtable_stage2_annotate(struct kvm_pgtable *pgt, u64 addr, u64 size,
 	struct stage2_map_data map_data = {
 		.mmu		= pgt->mmu,
 		.memcache	= mc,
-		.force_pte	= true,
 		.annotation	= true,
 		.pte_annot	= pte_annot |
 				  FIELD_PREP(KVM_INVALID_PTE_TYPE_MASK, type),
-- 
2.55.0.1007.g17ff1f9808-goog


