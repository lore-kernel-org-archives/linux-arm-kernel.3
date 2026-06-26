Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2243CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 07:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sviuXWEudL4Lc2OsPUzpYG5n9t6uIjHNaWvGJZaU1Ew=; b=JoSGtgHCSmpYekLUjORRJR0sIb
	iR6QphVcHm08XkcIvNss4/OI1SoO5XuH5bNJicPCMrBs4XcuMAoUdK+gToFyL8oAmgN1o3MwVyBcC
	kmPZ9bzspi3kTo8lYBlEdAIfgrnAlmI9R4fV+yhq6j1agA650ZqBVEDrTiPOGsJXMHn7S/Y1o//05
	yWdq43yqOnx6Ti5yNqg4HXHX8xzQrJawliMuwVKxZcz07qoJ+aZDJDBwjt7u5SPOXSGjjX+McozMC
	TDOgprKWjGHZkZPg3CRgQCXUUWrMVxDkWxuvrj4D8uZI/SXs3iLMm593719XdSffSxUAMU+Fp7nvT
	/gM/sEMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1J1-0000000AibP-1aJy;
	Fri, 26 Jun 2026 07:48:55 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1Iy-0000000Aia6-1j6c
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 07:48:53 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4926e5803e5so4245e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 00:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782460129; x=1783064929; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sviuXWEudL4Lc2OsPUzpYG5n9t6uIjHNaWvGJZaU1Ew=;
        b=C1SQAEI3WVbOqfzhqoYNn62Kjj2ll1N7VOaytyDtzHEEuutZnOxau/sLVbTEfA1i7I
         Xq43pgALVPlLKaRuBFVcgIMwCEZ0PP8E/R+12vij48Km00BRncQGfGE5yGiAmrnuW7MD
         4JTb9JUuzHFI3aSoHxHDeh4ni7kh/RXNKijdOyEqAxLtg+Et11xoX9upngIlZG1YwwpL
         CN3RL8DqDPa3oY3/iUDCko676ZHBttc0h06LBUuVh68EF2Rfp/gN+DQfv8evKFPKqZkI
         svyyccw506TNftH6jwSd7JCuPdfuj0B6C9SEPmQKcRCUpb2H6mmqW3stloe1Bn3KjjBd
         3bKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782460129; x=1783064929;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sviuXWEudL4Lc2OsPUzpYG5n9t6uIjHNaWvGJZaU1Ew=;
        b=L+qi/49kMgInvecXWuOZs8wJRU+l2eFAydaszX6jqaJKJqiaTY9A2VgmivYQAhDI7D
         8ljKyNjZR4xceGox5NxpHkrvKTeE2DKsMoudKUg/6F9P4Z9zthRrXKfEIa3DNwKBYaJL
         plYXfvrmChRHNKGF/oTjr3vS6QjpZu3s9cXdsiCwx44n4C22hXpcj8Z8Wik+5Ia32aZC
         UHApzFz1mKFsS8AiLe3/iT+03tjVjx/f6XaK1lCK0X1Md1Ovcqn+WcFBxmRP2RVmXKDG
         b62Twwxs3fh/Z9GdHKLuDnDIl9du0dwOm74RQzBMrMnxNdFIxVoXy6+5UdH7Ogkb1eFC
         ZT2Q==
X-Forwarded-Encrypted: i=1; AFNElJ9JKBCDc+ApFbjvkbypAK0XiUAvRNOARJMA7LhdtkKgrO4SGcDYcSx5sZZknoz9vCaGFgU72+EMU8aBJdmD9JeJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmr06zb3gHNZuthkS2zuHhoc9zNb47ikcufIMuwJfMRp6HUZ3m
	KfzJzFSHiXNwGlm+UStHEGuMbKuNYKA24hRcmCb8Yg+H4S2fX3h0ceXC14EtbuPGIg==
