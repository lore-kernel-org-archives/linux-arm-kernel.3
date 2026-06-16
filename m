Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2D7CD98E4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 14:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WN0VoyJSdGBAv/IhP+imIDKlWMbgWzg/nEEnuq2GZ8I=; b=uSPm+WSGTOeyMJPUfTEK79jY+n
	GtGY/unNetBoHNrUCbktALoIhVhv6RmnZoCjgFIPZXWRBoT3NLStyZSuE7BTSKNJ0D14fGtuQw+bl
	vebQnfVUHiPqZcY10+pO1bc0oMC5zcFWfrokldjSYC8Po66aTKjSFGghX4r11FEIEBxxKxF0A1H81
	2B1arpM97bkE+QgiU0xroqO+SbX0H33eZvAdnnhvt6155vajS/eojb48sU/zhG8dYpUAxqoCQfK+H
	g8VibFTPPSpAz26LLJO5c5sCFAuclOKmL3zjK/nWvNT023RbepJMaocuSrVNQcDa8cLlPUbiSKJN4
	gNs8M2FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZUmW-0000000Fv5n-36wp;
	Tue, 16 Jun 2026 14:28:48 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZUmT-0000000Fv5O-3Jsn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 14:28:46 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490bb5ad3bdso53295e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Jun 2026 07:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781620124; x=1782224924; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WN0VoyJSdGBAv/IhP+imIDKlWMbgWzg/nEEnuq2GZ8I=;
        b=WrLE+sizuQsg7FDpyodJn9C6QBoEVfzTl8yW0MsY9qD2o1mOJlqKtgwQ5cEgoWQnyA
         mWEFeEyWcyhfTlIB21mRPz3mgSzL1V7tY+BZBnqceZW9z7FZk1J/bVwuVjhTgDzsvFnz
         Q09NEzHW8EbGTSH1rcgpyjwJ+KIGP/AlrJBPJprAVZyYkoVGjlUu03VVzJbIB7a11T9y
         HrSnBdgzLdTzUpwhWGrAnWX4ThFNELx2seoSOcapqVUD+J7PCDOhX149LACf59eCcLXp
         bFvY6SpQwAaFj5KpiL+5FNWGZFSfehPVSmxrXURDab55fS/TAXpBUECN0PWqfGM6EiQh
         y4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781620124; x=1782224924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WN0VoyJSdGBAv/IhP+imIDKlWMbgWzg/nEEnuq2GZ8I=;
        b=cIiwoY8P2p0RGGc6EZkRx7I6hcny40cdclTOKCAvqhB7WjiWhknTkyUHLkZQnuxeJf
         5SqPffd8DnVbVWtUpNwUIm9G5842k2usBykHv7ZHWBGaJKVtzeTKUGKEZ9sd/GDR5VVC
         JlmRAMsRWOwzZ0kbry5njVHoRh44uc6+kDOYlZePR99NEgNvlafyk8Q7CC9u7Td6zld5
         leETS4TzeOmBd0CWqTnsc8hBCNl25PXvP+hZBIOYs50SnF0XGQKSjYznhT0XEHApgl0g
         VMYVuahmnKpRowkxvrXUFZl8p3VK3+P1/h5VWGozEQ3AqEqbOEhfTha0aByEHDHiEW01
         3izA==
X-Forwarded-Encrypted: i=1; AFNElJ+BjxrgZmxIpuhqbTqusqFLehyKoupYIqBj80bcys4IlvBRml/v7FtpRu9dvfGWWbwobP94xfTJl8HLSbAxKCQk@lists.infradead.org
X-Gm-Message-State: AOJu0YyjQxRHUkFphgqoMofsFqBEYpOMCnLrlK5dQ+3yDIedeqhnFa4l
	hKzDd853L8JUXeVQAz09krJpF93mj/Wsx+CkKmnfQinQIPih7ha7CP7ZWvv5d2nxMg==
X-Gm-Gg: Acq92OE/sTJs5Hs0cPVuKnOiE9IYqRuTkMdg86jDHG2sS0xeHmQnFEAwFimW7OVFHDg
	fF14Zt5UuqWnBCWmHipBcwTDLIeGzP7z1a0anyipZKLEg+FBM/Ycy2z6rx6V1Oht3iP2KRChIXR
	i1gzPTEMqiD9SCLSCfJhAJGHvYEHgc9XbQQ2myO1qQ0C29/LbcUiLUAgkbKlPDGcBwK54FG5wxD
	eF7nY/OMhsZGAZY0HhadhWSB+YMMuV0X8LCxd0rU0doWaeXjqDygkat1urbTGvC7iodTocNmThd
	D6vMS8n1NfCk0zUteOsh6QqKBEmkaoXPZcRX7Y7sj6r4YmFWC+71aI98N23aEZOWTzD+2ohY/hf
	pvcYKnM6g/Y674X16II4RivHZH+Z+DlZu30JyxP3p3FAbIsXtCoT2xZMkdAJ6K2VFXUTDrRFvtA
	2PjrHrbVJ33BXnCCwTIFHZuPegjoCizz9v38Yj3bcJcjHyMrsv5bcbP7sfoLUCfMvuJSyrfg==
