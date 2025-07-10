Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C34AC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 01:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vc4gFx6otObzph4vmcdpjljmy/wmOvcgw6O6DXvqQUk=; b=gch2g9ImpXxPiSJQRlA5xc1qNc
	f7LwXTJB5geu4pyTSxKiQqBVUewhyVE+iz+8IWCTLTqf9dYnnve3eEDdJNqgcHpaRFSVnr3lqIhdR
	07/JEQmI1lpxP7IZkdLiPLMb74E1ZugD7ZPQjzFHEQ4JmimuwVjfi911Ih0Z1MdRcbt223ZSurB4l
	VHeHv+lExDbaU0YEvcWL77ind2lxGxKnxxtLCNed99qwvtnU/mV13OEHGT0XChZQBOTqtlevvHKzm
	/24zftuUI+xVCxc3TlnvgND0PfuXsut6BpSA8F0H6Oe8/WcCAlT+dkheQJHDaZ2O0BszbCLEVAkpW
	bzAQqYqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua2RC-0000000DRWg-49Xy;
	Fri, 11 Jul 2025 01:20:34 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua0Oa-0000000DEhl-2VIE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 23:09:41 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-311ef4fb5eeso1269155a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 16:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752188979; x=1752793779; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vc4gFx6otObzph4vmcdpjljmy/wmOvcgw6O6DXvqQUk=;
        b=FzzjKwhC4CLoBRBnrpcA2gZ+47LMxGzkbNAsdMddIH70BfI6rgqd5G+IlbYen9oSeu
         5gkhy6SSbNRmpTdypLRIxxjrbIpBCk4W8xQp+CK0Al61MZfGbKCWAMVGToMh6PvkNUwc
         3pKtjqN7I9If6jiDWnC3+HqHBqzgrg+oBPu7iH+ejnrXEupLs8WaoO+WGFuKDbJw8nVU
         YlkjjE0dYKc95eE0y//rW1dT7rQF38/gM+P0ernCw4ucHMz6klkgYS2vQ1UzrlDT9epA
         yrJnMLt/rATksjGMTdLA5azJ6xdims7NV1Am9CEcNmY1IgCgtIjLn0veJTVf7YAs+9Vv
         vhqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752188979; x=1752793779;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vc4gFx6otObzph4vmcdpjljmy/wmOvcgw6O6DXvqQUk=;
        b=Bnups6S6a35Kf5l+UALccTWg0nsp8ld27hCs+NMDggfmG1pTiigf+N5G3jeSgpzT5A
         TIftuu22pSW3abVmDYy+9K/bEiw5I9+Qww+NeYKHU43E/ULrpNmNxK6UCLnxHmpl0HPf
         xDIdNvQWvyHTTNkK6IYw4NOVIdmNs5reI5nQWE1k7nuRIJxm++uWcqwjUcJJDaIiI1HZ
         J7dGiLkOpMX6oo0RUV5LUuoQD0ffWx9ZEaVdO37Fg8b4EBU94WM0iwv8Sb+fvvaIo1+s
         uIX2Krg3gzuwk3dFxSixzOTRifc4Kl7P2CnXr0Kr+9j5+v/zc5W5NYJukSqmlVveXb9w
         FyZw==
X-Forwarded-Encrypted: i=1; AJvYcCXbLfvLS5+lNaCX4X72NY/X2FcKVbIkIdDv+HmzaTlNuBsK8HrpK7RdxNUmNJ4YNMHOXlEYf23360guZgfE6AtQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyBcLgLl9vFkmTMItrRMlVwT+r7zXhkljo0/oPuO7aEV2u+Ggo0
	ONre1OAlhu5fSL8LEJWAHMj1TozXIQTQSO+eE3Nmn93ghuwc2LKfSBzgZy1Bh6Ha3OyeW4PX1Mq
	PSMIUMA==
X-Google-Smtp-Source: AGHT+IE+dyK2d0uR86qfpkwgq8AVI1vUVbhbMbwUukxTkGUUqxum4AWqrZhpfpFloZnZbssgldsJ/GbSzP4=
X-Received: from pjbee8.prod.google.com ([2002:a17:90a:fc48:b0:31c:2fe4:33b4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:568f:b0:313:d7ec:b7b7
 with SMTP id 98e67ed59e1d1-31c3d0c25b6mr8663625a91.13.1752188979183; Thu, 10
 Jul 2025 16:09:39 -0700 (PDT)
Date: Thu, 10 Jul 2025 16:08:50 -0700
In-Reply-To: <20250626001225.744268-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250626001225.744268-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <175218136720.1489574.7636607289998193683.b4-ty@google.com>
Subject: Re: [PATCH v5 0/5] KVM: x86: Provide a cap to disable APERF/MPERF
 read intercepts
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_160940_632738_6B8E487F 
X-CRM114-Status: GOOD (  10.24  )
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

On Wed, 25 Jun 2025 17:12:20 -0700, Sean Christopherson wrote:
> arm64 folks, y'all got pulled in because of selftests changes.  I deliberately
> put that patch at the end of the series so that it can be discarded/ignored
> without interfering with the x86 stuff.
> 
> 
> Jim's series to allow a guest to read IA32_APERF and IA32_MPERF, so that it
> can determine the effective frequency multiplier for the physical LPU.
> 
> [...]

Applied to kvm-x86 misc, with the thean typo fixed.  Thanks!

[1/5] KVM: x86: Replace growing set of *_in_guest bools with a u64
      https://github.com/kvm-x86/linux/commit/6fbef8615d35
[2/5] KVM: x86: Provide a capability to disable APERF/MPERF read intercepts
      https://github.com/kvm-x86/linux/commit/a7cec20845a6
[3/5] KVM: selftests: Expand set of APIs for pinning tasks to a single CPU
      https://github.com/kvm-x86/linux/commit/e83ee6f76c33
[4/5] KVM: selftests: Test behavior of KVM_X86_DISABLE_EXITS_APERFMPERF
      https://github.com/kvm-x86/linux/commit/df98ce784aeb
[5/5] KVM: selftests: Convert arch_timer tests to common helpers to pin task
      https://github.com/kvm-x86/linux/commit/95826e1ed359

--
https://github.com/kvm-x86/linux/tree/next

