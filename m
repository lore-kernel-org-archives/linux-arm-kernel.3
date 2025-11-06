Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC678CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 14:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZxATvlfrAs6kPTkjH086Q4K5vdnLQEYuZzyZbmCochI=; b=O0Td2SWFmgIA5vHc+rvr8vSOmG
	xYTUPimTs3w53pBCro207ao5Aw30blg3/EzgXV4EVF4it82x2Zpi+BIlxVwnIrz2MY7C8DvDu8fpK
	IEg4RRoZxibwXKzxiA1l1qQ5/apk1kvh+UwI6mpGg6bLCjdJ73SGkdAMq7XWyzrbC2R64ZcsjHK8f
	xVV2Ab3hjF+hc6dtBfkY86tQB1c17uCAJSS4MRZLTIDHnhihabmsc1Ddi7pojVztbz2C3bkL9LZpu
	rdDk8qp2SYpW221RTLfAq+q/uSUS8Mnw9sKGZt0F3SuYkmOZPwtwesl0FWEFMA6pFgKivKJ3pQiES
	LVnJ5ZgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1Ds-0000000FiTl-3RQX;
	Thu, 06 Nov 2025 14:44:24 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1Dq-0000000FiRl-1dFx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 14:44:23 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4775f51ce36so10140255e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 06:44:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762440259; x=1763045059; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxATvlfrAs6kPTkjH086Q4K5vdnLQEYuZzyZbmCochI=;
        b=Rs7Xr3DaZi6vm74aQbUmgxw+XMrIfaa+vA1A/gtEA0FRKnLdvHr8aVI4i6xltW36Gm
         znRMay55Iv2z1pg3NW8Rjn8lJh7eYGudv3bOGqrrfxfjriOH9+tuE6PYOp6ItORN3rRK
         6bTsLrAV5Q5loutHxnR6MudRhuGqcC32IzMWSSKLMg4NXr/XaxrobiWPomMpqGcejBjp
         KE5mud+Grql93SAnK8lqugHWy0V2i7iNC1C8RIcoL75LDoSbqYKKVhj00QxXgd3T/alQ
         MzQc7ohXZiL0ePT9A9BhZD3L++UutNfEFDPTeRSAHajb3dVaOV3Qb5Cya85F2CtnUkn0
         GqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762440259; x=1763045059;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxATvlfrAs6kPTkjH086Q4K5vdnLQEYuZzyZbmCochI=;
        b=deiPCYJH8Iszcn0A/Siz7XFa3PQnotsQ2LZQrZKXO/z/rYRvC3k/NI52iPVjE4ZhEF
         ErhOqF0Z5GngrlF26a2OT1rNdL43A1Pf8B8NrOOp9lTDkWaGhWrNCWW+RW1LslJnW6RX
         U8CDT/FTEoQRndfZY90MlCCPqfOiJo6y7XpqIa07dIICT+HxUkAI/HxtJmdH5yzc2DbV
         n2FcO/wCL/DCG5pifQtrzZRqtRlcyWeVy2obhPK8Xmj2LFPr40uPD6mDaJxX1jXsrHxE
         MzRRfdYeHdD+qZ7MHJzFsYfJcs1Ut+eS+TEnGnpWN6isRUa8NS+TLB06RaDBRwGqDnB8
         JDsg==
X-Forwarded-Encrypted: i=1; AJvYcCWLQnTeLfVjDIj/Y4Sd5Cle9VjZRD6Vd73sg3y5YbO7hJmeXzk4ZPn+zzpPeJIxm6NSqSYItrSycP2IuZYip3fm@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3xB7xmPDp6/KnakURMpZMRsenLPA3JJyCUS8CGSMLszEQJXOf
	9n0PAn3VAhGDh+sNmjOVSzPXtpWP9J1p1t+ENf/hBZhVxuooTDPpzw02bgQpbzBtK19y2MUDWFx
	Mng==
X-Google-Smtp-Source: AGHT+IEVyaIwoMfP0yfMDIthHFjuU2aK5E0vvak4krGXtReD/5DU8J3wL4/vur4Zr92jt89ZLLm5pAOlSQ==
X-Received: from wmbz16.prod.google.com ([2002:a05:600c:c090:b0:477:1208:651d])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3551:b0:475:dd59:d8da
 with SMTP id 5b1f17b1804b1-4775ce2b673mr73956545e9.40.1762440259695; Thu, 06
 Nov 2025 06:44:19 -0800 (PST)
Date: Thu,  6 Nov 2025 14:44:13 +0000
In-Reply-To: <20251106144418.2847443-1-tabba@google.com>
Mime-Version: 1.0
References: <20251106144418.2847443-1-tabba@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251106144418.2847443-2-tabba@google.com>
Subject: [PATCH v2 1/5] KVM: arm64: Fix Trace Buffer trapping for protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_064422_433857_1BB01D84 
X-CRM114-Status: GOOD (  12.51  )
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

For protected VMs in pKVM, the hypervisor should trap accesses to trace
buffer system registers if Trace Buffer isn't supported by the VM.
However, the current code only traps if Trace Buffer External Mode isn't
supported.

Fix this by checking for FEAT_TRBE (Trace Buffer) rather than
FEAT_TRBE_EXT.

Fixes: 9d5261269098 ("KVM: arm64: Trap external trace for protected VMs")
Reported-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 43bde061b65d..8d06a246dfd1 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -117,7 +117,7 @@ static void pvm_init_traps_mdcr(struct kvm_vcpu *vcpu)
 	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceFilt, IMP))
 		val |= MDCR_EL2_TTRF;
 
-	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, ExtTrcBuff, IMP))
+	if (!kvm_has_feat(kvm, ID_AA64DFR0_EL1, TraceBuffer, IMP))
 		val |= MDCR_EL2_E2TB_MASK;
 
 	/* Trap Debug Communications Channel registers */
-- 
2.51.2.1041.gc1ab5b90ca-goog


