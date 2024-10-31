Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CDAD767FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 19:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HDryuS3JwdKmtkDt/QNqzIISsjjDc6tSvCEk4zlonUE=; b=qCvzN6FddtrfDu8G3nTtshBblD
	7j4Hxcg0y02DwVVOrqEwtX/kqhMauDeWk/r5IBQi7wTd/7N5DjEuuvSouhFSYM2cuSUr2jKcexv1K
	ftFEhqDQHYa2RdGjcSYnNenLLGY8tHDhDvkT7itM6c+4PLi1FUOIV5hdzpuZfRqe8TSjNUa55DD+m
	B5v9X7Z3bKtZ55BzTCeONgKax04erjQrT7NIOeUjAFm3m+0lGs+wCz4NKgLQDrM5uHYBd/yVs1lsr
	mk93l+qUgjOgoVX0SxMdYU5zsymXoN8aQjLAeu4fQSkU3jAhBeDGalWBmyNhHA7NreW3LFBnBJYvu
	Udf5/CBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6bGw-00000004hhQ-3DOq;
	Thu, 31 Oct 2024 19:55:58 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6bEf-00000004h2S-1pq1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 19:53:38 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-7ee4e642954so623084a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 12:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730404415; x=1731009215; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HDryuS3JwdKmtkDt/QNqzIISsjjDc6tSvCEk4zlonUE=;
        b=oXE7QT8urVM2GWNyaiR013AjpLY5Iy/+3UH2iJY0M8Z+u4ZMREN9b+2MBpkzr2P4jg
         Cx+SrAcpkLtwadKfu8FNNAaWbdCstiqhEaYgarVTm6O+yLP9QvaqxneFTfINtVm1ynvj
         +4/xohA2TwOHIP3lD0DMD+ScMe1IzWbIao+4BAbXqF0xIYX9HIYhTR99YYrUW5kvo0Ws
         zHjJSt+PeWf49x8Xuq/63qT48mNlWRG6WpzoJEIFni2U0Cd/Noxf7034y6kYl9/DAqg7
         YZsCJ6syF+Au504RMpVefkEaCzd4RzkbxRa1cNAYbo5xDdWX2v8KxjnWgKOIj0jUrX1W
         fNjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730404415; x=1731009215;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HDryuS3JwdKmtkDt/QNqzIISsjjDc6tSvCEk4zlonUE=;
        b=gETcoqsv4FRHycKcLNMIjMiMMJA31MB9Jyp8G9s+kpW/wbYsZtlVMqgXVRyi9FyjQD
         2RmcDAe5uYFKZ0jnjBXBjBHA/vB0zgea5UbzLmsdR6jnhZp6oD6hkgMfePTg+o3DlK/I
         ujL2Na9viWUarLeqO9PUJGfphKeR9NHE6gKIQ+wqaXvaPoiN6XAD7/Dl/k7e1FEsaHHP
         6KUGxSF85oSTBoi4PNmMDcgU27OoahbvIgpD64BnyNZonjuzcn8GEicRuPaX2d8k2CvB
         nkJ0TA7FeSphO3vmQFmOMm8qI48zZRFEhir1yU89c0UlfuljY2AKLZ/6p/K/bZDo0Q7q
         53ug==
X-Gm-Message-State: AOJu0YzZNIhKZ4BzbwHnCcalc4LOeSY9P/I8vUmpuZ7n0iFBZPNffn95
	NZodL/I7myL0w5AGrVruknDH/9kryzADYPSZxs4terU2vB+rvKVyBigeVbn3neqQLoetVHDhdDi
	rwg==
X-Google-Smtp-Source: AGHT+IEYQskIydQ17rOCvnDIIztIPwEtV42Xo/Yb7l4NrEHNVvMPUaIF0Ogt4/xaQ903hVU90IvPM22EQH4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a63:385c:0:b0:7ea:999a:7930 with SMTP id
 41be03b00d2f7-7edd7b6c7e8mr28419a12.1.1730404414918; Thu, 31 Oct 2024
 12:53:34 -0700 (PDT)
Date: Thu, 31 Oct 2024 12:51:29 -0700
In-Reply-To: <20240802200136.329973-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240802200136.329973-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <173039527102.1510350.14562788857137656763.b4-ty@google.com>
Subject: Re: [PATCH 0/2] KVM: Protect vCPU's PID with a rwlock
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Steve Rutherford <srutherford@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_125337_513942_145131C8 
X-CRM114-Status: GOOD (  12.64  )
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

On Fri, 02 Aug 2024 13:01:34 -0700, Sean Christopherson wrote:
> Protect vcpu->pid with a rwlock instead of RCU, so that running a vCPU
> with a different task doesn't require a full RCU synchronization, which
> can introduce a non-trivial amount of jitter, especially on large systems.
> 
> I've had this mini-series sitting around for ~2 years, pretty much as-is.
> I could have sworn past me thought there was a flaw in using a rwlock, and
> so I never posted it, but for the life of me I can't think of any issues.
> 
> [...]

Applied to kvm-x86 generic, with a comment explaining the vcpu->mutex is the
true protector of vcpu->pid.

Oliver, I didn't add the requested lockdep notification, I really want to make
that a separate discussion:

https://lore.kernel.org/all/20241009150455.1057573-7-seanjc@google.com

[1/2] KVM: Return '0' directly when there's no task to yield to
      https://github.com/kvm-x86/linux/commit/6cf9ef23d942
[2/2] KVM: Protect vCPU's "last run PID" with rwlock, not RCU
      https://github.com/kvm-x86/linux/commit/3e7f43188ee2

--
https://github.com/kvm-x86/linux/tree/next

