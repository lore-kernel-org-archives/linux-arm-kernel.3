Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71660CD6E77
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 15:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3K/SsiNlFZbdlNJvq9UTu1Y1PGOQfd1S84EHwWLfQU=; b=LaxQwD67zA8iK6dhkAd3xYxHkr
	HA+nW94l4bpyV/CLb1piaktRdskAj0aOmnMUR94ept+yEJIwpHuzZ06+WQD7SwUxiJAL+5/cHRtlF
	bh5e3ybwO1Hs3xKsutS6eXD/DLapdY9foer2LINwsfuIhY/eS4ZChckQhqJID/ezZCbrjWJL++xyv
	Moq/e3rJyWT1gMYYoFRznjuDjKaXPcsRVbribyIhelZqGjCuoEhiPKViqTfIKa0I/h5V3+qnjyl2R
	pyl9Lu2I9hk2b105rI8TlB4CvSnPGwdPykEeCZ1W6Vy3AVIK/+67c0r5yX6ldPFBph7LqzD+rcIDt
	XgQCe+Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9kj-0000000GyHf-0zQv;
	Thu, 04 Jun 2026 15:13:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV9kh-0000000GyGs-44VQ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 04 Jun 2026 15:12:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=P3K/SsiNlFZbdlNJvq9UTu1Y1PGOQfd1S84EHwWLfQU=; b=Z6blMnz8wrgJ66U/rhEg5EQK6r
	EoASogepsVbU4ioDG+05qLr6hAvSYKsk62jv7s4/YiZ8iURJIy8Yow5x6VrjmKint1kGE6zjBZc9q
	NOX1jc336MTEQsjkB2Vqew57LremhXSV1TBAybye1q1WJ3+DokSLNy7y5HaXqjpd4676zDe4b7Nlf
	Y7fJ+93EhDKCBPkNZxEPggpuQ5MJYroSLbzWjRZmX3i/Ly5qVIlEmRrS+4u/fpbqBTfOSKXZMM9w0
	6k+QwK4ya81siYpgzrmRyWddxT/Y4ztcyDjKyp/P0LoKR04l51AlzasciCN1Lxf+EL8SNSCsZH7A9
	WJFhdAaw==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wV9kf-0000000EUhL-1UAh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 15:12:58 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2c0c2c7d45eso7980455ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 08:12:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780585975; x=1781190775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3K/SsiNlFZbdlNJvq9UTu1Y1PGOQfd1S84EHwWLfQU=;
        b=k/V0kljIfCwr5T0v1NEAMd8ZvVp5f2NH71vYWhk4RQFfbrM0cIRhMoZ079FqdcGPWP
         XceztRBDoG93a4fTon3Rg873xxGeRl+P+AVKDX1CtyhMcSOGL4kn4hEwjF6e7gPYvD4b
         URGYXciPVWqQKajvfWQ5UfYKbh7wh40rGKFNNCxp7MklkObljDn1nQsmPvvHhxbdqOdj
         AGw6YDzltwmAIFHAa3qsGurwkYqndOR1zIAFgsiU8ujiUBKkSZ5YNPvOoPj75BN9SSLL
         StxA2C6UyRzKtOrYb2jVB6/kwKIo8Wc0fUtCTSMnBgER4YVyLLl1+gMrNszbL6eigxyv
         6dHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780585975; x=1781190775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P3K/SsiNlFZbdlNJvq9UTu1Y1PGOQfd1S84EHwWLfQU=;
        b=JItOtFpg8RQdtoah12bHpWESHwi2Kk0mx/os4s47ceH0Pmleprf4Fhj6iplGjw3ImG
         EKNyOHTGP/Ffml/D0aIsj8IWe0UXpGSZTeuWXLUr3mY9wzZ1soB2/GBTUvtrLeAIcjsz
         wCbmc4fBSmCrRdSS2HUsncZYbssnEs1qhIIKbgLAE3OSOuuRZ57RSNUV4Uc1sN5YvOuC
         r7PkOTlMdphi9RT0sQ5JohhqX4ol6m5IdTPF94AHbYSEbLnpQTVur8XDnLNhRLAtEh2Q
         9Ws4AYPukpaGUx+mULeXEvSpGIuPB4L+NvIc7mZH1Z6yZRQmHyz5xXBIBxbQTc53UoGP
         BfhA==
