Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC9CBC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 01:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=clvSOaTIwEa9bgc9cdZpN3zTDEuSaQ80Bs4rjxPQt4M=; b=yeTZWOMW71Z+KLsysaD+h9h34l
	C2AEGemosmfdMfI8P71AkaKWCmWI11QcAj3NMBjAAbMa9jtoN2vGvyAd5Hyu7HHuTv93beUjMCtpk
	257Vs/9r0C8fVlHOI97ry5ltbHl7fjFb/J0ySYONAwu2xAqDboRe8zcX2P6lACHo+gqwoijuyuTOJ
	Pjju/vg3Dc/f8DnH6JPwQ75rlXuz0eqXEKdqJ+ZObksjiHV7gBXMLbRE/RdznfJYyDZ0XWqStO1dC
	2H5dEkp3yCta7D4a5e+kICqlQHN8de/q4q3L9aWpKs1AFHu/RkbBLq3CArRtFN2MSdMt6E89YmSPa
	oFo5DmUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj6bw-0000000GhP6-1KIF;
	Sat, 15 Feb 2025 01:04:48 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj6U3-0000000GfGn-3NpU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 00:56:41 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2fc1eabf4f7so4000787a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 16:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739580999; x=1740185799; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=clvSOaTIwEa9bgc9cdZpN3zTDEuSaQ80Bs4rjxPQt4M=;
        b=AFJxDJ6Khwmy7wDj9+R2Rg1oi84W4mZl/pnzBt48uX6MRRO5LkfmnObRsxNBB4l0ad
         ZDo0Pj2yO37adfyWnakp3wSHh3UV75dsTW1Y/SwHlT/TrgIWR7qxV5oWTPojJAqmQjup
         2mLZ/c7CPlqahC+B/VmbBWIGNGeEi3Gep1Nt1cKIWyORUBaBCqISHGsyqbY/MZmVkHr6
         j91i5FXWVBB/NK0LMuWQvefJUvFL592xaOo58eFpYe3LR9V0+9Gs8TlSbveVWmO5qgcY
         pC7/+w/LwoSYeDou6qrV1kKyCIWm7OxV9poX+t4R+b357o1YSLVp0oBQt95tVbeHvHHv
         +qOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739580999; x=1740185799;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=clvSOaTIwEa9bgc9cdZpN3zTDEuSaQ80Bs4rjxPQt4M=;
        b=bWmF8kW0X6IUzY+zDNlmDuQBbx3T4VDQDYJEBTQ4I54OLfmyKn6JZ9zw8aqeISL+TN
         ogO4uJfMUPA2hPJifnJ4GVbuHnUXaSzXo5xOi4sY22P22xQCVCCGKhY3I75y/uP6LS0f
         WmVNkOSAedsnS8jMwxmbB0FXPUbPf+YgFX2789RN91ebVGs585puNZP8xL88MWvvokzp
         jY16VtPLyy/GDqShzHHxqI1Cmwhd5PpEyjzsy4SOspSs08huMLmRXesytptFiS+9Vy+h
         FKXVmPW2OdY86LrA+708blDPyBup6AJvHlog47YnzE9Rh9JDUS2BTSM14x/Zo9ehdukC
         y2VA==
X-Gm-Message-State: AOJu0Ywsexpn8HaB6OG0wOtZALi9H/u0tQ8qHSepCSPqSAlJ8wZ9CgHT
	M/eXqLgDB9VMwCYu5Wng6SvqrBDfqtqj6408FgLPbaP6CL6pD3DcFXwG952zge0PZ8QJviTZn2f
	Z6Q==
X-Google-Smtp-Source: AGHT+IEDBkpXU3G4/lKZrs/PoISbfgAX1w1fyvpk5cFq3/CN1zXVNsLI9tdZL04a2XEND4anIVs8+UjqyEg=
X-Received: from pjbsp4.prod.google.com ([2002:a17:90b:52c4:b0:2ef:8055:93d9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4a49:b0:2ea:aa56:499
 with SMTP id 98e67ed59e1d1-2fc40d13e61mr1911642a91.1.1739580998875; Fri, 14
 Feb 2025 16:56:38 -0800 (PST)
Date: Fri, 14 Feb 2025 16:50:35 -0800
In-Reply-To: <20250111005049.1247555-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250111005049.1247555-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <173958028389.1189761.4728178272323667525.b4-ty@google.com>
Subject: Re: [PATCH v2 0/9] KVM: selftests: Binary stats fixes and infra updates
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
X-CRM114-CacheID: sfid-20250214_165639_841962_25F78A07 
X-CRM114-Status: GOOD (  11.83  )
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

On Fri, 10 Jan 2025 16:50:40 -0800, Sean Christopherson wrote:
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

Applied to kvm-x86 selftests (attempt #2).  Like the previous attempt, I skipped
the compile-time assertions.

[1/9] KVM: selftests: Fix mostly theoretical leak of VM's binary stats FD
      https://github.com/kvm-x86/linux/commit/fd546aba1967
[2/9] KVM: selftests: Close VM's binary stats FD when releasing VM
      https://github.com/kvm-x86/linux/commit/f7f232a01f3d
[3/9] KVM: selftests: Assert that __vm_get_stat() actually finds a stat
      https://github.com/kvm-x86/linux/commit/eead13d493af
[4/9] KVM: selftests: Macrofy vm_get_stat() to auto-generate stat name string
      https://github.com/kvm-x86/linux/commit/b0c3f5df9291
[5/9] KVM: selftests: Add struct and helpers to wrap binary stats cache
      https://github.com/kvm-x86/linux/commit/e65faf71bd54
[6/9] KVM: selftests: Get VM's binary stats FD when opening VM
      https://github.com/kvm-x86/linux/commit/ea7179f99514
[7/9] KVM: selftests: Adjust number of files rlimit for all "standard" VMs
      https://github.com/kvm-x86/linux/commit/9b56532b8a59
[8/9] KVM: selftests: Add infrastructure for getting vCPU binary stats
      https://github.com/kvm-x86/linux/commit/16fc7cb406a5
[9/9] KVM: selftests: Add compile-time assertions to guard against stats typos
      (no commit info)

--
https://github.com/kvm-x86/linux/tree/next

