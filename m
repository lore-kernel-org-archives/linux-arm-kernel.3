Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F16DC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 12:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GtlRa4EnHRvRTTXOu323ubV7Cd4GPOUPDvFH3dEXzK8=; b=uGHsQkWo9BoZauXaLubJ1vysCE
	vQz0KH7YAMlbBOH2U/XNhz+D+ZuEXXVyayA1m3ACukLna+lSpyvQuTQJUKTmyQPQ2/DH7BTR42dJZ
	Dfu46IBME0zq69hjCnfYX36vKZ42k7bfaY71lSsOSJMNbQX6HiAYAgxMhWegDPMmjibThe39DmUPM
	gpDTMxxBv4fXERrk7PbZj9kJbg55msWTyNvrrhYNQsNIz+BTJQcYPyfPeAxmMS/9dAQI5LNJ86rEQ
	+yLcTVpAa0ShD7zHCRK4eecUVkX7SL2udZoXi/R3mtO/niSgozZY5omi38eK/SP03JJNKVbgj5mAf
	41OmfbFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udq2l-0000000HIu6-1RfX;
	Mon, 21 Jul 2025 12:54:59 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udoTD-0000000H3GS-2zwX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 11:14:12 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4aba1bc7f44so28754591cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 04:14:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=android.com; s=20230601; t=1753096451; x=1753701251; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtlRa4EnHRvRTTXOu323ubV7Cd4GPOUPDvFH3dEXzK8=;
        b=UbdTgafmg30xwAIlhjhNFA8TidhXeDK429+JI/Pp7r/Gj5ZQlLh2elgOvM1RHh4TGl
         lCT9CE77QwucS+4+KR+KPSTl3pvzhP1z56Xcsl5183qMSdxxx91BaQHq6CDK8lCa8DXz
         DAdRnuF4XVznO/PiJ7AvNVnXRd5/kswj8yMfi0DlQA6GLWMmZRKblLA73cJ36ZRI4+ko
         kg/C5Ogu+YCn8eAZn6iwn81kEuk8AxbYPDqqE4OPF3EZ980IlFDTVvETGsT64ydxB71C
         QYM4tDOGh7jjV1eAbSA0N2+G0R7UkLHIfoovFHNNZu87d8APDwMzKbJX80GakWweidU5
         eO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753096451; x=1753701251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtlRa4EnHRvRTTXOu323ubV7Cd4GPOUPDvFH3dEXzK8=;
        b=EFGmPhZjdcF1tu3O4ku14WfvHUGEmtBMEezLFDshGU3p9AblIPLQCvvS0STtP/0i9y
         dnhJc9Fn76tTR6xjI/qGav0P9KHRr8SQJ7mJEEFFv0lbTTYot1QifH1DOv9r+LaKf8kb
         91RESI3+78A85aj6pKGSyv2W12DMlNudazClJKzXEIxSFIBCbGyrH0FJHZi6EZHVzmRk
         34FZYgbcXZyZOycBcKfKN98wa1omJpkSpDjVU7X6LiwWpoug64LViHLwSCh9wyGKa86y
         e2TInB1qMOtEud1v5CKeyJSXDR6BF8Y/LJZDq/ICfSah5axA7/e67sXlZjsV5XaXnP2O
         eK7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXgX4yhqFZDZLcjUyrvZZvly0avNc4us76JT+UOFO2JKnuZpOjZv7cmfX7Hi3nJjY7tiF0qQF29bc4Jsb1IrqDk@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt52onCDlwnVpfm1sZWwJfzoaq7f81IUuQRxAK+tgCa+4+byUW
	BHxesvcZrXqB6GmNHcKRvkupYxgjZo+lyfsLRQq0JJ/RVMW7AD/a4lpdKVOLonOYs3b1Pc/dhk8
	Dsnx4eq+4jcxC63lv2X035Ykg5LqVh9lI+Y7cHClF
X-Gm-Gg: ASbGncvUVFbL1N4ESz+repzqqQODqopqT1pmhZLolCnAo3BrwSH+sKp5EL4PmL8ZBUt
	P4AX3fdqVdEZjkVzrWYkP5sdRo4zgmmQTPrADAvnK/DbGaUESHHBbqK+gNrZ5+j0Xe2r8KAiueL
	zAUyuVVE9X/iv2ZZTgG71MJGEHha8bWs5malZB9fWB+TVCeV1eFaejZ7DR27KPL2chatpS2Cw0Y
	2IfaoIXO9uisUWwe8cYo6zqeAuHB/XGw7by1kaPtA==
