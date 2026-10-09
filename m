Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C318CA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 14:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZrlqAq5CBGEXfb9cK1U8Y1OfFhaqEwDqLAmTfdBu9s=; b=CCcxBBwAceuY8yXBO6I9JV2sgl
	f8VYHcI+k2Li1m8O6xopwh7I5I5WM19tSsvSUBSfg+f9wnuRvCvi22HJLtmoQQqTeQeY7mMeNHToU
	nFycQBOP+d5Y6WllqmW1L5zaU91k1lMtfg9Uwd/Tz7lZpZCwZQehh1JnscInxjwkdR2lUlUV8OzbL
	XiFKzNkNenRkeLIGAxNcMYpGNhj3nmQa3VNK9tOwVtUsb8v5AgAEJEqlbn5r9wzdHycLctgXaHAoc
	0ydfWZWPUOp9edo5CRGqomqOXh0y/79OdSc9QY356Vs2xQ8c59HT8sLnevU1jzS08QRhRfxo7PUFR
	FIKFq49w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBI7-00000006QmP-19Kn;
	Fri, 09 Oct 2026 14:09:43 +0000
Received: from out-190.mta0.migadu.com ([2001:41d0:1004:224b::be] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFBI4-00000006Qm2-1Fjr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 14:09:42 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=YZrlqAq5CBGEXfb9cK1U8Y1OfFhaqEwDqLAmTfdBu9s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791554977; v=1; x=1792159777;
 b=mYE1sUACvXrH32UhI31Sscq9BvnahxOemrWuKlrZy+O20WQejNfIMpxI2BQ/pvaa/8Hj9uI5
 7LcRpl4hhUH65MjpbP/L3PzlcN/e1plmIj479c4NIAvN1wKGGJDYpRZn/0tG0OppMLjXFf3WKN9
 Bg332uRpPqucbks/TQVGOUXk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id c06091e7eb3507a1;
	Fri, 09 Oct 2026 14:09:37 +0000
X-Mizu-Trace-ID: c06091e7eb3507a1
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so7697e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Oct 2026 07:09:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBykXCKRXoiZwtO+sJiTwZ/5PA0ZkSNVZrVnyI/b5pEKROAffyTkvPJA0oThCFg1dXP74gK7gPxkn3z7IGO9Gn0v@lists.infradead.org
X-Gm-Message-State: AFq9FYIe8OAC04MpUHi2tj8GYoVaBROeaFv/jKQ7w/DEqmMCzSJfQQ2Y
	Xv9/rcDHmEY+P0rQl9QwRlvrcAuFEOIgTOtrKab9uhGfaFRWSshEhvYvHCnAvc0xdXovzHqyBNN
	d/xGZSMJwh94Pr9Dx/433KHK0dx73ieszgpvgExT7
X-Received: by 2002:a05:6512:68c:b0:5b8:c8f2:16c4 with SMTP id
 2adb3069b0e04-5bcdf951650mr89017e87.10.1791554976482; Fri, 09 Oct 2026
 07:09:36 -0700 (PDT)
MIME-Version: 1.0
References: <20261009084529.462577-1-vdonnefort@google.com>
 <20261009084529.462577-2-vdonnefort@google.com> <CA+EHjTwNTarWqSc_XVXGFT6mHUZD=QuTeVWrd087jUtexxCScg@mail.gmail.com>
 <asjl8czHAD017Bha@google.com>
In-Reply-To: <asjl8czHAD017Bha@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 9 Oct 2026 15:08:59 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyrw6OtSQzQW3=OMV4G=Kf_-ywzRsbfCfPyySp_x-30uw@mail.gmail.com>
X-Gm-Features: AclHuK9XmAq32Zjqn2GX9AXl1JyOiArTcR1iJ0Xv1uF-bqEh3Oi8UAMsFMJbAwE
Message-ID: <CA+EHjTyrw6OtSQzQW3=OMV4G=Kf_-ywzRsbfCfPyySp_x-30uw@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] KVM: arm64: Add ESR class to the hyp_enter hyp event
To: Vincent Donnefort <vdonnefort@google.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_070940_507564_23851463 
X-CRM114-Status: GOOD (  29.65  )
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

Hi Vincent,

On Fri, 09 Oct 2026 14:02:41 +0100, Vincent Donnefort
<vdonnefort@google.com> wrote:

[...]
> > Aren't fixed trace points ABI? This changes the raw values of the
> > reason field (1 was hvc and is now WFx) and the strings it prints.
> > Keeping the old values and recording the EC in a new field would avoid
> > that.
>
> The event format is described precisely in events/hypervisor/hyp_enter/format.
> Any tooling should use that, so it doesn't seem like ABI to me. Also, this is
> behind NVHE_EL2_DEBUG. The only precedent I know is in kernel/sched/ where there
> are only tracepoints to avoid having trace events.
>
> Finally, we do not expose (yet :)) the raw interface. So this part is definitely
> not ABI.
>
> I tried to avoid having the EC separately to keep the event as small as
> possible.

Fair enough, with it behind NVHE_EL2_DEBUG and no raw interface yet.

[...]
> > This also replaces the PSCI, ERET_HOST and ERET_GUEST exit reasons
> > with a single ERET, which the commit message doesn't mention.
>
> ERET_HOST is now "to=host reason=eret" and ERET_GUEST "to=guest reason=ERET".
>
> This one here could be considered a bug fix and I could make it a separate
> patch?

A separate patch sounds good.

[...]
> > Could ESR_EL2 be read only when the event is enabled? The read happens
> > even when tracing is disabled or compiled out, so every non-IRQ guest
> > exit now does an extra one: with NVHE_EL2_DEBUG=n, __kvm_vcpu_run()
> > goes from two reads of ESR_EL2 to three.
>
> Hum, that's a good point. I was thinking about having a HYP_REASON_ESR that when
> sent actually read the ESR. But then handle_trap() would read it twice, unless
> this one still gives the esr directly.
>
> Alternatively, I thought of moving the esr_el2 = read_sysreg_el2(SYS_ESR) out of
> __fixup_guest_exit(). But it didn't look nice.
>
> WDYS?

HYP_REASON_ESR sounds good to me, with handle_trap() still passing the
EC it already has. HE_ASSIGN is only built at EL2 and runs after the
enabled check, so the read can go there.

[...]
> > Could this print the EC value when it isn't in the table?
> > kvm_arm_exception_class has no entry for ILL, BTI, SME or GCS among
> > others, so an ARM_EXCEPTION_IL exit (EC 0x0E) shows up as UNKNOWN_ESR.
>
> I can extend kvm_arm_exception_class. Having a dynamic format string is not
> possible here.

Sounds good, that also helps kvm_exit, which prints from the same table.

Cheers,
/fuad

