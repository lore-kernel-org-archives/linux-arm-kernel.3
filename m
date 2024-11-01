Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF860E6F06D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 16:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G7C7udYDSGtBe+UDNEgx3LKkpcEb5Jn+SrINvorUJ5I=; b=V3bGOrCd8sfS8lwCngdGtO57P5
	Ysicd4m2S3PfkxB3v/1Cp+bfg1u/VjaITVU23NodZOQFiFrAantDTDT/x3KVo1QKQ2ay7sfEs+ovq
	Q1IIq5lD/V8Afer2vSPiahmEF6rw1J6bj3E32k/9ZZLW/bNIYgoq/VUQO2q8Cg8A/5cTZQ2w6VPms
	hs1o0ucAhiMwgriVwGobCN7Pr4SoaJOcZcfxTH1ce18aluN6JiCdE5ji6REXu50MXV4Bl0t85yo2B
	LDUSmFVyEnLxJcN74AerfrGYbFYvuwANJLGbuu+wWc8oJv7kvVRFrueLZe5cnO57d9AhsJPzDOHsO
	0OJLI8GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6uEX-00000007cDU-1Pbz;
	Fri, 01 Nov 2024 16:10:45 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6u3T-00000007aDh-0qzS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 15:59:20 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-7eb07db7812so1715102a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 01 Nov 2024 08:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730476758; x=1731081558; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G7C7udYDSGtBe+UDNEgx3LKkpcEb5Jn+SrINvorUJ5I=;
        b=m3TcefzbesGW30OI89zAMEffCOZGbBN80Pwb1JfXdNSfTSKWrezq5CHe5sPoABKW3k
         Q5WDw9HjQuUI1f9T+KFZRixj8508c7ilzE3zdxc7Bv1TbYCtOAK1lRYQgNQPnmmdhcjn
         DrTFWB6/gMlpjQ4mH/kLAtom6AZiscNboKgevN8JYRl5u8Jp4ZwqFuTEwcp5b38S2zce
         F0c0cpatP6UP6Cnufj0BYY2rrjwXgMnLTI1DqxlbGhrVOqGJIAkvOTNh6/pSNN5xoG/W
         z/QmV8g9tlk02+0EuBk7uCFe3/OH/e21ChVpZxyH6C7BEIxbp1ARFkq0Lebpz9sfECA4
         z9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730476758; x=1731081558;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G7C7udYDSGtBe+UDNEgx3LKkpcEb5Jn+SrINvorUJ5I=;
        b=liz1hMiVE5TxPHtC8KDLk87zU/cTqbQtyZghpbBxFqTGIM3bG91b9sz0D0PVQfoD8U
         dMkVs1Gu21mgErJLUF+A8ZDl12iHiMY6a9JdsHuUz+3qGb8/we2vp9RYYTaHNGwVk7i2
         WnMwjiPE5SAJkqFP2ZshyDhoZrprSMP+RVDCJAia05TT1gLCR5ZPSDJIzSr94I4qRVvN
         +SJWdxRQAWl86McbIe856xmqhe7ka5y3C2BPcU5lJv7Kqo2W/cIeDALE9geWWVbXCB4P
         YKJWcu2/FoHT7jHKdosLrI1bApKTfWmUoctLRgLETHLR0ULs/Fy/HtIeYMrF+Y5cHDbB
         WYbg==
X-Forwarded-Encrypted: i=1; AJvYcCXABqcQLaJ6hvggzllml9L/8f3aS3o9Qcf4EuHoalpfGz9F6MuhhRvZc0b5uXFUuOeM9iqmfXEfvsbySgWAxz6N@lists.infradead.org
X-Gm-Message-State: AOJu0YzX4fLyWad3HlnHJjGDHCXthquRTYZxZJwGSdYxXY+uEj54Yyzz
	93CYCdOnuDjgbfPwW0sml0TyWNqx9JFHe+S/+/SND9L4qnc5vLwqdOwBI6ISpj8atG9psK8jpQJ
	4lg==
X-Google-Smtp-Source: AGHT+IHdP6G2fJCdE/LEn9b4GNy3yTcluEwmDEOjmuidoXhD2Yg5GyJmi1fYyuRyUM0NRBeCXSVah99A4Vc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a63:5658:0:b0:7ea:d01a:e37a with SMTP id
 41be03b00d2f7-7ee44becc77mr9923a12.4.1730476757639; Fri, 01 Nov 2024 08:59:17
 -0700 (PDT)
