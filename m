Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E8AC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 02:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30Xr3GjHx9JM48k5qZe/WnzL0VPEvAcLel6Lrxu+plE=; b=kSbY5Uy34cgiP6Edc/XXFjgjxC
	En5iwetJsOG3RK4sNREs4g2wAPjJ0tASLF+HP75IAMHUuPNP8Gnf4wVSW+DTlW4GSSQe7pJUzztjH
	wROsCCAOMRXoM9NokUhRsEkaN+VcE0Cc3o4/t8pHBs+bLvjc/+htwte0x2Lo5Y7XW/jK6AlLpKe9/
	jLi06mo0/+R05qlMDIq+WnJaK0nVqUL5pw/qPrYAgXL5mqBIxE93NNB/7Yuzw0MyJ/Vh4zYXzn52F
	hvlM/3PyyIuU3+AHgi0HmWj/fWoh8RNdH5vkWDCbiMuEaK+0IT+m73hwuAHDTir70ujFzaHQyV43E
	7H2vhDtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uami2-0000000HHNH-09cI;
	Sun, 13 Jul 2025 02:44:58 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uamfd-0000000HHFy-1vEa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Jul 2025 02:42:30 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-45390dcca6dso31365e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 12 Jul 2025 19:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752374546; x=1752979346; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30Xr3GjHx9JM48k5qZe/WnzL0VPEvAcLel6Lrxu+plE=;
        b=VD+mLuHhDhQHB/hggx0OuYnk9tG5A73R7FcMyxCG0yLzBO/nJukBakZVwlLzrS2xBV
         Xk3mPvzUcG+595Ilgqbpxgd/kWI1HkGYDsstVuKHksHb/Ej1jNzgCg8XmyGuSH3ZXQRQ
         U67Q5J/xMJ3K8MWgt2qsPO4rsxeGDjUhmDsMWl+fn/PZqtvb5RaENEeSn0KrYDdVTEqX
         xlLU+C/dJ3bebk/FC32V1QuGysM3prgAE24skDp/NXOgXbQSFezq6wqaDzo1DRPw+O0k
         0oT5WzWOooNyOQaPZBE6ZFrpgvy0s5F5HmSamNSvgIpZL3PXPmtwx8xDt3IJs5lNxClT
         Zxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752374546; x=1752979346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30Xr3GjHx9JM48k5qZe/WnzL0VPEvAcLel6Lrxu+plE=;
        b=UqrdLjGvqnakAw/0eSu+gPjGyPbRYX/SkTU+wKRHDUWULpMw6fXVuJJjUDP2t956fw
         8yp5+BTbaUsPLeiI0X8lLb55KjlUs1LHHN+TfNVUqfCOsFVPGTscrye73SEMJiLHIRE3
         fe+HnUnkgPWPFU6Je0kuUaNFy0nn9NZ73sY2H+ExQPsGguDqVtbL3giuYgZ6V0LaEhxR
         UpTPhjH7D0bheVDoz6fpuzeXwaKSRwA5VsU8wztxqC6rxcY9ycVPEOXs01MGa4UbXADz
         O/wL+c/r75nksRGBQgxNkAYPj92c2mc3kjc5Ogzo7SWEPLO59JavqGf1jAEemWow1YUn
         msUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJKfoJX1BL/DFUa5RzFo/O6XCwOr/5cvTxAXAq6nkHGi2j0re8YcjoSyP/vZJ8IPzqP878nWhx5Kqh9rVXkosK@lists.infradead.org
X-Gm-Message-State: AOJu0YwMgF7slmph356erm7swnptqtUL4BVEEom+ZCE8dJsWCybQDKPu
	xExPtHTFWCHWmGqhv8pAI9oEtT5GaFt+M0wIESrTtZgy7a2afA/cctOicqkyAAIkylSpI5IkZt2
	xFomKh3g/zuLUZthAkwKz/W7CuZmVisfyrl6cDV6y
X-Gm-Gg: ASbGncs8fMVAi/e9H97RHY4mKVABSSHTKwLFhDxep4+cHZZN2ViMYU7zRsBPxSc2H3I
	0Ex4OnTwNhkQigDKo36SU+huOmyJbiNm7z9jWWQ0ImVRLQuPo8cDMavp9/Z5g0CftCSXpdG3xxg
	t3hN2U+6acfoJ/83Frdxl53JkiUfm+VP/a5dW/5+XMsniWdQywij5zLECjV4PdhIZ6Kzbk1oaqU
	Nmza6EY+iv1x6GfGT+H+MGialcvOk+5Lvei10IO
X-Google-Smtp-Source: AGHT+IEleF8ivksR26XpmTWXy3KCMqLtp7lcXHp94NqMETszAgAyRO8FnYgynO7hXWeiXu6R0Q4pDW3VdH8z0Y3FkYk=
X-Received: by 2002:a05:600c:5023:b0:453:79c3:91d6 with SMTP id
 5b1f17b1804b1-45604733553mr1556035e9.1.1752374546338; Sat, 12 Jul 2025
 19:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250604050902.3944054-1-jiaqiyan@google.com> <20250604050902.3944054-4-jiaqiyan@google.com>
 <aHFpIpIfqVCQZVgG@linux.dev> <CACw3F51xRWr5LXz4-JhK+mjizY7D7Oa+GrJ-OZHktfPzFGKeiw@mail.gmail.com>
 <aHK7w4TTEm7a1mco@linux.dev>