X-Received: by 2002:a05:600c:68d9:b0:48f:d634:b18d with SMTP id 5b1f17b1804b1-4922ffc8997mr1004755e9.8.1781620123211;
        Tue, 16 Jun 2026 07:28:43 -0700 (PDT)
Received: from google.com (143.11.148.146.bc.googleusercontent.com. [146.148.11.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4619a041986sm20994761f8f.23.2026.06.16.07.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 07:28:42 -0700 (PDT)
Date: Tue, 16 Jun 2026 14:28:38 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	will@kernel.org, joey.gouly@arm.com, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v3 1/7] KVM: arm64: Support
 FFA_NOTIFICATION_BITMAP_CREATE in host handler
Message-ID: <ajFdlmLQ8q4J-gMH@google.com>
References: <20260616105417.2578670-1-sebastianene@google.com>
 <20260616105417.2578670-3-sebastianene@google.com>
 <ajFEOK3bVu5QRoCv@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajFEOK3bVu5QRoCv@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_072845_852101_F870F3B8 
X-CRM114-Status: GOOD (  24.51  )
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

On Tue, Jun 16, 2026 at 01:40:24PM +0100, Vincent Donnefort wrote:
> On Tue, Jun 16, 2026 at 10:54:09AM +0000, Sebastian Ene wrote:
> > Allow FF-A notification bitmap creation messages to be forwarded to
> > Trustzone from the host and introduce a helper to check for SBZ
> > register fields.
> > 
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/ffa.c | 36 ++++++++++++++++++++++++++++++++++-
> >  1 file changed, 35 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > index 1af722771178..b1e5f9ee86ef 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > @@ -71,6 +71,18 @@ static u32 hyp_ffa_version;
> >  static bool has_version_negotiated;
> >  static hyp_spinlock_t version_lock;
> >  
> > +static bool ffa_check_unused_args_sbz(struct kvm_cpu_context *ctxt, int first_reg)
> > +{
> > +	int reg;
> > +
> > +	for (reg = first_reg; reg < 17; reg++) {
> > +		if (cpu_reg(ctxt, reg))
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}
> > +
> 
> Hum, there's something a bit weird, as this function was introduced already in
> the previous patch. (and both have the same number)
> 

Something is messed up here, I will have to spin a new version. Thanks
for letting me know.

> 
> >  static void ffa_to_smccc_error(struct arm_smccc_1_2_regs *res, u64 ffa_errno)
> >  {
> >  	*res = (struct arm_smccc_1_2_regs) {
> > @@ -676,7 +688,6 @@ static bool ffa_call_supported(u64 func_id)
> >  	case FFA_MEM_DONATE:
> >  	case FFA_MEM_RETRIEVE_REQ:
> >         /* Optional notification interfaces added in FF-A 1.1 */
> > -	case FFA_NOTIFICATION_BITMAP_CREATE:
> >  	case FFA_NOTIFICATION_BITMAP_DESTROY:
> >  	case FFA_NOTIFICATION_BIND:
> >  	case FFA_NOTIFICATION_UNBIND:
> > @@ -862,6 +873,26 @@ static void do_ffa_part_get(struct arm_smccc_1_2_regs *res,
> >  	hyp_spin_unlock(&host_buffers.lock);
> >  }
> >  
> > +static void do_ffa_notif_bitmap(struct arm_smccc_1_2_regs *res,
> > +				struct kvm_cpu_context *ctxt)
> > +{
> > +	DECLARE_REG(u32, vmid, ctxt, 1);
> > +	struct arm_smccc_1_2_regs *args;
> > +
> > +	if (ffa_check_unused_args_sbz(ctxt, 3)) {
> > +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> > +		return;
> > +	}
> > +
> > +	if (vmid != HOST_FFA_ID) {
> > +		ffa_to_smccc_res(res, FFA_RET_INVALID_PARAMETERS);
> > +		return;
> > +	}
> > +
> > +	args = (void *)&ctxt->regs.regs[0];
> > +	hyp_smccc_1_2_smc(args, res);
> > +}
> > +
> >  bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
> >  {
> >  	struct arm_smccc_1_2_regs res;
> > @@ -920,6 +951,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
> >  	case FFA_PARTITION_INFO_GET:
> >  		do_ffa_part_get(&res, host_ctxt);
> >  		goto out_handled;
> > +	case FFA_NOTIFICATION_BITMAP_CREATE:
> > +		do_ffa_notif_bitmap(&res, host_ctxt);
> > +		goto out_handled;
> >  	}
> >  
> >  	if (ffa_call_supported(func_id))
> > -- 
> > 2.54.0.1099.g489fc7bff1-goog
> > 

Sebastian

