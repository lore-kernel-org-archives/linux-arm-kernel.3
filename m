Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D546ECD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 09:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxYemHQPrdk3fS8tD+TpeUcazBw+tvGubw+zL762ZGc=; b=EgWfJ7m78iATXXEOUTFDKrpFVY
	jLbNB4S0554tHbs5ZSyQRrwQWDLGwyLxzZvQOXLE9MxdpoD8YhdbxRYJfusMJjiyBRXTTTIhnPnh/
	hg46yzILEJwBSDgKx0AGzv/Bn2aZTJKTf/8oaIOxnWe4Yl/nQWUOTU7U8x93/+7Sij+QkrQblUrfT
	REtm6TNUjJef6BEBwq7pgcj1jcG4DtBKaA1YauQfDSSyLn1j5troqsOGn19Ewmn8rCJ4CvB+dBU5o
	6JzLXReXPV54oAqjc4OaLfzL3FhWTzQTupIuBlzxZeR7ARCK5av/+isQdVFGdGD4I6IbsEDGZJ8dD
	jWr5Kcsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2o2-0000000AyWt-10g9;
	Fri, 26 Jun 2026 09:25:02 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2nz-0000000AyVk-2bYb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 09:25:01 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4924933d072so31585e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 02:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782465898; x=1783070698; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yxYemHQPrdk3fS8tD+TpeUcazBw+tvGubw+zL762ZGc=;
        b=q7xOoSr+8DdXuAKc+QfjccRPQkNKfSDf8ouwJTaT821t/iS5nNvQQ0WGAX81B9uRmy
         1tet8yMoex1a5XvjJWl0axDZszBtJa1fx7nAB9Z2Dd3sJB7tKvZRCogQb3I/Q6a1ZCLJ
         acRCnNekh+UbCkIMfE8wljL7Rep/0xSglItnRYoxKx/LXUWNCZ1fGBzIhFpG1aBR/YJB
         3duDSJt3bhobrje7C3+kaueywyCE8wSe7Uwbvd6hqF9xpyGk2ogbhL7TfPD+kGPmqu2v
         /n6FPSUX+5rX15IpFbV0NQeGWZdPvUSdhnboB26eMk4NRJ1QBEO2R6k+jiyX6oD3jDg9
         UbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782465898; x=1783070698;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yxYemHQPrdk3fS8tD+TpeUcazBw+tvGubw+zL762ZGc=;
        b=U4dc49f8/dBjTPqPouXRysA4/Io3JVSP0JHsO5XlZDx3TbhBdxBedclTkK6Ylf7XQb
         wAzZ0vSj8mCegmt8BmFezTQkfkNKUKp+G61hSTRxZCiZBKesjTsBdG+hPx4QstWLGTfC
         U315cZE+GGhHtDmAt8ctwqSDamgaULrMTzi5O28kBo1w7qt+q01t/rB/HaIkyMnYT1Cz
         xk5qmQKY+vK5TcSTARs54pEtZ6a6lf4OLpnkz98Kqcu5m0xOliJAo2RQ2iaZB4hdl46v
         5mAqbz9nNLRKpbV8o1erK/mHUUbcAbKkRUZmicsS1B5UVvpY2NCWGY0WBS9SANbGwIQi
         Gn4A==
X-Forwarded-Encrypted: i=1; AFNElJ9AgIr3K7EjD0hnioHlQoGAAk9ROl5+gMwJkIwfiH4iYWo14wCRaRBk8N/byGj2NBLAcxXwRnYOGMmxi+s+sH6i@lists.infradead.org
X-Gm-Message-State: AOJu0YyfYquLQRN2k4W6r5lFN8SWEQOOVPlUpHQwzix0dVhr/+CzBBGf
	W4LcjF6d2xNQzHKaJu4oFcm6MkqT1e8prI87WhUF1NwPyOu/O6iw127+gvYOR++Z9g==
