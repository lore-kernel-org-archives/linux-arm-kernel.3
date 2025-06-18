Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38F7C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 04:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TiynHwWK8Tuc2ZhwblhQo9IFn5bKLScHdC3X2XmCKdY=; b=lF5CsUEvjuZnJ+fXcdaQsb+7pQ
	OXWduVQXUCXPKazqxWA/1adbV6pLJIC0oLVWk9+kf6zolyuov29otHyn0WWIZ3KFmyEslIH5N2YyX
	DarOUDl3j5r0DQVtRN7ZQmmfqWqOjbtL0cOBFE9+y+HZUj7nGGOB2J0s7oqL1mh7Oa9WG5VbpeL+m
	wUFnUUK5JhWLp9rZoWIso2iMr1kHJ3a3TNcBqPFotfd7bNfTQRB+KVIvOo+PFb+e/uglFFKhxhyDI
	wbEolrDaOQqrFWsyUhi/AqpgnuxXjCKLlHNI9siRTZjy8GvxhQhAVwIW0sQzC5+PxtaFbslwbew79
	YJkP24OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRktG-000000093aX-3O2r;
	Wed, 18 Jun 2025 04:59:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkLz-00000008zxc-3CBo
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Jun 2025 04:24:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TiynHwWK8Tuc2ZhwblhQo9IFn5bKLScHdC3X2XmCKdY=; b=GAeZ8IYad0CTLKXOlTnC8YaG2i
	cZaSXiITCs5cKfFnho+Z4KBz69q59/SPrf1rbpxW4cbNiUFMTc7s+57rMzb+m07ik0ZAkMtBJ1y4l
	zSbz2uHoKHZAz5hyp4fo/8Qsar44qld8qXpH42OTrqRj/zHbPGfk95A/FbDihTHzVAzKVi5RDYFCV
	g5rh+YCMmeUecDPUALMJNCoVsyf/6+LETmTVHMe8gs1sSIc6vhyl/d1Dfm9gFYAShJsFgzLhG6rjs
	nb2A47S3GraOaaZFutBD0U3kX7n/E7x2okzaKvMQ9/4yIrbnbq8W2Y01AvuwWeYcI51jQgynfYaqa
	IHfjdtbw==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRkLw-00000003xZX-1VjT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 04:24:51 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-235c897d378so54066775ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Jun 2025 21:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750220682; x=1750825482; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TiynHwWK8Tuc2ZhwblhQo9IFn5bKLScHdC3X2XmCKdY=;
        b=cMzEr86lHaWIZPh0OHDzQVc9v5BOdhnt65mk63/jdRBQeSDUKG4Zl1QaEVfkx0CgzH
         /64XVyEjJ94rF/5ZTXD8zhNBpfI3rpUzEVgcRbYKd1ciOfmctc7eS2J+HxBUx6Hpsqx3
         3L23hnHeuw+5F7UWBTPrdrY/JHOOauRg7Kh/+C2MxY8CGT6UHCjdc7UGM8Z2645oifOm
         dLJQmZT0G04Jr6m/jrUc7HwxT96RmKgEZ4522s2Cyxk11loPCp+cpjYBJTuBJGnNJ8XH
         g6ScbJyKgInbP/vttpXdAtgtTMIpsgk3H0skP5TjRvemynUY9CjoK6zDKCMkR4GTycQk
         SL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750220682; x=1750825482;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TiynHwWK8Tuc2ZhwblhQo9IFn5bKLScHdC3X2XmCKdY=;
        b=Hz5OpU7ly2iZr0kMhNKV28md7e5bYctnM6GlCO3+vTtcfyx6ytI6SNwNfQ5rr32UPM
         seVJVs6LQih7UXue1s0U9Wvta7mJOOKJMm50wenUvNkhjyQnuF2MweCELh4Pz88eSMAi
         CG3TB0m88i8FjDTYhefClZ3IyVJr4+m54Cs8jhLBnPyNOm7l+sGFWy3JEZ1DRdz74+Si
         sp3rzU5IMjsWVQ9RVoEM/32eJnNnu/jl5haXZPdE/bZ39tJAkbZo1C4xoEW9i56bR1/B
         WWDFlufLSSwepeWysWvXnnfvCMJnvKK4eJMiYQIlSd8c3QokzoZ2f6zdPVZihLwnWbho
         uNCw==
