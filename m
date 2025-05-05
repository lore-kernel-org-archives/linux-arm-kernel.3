Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8B4C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 16:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJagTHHNdVxyDzkTZrB+wizm+z9g6erBUIGhulC+0c0=; b=yFbKzVegxZLpXeZZIdmKqXIpz9
	XC5PnrlWdN8wVol22uCItbiYTWpMrLN1IMItnTxmu9x/t0QOLP56keQ2ouTtcN+b/Aj4bkqdir2S5
	5w1Mk5C+ITuYJQ0BOK2xUA+c1T7udLPicdp1Jh71gwH5sewtRQDWso5GCBVbQlSgoHjqpf1Q3j1ys
	EzRyDbRrMIl17L8aJm7S0uq90Kus51avam8Uq+dPhzHW/md/dOPxH4RZp99BhJej/gRnC+hUDSVwc
	5ZmHY04cGad8amLT/0tPylin6/TS9v78+BlfsxfP/qK3qKTdC+IJiij4c6s5e/6+/7wDb02kvWwIz
	0NQJceyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uByc7-00000007yWG-0GKF;
	Mon, 05 May 2025 16:24:19 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBySR-00000007wK9-2okC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 16:14:20 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-30a39fa0765so6785082a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 May 2025 09:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746461658; x=1747066458; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OJagTHHNdVxyDzkTZrB+wizm+z9g6erBUIGhulC+0c0=;
        b=Zhy7XGzCYZzoZSAmfJbKZaBzRETWrlVdDvS3b5ujG27mpPeMcxZmKA1QIu8tgmdmT+
         vszgTM8h1O2P2POYLSnu4mbK/ZBCtkZ4eFJA3bRbRzw6wn8DW3bjG2yHlsipCPAW1kcd
         R2nkku0WFgb894pAAo38egFdHlyZpB07jU+ISKeK3Q7yZiBHv0WmbVSqmxTt46BlHgMq
         FutY7fRROXjz7h7Sd4i6AGvHDIdLGB1MlsK+U8yjsT9KMEHwX0Km96Gou/23qiFQ+Ox0
         PHtL4gAyPDYmWRcwGUwyA8L+xHsjRHqD/dyNfbvM4NgJoN8eLyotW/YNCYY+nCCqL4DQ
         /MJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746461658; x=1747066458;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OJagTHHNdVxyDzkTZrB+wizm+z9g6erBUIGhulC+0c0=;
        b=RTM6x7Q3UV4ykqQBQsJLO0yZBvQq1H7cOea54AZWV8/Aqha08q+huNhMwpUi1T81gN
         46uU0kkuc2Jg4z0THKVmD/G9a5aq5IQCvjXrNgVRwfsmhHBDzUZRkhHijpprH73Zxldq
         erqLWeUEmTrpM2ITlbpJcPnEqgjyNcO1W5Z3oz2hlYHKnw9YqfGQXwUDpUpJ16oc7ykK
         y1WrnZv8VkZTeICzPgWE/qCbderDh3JyBx5iYc0BxSnyETlXiAVR8Iat4cPe9EotRvn5
         zd5tmpFjrsm5YOEaASuedR8/RfYEFsxQyyhqN48x2wGJ0TnkC/DkdjQgefGtutopF5Ke
         9ovg==
X-Forwarded-Encrypted: i=1; AJvYcCX8JvDjwb6cyvfRfltIJP7SxuUwKo/uJwinuHpGKzcLz3AMvupvBNOy1zTmAK+8Kd3V52djdrGDnT6CNKecbGAu@lists.infradead.org
X-Gm-Message-State: AOJu0YyZ4uxoaUp2+tCLCo8DsB4GGlT2W1mCdV5Oh8bu2Z2EidGhiQrT
	xdln3AqNoh0kP/nL3YeGT3NrDXWlHHlqX+RbG5tBGDjgKOR908ZcJ42syWS80oC/AmLLg2Ow6hD
	GsWfnHeA0Tw==
X-Google-Smtp-Source: AGHT+IHmeuVYVihs7sQ36TEo2hNXWZbWh14KISXEiA150JU3zbOiiYwpdjNYy9bWt46liO2U4UYaoHnwxcbrZQ==
X-Received: from pjbpw4.prod.google.com ([2002:a17:90b:2784:b0:2f8:49ad:406c])
 (user=jiaqiyan job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:d883:b0:309:eb54:9ea2 with SMTP id 98e67ed59e1d1-30a5ae3f34cmr13505195a91.20.1746461658457;
 Mon, 05 May 2025 09:14:18 -0700 (PDT)
Date: Mon,  5 May 2025 16:14:08 +0000
In-Reply-To: <20250505161412.1926643-1-jiaqiyan@google.com>
Mime-Version: 1.0
References: <20250505161412.1926643-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250505161412.1926643-3-jiaqiyan@google.com>
Subject: [PATCH v1 2/6] KVM: arm64: Set FnV for VCPU when FAR_EL2 is invalid
From: Jiaqi Yan <jiaqiyan@google.com>
To: maz@kernel.org, oliver.upton@linux.dev
Cc: joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	shuah@kernel.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	duenwen@google.com, rananta@google.com, jthoughton@google.com, 
	Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_091419_708280_9B368F81 
X-CRM114-Status: GOOD (  12.54  )
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

Certain microarchitectures (e.g. Neoverse V2) do not keep track of
the faulting address for a memory load that consumes poisoned data
and results in a synchronous external abort (SEA). This means the
faulting guest physical address is unavailable when KVM handles such
SEA in EL2, and FAR_EL2 just holds a garbage value.

In case VMM later asks KVM to synchronously inject a SEA into the
guest, KVM should set FnV bit
- in VCPU's ESR_EL1 to let guest kernel know that FAR_EL1 is invalid
  and holds garbage value
- in VCPU's ESR_EL2 to let nested virtualization know that FAR_EL2
  is invalid and holds garbage value

Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 arch/arm64/kvm/inject_fault.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index a640e839848e6..b4f9a09952ead 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -81,6 +81,9 @@ static void inject_abt64(struct kvm_vcpu *vcpu, bool is_iabt, unsigned long addr
 	if (!is_iabt)
 		esr |= ESR_ELx_EC_DABT_LOW << ESR_ELx_EC_SHIFT;
 
+	if (!kvm_vcpu_sea_far_valid(vcpu))
+		esr |= ESR_ELx_FnV;
+
 	esr |= ESR_ELx_FSC_EXTABT;
 
 	if (match_target_el(vcpu, unpack_vcpu_flag(EXCEPT_AA64_EL1_SYNC))) {
-- 
2.49.0.967.g6a0df3ecc3-goog


