Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0647C88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 19:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OTxzLNSYnPWU+NIWpMusw3nkquTrF9GQgF6IBC5wI0Q=; b=a30A6RhpLPGNXSfwkk0Lmh/jFD
	BNWMSKWgACVbqrx142kzs213AkGOM6Um0zbJIHpxXqOSph1GPvYgSvV2CFS7q4L/R22XAhj8DmeyR
	TPEAPNqFWs9+jBf+v4LLEE7g+1ptloShu3824SEM5O5BJLBuCznHpgCS4/iTOezN3FNKMdvhprHvC
	1QBI/LzynfpIKHByqEOTuSnN/lyQ9M2tQYwutrPtpLLuzcprmtBvOdLLJLcT9aNGyZU4/zzFKhHEr
	9S8fw80ghXdRkJTKhzx0r60k+twWbbeaH7NDYWUKzGLdAu7fbONumc3In+vpeK4lzqoL0XN6GDj78
	CLbx7ISw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6v03-0000000A0UU-2uzx;
	Wed, 16 Sep 2026 19:08:55 +0000
Received: from out-77.mta0.migadu.com ([2001:41d0:1004:224b::4d] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6v00-0000000A0Ti-3hit
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 19:08:54 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=eFc2+iQ2uor4nljrCfWRFp6wcNqGR5KKJNmBsadf8CM=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789585730; v=1; x=1790190530;
 b=YaYv4fMkZ6vg1YDOLtJVew4Of92vMsVjhCRu17w1D9QxvuGU+nf6VdHXPQoSnpX9XAfutrrx
 WOCCaDiV3CgM9HSXRhTH4i2yntAT68COMfIRgnSYf5rtNDsdZ264zxSfC4Iy3HxjJenBntrPfr5
 JZzvELN0Bc95tbdACBhLpprk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 2f36bad5e75937a0;
	Wed, 16 Sep 2026 19:08:50 +0000
X-Mizu-Trace-ID: 2f36bad5e75937a0
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b4a0b17359so1273e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 12:08:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwvp0TaNNkq97b1b6M2qyyslJcyvA+9YIlc0xxoYEOyocmWyI9CF9WQWgG/Jw6tEWlliq5oJUATAMc4azgy/1zJ@lists.infradead.org
X-Gm-Message-State: AFuF++kKQzuDkOfoe0kgNeK6A9m8WgMNwYc+4kPTg7Co4rIp+C/TyhST
	MLrWWt2OFcMHAuxgnWfjN6j0im/2rHnG8qDnyLVebBnIkvXROfgeiCwB2YlyssKkc7OwPyodFGB
	7m33yWD2KRf5t1ty/1HoWYZl+XRFtYOBB9FvZs5QZ
X-Received: by 2002:a05:6512:2355:b0:5b6:4ae:3ff0 with SMTP id
 2adb3069b0e04-5b8bab3fbc9mr21749e87.15.1789585729580; Wed, 16 Sep 2026
 12:08:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260914113338.159227-1-fuad.tabba@linux.dev> <20260914113338.159227-17-fuad.tabba@linux.dev>
 <868q515eqf.wl-maz@kernel.org>
In-Reply-To: <868q515eqf.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 16 Sep 2026 20:08:12 +0100
X-Gmail-Original-Message-ID: <CA+EHjTw1HKxntc_XsBGK6ugVYyL8HVLMzUtiRin7OgCVic8bVQ@mail.gmail.com>
X-Gm-Features: AcwNN1XhAbmtcjnzFyAA7N0SNImoWsnKazUmdDqXvnrAn69zT4QFsz2-FY_zZUU
Message-ID: <CA+EHjTw1HKxntc_XsBGK6ugVYyL8HVLMzUtiRin7OgCVic8bVQ@mail.gmail.com>
Subject: Re: [PATCH v3 16/18] KVM: arm64: Reject host power-on of a vCPU that
 EL2 holds powered off
To: Marc Zyngier <maz@kernel.org>
Cc: oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, steven.price@arm.com, vdonnefort@google.com, 
	qperret@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_120853_061527_D5B99867 
X-CRM114-Status: GOOD (  15.65  )
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

Hi Marc,

On Wed, 16 Sept 2026 at 17:43, Marc Zyngier <maz@kernel.org> wrote:
[...]
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index 37d0721d39a45..2e2c051dd8e62 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -922,6 +922,8 @@ struct kvm_vcpu_arch {
> >          /* vcpu power state */
> >          struct kvm_mp_state mp_state;
> >          spinlock_t mp_state_lock;
> > +        /* EL2 holds the protected vCPU powered off. Under mp_state_lock. */
> > +        bool pkvm_powered_off;
>
> I'm definitely not keen on yet another random boolean to describe some
> new state. We already have mp_state. Why can't we use one of the
> unused encodings and check that, since it very much looks like a case
> of "let userspace change the MP_STATE unless EL2 says otherwise".
>
> Can that be made to work?

Yes. The bool kept the VMM's STOPPED and EL2's off apart without a new
userspace-visible value, but a distinct mp_state value does that and
lets the VMM see why RUNNABLE is rejected.

It's set where the bool is set today, on the guest's CPU_OFF and at
hyp vCPU creation for a vCPU that starts STOPPED, and only the guest's
CPU_ON sets it back to RUNNABLE. KVM_SET_MP_STATE returns -EPERM for
RUNNABLE and SUSPENDED on it and -EINVAL for the value itself, STOPPED
and kvm_prepare_system_event() leave it in place, and
kvm_arm_vcpu_stopped() returns true for it.

KVM_MP_STATE_UNINITIALIZED looks like the closest fit, a vCPU the
guest has yet to bring up. I'll use that in v4 unless you'd rather
another.

Cheers,
/fuad

