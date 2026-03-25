Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBB7103A9BD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 11:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cs9jWxbOU9zeEIpB1f4ZXLcUS7XMeoF1APCchnD0TKU=; b=CARMD16lZftbHdQYU9LKxq5Jev
	G8jM3PqEEePLcp96KMcMGVMbi9pUCrk2U/MbTJ7v7UuizvHW7ISwfVzp8GIPTRcoZ1pp3DbSsymhs
	mLNiBRMu+FLUmls4SezA/LUJprun2hIruXLG2KIc30KDOeVKPuCTEzmH6AuqBlSQFzp8WqLbwnqWr
	Tk+OdXZBUxuxnqMX1o4Q5YY3pS542KADHzdXGie6rOnPE963RJPc9MmSMJ2O1yMycmIn5Nh5U2JMF
	Qpjc376ViZHwdOGgXL3/ZL+yuaY4/rD4UE9H2TvwMl4YLME3qpqUDV8AHDRr5W86i96urZfNW9jZ0
	HgIr6Tpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Mc2-00000003HiT-1U29;
	Wed, 25 Mar 2026 11:41:26 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Mc0-00000003Hhx-00au
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 11:41:25 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-485317b6bd0so56365e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 04:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774438882; x=1775043682; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cs9jWxbOU9zeEIpB1f4ZXLcUS7XMeoF1APCchnD0TKU=;
        b=kf2ntWOA32zrO2v+VCdihXsqc89HeWdycHkdYfpO8pzgb4WzFpIMNds96JgnzzAoU0
         ymUvw+1fDCLF6KRhTzLo0wZk/DkiTx39NAkb9Unqdr51WEsTRjMxiirREf/GsrDHVHHj
         FfKLSX0WMMlpD1Qx2L1myxXcUIdRs+//Mz6e/7mncGnM6g7zlE+kjjnDqNnDu88mst/I
         oezauMaaCWTCXV08Q0OGIGGuv5F5mGFJE4AH3kGWq8eI2ofsw/zX5U/8KbUMX0V4iiLp
         hWlQt1b9eGIKSBBcMwO3LLPUMr4Fuvj8UuTyS/e3gaCdBWp1IqVzSGGtQc4vxrsv77dz
         HUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438882; x=1775043682;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cs9jWxbOU9zeEIpB1f4ZXLcUS7XMeoF1APCchnD0TKU=;
        b=lTyRsXSaD9tM+4lTGUOrDiR4oJxTjogePUZ7udSPxx8HIPgL2EQW1BCWhvKiBtlFph
         2+lriQDKixrgf6RvY04+MiNLI5PLyHn2YTcTMB/WoQaSVAKUUXKl66wIwBNMtofwjR5n
         0JWaydhXObgWTpSCB5hJh91sJNoYpsXD/aGbDkZlY5sih3Ittv7pEFeXoqnFDIhMqoOs
         aByb8au4gyiZ8Qc+czBECFFo72oIWr3ewBp5bdSh6tHe5PcC0o8UNEp8oF2789GVu/5V
         JkjPkJdDww08/t/FWINHqnirRfAs0DyuPEKBq1MgTJPqhAX/DTirs1D3ff+DUBXm5J5N
         QYbg==
X-Forwarded-Encrypted: i=1; AJvYcCWCPYgEMqbuJ75n4zn9ue7bDgCmH4VjVbGfO3OcV3XylyvmuxrXQfB125UXtUV5tj6KjAlCI36J03/3JR7XJo8U@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5xbMFrdpILzPfVagycb/Ub81pKUEEjKz1xPmuxjIMmCVtE72k
	Q0KJcTzc2rhFcFo80Wp5wzaej9z87BcWg+3Pb+BTqXl8TiFfQbKm7o24Ti1ACtyHAQ==
