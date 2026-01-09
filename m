Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D7CD1680B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 11:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcRKW9XG66IWSuObrKpBcxYjxRwc8D6DgwgNC2eRp3A=; b=G6fWU24JHHKiLopXwP53AdDbI1
	6jiAwTMUOa8ijm1w/89R2z8q3/IYPxHfnSNp6vXpmRDuRhRgIL4zodv2ImphJfGruNhv2pSRrfFsx
	IPqF+qAzT7dq+DEMkJ4HDjVaHpRaiM+wp5WoWyK6E6o+xlbql6VO+rVFKMj+sJWtktDe1Va93MP9i
	lQcfFZkeO8pGue8JMfru+6jwEJDNe8xPopIM1mavw7gX5g/XfXqNHihixCiAl+C78NAo0a9qKY/KA
	1ALQVUs5OCtZEUy7hNXoauqft+VkOGO+psrjLsM3w8DN1THg7xoMcLkCtcnQ3jNn+voF6F1TJSaRz
	bkOPHepQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAVu-00000002Chw-36Oc;
	Fri, 09 Jan 2026 11:18:42 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veAVs-00000002ChO-2jsY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 11:18:41 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4779e2ac121so44365e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 03:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767957518; x=1768562318; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LcRKW9XG66IWSuObrKpBcxYjxRwc8D6DgwgNC2eRp3A=;
        b=zjs/AvOxlvh0SnNb+rrOHbPbIpGRA/O9B5yE2q6h0I5/QWsVG7ZYCrHRtHGDUItkvP
         UAeNUNIOl5Ib4l1nvV8URStOJK+Cgt6aQTe4xZ2WbcSf8qdu78DDI8QUDeWOcpUfZLXk
         K0YhF0NvYMplCU61r+Ymd+yn9G+XcMNQkuGYoqZT3CYsq4waNr6knPq2Mmupz0sbKoCP
         VCQlsx5f7q2z2psxPRfF6nDnP+h7+CICgdX65nZh4ecJkot9nidDYD2ri7O5JKpgUoXS
         Obj6OGTu23NdpgpxIlV9Fer54rDVuuDBIzSPc5wTMwLVINnrjCY5rtErgpzdIpRp2Y6O
         eE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767957518; x=1768562318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LcRKW9XG66IWSuObrKpBcxYjxRwc8D6DgwgNC2eRp3A=;
        b=Y/pQ1Iu63Xd8rQrdZImB12SWxOklSmMF42cIR3MZm407AP6G1oS/Gc730eEQub+e58
         FRyIkeXsohNlEtorgqlqKo4kYxuoZcM+nE9Y4bFCxwC2gV/4a8sZPheCzp0sUlqHDYRz
         SgaEbTxXttjAD5PG3eCpPgv3uPzuYnCwjUFGXGmETMzr/URSie8QCP7iamw5D90/eC4p
         CWY42/WMFLJAorpFXiGfjJ2YfgO8x/PQJXx9e9J5tJ2r93cESE+DdaIUOk82GtittTaK
         S0wywpPQD7iVpZa8vjfq9j4q7YMksWn0oWsGRxxf5KeqA7eNMYemAIIpoG4Ikdkl8Ivk
         UG/w==
X-Forwarded-Encrypted: i=1; AJvYcCVoIYCExNsCH4kjv2jd2kZFkF8kDtxSgK+jSZTwRbgSpo16r/R0/k0lZw2L5lehKT4p1X3dYNIfcSWAu3v1sfyJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwZnS4c9gf0Mvq6n15id/hV4uC4NtwprJ8YjD9rAgCuDi2PvIVB
	3B4jXy5wrls4F+zde5ujyXBZ0MWA5w3SF4VbE81umn13nXXRAgtGhwsjCND6JnRzsg==
X-Gm-Gg: AY/fxX4oB2XJ7gyAb5cEVH2rYpA1UgEnyrlgPQ/FtDV+otugH59ArfMZ+gor6rM1bOD
	ZD4R99FbyWirPNG6zikkYf3mfmS+RFwSaDGZcJTUse/vomlQ339Wa06OTclIq++8WAiYlVV1RMp
	kiopfUiNfk2OJnwADXFUpDrQG7Yu9wRz40UbLCFjq2II1TecIJvX3WXB1pS5zFg4IberFwVQwd8
	GRPojyiEkvJnKsxaCkSLPVdPUYlcjvuh00XMVgWqrd8O4J3XyjcB1KVQ2pSBBYDOigpjvIlqdjy
	thP5BWFA6VGqmfJIW8nW5rtPF1Hcber7ObGwJlBf8UEK8QWGIsxnxQOOFSYf74ZPLkqiPEZQ4Aa
	aTsUeMtfrXxYBiAdj3yhKxhh1XcyOZRMgia0S+yxKG5CTNt7vkRou2ijQL9tjghHmj7G+GFXIg0
	yE0lw34rVpr/vBkQyJMGlpNPo+drYLIj4cgwYfh8Oa9Uuy+TU4hi2A
