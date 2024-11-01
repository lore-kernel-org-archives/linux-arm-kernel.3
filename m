Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC741E6F064
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 14:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/DE0DbUg8M7Q/DJxS90r+0tog95n4HSr4HfODo/BC0=; b=ZSMhCVRR+LQKCoUo5YDvsT0Ac2
	xunEvcc5XREflbnXSUKvwM2+7yJFO3i2MHRil4LlouhsRPVf1XlH9nkId7s++FPIcLvwMwYuQQIZu
	uWK1IfrKsUgnlRawHkX2Fi71CHCGJIgIXsugMfsxjTb2C++dwnTf89xSqMJDs1OjmO2pJ0s9LCFWQ
	Pgpm2mNinWZkVauzHds7cPSKmwv0h7Wcz5ZLy9e07EBNWeFikXxYhSbe9mpUgJl+5liUaKZtGawr/
	rLNw21P9aydJz/Cu0fUE7AeFEBnMjKC6t1mBeja0lijlxY3AyA9DVvqGdEdL6acjf/x6KChp9sLPN
	iF/rIaDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6szQ-00000007Oul-3CX4;
	Fri, 01 Nov 2024 14:51:04 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6swV-00000007OHk-3YYC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 14:48:05 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-7eb0a32fc5aso1949244a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 07:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730472482; x=1731077282; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G/DE0DbUg8M7Q/DJxS90r+0tog95n4HSr4HfODo/BC0=;
        b=uIfBkFwPo7Pm7HapRUguHhvH1e/htc6TBMkyypFvi4J1TiCz+ylRdncdkmMkzr7794
         FT4HpJmhWuWNyXd1+7nqQq48PWZw70MMmQE9Byyg55skmXxwZLTsTwXjogdkI7yitiyR
         v8vcX18bOkLYwNhJ6hDrjuoS7uRSuVAsSmo5lOazEGOOys2I+jC4uIh2W3i30C9/XkmW
         fRStryX3V356K4WSpKc3YGfmHhH7oPCywyjjqVPH84EjqGnAcEmM6XHaZb43e+w/h0ju
         5B07WRi4aVWR2Yxh3PPemjkZ+Vxb3RzmavepWb8i2J3ybbwdjEOXx5LhqxwgWOflUHMp
         Y9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730472482; x=1731077282;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G/DE0DbUg8M7Q/DJxS90r+0tog95n4HSr4HfODo/BC0=;
        b=W3TpHKoQmwfFr4QebFuX48uA38j4wvp7St4A0BWtMiIunyZczYaU6z1hDGMXzYB8gN
         67Lxgxzjsjo/604MO1uYnd5SRkVaVeE0ZaO/PWTHH91X76s4XiGVe4RZUoRaJE9BhG13
         JawTBYEWMG0ptU8nFlpnYAjmZ5+pwIaXOxvwK6PjhckbVZnppq/mfzJPh/ajqSzrChTM
         cq6uU1bjJYTi3xu2ain4HHJ/hGyqpQcJiOX/qR0+pC8milmCBLeDe3hYpF8Uef3EEgFW
         VaMyV8C+8rUrGg1iaf7RWiyk+dI7QdDAIC0uYUltF3ofGLOivEAmu/lz7n13dNzXtN3A
         rTKA==
X-Forwarded-Encrypted: i=1; AJvYcCVxdENwjM9dNRa55GG/aWsC9leFw2IEm8eUSQucD3+4n3hJRH3VnQwzU/oHGvRBhNG+RAPR9XIFon9M59DcvQYe@lists.infradead.org
X-Gm-Message-State: AOJu0YzAxBrt2vgY9t5Z+vNptE68E9zcPW3gaU/4PhZhsieOrbJHenk8
	Z/4/UPhMZiMT6E1A8aZgpn+15C2Eep/EVAcssNALiFCUyUrf+7rBW4VxwcXYcflEU4JigL1CC9N
	ycg==
