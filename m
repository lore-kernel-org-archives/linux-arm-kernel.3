Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE5D7C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 12:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z5NScKoqqRDYpF25UOe7u8EPklWKzZRwjyOT1Jxt9gI=; b=pDuZnITU8LQnzux6fwayVPIDs4
	LbFEwLPeCEUsjrIpkELmmpKMineGtj7Tbke8xTp9SU6wjniw36W3YrxQ6zLhPrgr9Oli+EjXJni70
	6umtr91/xwyZdHUxLaG2Jxse/ago52AAjjHsmwiOgb4xxgOaM+liSd2PUoggrSYcRHgx7Y1hLcyB0
	Dw+jjb8oiFDwxbKUybjxNmL5zZwYMx1s9ZXIEBVtLjaB1yTxY77IjLJqX79EuzsLafEkZTjri3602
	nHq8EFNiP1nOfxQl61WuRf5XO+y9ceOrU2GhTDmJZVy/jurE8AOM43JjNIDsrkwSXciwTh3RXRdEa
	ERAHHGtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udpvS-0000000HHi1-3Bb0;
	Mon, 21 Jul 2025 12:47:26 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udoHW-0000000H1l0-0Il8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 11:02:07 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-4ab6e66ea68so57082911cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 04:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=android.com; s=20230601; t=1753095724; x=1753700524; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z5NScKoqqRDYpF25UOe7u8EPklWKzZRwjyOT1Jxt9gI=;
        b=mP5K3ENNW0UE6ir/VdSCVExywoLFdhLLmZt0xl0kTVvTliNb5+W0dAttm8/cohKQss
         /dMnUVZJErQQ2+j53wKschXmU8iUPPwUJ5Xr3QxKyOqV+555BmvDWvBElAYL9zbx7lg4
         UIEPxPiZ0u/Eg2lrPn9pws13gAb3sCkMuQEcKUy5M5q4OuUehFC9KidIY1QRRLFGYZhV
         oqBBLZA2kXu0gd6bx8wEggKcgwscJAI1AVAP1JOYmo5Txbw50WVvTgLOxCYukbzMW3zi
         5lv7OVJYmknG14eW1pUJ0n8Nsn1fXC0bHHG906ivQhEAg7kccjneFnF7dbNyvGvrmQgB
         K/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753095724; x=1753700524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z5NScKoqqRDYpF25UOe7u8EPklWKzZRwjyOT1Jxt9gI=;
        b=OHztqLYxk1TliXA6o7xrGacvCRpcezVLyH9j//aoewmJ6+ZfGj60kR/mbxpchGsfIy
         YzQuhUgdoAbowYvKE3HSRkzYkMld1Z8LPs/LF+apxnDU+QARHu7ujvTBxXdOjxdmUUv+
         0LGPMN7PPH7TVrX3j103VeWsSmdlJVyJ+MQ4cM69FJxPTdaF9guJW9FeqI1mL5ZoQ69y
         8g37jORAqoJhoYsAIcTNET9rU6hr2FW9gedD2lmzZKv9hmv6KY4Y6w4ehEq0IyGspAKQ
         TOmeNkwPtStPNp0XVXlsfgKrM5eOPA/amw00LW/rLkAOUBXxs+/D5q5GXtHhmhoUj+Os
         ahRA==
X-Forwarded-Encrypted: i=1; AJvYcCWya2Kgmv0dQStJxgz/XldfJFI4QBvxFlnvr79Q2H6mM6oQrCRC5qN5Ra6csugh4ibdUG/RUF/U44RvPQHjTkcS@lists.infradead.org
X-Gm-Message-State: AOJu0YwiaNzkRYqUTUr7wze6+nO6srLbUhcUEZ1uVukkDwjnBMMtF93e
	VjvjTw08LkOri+JgFysi3CsKmlYUzvuuCAragkjyB9vr5DNMzQ0VDl78+FXmqJ6jc9N6K//oChf
	//3RKqWs/3L+oc+4+caq+USkTF90wb2kvbpoilEkb
