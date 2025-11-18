Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8051FCED279
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 10:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z9KRn/Dxx5SCay75EDvYE55m9LJK2/HJnZMeChQUWtk=; b=Dp4RUv3gcB7L5xfnwXyEQSVFE2
	jO4b07N4cpxS9Fv8uIxS2/TyIoaBBaDZUqaPnk339OSwDvmXMuoGR4+4yVYBfBMCUkaj93lx6A6hD
	JH4bnJpCpQJ398vPPlqbGfjQYR0/AztMPGLVcHO0k1QQry4mGwLEndeiRoZf6qPfl4SLD6RGbFqOa
	MLoFKQ4rsx6pHl2btibi1v8RErBA9PyhujiCmN3QmLbqeZtlG/9AKXAIS9Xvx99bPbEDi5ZEZJIXD
	9f2f7ewyGlcWZycOb7I6ZseQzRkB4UZvr/+ltR0o1Q/+kx282rCUXR+XPWr2cKJMdqGUlU9rZZhX0
	pfNJYFhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJ6D-00000000Fhh-2ivH;
	Tue, 18 Nov 2025 10:38:13 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLJ6A-00000000FgM-2WME
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 10:38:11 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-477a11d9e67so15533545e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 02:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763462288; x=1764067088; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z9KRn/Dxx5SCay75EDvYE55m9LJK2/HJnZMeChQUWtk=;
        b=a9whg78sB7UyUSxBHIgLpn2b53WXhljMzRvnf7QuKlfqm1PpJjiIfszU3oq1zKT48U
         +uvqlAuuGnma+Vw3T2SXHRYqdRfych+cxBQyIcOQs3aPzeQbncSiKqykJ7viWB4dtQI0
         Nf2ZYTaccfoLH45eD7cPUgda3Mein/ytR7JoGNHOdOCi0WA5Zgjh4kSTbh5laPzNTqlB
         kwndUOXINI9hpBanrO3l3Z1A/V0U676G6GPCjtnPFHX4sRQ4LOcilNVeAynei6xd8c/d
         EwGflelSaJsZPMjOcEcsmR5/xUQXuBhQtauLEF17it6h7wwEmoXhpr34ehZaIt0rq3X5
         12jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763462288; x=1764067088;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z9KRn/Dxx5SCay75EDvYE55m9LJK2/HJnZMeChQUWtk=;
        b=hGg950vDAO3M3zyEE7RItR1472wNCEBtbeyynsKNtpH7icbur/G8CXlkX/Fh0x2wNf
         nLHpaHwHENIbG9Tg4f45ISf2B8FXnsxDvpPVKUzbGK1Nv8269jFz3oChGP95SQKR2bch
         KmqW4tlGMEqDkNgUtvnvNFqlyp9sy8IPRnces1CPCEfqqiDDmLf/fH/2Qb/sBdQjqEX2
         B0fky6qh2DvLpDhI6gPpAmaIwqVoNWh5C6s20eXt7zaP8d6j7ZcXUaE0yu8CpNde9dDx
         RhY5dLLs1ti3t3zYFzsTml724WQ21SFvaUPsxyMkRa5lEo+5Ym2WVTJPSnlEccCC2vpA
         BpIg==
X-Forwarded-Encrypted: i=1; AJvYcCXx4eEEYZMfYDzjoQlk70uOroh6axVjvE6o0M3C+XNtlJClQG0nSJC5o6YePDJh6FG/z0NjsXsKAgSHLpYtJ7YR@lists.infradead.org
X-Gm-Message-State: AOJu0YzaaJdp/8i8gcwNGpsR8321wB7RhbIOkYh/o01RqpWOMbPOBxM2
	jARs6Pny9uC+TaR4t1CbDVm03Izg4A5+Gve5Sv0twtUHbT0iaTO3OCNDYBx7TOHnWeQ3dBPlN2x
	kZQ==
X-Google-Smtp-Source: AGHT+IGZkcmmVxFPxoDyPbv3zlvZywpQhBQNq9TJDWBaYaiID0Y8cksGdVzbX50fRSuo/B+EKDyNVMXcOQ==
X-Received: from wmbgx25.prod.google.com ([2002:a05:600c:8599:b0:477:a338:214b])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1d19:b0:476:d494:41d2
 with SMTP id 5b1f17b1804b1-4778feadf96mr134759845e9.29.1763462288748; Tue, 18
 Nov 2025 02:38:08 -0800 (PST)
Date: Tue, 18 Nov 2025 10:37:58 +0000
In-Reply-To: <20251118103807.707500-1-tabba@google.com>
Mime-Version: 1.0
References: <20251118103807.707500-1-tabba@google.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
Message-ID: <20251118103807.707500-2-tabba@google.com>
Subject: [PATCH v5 1/9] KVM: arm64: Fix Trace Buffer trapping for protected VMs
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vladimir.murzin@arm.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_023810_642220_5C024B8E 
X-CRM114-Status: GOOD (  12.15  )
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
Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
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
2.52.0.rc1.455.g30608eb744-goog


