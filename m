Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D79C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 10:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YFqWTTk05Ml/MIvsxQnEF+TYVUSm4fUy0wHLdAWzEyE=; b=kOJlDJhWazpuOkwO4zhBeTEhoU
	Y/hmMmUyocHQ89SEEjYCQQfIneB1jCPv1dWgx1sb6IE7ZPaDhlMTkqaU5K5JibFRkXWCRBjPbe2KA
	w+Z0qWdGfsZBckTajmOyLrYpLXcmTPaiCrVIhhBQ9VjuWHmT5hfvMPPB91kKU6twUCTkrVJg74l6t
	vD2faY59o99YGarR9ABvQ3c3WrXmMu7bUiHNY8LzhVVHsbMSjC5QNvGRzC+RdUMuYduafbynBk+Va
	YScPAaZsA2lHsXbslJ2/nbMztwm/7l8VGlydC08nseFnqP1/M2ZDtSx4J8ACYX9PpkahcJurEBh1M
	Xg3lQv9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPfo-00000007J6f-4BIh;
	Mon, 11 Aug 2025 10:22:37 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulPd8-00000007Ilm-2moF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 10:19:52 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-3b7961b3c82so2117601f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 03:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754907588; x=1755512388; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YFqWTTk05Ml/MIvsxQnEF+TYVUSm4fUy0wHLdAWzEyE=;
        b=p6f2Y8fDb0JtO0KSzyNyJj/6zwjSEZF7ehihvU4tO5KPJeLfgLvzReTiQXXYi+g09s
         5/WQP9zW+dGaIbzK8wyJde77cZJnCpnIWAOo7ZMUPdjqqQitth9TCVOiYMZCii/nh96m
         g7kBggAz4Zp4AACBtrG9N/C9wry3UU4aWEGnRi5K9FvPXaacRdkHPfuxoKq2WZit4CL8
         YJiNALnSIvhW1/p0VuMPdjuHtwYKA0nxQr2gJ2sWmv2Pkl3nX8MVXBRogvdzNupwUfgq
         93yVh0i3+Sk3ZWZX8MG+f/OAeiXR+7i/uDws6iVY9+qKBJTubFeM9FicmbAjYjhiskwV
         NgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754907588; x=1755512388;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YFqWTTk05Ml/MIvsxQnEF+TYVUSm4fUy0wHLdAWzEyE=;
        b=fSQ+k54mB3+/KubTGSxY8TAzYUk17p/QnpzIRnhcIIWEVedoMzhDs/BcpwZR0OegrF
         QoO7dWmcwvEUFiTE8edSj/yUcMjKvDe2kE1GU9KtX8kBoT2lc9p2JQdIAvLCSBo93tbw
         mkqutClFJ6Ca/A5rwnpFfsSKlXqUHzjAqFyMaP54IRaEPHkfdEC3Ox+tWRHTI82oPSJB
         Ap3c8aVKbQn5eJdS54wNS5hRgpLgEGIM+fPeuxcxxFosrwuDM5ZeelKybvT6hJ3Z1/31
         j0pATxhkx6Q/H6uSFDnzr0tTkCW+hemAun8e7Cna51y5sX1j19D7LxaxycDsvJCDUOrw
         dQ/g==
X-Forwarded-Encrypted: i=1; AJvYcCW8nPdj993M9EX9QOQ+xyfUFq/78/CRLnwB7Jjhe9+JPV0pLvlAAFS4+MI2XHJsOaola/53btE2/zow92Yr1o4/@lists.infradead.org
X-Gm-Message-State: AOJu0YwY2jF0hR/H2oqXGLe0g7+pVhKg+jD3Kgxfwyj6H1PGeTC+kKL5
	N7BYa/B3yWeHVR4wGkbkb6n2W4QqwoA/Gkh4tmSO9v0QcHtwxZCKAmoWvsdaTo5+A1gxV6QaZzN
	DSg==
