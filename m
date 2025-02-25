Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 794DEC021B6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 01:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wgX4G/wyCIy27tIesuPjLRJPT0WJaWFAbFWUEeP8CW8=; b=hBCmKCLZ4aOIXdEp9Hm53puvcZ
	JDLCbI6pr++DAKuWEh/bQIrQNnDmRB90m94XpGCfsAt9GEj74EP7sONecPbkLYTag005Eb+F9EPBw
	1DllJ0OBQqdAAmJCg4zFg3bVo8oT925Ktvv5FuW7oe1SGUZY49dWVdq9+SivXQoIp1ff4VQjvbER2
	t4eRhFLJUgjxHqKgFLrMx37hDgo+L/VPtwBgGmnJ+Wd6QQXdNRa1FKaTFiYqlkw0ESXjCisWiNjw/
	qH8egiFZhzi5ZQ+Xx1QuyMW6DFV6/dQI+P1m4aSPumyvgHY1NHpEUalu2sfCu5ahnuFZeTy0ATOsA
	LnjrYgQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmkD4-0000000Fkon-404X;
	Tue, 25 Feb 2025 01:58:10 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmk8d-0000000FkGp-2tCL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 01:53:36 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-abecbdb4272so80331466b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 17:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740448414; x=1741053214; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wgX4G/wyCIy27tIesuPjLRJPT0WJaWFAbFWUEeP8CW8=;
        b=A0RH+2cESw8NzEVVPAE3LXGcobhB6sjBu88yZooTjEAga5n2doT5aez6Emgs5suLzl
         9lqBi3f9OMzpEHm0cM8C2odz87qwFjB4Kn5gBriIrHv4U65ttoeWvjykYYPz5fP0tjmd
         IL4Q+VkXVDdNSq1rLX1gCTmim6M5MnAX+BBaBs/gcL8jKGFsknpSJtXBqm+q8EPt0hiB
         RD11uWqgycmHIjQw4mFJ34p6GmDDYhwJUKQCX59z6aHdSVoOWoQ0P4sgIG9S7JegW2WM
         pUMyIm16Feulao+exDP26QtRgvMbmW1Pu5WontJETuxzP+cG8oAKDnlZqU9qG4Uo2t3+
         8hNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740448414; x=1741053214;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wgX4G/wyCIy27tIesuPjLRJPT0WJaWFAbFWUEeP8CW8=;
        b=sD+01BEk4/4YROuEWylQJt6ETZRuZ6jdVol3B9og2ZgDkuNGowAFYRutBi61sKvRJL
         f3hpRF9RkscZpWQHys/Uf7BcgGH3B+fkExasHloxeinVfIwIk9sLO6lUud/kk9TDXaj1
         eFZ7FlInG5GF/RfctLnmMoqFx6L6vBrUQ12XsocP6wwZqJst62N1H85PD303h2QuPQRJ
         rjz4dVZ+hfixI4fyr3ijhCqXH+n4NdCtiSVJ1zm7jX20ZGyd1PMAd004SXXxxRK1A5lh
         JkwcUa5UamQMTxpA36ZbHHIq0v4xP9OhDLgLQgQnO8Cuc4IaSHQc76WfCtsQq4ApCayi
         2KjQ==
X-Gm-Message-State: AOJu0Yztoiecvx5jWILLH1oN7YTnCCS5ZHeuAuzz8mZm8utoBbNCKb5a
	AfoEWRu7UkXlnCsWHrWq8kV3ZWpfT3PGnroE+LTS11PntcZv+V5ZUpGuIk6UMDWVPtaICwNk8Ga
	zI6l29g==
X-Google-Smtp-Source: AGHT+IHaEufhivqbAqPz8dmOr7ipMkvz7Mo3kJou3GygxqUP3Pfy+Ob1mNc3FS5PEksGnbTAMER6tHUCQA2u
X-Received: from ejcux14.prod.google.com ([2002:a17:907:cf8e:b0:abb:b80e:12f4])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:3181:b0:ab7:e8d6:3b21
 with SMTP id a640c23a62f3a-abed0d764demr127674066b.28.1740448414099; Mon, 24
 Feb 2025 17:53:34 -0800 (PST)
Date: Tue, 25 Feb 2025 01:53:25 +0000
In-Reply-To: <20250225015327.3708420-1-qperret@google.com>
Mime-Version: 1.0
References: <20250225015327.3708420-1-qperret@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250225015327.3708420-3-qperret@google.com>
Subject: [PATCH v2 2/4] KVM: arm64: Don't WARN from __pkvm_host_share_guest()
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_175335_725248_93003267 
X-CRM114-Status: GOOD (  11.01  )
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

We currently WARN() if the host attempts to share a page that is not in
an acceptable state with a guest. This isn't strictly necessary and
makes testing much harder, so drop the WARN and fix the error code.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 19c3c631708c..ae39abc7e604 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -912,7 +912,6 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu,
 		if (page->host_share_guest_count)
 			break;
 		/* Only host to np-guest multi-sharing is tolerated */
-		WARN_ON(1);
 		fallthrough;
 	default:
 		ret = -EPERM;
-- 
2.48.1.658.g4767266eb4-goog