In-Reply-To: <aHK7w4TTEm7a1mco@linux.dev>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Sat, 12 Jul 2025 19:42:15 -0700
X-Gm-Features: Ac12FXxcNa4e9HwM2rPqBWqAlsG9UDRsiS6fK2kefjn5JOWhY0L8gHWyQHAnvJ0
Message-ID: <CACw3F50mTCB0h4GbdcERz4j=CcnwVCfA0Mc9OL-u0nJCJPEVnA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] KVM: arm64: Allow userspace to inject external
 instruction aborts
To: Oliver Upton <oliver.upton@linux.dev>
Cc: maz@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	pbonzini@redhat.com, corbet@lwn.net, shuah@kernel.org, kvm@vger.kernel.org, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, duenwen@google.com, rananta@google.com, 
	jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_194229_519019_1F8B1748 
X-CRM114-Status: GOOD (  31.83  )
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

On Sat, Jul 12, 2025 at 12:47=E2=80=AFPM Oliver Upton <oliver.upton@linux.d=
ev> wrote:
>
> On Fri, Jul 11, 2025 at 04:58:57PM -0700, Jiaqi Yan wrote:
> > On Fri, Jul 11, 2025 at 12:42=E2=80=AFPM Oliver Upton <oliver.upton@lin=
ux.dev> wrote:
> > >
> > > On Wed, Jun 04, 2025 at 05:08:58AM +0000, Jiaqi Yan wrote:
> > > > From: Raghavendra Rao Ananta <rananta@google.com>
> > > >
> > > > When KVM returns to userspace for KVM_EXIT_ARM_SEA, the userspace i=
s
> > > > encouraged to inject the abort into the guest via KVM_SET_VCPU_EVEN=
TS.
> > > >
> > > > KVM_SET_VCPU_EVENTS currently only allows injecting external data a=
borts.
> > > > However, the synchronous external abort that caused KVM_EXIT_ARM_SE=
A
> > > > is possible to be an instruction abort. Userspace is already able t=
o
> > > > tell if an abort is due to data or instruction via kvm_run.arm_sea.=
esr,
> > > > by checking its Exception Class value.
> > > >
> > > > Extend the KVM_SET_VCPU_EVENTS ioctl to allow injecting instruction
> > > > abort into the guest.
> > > >
> > > > Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> > > > Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
> > >
> > > Hmm. Since we expose an ESR value to userspace I get the feeling that=
 we
> > > should allow the user to supply an ISS for the external abort, simila=
r
> > > to what we already do for SErrors.
> >
> > Oh, I will create something in v3, by extending kvm_vcpu_events to
> > something like:
> >
> > struct {
> >   __u8 serror_pending;
> >   __u8 serror_has_esr;
> >   __u8 ext_dabt_pending;
> >   __u8 ext_iabt_pending;
> >   __u8 ext_abt_has_esr;  // <=3D new
> >   /* Align it to 8 bytes */
> >   __u8 pad[3];
> >   union {
> >     __u64 serror_esr;
> >     __u64 ext_abt_esr;  // <=3D new
>
> This doesn't work. The ABI allows userspace to pend both an SError and
> SEA, so we can't use the same storage for the ESR.

You are right, the implementation (__kvm_arm_vcpu_set_events) indeed
continues to inject SError after injecting SEA.

Then we may have to extend the size of exception and meanwhile reduce
the size of reserved, because I believe we want to place ext_abt_esr
into kvm_vcpu_events.exception. Something like:
struct kvm_vcpu_events {
  struct {
    __u8 serror_pending;
    __u8 serror_has_esr;
    __u8 ext_dabt_pending;
    __u8 ext_iabt_pending;
    __u8 ext_abt_has_esr;
    __u8 pad[3];
    __u64 serror_esr;
    __u64 ext_abt_esr;  // <=3D +64 bits
  } exception;
  __u32 reserved[10];  // <=3D -64 bits
};

The offset to kvm_vcpu_events .reserved changes; I don' think
userspace will read/write reserved (so its offset is probably not very
important?), but theoretically this is an ABI break.

Another safer but not very readable way is to add at the end:
struct kvm_vcpu_events {
  struct {
    __u8 serror_pending;
    __u8 serror_has_esr;
    __u8 ext_dabt_pending;
    __u8 ext_iabt_pending;
    __u8 ext_abt_has_esr;
    __u8 pad[3];
    __u64 serror_esr;
  } exception;
  __u32 reserved[10];  // <=3D -64 bits
  __u64 ext_abt_esr;  // <=3D +64 bits
};

Any better suggestions?

>
> >   };
> > } exception;
> >
> > One question about the naming since we cannot change it once
> > committed. Taking the existing SError injection as example, although
> > the name in kvm_vcpu_events is serror_has_esr, it is essentially just
> > the ISS fields of the ESR (which is also written in virt/kvm/api.rst).
> > Why named after "esr" instead of "iss"? The only reason I can think of
> > is, KVM wants to leave the room to accept more fields than ISS from
> > userspace. Does this reason apply to external aborts? Asking in case
> > if "iss" is a better name in kvm_vcpu_events, maybe for external
> > aborts, we should use ext_abt_has_iss?
>
> We will probably need to include more ESR fields in the future, like
> ESR_ELx.ISS2. So let's just keep the existing naming if that's OK with
> you.

Ack to "esr", thanks Oliver!

>
> Thanks,
> Oliver

