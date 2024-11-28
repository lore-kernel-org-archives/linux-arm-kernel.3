Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1980DD6D254
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 02:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysvaIdmMpR/VmHKwcGzTb4HtexOKJ4Ghx7ZOeauEtvk=; b=lKdF/YZr7qeyCQGUWWlvr0doA4
	xddx/6wSC3qIecmZjXR6hM2gYp2ox1tdv9+1oirSgl9q6f6qkpiaS8P/7CnupK2UVewRMbJ9kRIRF
	POHz4oNg01LwtG3t96qYqUw+tS9ax8cwD42DjuxSYtFjfDOI4H+bKSgV6F8idoFffYhDQfdh4G2/8
	pTMbaoSBDRi9CjhbcgqrVr/YJTt0Rt+MOtzbndWkP12OuyrZZLja4G2TGEYcBYG9Wqc5Wy/gZnedz
	d7+QrVA8J8DeDaAzVz/hN43G/7y48dOgZrbgEhkB/isPuIWdPFB5AdHUiwrBmxVdkhpQdpyU3CF3D
	nAOWB28A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGTvm-0000000EVjs-0vlb;
	Thu, 28 Nov 2024 02:06:58 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGSpA-0000000ELuM-2oov
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 00:56:06 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7251d77ddb7so452747b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 16:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732755364; x=1733360164; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ysvaIdmMpR/VmHKwcGzTb4HtexOKJ4Ghx7ZOeauEtvk=;
        b=tzf9s40pWqVzpmLNO32a26Tf2QFo+nrCKRE6wGnne/HQEwmUKtt1ylD3n3SGm4VsQi
         KUY4z533xxNK80XTV0Bix3Ri2sEYc6Kqp+zJ3MoslHz4Hvz11a2xT+sjeb85iraQpW1f
         YXv6tM0ijCCGu4DKXmjojgkIhlKs6Rqewa8nJwJVwQv0hEb/KwJI0R7KKMWgG/yrBesY
         a4z09dCLwOs82rnnjdd2qaQiU2H4k1XUumt//WOWbbSZciCrsvVGT+wKsOqfH4hsTZJd
         XXAS9DdTilZM7ra7F+xEjsm4xIC0r67dv/UGAiTPG4+7RbPGFgqsmDKzrgrGhgYjUOzi
         nrPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732755364; x=1733360164;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ysvaIdmMpR/VmHKwcGzTb4HtexOKJ4Ghx7ZOeauEtvk=;
        b=fVfJtVY/0ZHltkUcaOlGuuPtu0nf3vrChiQ+TCf26qztYdrt+6AZF3XTGKEjjZxZOw
         6VuncvHkQI2bTfKsTNekoYq8gQO+sqvmht+TYldzPfGAIsU45xSnVz45fD/pE3u5HNzw
         lEaMDeVhWcRXky72dPmyj6zFJu9MNfDFJibMNEqJo/flRfr6Vc3Fm7YRBSY6hTqKTCLY
         k8XZ1NTG0BXKiOVgaqADd7e3Vu10JARyxKgh3ICLyEQJiK9vWN+IvswOwvL+n/aiJYwJ
         IGzxRP3OIuR5dg+JcoroEkNhsuBxXWIwf9bKGr6/iyf+CT8rZfXPqnA7wqLM11TCQFBP
         gg+Q==
X-Gm-Message-State: AOJu0YySnnTgrrmGurujy5dxBivjRGxHwzLH2UrQI2M84TYl7Mwy8+OE
	23eLhtU1yevwjX4ew8AVePPiVkwTmRBgSDdN3IiYqXYKHtta2oj7p7aWtrmBUTKdq2RD2xwlas5
	b/w==
X-Google-Smtp-Source: AGHT+IE+ChL1KLorT8CIkfmIr19XCryd//IzNWr5z8aQi0CF/Qf3ZQTw4qD7deHM4fsaQ6e/45gZiVf87tA=
X-Received: from plbmb7.prod.google.com ([2002:a17:903:987:b0:211:b7e:ba7d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e84f:b0:212:618a:461f
 with SMTP id d9443c01a7336-21501b5aed2mr63134555ad.41.1732755363732; Wed, 27
 Nov 2024 16:56:03 -0800 (PST)
Date: Wed, 27 Nov 2024 16:55:39 -0800
In-Reply-To: <20241128005547.4077116-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241128005547.4077116-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241128005547.4077116-9-seanjc@google.com>
Subject: [PATCH v4 08/16] KVM: sefltests: Explicitly include ucall_common.h in mmu_stress_test.c
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, James Houghton <jthoughton@google.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_165604_702996_75323948 
X-CRM114-Status: UNSURE (   8.42  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Explicitly include ucall_common.h in the MMU stress test, as unlike arm64
and x86-64, RISC-V doesn't include ucall_common.h in its processor.h, i.e.
this will allow enabling the test on RISC-V.

Reported-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/mmu_stress_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/testing/selftests/kvm/mmu_stress_test.c b/tools/testing/selftests/kvm/mmu_stress_test.c
index 5467b12f5903..fbb693428a82 100644
--- a/tools/testing/selftests/kvm/mmu_stress_test.c
+++ b/tools/testing/selftests/kvm/mmu_stress_test.c
@@ -15,6 +15,7 @@
 #include "test_util.h"
 #include "guest_modes.h"
 #include "processor.h"
+#include "ucall_common.h"
 
 static void guest_code(uint64_t start_gpa, uint64_t end_gpa, uint64_t stride)
 {
-- 
2.47.0.338.g60cca15819-goog