X-Gm-Gg: ASbGnctizAm0Q1FhlQVmCVemCuvViXPAXxYWWjDDzBooNsS1hWZYT3BSPIiqzqGcXoC
	cJBzBcHV3+Ofa2dfG99B/uWFko5/yusd0e7KkYQfg3pM7pVUe+TM0HVL7kBfSws8eJeW4xNBBUp
	jRoakvJltFkX8rNOMnyHmAAX3h2O3i1OZkzajnmqyVOgK4CiTPymvUzE6istR4iPz5jOW9SAo8A
	NB2KkbKFswB+D1Q4DmVZp86dGfFtEFHpYnWRGjfiQ==
X-Google-Smtp-Source: AGHT+IFi54tA/j4ZfIPctLHHg6b5vyU1fnTS/ZP8EdichbysBiV/QOT7PSO6lGugTEs2q8yVhdWoz8PI8zW1nkRBPYM=
X-Received: by 2002:a05:6214:310f:b0:700:c7e4:cac6 with SMTP id
 6a1803df08f44-705071c240cmr195760366d6.8.1753095723949; Mon, 21 Jul 2025
 04:02:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250701-virtio-msg-ffa-v7-0-995afc3d385e@google.com>
 <20250701-virtio-msg-ffa-v7-2-995afc3d385e@google.com> <8634bdbgaz.wl-maz@kernel.org>
 <3b10fa81-bfdd-4325-a330-c79df2e21621@immunant.com> <aHpOClH1k-3NhI_y@willie-the-truck>
 <67cc6766-6493-4171-a6b1-2a105c3e6ff5@immunant.com>
In-Reply-To: <67cc6766-6493-4171-a6b1-2a105c3e6ff5@immunant.com>
From: =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>
Date: Mon, 21 Jul 2025 04:01:52 -0700
X-Gm-Features: Ac12FXxyyw32mDla--L9makX6oeYtEuUpV1sDlGA2J2wilR4nXDa-mqd-j0HZ08
Message-ID: <CAMP5XgeUwDnf=PbySy6aoF_zc7dtxymDQZEp8DuRSOLg4WEnFQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/5] KVM: arm64: Use SMCCC 1.2 for FF-A initialization
 and in host handler
To: Per Larsen <perl@immunant.com>
Cc: Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, perlarsen@google.com, 
	Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, ahomescu@google.com, armellel@google.com, 
	ayrton@google.com, qperret@google.com, sebastianene@google.com, 
	qwandor@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_040206_134119_A7561BDF 
X-CRM114-Status: GOOD (  45.21  )
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

