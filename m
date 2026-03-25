Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223B1106B533
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 13:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dEAJKbeH8TFmmP9M//aSv092zDua7ieyLEIFGIIxFO4=; b=38ijETGWtMmrQOmE1Qhn9p1gPh
	7UIRwcty+EjF20+b9Qh/x4BMN2L3PgKuXujBfFmDA3OjfCrp5ByizUvVNeMhFfd07vADym1BWibSm
	Xwre1W4jZ4lluYLKxJF4A6YUvUs0RHHwIabsPakxA9h13Z0wpi40HRfp1YsuXyHIY1+klBlIy4GKq
	SyQXt0idiA8IROFQwbuMuVsqZq394HlmXohw/cG9d3aUgQGeWDMw3Ezk7r0cHPobD98pZ+i1uS6s5
	VWANI/4gLpbjtWCxPBRwho3P4yo9B5yiK4nHiKB0qWwD8qxGOVNH8thgl8yKQLuuNuvvVmqgPbte/
	A3mgdTeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5O6D-00000003RVo-2O0K;
	Wed, 25 Mar 2026 13:16:41 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5O6A-00000003RVL-3Dc9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 13:16:39 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-485317b6bd0so61945e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 06:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774444597; x=1775049397; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dEAJKbeH8TFmmP9M//aSv092zDua7ieyLEIFGIIxFO4=;
        b=sGflKcxArWFsFEXarLP4GZLdCkPSnh4Y4pXZagoBNAfX894RKuJX3o9U6n3ghlVzQK
         bXx4y8O7y8f1YUdfopaAOn3PZ6O4VJrgOxA8p/2ZP3ylT17GTPWN5PFPmMjmytwIVv3R
         DY6a6/o6zi7gte8Ci/KCq7Y/s9QyfI/DUyur8V2GPFbZcuKtcCyyB5Um9YarvfQMWooO
         yuMnbZvbM+opS/n4/zQPQ/iZ8L1e1bT/Ab9i3dAR0x1zayJykEng76i7lFcmtb10HS/4
         iaPLRb1sBTLATJdz8+91BGChnCo1ZUGHcicQRzN6ddoRp75VWz6RD/cFee/sq/aJBpaG
         AS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774444597; x=1775049397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dEAJKbeH8TFmmP9M//aSv092zDua7ieyLEIFGIIxFO4=;
        b=QFBntzoQ3Gxk2S/IQvOTCmqkcFZo4BOXaah7yjTv1wN25Za4Po8q3n8ImVJ19uR0X+
         OkPS3IA08z94uUOa0kZhdqQxpinVoILB0r4nPmUFj3fotwgH2R+QorDSselyA4+bee6T
         Fo9CItNxpxkr+I+mQyddnOUtX5E3i6fMOmrTO505bmUAqIZAc9DlbY3vvZmodZTuAq5q
         9iC4Fd8OYz9W9XeC3D6kJgLDIpPJ4fyR0AKOYhftQt4qA7vSuyc+aY3kEPRvhSzLH5zf
         vQeZttx0jctVhA9XmJCad5aQ5cp/McwA3rubcYH1r+qdp6Bu72HLZYDQrTWS2BT1a96w
         Wf+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXn2Zfjg1Lv+g3GSLihVxLmQBn38UKgXv+8smqzaE869F5DQDHRsTSL42zGd3f8iQ03tZrc41zt9qMzhipqNq12@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3mPAW21zsz/oYA2qMoxU2Xjkrkf3imnlq9Hbs8NpuDHqfDM8F
	d9AKGY/eFBErGnmfooM7qGzIn5AvuWKXWiwbWtNI607Mw/SiJEufh0J/tajWXlDXpA==
X-Gm-Gg: ATEYQzw5r4GXRsBpAT/Z9ajvw7AmLoPkgljcXMI2KUUd/O0CIRdsLyfoL3CL3zP/1xg
	YNrde3NoasUQYonVgPmsUg2b18K5b4aw2ZmLhO7YUDRAGVnEcaOuFwV3wNyM/X8u1iAe7FSvK2V
	96OI3TMDZSNoPK7OIpYg8uBrvvo+lXINEX5k6B3UCMM/b/ozR5jjDQ/OVcfgRfO2/3VSMV5o+DC
	7U5uI86MAMdYStsGj4WzD/TLYPtNkZ6oovCMVUXFsnRwH9AazwgwGiUgcRq6pKNY5CYFplPSr7L
	n/E/4MZkjem9k4bqVoizJjA+ZEOWQrh9WrFEF/sL2ePQmLU0qMcB4rmfD4V5cj4VYZepDrpq40N
	qSD+OoKmX5dCZcuygxsHXg1IAAHWgkU5sRnoHGfj/odjwy3FgW+cNfoXRlq3z+q4n09zWZinm85
	J/W4bnoG87OuzDaQBveD/Rz7cYS5drDyL50FM4LGZFEGRC1L1dRRCfPjk5KGzAYsOhG7E=
