Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5674DCD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 10:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FV02eNruyFpNY0VqdlUhlXmfFOP3V4dDqxbZnj7/URY=; b=YhLeQd3JXx+t8GIULvavkbuIr7
	xGLWLDOhMQ7BoRzjlVWWIN9/nv/qW7uQaJ+pFyJdyUm9SR2pdXVLptJpM/RZpm20WYVJ9T9bnx2jw
	DjiPeBiaMKwgz8ujWNoEZgzxaRVwc99ZG3AAGsRMPIB1VNCBy5UkSOJH1IrbdA7xOGadBurStLO2b
	e5An37duTG2RSFwfUItZS9Tc8YVkIcWWF67S9L/PSRYeA1oRbpzbplpmYaJXMN6BpjbUbBxonJC2M
	Xlx5JNEu2de3eP2Dfs2Ud9l0eex/HMOtuJZo6sSYg0NuMzDrDgi2O51/JmN5i2QZqLAkU6VeLutgq
	cQU4JK3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRR6-0000000FdFw-3UzS;
	Tue, 16 Jun 2026 10:54:28 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRR4-0000000FdEf-0Pq5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 10:54:27 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-461e0dad8easo54091f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 03:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781607263; x=1782212063; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FV02eNruyFpNY0VqdlUhlXmfFOP3V4dDqxbZnj7/URY=;
        b=tJqETAciXyItiXClRpH2SuzTpx0ZDGmRXbBWe/ukyBbZzFujh7tXXCD+ayUoZCzim8
         1zeHwkL1zDrP75tLKhioezJCJZGGO4VFvs384LcsaZ7Xc1qpI5Py7KmtG2TnnnhAbvgG
         i6JjlDXpNvIS6KLhPGRkecTKW5TxAD28049v/WtknLW4LflmqQL7mjVZvyR3yf5TcHc7
         TD7lmBXEGyQL5qIr3Vpp5XXF8vc/OeExMWnch3kZMBlpRq1rHU2GSfGBabySwBsnXy2d
         x0LVoiKJHxb6QI05zO4cuW0yu/7P+wpcji2ihw/HN2jefuzEFn7CAT1y5cCKzpMZpXjz
         1P5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607263; x=1782212063;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FV02eNruyFpNY0VqdlUhlXmfFOP3V4dDqxbZnj7/URY=;
        b=eCdZLJaFJlFsEuQyeFaYkLuMPZbDWbcW0Nwj6Ls9MKJZrldWhh+HkdAQ3Up+heGjfq
         W1P8JFQC//ui1v8rZyiLwma2RMkVuZYX28zsvwJOJDyhzm9091fDhxm7qJz78vj52mP2
         yYf1XOXDOGZz5WZYOEDD+F13Nh1SQCrKeZ7VcteQMQTGYZso3fVn6C2V3hXV/2L4TNVY
         noPkoPyMUL0CbJcI2l6xG/m+MywYIvblA6hW/me9EIyl9sE6lE4NnqDTSiVZOMYTQzEv
         ZWqQEhd7aL0rVs0Y4V9hIfpRkzR03SHDM9Cxr/FwnWOJ7+0JEG6QlP805/QfKdhcS/q6
         XgfA==
X-Forwarded-Encrypted: i=1; AFNElJ+wFw6Fjs9rxhnMd+GImYbdF0Lj/IEUsLsZnu5GjiLXHODik34idg9xFaKdRaJS9OFO1O1wh+CbBs2qEezUmLgT@lists.infradead.org
X-Gm-Message-State: AOJu0Yyb5gRmKeZFJJji3rMHSkj7oUwv9o48Bv/PIigOwu70TIshcEvn
	CQufELeu9E8q+aocYkdW+jGMQrK+Rc3pXpVnLU5jRRiCKiycjH9VYDday611MA5VdzDb4xcFbOb
	iIOj0RZGfLRRXKsHhr6EKGsK1M1SwfQ==
X-Received: from wrqd7.prod.google.com ([2002:adf:f847:0:b0:451:e1c2:5b4b])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2883:b0:45e:f8d0:d22c with SMTP id ffacd0b85a97d-4606dbde14emr27992139f8f.25.1781607262521;
 Tue, 16 Jun 2026 03:54:22 -0700 (PDT)
Date: Tue, 16 Jun 2026 10:54:07 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260616105417.2578670-1-sebastianene@google.com>
Subject: [PATCH v3 0/7] KVM: arm64: Forward FFA_NOTIFICATION* calls to TrustZone
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_035426_214984_103DB8BE 
X-CRM114-Status: GOOD (  13.33  )
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

Remove the FFA_NOTIFICATION* calls from the blocklist used by the pKVM
FF-A proxy. This restriction was preventing the use of asynchronous
signaling mechanisms defined by the Arm FF-A specification to
communicate with the secure services.
While these calls are markes as optional, there is no reason why the
hypervisor proxy would block them because:

1. Host is the Sole Non-Secure Endpoint: The Host operates as the
   only Non-Secure VM ID (VM ID 0) recognized by the Secure World.
   Because all forwarded notifications are inherently attributed to
   the Host by the SPMC, there is no risk of VM ID spoofing
   originating from the Normal World.

2. No Memory Pointers or Addresses: The FFA_NOTIFICATION_* ABIs
   operate strictly via register-based parameters, passing only
   VM IDs, VCPU IDs, flags, and bitmaps. Because these calls do
   not contain memory addresses, offsets, or pointers, forwarding
   them doesn't pose a risk of memory-based confused deputy attack
   (e.g., tricking the SPMC into overwriting protected memory).

While the pKVM proxy behaves as a relayer, it doesn't currently have its
own FF-A ID(only the host has the ID 0). The behavior of the setup
flow is covered by the spec in the: '10.9 Notification support without
a Hypervisor'.

---
Changes in v3:
- applied Will's suggestion to use the introduced method
  ffa_check_unused_args_sbz for existing calls and added a new
patch in the beggining of the series to do this.
- merged the handling of
  FFA_NOTIFICATION_BITMAP_CREATE/FFA_NOTIFICATION_BITMAP_DESTROY into
one patch as Vincent suggested and create one handler for both.

Changes in v2:
- enforce the MBZ/SBZ fields
- split the calls into separate patches
- rebase on 7.1-rc7

Link to v2:
https://lore.kernel.org/all/20260608165549.1479409-1-sebastianene@google.com/
Link to v1:
https://lore.kernel.org/all/20260501114447.2389222-2-sebastianene@google.com/


Sebastian Ene (7):
  KVM: arm64: Enforce strict SBZ checks in the FF-A proxy
  KVM: arm64: Forward FFA_NOTIFICATION_BITMAP calls to Trustzone
  KVM: arm64: Support FFA_NOTIFICATION_BIND in host handler
  KVM: arm64: Support FFA_NOTIFICATION_UNBIND in host handler
  KVM: arm64: Support FFA_NOTIFICATION_SET in host handler
  KVM: arm64: Support FFA_NOTIFICATION_GET in host handler
  KVM: arm64: Support FFA_NOTIFICATION_INFO_GET in host handler

 arch/arm64/kvm/hyp/nvhe/ffa.c | 205 ++++++++++++++++++++++++++++++++--
 1 file changed, 197 insertions(+), 8 deletions(-)

-- 
2.54.0.1136.gdb2ca164c4-goog