Date: Fri, 1 Nov 2024 08:59:16 -0700
In-Reply-To: <ZyT2CB6zodtbWEI9@linux.dev>
Mime-Version: 1.0
References: <20241009154953.1073471-1-seanjc@google.com> <20241009154953.1073471-4-seanjc@google.com>
 <39ea24d8-9dae-447a-ae37-e65878c3806f@sirena.org.uk> <ZyTpwwm0s89iU9Pk@google.com>
 <ZyT2CB6zodtbWEI9@linux.dev>
Message-ID: <ZyT61FF0-g8gKZfc@google.com>
Subject: Re: [PATCH v3 03/14] KVM: selftests: Return a value from
 vcpu_get_reg() instead of using an out-param
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Andrew Jones <ajones@ventanamicro.com>, James Houghton <jthoughton@google.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, linux-next@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_085919_255431_7D11D55A 
X-CRM114-Status: GOOD (  31.11  )
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

On Fri, Nov 01, 2024, Oliver Upton wrote:
> Hey,
>=20
> On Fri, Nov 01, 2024 at 07:48:00AM -0700, Sean Christopherson wrote:
> > On Fri, Nov 01, 2024, Mark Brown wrote:
> > > On Wed, Oct 09, 2024 at 08:49:42AM -0700, Sean Christopherson wrote:
> > > > Return a uint64_t from vcpu_get_reg() instead of having the caller =
provide
> > > > a pointer to storage, as none of the vcpu_get_reg() usage in KVM se=
lftests
> > > > accesses a register larger than 64 bits, and vcpu_set_reg() only ac=
cepts a
> > > > 64-bit value.  If a use case comes along that needs to get a regist=
er that
> > > > is larger than 64 bits, then a utility can be added to assert succe=
ss and
> > > > take a void pointer, but until then, forcing an out param yields ug=
ly code
> > > > and prevents feeding the output of vcpu_get_reg() into vcpu_set_reg=
().
> > >=20
> > > This commit, which is in today's -next as 5c6c7b71a45c9c, breaks the
> > > build on arm64:
> > >=20
> > > aarch64/psci_test.c: In function =E2=80=98host_test_system_off2=E2=80=
=99:
> > > aarch64/psci_test.c:247:9: error: too many arguments to function =E2=
=80=98vcpu_get_reg=E2=80=99
> > >   247 |         vcpu_get_reg(target, KVM_REG_ARM_PSCI_VERSION, &psci_=
version);
> > >       |         ^~~~~~~~~~~~
> > > In file included from aarch64/psci_test.c:18:
> > > include/kvm_util.h:705:24: note: declared here
> > >   705 | static inline uint64_t vcpu_get_reg(struct kvm_vcpu *vcpu, ui=
nt64_t id)
> > >       |                        ^~~~~~~~~~~~
> > > At top level:
> > > cc1: note: unrecognized command-line option =E2=80=98-Wno-gnu-variabl=
e-sized-type-not-at
> > > -end=E2=80=99 may have been intended to silence earlier diagnostics
> > >=20
> > > since the updates done to that file did not take account of 72be5aa6b=
e4
> > > ("KVM: selftests: Add test for PSCI SYSTEM_OFF2") which has been merg=
ed
> > > in the kvm-arm64 tree.
> >=20
> > Bugger.  In hindsight, it's obvious that of course arch selftests would=
 add usage
> > of vcpu_get_reg().
> >=20
> > Unless someone has a better idea, I'll drop the series from kvm-x86, po=
st a new
> > version that applies on linux-next, and then re-apply the series just b=
efore the
> > v6.13 merge window (rinse and repeat as needed if more vcpu_get_reg() u=
sers come
> > along).
>=20
> Can you instead just push out a topic branch and let the affected
> maintainers deal with it? This is the usual way we handle conflicts
> between trees...

That'd work too, but as you note below, doing that now throws a wrench in t=
hings
because essentially all arch maintainers would need merge that topic branch=
,
otherwise linux-next would end up in the same state.

> > That would be a good oppurtunity to do the $(ARCH) directory switch[*] =
too, e.g.
> > have a "selftests_late" or whatever topic branch.
>=20
> The right time to do KVM-wide changes (even selftests) is *early* in the
> development cycle, not last minute. It gives us plenty of time to iron ou=
t
> the wrinkles.

Yeah, that was the original plan, then the stupid strict aliasing bug happe=
ned,
and I honestly forgot the vcpu_get_reg() changes would need to be consumed =
by
other architectures.

Other than letting me forget about this mess a few weeks earlier, there's n=
o
good reason to force this into 6.13.  So, I'll drop the series from 6.13, p=
ost
new versions of the this and the $(ARCH) series just before the merge windo=
w,
and then either send a pull request to Paolo for 6.14 as soon as the 6.13 m=
erge
window closes, or ask/bribe Paolo to apply everything directly.

