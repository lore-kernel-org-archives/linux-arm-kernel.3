Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F153CD98C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 08:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tGU8nVvV78ihw3NmTIZ6FVq1Rp8AH5EC4+xF0UY8JZg=; b=bfM8K35TpW2y6XWMzI7KlSzZYl
	rpI9hWhNpbXYzI7vHkRjlLc4XePu6cJEAo4ooTAyGopak2LNyxsafTGf//R4JLr44b2/Cuw+vC0hr
	tcQxkholuaY+UcZGgP6qrevYmT4OWqNigDirmYtmaSn3NkAvqggGySMTArxnkNV14hpp8DNHXoWXo
	cSu56Dh1iEGGXPs8qto3TOy82r8mIfdzQ1c1rCaPCYJTSHZz5i7WOFuZIRcGuP8cQUcFEmZbsF4Km
	Z2oLNsxp9jIsgaxa6Su/xDSxrDf1er22lkbYHdn1U8mbdrkoLuSpE+8trzc9p/p3X/zueaPeWMo9d
	PhJd0Kkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXb4M-000000092hY-0Ub7;
	Thu, 11 Jun 2026 08:47:22 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXb4I-000000092gy-3b6z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 08:47:20 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-490b23c828aso40985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Jun 2026 01:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781167636; x=1781772436; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tGU8nVvV78ihw3NmTIZ6FVq1Rp8AH5EC4+xF0UY8JZg=;
        b=m4R6mpJjdd4V43DDpoU3rM8WhP3UsBnTHfFkEG30bZ464wQcGCOg1MPNWYsc0gY0My
         6Qpru9FP4VLzBZgb+Ayxx5y2lf9lR7p+UXRGoGlUa79g+CXQDVuiSpLquyc3UtaWBsvX
         yQ7XcP1Y3zoYsT74bgVPPYyB4cvNSLkHL6z5T/ZWw03U+gCJCfnud8vBPb7ms4BWCh/u
         nipUIop0PEh6XlSj7HNWSSwnZIILeJQHO8jumVitBgNTRCCqt0xJujFGvKERUz/UIpIZ
         eVxu6krS1l/G0QJZXh2Du04fHorWBjan1aw+Xlfe4Fsh00sXhSQub6+ga+twZbUmv8Yy
         JK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781167636; x=1781772436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tGU8nVvV78ihw3NmTIZ6FVq1Rp8AH5EC4+xF0UY8JZg=;
        b=X9HXkhEZrfLsCZBNyk/foh42cmIy5J1Ily46ZoxNGZwI5eobp1vr9DscvkvM7TtQiN
         sH13y5oISgDVuvrwzXME9POoFzt83q6M+xPL/mI4wZ7sjgatDx5dNs5aG1qcQMps1ePr
         7KhSwcrXigmkU+nPiTF45Z0Gd3dgFth22vARipMhDZ/1kgxWEK6WYArVS6D2pngiWUj+
         oyN9ouAnwbRFQakUazcsfKpoqyrB/2Br1txsS6JZ4LNbLukLzVT+DEkRiAE5PwvlZsTy
         V9pm54p4GDMulnwCqKAzXS+ik0HBiCFarEbcwkxXAJcmDjAOCMiW4ANArV8kKxCXZRaT
         Cfsg==
X-Forwarded-Encrypted: i=1; AFNElJ/kiaHGF33qe6RAXTSUIGHIF0MJ1qSywqanqEG0flWe5evyogthIyjbcC4cTe4fB8viZzxM8rTrybftEXV3DnvS@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/fydyRt4PYDnPL3yAFa2o0t9aTkEdvqkiDc0/ESuHqZ5sAis8
	7lvs2Vm0kIBb19H8UT8r1Pu87ebzVwvn90hdIajr5EeKCtgeWALySALoZvrMkaV5yA==
X-Gm-Gg: Acq92OGId2FoqKYkrUnJem3ER757bf57gGwGqT6VPQUcd0bESc4d0sk5uSR7kre+cbq
	Yjx76LyBhQ1ioXBz6q+Ky9s/wYStaGgzqQOlUZahZa89GL8ngCrprD6fPt/mMeMOXK4J7lNSX2m
	Cjh3TDr/XsanfEILfc8OfQQvmamDCq3ZWyM1ObuYDfDhqoa5MsICfWXTNnbVhrCRES7JEbF/Rj9
	amd2H1ALvU2/dY26lEXXT5cwYscskKBYzVeVi8JAFKbpQT68/Tb5n6oB1uoa4EgFgcloPhoCOu2
	JiJYlpr4PIC4OufuO8iGBYwTcfQNzUfiOUBhUa3NoXclWs+nqIMWeYFjm5ykSwPMW06xN47FVFc
	VrRyJzx7UonOptldyndeavmQaqv/OIvYbPOUMRKogxAwAufdVhhdBtambhlgdUdqLJzzRoBpUgk
	bXO4TvSZh/3/hauLSdnTKCk0Z0Klp2AsPU7NptKdnM3AUvrr+iBoR5mj0oyxGH6fhw4HqQvJoF8
	dwxlBiN
