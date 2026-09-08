Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778F2C79FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 10:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TFpNp3ZqO7N2Q9SVPtLMBf2AYYHJ1sRkpIuyR1lzdHQ=; b=GFU1zBdnc/EXXHlBNDkjSJJiFH
	QptB90P05gdKaSazp5SzMDZ9cUeR15It1c4X2Xb6fiw8A3/8ZolUvRfEZ0J0LNKtl3E+7fUJy5hBQ
	u8y5FHbcEwsOhjs20k1VLS+9S3zPfGlKWCHJva4AAh8A7ffh97Q+g8TU+UEabPv/jkndOowoJ0u+5
	57fEvuJzbzqmQv0UF9qEx/oqqXnVlnuhL/kVAZDhxGYO4yiFDV1wJ6IpFbJNAd+yuYKFzeuYNX9/C
	YUAY9LMfx7v1Ja4M8Bf3WNsbuTmhMBbqCfuIN7alcjxqoRRSppxk8nTpVkKZDhkI+oO5vyNTg5siN
	DwT/JQJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3t2a-00000008ldu-0KOv;
	Tue, 08 Sep 2026 10:27:00 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3t2X-00000008lcd-3Uwn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 10:26:58 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso37619485e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 03:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788863215; x=1789468015; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TFpNp3ZqO7N2Q9SVPtLMBf2AYYHJ1sRkpIuyR1lzdHQ=;
        b=Msk+uIJVVdAgcB5uWeytGGEcNYwhDdBhBqq6J8BzskTX7G5uzK30/rkxahTyPTwOYx
         s8l1oEnv9IjIJfU216YBKlRoO3nAKeRcJpKZaXuQumCW2YcE0JO6VtzS3sxz8UaXiPD+
         Y03Fvto+GRGIE1kq2RbRP1egv6tErrqCmGMvwoQ6iinp9FBWE5E//3MiUPDUfnBr+n5W
         qUdIO/wotWf0hV7sKWGKw5vRA6tqF2VHGUEuzzHnl8iP/Q9AblgLJYu9N8l3shDhze/k
         wjiPjBivnvrocI2ORl5pfIqVBtvP3y4kS6uyKIeP/G5N9HQBiiJXWC49nZVVpRhMlcWv
         HEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788863215; x=1789468015;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TFpNp3ZqO7N2Q9SVPtLMBf2AYYHJ1sRkpIuyR1lzdHQ=;
        b=scqnfuRS1YNuJVCF/s5Tt4DD99Ltz2hDMX0+1ugSnQfgJrbS8N6mG+P1wPEZT2vdw5
         mGBn4LGrHK0Zoo1NyYryQUdZe5atZMGznZOJ75+VcOyGQgbPqRFR59BQKx+z4GbRRsai
         FCCHyTYOEDCwhSMTOJydpInM85llJ9gSEnig4SFmanIHX/0Un3EC5W/aBnAukS7/dqXO
         bESTzcHjKMbxQK8E410weq+wx+6HtQoPzPMeoZHtyHK5gF6b2NdqWEd8teIbWzQbx0yr
         m1gCIWp93KzDSIBsMsM6732/Xac2ZCEdvCyj9qVQCXkI52fREiH6KXL3DMzCmdn8QeWa
         uAqQ==
X-Forwarded-Encrypted: i=1; AKwUvByHo5oxjp9O6ppUWFYaL999vywL0nbUU5J3nb0MUBi0MUAZFFaCiZI0CKNKo1l9VRe2pg9eDEm9e7bdbW0Qdm2H@lists.infradead.org
X-Gm-Message-State: AFuF++kg2yZoZlnb+QTO9yzgMuoRVKmf4RpHVAcpaOrBrqJh2YK8Xk/T
	FwfNTIwQ+cqAgZSnCSnfesIfqoH2T1GvId5w6yBz7EWsu3VG2JAnPV266J1j8RlLtw==
X-Gm-Gg: AYBFou2BS/NQ0FyzZ9MH0uVqq7u+9YV0BOl9Y+D8Jix1MN9cm1yKFrbUlkPtBGlwHVY
	bpySgrgxmw03swoEq2Gx4rEndKXAb3bDJC/xcO9XkjFq1oYZ+gO3MJVT+AEQRX7oj5OMe6T/+21
	Hda7jM6O7ZYnpLQe0ec6g9a15ElE8GPMGSeW/Eo4pb8GJvWZD0atl5TdZA8yy6oSMDpVEaCxUEc
	MPynKajjVP9R50xW25gNTEFHVdDRvpjw2omJsdH479yJpfNZ2qvp35SrYhKEnNCHM3vcamjRG9L
	5hKxhkzP3/KCZBC9B2MRp+NAMpHDWCUCQfwkz4+9EwpyyIgyneRHOW/XUmJJyk0DXPtVfZL0cm8
	Q/s5hTTeo6Z3oiVRkzlfArRQTSTbtGJpaDnXlcRF01adQ27tSBsgNDToxBTUH9mXHAMmqrhj0/1
	KGOVVrYQp2pQosdT9azWtDEUS29JrW8B/kVytDQ4BQ3XPk5E3aFTIN/9QE9nu1H1bx0oIaTbJAj
	fYHz3EcgHVEPrgy64B/T4RyyEX+H8BzMQ==