X-Forwarded-Encrypted: i=1; AJvYcCVz3fs56qTTRHlotDRwawyxZ6x+TtQPYt9DWlTJg927EnZiZep1Vw3x751PrApoa2osU1rOkML9MlSQsWCyzsYG@lists.infradead.org
X-Gm-Message-State: AOJu0YwL+VDsQBGkpUkTIQSb6LUu0xaJ8myrLaxWO/jw3Pmaa+/FsuAK
	Vq2+FAmWYlXUvZNNm2EjLWf7efMHMj68WP6hMmTghfCt0v1ZHydNWtRpFppn3YRttST9BXxkcCX
	hF3c6Q5sI619rC2nTBpayVw==
X-Google-Smtp-Source: AGHT+IGRuVATub0VagSwSO594ph7F/RA6BsWrOduHNPJT0NSOVEpTFRu1SVjCYkpWfQ84SvEpdSv99cmJKRK2o6P
X-Received: from plbka7.prod.google.com ([2002:a17:903:3347:b0:22e:4bf7:1cb7])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:cf0e:b0:234:d7b2:2aa9 with SMTP id d9443c01a7336-2366b1221femr249131655ad.29.1750220682173;
 Tue, 17 Jun 2025 21:24:42 -0700 (PDT)
Date: Wed, 18 Jun 2025 04:24:19 +0000
In-Reply-To: <20250618042424.330664-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250618042424.330664-11-jthoughton@google.com>
Subject: [PATCH v3 10/15] KVM: selftests: Add va_start/end into uffd_desc
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_052448_579309_9584C758 
X-CRM114-Status: GOOD (  11.35  )
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

This will be used for the selftest to look up which userfaultfd we
should be using when handling a KVM Userfault (in the event KVM
Userfault and userfaultfd are being used together).

Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/kvm/include/userfaultfd_util.h | 2 ++
 tools/testing/selftests/kvm/lib/userfaultfd_util.c     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/userfaultfd_util.h b/tools/testing/selftests/kvm/include/userfaultfd_util.h
index 60f7f9d435dc2..b62fecdfe745c 100644
--- a/tools/testing/selftests/kvm/include/userfaultfd_util.h
+++ b/tools/testing/selftests/kvm/include/userfaultfd_util.h
@@ -30,6 +30,8 @@ struct uffd_desc {
 	int *pipefds;
 	pthread_t *readers;
 	struct uffd_reader_args *reader_args;
+	void *va_start;
+	void *va_end;
 };
 
 struct uffd_desc *uffd_setup_demand_paging(int uffd_mode, useconds_t delay,
diff --git a/tools/testing/selftests/kvm/lib/userfaultfd_util.c b/tools/testing/selftests/kvm/lib/userfaultfd_util.c
index 5bde176cedd59..31d38b3a9d127 100644
--- a/tools/testing/selftests/kvm/lib/userfaultfd_util.c
+++ b/tools/testing/selftests/kvm/lib/userfaultfd_util.c
@@ -152,6 +152,8 @@ struct uffd_desc *uffd_setup_demand_paging(int uffd_mode, useconds_t delay,
 		    expected_ioctls, "missing userfaultfd ioctls");
 
 	uffd_desc->uffd = uffd;
+	uffd_desc->va_start = hva;
+	uffd_desc->va_end = (char *)hva + len;
 	for (i = 0; i < uffd_desc->num_readers; ++i) {
 		int pipes[2];
 
-- 
2.50.0.rc2.692.g299adb8693-goog


