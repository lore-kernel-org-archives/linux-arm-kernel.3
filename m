Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABEEC19776
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 21:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xEVZ05L77YjD9i0FV4RPZx+ynfSX0ZTLa/fS8nUdHrQ=; b=EBoAhxRb9qnHSeoCPFDzkwuCon
	46x1nybwYbqLZfGgbIqtRnXLZsAx8+iWr7qYCd7KITZOcJ2PviTGxAP6s7Or1VHeRVr7XmjIACW7T
	AWmExDly/95vPG8Rw5qcgvQl1B7vza6wXnfOKHrZv7t0ipwEKdzSUGghFIPXPJT8vIno3xEAK3DMw
	ADsnmJODWR65glrLXCo/dHcUIx4VzAcorI831qP5Asvu33PbGvtLcfVpxDCVr4GAyl9Qxhpu33daY
	Hr4p/MGy3b/ncvFjzV5TD4DNs8EnCkWoS9H80CuQw0UvdDyyGmj0ZC+IPZAyQzYtKpIz+WkeJLrrf
	9aPKzbVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPNl-00000005XE1-0x02;
	Wed, 26 Feb 2025 21:55:57 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnPH3-00000005WMN-3ecl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 21:49:02 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-439858c5911so1268445e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Feb 2025 13:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740606540; x=1741211340; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xEVZ05L77YjD9i0FV4RPZx+ynfSX0ZTLa/fS8nUdHrQ=;
        b=3zR8ELPz3TxrasthKXwQHmDlZ40LRZ+bS+tBCfaQ2ZqVKbwlZwvk/zMvV7oM/b1Ew0
         DBtmfCzgV4d1M4a8Mnl4NQLO4An7qY0G/M/tkwCUh/70sr72e4nGb8UdHdWdvcP8zP3W
         xcMtbKA3Tggp6N8eOvG4LYCsnzqZBoMshAVxN43UTzMkKEt9t0lArzdni8rWRnXkkaoj
         vZNtwkXSUOFXFEU8cVQoJ9S8MazSafjI31NMCh5HHSH+ElcpgyCRhol/iGXkTtSoLI2f
         RQINaFxE+UEycjOxSfvF4oOtBpnoEcYOb52A189/4dV6ivtjMr8QHqufp6W7kJCfcE5N
         AIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740606540; x=1741211340;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xEVZ05L77YjD9i0FV4RPZx+ynfSX0ZTLa/fS8nUdHrQ=;
        b=CtaTPyBnSZYlLyQpw+qTlpWRBoLjcfmqrBivU1hcn2q1jDOYbUUGaunb+cO1SPx9o+
         WQGCbS1TnnhgiGcJYbg81RX9Fq7evBJDmqJ4fXOE8VAtixViZKapJWk5RpN6JEGBPrU+
         htGZrlxDGArGKLFklgT/gjV/JGWcd+zWwsEZDQ3lXOtkfRYrtaEpOxuyguB78K/l59ub
         V/+RuN6yeXKVoatBqkPZb+ZcnL8A5WfV7LUwwu51Ey1JWBwHoi1xo9Y+qTLa/u9YH07o
         81R1F52yLPU3dZfUWtmchBhxa5EjoRsf9YKr5fHnq8ZGv9pSkJ9FPjyMKlkDmAq33zyP
         lIyA==
X-Forwarded-Encrypted: i=1; AJvYcCV5Xm/m6NCbLHSLbm7GW6mzJNr9GGc6TmdLZLMuSaO/+rdJczfLpUgkIXMPbd3bOWDb+TawGk7GIYdhptHdyl16@lists.infradead.org
X-Gm-Message-State: AOJu0YyuzKaOI8MyN5KOm8hD4yXkF0XTcH/pTHqTOyoQ4EJ7e6naNr2H
	CUOHRAZ0Ch9CvUEbZTzC/SyMKCtYhr89VYvEyhA1UE5CkaGzePjK4C/lFcBqXjnH+LUkC3XgwFg
	/BtpIlBD4rgfJ44Qt4KBdVc1Tmg==
X-Google-Smtp-Source: AGHT+IHPl9CpNA4ye6HGWodohtg7w7nq3kIEmHB83VCNwiFw4/jBDdSe7IDZ/dv5OLUf4FF1pq99Aao3VGjq0FuCrDU=
X-Received: from wmbfl9.prod.google.com ([2002:a05:600c:b89:b0:439:9985:3882])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:19d1:b0:439:9225:2f50 with SMTP id 5b1f17b1804b1-43ab8fe957dmr50990375e9.16.1740606540005;
 Wed, 26 Feb 2025 13:49:00 -0800 (PST)
Date: Wed, 26 Feb 2025 21:48:51 +0000
In-Reply-To: <20250226214853.3267057-1-sebastianene@google.com>
Mime-Version: 1.0
References: <20250226214853.3267057-1-sebastianene@google.com>
X-Mailer: git-send-email 2.48.1.658.g4767266eb4-goog
Message-ID: <20250226214853.3267057-2-sebastianene@google.com>
Subject: [PATCH 1/3] KVM: arm64: Use the static initializer for the vesion lock
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org, 
	oliver.upton@linux.dev, sebastianene@google.com, snehalreddy@google.com, 
	sudeep.holla@arm.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	will@kernel.org, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_134901_907407_0C2067AB 
X-CRM114-Status: GOOD (  11.81  )
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

Replace the definition of the hypervisor version lock
with a static initializer.

Signed-off-by: Sebastian Ene <sebastianene@google.com>
---
 arch/arm64/kvm/hyp/nvhe/ffa.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
index e433dfab882a..6df6131f1107 100644
--- a/arch/arm64/kvm/hyp/nvhe/ffa.c
+++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
@@ -69,7 +69,7 @@ static struct kvm_ffa_buffers hyp_buffers;
 static struct kvm_ffa_buffers host_buffers;
 static u32 hyp_ffa_version;
 static bool has_version_negotiated;
-static hyp_spinlock_t version_lock;
+static DEFINE_HYP_SPINLOCK(version_lock);
 
 static void ffa_to_smccc_error(struct arm_smccc_res *res, u64 ffa_errno)
 {
@@ -911,6 +911,5 @@ int hyp_ffa_init(void *pages)
 		.lock	= __HYP_SPIN_LOCK_UNLOCKED,
 	};
 
-	version_lock = __HYP_SPIN_LOCK_UNLOCKED;
 	return 0;
 }
-- 
2.48.1.658.g4767266eb4-goog


