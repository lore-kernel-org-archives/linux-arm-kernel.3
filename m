Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68F1C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 14:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQ30pCMhWZJ/vu1HO8OFsVgK23FsiB3oCPyd4i49RYc=; b=SLP4ijrT3vnERAokUr/2sCw+r8
	dtGqvFgvpqG7Cduw9hieRCQXEji/BgavZF1h/ivFG16LzUpfcaucbYGuD19C2qHLFWlYre1MlmLI6
	w0xBv73GMqXNbhFGbQWL6VqYhNcOpYHBSdEkZBMMC+uTnQ8ncF+OJoWK9FU1qXXQ44vISvjXrp70M
	c/CGYRmjg1QtZ/aDXbJNo7sHbvcvFDZklJi04yX1Gwif3cdqOvdYQZUF/zyuCcZQjnzHcb8xlRaN+
	foQUpm7T9gxdXk1ZWq5fZP1k2atXogshRR4yrXms3EVGg9n+t+4EE118pMaKGQ4leQ6tbJ49yXbMl
	gVkadIBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5iK-0000000EMdg-03SO;
	Fri, 14 Mar 2025 14:08:40 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5gd-0000000EMSz-1JQs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 14:06:56 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ac2963dc379so366069966b.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Mar 2025 07:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741961213; x=1742566013; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xQ30pCMhWZJ/vu1HO8OFsVgK23FsiB3oCPyd4i49RYc=;
        b=pcCb0ixSftuT7FUmhD9uCm9aMzoNJ11fRIadHZu+Hk/5V2bp6bNlzHfZ6saDqaPsLs
         OR107NAfNdTblNksePEUsLMIIPn4qrQGpy6lwSHg9MZJcRSwFRSX9aDuo+YFyQpu123+
         HvnZHbzHldrlEjyUWHv8+Z/P+Y8qMstVSuEMmYMXyTMRGHzAKR8RSpRMmgBuVcoHXEFl
         sqjFsI4N2OSPxEPUuMHtEkFYbU7et2g97il6yEdR/Qr5rN3Zxa2lhPxTBwmNOKtTh9JN
         wdMef1TlHt/5JAJgUjNXp3E9wVPsBCeytCFBo0Hmc1SZNijTo7SRyKaE2ys3Zv5dHHsP
         FNtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741961213; x=1742566013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQ30pCMhWZJ/vu1HO8OFsVgK23FsiB3oCPyd4i49RYc=;
        b=TvQvm9VQ6M1gQ4o4XHsKtGisE6xyFt06Ng3cAyA9LsvZF0esocRXXRdxr7vKvyqQf6
         QS4ViVwW/O8Vq6soh9Jo6T/dJ/o5tvX1Q+vYH4+ltDeT80jYabgDRf3Fsp4qp6qxo77G
         DRAho78ECYwh7UrC5GVAo0WT9HS0/zb3kgoadX97etap/1JsxV/1u/1Jjy64Ti1ekH1w
         SQYAOkBB6/GZZupkyZG+S5CrIXLt1AAGysN1Ke8mtxHr9Qzi9d/lKumqcNHyIAwXybtb
         1abvHZDQeic0aHvb5gV9uNR7UouqBdvHK6EtiGzC4kA0McMzFKfhyrCliT/iJ3uLv423
         niIw==
X-Forwarded-Encrypted: i=1; AJvYcCWP2qcvC/VaQi2EKMfXGeoQKrKatKOlGp7/1WBc0U5Lwt27e8+EX8pyc2UtRtxalbrMBKT2ES1h5EsGwihy7EJx@lists.infradead.org
X-Gm-Message-State: AOJu0YwhHV00naDHGJ3WSSGPmgQKax+feDyA8HQkiW+hmNs/e5Kkcy6z
	/iKx23T0CYNpWvPIWCRlsHJFJMBNruZA8xdue2fIHemg+EDG9fAAhg/gvMlsEQ==
