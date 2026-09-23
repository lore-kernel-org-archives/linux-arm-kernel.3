Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0203AC98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 14:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7rhO8zdKOr8jmD+SfzN1wHrIhUden50az9FhzT+ZY8k=; b=y9n8XaO13gNNu1e+nQCt4K86J8
	DGJe7/qohZRz7FLuL8wgruMhGlTML3MQj5srQUQkRLlZ9jsF1j99Gw5WUYmdbINu6r6BMDqnhgXSa
	/y/IP4nWSh5GbpkINIXUDP9MdzDX4Mfw0zGBZNyFAuE9D+JbUu+4Mjlaf27kMgUPu/Nr31dEXVOsg
	ywJZFdsfRpkCv0w59siSKf5pqxug7pHs0oSuVs8lYXEQlgddULxjoBFubiTg+byjTlWVg52q+GOeg
	oPmqSIKUVdhPw2cnArnXry0Bin8UqdE9bnRkKnTBLgml392UC/KTy7kwyEW2Ty3tvHfIzjR1yurxI
	oaysP+Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9O1j-00000008XVh-3XsP;
	Wed, 23 Sep 2026 14:32:51 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9O1f-00000008XUi-2ts1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 14:32:49 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-39b5b07ec78so571392a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 07:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790173966; x=1790778766; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7rhO8zdKOr8jmD+SfzN1wHrIhUden50az9FhzT+ZY8k=;
        b=zidIpe1h7FtLAY2y0wvlqGSalPwsUrygY2BV/B877PUPEm4BgFSjRV5b+sVsEoObNn
         EjilNCzg8SWAVioa0XifX3+iBE1/CtmqdkQQOGJKkGDSJfqmKIIzOg86yWlRX/hRgaJD
         TLXNrXNK9lAg4x9PMZN9oGhuLpjOiqcct1gf3v6dE6xwAs2uhWmDC7jVokpzxkIrFLrR
         LdURZTIe1vWls2QG/LRu7rgYfXsnc23c7RLHnEER05QIfW0rxzMrMYUSsMijssSlhM1G
         EON2W45WyZqCvw59BmliHrw4z9aymonXeO9rFcvclBwxAyTLJBQhUPXI77iXW0t8/gTJ
         45+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790173966; x=1790778766;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7rhO8zdKOr8jmD+SfzN1wHrIhUden50az9FhzT+ZY8k=;
        b=hiDaRZJPoDXiqs4jXefnF4FT4Y6ZiRfWP0aaiJIr2qCyRfoo2T4FlKVVw6zIeHN9+Y
         Y5YZxsesjnZzV5iLkQ1XMW/i3xJrlki6hkU2th/gfUQa/umw7hR69sNSQwRycFjOiBRf
         1zwRKMYdbEpumgzJ8ljVUCrj2iSh/nIrnGGxG6lZYDn3figpsWVeo3UefqhpxzatEpPk
         v9nwmNHfFzxMUi0ZsIH5yT9YN4vo52Yw4TsGBoII81JLRHNQwaJoP3Ki6OFLu3NPVK8d
         8OOLvlTtaBw/USPCviFYHsliPJ2pr80gcFcMW5krJmaJNbNAa2O0nKuJS8Adh+GvVLNC
         BQHQ==
X-Forwarded-Encrypted: i=1; AKwUvBxE+Wm8BeBsJUypvdtSHlyNWqrXULbt+5Oyg75ksFAsgfGef+lCR0oSNxfzIGBJecQQqMtabh8hTGNP6m+qidt2@lists.infradead.org
X-Gm-Message-State: AFuF++knoaaWYkVQ2ECv2G0Scmnyf0usOencjYJLeOMVpeNfV4tSMVUc
	bcW8rK5GpJVoZ7rvdvxMVRyjUrR2Wh9PJjDdfT3KUFt9QOZfVfvCC2RXu31bmOtZrDw=
X-Gm-Gg: AYBFou3/1LPaFfWioFsXBNwiB63T6JyvHjrrJxF8Jp0KjiEtzGQ8Yn1Ljsoz8JNXg33
	He4S0l1yfVpK0FXxttSXLKnL/nCfqxfqkbUTH+tHzZwqzBo+6hbzXmghH8eBfy2FKAZB95JCuix
	c1rhFKpk/Oil0jzKPqk5f5FDw0yGjBV861HMY6VeEZcJa7QLhr9lruFW0l10sc99ZaIksMPtiVi
	j3QYHneTTw6Ej/54J5WXdsHOFLSo7uj8IMZ1ASHPlPUVR3Qk3UiVYuDu8ug7BiN1mDbioTYxow8
	7PvNFhdwHif0f1+SM2Z49gBgZvoQmd3ZRFJRqM/q0EGr73lJlQ8mHr1KR80e0D8Q723VVMRw8rq
	enPLFR30oLydI3jqJIJEOuIHHMoUtcUYOlieO53e3Lh4ARZWKbJjCxAoL5h5o5CZ5gcbVGoXBJB
	7AcirxW7WGZEGZF0Xuavy2QT5RZUsX6gr70V4lHLeELvmCaZm1ZeDKlAdjTGjTgnhFf/gZfFoJZ
	AwyW8HU6g==