X-Received: by 2002:a05:600c:1d08:b0:490:b0f1:3422 with SMTP id 5b1f17b1804b1-490e47a5322mr838045e9.10.1781167635397;
        Thu, 11 Jun 2026 01:47:15 -0700 (PDT)
Received: from google.com (143.11.148.146.bc.googleusercontent.com. [146.148.11.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dcbdsm66597719f8f.7.2026.06.11.01.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:47:14 -0700 (PDT)
Date: Thu, 11 Jun 2026 08:47:10 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	will@kernel.org, joey.gouly@arm.com, korneld@google.com,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, android-kvm@google.com,
	mrigendra.chaubey@gmail.com, perlarsen@google.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v2 2/7] KVM: arm64: Support
 FFA_NOTIFICATION_BITMAP_DESTROY in host handler
Message-ID: <aip2DjVsuFIsxLpo@google.com>
References: <20260608165549.1479409-1-sebastianene@google.com>
 <20260608165549.1479409-3-sebastianene@google.com>
 <aikmBBHEUfolXrHC@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aikmBBHEUfolXrHC@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_014718_916475_4CF05727 
X-CRM114-Status: GOOD (  22.15  )
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

On Wed, Jun 10, 2026 at 09:53:24AM +0100, Vincent Donnefort wrote:
> On Mon, Jun 08, 2026 at 04:55:44PM +0000, Sebastian Ene wrote:
> > Allow FF-A notification bitmap destruction messages to be forwarded to
> > Trustzone from the host.
> > 
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/ffa.c | 24 +++++++++++++++++++++++-
> >  1 file changed, 23 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > index c20d45191085..91e89d889c44 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > @@ -688,7 +688,6 @@ static bool ffa_call_supported(u64 func_id)
> >  	case FFA_MEM_DONATE:
> >  	case FFA_MEM_RETRIEVE_REQ:
> >         /* Optional notification interfaces added in FF-A 1.1 */
> > -	case FFA_NOTIFICATION_BITMAP_DESTROY:
> >  	case FFA_NOTIFICATION_BIND:
> >  	case FFA_NOTIFICATION_UNBIND:
> >  	case FFA_NOTIFICATION_SET:
> > @@ -893,6 +892,26 @@ static void do_ffa_notif_bitmap_create(struct arm_smccc_1_2_regs *res,
> >  	arm_smccc_1_2_smc(args, res);
> >  }
> >  
> > +static void do_ffa_notif_bitmap_destroy(struct arm_smccc_1_2_regs *res,
> > +					struct kvm_cpu_context *ctxt)
> > +{
> > +	DECLARE_REG(u32, vmid, ctxt, 1);
> > +	struct arm_smccc_1_2_regs *args;
> > +
> > +	if (ffa_check_unused_args_sbz(ctxt, 2)) {
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
> > +	arm_smccc_1_2_smc(args, res);
> > +}

Hello Vincent,

> 
> Sounds exactly like do_ffa_notif_bitmap_create. Could we use a single one
> "do_ffa_notif_bitmap" ? 
> 

Yes, I guess we can have only one method since the only difference
between them is in the number of unused args.

> > +
> >  bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
> >  {
> >  	struct arm_smccc_1_2_regs res;
> > @@ -954,6 +973,9 @@ bool kvm_host_ffa_handler(struct kvm_cpu_context *host_ctxt, u32 func_id)
> >  	case FFA_NOTIFICATION_BITMAP_CREATE:
> >  		do_ffa_notif_bitmap_create(&res, host_ctxt);
> >  		goto out_handled;
> > +	case FFA_NOTIFICATION_BITMAP_DESTROY:
> > +		do_ffa_notif_bitmap_destroy(&res, host_ctxt);
> > +		goto out_handled;
> >  	}
> >  
> >  	if (ffa_call_supported(func_id))
> > -- 
> > 2.54.0.1064.gd145956f57-goog
> > 

Thanks,
Sebastian

