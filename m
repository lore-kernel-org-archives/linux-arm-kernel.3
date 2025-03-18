Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C41C4C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 16:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nkv4hTOrWEP1mAK28D1kEzJd6tzvvXvQPHgbpNeN9YY=; b=wtnd8sPQFL7WP9M8UmbZnsGJCi
	kUAQd0hqM/6F3iMBrkEuSoC2ypGgdcNl5kQAnhTcc8KMe5/QtyDUFZfdvbpOwV9SNMvLMXlN4l4aF
	aACE7fIAH/YVX8bZBNWC8WEXBlHsooqPNqnECAz0WCgRse1EWGl4dlpvyGD5cz/4vfLtpjlX+ZDmo
	sJzeT9EFFB7hkpqEUb9le/G3xAn3xUJB+v+TBmPsC4VziHBO5oFXJKLL3u07N3dgFzI5cTXnDB9At
	3hxwVsqj5tB1WmOCYM6jNxFyzTcDJGWkAiDrwKJjxDeV0kPqMg6UGtS8kqmTptEBtA0kCAGru9miU
	WHoAhjAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZye-00000006ZCR-2NQo;
	Tue, 18 Mar 2025 16:39:40 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuZkx-00000006WUZ-3ANl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 16:25:32 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-43cf172ff63so22440445e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 09:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742315130; x=1742919930; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nkv4hTOrWEP1mAK28D1kEzJd6tzvvXvQPHgbpNeN9YY=;
        b=Pq+CfcFeWCDs4HwtNL7rSdprrhxXMU8vGFeSVPFCzaECbXfqRQL/geqxmxem6UMtKr
         xXtqVaY9OKFXC2j1Sp3ID+SSK2GEuNXa7es5WsXyxVhLDlBmd2CwhOUfZ2HkeVzWiUFi
         1iDAj6Rd5nl44vt9QhvKpEc7owzels2NmlOHZ31+EFjfEfhjlzfn+a8SYjVxjqq2hERP
         WQulFLSj6wLcGq46AlrhlVki+is1FyiPo/cfipLALfRBJ2SzUnoezVsMhPXPYptQOUyj
         shQyz8vQrv8/tZl2Ywy0p6r/odmz7eh2Q5w4y/Iv44EhXHbej0XEazNmHbDu9/SPORYw
         WkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742315130; x=1742919930;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nkv4hTOrWEP1mAK28D1kEzJd6tzvvXvQPHgbpNeN9YY=;
        b=oQmvqKvl7LFU6jSBFhK5BsiLBw33JfOSvLWJOH9ENoxUcegoXyqiBHa7KSgo+zXkUy
         2b8ILo1RyRD0NpYSHfZgJ3MMrQvuicm/VEItscCXZ1BO2RaXKjjuIyFemMsu0CCsC8M3
         2Mbb0hWUXIxkObTzzxqI5txxc2NNafhrEnABBkLImgaUQJMxcXU2TPbCpPYJMg2/Je3q
         b2PxwaKDydRSqh26Kb25IdmenTJogPGjpiIccoOnv8YbcuSvFybI5uIPyxbASPTMoBI0
         M+XlNlp6dt1ogEUCAsh+Ne9kITzQCgb8rgBeou+aaHy1Q0KzbYmnckLCF9aPa6I5u+hv
         67TA==
X-Forwarded-Encrypted: i=1; AJvYcCXY7rvOEiFH4u3aOUv6vPaB45HHINn69LCxDjmlwH6rn6IqhAvUi8HT7pswIS7bGeyE8A0zLHtJX45rck8NzQri@lists.infradead.org
X-Gm-Message-State: AOJu0YwdZytBdaIXHc1TkpgvzriMGd6kA7ty0APNZDYeYLJigl+loVGH
	cyG+/PEUJBF3nBUKdmFV85HLB9CNN8iSMqdfJDBEPWdDLY5VI4M4GmsLsvv7OfQXnpumORi3y96
	lAsWQT9I3vWlghTJ2MhNfq1Al5A==
X-Google-Smtp-Source: AGHT+IENQSIN9p8sk8M/fR1ObxL5U7dDuJO08/B2zEw9mK4FB92c5Di/ycqjo4nkJ+gmvyvHR+E0wirYkTH4pVs9RFQ=
X-Received: from wmbbe15.prod.google.com ([2002:a05:600c:1e8f:b0:43d:1d5:26e6])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3ca0:b0:43b:c95f:fd9 with SMTP id 5b1f17b1804b1-43d3b94ff9fmr30314205e9.5.1742315129825;
 Tue, 18 Mar 2025 09:25:29 -0700 (PDT)
Date: Tue, 18 Mar 2025 16:25:07 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250318162510.3280359-1-sebastianene@google.com>
Subject: [PATCH v3 0/3] KVM: arm64: Separate the hyp FF-A buffers init from
 the host
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org, 
	oliver.upton@linux.dev, sebastianene@google.com, snehalreddy@google.com, 
	sudeep.holla@arm.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	will@kernel.org, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_092531_790770_52D3D32F 
X-CRM114-Status: GOOD (  11.59  )
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

Hello,

This moves the initialization of the hypervisor FF-A buffers
away from the host FF-A map calling path. If the hypervisor
cannot map the buffers with Trustzone, it rejects any FF-A call
when it runs under protected mode. 
Other than that it moves the definitions of the ffa_to_linux_err
map from the arm_ffa driver to the ffa header so that the hyp code
can make use of it.

*** Changelog ***

v2 -> this version:

- dropped the "Map the hypervisor FF-A buffers on ffa init" patch
- added ack & reviewed-by tags
- don't release the ownership of the RX buffer if the flag from
 FFA_GET_PARTITION is (1)

v1 -> v2:

Split the patch that maps the ff-a buffers of ffa init and introduce
"Move the ffa_to_linux definition to the ffa header".

Thanks,


Sebastian Ene (3):
  KVM: arm64: Use the static initializer for the version lock
  firmware: arm_ffa: Move the ffa_to_linux definition to the ffa header
  KVM: arm64: Release the ownership of the hyp rx buffer to Trustzone

 arch/arm64/kvm/hyp/nvhe/ffa.c     | 12 +++++++-----
 drivers/firmware/arm_ffa/driver.c | 24 ------------------------
 include/linux/arm_ffa.h           | 27 +++++++++++++++++++++++++++
 3 files changed, 34 insertions(+), 29 deletions(-)

-- 
2.49.0.rc1.451.g8f38331e32-goog


