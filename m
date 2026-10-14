Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF97BCC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 21:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:References:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmdjCtO0BT/G+HosYDOiIQ+MFbY+P6PHIY8xmD++EWw=; b=Hhp66IvqkzDiajPxT6WWH48cmE
	ZhYkQbxdy9tqf9dfAHo+J/nKKiUYXvrlLlt39QRZ7jXQuaxSJka8ZAqPtqYCNFRGnKxdBspoSGgBn
	AmaNAa6arIK48d9LNuj/S1PE5ggccGmAT5BFj0OZ/mnv7XL1F4Nz1zcDTSJ1JGHE71TFR56yF0ezF
	KXiZXHthYWsePfcPIBbFgmymzJ6fgP02XtFrQ+rtPHCxOdyIVf8ShFPWILShjVgqrlPDMvBWtThNx
	iGvSaCx3UG2G0b47oC5sp/5wDiOHnchrxmoCkGNXOXoqmO7gu9wFSoBkgOIMx4PCPcvmWeeNDHFc4
	GFptMVPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH6of-0000000GN50-0khe;
	Wed, 14 Oct 2026 21:47:17 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH6oZ-0000000GN3z-0beb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 21:47:16 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-91ba702cceaso9518946d6.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 14:47:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792014428; cv=none;
        d=google.com; s=arc-20260327;
        b=PjyI84rNCu9i/Uid574vW9ToDhJuoprLvbNk9tsNNBeEWH2YjIQyI6l/MnpXVeAafg
         KfEnLylvvCBtVmbE3v3gf8HaHpa+RCIEWWFRFuIgxyo9CnviZu53D+Z11brc7rxkRfFU
         uRGNv3VQT2QTI5R7xdcEC+yfoZeDS+9w+optPFQoBk1Xs9QPDMuOzTmafZJP2VJLt6u+
         xMdd7Do5ioRYAPx6V6iIo/7UBs0Aj9uL6R1MJpRA9tM/V0o+L0UOL1+KJYwOb9EVxQ25
         2htex3EXkkftRTdh0dBu7S38yMCyMCcogc8yiYrT9ngtwuWPhTNx4KF1fUrxMjIgT7pC
         TKFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=OmdjCtO0BT/G+HosYDOiIQ+MFbY+P6PHIY8xmD++EWw=;
        fh=uniDS1IW2VEEVVIIHuQI5i4+DuKp+hez1YT89fRhtX4=;
        b=czByCrtFFPTsYD5VZMuYEckzf3jmfRvMuVtbV8Duj3PId7YbR+6euXqlafSkZ1N08m
         E16RiwbFSeGJ1hsR3R9XM5WKAIdMgz2lKu4YlJEsRtjXdNoGbdGElauQw3VMN68ZqK2g
         0SgWCPbBApzHZCAOVTpJRsMhInrprvdJTVA8aq16SpOtraw9GIe7Mz3oT6Ee3MutmRlB
         aqzgXXzDysq+yg3SOHDr8Qht/p7yTNN0Hi5AlPNOk4MCak4VXWNVG5JpvKieeq7XXTIS
         Ox8kKnO55xAiwIdRWVOP6/mgI/qPRLOxxihjjtLaiMQEFRuZHh4v+iynQN57GIQvWRck
         jmXg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792014428; x=1792619228; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OmdjCtO0BT/G+HosYDOiIQ+MFbY+P6PHIY8xmD++EWw=;
        b=p0Mxsy/unz5Ui5z5/mXlXVcaS6Y2gaxqG+XYJZNyQWDwYJKDP0a5MTqsgC8xH2A+mU
         jl35gIwgmUzkevb1/o5VdjrDm5kwsaGgeZ+qqPqhKOZiPWyU60nXhHidxJ8cJEUR2bmh
         Tn7XFREEiciIRfjCwmAoxq00b0/FLXVSZeqCc3Z+s3B6R+hjDI3XCt2IcBBZuxvOPxK3
         xSJ6MwyWukSJLF0L5kG7WVpfhcP+/kMsbQRIatIUAzNX4ZRDPBzGg2SEuzjrHBUB34fb
         qEGlJE0zbmVPMnXnGNNuxQt2vS8y6XG3U+mw4CiyBTAabp8SHa+Y0w5X33QrlMjtQFTG
         GT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792014428; x=1792619228;
        h=content-type:cc:to:subject:message-id:date:mime-version:references
         :in-reply-to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OmdjCtO0BT/G+HosYDOiIQ+MFbY+P6PHIY8xmD++EWw=;
        b=d8ITBLi4pyG5U0qQPLzj9F2PBVU2B7pQuWX68u4TO/h52DTHFetY1ywBnA+ibWBwGL
         4bp9U54YE+gjWcqDE5/X/PFRL8rg+KtmLGz4xiw0AKhCReBVihdm/dgoQQuN29ggW9GL
         1AKG7d2GlQyHz6MP1kzdG5HaZeyZocwJm5BI4iC355S+q0TS7f4RUkaF2wPkn/m+M3o2
         CeQiCrL1Sj9r6LLGUMtx3o1l0Gox+MM7yE4uy4kqY42ouARr8YoryPLi+8xTx9TPUtSN
         UrfmGMTjiYuXRlUrlsAIVgbjC3GaMqBYVK2rRL7MGZXGGKn/7EBNePvGsHBkaDKVNljB
         UacQ==
