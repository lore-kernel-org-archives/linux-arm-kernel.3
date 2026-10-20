Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE55606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 16:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZfweUjBT;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=X4lGo9CE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sm8fHDamcBdzMl5gH1h8FKaHDH8UrW+Ey8qPWPBjzGw=; b=ZfweUjBTlRBj9Hty9OtAwr9E6K
	vF3mqzknjIEPB0VGKCUMICXO5j1ChREjAx2tT5PLdclN6vmuykWoEKjjHf4cRjii2ZIrcFFvvbfGl
	sqKgvl+c4YJCSeih6Kpns6CE5f9kb82V+QIlM7HYFk8UIoKw0AUW/2vsAebLJhndr6dJ4YbqAi8Go
	FpXs8G2/8tMTjLCYeh8q8QuMcMLkBUqeCnl5Hk8oX+gzbciplkFXJvG8ANLKMeDJpty6/N3EEMf98
	rMLAwVpYq4rT+ctUBk04z9yZ25eA2UjrcOKjHnIU+s/fkQptEwBwZOCISnxEkpw7sPqmMYL0ekEHA
	QPpFnLNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJCC9-0000000A6is-0Z3z;
	Tue, 20 Oct 2026 15:56:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJCC1-0000000A6iM-1tht
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 15:56:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB36916F8;
	Tue, 20 Oct 2026 08:55:50 -0700 (PDT)
Received: from [10.0.137.15] (XHFQ2J9959-5.cambridge.arm.com [10.0.137.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16E3D3F7B4;
	Tue, 20 Oct 2026 08:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792511754; bh=RA7wOkYKzBDqak619Rsj+v/XerrUB1e1xwduoqIgrN8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X4lGo9CEziSLBpzJ/wESFC5gv5b77FuUDrR0qNwD8V1L1mSKpYmzGUiAukpnL80d8
	 P11iPoiXfYQuXADVOOxE6uyuYgs13RlDvy1BObGmrYbA1li5ZIbGLrEXmg2JIdJMIw
	 rykl0k838v9Jemvp9bv+0a2Q8qDWplu00g6B3roE=
Message-ID: <3f49b39e-139f-45da-b646-dbb240b31776@arm.com>
Date: Tue, 20 Oct 2026 16:55:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 12/15] vfio: Support VFIO devices that access the
 CPU MMU
To: Alex Williamson <alex@shazbot.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean-Philippe Brucker <jpb@kernel.org>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
References: <20261015142552.4128028-1-ryan.roberts@arm.com>
 <20261015142552.4128028-13-ryan.roberts@arm.com>
 <20261015164421.GD13920@nvidia.com>
 <95e0f9bd-0203-4c7a-9d09-622593bb3d4c@arm.com>
 <20261020140944.GA3008132@nvidia.com>
 <c367caf3-d462-42ea-b482-bf9c51c47a63@arm.com>
 <20261020091323.3c51258e@shazbot.org>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <20261020091323.3c51258e@shazbot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_085603_030774_AF71A92C 
X-CRM114-Status: GOOD (  16.55  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 20/10/2026 16:13, Alex Williamson wrote:
> On Tue, 20 Oct 2026 16:06:37 +0100
> Ryan Roberts <ryan.roberts@arm.com> wrote:
> 
>> On 20/10/2026 15:09, Jason Gunthorpe wrote:
>>> On Tue, Oct 20, 2026 at 12:51:26PM +0100, Ryan Roberts wrote:  
>>>>> However.. you still have to affirm which single mm is the mm that the
>>>>> device is going to be doing DMA against. The process the opens the fd
>>>>> should not be forced to be the mm that it gets linked to.  
>>>>
>>>> What is the mm representing here? Ultimately we want to install the KVM
>>>> instance's stage2 pgtables and (pinned) VMID. We currently get that via the
>>>> bound KVM instance (which looks like it still works using the cdev interface?)
>>>>
>>>> The guest will then install the stage1 pgtables and (pinned) ASID associated
>>>> with the relevant (guest) mm_struct.
>>>>
>>>> Do we _need_ an mm association in the host?  
>>>
>>> Ah.. I see, I didn't quite follow that. OK.. Ah everyone else doing
>>> this is using iommufd with a viommu to establish their connection
>>> between device an KVM. eg Jacob Pan's series. That's a probably a
>>> better idea to stay aligned with the common path. Though your reasons
>>> are a little different..  
>>
>> Just to check, you're referring to [1]?
>>
>> I was under the impression that I could open the VFIO device through the cdev
>> interface, then bind it to the KVM instance via KVM_DEV_VFIO_FILE_ADD... Why do
>> I need an iommufd at all?
> 
> The cdev is not unlocked to actually access the device until it's bound
> to iommufd.  Thanks,

Ahh - got it! Thanks!

> 
> Alex


