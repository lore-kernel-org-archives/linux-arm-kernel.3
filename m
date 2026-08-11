Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44736C5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 19:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+uiiP5F3lsr2NVoL/RaZc+Y6YQhERqKSQ2XX6+ZpE3I=; b=1sZXx0Ia9ELOBnKyTqD8c8QG5T
	LeR2RIIujrWA0r604l93ti+cC6qfYSdUgc+PjzUVvF90/WUwIl+oAJsBKWV9tW1TylbAk3QtglqO8
	o9Tcmkt2U5kaQ6cohTdxUS+bMFa+tvkBeP1Xuhhm5y5AazN/rpj6bfPF+BYrtNuSl9AV1frx6pV/K
	6iXE1kMJPceM0BrK+ZBmtZW+l0xtJ7E2MKw1Q3Rc5d3KFqx1Vml4FIxHSa1OkGiEWEH8G68gVP4P+
	g+bGEw6ivp6vyks2ajSSqf4IVJwEx1A8v9xN3oJ4Qbc6Ua00nRVrdFGFmJkwBQbuI7oRojL97RlZe
	zmhDablA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wts0K-0000000Ep9H-4701;
	Tue, 11 Aug 2026 19:19:16 +0000
Received: from mail-ed1-x548.google.com ([2a00:1450:4864:20::548])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wts0I-0000000Ep8W-0jHx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 19:19:15 +0000
Received: by mail-ed1-x548.google.com with SMTP id 4fb4d7f45d1cf-698a99b6140so145404a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 12:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786475952; x=1787080752; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+uiiP5F3lsr2NVoL/RaZc+Y6YQhERqKSQ2XX6+ZpE3I=;
        b=Zif3tXPSG+H548JePD2EBzknfBKPPATMTClivWUNk2cju1ebs+f/aI4ysOihWTL0Xy
         FXoB+VBAoW5gPMT6D5lThobfC0wnFa8UKggXIY810VPpefLF4MRKbpHcHkysqt+WPHvT
         9K7ysT+++s8w1GxIv8Qy9aywsB4+DgtNkktnKLShkwsK3E73pls7SYwASmHvL5COqC/6
         jJzQEsmx9wMPTz3qnKD0sO64XxP9MiCUYu+UUZVkmk4kiAzaed7kRVIMUUgWjqCC+w7M
         Q+sikMS7ijsEtC6GxofJmgOOyqi/2xrORmOPUINAab5iQJOf6DSrupv3wufIQm7kh35O
         NnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786475952; x=1787080752;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+uiiP5F3lsr2NVoL/RaZc+Y6YQhERqKSQ2XX6+ZpE3I=;
        b=CvPkNCYgXW4w13Mw/Joq/Kn/BCyDq21k7uObZYqpHpLPee+GMn3V+ita41Gm5jEm5O
         EfMton2ofE4xPVCy28clH9HoEVAkRBNp+JRvXRA6OIkTo+V+oE8Fdc/b1SUKJaYQjnMi
         LQiJbQP3+1D27jMSiQZpjOD6pirTtKwv3yTI/triuNhmItwCcNYNphTwYBwr8q/Ri8lE
         HohJuS7Kieg0Mr8HUmlvkP/X+Z2DsIlUKdHNoVQZig0vAwqA0/XmeuKX6+tiEucdQINJ
         sE6k+GGvJpWOMYCqaG2TbFoDj0qqTTRVyTqq72+dX9KzGgcpBzSDBYJMhg7lPnLIY/Z8
         qVWQ==
X-Gm-Message-State: AOJu0Yy+/WZGBjCTygT2FdQoajes0CqfbMbT9YiUhIxzKdrkAUTDpKAU
	ushZKevum27cTI4+4EBp59dkDOGSBaYVymar6WXOkWwRK2EKRrEJRmQx6VFGjfZOcDEpWxHxKKS
	FfEH8SNBLGKL943gjtg==
X-Received: from edt14.prod.google.com ([2002:a05:6402:454e:b0:6a0:4d21:a35e])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:458e:b0:6a0:c763:89e5 with SMTP id 4fb4d7f45d1cf-6a36c890c5dmr1312878a12.19.1786475951534;
 Tue, 11 Aug 2026 12:19:11 -0700 (PDT)
Date: Tue, 11 Aug 2026 19:19:11 +0000
Mime-Version: 1.0
Message-ID: <9huzldaczcr4.fsf@tarunix.c.googlers.com>
Subject: QNS: ARM64: Cache coherency while doing Kexec for KHO
From: tarunsahu@google.com
To: Pasha Tatashin <pasha.tatashin@soleen.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, will@kernel.org, changyuanl@google.com, 
	Alexander Graf <graf@amazon.com>, mark.rutland@arm.com, jgg@nvidia.com
Cc: linux-arm-kernel@lists.infradead.org, kexec@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_121914_222167_7330D58E 
X-CRM114-Status: UNSURE (   7.51  )
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


Hi,

I have a question regarding cache maintenance for Kernel Handover (KHO)
preserved memory across kexec reboots on arm64.

During kexec, all other CPUs gets hot-unplugged where they flush all
of their caches so there will be no issues with any KHO data preserved
having caches on these CPUs.

But CPU0 still has not been flushed its D-cache (Is this correct?) and
it will only do flushing for specific area by kexec_segment_flush().

So for KHO preserved memory, if its caches still marked dirty on CPU0
they will not be flushed?

Is my understanding correct? or AM I missing something?
Also if this true, This will be a problem?

PS: Pardon my less knowledge on ARM64 cache coherency.

~Tarun

