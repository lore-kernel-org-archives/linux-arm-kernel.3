Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E146CA6010
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 10:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7A3TCDs1xynx1LpYwQyPlW/nabg1O3gtjbirRm79U8s=; b=bgxHovvYS20EEOn7ki5uqqj7Nz
	tjKdrUG72iCIUpgrdhDH7ytorU5mRha8/YXkEBjXstp79H3eDZ17DG2BetCDmE6zh6E+xl8+pWZmP
	DmjvYnhbii2M2vF8pM25sdZjBBRS3YEYuJ1RvOlw3hgswRNISH4iB/e7hufw4V1yetZ8C8LW+kjzW
	pS0UafAjuUEtS1tP6g7BnPhBJ+vtDVotZ2TdDLaXQI8HDvRXpu46TZ21ACv+CToFUz2Mitv/Gi7sP
	Fzmp9ZjSsf8EZD4O2corQHYpK85qNbSFJYZza6ur8cPDx0HPS+fQ+y2+7u85sabPNSMcMDr/PvVXX
	dVAfHPEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElaN-00000004AXY-0oM5;
	Thu, 08 Oct 2026 10:42:51 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xElaK-00000004AVT-1zEQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 10:42:50 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4a170fa0879so31260845e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 03:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791456166; x=1792060966; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7A3TCDs1xynx1LpYwQyPlW/nabg1O3gtjbirRm79U8s=;
        b=iXVn16Oi06VluBZAhJ6JfaNrijSX08DGAjwXd20dKcowQPOC+nUPlS9QrFlhvnY+Mi
         NIG8/GfrY8+tUhLwPv8jNqriOWex2t9WWL8YqVTGGlpDYRX+QqD7tLcQgik8iVHf+KIi
         rUz5fKjWxEWMefyq4tNzRpmTvwraNItpNkFqKRZYRDpTDDtjOE/4GEfK2BvuSL3pyF0j
         8DcWuGz/mzbyl/N1QZWZRfQ6xvwJDVWtizWD5LYtmUbLS199SbishXOh0qOmR0iaMR4H
         Vol6Egpeb8W/xumU7EthY4MP7n7y2L4HroUe8CKNlzrGIBeH4mtAabJEx9uj0YNk8U+s
         3n0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791456166; x=1792060966;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7A3TCDs1xynx1LpYwQyPlW/nabg1O3gtjbirRm79U8s=;
        b=eOsgbS7toznpbHa798re4/H8tSsWZQs2uRTkvMRJjGT92DG/bgXpQE01hKY80UKqp2
         RnPvXF/7Doazus9d1n/pZzdMGUct+yPtahMog90rB/UGkTKn3XcfI7csGzNBPljLABn5
         mEbMhWq8nkQRseZhojE9nUx4fJWCJTDgC8SPWkuZxuoNm4O55SFPezfeeVpvj2cRLiTd
         SGjM0yX15nsXVnPaPPdsBCdBoIRJa1+RuuJ+dbZR9COqjmIHGThAoSRCPI7mMzSNVkmp
         QnfPCxkvj/cMQTkEYiNMQDtVfwgXVsyxAnLODEnlgpaFB3k8C4K1jyezlz2lbx3d0cIx
         1wmw==
X-Forwarded-Encrypted: i=1; AKwUvBwxvRVurEbPGERCQcuKGTbqvaytFmuuYfW93+ap/SEl8T1M5Xz1Be4QuFGVrHXGYWnq6QAMoFsk7sETzxCAwT2M@lists.infradead.org
X-Gm-Message-State: AFuF++kSU73gpKvE+bE1Nz8aNJFtyWRzq3iVyib19Jc7zg1hv4hIrlvR
	01zXg4faAru6PvdSLSojhwSA1pxdniPixNJYH4d7YrCcN+rrGs2u2ycy/7Da4PTjEHVBbVGJO76
	DAVaW1l8wvVOR94p/Ae7HIQ==
X-Received: from wmol7.prod.google.com ([2002:a05:600c:47c7:b0:4a1:708e:7d78])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c0d:b0:4a0:1efa:c74c with SMTP id 5b1f17b1804b1-4a18043c6a5mr113186995e9.20.1791456166130;
 Thu, 08 Oct 2026 03:42:46 -0700 (PDT)
Date: Thu,  8 Oct 2026 11:42:11 +0100
In-Reply-To: <20261008104212.3134550-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20261008104212.3134550-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
Message-ID: <20261008104212.3134550-2-vdonnefort@google.com>
Subject: [PATCH v1 1/2] KVM: arm64: Prevent 64-bit overflow when computing hyp
 clock rate
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_034248_519660_7DCDC737 
X-CRM114-Status: GOOD (  10.71  )
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

The hypervisor clock rate is delta_cycles * NSEC_PER_SEC / delta_boot.
It is computed whenever a deviation occurs. If the delta between two
rate updates is big enough, delta_cycles * NSEC_PER_SEC will overflow.

Prevent overflow with mul_u64_u64_div_u64(). And as a bonus, simplify
the clock estimation with mul_u64_u32_shr().

Fixes: b22888917fa4 ("KVM: arm64: Sync boot clock with the nVHE/pKVM hyp")
Cc: stable@vger.kernel.org
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp_trace.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 9241d5a325fb..26fc13c16458 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -60,14 +60,8 @@ static void __hyp_clock_work(struct work_struct *work)
 	if (hyp_clock->mult) {
 		u64 err, cur = delta_cycles;
 
-		if (WARN_ON_ONCE(cur >= hyp_clock->cyc_overflow64)) {
-			__uint128_t tmp = (__uint128_t)cur * hyp_clock->mult;
-
-			cur = tmp >> hyp_clock->shift;
-		} else {
-			cur *= hyp_clock->mult;
-			cur >>= hyp_clock->shift;
-		}
+		WARN_ON_ONCE(cur >= hyp_clock->cyc_overflow64);
+		cur = mul_u64_u32_shr(cur, hyp_clock->mult, hyp_clock->shift);
 		cur += hyp_clock->boot;
 
 		err = abs_diff(cur, boot);
@@ -85,7 +79,7 @@ static void __hyp_clock_work(struct work_struct *work)
 					    err / NSEC_PER_USEC);
 	}
 
-	rate = div64_u64(delta_cycles * NSEC_PER_SEC, delta_boot);
+	rate = mul_u64_u64_div_u64(delta_cycles, NSEC_PER_SEC, delta_boot);
 
 	clocks_calc_mult_shift(&hyp_clock->mult, &hyp_clock->shift,
 			       rate, NSEC_PER_SEC, CLOCK_MAX_CONVERSION_S);
-- 
2.56.0.360.g66cac248cb-goog