X-Google-Smtp-Source: AGHT+IF/Z0HI6TmXWcSejGmxIumXwzv7Wt4N9tNfpJJWx7Y46lpv4IgUdvc+GB5ne/UGCDyxnW+oQUgbgPZJGkXl9xU=
X-Received: by 2002:a05:6214:3305:b0:704:f44a:75ff with SMTP id
 6a1803df08f44-705162103c4mr156533906d6.22.1753096450633; Mon, 21 Jul 2025
 04:14:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250701-virtio-msg-ffa-v7-0-995afc3d385e@google.com>
 <20250701-virtio-msg-ffa-v7-5-995afc3d385e@google.com> <aHpRvBO864x1vvqP@willie-the-truck>
In-Reply-To: <aHpRvBO864x1vvqP@willie-the-truck>
From: =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>
Date: Mon, 21 Jul 2025 04:13:59 -0700
X-Gm-Features: Ac12FXyFG5yEbBpu73BqZFIB9DdaO3n1VasDGNS_MIwe8KNKSUyKkMDnLJwSvog
Message-ID: <CAMP5XgenLo3dk=NB-iJ4MLs5azB7w=0RHkbQJRGb_qMnixCTsQ@mail.gmail.com>
Subject: Re: [PATCH v7 5/5] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ2 in
 host handler
To: Will Deacon <will@kernel.org>
Cc: perlarsen@google.com, Marc Zyngier <maz@kernel.org>, 
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
X-CRM114-CacheID: sfid-20250721_041411_755927_059E1006 
X-CRM114-Status: GOOD (  26.81  )
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

On Fri, Jul 18, 2025 at 6:53=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> On Tue, Jul 01, 2025 at 10:06:38PM +0000, Per Larsen via B4 Relay wrote:
> > From: Per Larsen <perlarsen@google.com>
> >
> > FF-A 1.2 adds the DIRECT_REQ2 messaging interface which is similar to
> > the existing FFA_MSG_SEND_DIRECT_{REQ,RESP} functions except that it
> > uses the SMC calling convention v1.2 which allows calls to use x4-x17 a=
s
> > argument and return registers. Add support for FFA_MSG_SEND_DIRECT_REQ2
> > in the host ffa handler.
> >
> > Signed-off-by: Per Larsen <perlarsen@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/ffa.c | 24 +++++++++++++++++++++++-
> >  include/linux/arm_ffa.h       |  2 ++
> >  2 files changed, 25 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ff=
a.c
> > index 79d834120a3f3d26e17e9170c60012b60c6f5a5e..21225988a9365219ccfd69e=
8e599d7403b5cdf05 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > @@ -679,7 +679,6 @@ static bool ffa_call_supported(u64 func_id)
> >       case FFA_NOTIFICATION_GET:
> >       case FFA_NOTIFICATION_INFO_GET:
> >       /* Optional interfaces added in FF-A 1.2 */
> > -     case FFA_MSG_SEND_DIRECT_REQ2:          /* Optional per 7.5.1 */
>
> I think that's the only change needed. In fact, maybe just don't add it
> in the earlier patch?
>
> >       case FFA_MSG_SEND_DIRECT_RESP2:         /* Optional per 7.5.1 */
> >       case FFA_CONSOLE_LOG:                   /* Optional per 13.1: not=
 in Table 13.1 */
> >       case FFA_PARTITION_INFO_GET_REGS:       /* Optional for virtual i=
nstances per 13.1 */
> > @@ -862,6 +861,22 @@ static void do_ffa_part_get(struct arm_smccc_1_2_r=
egs *res,
> >       hyp_spin_unlock(&host_buffers.lock);
> >  }
> >
> > +static void do_ffa_direct_msg2(struct arm_smccc_1_2_regs *regs,
> > +                            struct kvm_cpu_context *ctxt,
> > +                            u64 vm_handle)
> > +{
> > +     DECLARE_REG(u32, endp, ctxt, 1);
> > +
> > +     struct arm_smccc_1_2_regs *args =3D (void *)&ctxt->regs.regs[0];
> > +
> > +     if (FIELD_GET(FFA_SRC_ENDPOINT_MASK, endp) !=3D vm_handle) {
> > +             ffa_to_smccc_error(regs, FFA_RET_INVALID_PARAMETERS);
> > +             return;
> > +     }
>
> Why do we care about checking the src id? We don't check that for
> FFA_MSG_SEND_DIRECT_REQ and I don't think we need to care about it here
> either.
>
> Will

I think not checking the src id for FFA_MSG_SEND_DIRECT_REQ is a bug
that should be fixed as well. The receiver expects the hypervisor to
have validated this. If the src id is not validated here then the host
can impersonate other VMs or even the hypervisor itself. This bug
might be minor at the moment since other VMs can't send messages at
the moment, but it is still a bug that needs to be fixed at some
point.

--=20
Arve Hj=C3=B8nnev=C3=A5g

