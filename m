Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EF4606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 11:51:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Htr41aMq;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=k1oeeqEy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNoA3+6wTNExlUkYZCt9HTAT9xEHjkyLUdvHdZCEN4Y=; b=Htr41aMqcg+zKSvi20+v5YSTy4
	39KrOrxSRmi3PI0FbceXDICxYzsolG98vh/omSWLeoCPaWuDThVeGRuOZqRSyJrOImw78QqZgc2r1
	kZLEoQCDPSBkhR1rdh+x/fPx53BvhetDxvlZqKZjTjPXSEfYAiOvkOHRZssEAhFtg7btglsD/Iw5C
	DOz+nbfRac6fUh2ZKtwvwZrI/yd9cn8tRpXIpNY+oI8IeISlDStXI80BjuuJjpt2Q43yjpIIRSKWF
	WkaNcYbbivU9ka6dGOkkXGUgpkzmVY3WJlhSAdRirb0G3dxt96v8+V5vbeWBbnYyhPXqDXqgnEdhG
	vsD3wjLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8NT-00000009anp-0H0L;
	Tue, 20 Oct 2026 11:51:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8NR-00000009anS-0LcX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 11:51:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE6E21596;
	Tue, 20 Oct 2026 04:51:27 -0700 (PDT)
Received: from [10.0.137.15] (XHFQ2J9959-5.cambridge.arm.com [10.0.137.15])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E1F9A3F7B4;
	Tue, 20 Oct 2026 04:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792497090; bh=UFdHRBoQNmzK3J1KulBJN2N/STdJqV3Qy+2zaWTevg8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k1oeeqEyXO6BAXWERGM3PoBR163hq6VQuZgUfNyIwbgfcGU+dMXRc6ZiMZ8nIPUHE
	 hepPI5uQuoBLhfyK2T0O/Del6FpxrnjimRZS57vdorb4f0y7hQi1/BYwO9CNcBOF4p
	 xtMeabKTRqXJsmvVN6HMxF9dAnQOgKizG9dfxlgQ=
Message-ID: <95e0f9bd-0203-4c7a-9d09-622593bb3d4c@arm.com>
Date: Tue, 20 Oct 2026 12:51:26 +0100
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
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <20261015164421.GD13920@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_045133_164565_8A30EB99 
X-CRM114-Status: GOOD (  23.64  )
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

Hi Jason,


On 15/10/2026 17:44, Jason Gunthorpe wrote:
> On Thu, Oct 15, 2026 at 03:25:46PM +0100, Ryan Roberts wrote:
>> From: Jean-Philippe Brucker <jpb@kernel.org>
>>
>> Support devices that are attached to a CPU and perform DMA through a
>> MMU. They do not have an IOMMU and do not use a VFIO container.
>> The VMM needs device-specific knowledge in order to create a virtual
>> device (device tree, ACPI tables), so it also knows not to allocate a
>> container.
> 
> I'm not so excited to see new things built on top of the group
> interface.
> 
> Maybe in this case you just don't have to do a bind operation on the
> cdev to an iommufd? That feels kind of natural if you don't use a
> iommufd

Yes, that makes sense. I don't know enough to know what actually needs to change
to make this work, but will look in this direction.

> 
> However.. you still have to affirm which single mm is the mm that the
> device is going to be doing DMA against. The process the opens the fd
> should not be forced to be the mm that it gets linked to.

What is the mm representing here? Ultimately we want to install the KVM
instance's stage2 pgtables and (pinned) VMID. We currently get that via the
bound KVM instance (which looks like it still works using the cdev interface?)

The guest will then install the stage1 pgtables and (pinned) ASID associated
with the relevant (guest) mm_struct.

Do we _need_ an mm association in the host?

Thanks,
Ryan

> 
> From that perspective maybe you should create an iommufd and a special
> "SVA" IOAS that it can attach to. This is more complicated but it
> makes the mm linkage and blocking beahvior explicit and controlled by
> userspace.
> 
> Jason


