Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F2AC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 10:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vX3UV4IiPZoSn1HS5bXJ5ASbfLJY6NAq1a0CpQiDt3g=; b=Ssm+HyVAwijGygc2ftChPvzBIx
	Ej4S4lNCpRiKT301mMPVWPwxtqFUDfqRGCblXOepc7GMhe+fcNN3tjYr/+yf0WcP1gXLJmS5NKJMN
	j4Kuqa28GWuWEKc0gUN5CJ0fWGs9wfi3CvDxZo1uX26oyKL2rJnM8iLO/ExIecA+djePk/Rlyji8A
	xMwFpFqCveFm1dkGLfnSUhw1WfgFIs6NboZ0csjnwi3uwAZF218Tt73ZsW+5wLPn0NANqNRbm2R/X
	O8mFzAssmcStrIsfqKjQEQEW1vKUqKVkYXU5oHp5hlxUkN517S5GUeTws+Gmr70DFCrFGWEZAwrEu
	lkTbdyLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3su5-00000008kJq-1PJY;
	Tue, 08 Sep 2026 10:18:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3su3-00000008kJU-0rQE
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 08 Sep 2026 10:18:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vX3UV4IiPZoSn1HS5bXJ5ASbfLJY6NAq1a0CpQiDt3g=; b=beA+vBxEpMJfwBgZC5ePr5wPEZ
	Gc2Cdn/vO56yD4wA2CMeG0fzlFBKh4CZv+HwAz/efuJ53QPJO1f2UPfnTBFzUQZBDT5Ke5MZIUYCu
	BzE4pzO1Aglkr4GKcrFEdEZsvGCGOfEa3padF3PV1GgU3VtbIfzVcPgFAt2nvvodLh3vSQYvd9jlt
	K/PV833qS0xqWjWle2eoXiMylAr3wjMrVsjH4m+zNY9mwt9DILsotfGB3v0OVr5Evh0P6ygHTLilN
	OPmJ0AlFvlZjIlDzB3mziTonuB/e/A0ELggIZ/8xja1HOeTtgNf/JA7S2Nwca/qj6dKNN08a9KvnV
	808oVqCQ==;
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3su0-0000000HGUk-1d7c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 10:18:10 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-69f7fa1c548so7393924a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 03:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788862686; x=1789467486; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vX3UV4IiPZoSn1HS5bXJ5ASbfLJY6NAq1a0CpQiDt3g=;
        b=vnMZposFw3ePYYMmgB3onZi8g+OOR7PRGahUboP757OsH6J2pBcmFsFYEMMzCL3Uz5
         dQaO1yMY+o6pcegCtINTyGtmxK1TJ1XwVxw8LYGWO6m9B8ZYaB+ObZaeUPH2jaqK61cb
         8FaO5fNioLk9WvBY94PQwGVGJpeFRGNA4v9YLEZ53T/LY+9sFMjNh+YoiYM57FXc+wnE
         KLYPpRMEtHnOkwdFDynVzdl5TZ39+0623j54g6jvYBjtN/W7RxLC41Aa/rgqDadcngom
         yf2h8ri+8yuPlEQbrOwv0rS6h0G1HTOIz/9Bv7wo6xIZhId5h7fsitN9HMDdVNpTe0+6
         DaKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788862686; x=1789467486;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vX3UV4IiPZoSn1HS5bXJ5ASbfLJY6NAq1a0CpQiDt3g=;
        b=SHyUAUGKflwkYu2P128OjbuMliXvswfLk3IdqZjAvCauLW4YnfMXlXnjdS1YXM0Q54
         irEW0pUMj4eyHs3m5i6aWdgk1G+mAR7RIUIS8Oecfkmo1Huc7mQK3aIwyHmQxd3ER4L0
         lD0pMlL8Wj5l3uOBmXoYz8EB5tc8vTY3sgVbLVYsjfzQdQRAwOC/MUVXvGKC9eV5yneS
         zApodD7ukakuw0Ht2c/JapLNQcEI9k/joJED4PxurC5UHZYUnmmGAnSgdD6DNQIhxqzO
         8vEJQHp2iacRQAdshXBTT21xziJMAW2ELTNrwHSREZYNCmWLzvNArfo1ACtDh0YL6awR
         qqPQ==
X-Forwarded-Encrypted: i=1; AKwUvBybf00q6jXnWNpghkQ4EsDK6DwPCCbmCCWhwSnHT9YFm19SKaE0FPkpo+VaoQxgpGDbxLH1R0XCo46Ifo8W3zxK@lists.infradead.org
X-Gm-Message-State: AFuF++lnB5nVu28yVcb9muz41qb5IZFJFddlFv5I8/yOhBDSPQ6WsdUJ
	sg4DnPCM6fjSC4oIr7th/VwAPeGNFJpTCsS08Eu5JQMSBY0O1zoltKE+UxBoAeLhSQ==
