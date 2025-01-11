Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F40BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 01:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3UIVRx5jS5uHOad/ZRxuC+ZyfJfWx7WVNf7AHGunc9Q=; b=M3h2JMqIQC3c+pxdJRKm6jRWsz
	g86W3DpFWS7mdx6nEo81ujE39ydJwSDaK99ZebGQF5zzPNdKH4mMqLoiM2FTSfKg6mOKEMifBVWXR
	GrUyGwoDaEvFdTuQ9jTEvQS6+tvo7MRZtsxbi1Xwk3q2/FB/iAEOag/jKQ3TEFCMra5new8mi557F
	TwsEdinXUA4QEvqDOUZlGXWcq6U6cgbz6J/MIgaCLrCk7Yk0X3X4Kh+5e+QPR82z6vzfCGeIby5lp
	swrOquHoTJI3bc8Qyqk8Q61el40izsahhUSKVNB1JOdQCwJ95a6CTlXIlvMCO7dY3IQwkGXZ35Sz+
	sbJRbzfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQLB-0000000HVV4-3856;
	Sat, 11 Jan 2025 01:31:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQFM-0000000HUT6-1Lmp
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 11 Jan 2025 01:25:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3UIVRx5jS5uHOad/ZRxuC+ZyfJfWx7WVNf7AHGunc9Q=; b=qUKEFdA5fIgGjPuYf/0ytLSvH0
	NiUMy2SzLc3q6adzjbyB8wywAkmCycw+8VTD7Ek7MGMdmW8LpUYRi0TrDpBkWGg+8LCS7K5zVdGrE
	RLUS4Ycu0oaO/k0h4wypX5V3CvKJyW6BnPJsdQLKGvSG8EbGKhXXT9c27gEjTHfptTmqfmkWYmwYr
	S7oR8lNZmytKs5FHvyFYhRUJgmsRhaT+T5HT9M/sn0lUNsj3mq6tpeBo8kJqdQhDim5al1k1utxwo
	porqrp04RXAnY4dQqmAl+LE/DR4+OMHLrXjAolmnZUzMr85cRUrA+gArLQa7uftf+mLBd7KrLDIKZ
	WP0NpqTQ==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWQFJ-00000009zIB-0NiF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jan 2025 01:25:02 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2eeeb5b7022so4818735a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 17:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736558699; x=1737163499; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=3UIVRx5jS5uHOad/ZRxuC+ZyfJfWx7WVNf7AHGunc9Q=;
        b=23dgqUCpv9Xgjh09BpxpCdW8sVlLnE2vDx9YEsBy/Y9F0AYQWuGAMeWuHPmgMAFKuj
         XfMDuUItO4tG5TF3ODqCS6cNUh2iV5BP2vJCK2aJO0vbVtqMiZS6sW21EPNzOkPS/pj1
         Mo/1LPqdI5vCNhDlfKMfYaYoRWv1oryFix3fEpljefVniC9pG3jqN9UP5929F4sdSMt3
         GWFc9Ovh4rpmvmjxKrwrlc+UiffhiPWViZ3uFEnJbbRiHkwjnBrQDfG5dDtoHv/mb9UW
         3UW7crh6MydeSDg4gYWG6LZDLoHZCbpojkF88t6wv4RbzzmVaEV61HmLxbdMDC1VgF94
         9IjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736558699; x=1737163499;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3UIVRx5jS5uHOad/ZRxuC+ZyfJfWx7WVNf7AHGunc9Q=;
        b=LC+7Hsy5RsKPwKTZyHwcdUxNwVvesYmuEXQahTQkqcniyT0qqZsdxrKUpNvBfbmjVe
         8d8KPECsY1PsU5KoVHPEOElGyPks/SyqYlDoL+7ryCipMnE+aKaZ7HNjASa4MtXzkHwV
         VlD6mihBgnYnwsoqs+BL/hrTTvDbZuExNJalYZDczVmRtE0Fo37GrTm5Zj1mwnfdDU99
         x05QPYz4DH+IwMoEZmPqWI10r7Uipeaaqv1cRB3Iuwyn/k0XgzqARhncSBmQZtvKCMK9
         3iY2x0ZYzfg5DbSZKepCzPtfFRreZ9p9Q5GqqmJQCLo2byhUc2DPVZObPdC7C1GmSpQg
         gu9A==
