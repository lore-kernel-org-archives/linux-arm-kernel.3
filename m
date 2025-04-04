Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22533C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 22:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+ABQvf2myBmBVu0tO5Zf2gufLBIF2IPE6tPBCISSnfw=; b=znackUjEU9roL/OaXIfqorP/jo
	ogEVdLMhBuH/svcNAzD4eBcQOXJsIyGIDm2Gqkya9ozyjYq0e6IRV6HGA3SpstENhcAS4C8+lrx8y
	hsBeIF3lTQ4vu9DkBF5LpPZ4AXKj0+0sSN4uzPypG9ZVALucQTDNKzMFz6YeUf8ro1g0OHLUnlU8T
	UzkC5VWWRaETwrUqRjEi1vOzm4yGhudaDnKmk5Bl1+ZWifog723ix0n5GNVvegW4+uv1ZpnCA9GX6
	0ZAWnaz7uwxLmu3Kjqlx1zhgOrMNzGS78dbFg7qS54ZJiZmnVDzEUSTKryB/ql7e7LnQ1t1vfBWQZ
	Igg3XsfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0pH1-0000000CxfL-2qxQ;
	Fri, 04 Apr 2025 22:12:27 +0000
Received: from mail-io1-xd4a.google.com ([2607:f8b0:4864:20::d4a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0pBr-0000000CwvQ-1yQs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 22:07:08 +0000
Received: by mail-io1-xd4a.google.com with SMTP id ca18e2360f4ac-85ed07f832dso247601839f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 15:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743804423; x=1744409223; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+ABQvf2myBmBVu0tO5Zf2gufLBIF2IPE6tPBCISSnfw=;
        b=v5rvn4EPAd8l5W2cls851EMdqtPUDE/LiE3bITTTvei1CCGxkbRO1L394sGgsxPUPj
         Xv/lOpKmM4cHCmUSQPgQrafoRzQ4LHimAee4Me7iW+S1gFdqcOtmgQ3LvodmGbXLHzdS
         cxzkrGtVZ89wte+tZP91TVvzv65UMAU5xj8SzPb7Dxb7ALHOt0bpKRaFgzdwKxdtkX8Y
         X3w4I1e5gciE+GbzPHIY8A1Cwox+BCOlTrI0VsQQyWXb646poVDrNE3e1tXvCDh5xdmS
         3krpoXBpyy1+HSHNNKh4f1KiiDZQscUep8n4TKqkLy8Qxf6Zq8zVDxjJeP/T4yesE8PM
         scEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743804423; x=1744409223;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ABQvf2myBmBVu0tO5Zf2gufLBIF2IPE6tPBCISSnfw=;
        b=FA6bI89bfJa4paKaAMubKtPv8y5s0tL9oTh4wXWH06YLJs7Ac78NUh5/NaXOgn5bWi
         79rQ7Yb61JWxrAPPaKw1wmjAenMaPzZno7eSEqkWLI8tMFJ2XntfIYTUEvB7TEVotr6R
         WAKJ494NuZkp7t610eMk4HXIL+62QN5Ba2g8IVqIDh4j+M1bD9FVGzWONyRobWUCQMB2
         FNcbzaKdBqOWP+PT/ng4yRFNqmnjPCrSs3m4JGdC8WtvDmGTjURz9tTeKJJ17tDSX8FK
         4EuZN+QABIScagJocsDgQ2Bdj/4Uc1egOhOmW0IWouMQdC9Jbm2O11kDPMe91k1Qy2Jf
         y9Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXNrvSSnAKTBo5egKB2Eca00h8rnToWhf+6tErcCHR7mX4awmgqfEsmnx11e/uSI8GqXpHtATfIurxS4k/j6NSi@lists.infradead.org
X-Gm-Message-State: AOJu0YxmzVDnRHraq1Z2RnMX5UPow7EmZXcQa+TCfDPvt50xxIjsV4wh
	ViDJuimniM/MbWo5Fcny5v9nr270YF2Quu3Sd0XP2MJCP1+fMAQZa/c1JowS9428HwCqUtlJa4S
	TzSuxPg==
X-Google-Smtp-Source: AGHT+IFV9Isc4fgBFHlpxTPEvIA2IWM9thB5QLOG0FR0uQ2WcHEpEv2w8WbCsDqt+JLpu7IkXXi3TGByiQPr
X-Received: from iobjk27.prod.google.com ([2002:a05:6602:721b:b0:855:9384:bf3d])
 (user=rananta job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:3a82:b0:85d:b054:6eb9
 with SMTP id ca18e2360f4ac-8612ab4b028mr139258039f.14.1743804423530; Fri, 04
 Apr 2025 15:07:03 -0700 (PDT)
Date: Fri,  4 Apr 2025 22:06:57 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250404220659.1312465-1-rananta@google.com>
Subject: [PATCH 0/2] KVM : selftests: arm64: Explicitly set the page attrs to Inner-Shareable
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>
Cc: Raghavendra Rao Anata <rananta@google.com>, Mingwei Zhang <mizhang@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_150707_507696_6EE0A454 
X-CRM114-Status: UNSURE (   8.63  )
X-CRM114-Notice: Please train this message.
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

The series fixes a conflict in memory attributes in some implementations,
such as Neoverse-N3, that causes a data abort in guest EL1 with FSC
0x35 (IMPLEMENTATION DEFINED fault (Unsupported Exclusive or Atomic
access)).

Patch-1 is a cleanup patch that replaces numbers (and comments) to
using proper macros for hardware configuration, such as registers and
page-table entries.

Patch-2 fixes the actual bug and sets the page attrs to Inner-Shareable
by default for the VMs created in the selftests. More details are
presented in the commit text.

Raghavendra Rao Ananta (2):
  KVM: selftests: arm64: Introduce and use hardware-definition macros
  KVM: selftests: arm64: Explicitly set the page attrs to
    Inner-Shareable

 tools/arch/arm64/include/asm/sysreg.h         | 38 ++++++++++++
 .../selftests/kvm/arm64/page_fault_test.c     |  2 +-
 .../selftests/kvm/include/arm64/processor.h   | 29 +++++++--
 .../selftests/kvm/lib/arm64/processor.c       | 60 +++++++++++--------
 4 files changed, 96 insertions(+), 33 deletions(-)


base-commit: 38fec10eb60d687e30c8c6b5420d86e8149f7557
-- 
2.49.0.504.g3bcea36a83-goog