X-Gm-Gg: AYBFou2Doo90f7ojL5PSZHjK9F7z0DCSU6JbcnZqErijF8jmn9J8mTN1oH82FpgYEwI
	vBW/cj4v3nWA0Ymqya7Gp7ZHA++izJNN9B5RA3V0g7s+5LqwLim2hrPM7+nyBw6Q5N++sXYq5L8
	2lEqrx00yTgxUgWaYUINKWaX6ReLrMiMugROE5P76JLtk316ODpi0EdwISzBlhlP7Zu4EaB4PJ5
	R0LJbLj0Eg9EW+35qCmgpOffaTt+xaR8d6TqcmO3jm4K+JdAYE5xA6KtZvGsmgJyv0F5CYny44B
	IugCAOtAarAkW8XzEQ3JQf4rqJeFWxuMjNy772XAcH32ZMYiCEk5on7Qg2CCr/VGAKTo/2Pbsvt
	LWX14W5XwVhc6F6qBrgFDLHQJS0mADopLqnCHuKXllDEscYw1z2LSLnJMyUoqZa7iaitTgs8vyw
	xKmN767yaQQeAyEfBDqrNqmsb/i0BneBqDZ652X8RGmnvPtJPejXU4DMfAtd/K0c2TwwcPDmFpC
	Z4oTncw66t1tjoaWA/xZB2QOHdO+aNR
X-Received: by 2002:a05:6402:4025:b0:6a8:591:6bd2 with SMTP id 4fb4d7f45d1cf-6a805917040mr6570996a12.20.1788862685976;
        Tue, 08 Sep 2026 03:18:05 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68c42c2sm5275845a12.14.2026.09.08.03.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 03:18:05 -0700 (PDT)
Date: Tue, 8 Sep 2026 11:18:01 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	fuad.tabba@linux.dev, qperret@google.com, keirf@google.com
Subject: Re: [PATCH 04/20] KVM: arm64: Use block-level annotations when
 setting up the host stage-2
Message-ID: <ap_g2eb1sn1Mp_Qd@google.com>
References: <20260803100904.3563942-1-vdonnefort@google.com>
 <20260803100904.3563942-5-vdonnefort@google.com>
 <n2cker7zphcsacuck5ovwtj6k622ykpadg6njs2qirhqxj5keh@ub2dnnarnmmm>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <n2cker7zphcsacuck5ovwtj6k622ykpadg6njs2qirhqxj5keh@ub2dnnarnmmm>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_111808_593298_B7DE97B6 
X-CRM114-Status: GOOD (  21.76  )
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

On Mon, Sep 07, 2026 at 03:37:56PM +0100, Wei-Lin Chang wrote:
> On Mon, Aug 03, 2026 at 11:08:48AM +0100, Vincent Donnefort wrote:
> 
> [...]
> 
> > +static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
> > +				     enum kvm_pgtable_walk_flags visit)
> > +{
> > +	struct fix_host_ownership_data *data = ctx->arg;
> > +	enum kvm_pgtable_prot prot = 0;
> > +	phys_addr_t phys = 0;
> > +	int ret;
> > +
> > +	if (kvm_pte_valid(ctx->old))
> > +		prot = kvm_pgtable_hyp_pte_prot(ctx->old);
> > +
> > +	if (!prot) {
> > +		/* Unchanged region */
> > +		if (!data->prot)
> > +			return 0;
> > +
> > +		goto apply_ownership;
> > +	}
> > +
> > +	phys = kvm_pte_to_phys(ctx->old);
> > +	if (!addr_is_memory(phys))
> > +		return -EINVAL;
> > +
> > +	/* We already know phys is contiguous as we walk the linear map */
> > +
> > +	if (prot != data->prot)
> > +		goto apply_ownership;
> > +
> > +	/* Accumulate in the current region */
> > +	data->size += kvm_granule_size(ctx->level);
> > +
> > +	return 0;
> > +
> > +apply_ownership:
> > +	ret = __fix_host_ownership(data);
> > +	if (ret)
> > +		return ret;
> > +
> > +	data->phys = phys;
> > +	data->size = kvm_granule_size(ctx->level);
> > +	data->prot = prot;
> > +
> > +	return 0;
> > +}
> 
> I think this function can be simplified, if we check phys first:
> 
> static int fix_host_ownership_walker(const struct kvm_pgtable_visit_ctx *ctx,
> 				     enum kvm_pgtable_walk_flags visit)
> {
> 	struct fix_host_ownership_data *data = ctx->arg;
> 	enum kvm_pgtable_prot prot = 0;
> 	phys_addr_t phys = 0;
> 	int ret;
> 
> 	if (kvm_pte_valid(ctx->old))
> 		prot = kvm_pgtable_hyp_pte_prot(ctx->old);
> 
> 	if (prot) {
> 		phys = kvm_pte_to_phys(ctx->old);
> 		if (!addr_is_memory(phys))
> 			return -EINVAL;
> 	}
> 
> 	if (prot != data->prot) {
> 		ret = __fix_host_ownership(data);
> 		if (ret)
> 			return ret;
> 
> 		data->phys = phys;
> 		data->size = kvm_granule_size(ctx->level);
> 		data->prot = prot;
> 	} else {
> 		data->size += kvm_granule_size(ctx->level);
> 	}
> 	return 0;
> }
> 
> Did I miss anything?
> 
> Thanks,
> Wei-Lin Chang

Indeed, I think it's my:

   if (prot != data->prot)
       goto apply_ownership

that is clumsy. With

  if (prot == data->prot) {
      data->size += kvm_granule_size();
      return 0;
  }

(which is basically what you suggested)

I can get rid of the label.

-- 
Vincent