X-Google-Smtp-Source: AGHT+IHIf47dwb0nbkXT8QGaJrWq+fHjP6RSYp5sBCxZxmiVg/IHgboRnjvSBKMyLIM+q34Z1vnYxW9f4KA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a63:fa55:0:b0:7ea:83fc:1f0c with SMTP id
 41be03b00d2f7-7edd7c3149dmr31512a12.5.1730472481723; Fri, 01 Nov 2024
 07:48:01 -0700 (PDT)
Date: Fri, 1 Nov 2024 07:48:00 -0700
In-Reply-To: <39ea24d8-9dae-447a-ae37-e65878c3806f@sirena.org.uk>
Mime-Version: 1.0
References: <20241009154953.1073471-1-seanjc@google.com> <20241009154953.1073471-4-seanjc@google.com>
 <39ea24d8-9dae-447a-ae37-e65878c3806f@sirena.org.uk>
Message-ID: <ZyTpwwm0s89iU9Pk@google.com>
Subject: Re: [PATCH v3 03/14] KVM: selftests: Return a value from
 vcpu_get_reg() instead of using an out-param
From: Sean Christopherson <seanjc@google.com>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, James Houghton <jthoughton@google.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, linux-next@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_074803_925547_34FE6463 
X-CRM114-Status: GOOD (  20.03  )
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

On Fri, Nov 01, 2024, Mark Brown wrote:
> On Wed, Oct 09, 2024 at 08:49:42AM -0700, Sean Christopherson wrote:
> > Return a uint64_t from vcpu_get_reg() instead of having the caller prov=
ide
> > a pointer to storage, as none of the vcpu_get_reg() usage in KVM selfte=
sts
> > accesses a register larger than 64 bits, and vcpu_set_reg() only accept=
s a
> > 64-bit value.  If a use case comes along that needs to get a register t=
hat
> > is larger than 64 bits, then a utility can be added to assert success a=
nd
> > take a void pointer, but until then, forcing an out param yields ugly c=
ode
> > and prevents feeding the output of vcpu_get_reg() into vcpu_set_reg().
>=20
> This commit, which is in today's -next as 5c6c7b71a45c9c, breaks the
> build on arm64:
>=20
> aarch64/psci_test.c: In function =E2=80=98host_test_system_off2=E2=80=99:
> aarch64/psci_test.c:247:9: error: too many arguments to function =E2=80=
=98vcpu_get_reg=E2=80=99
>   247 |         vcpu_get_reg(target, KVM_REG_ARM_PSCI_VERSION, &psci_vers=
ion);
>       |         ^~~~~~~~~~~~
> In file included from aarch64/psci_test.c:18:
> include/kvm_util.h:705:24: note: declared here
>   705 | static inline uint64_t vcpu_get_reg(struct kvm_vcpu *vcpu, uint64=
_t id)
>       |                        ^~~~~~~~~~~~
> At top level:
> cc1: note: unrecognized command-line option =E2=80=98-Wno-gnu-variable-si=
zed-type-not-at
> -end=E2=80=99 may have been intended to silence earlier diagnostics
>=20
> since the updates done to that file did not take account of 72be5aa6be4
> ("KVM: selftests: Add test for PSCI SYSTEM_OFF2") which has been merged
> in the kvm-arm64 tree.

Bugger.  In hindsight, it's obvious that of course arch selftests would add=
 usage
of vcpu_get_reg().

Unless someone has a better idea, I'll drop the series from kvm-x86, post a=
 new
version that applies on linux-next, and then re-apply the series just befor=
e the
v6.13 merge window (rinse and repeat as needed if more vcpu_get_reg() users=
 come
along).

That would be a good oppurtunity to do the $(ARCH) directory switch[*] too,=
 e.g.
have a "selftests_late" or whatever topic branch.

Sorry for the pain Mark, you've been playing janitor for us too much lately=
.

[*] https://lore.kernel.org/all/20240826190116.145945-1-seanjc@google.com

