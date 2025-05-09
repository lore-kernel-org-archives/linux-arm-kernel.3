Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA01C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 17:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HiFig5XrzaKxrne/VffAS5Dccms79XHv1+bktez4Dgg=; b=1sFKgSIwxuh7O7tcZ1GQyBdQhA
	SLVRGkX8qMfxaAlYdtnILNEjomwh6RXKjcqM4f7v6RQ6sNPjdEjQaTECP940eSER7WWExMBdlmIyz
	YsvKfVQ31qbV9gVCFmXOZrn7emP4EH2E6jPCqUci5eye9BshbAU0R6c5mxsixDfyO+HDEpatWG7hD
	RZAbd9L+jKrlMboDO0CKRiQfDE0putP3OhknYvfr8Es6QH0Y5RMu3T+ceTOPvYgASubT7UhRsQM/d
	D0XDElqEyT6CFQdKWXVFNbs+URHHmyGh876g72aXe1/Y0q2aQqPqzE+LDRLcVrj3LxuPSVIYIacnT
	VlodvKpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRHT-00000004PLa-4A0b;
	Fri, 09 May 2025 17:13:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDOn6-00000003xPT-3qfK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746801212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HiFig5XrzaKxrne/VffAS5Dccms79XHv1+bktez4Dgg=;
	b=HP1f/IVWBMPzs87KImM5Wi/t5Hx/pcwv6cGvzradgQAzoSDHl+aEHK+KfDBy5XeBtjocx2
	I7C0D5+G0CGjFdq6bR/lVO5R1c+gApiyMsL9KI6Q7tq7uMS5TqQnnBf+S3X/oKpYuegqhB
	vsqWMpWByEJlWp+OGIUYOUGaQhRRV74=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-vVNEIvi4M_--ZMW-e3SCDA-1; Fri, 09 May 2025 10:33:30 -0400
X-MC-Unique: vVNEIvi4M_--ZMW-e3SCDA-1
X-Mimecast-MFC-AGG-ID: vVNEIvi4M_--ZMW-e3SCDA_1746801210
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d4d15058dso15435105e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 07:33:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746801209; x=1747406009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HiFig5XrzaKxrne/VffAS5Dccms79XHv1+bktez4Dgg=;
        b=cguqn9HEQP7B3BhouhVXi33nAZeQmHMmWyPkFN86krkoDvK62rJH1WqxPnZ5cWFBGE
         uy2l+0aALqpVq890qNo1jwvVgVPFgbcV5URr1N8DNAWVmTzmM+vuzkroXs/FAnZvdRIB
         BS6C6WvBTlEk2zEXCJQaj2bk6dW3GbN37DtttDLJaBeWFo0RxQAdjfDZn1b7jWBDInvD
         61xltUETVRluJJrMWUTYJExWQ267oiTqlYG2P76NoGUuvw71bQJKfrc3DA7BOYqi/+KQ
         iQxWBMVeJH0grWWOJML3TtiueQWnxJV/QeSzdCMcbf1TBJBEpyFivPuX9QpqiXACIWKI
         W1JA==
X-Forwarded-Encrypted: i=1; AJvYcCWAEp/dsd3OmyIAVgrXmq2m9tTTuNzqcGldt8gzSpCs4ua2KN8y4zMqi68uVxxJfjioBm6hIQrS14e9x9hD1UVN@lists.infradead.org
X-Gm-Message-State: AOJu0YxebhSv1TkmEraoEwaqoBqDlljiqjcIXF5jfxbRNSGxhXuzfl7+
	ozLIMHd+nvgMf220Q/XFdpIdY7IpzF9SBQxX+IhLrTa1UG39iimOF/DRQwFa7VqMyyOeyU/oKLr
	o/YHkIrmOo+D66xDIa5DiQ/MunDyB3U35iHI5ZYf4UauoREv6Ehya/qRDgjqwcFJfXNKjhkBY
