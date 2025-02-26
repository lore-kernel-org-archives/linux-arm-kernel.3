Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD737C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 22:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqZ6XQOG6VZQbAio3/rIqBlzFzoIEUifPodtQubNHl8=; b=bq61aqdBXUoCX4Mlz4swLXnNgZ
	Zr2B5vDMjP7kVqqoa41wdMJvh+12FqHOyBlzRAIzyEKJIETK/eWJRv50jl3BoBB/8nzMpvTScP70J
	+6v79e//wgpvOdlrPsgq4UiKB/iUUAgtLLsGca3rgViyjOt1RaJbS0xYFzs736DiK9rWmIXFp5QCy
	MCKtH50pD1odE54+2hmAhR3MMrC7ot/FPUBTwpTiVGdZMkhGF3zHqUR+9HtTvVGB72FXzlhxctIvy
	FhxSm6ck2FXcpbgBPH++OAg+sgBHTXoKEa+IJI7kiami2NB51ecDKXUIIfGXLszmq3GuOl9XBssnw
	HajZEaKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPWl-00000005YNV-3sv6;
	Wed, 26 Feb 2025 22:05:15 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPNI-00000005X8V-3hU1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 21:55:29 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43998ec3733so1316195e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 13:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740606927; x=1741211727; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uqZ6XQOG6VZQbAio3/rIqBlzFzoIEUifPodtQubNHl8=;
        b=gQLLYd7E7EwEb32kekd3msOfm2KF6cG9sVgz2Kfy+e7pOaVCDaZv8HHTek0hQVMUVY
         lJSNbJ4SmxeixKYnxaHPHMpccF4893bdHLXN9JLCDSwCGwn5tIfQSFFa/0CHZdd5Rcqg
         M7a5QLsPi5D3321Y7gcxj2tCbOLCsOOLFGGE+XG+c3d+E0kOj6Ak7RcOhVYkw1AyDOx3
         VitSJhXbqqezdnAAXnlQZ5+7/eP6bv9Hw5Vsfg6VhGSjdyeTcRc/VO7K2wfThNsEZt5s
         S7fdXX6Fa+vM1rYD29c/P1t2L3ptCdqo41q/TrDnA1nDgAbarATEaUtlfOIYEF/TPkxV
         S6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740606927; x=1741211727;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uqZ6XQOG6VZQbAio3/rIqBlzFzoIEUifPodtQubNHl8=;
        b=sbTkA90jArXiSC0usztk6XoUoqNw+yBCRFHCWCgaX5goVuM7fSuI4rmf4KB7154WUk
         UEnNDoCOQGD4YhRtl/nuTtPESq9XFvW31Bd/3nj/4nL23yEGc0v79QDtkn8zdm8KOB2c
         imLbmnkYVUZ43Tux/TAx+8KhMcPrMrFuZv/fi1y6UCTFj6H0AQBOVG3vbihAOHo1Fg91
         YO+qbkeb9njbqZFX8amKdRF036tum5ACUkvD+Mek2VSt71qSJIKWeQ8hjfqtyIleBmAa
         4yw8txvawmy3iePjE4eJlfcJypdUTds5tYKZ/9ULcY8LhKGxGJCobtkYWYP6uAnUW4tz
         peSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3e1aPfdZrLwTjCBs8uMp1WuJ7PmXUprZhtqf2LPiuaji24l6f3qg9jdam3ZJJcMcxPsdDllNb968PQUaB4NOR@lists.infradead.org
X-Gm-Message-State: AOJu0YzB6zipVG1P8bR/SBknkrT31KPPVjBvJrrHdWsgN91KX3C6uSQa
	7dtEYnk26A3qty+Gylkv7+raRJVcObC925AkJVW3/SdFEijfNYG5O0LnAjvNTKCVYXv3zCWpNA=
	=
X-Google-Smtp-Source: AGHT+IGcdJx0F/SEgDdLOiwRrbPHFrSTncjn9smRK0tUigpTMlpaxS3SaYe8GOM83dky7LXzCw7XKzq2iA==
X-Received: from wmbeq9.prod.google.com ([2002:a05:600c:8489:b0:439:8e81:fd03])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:46c7:b0:439:955d:c4e2
 with SMTP id 5b1f17b1804b1-43ab0f3c192mr75104895e9.13.1740606927078; Wed, 26
 Feb 2025 13:55:27 -0800 (PST)
Date: Wed, 26 Feb 2025 21:55:18 +0000
In-Reply-To: <20250226215520.1759218-1-tabba@google.com>
Mime-Version: 1.0
References: <20250226215520.1759218-1-tabba@google.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <20250226215520.1759218-3-tabba@google.com>
Subject: [PATCH v2 2/4] KVM: arm64: Initialize HCRX_EL2 traps in pKVM
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, mark.rutland@arm.com, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	qperret@google.com, vdonnefort@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_135528_917720_8D9B81AD 
X-CRM114-Status: GOOD (  13.42  )
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

Initialize and set the traps controlled by the HCRX_EL2 in pKVM.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/kvm/hyp/nvhe/pkvm.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index 3927fe52a3dd..6efb9bf56180 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -166,8 +166,13 @@ static int pkvm_vcpu_init_traps(struct pkvm_hyp_vcpu *hyp_vcpu)
 
 	pkvm_vcpu_reset_hcr(vcpu);
 
-	if ((!pkvm_hyp_vcpu_is_protected(hyp_vcpu)))
+	if ((!pkvm_hyp_vcpu_is_protected(hyp_vcpu))) {
+		struct kvm_vcpu *host_vcpu = hyp_vcpu->host_vcpu;
+
+		/* Trust the host for non-protected vcpu features. */
+		vcpu->arch.hcrx_el2 = host_vcpu->arch.hcrx_el2;
 		return 0;
+	}
 
 	ret = pkvm_check_pvm_cpu_features(vcpu);
 	if (ret)
@@ -175,6 +180,7 @@ static int pkvm_vcpu_init_traps(struct pkvm_hyp_vcpu *hyp_vcpu)
 
 	pvm_init_traps_hcr(vcpu);
 	pvm_init_traps_mdcr(vcpu);
+	vcpu_set_hcrx(vcpu);
 
 	return 0;
 }
-- 
2.48.1.711.g2feabab25a-goog