X-Received: by 2002:a05:600c:2d55:b0:47d:1e65:e841 with SMTP id 5b1f17b1804b1-48717896acamr410875e9.9.1774444596300;
        Wed, 25 Mar 2026 06:16:36 -0700 (PDT)
Received: from google.com (209.13.205.35.bc.googleusercontent.com. [35.205.13.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b87f80976sm9851996f8f.4.2026.03.25.06.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 06:16:35 -0700 (PDT)
Date: Wed, 25 Mar 2026 13:16:32 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: Vincent Donnefort <vdonnefort@google.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, catalin.marinas@arm.com, joey.gouly@arm.com,
	mark.rutland@arm.com, maz@kernel.org, oupton@kernel.org,
	suzuki.poulose@arm.com, will@kernel.org, yuzenghui@huawei.com
Subject: Re: [PATCH v2] KVM: arm64: Prevent the host from using an smc with
 imm16 != 0
Message-ID: <acPgMCuBX52LfnAH@google.com>
References: <20260325113138.4171430-1-sebastianene@google.com>
 <acPIdoA8oc7T8wKX@google.com>
 <acPJ3Z9hDKc0Sm2t@google.com>
 <CA+EHjTzeRiUvhDwAExpscWJfPNoRujeRAJ5dEDV4SMpOJK1K6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTzeRiUvhDwAExpscWJfPNoRujeRAJ5dEDV4SMpOJK1K6A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_061638_825970_7E50C956 
X-CRM114-Status: GOOD (  32.61  )
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

On Wed, Mar 25, 2026 at 12:16:17PM +0000, Fuad Tabba wrote:
> On Wed, 25 Mar 2026 at 11:41, Sebastian Ene <sebastianene@google.com> wrote:
> >
> > On Wed, Mar 25, 2026 at 11:35:18AM +0000, Vincent Donnefort wrote:
> > > On Wed, Mar 25, 2026 at 11:31:38AM +0000, Sebastian Ene wrote:
> > > > The ARM Service Calling Convention (SMCCC) specifies that the function
> > > > identifier and parameters should be passed in registers, leaving the
> > > > 16-bit immediate field of the SMC instruction un-handled.
> > > > Currently, our pKVM handler ignores the immediate value, which could lead
> > > > to non-compliant software relying on implementation-defined behavior.
> > > > Enforce the host kernel running under pKVM to use an immediate value
> > > > of 0 by decoding the ISS from the ESR_EL2 and return a not supported
> > > > error code back to the caller.
> > > >
> > > > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > > > ---
> > > > v1 -> v2:
> > > >
> > > >  - Dropped injecting an UNDEF and return an error instead
> > > >    (SMCCC_RET_NOT_SUPPORTED)
> > > >  - Used the mask ESR_ELx_xVC_IMM_MASK instead of masking with U16_MAX
> > > >  - Updated the title of the commit message from:
> > > >    "[PATCH] KVM: arm64: Inject UNDEF when host is executing an
> > > >     smc with imm16 != 0
> > >
> > > > ---
> > > >  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 6 ++++++
> > > >  1 file changed, 6 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > > index e7790097db93..4ffe30fd8707 100644
> > > > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > > @@ -762,6 +762,12 @@ void handle_trap(struct kvm_cpu_context *host_ctxt)
> > > >             handle_host_hcall(host_ctxt);
> > > >             break;
> > > >     case ESR_ELx_EC_SMC64:
> > > > +           if (ESR_ELx_xVC_IMM_MASK & esr) {
> > > > +                   cpu_reg(host_ctxt, 0) = SMCCC_RET_NOT_SUPPORTED;
> > > > +                   kvm_skip_host_instr();
> > > > +                   break;
> > > > +           }
> > > > +
> > >
> > > I wonder if it isn't better to move that into handle_host_smc() as this is part
> > > of how we handle the SMC after all? (and it calls that kvm_skip_host_instr()
> > > already)
> > >
> >
> > I was thinking of doing that as well but I prefer this since we don't
> > have to look again at the esr in the callee.
> 
> This is a non-trivial amount of code to have in a switch. Can you
> please put it in a helper?


Hey Fuad,

I will move it as part of the handle_host_smc(..) as suggested by other
comment.

> 
> Thanks,
> /fuad
> 

Thanks,
Sebastian

> >
> > > >             handle_host_smc(host_ctxt);
> > > >             break;
> > > >     case ESR_ELx_EC_IABT_LOW:
> > > > --
> > > > 2.53.0.1018.g2bb0e51243-goog
> > > >