X-Forwarded-Encrypted: i=1; AKwUvByk59Xdq2EJoJieus6uM6X9V8N0dDiMrIbRZNwmgrD/KdE+sfBx/JpcZy9jbytzEgTzMVPMX/eYo6r5u57LCxpE@lists.infradead.org
X-Gm-Message-State: AFq9FYJQUw3SPwoSJuAhSz9tgkDVUz4MlXzUgZZdHaMEj/pLUIEtG8x8
	yFt4YIli43O4L9Bt+a2tjTcd4IHg4/EiPwRrwEME7fslo4DCkA1JE0eBxFoElPfmPE+w84m1RCi
	msH+NaXbDtc6v9kOkcWxH9ULaZBRFC/JGqI6z6ZZs
X-Gm-Gg: AYBFou3h2W8bs/Se1Aq8o6EDtE7M965ur43AbCRNcrPxTapaSzACpGK+yR9swSzlJNu
	rsu3ISQEWKtDnICphwLe2Wt/CBoFk/l1Hm1xIRGTPppogkFw3GEOzUfP2T9R9E+m1WIkem6NZhQ
	BGQYWubhCCLynBZfixcCUhzANP9t8TJ3U+5vpf5gdLM1tofkJu++IeowUI8zmjgqPy5aHvCXuSI
	d2WTS0ClQVNGKfk7G+nFoKa+oaO2YKNXRP8MxX6VbAdUXnc3jJNrncWSh/XsAK8ueYK1e9hxRIk
	DZW2pQpswjioJHMVnrhCLEZjaLXQ4ZdO0jCTiCdmYh7In1Gg8ibPHUjYP5ao96bfpzoEWU7AerO
	es9oRkzj6l307d0eBozziwemuRnRZF3i4towsDACcHo4FuWjLbbYn
X-Received: by 2002:a05:6214:43c1:b0:91b:8e06:73f5 with SMTP id
 6a1803df08f44-91b8e0680ffmr139578016d6.15.1792014427625; Wed, 14 Oct 2026
 14:47:07 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 14:47:06 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 14 Oct 2026 14:47:06 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20261014095702.39676-1-griffoul@gmail.com>
References: <20260720111259.122911-1-dwmw2@infradead.org> <20261006183235.16576-1-griffoul@gmail.com>
 <CAEvNRgEseLO+LbkwXrEit0H2LH5Wx-srSvHEMpt0=upPL3tF=g@mail.gmail.com> <20261014095702.39676-1-griffoul@gmail.com>
MIME-Version: 1.0
Date: Wed, 14 Oct 2026 14:47:06 -0700
X-Gm-Features: AclHuK_bDoENPFsEJnePb9piUrHFuROo5b9vCnTZ7F3PMjuUH-N1Jl6pvQGbDQg
Message-ID: <CAEvNRgHtB8j6=9r=txjsKvQM0F85nRN4KW5sdnuv_-Og=cWEfg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/9] mm: Memory providers for guest_memfd and iommufd
To: Fred Griffoul <griffoul@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>
Cc: David Woodhouse <dwmw2@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_144711_205037_58CDF85D 
X-CRM114-Status: GOOD (  34.92  )
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

