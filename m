Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10484C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 19:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/DTlY3pk3a6G5GXzvpYerG+E5kgBFJPd3Pov9X0qd0=; b=htb/m7ye0w4N2p4N/AXlS0tmHy
	6pndBAI5PT8WqyC0aaUkzitPOiutdV25JiYMlmAuCKrlJs/SZNTa5AYbQUtQ2xw9aQr4NjT/7RRKQ
	sI/PJfTWR5fM2615UjMoui+YLl+UKZYLeCxU2TTsGwAfzDDDgQQgIDSnmUs3V1Q/I/UPq/NFn1AQ5
	d4OGf74zTFDxI2IzlFDmsFAiLDHiuLu55Pop11vzldlMmhpjhxgvJdr0fT4FSVzXVNZiDSvCuNobt
	ASNiGmVbRWUvsGypxfYiO7fn8KTGRhhUIpgQxs4FNN+1n6Fid8WXEP1IiyzNiJQHNyqruyxe4ZUPy
	BrV+tNsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0y9-0000000FyKg-2V9x;
	Fri, 14 Feb 2025 19:03:21 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0OD-0000000Frx9-2Kkr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 18:26:14 +0000
Received: by mail-qv1-xf35.google.com with SMTP id 6a1803df08f44-6df83fd01cbso11892846d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Feb 2025 10:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739557571; x=1740162371; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/DTlY3pk3a6G5GXzvpYerG+E5kgBFJPd3Pov9X0qd0=;
        b=MK9ZY7Q4n81uFZ9uAqEwfohQiG6/NulIbBqE0nrCqRVohV+LmNRkcUC+se6MQta/nJ
         IKb9ocF2M3heI/glSrhRQ65WT/ggrY05AxMoukECvXeweSvyeQKF8V2OxGzMqdyfbwoQ
         KFTz0TeUr1pdvS609cMqFayot7/Hba0/wxSxuBYR2+pLbOOczArfHB5mbMdqkYPGV0Ku
         hiQLU+hzxSMq9d+jXHYGzAIKje3P3+LPQHiKXN85Nd34Q7wZ02UoLp/sKe0zYQn3ys5h
         mkVNb11FknwPzYlQrRZq99tX9ARpqxxHnNOxKUohGeXZbRj5LKVZR9vCVmSLWHdszZRq
         wFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739557571; x=1740162371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/DTlY3pk3a6G5GXzvpYerG+E5kgBFJPd3Pov9X0qd0=;
        b=IuoHMLVhVNtoYhG3aWXsg/Qdn/OPFnqFnweLpR1B+WY/x1GYH6YcacY0FQAYy7Sj34
         ZY2oaX6KbSK96UEqNVbm2S3crBUAwslyQnvvoQ3D9aaWlSTxIfTCuJOda0LjL/pDaH1G
         tqBpdi0FyFS+px6OSkXfAjYKpJKLQX6gXOT8nrG2wqqHbzX1lcc57RQg51fH68Q8Mfb/
         i371a+1g8R1cvMQGxUkvvDIAKqDie5cqLCtlPYTyeajW1JY4ikQy6EW0fPyNiULzCrz7
         IyI8WriAozEH/ZGV1fDYWbKwKz0yDH0FzismtlGF95rKUb7aeEwpne3Usi1juiCcpq+H
         WJMQ==
X-Forwarded-Encrypted: i=1; AJvYcCW49ybBhWLQLav88rJ/47j76mkm498jZGXED4B7CNV+YrTPa1cs1Hc0VuSVrBkIsdySPSrLkCIEPrF2GAQ1u5z0@lists.infradead.org
X-Gm-Message-State: AOJu0YxHS8r9Yn4LJYeakolsWyvDZ6qL0YL+aTHJYtOCo/OpLgoL7X58
	kvWfsw87odRVksaOtaWWXik7/cm6GlNFnVBQaLYJbPKVzDMfnOuFTo0ApT3upWRq7H869VhVd85
	UbHFSF7PlF7jIu5KxWAUudJm57QiYxjBuhBc1
X-Gm-Gg: ASbGncviRofmlxgmCJyOaXbdAuTZ/Ym49vuepYM8SS5jB9ZK7NjETjTyZzq7Ttb41QO
	AM5KUKGc5gU8n6X1vzS9bvyTpNLoWk0ourrUnU0CWZQTBkfwPp/JrtkadNJmPc24gVwx5OThOOg
	==