X-Gm-Gg: AfdE7cnMj5J0IhFp+wUUBFGqd23LAl58opZ4guFSyOd/n7XmF+zcuqb3uHoafb6lf8H
	G61EL2+XA+MhY+Ptln4Neu9R5VSaFOIL4O++S7eWCSdRGzIsUKZ0YEikO/G5ISyhNtc95+lK/vS
	GTpcTsC/Qay93iuOTtvxfI3gnaa3wTavzVotlWmiKH8j99z6lIZ1JSQ1045nDX85IUH9gD9IBYz
	fc0ByqG+/KVAi6gqDR86TFrHVqP6vX/TEFxmK+w9NCIIv8Qro1KMOlhbmjYHKCM6X0z+WPgEypB
	pdOabNZLTYCEcUG7hJzItI0/iPOc5XqNtpBvd1r1q29ZjieEZnktwyilbRyBxBPxKn0+cMwKWPT
	HNH1Wp+DGDrQ1Jig1ECxFpbPwJ/wImB8ryRjPsvXGi5q/WHZhj7EHvNY1UKM4zJDDYiPdvSaY6K
	8BcCVQhqnxVPpChrCIgTu7S5qx4jNUhrnuRADAvQYnU80PEONo8yr28GZrKb0=
X-Received: by 2002:a7b:ce17:0:b0:492:43a3:2fd7 with SMTP id 5b1f17b1804b1-49269ed6ba1mr786145e9.0.1782460129056;
        Fri, 26 Jun 2026 00:48:49 -0700 (PDT)
Received: from google.com (143.11.148.146.bc.googleusercontent.com. [146.148.11.143])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268ff9f40sm57920045e9.6.2026.06.26.00.48.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 00:48:48 -0700 (PDT)
Date: Fri, 26 Jun 2026 07:48:44 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, mrigendra.chaubey@gmail.com,
	perlarsen@google.com, suzuki.poulose@arm.com, vdonnefort@google.com,
	yuzenghui@huawei.com
Subject: Re: [PATCH v5 1/7] KVM: arm64: Enforce strict SBZ checks in the FF-A
 proxy
Message-ID: <aj4u3L2RrUDJpmjp@google.com>
References: <20260623115354.632361-1-sebastianene@google.com>
 <20260623115354.632361-2-sebastianene@google.com>
 <aj0qOFO3pRA-U_mL@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aj0qOFO3pRA-U_mL@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_004852_469350_02D2A84E 
X-CRM114-Status: GOOD (  29.58  )
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

On Thu, Jun 25, 2026 at 02:16:40PM +0100, Will Deacon wrote:
> Hi all,
> 
> On Tue, Jun 23, 2026 at 11:53:48AM +0000, Sebastian Ene wrote:
> > Introduce a helper method ffa_check_unused_args_sbz to enforce strict
> > arguments checking when the hypervisor acts as a relayer between the
> > host and Trustzone.
> > 
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/ffa.c | 54 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 54 insertions(+)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > index 1af722771178..78bb043b33ee 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > @@ -71,6 +71,20 @@ static u32 hyp_ffa_version;
> >  static bool has_version_negotiated;
> >  static hyp_spinlock_t version_lock;
> >  
> > +static bool ffa_check_unused_args_sbz(struct kvm_cpu_context *ctxt, int first_reg)
> > +{
> > +	DECLARE_REG(u32, func_id, ctxt, 0);
> > +	int reg, end_reg;
> > +
> > +	end_reg = ARM_SMCCC_IS_64(func_id) ? 17 : 7;
> > +	for (reg = first_reg; reg <= end_reg; reg++) {
> > +		if (cpu_reg(ctxt, reg))
> > +			return true;
> > +	}
> > +
> > +	return false;
> > +}

Hello Will,

> 
> Seb and I tried taking this for a spin on some Android devices and, sadly,
> it leads to fireworks. The reason is that the FF-A spec quietly changed
> the list of unused parameter registers for 64-bit SMCs from v1.1 to v1.2
> of the spec so that pre-existing calls were affected.
> 
> For example, in v1.1 a 64-bit RXTX_MAP only has x4-x7 as MBZ, whereas in
> v1.2 the same call has x4-x17 as SBZ.
> 
> We can follow the spec by predicating the additional check on the FF-A
> version being >= 1.2, but I'm not hopeful that existing drivers are
> compliant. I also suggest moving this patch to the end of the series in
> case we need to revert it.

I spinned up a new series (v6) which moves the check at the end of the
series and I made it so that it takes the ff-a version into account.

https://lore.kernel.org/all/20260626074545.433234-1-sebastianene@google.com/

> 
> Cheers,
> 
> Will

Thanks
Sebastian

