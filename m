Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5263C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 15:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rDSwoxTT;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=qbsEPwkD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0c2WAJ+A3fmtE5JIgmM33C+5uxJtcuzd3UjlEAxXX4c=; b=rDSwoxTTNqSjLh2U2WlMtacg28
	wjY8iClo1rQuKUyr1Mr38aJGPczgh5OjnNepHLANUdsm9IKpvqgiI9bNMDelB2KKqf9zEpYkfQI4l
	2E5Kixp+ysU7wLTUzF6NuiPrvT2IASCleEV7TKoZ6IAE+hgpHPNOfwyCLB1TFhSDcuswkRLwEMXtt
	PheAXzMQazoOin2PxXKiNCph/8QoFV/DLJwHx9ekf8FEuV6+yGFQWX44yYVXNAumsw9Ea+QDlUyOk
	8CVeiH03i72Zv4yQyL6nvkpap4HmhHwT2U75oePwAYobZM1xRot8I1ferifITW85PWqWIRZzHzlJ0
	9w26a2Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBQO-0000000A1xo-0LJd;
	Tue, 20 Oct 2026 15:06:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBQK-0000000A1x1-1nfa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 15:06:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BACB516F8;
	Tue, 20 Oct 2026 08:06:38 -0700 (PDT)
Received: from [10.0.137.15] (XHFQ2J9959-5.cambridge.arm.com [10.0.137.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 023503F7B4;
	Tue, 20 Oct 2026 08:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792508801; bh=B2p95+bauGKjmtB2lfd2lV6Dt4OS4tWv6hQlDp4Cj+Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qbsEPwkDD7Lc4yU5KuGZCTmflk83ca1uakWmyzyB5V+G5xona4bnVrrf8HUO7SfBD
	 hWcREG5/ibmRlF3zEEC0SajKDIYlVtmTByzKmcih5lFG3FO5cxnsZcCqcNRrejVtTV
	 ofgzQDwH+CmP1BeWW8uCRXFv9mqJ7hmrpsqrKaQ8=
Message-ID: <c367caf3-d462-42ea-b482-bf9c51c47a63@arm.com>
Date: Tue, 20 Oct 2026 16:06:37 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 12/15] vfio: Support VFIO devices that access the
 CPU MMU
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Alex Williamson <alex@shazbot.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jean-Philippe Brucker <jpb@kernel.org>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
References: <20261015142552.4128028-1-ryan.roberts@arm.com>
 <20261015142552.4128028-13-ryan.roberts@arm.com>
 <20261015164421.GD13920@nvidia.com>
 <95e0f9bd-0203-4c7a-9d09-622593bb3d4c@arm.com>
 <20261020140944.GA3008132@nvidia.com>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <20261020140944.GA3008132@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_080644_517710_1E840F91 
X-CRM114-Status: GOOD (  16.99  )
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

On 20/10/2026 15:09, Jason Gunthorpe wrote:
> On Tue, Oct 20, 2026 at 12:51:26PM +0100, Ryan Roberts wrote:
>>> However.. you still have to affirm which single mm is the mm that the
>>> device is going to be doing DMA against. The process the opens the fd
>>> should not be forced to be the mm that it gets linked to.
>>
>> What is the mm representing here? Ultimately we want to install the KVM
>> instance's stage2 pgtables and (pinned) VMID. We currently get that via the
>> bound KVM instance (which looks like it still works using the cdev interface?)
>>
>> The guest will then install the stage1 pgtables and (pinned) ASID associated
>> with the relevant (guest) mm_struct.
>>
>> Do we _need_ an mm association in the host?
> 
> Ah.. I see, I didn't quite follow that. OK.. Ah everyone else doing
> this is using iommufd with a viommu to establish their connection
> between device an KVM. eg Jacob Pan's series. That's a probably a
> better idea to stay aligned with the common path. Though your reasons
> are a little different..

Just to check, you're referring to [1]?

I was under the impression that I could open the VFIO device through the cdev
interface, then bind it to the KVM instance via KVM_DEV_VFIO_FILE_ADD... Why do
I need an iommufd at all?

[1]
https://lore.kernel.org/all/20260925190742.1575380-1-jacob.pan@linux.microsoft.com/#t

Thanks,
Ryan

> 
> If you manage to get pinned VMID out of KVM then we can implement SMMU
> BTM as well!
> 
> Jason


