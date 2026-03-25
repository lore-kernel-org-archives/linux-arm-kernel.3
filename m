Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADB3109C02F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 16:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WOREcibyjzFVZRo0vDoLHxQ7fmZD72bSMhFFQGI9zwo=; b=CTtEFvsNGlpb2ZX9NMoLyjJAw1
	VzrStLIHwiKLXvRZ1dYM4yHstt1ekCZoCtA6iyt9FD6IEXmz9XOAmVdDjgdAylRm9vrBVtb1DJjVf
	ZS8Hhm5k/VUAPRdzfr4Qhr3wPC1aCUXr7wIcQNivg+PpNreYxcGd+8SLZPymo4NnY0U+7aSEvU2WV
	uSv07pE6PVb7njqi9LWJoH+8nanb0l6mY5fNCiyX6vKMIjirhkdHyRP6h5ndxaKrHv1jM7qkjsJEi
	lgQIl86LtIM1kOzJAAhFObQDXIGqWQ9SvfmOFSTuYfMGaEH84NqusiCGDh9mRCsEv5KThKkGa7Bly
	IamNoOxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Qgx-00000003qeg-0cD3;
	Wed, 25 Mar 2026 16:02:47 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Qgs-00000003qd2-2JMe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 16:02:45 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-661ce258878so13311a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 09:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774454560; x=1775059360; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WOREcibyjzFVZRo0vDoLHxQ7fmZD72bSMhFFQGI9zwo=;
        b=JquMcBsxxusSN+OdcunydSLkONRpXEHCMDwrudzeb+nWH2i5oCxOCM3b1YDncdfOIP
         Q8+b41DwtRQE12BmJQuhPA2FRuRkbKxF1rsollc6e4AwOrJMDGgwB3eIBSEaXWoh4UAZ
         sXsvveFs1rKYMGbhqvOghyNjWzqmS02/lN/qZlZI6Bat4REWgTCIzGye5kytHx0a+4ab
         nwaH4mlOqw4C0BCqx1t4w4ypFf9acazjPvJ2bx9lTiXAis1KuiJFn523RomdkMson9o3
         EtGrQNqz1bm1Wa+7JGjxSMptjdXLxpXp3YcvDIugHuMeTUX7z40MeI8kz+DYIrjozwJe
         sjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774454560; x=1775059360;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WOREcibyjzFVZRo0vDoLHxQ7fmZD72bSMhFFQGI9zwo=;
        b=MgV8xTxrQ8pkzAIPCbqco/o26iP4nQP5+Ufcev4tR2A0zpl7GhJWuxl1M5uo5brWjH
         7OKBnb3QntDkQ8IBkpLPmx3DDsCWn+tr80feQ7IEjZf3I4VzfXdAo2iZsRc3Ba2Gs6SO
         XdDCQN6rVEcMtpVP5xHNpDq1HYFhpzzd5W7cpjgDm4DepnxWo8gXCMvDrMySCVPX1/E2
         /p/J7YAolLB4YrqmLOcvZvIWG77BkvAZMvsr2QIGaMcq3C4M6HLalDHt7Q4nF7Eho1h0
         yncYj+oB4KTjzGExsCvTn+4yHL/CI5FZ2BLlMcOXa3XPDk8atbItLgbAnNKLvASwf67w
         Hxcg==
X-Forwarded-Encrypted: i=1; AJvYcCWDuwjXBTVKflf+jBu1sDjC7vjyUrs0j08mlLaUAI7sShjvqfgvmd7MtbDhy2LVUCGgRLY42N6zaztZ1jIamu8T@lists.infradead.org
X-Gm-Message-State: AOJu0YyFsjfuvZcr9/cojZYQ40ITxHS8yl68BhRLJqiMkAkczSbdbOin
	CJt83u3+g7BXToWmb6Fklso0Cbm1r/AIZ7rVUlwtJhZNR4o9WO87yfsgjAjFew3r8A==
X-Gm-Gg: ATEYQzxiSN8XKk4T5Q2IgABkENL/s0sZFfHtKVUTwQUR8YVCCJrhoM6j4kxwV75+gXn
	roX2xxFBs6l1orWjmwnwhb9Rc0Whxd24Yw3HZL3gk6VqueQ8Mo2Sx2/oGwAA8WpkQMei/TDMsYp
	+9Hmnuo1fo50PNqWuO/OgyuPbfNMb+g25xRl7xMMMstPMZ9Lh/a7eULycmz3j5REaQExwWoLsO1
	dsASGRHQfAsWTACMio6j7S8BBlERfb3wQfeljx5O5tK0kv/TUZahlPUKxQRLJzbt2YjzQBrKA4K
	RXZW8n6Uv4zANYpUlZiTxogvvecNamAIpWTUWcyHGg0SxUGd+I7vDDo5QDcwl32GrfEYx38pNNr
	yE2sDibXTB5R98Z42YRY24DemSBdFSDDyCcIYiPpbbyi72/LThFX5sVqV2fPnTS2mJI9PzB/aqR
	zGB5lZoUOT5/ThgIhaZfcLI7ycH/SJ3OWVbhSshF9od8X9BnhlpNgeubPUh3sjf5uekRo=