X-Gm-Gg: ATEYQzwx/uC8BOXVSIElUtUQTlnsTWyvo2QJ8xXkSf+zySJRQd2sh/n5sxFgZuFerWl
	oFtXMu84LjYswsz+/FTOzlFwHYWSsuzOSvVEEqlwATqTYKTJo2y4z1NBLRj81TWNB+VLCnvsO3+
	zShgGR0sEnXAkc6e16yIwKFJuq6u0c+IEefYO0mVYdiPnc5whPLubybBfB2ME7OnB6Nuvj6TfJd
	8uKl5D59UN+B35abY4UR07kaR4sS8vxw2xs2eUMTxxL68aRBeKYwltC0EHalvGe8C28IRq63sOA
	dowTleuRc7Z2Dl7BUjhBfNnfHRAsJhnMaj//yxA9nMCXi43jEEDUDSJoae/AUF+53kfk8rgF62d
	gtUy4nZmsB+FYHFJtZlH4JVIDFR+nz0ztTAfMzeXXzyci9AHIo16jv4wW0RUzAE+4gsTF5KQI0J
	YK5hBWipCchLcvTSCeS3JEflU0zmpQknwiq/2bd9zjjh0zMpcevzpeuHl3D13su1Xhke0=
X-Received: by 2002:a05:600c:17d6:b0:480:683f:743d with SMTP id 5b1f17b1804b1-48716828baamr534525e9.14.1774438881656;
        Wed, 25 Mar 2026 04:41:21 -0700 (PDT)
Received: from google.com (209.13.205.35.bc.googleusercontent.com. [35.205.13.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644ae37dsm48451320f8f.2.2026.03.25.04.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:41:21 -0700 (PDT)
Date: Wed, 25 Mar 2026 11:41:17 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	catalin.marinas@arm.com, joey.gouly@arm.com, mark.rutland@arm.com,
	maz@kernel.org, oupton@kernel.org, suzuki.poulose@arm.com,
	tabba@google.com, will@kernel.org, yuzenghui@huawei.com
Subject: Re: [PATCH v2] KVM: arm64: Prevent the host from using an smc with
 imm16 != 0
Message-ID: <acPJ3Z9hDKc0Sm2t@google.com>
References: <20260325113138.4171430-1-sebastianene@google.com>
 <acPIdoA8oc7T8wKX@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acPIdoA8oc7T8wKX@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_044124_059185_8076FFE4 
X-CRM114-Status: GOOD (  27.61  )
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

On Wed, Mar 25, 2026 at 11:35:18AM +0000, Vincent Donnefort wrote:
> On Wed, Mar 25, 2026 at 11:31:38AM +0000, Sebastian Ene wrote:
> > The ARM Service Calling Convention (SMCCC) specifies that the function
> > identifier and parameters should be passed in registers, leaving the
> > 16-bit immediate field of the SMC instruction un-handled.
> > Currently, our pKVM handler ignores the immediate value, which could lead
> > to non-compliant software relying on implementation-defined behavior.
> > Enforce the host kernel running under pKVM to use an immediate value
> > of 0 by decoding the ISS from the ESR_EL2 and return a not supported
> > error code back to the caller.
> > 
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > ---
> > v1 -> v2:
> > 
> >  - Dropped injecting an UNDEF and return an error instead
> >    (SMCCC_RET_NOT_SUPPORTED)
> >  - Used the mask ESR_ELx_xVC_IMM_MASK instead of masking with U16_MAX
> >  - Updated the title of the commit message from:
> >    "[PATCH] KVM: arm64: Inject UNDEF when host is executing an
> >     smc with imm16 != 0
> 
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
> 
> I wonder if it isn't better to move that into handle_host_smc() as this is part
> of how we handle the SMC after all? (and it calls that kvm_skip_host_instr()
> already)
> 

I was thinking of doing that as well but I prefer this since we don't
have to look again at the esr in the callee. 

> >  		handle_host_smc(host_ctxt);
> >  		break;
> >  	case ESR_ELx_EC_IABT_LOW:
> > -- 
> > 2.53.0.1018.g2bb0e51243-goog
> > 