X-Gm-Gg: AfdE7clGlc6blVA4WArQtbm7mCNuv9cPzlWww8mggH+I5wBnMPDxPQR69T0xr8B2ISP
	666LhTHKSEc025B2CGOMbZqGbbq4Jch+w2Puh5AyfQo3Lq1s9C1pcFPiy0EWbK2mq6bgGna42Ee
	sinQ3oiFHebCcubZW0YaV+2UsWKBBGRoeSind8PO7z/g8Dk+5xjPePgN5Ew2+T8tc6Dq4FUdLwh
	KR60WJAZiU0sorwL/uv1WHdumA2dvb6NU1LjPXYi1heR6S05kL5oWihrIA2f/JI7uYHBQhXsEZ7
	qGg+juVM0Ty8+Z+cjfekvNPDozVHCxb4YKRH00SXPD4weTvKWKs7gCTlWWHc32bcKCAPtJ4NEMJ
	lkTnrmcBLoVLMiqiuNe4dwI0kRJtE0JSSqwUt3BSFXKZ4WBABtf6ARX3tJSSz9IoUJzNGmBCwC8
	+nn5Dl+0nHfLKanlY3MYsY3+JOtspC+I+ioHCC9BXg/nfGwqsfrw4Q+fT90ko=
X-Received: by 2002:a05:600c:3e05:b0:48a:5d55:c194 with SMTP id 5b1f17b1804b1-49269ffaa9amr983445e9.7.1782465897233;
        Fri, 26 Jun 2026 02:24:57 -0700 (PDT)
Received: from google.com (143.11.148.146.bc.googleusercontent.com. [146.148.11.143])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46c221d9371sm24794653f8f.21.2026.06.26.02.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 02:24:56 -0700 (PDT)
Date: Fri, 26 Jun 2026 09:24:52 +0000
From: Sebastian Ene <sebastianene@google.com>
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org,
	joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	android-kvm@google.com, mrigendra.chaubey@gmail.com,
	perlarsen@google.com, suzuki.poulose@arm.com, vdonnefort@google.com,
	yuzenghui@huawei.com
Subject: Re: [PATCH v6 7/7] KVM: arm64: Enforce strict SBZ checks in the FF-A
 proxy
Message-ID: <aj5FZBO7FJ4r219O@google.com>
References: <20260626074545.433234-1-sebastianene@google.com>
 <20260626074545.433234-8-sebastianene@google.com>
 <aj5CMsyQ25xuxISV@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aj5CMsyQ25xuxISV@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_022459_683621_1DDC81EC 
X-CRM114-Status: GOOD (  23.29  )
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

On Fri, Jun 26, 2026 at 10:11:14AM +0100, Will Deacon wrote:
> On Fri, Jun 26, 2026 at 07:45:45AM +0000, Sebastian Ene wrote:
> > Introduce a helper method ffa_check_unused_args_sbz to enforce strict
> > arguments checking when the hypervisor acts as a relayer between the
> > host and Trustzone.
> > 
> > Signed-off-by: Sebastian Ene <sebastianene@google.com>
> > Reviewed-by: Vincent Donnefort <vdonnefort@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/ffa.c | 96 ++++++++++++++++++++++++++++++++++-
> >  1 file changed, 95 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/nvhe/ffa.c b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > index 712811e89435..bd50ddc5b61c 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/ffa.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/ffa.c
> > @@ -74,6 +74,21 @@ static u32 hyp_ffa_version;
> >  static bool has_version_negotiated;
> >  static hyp_spinlock_t version_lock;
> >  
> > +static bool ffa_check_unused_args_sbz(struct kvm_cpu_context *ctxt, int first_reg)
> > +{
> > +	DECLARE_REG(u32, func_id, ctxt, 0);
> > +	int reg, end_reg = 7;
> > +
> > +	if (FFA_MINOR_VERSION(hyp_ffa_version) >= 2)
> > +		end_reg = ARM_SMCCC_IS_64(func_id) ? 17 : 7;
> 
> This looks like an accident waiting to happen if we don't check the major
> number as well.
> 
> I think you should just check:
> 
> 	if (hyp_ffa_version >= FFA_VERSION_1_2)
> 
> instead.
> 
> You should also add a comment.

We restrict hyp_ffa_version major to 1.0 here
https://elixir.bootlin.com/linux/v7.1.1/source/arch/arm64/kvm/hyp/nvhe/ffa.c#L962
but since this is an easy fix I will include it.

> 
> Will

Sebastian