Fred Griffoul <griffoul@gmail.com> writes:

> Ackerley Tng <ackerleytng@google.com> writes:
>
>> When the provider wants to revoke the page, the notifications/function
>> calls flow this way, the last [ENTITY] in the chain actually does the
>> zapping.
>>
>> + [PROVIDER] -> [KVM]
>> + [PROVIDER] -> [DMABUF] -> [IOMMU]
>> + [PROVIDER] -> [GUEST_MEMFD] -> [USERSPACE] (AFAICT this was not
>>   implemented in the RFC.)
>
> Thanks for going through it. I have just posted v2:
>
>   https://lore.kernel.org/all/20261014093733.90312-1-griffoul@gmail.com/
>
> It changes two of these chains. dma-buf is gone: iommufd attaches to
> the provider file itself, through a small interface in mm. And
> guest_memfd now maps the file into userspace from the provider's
> frames, so a revoke also zaps the VMM's mapping:
>
>   [PROVIDER] -> [GUEST_MEMFD] -> [KVM], [USERSPACE]
>   [PROVIDER] -> [IOMMU]
>

Thanks :)

>> IIUC guest_memfd conversions was not illustrated in the RFC: what
>> happens on a shared -> private conversion?
>
> There are none yet. Only VMs of type KVM_X86_DEFAULT_VM can use a
> provider, so all their memory is shared.
>

To borrow David's words, the part about this that makes me itch is
conversion. We have to support conversions. Even if it doesn't merge in
the first patch series, we have to have line of sight to how conversions
would work.

Conversion requests originate from the guest and then the host handles
the guest request by making calling an ioctl on guest_memfd. Hopefully
this part doesn't change with alternative provider support.

Suppose guest_memfd still gets the conversion request first, in RFCv2,
to reach all the mappings in various page tables, it would have to be

+ [GUEST_MEMFD] -> [KVM], [USERSPACE]
+ [GUEST_MEMFD] -> [PROVIDER] -> [IOMMU]

since guest_memfd must ensure no IOMMU mappings to guest private pages?
There's that extra step through the [PROVIDER]...

>> Does your provider need to know if some memory was transitioned between
>> shared/private states? The provider can be notified too, if
>> necessary. If not, then isn't guest_memfd doing all the coordination
>> better than going via the provider?
>
> Our provider does not need to know, and I agree: once there is private
> memory, guest_memfd converts the pages, so it should tell the others
> what to zap.
>
> I think the two models meet there, and the v2 cover letter now says so.
> The iommufd side of v2 does not pin and keeps no references: it asks for
> the frame behind each page, treats a page with no frame as a hole, and
> maps again on a revoke. guest_memfd can offer that for its own file:
> shared pages return their frames, private pages are holes, and
> guest_memfd revokes a range whenever it converts it, in either
> direction. That is your [GUEST_MEMFD] -> [IOMMU], and it should work for
> folio-backed guest_memfd without memfd_pin_folios() or refcounts, as
> long as guest_memfd also revokes a range before it frees its folios.
>

This part makes sense, if I'm understanding you correctly.

> The one difference is that v2 also lets iommufd map a provider file
> directly. Going through guest_memfd would add nothing without private
> memory: it would only pass each revoke on. And memory that only devices
> use, such as MMIO, does not go through guest_memfd at all. Both paths
> would use the same iommufd code.
>
>> Does the revocation model work for you? If it helps, I can rebuild the
>> sample provider to illustrate how the revocation can be done.
>
> Yes, the revocation model works for us. v2 replaces David's sample
> with one that moves, donates and makes pages read-only, and a selftest
> that checks the guest, the device and the VMM's mapping after each
> change. It may be a good base if you want to try guest_memfd as the
> provider for iommufd on top of it.
>

Thanks, I will prototype what I have in mind too to make sure things
work as I think they will :)

>> 4. [DIRECTMAP] Kernel direct map.
>
> Agreed, that is separate. The memory we have in mind is a range hidden
> from the host with memmap=, so it is not in the direct map.
>
> Thanks,
> Fred

