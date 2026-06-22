Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2E8CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 12:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mmE0l+k4azTkj7fCnHKaIM6MplyOiu6kbGKh0tBKxSw=; b=wJ68+kw3htKlxFCed7xRrZ6dIq
	sKo+rPZHvUkNlMjtf7lznYxOMFKj2XV3UWpcVA8fs/FVgv/QxCnPuYi9IN6VmqsytSLEFJO5/wuBo
	an0Jl2io99mLNpDnCfkLIHIh41+phfmdW1g1g1yYfv597vDxzfYunevUTgv7DIHexJfC4nq25jjTk
	ZH0CTcxKJJEcGREgShWUnsOcaaZAc+Bc9hQTsMD89u2K1teR6Fd1ZjuqH4K1fz66YOEy4u1/49Axi
	4YIpo7pU+U4szknV0rE2wGyifMb90kzwagInxVp3keR2mg1+hrIsxLrl8LK+l4rsVj3AFUbQgd78U
	djME219Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbe8j-00000004z5z-0VjL;
	Mon, 22 Jun 2026 12:52:37 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbe8g-00000004z5c-2wWh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Jun 2026 12:52:36 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2c6a3ece0d8so33886155ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Jun 2026 05:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782132753; x=1782737553; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mmE0l+k4azTkj7fCnHKaIM6MplyOiu6kbGKh0tBKxSw=;
        b=e/oh4IBjpdQhKQGul8siv9+XLTlJf1F/g+psaBvGiGaReNHPq7T0E6b8AtpL96B8I6
         u7vvESVGIYC/JehDnoXXPc8VCG10h5Wp+zgWdazOlsxm8qKJuW4Bobj0Fe5adlSyh9tD
         cXgWkM8bwbjt4hViI9AoVPlNXDdw/vBlGOStV/c8yWJtciwzk6Vt4hDjjMuSVvCWnwY0
         9lrl0Tet8Wb7NpEAyECRTBU9ha1QrXtOr4BWAGKAT37/iJMyqh8oAHwqMFBpiew404ly
         GI0KAbNsjrAzTyAEN2pz7cBEEfJDHlSPcmdlWNDo4bGmqzt+JKwEwi+CYDzS/on2gYMm
         SA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782132753; x=1782737553;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mmE0l+k4azTkj7fCnHKaIM6MplyOiu6kbGKh0tBKxSw=;
        b=kh/Rw33yRbVgg+auPFM1MgDVsq25kcBsHmW/VhMK9HmflVOX1TCkXhE6BeDjp9vTXg
         T1KEjaqYSj/Nkq7wnm76m+0riDgF2hip3irs9rqcJx6tI3CrA1PNmlLte5Psi/zJ1qkH
         /Zu/IcKlE09yAIfjocdOGLgWqVCGZfjBJ/JnyD3b1fPHfKp9wZYPSKxnEuNiDug/3y5c
         Bpxc6wXSSc2Y42kaZGwUouUK0pI2N6tFEdrOZYRRLRZPZzaH3Yhjhl589CD2v2l9Ii21
         lEfj8ETs3QzSYmrHhhz/JIbx/fnsfU1TBUMgW19vhKCGVHMoo65UOI7DbFpLC5MAcLob
         ruqw==
X-Gm-Message-State: AOJu0YwSnbvax8akeMMtb63njIDrhQn1QGi3hSyiL2AFfhb1WmAzeqLr
	L4BBH0ELF/JjqYejkdvd8cFXeAgp7NXkQKwD5mRagWkzZGM7bWz9ZJEPP8Oeukeh2YYPUEuEGQJ
	L32SHpQ==
X-Received: from plbx13.prod.google.com ([2002:a17:902:ea8d:b0:2c6:beed:b730])
 (user=josliu job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f552:b0:2bd:606d:b339
 with SMTP id d9443c01a7336-2c718f6543amr149621175ad.21.1782132752802; Mon, 22
 Jun 2026 05:52:32 -0700 (PDT)
Date: Mon, 22 Jun 2026 12:52:27 +0000
In-Reply-To: <20260610104829.1157497-1-catalin.marinas@arm.com>
Mime-Version: 1.0
References: <20260610104829.1157497-1-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.55.0.rc0.738.g0c8ab3ebcc-goog
Message-ID: <20260622125227.877198-1-josliu@google.com>
Subject: Re: [PATCH] arm64: Avoid eager DVMSync reclaim batches with C1-Pro
 SME erratum
From: Joshua Liu <josliu@google.com>
To: catalin.marinas@arm.com
Cc: linux-arm-kernel@lists.infradead.org, will@kernel.org, 
	Joshua Liu <josliu@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_055234_773908_F6CFAEBC 
X-CRM114-Status: GOOD (  14.16  )
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

On Wed, Jun 10, 2026 at 11:37 AM Catalin Marinas <catalin.marinas@arm.com> wrote:
> Introduce the sme_active_cpus mask tracking which CPUs run in user-space
> with SME enabled and use it for batch flushing instead of accumulating
> the mm_cpumask() of the unmapped pages.
> [...]
> The dsb() in arch_tlbbatch_add_pending() -> sme_dvmsync_add_pending()
> did introduce a performance regression for kswapd. This patch restores
> the original behaviour with the barrier only issued when the TLB batch
> is flushed. The trade-off is that the IPIs are now sent to all CPUs
> running with SME enabled at EL0 even if the reclaimed pages do not
> belong to SME tasks. This is acceptable for current SME deployments.

Profiling shows this solution has robust performance for common
workloads and is the best among a few approaches we tested with Catalin,
so we are happy to go with this solution.

Some sidenotes: for certain edge cases we still observe performance
regression, specifically when a workload pegs multiple cores with SME
status threads.

Tested-by: Joshua Liu <josliu@google.com>

