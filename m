Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3799C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 18:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5UB2VMD+EAaxdax2pXXlz1H3xk/sziSl+ovTL17nQcA=; b=EUngfuMbmpSbewCEvidWczQCF6
	F0DNlLG3npUbTMVU6HF0y3JLHOj86+/BNuE9Guaz5/UcnINwFsr1hhVMxAxFnU7L6h0Hgso8Im69H
	Lq6bH1veC2BLlb5CfScCQJ6w1k9oZZkhb++h2kTZ5pgS8DusrWRWZD2MWsjZmHaD8nK6ZmFgbp++P
	UfrrDN3CUbizuFljOmYTseJy5o++x69zcPMk3aJ9vmVQ3iRu7qbEgXZXxMH+huUWV0GToqoQe9d9j
	pdNZbSor40wegDJbxp6QqHcrN+CdosdWyN7DvS08PuRX4ionmVgkWm2df6lj0L/unFESttFJr/XRZ
	juwLWROQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nHn-0000000Bko2-0gRF;
	Thu, 24 Sep 2026 17:31:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9nGh-0000000BkAO-1vhC
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 17:29:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=5UB2VMD+EAaxdax2pXXlz1H3xk/sziSl+ovTL17nQcA=; b=hA7TAbtmouj2w16kza158SdvdO
	FvHy0/o2NKJ/eS5keeiLXWJhPhk9XD6GvxdBlpu6+UJhK3qCeWj1W3yNEJJ9atRe/7Q8dbfQ8pMko
	UrkMOuykVKaXhTKGdy6Se9SPdfdWDfH1adwBAiiZJq2zjYhtn3F4GB9cAiu38/b73EsqqL9wDRfZo
	TWys0jAN3pSPqsFgHoVqZWpNtQf4BFdI3YSO6449m83iyL3y0uAnCu+N59cslb9ZPcqYcmN08vQkm
	uvW68m7odl4QCJnRTTxSpix1NiiaPexF75A4c+xdsiZotR2pSHCRM43bTOM/1QWDO40UouUpoAdL9
	0F5QzynQ==;
Received: from mail-oi1-x246.google.com ([2607:f8b0:4864:20::246])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9nGe-0000000GFJt-3NVd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 17:29:58 +0000
Received: by mail-oi1-x246.google.com with SMTP id 5614622812f47-4b28deb7ee3so204203b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 10:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790270993; x=1790875793; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5UB2VMD+EAaxdax2pXXlz1H3xk/sziSl+ovTL17nQcA=;
        b=M02QvOAE70vbQDcgfCn3n5EOH2iof3YAKqPUm54wQgxRM0+qwZ6la0YThpr/03/SrG
         /MaorPU7FFVPG4u+142xjhYJlJBlbR+oEqmdw4xrMq+9rw1VNHOsgowhRUs8105/OBMn
         2fS3coJIM3bOeOC0roKiYB78iqqo/SJo4V3/V4sp3LFMkRzylAVFHHLg7tVtahVueVoz
         d9QY+RxImXr4mWlEQqDw+/vyYCsbGES6+np26ZotRSm+rmfd2DE8vQuQmH6IcgtBR7W0
         LT5gA05D9B660OGojxrArmqTN3IMc2fToxCAjXscbUv96+nTpoMjLPnw7/s08+4abvke
         32HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270993; x=1790875793;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5UB2VMD+EAaxdax2pXXlz1H3xk/sziSl+ovTL17nQcA=;
        b=TvZOp5iTxAHVG8gSPD/2xenKT5nU0Ywo0xcHc83rkGRA0ncNx6IqEwJvhrwS939+Xb
         sLhM/+0nabcJHehj3zyDe8St/2kzB9cx+MxqZkUqJZGfXh4OdkMxyPHjl/rFZh+Ixnkg
         gdIb+q6LHcU0EnsQlfBI8Y+XMEKxJUrON+lyohIQJ1gmz+NCzNrJPim1fZWsjZZySbS0
         mtcmvqm4nJn/KgEsby5P7tiu7VOqdUbE42aD//ye2EiYc0MP2BJ8Gy0kf22AFhKQVwsV
         zVT1hlFvaqFb3n2lb//vdm58n3t4XemB2j/RnWFKvCBztKEIJbPPyLU1u5aafvS2+1KQ
         nXsw==