X-Gm-Message-State: AOJu0Yz+Ko0N7WJmgV1TKOdICAkrre+dm+FZIjqblG6oLRqJLKyuRM4O
	CUhWFQfIrKIQpiViHdcQQe6Br5DE9zS4KaiiK4RNU0ZtSy+JUzeGUeD6
X-Gm-Gg: Acq92OHATAIpglg8pmClKhGUUXxRAUjoGI7iN7eT5ZKseN5wTilr+2GUSc7KxjDKfHq
	0WzVsNO8gcnEKBJLZA0xYtE+uVotsD21L5mD367ZZAkOPuWZrhO5L2o1a9NJC11KWzssvQZaQu1
	Exwmn50fY6ClyuAnxU2lU8anwh3Lxzn062u60BWETisPczNMWHZurrhzZs8S30FfVO1DGYoRU20
	9xqquJAjbd6Z9R6NV8FP/DZ2Ruge+87Etp84bTy31SKe/xtH1a3UBGRCXIFDReWLdUS0h9EV09y
	LnJeTeZeDYpTEWAFgwttqmKN0ZkaEN8hwtSiNHNgB+ApGdbMhN3fV8sa/5nSZVad5cS9nHACZ58
	0nbNmRc7ghpr+KleHdUeFST61nSm9/C2Bpock5ay42V6POxghj7cEiKX16MHMDW7V7nCmLLrZsF
	stl0aJUAZZE3A6SfdVDp1qzSDVe1DzirKMKJJKamra61rhYMkb8wf2Ik4U
X-Received: by 2002:a17:902:f60d:b0:2c0:c3c2:c710 with SMTP id d9443c01a7336-2c163a5744emr90941045ad.17.1780585974815;
        Thu, 04 Jun 2026 08:12:54 -0700 (PDT)
Received: from v4bel.. ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664a67b0sm62705105ad.80.2026.06.04.08.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 08:12:54 -0700 (PDT)
From: Hyunwoo Kim <imv4bel@gmail.com>
To: tabba@google.com,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	imv4bel@gmail.com
Subject: [PATCH v2 1/2] KVM: arm64: Clear __hyp_running_vcpu when flushing the pKVM hyp vCPU
Date: Fri,  5 Jun 2026 00:12:02 +0900
Message-ID: <20260604151210.1304051-2-imv4bel@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604151210.1304051-1-imv4bel@gmail.com>
References: <20260604151210.1304051-1-imv4bel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_161257_466151_F91C54D4 
X-CRM114-Status: GOOD (  10.87  )
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

flush_hyp_vcpu() copies the host vCPU context into the hyp's private
vCPU on every run. ctxt_to_vcpu() expects a guest context to have a
NULL __hyp_running_vcpu, which is only ever set on the host context, so
that it resolves the vCPU via container_of(). While this is generally
the case, flush_hyp_vcpu() copies the context verbatim and does not
enforce this, so a value provided by the host is dereferenced at EL2
(host -> EL2).

Fix by clearing __hyp_running_vcpu after the copy.

Fixes: be66e67f1750 ("KVM: arm64: Use the pKVM hyp vCPU structure in handle___kvm_vcpu_run()")
Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
---
 arch/arm64/kvm/hyp/nvhe/hyp-main.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 06db299c37a89..02c5d6e5abcbf 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -128,6 +128,9 @@ static void flush_hyp_vcpu(struct pkvm_hyp_vcpu *hyp_vcpu)
 
 	hyp_vcpu->vcpu.arch.ctxt	= host_vcpu->arch.ctxt;
 
+	/* __hyp_running_vcpu must be NULL in a guest context. */
+	hyp_vcpu->vcpu.arch.ctxt.__hyp_running_vcpu = NULL;
+
 	hyp_vcpu->vcpu.arch.mdcr_el2	= host_vcpu->arch.mdcr_el2;
 	hyp_vcpu->vcpu.arch.hcr_el2 &= ~(HCR_TWI | HCR_TWE);
 	hyp_vcpu->vcpu.arch.hcr_el2 |= READ_ONCE(host_vcpu->arch.hcr_el2) &
-- 
2.43.0