X-Received: by 2002:a17:90b:2552:b0:398:9c39:520f with SMTP id 98e67ed59e1d1-3a07e51cf1fmr2382544a91.15.1790173965946;
        Wed, 23 Sep 2026 07:32:45 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:b4a:dc6a:68e:2592])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07db882a5sm5446811a91.1.2026.09.23.07.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 07:32:45 -0700 (PDT)
Date: Wed, 23 Sep 2026 08:32:41 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, maz@kernel.org, will@kernel.org,
	catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
	oupton@kernel.org, gshan@redhat.com, joey.gouly@arm.com,
	tabba@google.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com,
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com,
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Subject: Re: [PATCH v18 00/23] KVM: arm64: CCA: Add basic plumbing for Realms
Message-ID: <arPjCZL2IfvTKMml@p14s>
References: <20260915160141.3543048-1-suzuki.poulose@arm.com>
 <aqrsmUTxDVbKJn8k@p14s>
 <yq5aecel3aj3.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aecel3aj3.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_073247_742041_F7B0E30C 
X-CRM114-Status: GOOD (  20.28  )
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

On Tue, Sep 22, 2026 at 02:52:56PM +0530, Aneesh Kumar K.V wrote:
> Mathieu Poirier <mathieu.poirier@linaro.org> writes:
> 
> > Hi Suzuki,
> >
> > On Tue, Sep 15, 2026 at 05:01:18PM +0100, Suzuki K Poulose wrote:
> 
>  [ ... 42 lines skipped ... ] 
> 
> >> 
> >> [0] Arm CCA KVM Support v16 : https://lore.kernel.org/all/20260803134403.80630-1-steven.price@arm.com
> >> [1] Linux firmware RMI https://lore.kernel.org/all/20260912083611.2513845-1-suzuki.poulose@arm.com
> >> [2] Linux GPF Host https://lore.kernel.org/all/20260913070459.2547407-1-suzuki.poulose@arm.com
> >> [3] https://git.gitlab.arm.com/linux-arm/linux-cca/ cca/cca-host/kvm-v18/integration
> >> [4] https://support.arm.com/documentation/den0137/2-0bet3/
> >
> > When testing on the FVP model with the above baselines, I get the following
> > error messagaes in a loop, preventing the system from reaching the command line:
> >
> > [    3.112577] Freeing unused kernel memory: 3520K
> > [    3.115398] Run /sbin/init as init process
> > [    3.142926] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
> > total 512 (slots), used 511 (slots)
> > [    3.150111] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
> > total 512 (slots), used 511 (slots)
> > [    3.177190] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
> > total 512 (slots), used 511 (slots)
> > [    3.197194] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
> > total 512 (slots), used 511 (slots)
> > [    3.217188] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
> > total 512 (slots), used 511 (slots)
> > [    3.237194] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
> > total 512 (slots), used 511 (slots)
> > [    3.257181] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
> > total 512 (slots), used 511 (slots)
> > [    3.277189] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
> > total 512 (slots), used 511 (slots)
> > [    3.297193] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
> > total 512 (slots), used 511 (slots)
> > [    3.317188] virtio-pci 0000:00:02.0: swiotlb buffer is full (sz: 4096 bytes),
> > total 512 (slots), used 511 (slots)
> > [    8.157185] swiotlb_tbl_map_single: 241 callbacks suppressed
> >
> > I get the same result with v17.  Have you seen this before?  Perhaps a kernel
> > option that needs to be adjusted?
> >
> 
> This is due to a change in the swiotlb setup.
> 
> https://lore.kernel.org/all/yq5azeyxyfol.fsf@kernel.org
> 
> You can increase the swiotlb size using the swiotlb= kernel command-line

What size do you recommend setting it at?

> option. I also have a patch series in progress to address this issue:
> 
> https://lore.kernel.org/all/20260921063628.362078-1-aneesh.kumar@kernel.org
> 
> -aneesh
> 

