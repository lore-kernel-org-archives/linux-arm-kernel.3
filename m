Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D05E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 11:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+efOnqODR5XSbllpBxRT6OF6WIdT5YO+sNBFdgpMN8Y=; b=oPxOdwiHwICafYM2Wh/ohekL1q
	nuUy/pT0Poe2gmNq7mg2BOvPMpTZetn7IYcsh/Z46tBn8JVVwMLDva1JotCmvc1aNOjgwZ6h7IzYj
	WX8nZkDPtI8NKjkb8wwLrmhdBAaV0Er3K2GHbELVOrip/amfu4HSp7e1/1By6JSFDuRKlqZaM3515
	DaFFR3Fzm0ZdUZ/68ZhGaTztNKKxDxiIF3+g13uMUIJpVOBxOFVjKBWPr9H00Yqxi/RsIn8gkgWrB
	NT+SkM5Qq/BWb7P0ffkgrEWydVs2U4tgIBhFt9RQolcCS4o5TGB5WBIcK9EQ66JlWvWwLA7Kz0yvG
	jFSAalhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEjE-00000001fd3-2b1g;
	Thu, 19 Dec 2024 11:30:04 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOEi4-00000001fOw-3kbk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 11:28:54 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-aa692211331so127710466b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Dec 2024 03:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734607731; x=1735212531; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+efOnqODR5XSbllpBxRT6OF6WIdT5YO+sNBFdgpMN8Y=;
        b=Fs1AhZfJnUZUceGjwd/TjO9z75asHfzIiPl+8A4NER9yYbHKIiIOOL1HVjgfw5kgu4
         Nn22/utnRcV6CrCU6JJ8Msnb84ZCDt33bREdmSXpdxcW82jJKZnOJPtegf+W0hOdsJOg
         OWi/RSorVgq3iznwiUyucf4AMJetGA2EPjyC8GjcNfpN+U9+vMvxTh/1Nr3qKSBHAnVO
         SKficzDD8U8ITesC5X/Zsgg62oPcYCH6dhuj2a7oejfRXuCLeFl/0le4XlrpqJmzzh8y
         dBo8FnDQszqs3jYmxp+XbedoX7VL3U55gdeiES2JcE3GyRfDO6VhnjUPq+iIJX1dCMu1
         64yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734607731; x=1735212531;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+efOnqODR5XSbllpBxRT6OF6WIdT5YO+sNBFdgpMN8Y=;
        b=fCYo7lq6F4JHfsCF1fLK+CqGIGEq7X7LKEpShznN4dE7JCBd6XK25wA+b1F4/ZpSQ6
         8AX0JG6KNV9Gddde7fXtDgGttnp8LxYg5HLyzi8Kdy5hQMUHz9weTk8RaYlmBTPXLKnH
         1yE0d0fUw3bMPsd2A414K9IifNuAsT/0Z1W/QjorD9Pw5Ide+gL/O8dBypM2t7JbgnJN
         F2zGa1+8A1AKVobl3hfeytq99XxRUu/WFqxqq8FOphnoqXhOfxWjb1gsUXNyXzZLwObj
         sD9SeGC6uCEfrCJkM9184cgI30vAbJzPIhoA3cshUErvpngbhmtZoLiVV//RdLsb5j2s
         75NA==
X-Forwarded-Encrypted: i=1; AJvYcCV7c4gBPHMj/1fVyHjbFRABR82KtEia7zcvqdiauvuAIbDNbChqn288LjWKDnX9I3Zqzanx9XHRg8HTAe4ZG49+@lists.infradead.org
X-Gm-Message-State: AOJu0Yz57oDDmZPMJgltm6324Syik+WVl3YxrFm6aeoZl0KNfkjMWSG8
	oNY+efc0GEio5vzwZPjsAruCLNrY5T9rO5pLNrMBT5QhGFVHUN5g0njGwSOvCTisu8DdgNJa+jF
	YUg==
X-Gm-Gg: ASbGncskYRm/KMkHlDes5hoSy03T5wr90t9+mRyIbNU0yMVNcOTGCeXbZ+8cKGRiy3v
	kNe6vayAuAfBllp/AHpTXi54SSzDM5TvL4SAyedVOdEXUsR6EdLkYaeWGPGh4h+vKJHgdtgXr9g
	ee5QG1vaV6k1mhYGq2eqpbOSwa7J295im6JX76fisf9mxHE2FImzkKp6RpzHOEh3VDVD6W8DrEf
	zb6Zz82UIlZTd+rxAmwdKVJnfOAR/VF6MKsOtd7+VKG9cbNfoY9iAbkqVoj9UfPU5ACm4I9u1VD
	/2VsnpxtQkiclzw=
X-Google-Smtp-Source: AGHT+IG3dsXDyN2H9c+ztZK9RDs7OlGyiKmp55kArM+zF0vJy/3UJNS0k2iPLxglWUvLs+MgvKzUiA==
X-Received: by 2002:a17:906:308c:b0:aa6:abe7:ff49 with SMTP id a640c23a62f3a-aac08187acdmr234318566b.16.1734607731259;
        Thu, 19 Dec 2024 03:28:51 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e82f58asm55970766b.39.2024.12.19.03.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 03:28:50 -0800 (PST)
Date: Thu, 19 Dec 2024 11:28:48 +0000
From: Quentin Perret <qperret@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, robdclark@gmail.com, joro@8bytes.org,
	robin.murphy@arm.com, jean-philippe@linaro.org, jgg@ziepe.ca,
	nicolinc@nvidia.com, vdonnefort@google.com, tabba@google.com,
	danielmentz@google.com, tzukui@google.com
Subject: Re: [RFC PATCH v2 11/58] KVM: arm64: pkvm: Add pkvm_udelay()
Message-ID: <Z2QDcODuqcJojTpG@google.com>
References: <20241212180423.1578358-1-smostafa@google.com>
 <20241212180423.1578358-12-smostafa@google.com>
 <Z2QADxbdoYi5q9iT@google.com>
 <Z2QBxPyBsxGNSuzT@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2QBxPyBsxGNSuzT@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_032852_928684_2AB9BC78 
X-CRM114-Status: GOOD (  23.70  )
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

On Thursday 19 Dec 2024 at 11:21:40 (+0000), Mostafa Saleh wrote:
> On Thu, Dec 19, 2024 at 11:14:23AM +0000, Quentin Perret wrote:
> > On Thursday 12 Dec 2024 at 18:03:35 (+0000), Mostafa Saleh wrote:
> > > From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > 
> > > Add a simple delay loop for drivers.
> > > 
> > > This could use more work. It should be possible to insert a wfe and save
> > > power, but I haven't studied whether it is safe to do so with the host
> > > in control of the event stream. The SMMU driver will use wfe anyway for
> > > frequent waits (provided the implementation can send command queue
> > > events).
> > 
> > Mooh, I'm thoroughly hating that we need this -- pKVM is non preemptible
> > so we better not wait for too long.
> > 
> > I can surely figure it out from the following patches, but could you
> > please expand on the use-case?
> 
> The driver needs to poll some SMMU MMIO, so it needs to measure time
> in terms of udelay to timeout, at the moment its arbitrary set to 100ms.

OK, I'll look at the patches to see how hard it'd be to return to the
host for scheduling while this is happening. It's probably hard because
we're presumably in a funky state, but it's worth trying to figure it
out. Any EL2 section longer than 100us or so is problematic in my view,
so a 100*ms* timeout is scary!