X-Google-Smtp-Source: AGHT+IGahO+EoJpVHDz9mbFwHtAtBgh2jW//CnO6047oFzoeAKzVdEu897lF5sKUl3q6+qKe1aK2ZHZslrcLAQtD1ro=
X-Received: by 2002:ad4:5e8d:0:b0:6e6:5d61:4f01 with SMTP id
 6a1803df08f44-6e66ccb10aamr4166886d6.8.1739557571225; Fri, 14 Feb 2025
 10:26:11 -0800 (PST)
MIME-Version: 1.0
References: <20250212182558.2865232-1-maz@kernel.org> <Z618Rd__s7g8xWNP@linux.dev>
 <CAG_fn=VYXBce+0S7=ZuggNKvn4-b7awWVtq4v9B14U9ivRimkw@mail.gmail.com>
In-Reply-To: <CAG_fn=VYXBce+0S7=ZuggNKvn4-b7awWVtq4v9B14U9ivRimkw@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 14 Feb 2025 19:25:34 +0100
X-Gm-Features: AWEUYZkxugIvEIapXiq7ONrYCsVBhyQwzdKS6SZSHOx5KJD3E1IzJKN9kjxUoow
Message-ID: <CAG_fn=W0_ra0waM4ur-ADmaNqHC1JXP--sp3eaP3xivgsdfxuA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] KVM: arm64: Assorted vgic fixes for 6.14
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_102613_594219_15E25FE4 
X-CRM114-Status: GOOD (  21.29  )
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

On Thu, Feb 13, 2025 at 11:29=E2=80=AFAM Alexander Potapenko <glider@google=
.com> wrote:
>
> On Thu, Feb 13, 2025 at 5:59=E2=80=AFAM Oliver Upton <oliver.upton@linux.=
dev> wrote:
> >
> > On Wed, Feb 12, 2025 at 06:25:56PM +0000, Marc Zyngier wrote:
> > > Alexander, while fuzzing KVM/arm64, found an annoying set of problems=
,
> > > all stemming from the fact that the vgic can be initialised or
> > > destroyed in parallel with the rest of the guest still being live.
> > >
> > > Yes, this is annoying.
> > >
> > > This second version takes a different approach at the problem,
> > > plugging the glaring hole we have between vgic creation and private
> > > interrupt allocation.
> > >
> > > Although this is more invasive, I'm more confident about this one tha=
n
> > > the initial version I posted a week ago.
> >
> > Much better place now! Here's to the next pile of syzkaller bugs :)
> >
> > Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
> >
> > > Alex, I'd very much appreciate your testing on this.
> >
> > I too would like to see the tires kicked before we pick this up, if it
> > isn't too much trouble Alex.
>
> I am on it, will report back today or tomorrow.

I am seeing the following crashes, do you think these could be related
to your changes?

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
BUG: KASAN: null-ptr-deref in _raw_spin_lock_irqsave+0xa8/0x174
include/linux/instrumented.h:96
Write of size 4 at addr 0000000000000d20 by task syz.3.8387/5166

CPU: 1 UID: 0 PID: 5166 Comm: syz.3.8387 Not tainted
6.14.0-rc2-00002-g4b305a8c5b85 #159
Hardware name: linux,dummy-virt (DT)
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:466 (C)
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x94/0xc0 lib/dump_stack.c:120
 print_report+0xf8/0x7d4 mm/kasan/report.c:492
 kasan_report+0xcc/0x128 mm/kasan/report.c:602
 kasan_check_range+0x264/0x2a4
 __kasan_check_write+0x20/0x30 mm/kasan/shadow.c:37
 _raw_spin_lock_irqsave+0xa8/0x174 include/linux/instrumented.h:96
 kvm_vgic_set_owner+0x15c/0x23c arch/arm64/kvm/vgic/vgic.c:611
 kvm_timer_enable+0x174/0x5b0 arch/arm64/kvm/arch_timer.c:1574
 kvm_arch_vcpu_run_pid_change+0x184/0x28c arch/arm64/kvm/arm.c:824
 kvm_vcpu_ioctl+0xa94/0xba8 virt/kvm/kvm_main.c:4366
 __do_sys_ioctl fs/ioctl.c:51 [inline]
...

