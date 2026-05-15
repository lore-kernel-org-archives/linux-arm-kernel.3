Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0691DCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 13:33:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMBTbyF/T6Vu//EwZXm52sbAHBRdnqX86jxiszQbrCA=; b=ArjHymGA5WXc+ww6aP+1IGRTyU
	ZoqDwHPdPoKB+nXHswySiTD3diu28XR+gswbLyCxVOrsHw06VF/WFDgkNx5oZ5Ssl+AQvgrFVHpL2
	2G/KspAEoR1FCLFVgyQsNKxQt3XOAui9VXydOJn/zRxBX+JIPbdlW/r5AtCtA9sgv1n/+wz5Rn2WB
	48Vw/atnf9e3cqVlVwILfQIpQMmMDSGqVA9CyFeEoCpTPRU4n4e60ye7EuxGdi0QzpUxmCmbmPktR
	vlKVxA/14AXs5baVhgR3MVZfcVlhSiMOF4O7pqJRflUZ3pzoC1SzwuK3TZx7B1BT35VwdXZ1paT9k
	pW+PJA6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNsfG-00000008SAx-2D0K;
	Fri, 15 May 2026 13:33:18 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNsfE-00000008SAS-3o75
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 13:33:18 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-912278ed3b5so68200985a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 06:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1778851995; x=1779456795; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kMBTbyF/T6Vu//EwZXm52sbAHBRdnqX86jxiszQbrCA=;
        b=ozs2lMqscSc1EJWOeIy48aEk4p8hzk0bUckxvDNVy8qQRgwijfJtbpwMyGyXPQQT6P
         y/gG28GObOSmPSmE0JtRCsBLd9x+bZB2ipUWWkE4z6hWjKox4NF0emkZqpDxqoJ8CxDk
         TxwEG+mb0kszQJ7Wb0ypE4gh+Ncj1+FwopQFxjxL3IVOj5Y391IXfJmx354b3QuB+vCT
         wf/OfvGyLXcDqBI/dHmn3PAU5OlO3eV2fdFWPuePLwucaeFmNDVuacSIyGTJcvq7Favk
         L+flQPZhYWLHQ+ZV0NMV/gMPYwW/cFaPlZdQYaoVXNaXnioRIKDK0v5ixIpEBIbwEL0W
         IcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778851995; x=1779456795;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kMBTbyF/T6Vu//EwZXm52sbAHBRdnqX86jxiszQbrCA=;
        b=bnJk0mirPIYrvoAmCKLNgonPAIqq0SfEGm3S0iq7uQC2ulVDTFO8/rKv4BDy5rDkoo
         HRFskArxeRNzLUiotXFLIiT9v1HstzmwDY0Oc4gVQBMsrydC7Flj4sY8tlyDhZR/x9oH
         tgX+T9hfc8f+L/c1m1CmsoXpgxQnEGnuriZGsBZ+yWmzILPpzFESzESs6C5wNNpPMW0X
         bDODVynSzD/OSGp2Tg25X/g7pStlVFP92zs0Yug58gV92/5vcIHJIVryNfHEYKDUUdbC
         rt5v9axzzqbf186wFGM5ZjHtvZcSSdex5AoOoLkfnR1FR2RSIAWGLMDyjd+UOYijiLu5
         y+ww==
X-Forwarded-Encrypted: i=1; AFNElJ8KSs5Pti4N1sBcg8jocMlM1oO8WG9/n7NQXIRsDuHb4yGQ6CKk+OBFo/rcSfgkdu/zC/v4N4cdF0LoXiZNJ733@lists.infradead.org
X-Gm-Message-State: AOJu0Yyfz/G/1uMe2nbk6oUmNzqQTdYe7TNosRpk01BMEEQlofXhtZ0L
	YXVVqJZdoTu4uvdYpW64RDPlrwmJCKQRrukUWeNC8mh8gkV52hklBqgp3o2vT0JiIio=
X-Gm-Gg: Acq92OEMOgq9cyOtVpJNUyJIVXrY4L6ZYRigDB8TopD7ol/7d3r1LxGCBD0191O9h2H
	TGG38xhIshHzyDvJUPM29hYHj/0xZbyVA9efDl5lkjZdNevSRdkS93p0NSbur7ehPaHZyzzGBWM
	AEsT+tvxzKZEUlKRlGPVFmo6IZ8phqhwmTcbk509GwwMWmww3isECAxXwVvOfKfZ8DoZEfbdha9
	WGeFzAnAUY1xBi/rGTGpYbAc0u8+psBmOfXkgitPQEzdISIwF0gofsQRwaVRb/KehPXLAkn3G8i
	WaPCPFneBDmzq4/V+iiVDxxw65HhiDQPJBtPuYfBhd/pcqUYNxbOCgeSSAbNLJrbi8bI9La7FEI
	0iiJr/10VtWAwqyJmNUABkbU8Hg2yf8+rXcQwCV7AVkB4bKMJIsu+vs2JHr7iqWFiFyC47nybr+
	/twQBPczeLt2SMBe/hA39ppQ3NysTA0QnuHezZcDhTiHzhraHRmwjgYyZTUXneAat5kWw600+bc
	9OYReVVIJh/MCY1
X-Received: by 2002:a05:622a:5408:b0:50e:6183:beea with SMTP id d75a77b69052e-5165a0df42fmr56075141cf.23.1778851995075;
        Fri, 15 May 2026 06:33:15 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5164568a275sm44172361cf.5.2026.05.15.06.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 06:33:14 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wNsfB-00000007Q3c-3bJa;
	Fri, 15 May 2026 10:33:13 -0300
Date: Fri, 15 May 2026 10:33:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org,
	joro@8bytes.org
Subject: Re: [PATCH 3/3] iommu/io-pgtable-arm: Use address conversion
 consistently
Message-ID: <20260515133313.GE7702@ziepe.ca>
References: <20260513215203.3852661-1-smostafa@google.com>
 <20260513215203.3852661-4-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260513215203.3852661-4-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_063316_951849_A8B88665 
X-CRM114-Status: GOOD (  13.10  )
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

On Wed, May 13, 2026 at 09:52:03PM +0000, Mostafa Saleh wrote:
> Use consistent address conversions in the driver:
> - virt_to_phys(): For all virtual to physical address conversion,
>   convert __pa users as we don’t need to rely on it type casting.
> - phys_to_virt(): For all physical to virtual address conversion,
>   similarly, convert __va users.
> 
> That changes nothing at all. However, it will be useful when
> compiling this file for the KVM hypervisor as it can cleanly
> replace virt_to_phys/phys_to_virt
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/io-pgtable-arm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

