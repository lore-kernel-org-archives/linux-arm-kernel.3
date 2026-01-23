Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D84AD72379
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 12:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7TjQY4k+dQBxbGIX17/gmMMohp7SpaOH5R0C6AKyoiw=; b=KIby12y3HoxCFbgNJFQinTXNWz
	tIi/8sELQdJZkYtqKNyisk0O22CviLRiIHIRnQzuUbhNhOzSl4O22DOWKDOKy9AllkBqZkLEqF2eF
	FJwGM0Mp4dsq2O2i4VnANgXF9OetBxEthC3dpWINqWDPhWso1dgRovnqCldfzvuGNjMgUqA8HsAwQ
	DF+8YDh+hbrm6gJb4clYrxL1s8nT0JW/+3EYx3aqExgptmWWr02NU1uHS/Iw5C4HK4NtYJbiykc8r
	96v0GveQHKKfmR7LjQJJqG0d+OyQtreAemUuyO0gCVhUBAwJEkeSqUmGKAQsJwmlgASIxCoTniGRd
	O3MO6tyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjG3r-00000008tGA-2akJ;
	Fri, 23 Jan 2026 12:14:47 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjG3k-00000008tEP-0cjK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 12:14:43 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-65819e75691so3791444a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 04:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769170478; x=1769775278; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7TjQY4k+dQBxbGIX17/gmMMohp7SpaOH5R0C6AKyoiw=;
        b=2f6ViHHipjudReGZunubb6FSZD/dTi1OKhdjyMZsM1jPTg6CCHHFhoVWsMENIL1rpo
         /fK1zJhb/4KNTmT83mvVZ7BNMnwmNImbjLI3xjQDZU+p6HUSd8kXjXbd7dkM2Hk5An2J
         t8QcXBKDmVGTyFDENFIHFpW6ZO1LDziSKTLNRnwk8f7JwjnFYF7mvI0+Xm8bAgioG9oF
         jju5uzSTL+PW/Hd6kHFvIVuhiIiLz37DSfY7NmnJecfkxLunjBjzdZhSAkeCL64QgTU7
         t9L0d/5UIrJi9rCeqzLYh9X/28LKU+xaINbyymlJptv28xPZLKd1bh6FoP8m21UnnYXj
         YewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769170478; x=1769775278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7TjQY4k+dQBxbGIX17/gmMMohp7SpaOH5R0C6AKyoiw=;
        b=ZlDucB1GJnkSLAMUjF+dsUbhKU0G7bKwL2hbrpK5T/LufIvL7lteXARKlXUeA1mF23
         w1gvrVUNClYOM2he2qZxdVH1XsknCXl09Xz/ryvtjYcrrrx6qdV6/mn2pc0Zq61tJNBg
         vGB9QVQi05rmB05J2AXPQk2fXdLgomETRiZHGpzHalbJw2HJqgTSrGGr61L4DxuSrrib
         7hIZfYy537sOyo6FfiGDQYbIxqiTyAfSM8SfOl7QHIv8kwrLDBUEeD1SFNm7qSJJjLu+
         fN3gXXcW+fF1Jm6flLDW0hh1Jh4cWE1qiiYrJWP8tFVk5UT+CR/0VZraXvP8I3O99rSx
         f6cg==
X-Forwarded-Encrypted: i=1; AJvYcCUBlN6CLugWMJ96ZCZBzbcHiDMMAMZYKNE/DljuDXzwy+wID4vdneGnuEcQL5wnndon5Cmt6R3dQbAnowfDAeTn@lists.infradead.org
X-Gm-Message-State: AOJu0YzIHm+VlOL8sQvDdP0ilFIyXV/c/SXg5nG9EI0z1r1qGwHdfGlS
	y0pUk6qmHtmpLNTnINoz/+H2E58wTi5slUYfX0t1oGn4RuucKDIQuaeLZygiIi+xXA==
X-Gm-Gg: AZuq6aIoQLmdTfvevfapek0HaCi7nA8P+mvF19yocCdzFUn6+Sq7eSy3jOjD6FVrdgR
	e2qFzICsiZtQXJC91INdbflov4T2GhpUsfkFmsl+XGXhBY2Y2rt3rvvGPgNPopG5+SkDeTNPqQ9
	xOWVN+/fQ4aroxePTSbjpO1OD5vAgX2Q3Cx2QdUh2bXXfLkg8m8OoJHzBPahmm6ya9Kk4VcsTSa
	eMqqBHF7mrn+zscQRZEkpwLQOedQpw/8nZ3aRb+nxrEYD8hQSq2eOVkWnuH+U4BQoE4YG191emh
	Aj3MBZS4/01koY/cc2U8XLPQNUnGcC4S4jVd4fRaqnJLtYY/u6ScKK5qkdNC/eQd3gAnICD9WKx
	RVGgxdkdn0ddbfLfhTIO+kJSCZkGl8CPmARjbN5zphFpBkaKSKI3twF06YeooitlwfWBSxDcMCc
	IRXhfdMJjfcf7WD62d2DU2bz3wx4ckurhWtCtuxqlG3h9jsK61EQ==