X-Forwarded-Encrypted: i=1; AJvYcCW7745YboIl38iPwqdTzsfjmlnsqYyIPIrLet75ly6w60kipPGaNWtqLGl/E4wScYV/xUq6NT0ASCZD0ayNXEku@lists.infradead.org
X-Gm-Message-State: AOJu0YxrW3YHFKmAvbbetL0IqIUTQzuG/TkJqe/uwkyXdfkafCn4MPk/
	7LwkVbcH0ph2zYxn2j5hYNrhPzJPpT6GctSzrX3Lvf2vNNWTP9PTquuGNNwcVRXKt6JBZ9cI6Rs
	lAw==
X-Google-Smtp-Source: AGHT+IHf025t1EVvlV+j91gbU3uZgm+9mZiPk2JrEEttgvDlmrVpnhWnRwbzCB96nhWXuJS4v4uP1KYHMJk=
X-Received: from pjbnw13.prod.google.com ([2002:a17:90b:254d:b0:2ee:4b69:50e1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5188:b0:2ee:df57:b194
 with SMTP id 98e67ed59e1d1-2f548eceb00mr17022072a91.21.1736558698928; Fri, 10
 Jan 2025 17:24:58 -0800 (PST)
Date: Fri, 10 Jan 2025 17:24:49 -0800
In-Reply-To: <20250111012450.1262638-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250111012450.1262638-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111012450.1262638-5-seanjc@google.com>
Subject: [PATCH 4/5] KVM: selftests: Provide separate helper for KVM_RUN with immediate_exit
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Michael Ellerman <mpe@ellerman.id.au>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_012501_322612_ECDC3AE7 
X-CRM114-Status: GOOD (  11.19  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Turn vcpu_run_complete_io() into a wrapper for a dedicated helper for
doing KVM_RUN with immediate_exit = true, so that a future patch can do
userspace exit completion if and only if it's actually necessary,
whereas x86's nested exceptions test wants to unconditionally do KVM_RUN
with an immediate exit.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h           | 9 ++++++++-
 tools/testing/selftests/kvm/lib/kvm_util.c               | 2 +-
 tools/testing/selftests/kvm/x86/nested_exceptions_test.c | 3 +--
 3 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index 4c4e5a847f67..78fd597c1b60 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -631,7 +631,14 @@ static inline int __vcpu_run(struct kvm_vcpu *vcpu)
 	return __vcpu_ioctl(vcpu, KVM_RUN, NULL);
 }
 
-void vcpu_run_complete_io(struct kvm_vcpu *vcpu);
+
+void vcpu_run_immediate_exit(struct kvm_vcpu *vcpu);
+
+static inline void vcpu_run_complete_io(struct kvm_vcpu *vcpu)
+{
+	vcpu_run_immediate_exit(vcpu);
+}
+
 struct kvm_reg_list *vcpu_get_reg_list(struct kvm_vcpu *vcpu);
 
 static inline void vcpu_enable_cap(struct kvm_vcpu *vcpu, uint32_t cap,
diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index 33fefeb3ca44..c9a33766f673 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -1665,7 +1665,7 @@ void vcpu_run(struct kvm_vcpu *vcpu)
 	TEST_ASSERT(!ret, KVM_IOCTL_ERROR(KVM_RUN, ret));
 }
 
-void vcpu_run_complete_io(struct kvm_vcpu *vcpu)
+void vcpu_run_immediate_exit(struct kvm_vcpu *vcpu)
 {
 	int ret;
 
diff --git a/tools/testing/selftests/kvm/x86/nested_exceptions_test.c b/tools/testing/selftests/kvm/x86/nested_exceptions_test.c
index 3eb0313ffa39..4f144576a6da 100644
--- a/tools/testing/selftests/kvm/x86/nested_exceptions_test.c
+++ b/tools/testing/selftests/kvm/x86/nested_exceptions_test.c
@@ -238,8 +238,7 @@ int main(int argc, char *argv[])
 
 	/* Pend #SS and request immediate exit.  #SS should still be pending. */
 	queue_ss_exception(vcpu, false);
-	vcpu->run->immediate_exit = true;
-	vcpu_run_complete_io(vcpu);
+	vcpu_run_immediate_exit(vcpu);
 
 	/* Verify the pending events comes back out the same as it went in. */
 	vcpu_events_get(vcpu, &events);
-- 
2.47.1.613.gc27f4b7a9f-goog