X-Received: by 2002:a05:600c:755:b0:477:b358:c0cd with SMTP id 5b1f17b1804b1-47d904419ebmr504375e9.18.1767957517587;
        Fri, 09 Jan 2026 03:18:37 -0800 (PST)
Received: from google.com (238.18.78.34.bc.googleusercontent.com. [34.78.18.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f703a8csm200896695e9.13.2026.01.09.03.18.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 03:18:37 -0800 (PST)
Date: Fri, 9 Jan 2026 11:18:33 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Will Deacon <will@kernel.org>
Cc: perlarsen@google.com, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>, Ben Horgan <ben.horgan@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Armelle Laine <armellel@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] KVM: arm64: Support FFA_MSG_SEND_DIRECT_REQ in
 host handler
Message-ID: <aWDkCQ7m1-w8e-Py@google.com>
References: <20251119-host-direct-messages-v3-0-c74d04944b26@google.com>
 <20251119-host-direct-messages-v3-1-c74d04944b26@google.com>
 <aV_MnW8cg7IsWPuD@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV_MnW8cg7IsWPuD@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_031840_711693_C66ECCEB 
X-CRM114-Status: GOOD (  25.82  )
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

On Thu, Jan 08, 2026 at 03:26:21PM +0000, Will Deacon wrote:

Hi Will,

> On Wed, Nov 19, 2025 at 02:07:53AM +0000, Per Larsen via B4 Relay wrote:
> > From: Sebastian Ene <sebastianene@google.com>
> > 
> > Allow direct messages to be forwarded from the host. The host should
> > not be sending framework messages so they are filtered out.
> > 
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > Signed-off-by: Per Larsen <perlarsen@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/ffa.c | 22 ++++++++++++++++++++++
> >  include/linux/arm_ffa.h       |  3 +++
> >  2 files changed, 25 insertions(+)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > index 58b7d0c477d7fce235fc70d089d175c7879861b5..a38a3ab497e5eac11777109684a33f02d88d09a1 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > @@ -862,6 +862,23 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
> >  	hyp_spin_unlock(&host_buffers.lock);
> >  }
> >  
> > +static void do_ffa_direct_msg(struct arm_smccc_1_2_regs *res,
> > +			      struct kvm_cpu_context *ctxt,
> > +			      u64 vm_handle)
> > +{
> > +	DECLARE_REG(u32, flags, ctxt, 2);
> > +
> > +	struct arm_smccc_1_2_regs *args = (void *)&ctxt->regs.regs[0];
> > +
> > +	/* filter out framework messages */
> > +	if (FIELD_GET(FFA_MSG_FLAGS_MSG_TYPE, flags)) {
> 
> Wouldn't we be better off just checking that flags is 0? The rest of it
> is SBZ or MBZ in the current spec.

Yes, we can simplify it in this way.

> 
> > +		ffa_to_smccc_error(res, FFA_RET_INVALID_PARAMETERS);
> > +		return;
> > +	}
> > +
> > +	arm_smccc_1_2_smc(args, res);
> > +}
> > +
> >  bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
> >  {
> >  	struct arm_smccc_1_2_regs res;
> > @@ -920,6 +937,11 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
> >  	case FFA_PARTITION_INFO_GET:
> >  		do_ffa_part_get(&res, host_ctxt);
> >  		goto out_handled;
> > +	case FFA_MSG_SEND_DIRECT_REQ:
> > +	case FFA_FN64_MSG_SEND_DIRECT_REQ:
> > +
> 
> Weird whitespace addition ^^
> 

Let me clear this space out.


> > +		do_ffa_direct_msg(&res, host_ctxt, HOST_FFA_ID);
> 
> What's the point of passing HOST_FFA_ID here? Is that supposed to end up
> in the Sender ID bits of W1?

I can remove it, this doesn't bring too much for upstream but on the
android kernel with guest-ffa it makes sense because we need to validate
the sender to prevent impersonation.

> 
> Will

Thanks,
Sebastian