On Fri, Jul 18, 2025 at 10:54=E2=80=AFPM Per Larsen <perl@immunant.com> wro=
te:
>
> On 7/18/25 6:37 AM, Will Deacon wrote:
> > On Mon, Jul 07, 2025 at 05:06:23PM -0700, Per Larsen wrote:
> >> On 7/3/25 5:38 AM, Marc Zyngier wrote:
> >>> On Tue, 01 Jul 2025 23:06:35 +0100,
> >>> Per Larsen via B4 Relay <devnull+perlarsen.google.com@kernel.org> wro=
te:
> >>>> diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe=
/ffa.c
> >>>> index 2c199d40811efb5bfae199c4a67d8ae3d9307357..65d241ba32403d014b43=
cc4ef4d5bf9693813809 100644
> >>>> --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> >>>> +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> >>>> @@ -71,36 +71,68 @@ static u32 hyp_ffa_version;
> >>>>    static bool has_version_negotiated;
> >>>>    static hyp_spinlock_t version_lock;
> >>>> -static void ffa_to_smccc_error(struct arm_smccc_res *res, u64 ffa_e=
rrno)
> >>>> +static void ffa_to_smccc_error(struct arm_smccc_1_2_regs *res, u64 =
ffa_errno)
> >>>>    {
> >>>> -  *res =3D (struct arm_smccc_res) {
> >>>> +  *res =3D (struct arm_smccc_1_2_regs) {
> >>>>                    .a0     =3D FFA_ERROR,
> >>>>                    .a2     =3D ffa_errno,
> >>>>            };
> >>>>    }
> >>>> -static void ffa_to_smccc_res_prop(struct arm_smccc_res *res, int re=
t, u64 prop)
> >>>> +static void ffa_to_smccc_res_prop(struct arm_smccc_1_2_regs *res, i=
nt ret, u64 prop)
> >>>>    {
> >>>>            if (ret =3D=3D FFA_RET_SUCCESS) {
> >>>> -          *res =3D (struct arm_smccc_res) { .a0 =3D FFA_SUCCESS,
> >>>> -                                          .a2 =3D prop };
> >>>> +          *res =3D (struct arm_smccc_1_2_regs) { .a0 =3D FFA_SUCCES=
S,
> >>>> +                                                .a2 =3D prop };
> >>>>            } else {
> >>>>                    ffa_to_smccc_error(res, ret);
> >>>>            }
> >>>>    }
> >>>> -static void ffa_to_smccc_res(struct arm_smccc_res *res, int ret)
> >>>> +static void ffa_to_smccc_res(struct arm_smccc_1_2_regs *res, int re=
t)
> >>>>    {
> >>>>            ffa_to_smccc_res_prop(res, ret, 0);
> >>>>    }
> >>>>    static void ffa_set_retval(struct kvm_cpu_context *ctxt,
> >>>> -                     struct arm_smccc_res *res)
> >>>> +                     struct arm_smccc_1_2_regs *res)
> >>>>    {
> >>>> +  DECLARE_REG(u64, func_id, ctxt, 0);
> >>>>            cpu_reg(ctxt, 0) =3D res->a0;
> >>>>            cpu_reg(ctxt, 1) =3D res->a1;
> >>>>            cpu_reg(ctxt, 2) =3D res->a2;
> >>>>            cpu_reg(ctxt, 3) =3D res->a3;
> >>>> +  cpu_reg(ctxt, 4) =3D res->a4;
> >>>> +  cpu_reg(ctxt, 5) =3D res->a5;
> >>>> +  cpu_reg(ctxt, 6) =3D res->a6;
> >>>> +  cpu_reg(ctxt, 7) =3D res->a7;
> >>>
> >>>   From DEN0028G 2.6:
> >>>
> >>> <quote>
> >>> Registers W4-W7 must be preserved unless they contain results, as
> >>> specified in the function definition.
> >>> </quote>
> >>>
> >>> On what grounds can you blindly change these registers?
> >>  From DEN0077A 1.2 Section 11.2: Reserved parameter convention
> >>
> >> <quote>
> >> Unused parameter registers in FF-A ABIs are reserved for future use by=
 the
> >> Framework.
> >>
> >> [...]
> >>
> >> The caller is expected to write zeroes to these registers. The callee
> >> ignores the values in these registers.
> >> </quote>
> >>
> >> My read is that, as long as we are writing zeroes into reserved regist=
ers
> >> (which I believe we are), we comply with DEN0026G 2.6.>
> >
> > Right, the specs make this far more difficult to decipher than necessar=
y
> > but I think SMCCC defers to the definition of the specific call being
> > made and then FF-A is basically saying that unused argument registers
> > are always zeroed.
> >
> > Rather than have the EL2 proxy treat each call differently based on the
> > used argument registers, we can rely on EL3 doing the right thing and
> > blindly copy everything back, which is what you've done. So I think
> > that's ok.
> >
> >>>> +
> >>>> +  /*
> >>>> +   * DEN0028C 2.6: SMC32/HVC32 call from aarch64 must preserve x8-x=
30.
> >>>> +   *
> >>>> +   * The most straightforward approach is to look at the function I=
D
> >>>> +   * sent by the caller. However, the caller could send FFA_MSG_WAI=
T
> >>>> +   * which is a 32-bit interface but the reply could very well be 6=
4-bit
> >>>> +   * such as FFA_FN64_MSG_SEND_DIRECT_REQ or FFA_MSG_SEND_DIRECT_RE=
Q2.
> >>>> +   *
> >>>> +   * Instead, we could look at the function ID in the response (a0)=
 but
> >>>> +   * that doesn't work either as FFA_VERSION responses put the vers=
ion
> >>>> +   * number (or error code) in w0.
> >>>> +   *
> >>>> +   * Set x8-x17 iff response contains 64-bit function ID in a0.
> >>>> +   */
> >>>> +  if (func_id !=3D FFA_VERSION && ARM_SMCCC_IS_64(res->a0)) {
> >>>> +          cpu_reg(ctxt, 8) =3D res->a8;
> >>>> +          cpu_reg(ctxt, 9) =3D res->a9;
> >>>> +          cpu_reg(ctxt, 10) =3D res->a10;
> >>>> +          cpu_reg(ctxt, 11) =3D res->a11;
> >>>> +          cpu_reg(ctxt, 12) =3D res->a12;
> >>>> +          cpu_reg(ctxt, 13) =3D res->a13;
> >>>> +          cpu_reg(ctxt, 14) =3D res->a14;
> >>>> +          cpu_reg(ctxt, 15) =3D res->a15;
> >>>> +          cpu_reg(ctxt, 16) =3D res->a16;
> >>>> +          cpu_reg(ctxt, 17) =3D res->a17;
> >>>> +  }
> >>>>    }
> >>>
> >>> I don't see how that can ever work.
> >>>
> >>> Irrespective of how FFA_MSG_WAIT actually works (and I couldn't find
> >>> anything in the spec that supports the above), the requester will
> >>> fully expect its registers to be preserved based on the initial
> >>> function type, and that alone. No ifs, no buts.
> >>>
> >>> If what you describe can happen (please provide a convincing example)=
,
> >>> then the spec is doomed.
> >>
> >> DEN0077A 1.2 Section 8.2 (Runtime Model for FFA_RUN) and 8.3 (Runtime =
Model
> >> for Direct request ABIs) contains Figures 8.1 and 8.2. Each figure sho=
ws
> >> transitions between states "waiting", "blocked", "running", and "preem=
pted".
> >> Key to my understanding is that the waiting state in Figure 8.1 and Fi=
gure
> >> 8.2 is the exact same state. This appears to be the case per Section 4=
.10.
> >>
> >> So we have to consider the ways to get in and out of the waiting state=
 by