X-Gm-Gg: ASbGncsD/scHXGNDP9Wp9J/f9gIqOqgSOrgFuGXbr5FtDTwkBnbcD9knFDlOiBbulxC
	OOwLCrIW0jHZ9cIRBYc8a5xgr/PV6329Js2xOjcU8gIU3XNZifIoj4e77v2GSaqM250bnWZB6u1
	gsZ4i4TeVG1QL7ZcoeB9VVOiedFSdt87F+X5jM5BA97Rba2/wCFsEXbqcdo1fpD2DF2G8JyZmVa
	DRJAasN5IimDlAdh8QVXNmoCGKB9BUV+0RQS0akB/gqYrhkC9gZVBEmqNtFdtEjz6MSi3r4QfGZ
	th1KI4ts5aIu+4bT/C28xlIPzskdpyBCmnid5+CDPWQCIWS6cGSun6+6+nWNeVgFQP4D49AXHDw
	=
X-Received: by 2002:a05:600c:6819:b0:442:cab1:e092 with SMTP id 5b1f17b1804b1-442d6d1fadamr28833035e9.11.1746801209573;
        Fri, 09 May 2025 07:33:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4IBkLXeH3i+YVDUJRmaB8MUsHfZ+AUrzGIQQxg7u/gveAvDEEBf8Vr8fYNwiDc753UVZiWA==
X-Received: by 2002:a05:600c:6819:b0:442:cab1:e092 with SMTP id 5b1f17b1804b1-442d6d1fadamr28832755e9.11.1746801209169;
        Fri, 09 May 2025 07:33:29 -0700 (PDT)
Received: from rh.redhat.com (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67d5c7bsm32150775e9.4.2025.05.09.07.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 07:33:28 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Cc: Colton Lewis <coltonlewis@google.com>,
	Ricardo Koller <ricarkol@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Sebastian Ott <sebott@redhat.com>
Subject: [PATCH 2/3] KVM: arm64: selftests: fix thread migration in arch_timer_edge_cases
Date: Fri,  9 May 2025 16:33:11 +0200
Message-ID: <20250509143312.34224-3-sebott@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509143312.34224-1-sebott@redhat.com>
References: <20250509143312.34224-1-sebott@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZUzF-qoJW8F52pm0_mCgo3NQH7EpeAsxE0lZlSHVcUU_1746801210
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_073333_025126_B2B5D300 
X-CRM114-Status: GOOD (  14.42  )
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

arch_timer_edge_cases tries to migrate itself across host cpus. Before
the first test it migrates to cpu 0 by setting up an affinity mask with
only bit 0 set. After that it looks for the next possible cpu in the
current affinity mask which still has only bit 0 set. So there is no
migration at all.

Fix this by reading the default mask at start and use this to find
the next cpu in each iteration.

Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
index c4716e0c1438..a813b4c6c817 100644
--- a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
+++ b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
@@ -849,17 +849,17 @@ static void guest_code(enum arch_timer timer)
 	GUEST_DONE();
 }
 
+static cpu_set_t default_cpuset;
+
 static uint32_t next_pcpu(void)
 {
 	uint32_t max = get_nprocs();
 	uint32_t cur = sched_getcpu();
 	uint32_t next = cur;
-	cpu_set_t cpuset;
+	cpu_set_t cpuset = default_cpuset;
 
 	TEST_ASSERT(max > 1, "Need at least two physical cpus");
 
-	sched_getaffinity(0, sizeof(cpuset), &cpuset);
-
 	do {
 		next = (next + 1) % CPU_SETSIZE;
 	} while (!CPU_ISSET(next, &cpuset));
@@ -1046,6 +1046,8 @@ int main(int argc, char *argv[])
 	if (!parse_args(argc, argv))
 		exit(KSFT_SKIP);
 
+	sched_getaffinity(0, sizeof(default_cpuset), &default_cpuset);
+
 	if (test_args.test_virtual) {
 		test_vm_create(&vm, &vcpu, VIRTUAL);
 		test_run(vm, vcpu);
-- 
2.49.0