X-Received: by 2002:aa7:d1c5:0:b0:665:d39:4afc with SMTP id 4fb4d7f45d1cf-66a8274c788mr44728a12.6.1774454559069;
        Wed, 25 Mar 2026 09:02:39 -0700 (PDT)
Received: from google.com (209.13.205.35.bc.googleusercontent.com. [35.205.13.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b20265cc0sm4031066b.15.2026.03.25.09.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 09:02:38 -0700 (PDT)
Date: Wed, 25 Mar 2026 16:02:34 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	catalin.marinas@arm.com, joey.gouly@arm.com, maz@kernel.org,
	oupton@kernel.org, suzuki.poulose@arm.com, tabba@google.com,
	vdonnefort@google.com, will@kernel.org, yuzenghui@huawei.com
Subject: Re: [PATCH v2] KVM: arm64: Prevent the host from using an smc with
 imm16 != 0
Message-ID: <acQHGivPRWuVCkxJ@google.com>
References: <20260325113138.4171430-1-sebastianene@google.com>
 <acPi5V0DgGcgHNGO@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acPi5V0DgGcgHNGO@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_090242_604335_9D0F1E5A 
X-CRM114-Status: GOOD (  29.28  )
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

On Wed, Mar 25, 2026 at 01:28:05PM +0000, Mark Rutland wrote:
> On Wed, Mar 25, 2026 at 11:31:38AM +0000, Sebastian Ene wrote:
> > The ARM Service Calling Convention (SMCCC) specifies that the function
> > identifier and parameters should be passed in registers, leaving the
> > 16-bit immediate field of the SMC instruction un-handled.
> 
> That's not quite right; the SMCCC spec says callers must use immediate
> 0.

I'll update the commit message. it is the pKVM that doesn't handle it
(the imm16).

> 
> See https://developer.arm.com/documentation/den0028/h/ section 2.10
> ("SME and HVC immediate value"), which says:
> 
> | • For all compliant calls, an SMC or HVC immediate value of zero must be
> |   used.
> | • Nonzero immediate values in SMC instructions are reserved.
> | • Nonzero immediate values in HVC instructions are designated for use by
> |   hypervisor vendors.
> 
> > Currently, our pKVM handler ignores the immediate value, which could lead
> > to non-compliant software relying on implementation-defined behavior.
> > Enforce the host kernel running under pKVM to use an immediate value
> > of 0 by decoding the ISS from the ESR_EL2 and return a not supported
> > error code back to the caller.
> 
> From my PoV, it'd be fine to turn a non-zero immediate into an UNDEF:
> 
> * For HVC, we can say any non-zero immediate represents a request to KVM to
>   inject an UNDEF.
> 
> * For SMC, the dbehaviour is not defined.
> 
> I am also ok with returning a value in x0, BUT that's stronger than SMCCC
> actually requires.
>
> Mark.

Thanks,
Sebastian

> 
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > ---
> > v1 -> v2:
> > 
> >  - Dropped injecting an UNDEF and return an error instead
> >    (SMCCC_RET_NOT_SUPPORTED)
> >  - Used the mask ESR_ELx_xVC_IMM_MASK instead of masking with U16_MAX
> >  - Updated the title of the commit message from:
> >    "[PATCH] KVM: arm64: Inject UNDEF when host is executing an
> >     smc with imm16 != 0"
> > ---
> >  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > index e7790097db93..4ffe30fd8707 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -762,6 +762,12 @@ void handle_trap(struct kvm_cpu_context *host_ctxt)
> >  		handle_host_hcall(host_ctxt);
> >  		break;
> >  	case ESR_ELx_EC_SMC64:
> > +		if (ESR_ELx_xVC_IMM_MASK & esr) {
> > +			cpu_reg(host_ctxt, 0) = SMCCC_RET_NOT_SUPPORTED;
> > +			kvm_skip_host_instr();
> > +			break;
> > +		}
> > +
> >  		handle_host_smc(host_ctxt);
> >  		break;
> >  	case ESR_ELx_EC_IABT_LOW:
> > -- 
> > 2.53.0.1018.g2bb0e51243-goog
> > 