X-Gm-Gg: ASbGncsjxc34EiN5TiwEpkKQdg7gtfEnvJCaZ9ecVDOCFzZVVk2ls9YpV336kec1DFl
	DZwy5phU+NgLDsjige+oMQu3vruxGVlhV+NU7ON+jcNwUzvP6uQjVttKveFh/8A7Bq4n9UPMm10
	T31eCntb/z2lDO/cDex4RmCrZ5LQ7qwAGhOrE8fW1mkb0hVAVI3i5F/UWyTLIIk6a9qAvmuSnRm
	tWW4N0DlL87pvLFHwFXoYIJGhBtmfrhA0y+RW7/8NIV6GAQ1xVEwqbV2p/rEbvz//Y9mtqet08y
	fN5NHu6aC3SeOE15glhJ8PVow6CaDBskJMDunYc3KJQ3V6MYJlGF7aBIBO8oNEJ5ufRveohkd0p
	E8NS7acw8CKjmiA==
X-Google-Smtp-Source: AGHT+IHghq3sPYug54WmaGy7pWa7JmjzZxIJe+VrPTG+PJgUO8Og3FjVLxNejtkRIYczh769vo0fOw==
X-Received: by 2002:a17:907:94c7:b0:ac2:9b34:89f4 with SMTP id a640c23a62f3a-ac330272cf7mr234942366b.23.1741961213314;
        Fri, 14 Mar 2025 07:06:53 -0700 (PDT)
Received: from google.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314a49c37sm228471866b.158.2025.03.14.07.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 07:06:52 -0700 (PDT)
Date: Fri, 14 Mar 2025 14:06:48 +0000
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/6] KVM: arm64: Move hyp state to hyp_vmemmap
Message-ID: <Z9Q3-FM-QwiIn9gh@google.com>
References: <20250227003310.367350-1-qperret@google.com>
 <20250227003310.367350-5-qperret@google.com>
 <86bju3onl3.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86bju3onl3.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_070655_354537_FB44CD95 
X-CRM114-Status: GOOD (  16.17  )
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

On Friday 14 Mar 2025 at 11:31:36 (+0000), Marc Zyngier wrote:
> On Thu, 27 Feb 2025 00:33:08 +0000,
> Quentin Perret <qperret@google.com> wrote:
> > @@ -698,13 +697,13 @@ int __pkvm_host_share_hyp(u64 pfn)
> >  	if (ret)
> >  		goto unlock;
> >  	if (IS_ENABLED(CONFIG_NVHE_EL2_DEBUG)) {
> > -		ret = __hyp_check_page_state_range((u64)virt, size, PKVM_NOPAGE);
> > +		ret = __hyp_check_page_state_range(phys, size, PKVM_NOPAGE);
> 
> OK, I think I finally clicked here. Does it mean that all the tracking
> is now done in terms of PAs instead of VAs?

Yep, that's exactly that. The hyp_vmemmap is indexed by pfn, so I felt
that the conversion to a PA-based tracking made sense. That also make it
clear that the 'hyp state' is not a property of a mapping, but really of
the underlying physical page.

> >  		if (ret)
> >  			goto unlock;
> >  	}
> >  
> > -	prot = pkvm_mkstate(PAGE_HYP, PKVM_PAGE_SHARED_BORROWED);
> > -	WARN_ON(pkvm_create_mappings_locked(virt, virt + size, prot));
> > +	__hyp_set_page_state_range(phys, size, PKVM_PAGE_SHARED_BORROWED);
> > +	WARN_ON(pkvm_create_mappings_locked(virt, virt + size, PAGE_HYP));
> 
> And this is the split between the state now being kept in the on a PA
> base and the actual mapping that is now only takes the page attributes
> and no SW bits?

Precisely, and the next patch in this series takes advantage of the
fact that we're now de-correlating the hyp state from the presence of a
hyp s1 mapping in the linear map range. In the future there'll be more
use-cases for this I think (e.g. the hyp allocator where we'll have
pages owned by the hypervisor but only mapped in the 'private' range,
things like that).

Thanks,
Quentin

