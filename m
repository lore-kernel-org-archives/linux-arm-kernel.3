Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAEBFD3776
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 17:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DSffF/O9t9ktg+4g54ewwNPuwJZR6q/1l+pHWLBR93I=; b=lwhE7penZs8H6mD7YE6EfWqKSK
	GT0eqLl13kJ2RikombEBoW5jEFD83KedmhGDeJc56voFe8FPmUWRSgrKrmYpOUorATc9N9Mq4Hzs9
	QUBnPAIE/Z5iRe2PgNz3qGBdaTU9vfPWdvmvVcSPcjYx3BvmBHeNlHGBOMLhbYM6Q0cHfiedAyLxp
	fle40tJ4yU0Qj2IbLapj5t2JOcDLWc7bTqtJQQ+mU9FX5iK5ia1ACZyzXz5yzUHW25QcDzmNZ/e3v
	oaZqt8ShIC9TkwNmLw15+bV3+rPOBTiUqDXLRk8DRhoJYo5EYVHUAM6J4sySJf7lwjCqgBJ0pYJCI
	7rnrc3rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvInf-00000004fPd-2M87;
	Wed, 25 Feb 2026 17:35:51 +0000
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvInb-00000004fOD-3G4o
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 17:35:49 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772040945;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DSffF/O9t9ktg+4g54ewwNPuwJZR6q/1l+pHWLBR93I=;
	b=oEn1oSkMK4RuJXHdFGMgfiPadC17TY8nw8bE2aLK1aTMjfCy8LXMVOEFiXhgu3YFPBODHn
	AjosEFX0U/g5K+uBquSHHYXhSQRt3VbCQDkWFif3tkvyt6KwdcEz95go+T1j+eVCQQSfTz
	8Oca5udxCKctBBbCp1RI/7QuodCQTuk=
From: Zenghui Yu <zenghui.yu@linux.dev>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	"Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>
Subject: [PATCH 2/3] KVM: arm64: nv: Report addrsz fault at level 0 with a bad VTTBR.BADDR
Date: Thu, 26 Feb 2026 01:35:14 +0800
Message-ID: <20260225173515.20490-3-zenghui.yu@linux.dev>
In-Reply-To: <20260225173515.20490-1-zenghui.yu@linux.dev>
References: <20260225173515.20490-1-zenghui.yu@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_093547_979000_2E6F3947 
X-CRM114-Status: GOOD (  10.62  )
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

From: "Zenghui Yu (Huawei)" <zenghui.yu@linux.dev>

As per R_BFHQH,

" When an Address size fault is generated, the reported fault code
  indicates one of the following:

  If the fault was generated due to the TTBR_ELx used in the translation
  having nonzero address bits above the OA size, then a fault at level 0. "

Fix the reported Address size fault level as being 0 if the base address is
wrongly programmed by L1.

Fixes: 61e30b9eef7f ("KVM: arm64: nv: Implement nested Stage-2 page table walk logic")
Signed-off-by: Zenghui Yu (Huawei) <zenghui.yu@linux.dev>
---
 arch/arm64/kvm/nested.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 44ed3915b961..a957542ae3c2 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -280,7 +280,8 @@ static int walk_nested_s2_pgd(struct kvm_vcpu *vcpu, phys_addr_t ipa,
 	base_addr = wi->baddr & GENMASK_ULL(47, base_lower_bound);
 
 	if (check_output_size(wi, base_addr)) {
-		out->esr = compute_fsc(level, ESR_ELx_FSC_ADDRSZ);
+		/* R_BFHQH */
+		out->esr = compute_fsc(0, ESR_ELx_FSC_ADDRSZ);
 		return 1;
 	}
 
-- 
2.53.0


