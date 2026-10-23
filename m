Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699D8606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 14:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c7roj7UD;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=MNdayn29
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=n36re4R3i8nXuM6/wGbiNDosDIqVkvFnDzUX2RMRlk0=; b=c7roj7UD2CHH0F
	sPlmPDItvOSdEFAedSDFOZZvFxsHcgcv2mKyB2j/NSjiWNmQswR/yI5jT+PwvtiiNjs+AgYpitAY6
	67rmlrjpKjA+ZV6sIWF7Rg/ZsrMiPyfYh7HbTZw9O7csqugWJV7Mw/G3tlvud+M0SqfNh/9yN2AdV
	NWwx6xTZwo136hR0zVcwJ4VGr50z9eJF0owB0z0UH6g7r1fwwIz+6ULx4BNyxZjpFsuWbtHQr9Hw3
	Wt6BBJpE6Bc5oteZi2CxYVhd+1gb6Svb9IsqpPt7y4DukAESUk0lXvOIw6/Ixz6J7aVPuhOrNMVnv
	y53Rt3+KFReghCDuQy6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFsn-0000000GTAG-3Wgp;
	Fri, 23 Oct 2026 14:04:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFsm-0000000GT9u-0u7B
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 14:04:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BE731C00;
	Fri, 23 Oct 2026 07:04:28 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AAEFB3F673;
	Fri, 23 Oct 2026 07:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792764271; bh=5LUMkx86sW2CCaNHvIGxIW+K+1BbJjEkbPwVzal5v8s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MNdayn29iT3ViLmPTZMzRluVsO7PfHn4zcOiCsLLTysTzD3Cs6MS/MP6pzsZOeyIa
	 i8F1Y57RsdzBNTeLzkb4acyVsYrD+fVBCmNLNS+yasI6jOzTLjW3d0QIGG2glwXWi0
	 PECjFLAvvaYmEV+lv2hDunZXOn2GftZHeKRfHFBc=
Message-ID: <d4570e2d-5b92-4f05-a8b3-34d5d5b299bd@arm.com>
Date: Fri, 23 Oct 2026 15:04:23 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] iommu/arm-smmu-v3: Add support for hitless
 replace of S1 domains
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Samiullah Khawaja <skhawaja@google.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Kevin Tian <kevin.tian@intel.com>,
 Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 David Matlack <dmatlack@google.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Pranjal Shrivastava <praan@google.com>
References: <20260925011308.3381953-1-skhawaja@google.com>
 <20260925011308.3381953-4-skhawaja@google.com>
 <3d1eb92f-3447-49f0-a210-fd4fa015304b@arm.com>
 <20261023134900.GB3977851@ziepe.ca>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20261023134900.GB3977851@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_070432_306349_DA29815F 
X-CRM114-Status: GOOD (  10.91  )
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
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/10/2026 2:49 pm, Jason Gunthorpe wrote:
> On Fri, Oct 23, 2026 at 02:43:28PM +0100, Robin Murphy wrote:
>>> @@ -3664,8 +3726,8 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev,
>>>    		struct arm_smmu_cd target_cd;
>>>    		arm_smmu_make_s1_cd(&target_cd, master, smmu_domain);
>>> -		arm_smmu_write_cd_entry(master, IOMMU_NO_PASID, cdptr,
>>> -					&target_cd);
>>> +		arm_smmu_replace_cd_entry(master, IOMMU_NO_PASID, cdptr,
>>> +					  &target_cd);
>>
>> No, we cannot blindly do this for arbitrary ->attach_dev calls - the
>> majority of S1->S1 transitions are going to be moving back and forth between
>> the default domain and user domains, where there is zero expectation, let
>> alone guarantee, that the translations would be equivalent and thus not
>> liable to lead to TLB conflict aborts or amalgamation hell.
> 
> Heh, yeah this probably only works properly with BBML2 or something so
> the temporary ASID doesn't explode.

This is fundamental VMSA behaviour - see R_FVQCK in the Arm ARM. BBML 
only applies to the one specific case of identical VA->PA translations 
with identical attributes _only_ differing in the leaf level at which 
they are described.

Thanks,
Robin.