X-Received: by 2002:a05:600c:3e0a:b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-49cf8267a36mr365637045e9.12.1788863214324;
        Tue, 08 Sep 2026 03:26:54 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4859162f354sm27909246f8f.20.2026.09.08.03.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 03:26:53 -0700 (PDT)
Date: Tue, 8 Sep 2026 11:26:43 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Wei-Lin Chang <weilin.chang@arm.com>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	fuad.tabba@linux.dev, qperret@google.com, keirf@google.com
Subject: Re: [PATCH 12/20] KVM: arm64: Handle huge mappings in
 __pkvm_host_force_reclaim_page_guest()
Message-ID: <ap_i40-JQnXf4w4O@google.com>
References: <20260803100904.3563942-1-vdonnefort@google.com>
 <20260803100904.3563942-13-vdonnefort@google.com>
 <yzeb47zjrxdsfztilng7n4e22fnsm4ncqjeqzmryc7sqncuqw6@pjtshmjxwelh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yzeb47zjrxdsfztilng7n4e22fnsm4ncqjeqzmryc7sqncuqw6@pjtshmjxwelh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_032657_892133_54654652 
X-CRM114-Status: GOOD (  24.12  )
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

On Mon, Sep 07, 2026 at 05:52:35PM +0100, Wei-Lin Chang wrote:
> On Mon, Aug 03, 2026 at 11:08:56AM +0100, Vincent Donnefort wrote:
> 
> [...]
> 
> > -static void hyp_poison_page(phys_addr_t phys)
> > +static void __hyp_poison_page(void *addr, size_t size)
> >  {
> > -	void *addr = hyp_fixmap_map(phys);
> > -
> > -	memset(addr, 0, PAGE_SIZE);
> > +	memset(addr, 0, size);
> >  	/*
> >  	 * Prefer kvm_flush_dcache_to_poc() over __clean_dcache_guest_page()
> >  	 * here as the latter may elide the CMO under the assumption that FWB
> > @@ -1304,19 +1302,15 @@ static void hyp_poison_page(phys_addr_t phys)
> >  	 * host stage-2 and would otherwise lead to a malicious host potentially
> >  	 * being able to read the contents of newly reclaimed guest pages.
> >  	 */
> > -	kvm_flush_dcache_to_poc(addr, PAGE_SIZE);
> > -	hyp_fixmap_unmap();
> > +	kvm_flush_dcache_to_poc(addr, size);
> >  }
> >  
> >  static void hyp_poison_range(phys_addr_t phys, u64 size)
> >  {
> > -	u64 offset;
> > -
> > -	for (offset = 0; offset < size; offset += PAGE_SIZE)
> > -		hyp_poison_page(phys + offset);
> > +	__apply_guest_page(__hyp_va(phys), size, __hyp_poison_page);
> >  }
> 
> Patch 8 introduces hyp_poison_range(), and it is reimplemented in
> another way here. Maybe just do it this way in the first time?

Especially if I split it into a separate patch.

> 
> >  
> > -static int host_stage2_get_guest_info(phys_addr_t phys, struct pkvm_hyp_vm **vm,
> > +static int host_stage2_get_guest_info(phys_addr_t phys, u64 *size, struct pkvm_hyp_vm **vm,
> >  				      u64 *gfn)
> >  {
> >  	enum pkvm_page_state state;
> > @@ -1344,34 +1338,43 @@ static int host_stage2_get_guest_info(phys_addr_t phys, struct pkvm_hyp_vm **vm,
> >  	if (ret)
> >  		return ret;
> >  
> > -	if (WARN_ON(level != KVM_PGTABLE_LAST_LEVEL))
> > -		return -EINVAL;
> > +	/* We only support either PAGE_SIZE or PMD_SIZE */
> > +	if (level < KVM_PGTABLE_LAST_LEVEL - 1)
> > +		return -E2BIG;
> >  
> > -	return host_stage2_decode_gfn_meta(pte, vm, gfn);
> > +	ret = host_stage2_decode_gfn_meta(pte, vm, gfn);
> > +	if (ret)
> > +		return ret;
> > +
> > +	*size = kvm_granule_size(level);
> > +
> > +	return 0;
> 
> This can also be moved into its own patch with get_valid_guest_pte(),
> hyp_poison_range() changes in my opinion.
> 
> Thanks,
> Wei-Lin Chang
> 
> [...]

