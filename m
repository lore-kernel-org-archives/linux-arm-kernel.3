Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01752E77199
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 19:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DtNoMkgEfRqjn0GoMRLYiLeDG4/kOjxv1c8ix0/Uo/Q=; b=C/GpcNL4TTnHRnKv8QbYqSrYHF
	Zm4EBKwsPJpQKgb18Rl/eQiQS6+A+m88vcNnoE3lFXypKldpEbPdMne4zzahBnJFjnHeAgBbNU/MD
	EMrplQOfliI3//jX05LZ4GM8QUWtiligXkTbv5DpLCLtuTEoaeZ4qSe+AIQaFlbQNfkzxuskABm/G
	+1lVPKkgXPQGxcAaR6dc73R5g+DXCtItgk3pQicpT8tExvd/uWwEx9LkxzjYtv6WvlY1/LDLZpQNo
	Lgj3Fg95ihU8OgAxHvpsOCWe5tgn/PXpru/gOk+uMPNFHWiFU9PG2sI05OX8x6q/QlaXJtqiNyf2w
	NNQ0hHBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVyXO-0000000D9RE-3bll;
	Thu, 09 Jan 2025 19:49:50 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVyWB-0000000D99L-0oN7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 19:48:36 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ee6dccd3c9so2186917a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 11:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736452114; x=1737056914; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DtNoMkgEfRqjn0GoMRLYiLeDG4/kOjxv1c8ix0/Uo/Q=;
        b=dwPwYy97pkwCeSOEsEJK8hW9kWG4lN2R99F9Y2mrwDDm1Wq+w7Hs1Pr9eL0KDJra2s
         sepuvf+0wQBqyYq2AgRSfCTrR1T6EsjCM7DME4WqMNSo4IWD6GBUNZI0p88Me3FZF/6F
         JY9GZb7SufmWgKb4F+BJ9M3vjl7QAeYMyD3/U+SXyE5Us7pcIwRM/WjVurPweOTHb6sy
         1S7oPQdAdK71VqbN2486kQzSVaKYpS1WSDwCeBbezvhO3lRTC0eLQXYl5YR06VgsE3Cs
         l8Da6XUVS7PMqB7tFGmqgs+sHwANMNu/kbxXqtKzNK2KNzrPKpyuSHQ4KSAXA2f6je19
         4dyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736452114; x=1737056914;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DtNoMkgEfRqjn0GoMRLYiLeDG4/kOjxv1c8ix0/Uo/Q=;
        b=stTBg3RBY7FEfhcFZjWAlgMsPjTn/Flm5uZ7ExRXLc5scpZ1GkCql3H9vpSaiz40Ay
         HVVEHxzK52H6+CZ3p2Myih48l9FzBLjeg8Pyy0OsCgAMZnKjLl0xXbOR4CjIeY9R1k4o
         byDrqL2BXwubQVgmZ9pqCaRqwr1xvRG4dnvysD8N3cLZXdSM0Y0FuXp4bkO8BfM1Aq7S
         WHLoV6XKGS0bX7o2BAQtZtVEFRVmTPvVldJLj4G+RezDOU14UhmNX+vl2wthQqNzuOJR
         oxOjux4TZNaIySmo7l+wey1a1bB4IFQJ+F0nC6SdDyq7vBNv1UDsPoY4htb3uTY8z8Ii
         3JGA==
X-Gm-Message-State: AOJu0YyG1P5YmBrAUtzC7FWKrYE8+oE5E+k6m9XYv7RsvMFNkF9eIK4V
	McbDWtgfW0K8bAHYLSTp8fFwjnE3RTdORF0EV3jVhJkY+0SqsC8YupFr1+qK5W8zzFYFm8V12es
	Ptw==
X-Google-Smtp-Source: AGHT+IGQsYeXCTLoQtv4zUeKKUd67KMOBJssqkUIj3hvgSqGZyfbB6lhOhAReCaRc5UAnOKDVlHxinf8YUY=
X-Received: from pjbsl13.prod.google.com ([2002:a17:90b:2e0d:b0:2ef:85ba:108f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1f8a:b0:2ee:c9d8:d01a
 with SMTP id 98e67ed59e1d1-2f548f33b54mr11852213a91.11.1736452113738; Thu, 09
 Jan 2025 11:48:33 -0800 (PST)
Date: Thu,  9 Jan 2025 11:47:13 -0800
In-Reply-To: <20241220013906.3518334-1-seanjc@google.com>
Mime-Version: 1.0
References: <20241220013906.3518334-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <173645122896.885867.13450184481916964756.b4-ty@google.com>
Subject: Re: [PATCH 0/8] KVM: selftests: Binary stats fixes and infra updates
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_114835_229975_09043186 
X-CRM114-Status: GOOD (  12.18  )
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

On Thu, 19 Dec 2024 17:38:58 -0800, Sean Christopherson wrote:
> Fix a handful of bugs in the binary stats infrastructure, expand support
> to vCPU-scoped stats, enumerate all KVM stats in selftests, and use the
> enumerated stats to assert at compile-time that {vm,vcpu}_get_stat() is
> getting a stat that actually exists.
> 
> Most of the bugs are benign, and AFAICT, none actually cause problems in
> the current code base.  The worst of the bugs is lack of validation that
> the requested stat actually exists, which is quite annoying if someone
> fat fingers a stat name, tries to get a vCPU stat on a VM FD, etc.
> 
> [...]

Applied 1-7 to kvm-x86 selftests (x86 wants to build tests on the vCPU-scoped
stats infrastructure).  

I'll hold off on the compile-time assertions stuff until there's consensus that
we want to go that route for all architectures (not at all urgent).

[1/8] KVM: selftests: Fix mostly theoretical leak of VM's binary stats FD
      https://github.com/kvm-x86/linux/commit/b68ec5b6869f
[2/8] KVM: selftests: Close VM's binary stats FD when releasing VM
      https://github.com/kvm-x86/linux/commit/a59768d6cb64
[3/8] KVM: selftests: Assert that __vm_get_stat() actually finds a stat
      https://github.com/kvm-x86/linux/commit/52ef723593fe
[4/8] KVM: selftests: Macrofy vm_get_stat() to auto-generate stat name string
      https://github.com/kvm-x86/linux/commit/7884da344973
[5/8] KVM: selftests: Add struct and helpers to wrap binary stats cache
      https://github.com/kvm-x86/linux/commit/384544c026f6
[6/8] KVM: selftests: Get VM's binary stats FD when opening VM
      https://github.com/kvm-x86/linux/commit/6d22ccb1c309
[7/8] KVM: selftests: Add infrastructure for getting vCPU binary stats
      https://github.com/kvm-x86/linux/commit/60d432517838
[8/8] KVM: selftests: Add compile-time assertions to guard against stats typos
      not applied

--
https://github.com/kvm-x86/linux/tree/next