X-Received: by 2002:a17:907:2d20:b0:b73:544d:b963 with SMTP id a640c23a62f3a-b885abea126mr190175566b.13.1769170477880;
        Fri, 23 Jan 2026 04:14:37 -0800 (PST)
Received: from google.com (44.145.34.34.bc.googleusercontent.com. [34.34.145.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b885b6ff08csm99028966b.43.2026.01.23.04.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 04:14:37 -0800 (PST)
Date: Fri, 23 Jan 2026 12:14:34 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: rostedt@goodmis.org, mhiramat@kernel.org,
	mathieu.desnoyers@efficios.com, linux-trace-kernel@vger.kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jstultz@google.com,
	qperret@google.com, will@kernel.org, aneesh.kumar@kernel.org,
	kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 29/30] KVM: arm64: Add selftest event support to
 nVHE/pKVM hyp
Message-ID: <aXNmKpHqVw93BegX@google.com>
References: <20251202093623.2337860-1-vdonnefort@google.com>
 <20251202093623.2337860-30-vdonnefort@google.com>
 <868qe9mnx5.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <868qe9mnx5.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_041442_016900_D5F6A747 
X-CRM114-Status: GOOD (  21.85  )
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

On Wed, Jan 07, 2026 at 03:40:22PM +0000, Marc Zyngier wrote:
> On Tue, 02 Dec 2025 09:36:22 +0000,
> Vincent Donnefort <vdonnefort@google.com> wrote:
> > 
> > Add a selftest event that can be triggered from a `write_event` tracefs
> > file. This intends to be used by trace remote selftests.
> > 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
> > index 37c015b54ff6..e2de7ad64938 100644
> > --- a/arch/arm64/include/asm/kvm_asm.h
> > +++ b/arch/arm64/include/asm/kvm_asm.h
> > @@ -96,6 +96,7 @@ enum __kvm_host_smccc_func {
> >  	__KVM_HOST_SMCCC_FUNC___tracing_update_clock,
> >  	__KVM_HOST_SMCCC_FUNC___tracing_reset,
> >  	__KVM_HOST_SMCCC_FUNC___tracing_enable_event,
> > +	__KVM_HOST_SMCCC_FUNC___tracing_write_event,
> >  };
> >  
> >  #define DECLARE_KVM_VHE_SYM(sym)	extern char sym[]
> > diff --git a/arch/arm64/include/asm/kvm_hypevents.h b/arch/arm64/include/asm/kvm_hypevents.h
> > index 268b3cd7a1b2..c276fd28e0bf 100644
> > --- a/arch/arm64/include/asm/kvm_hypevents.h
> > +++ b/arch/arm64/include/asm/kvm_hypevents.h
> > @@ -42,4 +42,15 @@ HYP_EVENT(hyp_exit,
> >  	),
> >  	HE_PRINTK("reason=%s", __hyp_enter_exit_reason_str(__entry->reason))
> >  );
> > +
> > +HYP_EVENT(selftest,
> > +	HE_PROTO(u64 id),
> > +	HE_STRUCT(
> > +		he_field(u64, id)
> > +	),
> > +	HE_ASSIGN(
> > +		__entry->id = id;
> > +	),
> > +	RE_PRINTK("id=%llu", __entry->id)
> 
> Not strictly related to this patch, but I find that the trace itself
> lacks context. For example:
> 
> [001]	  323.847422: hyp_enter reason=hvc
> [001]	  323.847423: hyp_exit reason=eret_host
> [001]	  323.847688: hyp_enter reason=hvc
> [001]	  323.847688: hyp_exit reason=eret_host
> [001]	  323.847706: hyp_enter reason=hvc
> [001]	  323.847707: hyp_exit reason=eret_host
> [001]	  323.847722: hyp_enter reason=hvc
> [001]	  323.847723: hyp_exit reason=eret_host
> 
> That's all fine as long as I'm dealing with a single guest, or even
> with a single vcpu. Trying to trace multiple guests, or even multiple
> vcpus makes the whole thing completely unusable, because I have no
> idea what I'm looking at.
> 
> To make this useful, having some context provided by the host really
> is required.

I could add to the event header the VM pid related to the currently loaded vCPU
(if any). I can access it easily with host_kvm->userspace_pid. WDYS?

> 
> Thanks,
> 
> 	M.
> 
> -- 
> Without deviation from the norm, progress is not possible.