> >> joining the state machines in Figures 8.1 and 8.2. Figure 8.1 has an e=
dge
> >> between "running" and "waiting" caused by FFA_MSG_WAIT. Figure 8.2 has=
 an
> >> edge between "waiting" and "running" caused by a "Direct request ABI".
> >>
> >> Direct request ABIs include FFA_MSG_SEND_DIRECT_REQ2 which is why the =
FF-A
> >> 1.2 spec, in my read, permits the response to a 32-bit FFA_MSG_WAIT ca=
ll can
> >> be a 64-bit FFA_MSG_SEND_DIRECT_REQ2 reply.
> >
> > That seems bonkers to me and I agree with Marc's assessment above. The
> > SMCCC is crystal clear that a caller using the SM32/HVC32 calling
> > convention can rely on x8-x30 (as well as the stack pointers) being
> > preserved. If FF-A has a problem with that then it needs to be fixed
> > there and not bodged in Linux.
> Ack. Patchset v8 addresses Marc's feedback by using the func_id detect
> SMC64 instead.>
> > Setting that aside, I'm still not sure I follow this part of your check=
:
> >
> >       if (... && ARM_SMCCC_IS_64(res->a0))
> >
> > won't res->a0 contain something like FFA_SUCCESS? The FFA spec states:
> >
> >    FFA_SUCCESS64, is used only if any result register encodes a 64-bit
> >    parameter.
> >
> > which doesn't really seem related to whether or not the initial call
> > was using SMC32 or SMC64. What am I missing?I agree that we cannot use =
res->a0 to distinguish SMC32/SMC64 for the
> reason you stated.

I don't think using the function-id of the original call works
correctly in this context though. If you look at
drivers/firmware/arm_ffa/driver.c:ffa_msg_send_direct_req2 it has the
same problem as the FFA_MSG_WAIT example in your comment. In the
simple case it will use FFA_MSG_SEND_DIRECT_REQ2 for the call and
FFA_MSG_SEND_DIRECT_RESP2 for the response, both 64 bit opcodes, and
either approach here will have the same correct result. However if
FFA_MSG_SEND_DIRECT_REQ2 responds with FFA_INTERRUPT or FFA_YIELD,
then the driver will resume the call with FFA_RUN, a 32 bit opcode,
and still expect a 64 bit FFA_MSG_SEND_DIRECT_RESP2 response with a
full response in x4-17. If you use ARM_SMCCC_IS_64(func_id) here
instead of ARM_SMCCC_IS_64(res->a0), then the part of response in
x8-x17 will be lost.

The FF-A 1.3 ALP2 fixes this by adding a 64 bit FF-A run opcode, but
at the current patchstack only adds ff-a 1.2 support and the linux
ff-a driver does not yet support the new 1.3 ALP2 call flow either so
I think the current v7 patch here is the best option for now.

--=20
Arve Hj=C3=B8nnev=C3=A5g

