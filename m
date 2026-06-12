Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50AA7CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 14:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BOk3rPIMN9MJANkiEj+yRZwzOhJQDKG+UEQQtAnaeSo=; b=qAzPgc/wCWXJX4+hzO6jL+z0FL
	2rIA5Rf8kmJXJIji5rbFNR2V7MH+a+MpqxlvLKA2sp1k5LM7l+Oy3S+x0nOzo+S3LTVYtM1Ts9TVb
	QttENfzI0CPY/j2UuWlvG+vpxkZiReWJm/wuqMt5Isj7fC6AzCqV3iFyzE3pqazeNIgqMmwCfqCUM
	HZ9P7Bx3nXOaQYPnIPhqsOUejcE7YY8SUwDie2HG/4erPtmGS1ZnQ1w9DYckrScU0ZXeMkHFc8p9W
	YvVZ6pLeQnAX5Z6fPCMc+r3+OzoP/34Qpg0WmpDSMWjyMDvX3AlArpXFsk4WvNUBRvc5q9Gs1vWrj
	V4aDw8gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2mh-0000000B38o-0e4X;
	Fri, 12 Jun 2026 14:22:59 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY2me-0000000B371-0jcF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 14:22:57 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-490b37e1f47so7911195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 07:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781274174; x=1781878974; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BOk3rPIMN9MJANkiEj+yRZwzOhJQDKG+UEQQtAnaeSo=;
        b=P1rExLzEwbsHHAwARpMo4fPV2fpX4O7pDFfzev7ckxkT8ghvrEzBxBVgxcx1zIwlLm
         PRy3QylAD8sj4vn1XVPdjv2sl4S9Ef+H8mXqA/f30ZdUkc1/5oSlNBIdcqC5zbhd68dZ
         +LY+PbLd3mODdIH9TtPQDu9f6rKpN3L1nvLq8ce/9/zmOdVVNFnGscBihGFYfuuhBt+E
         8+UhHwlmoc0JhaaYIlwgOG6DHp5cCdwu+P9rU7qHVPK4QGHTcahhMMg7f62SasZG1F95
         rt2FhjbIFjfAv7qz782aCArFhuu3PLuzexn0qSLndO71B9Lc/+kk3fevaVgzuU7NgLpR
         fpYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274174; x=1781878974;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BOk3rPIMN9MJANkiEj+yRZwzOhJQDKG+UEQQtAnaeSo=;
        b=lrbu2JkyMjoZdRqIgDfZbp6DJHN6K30UXRYVrhyZZC9J2EtF6YNfPizP3G7UC9eOno
         gfzqL8o27RKVy/6uZGS0q6VlTEdP9tJhpxlupmUaTZNPRsshQZwa1qnfUYmGS0dTamkP
         S21RixHRcFVpqKI6/GrLj3Diyrp0AYiY2n9K7t/mDsoIYsyDVcbkgRHO1Kdcm99PJu5y
         f8A1J6PNwI7CsxamkuRK+cCeOLqGb1SzjBFwY5kAtQ2amrBG1JBvofKtxZa715Avk1Yd
         I+z5BJcVzccQmsTMN4i84zVnBwYw8P7hnVJMXWDo4BtDsf2U8oA/4gxCNaA0CapSpZdW
         Fpxg==
X-Gm-Message-State: AOJu0Yyg7N6AUyCZATJdJkhxDFtFNAP5Gwrn0CfAff/QuIAPszU/Eke5
	dhqvc+bQ5sa8JodXiMSV2mMchg71wzbky7nVnh6dAvgbAb83Ij9g7uESbrze8WYIfXOHJW6hOpy
	qZ69amOcoRHSSRAD2L0b3Eg==
X-Received: from wmaz11.prod.google.com ([2002:a05:600c:6d8b:b0:48f:c914:1996])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:83c5:b0:490:be14:bfda with SMTP id 5b1f17b1804b1-490ec48058fmr42511215e9.6.1781274173422;
 Fri, 12 Jun 2026 07:22:53 -0700 (PDT)
Date: Fri, 12 Jun 2026 15:22:41 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260612142245.1015744-1-vdonnefort@google.com>
Subject: [PATCH v1 0/4] trace_hyp_printk() for pKVM/nVHE hypervisor
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, rostedt@goodmis.org
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kernel-team@android.com, tabba@google.com, qerret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_072256_224592_645349C1 
X-CRM114-Status: GOOD (  12.45  )
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

Hi all,

This series adds a hypervisor event "hyp_printk" which enables
developers to log pretty much anything into the hypervisor tracing
buffer, just like the kernel function trace_printk().

This enables rich logging from the hypervisor, while leaving all the
string parsing burden to the kernel. This has been the main way of
debugging pKVM in Android.

Even though not strictly related to trace_hyp_printk, I have added the
following two patches:

  * KVM: arm64: Allow early calls to pKVM host_share/unshare_hyp

    This one mainly intends to support one of the new features I have
    posted here [1], which allows to enable tracing as early as
    possible. I have added it here to limit cross-posting.

  * KVM: arm64: Move kvm_define_hypevents.h to arch/arm64/kvm/

    This one is just a cleanup.

[1] https://lore.kernel.org/all/20260605163825.1762953-1-vdonnefort@google.com/

Vincent Donnefort (4):
  KVM: arm64: Allow early calls to pKVM host_share/unshare_hyp
  KVM: arm64: Move kvm_define_hypevents.h to arch/arm64/kvm/
  tracing/remotes: Add REMOTE_EVENT_CUSTOM_PRINTK() helper
  KVM: arm64: Add hyp_printk event to nVHE/pKVM hyp

 arch/arm64/include/asm/kvm_asm.h              |  4 +-
 arch/arm64/include/asm/kvm_hypevents.h        | 14 ++++
 arch/arm64/include/asm/kvm_hyptrace.h         |  8 +++
 arch/arm64/kernel/image-vars.h                |  1 +
 arch/arm64/kernel/vmlinux.lds.S               |  4 ++
 .../define_hypevents.h}                       |  0
 .../kvm/hyp/include/nvhe/define_events.h      |  2 -
 arch/arm64/kvm/hyp/include/nvhe/trace.h       | 65 +++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/events.c              |  6 ++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            |  2 +-
 arch/arm64/kvm/hyp_trace.c                    | 60 ++++++++++++++++-
 include/trace/define_remote_events.h          | 19 +++++-
 12 files changed, 176 insertions(+), 9 deletions(-)
 rename arch/arm64/{include/asm/kvm_define_hypevents.h => kvm/define_hypevents.h} (100%)


base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
-- 
2.54.0.1136.gdb2ca164c4-goog