X-Google-Smtp-Source: AGHT+IFwgUj6ZZlPnitf5n78PJ6BTTwk8mKt9u1l8JS3PzuP9YtYupCNYGag/GowQHUizsrvpKq/MUeIcw==
X-Received: from wmqe20.prod.google.com ([2002:a05:600c:4e54:b0:459:e13a:ffe8])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a5d:5d88:0:b0:3a6:d95e:f38c
 with SMTP id ffacd0b85a97d-3b900b4d414mr10490118f8f.33.1754907588356; Mon, 11
 Aug 2025 03:19:48 -0700 (PDT)
Date: Mon, 11 Aug 2025 11:19:39 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.703.g449372360f-goog
Message-ID: <20250811101947.3637632-1-tabba@google.com>
Subject: [PATCH v2 0/8] KVM: arm64: Reserve pKVM VM handle during initial VM setup
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	vdonnefort@google.com, qperret@google.com, sebastianene@google.com, 
	keirf@google.com, smostafa@google.com, tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_031950_736298_FC17BAB9 
X-CRM114-Status: GOOD (  15.84  )
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

Changes since v1 [1]:
- Collect reviews.
- Add more details to cover letter.
- Rebase on Linux 6.17-rc1.

All VMs in pKVM identified by their handle, a unique per-VM ID. This
handle is shared between the host kernel and the hypvervisor, and used
to track the VM across both.

In pKVM, this handle is allocated when the VM is initialized at the
hypervisor, which is on the first vCPU run. However, the host starts
initializing the VM and setting up its data structures earlier. MMU
notifiers for the VMs are also registered before VM initialization at
the hypervisor, and rely on the handle to identify the VM [2].
Therefore, there is a potential gap between when the VM is (partially)
setup at the host, but still without a valid pKVM handle to identify it
when communicating with the hypervisor.

Additionally, in the future, the host needs to communicate with
TrustZone about the before the VM first run. Therefore, move handle
creation to when the VM is first initialized at the host.

This patch series also takes the oportunity to do some refactoring
(mostly renaming and fixing documentation) of the code. We are in the
process of upstreaming pKVM. Refactoring this code now would generate
less churn than postponing it, as the upstreamed codebase grows.
Moreover, the exsiting names and documentation are at best misleading
(and in cases actually wrong), which could lead to more confusion and
problems reviewing code in the future.

This patch series is divided into two parts:

- Patches 1-4: Renaming, refactoring, and tidying up to lay the
  groundwork for moving handle initialization and to fix existing
  issues.
- Patches 5-8: Decouple handle creation from VM initialization at the
  hypervisor and move the handle creation to VM initialization at the
  host.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20250729120014.2799359-1-tabba@google.com/
[2] https://lore.kernel.org/all/20250303214947.GA30619@willie-the-truck/

Fuad Tabba (8):
  KVM: arm64: Rename pkvm.enabled to pkvm.is_protected
  KVM: arm64: Rename 'host_kvm' to 'kvm' in pKVM host code
  KVM: arm64: Clarify comments to distinguish pKVM mode from protected
    VMs
  KVM: arm64: Decouple hyp VM creation state from its handle
  KVM: arm64: Separate allocation and insertion of pKVM VM table entries
  KVM: arm64: Consolidate pKVM hypervisor VM initialization logic
  KVM: arm64: Introduce separate hypercalls for pKVM VM reservation and
    initialization
  KVM: arm64: Reserve pKVM handle during pkvm_init_host_vm()

 arch/arm64/include/asm/kvm_asm.h       |   2 +
 arch/arm64/include/asm/kvm_host.h      |   5 +-
 arch/arm64/include/asm/kvm_pkvm.h      |   1 +
 arch/arm64/kvm/arm.c                   |  12 +-
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |   4 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c     |  14 ++
 arch/arm64/kvm/hyp/nvhe/pkvm.c         | 177 +++++++++++++++++++------
 arch/arm64/kvm/pkvm.c                  |  76 +++++++----
 8 files changed, 217 insertions(+), 74 deletions(-)


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.50.1.703.g449372360f-goog


