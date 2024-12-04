Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9892E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 19:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gP/1ZRcuFjEEMybT5UMVVNt/puu4fP/kE3PemhzVNvM=; b=0f2a9gVCWlcF4jMpVISUjfdO8q
	UbrOQVDmuZFnY6a0X/7/u403Yczo8nNR8qyDpSEJHmTQBMqyV1Kl5USPLlJIajqFoMLPV9RBmRs+z
	qP03F2czdvEO6IUNUyOPfITCQwdBHy8404rcnIVGu5pMPoExr7fBMk7SxlDsKKn0K6zLl7R93+/0M
	rq8z5YA6K+b7fKCHM3XrrMjPeaNFpCxn9/6CD03rZC26mae1x4+rEcRx6OJgFpmwqBMiol84yDf2D
	k1mPiXI33oiHz3LaKm9Ho0NDUs4nWsuSb4i4AbLRLdub8KFnC7BaiHSQ6Uf4D5kYFvZo+/UUrDceD
	5eDLibQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIuzM-0000000Dfnq-1cEe;
	Wed, 04 Dec 2024 19:24:44 +0000
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIupN-0000000Ddkm-27UU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 19:14:26 +0000
Received: by mail-qk1-x74a.google.com with SMTP id af79cd13be357-7b674755f8eso20394485a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 11:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733339664; x=1733944464; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gP/1ZRcuFjEEMybT5UMVVNt/puu4fP/kE3PemhzVNvM=;
        b=N+XTI6hXK47l9nqQJ8tiiyu2O6Pr7nXn0OTuRqsEMnU2j457EYAz8pAi8O3hZYQP+Z
         ilkVT7LZBvqLegyiDu3kICBUbl0509PpylmRb6aMryolmvtSfiulrAC4AGVlo9LMhmiJ
         jPu+inVtRKeNTQkWaVpeqgjuKjSeCWwYg/lwOHvBmEXSNSMi3WLdi2s371+jadbrg+W2
         djwYcjOBW4lg77Lz5yfHaoldiGNEmUYHphHuDCxKXFEVHj2vuUCGzBC9HPNKtML6d0R1
         J5/0PZMh6ZaXan/zk/Fa7yIIPk2ugDmfnWifuJTrHeBHjZ7BF5UJ38j/pq8fsMohwhIJ
         io6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339664; x=1733944464;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gP/1ZRcuFjEEMybT5UMVVNt/puu4fP/kE3PemhzVNvM=;
        b=H5DjKDpXCUlh6UTkY+H9eKpdZLo36HV7Wpttv1xgTtlZhWPMipk4pSxZi+OsMBtmvs
         zdsaenkI49T4EgZkNwOx6scwFMXz/uznbE4k0CDohvqQnahg0aak/yJRNnkeqkzVH51k
         nzjQM5VxI6fkOgU/i+ouap9ARmbCeGqgc1T3y8WQIMFyjo96hkz43VWX2k7Ab7a/Kx9d
         NuYPHuya2dYFhdxZXkFSNjn6cNMm2UOJLscEOf+5XGknsRvajAA3s1HP09d6ddzXg1w9
         hsMQNzufeL0Tc2Sw+RrdYEh0nSvY0TxWNBy1FpZBuaJPK4KxYP5zem353JpYVW1AMtFn
         lYnQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+GUCDAmhxsUjv4IGh82kPMs89DBB05bLQC/x6q/5xcLRZcSSL1mXetZS1abK6BpF1LWbSRjFpLOR5ZNdgOCKV@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh1sSMsiSi91h4qoCF2zNb/6lahytkshQ775FtBWHB9GvEeeRL
	g7rUqGT2/HavgaOPv5mq7IeeHDBzxDwRYbqNL0WQ0LpxcOkqJYFFfO8R5aR0an7zM86IOPIhO5W
	0UJAYlZ+FuyTmaGhuUw==
X-Google-Smtp-Source: AGHT+IGl8+Y6jXlfDxpaeYQWcz7MkBYaeVCfdRzcMWgZ4EOOrzmqxMS37+BVzh9ZHq4dtxMyhyVDFBoslVL+V2Wp
X-Received: from uabih6.prod.google.com ([2002:a05:6130:1f06:b0:85b:c307:6bbd])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:44c4:b0:7b1:52a9:ae1a with SMTP id af79cd13be357-7b6a5d2aa5bmr858557685a.4.1733339663968;
 Wed, 04 Dec 2024 11:14:23 -0800 (PST)
Date: Wed,  4 Dec 2024 19:13:44 +0000
In-Reply-To: <20241204191349.1730936-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20241204191349.1730936-1-jthoughton@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241204191349.1730936-10-jthoughton@google.com>
Subject: [PATCH v1 09/13] KVM: selftests: Add va_start/end into uffd_desc
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, Wang@google.com, Wei W <wei.w.wang@intel.com>, 
	kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_111425_558920_A120186A 
X-CRM114-Status: GOOD (  11.87  )
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

This will be used for the self-test to look up which userfaultfd we
should be using when handling a KVM Userfault (in the event KVM
Userfault and userfaultfd are being used together).

Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/kvm/include/userfaultfd_util.h | 2 ++
 tools/testing/selftests/kvm/lib/userfaultfd_util.c     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/userfaultfd_util.h b/tools/testing/selftests/kvm/include/userfaultfd_util.h
index 60f7f9d435dc..b62fecdfe745 100644
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
index 7c9de8414462..93004c85bcdc 100644
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
2.47.0.338.g60cca15819-goog