X-Forwarded-Encrypted: i=1; AKwUvBwH8CrLPLVUUwxoURXwBViDFCLgmUkb4FQAREiZBpp2e7URYcWKSMRrxZ17FTwutbNBbbz6X6Mnn6SYfm2Rqald@lists.infradead.org
X-Gm-Message-State: AFuF++mf+DI/QAdrqT82yBkrupSBxSXCcMuPUxDvh6gBD/TKKpgGeJty
	vIBM/E0rTBSg6wM8HCexi6AGmeiV4MzHJlDG/tf/4tajtKvZElToxuv5c9M5STmRdZvUdEBDrF+
	zhE7W1TbQZ9B2L5Kgw5Jv8OWkzg==
X-Received: from ilbel26-n2.prod.google.com ([2002:a05:6e02:501a:20b0:50b:1d1a:8453])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:199d:b0:4d6:90f4:48af with SMTP id 5614622812f47-4d72e966ec8mr3960018b6e.49.1790270993044;
 Thu, 24 Sep 2026 10:29:53 -0700 (PDT)
Date: Thu, 24 Sep 2026 17:29:21 +0000
In-Reply-To: <20260924172928.2110956-1-coltonlewis@google.com>
Mime-Version: 1.0
References: <20260924172928.2110956-1-coltonlewis@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260924172928.2110956-16-coltonlewis@google.com>
Subject: [PATCH v9 15/22] KVM: arm64: Allow kvm_vcpu_pmu_resync_el0() to
 resync filters in process context
From: Colton Lewis <coltonlewis@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Fuad Tabba <fuad.tabba@linux.dev>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, Robin Murphy <robin.murphy@arm.com>, 
	Zide Chen <zide.chen@intel.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Mingwei Zhang <mizhang@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Russell King <linux@armlinux.org.uk>, Shuah Khan <shuah@kernel.org>, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Colton Lewis <coltonlewis@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_182956_945920_FB2B1100 
X-CRM114-Status: GOOD (  13.45  )
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

Previously, kvm_vcpu_pmu_resync_el0() only scheduled
KVM_REQ_RESYNC_PMU_EL0 when called from interrupt context (such as an
IPI reprogramming host perf events). When perf_pmu_resched_update() is
invoked synchronously from process context during vCPU load/put to
reschedule host events around guest-reserved counters,
armv8pmu_enable_event() calls kvm_set_pmu_events() and
kvm_vcpu_pmu_resync_el0() in process context.

Update kvm_vcpu_pmu_resync_el0() to call kvm_vcpu_pmu_restore_guest()
directly when not in interrupt context so that newly rescheduled host
perf events have their EL0 exclusion filters applied immediately.

Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arch/arm64/kvm/pmu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
index 6f60f86fad387..a8214ab52fcb5 100644
--- a/arch/arm64/kvm/pmu.c
+++ b/arch/arm64/kvm/pmu.c
@@ -213,14 +213,17 @@ void kvm_vcpu_pmu_resync_el0(void)
 {
 	struct kvm_vcpu *vcpu;
 
-	if (!has_vhe() || !in_interrupt())
+	if (!has_vhe())
 		return;
 
 	vcpu = kvm_get_running_vcpu();
 	if (!vcpu)
 		return;
 
-	kvm_make_request(KVM_REQ_RESYNC_PMU_EL0, vcpu);
+	if (in_interrupt())
+		kvm_make_request(KVM_REQ_RESYNC_PMU_EL0, vcpu);
+	else
+		kvm_vcpu_pmu_restore_guest(vcpu);
 }
 
 void kvm_host_pmu_init(struct arm_pmu *pmu)
-- 
2.56.0.rc1.310.g51773c2048-goog


