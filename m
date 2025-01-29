Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A2E0C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 12:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z2rZzWmBPUWvjcNF+Tp2W7jWB2lbA7lN2MnSH0V5dqM=; b=UEGdZnrArr7gk5
	ox9fmLQ1oSAVdmwMla5nal1LGv8LzNXmxjFAczAdrKsfs4C8n4XX1JFYB3nu4X1j9fqw0mZ3t4WMy
	G84/U3C5FrNC+tFqKQt9eTZIN0iTZlBsRe78vu4FFhNbGWkfOe7VqB8CHpDYVPA6IkXI+Em0H6+yh
	2+W25Ulb1SfaQ+0fq6rzKuC1thHC8FNpCfytYLU/aEu00V3ScY7H01e/SGbFS4cTijLvDduFyr8Ig
	/m8QwPuVJmW23UrtLR8WBDtsGq7bZtThqy3Cp7HlWdbdX7HAlXYXMCT+noXdwJVvr7Gpn2I7jJUc/
	gkrbly5l8K2qwybmoSQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td7DM-00000006wCm-3Xv9;
	Wed, 29 Jan 2025 12:30:40 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td7C2-00000006w2S-0qx8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 12:29:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738153756;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z2rZzWmBPUWvjcNF+Tp2W7jWB2lbA7lN2MnSH0V5dqM=;
	b=EGV4Qk8ehTO8IFvb0O0pkB81nogWzMaZkdxmm0XPSBSxZXk9ceZFp4rHBSwOc9NSfrCvkW
	adM6Z4dZ5q3kEDHkG1QWFe6woBB5wQoEuhG7Ku5Ts5hpzc0Z39bmvYTf9ednnAN7VCeHrY
	4SiqWmQ87YJJlnZlKCfNLHktetU/4OM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-JXN95m77PzGdgH0H0PNU0A-1; Wed, 29 Jan 2025 07:29:15 -0500
X-MC-Unique: JXN95m77PzGdgH0H0PNU0A-1
X-Mimecast-MFC-AGG-ID: JXN95m77PzGdgH0H0PNU0A
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-385f0829430so4258903f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 04:29:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738153754; x=1738758554;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z2rZzWmBPUWvjcNF+Tp2W7jWB2lbA7lN2MnSH0V5dqM=;
        b=ksOYTh42OOD98fBw2jpevY/75ay9HwIZ8XQV5UQewe61P92ONW1SMqffjOTBfU5ibn
         RLJ4zMe25ms/1AnWJ/P1ynmWYFRWRAghWPu9M30VVrfrGE14vmJm/D0TrzNO5EmYhjlk
         dHCTUPmORVRc2YOkgK0mLt4nbFvlT292DDnCgyJMsFEVe+IERpw+Ug7aAbYzDfiSgy1E
         FAIkFs8Au1nYfLLcQr3bsg07auC/q0GhxmO4Ci0VVkiRvDBmJu/bpcQOekVko6fKnSVN
         6qDExRSa551V34BrTU/ytD3VWk8OlZuCUHeHkFmiC8jVS2Tnv0s5z6oXIPzborlR9Ac2
         0Rbw==
X-Forwarded-Encrypted: i=1; AJvYcCWm4+IGv8cNFGLlUTSHUIGhDZLoAoKciSTFZo3/N55Q1BcjaPMiv2E2QUus2pEW+hTiEO8HVt4pehK/LlB7zl38@lists.infradead.org
X-Gm-Message-State: AOJu0YxehsUhAMpgB0PA/16yktv20IZA+30DYEnbAHouFMjg+1BRvtj2
	d7FlBzpy0LB+HWrPL5P7ySjIb76UR2TuxDKU9LCX1on+9eSnmc1KAvb0AO1blxu0/MvzJiu76Wa
	eMCdFk7TFo0OlUViBIG/9QfyRhPy/ZdpWPVZK+wcN3WTYhwsUUq1IrBf6cc8fjeh+mzfI0Raz
X-Gm-Gg: ASbGncut1TIXFd3MBrb2hdP/SB2IZOxG+tV2FWuWIY7QIePhtB/MFsJ53Wt1V7Q7FyJ
	WouamA91mZTe3VUG5ox6kx/5x4EW5iec4H6NLHveSYkZKnJWq+OPQwCkWSae3WcJQFtOM/4xkAO
	1v3F3zfvn6Mgh6s4U1cY18i43IsABDTYVTpFVZuLO/KmN4Gdlp2rUFurb/YR/Q9Ll1LieD5rjzl
	JFuqUf9tbcJffb5iyI/AhUj88TcEG9EawRp9ILXTYW5Jvax4/suI5zUzLEW5BdLY3VqTaLKgYNf
	TusVVNmRJljJY8vGgxkz4gzrBe/zL8UeZYkG1nCOdl9FHORUkZye
X-Received: by 2002:a05:6000:2a6:b0:38c:2745:2df3 with SMTP id ffacd0b85a97d-38c51e95dc8mr2661444f8f.37.1738153754447;
        Wed, 29 Jan 2025 04:29:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEd8a98Fk4FsyLzo/fsw4POBiKHb+ykWAZ+mPPkOyJLd/auzYk5opYB2Di0YY/K4rHi8Qvhrw==
X-Received: by 2002:a05:6000:2a6:b0:38c:2745:2df3 with SMTP id ffacd0b85a97d-38c51e95dc8mr2661397f8f.37.1738153754034;
        Wed, 29 Jan 2025 04:29:14 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438d7aa296esm34288705e9.1.2025.01.29.04.29.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 04:29:13 -0800 (PST)
Message-ID: <94a6414e-d047-41c7-b740-4b57fae0ebbb@redhat.com>
Date: Wed, 29 Jan 2025 13:29:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv2 03/13] iommu: Make iommu_dma_prepare_msi() into a
 generic operation
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
 robin.murphy@arm.com, kevin.tian@intel.com, tglx@linutronix.de,
 maz@kernel.org, alex.williamson@redhat.com, joro@8bytes.org,
 shuah@kernel.org, reinette.chatre@intel.com, yebin10@huawei.com,
 apatel@ventanamicro.com, shivamurthy.shastri@linutronix.de,
 bhelgaas@google.com, anna-maria@linutronix.de, yury.norov@gmail.com,
 nipun.gupta@amd.com, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
 jean-philippe@linaro.org, mdf@kernel.org, mshavit@google.com,
 shameerali.kolothum.thodi@huawei.com, smostafa@google.com, ddutile@redhat.com
References: <cover.1736550979.git.nicolinc@nvidia.com>
 <9914f9e6b32d49f74ace2200fd50583def9f15f6.1736550979.git.nicolinc@nvidia.com>
 <787fd89b-fbc0-4fd5-a1af-63dfddf13435@redhat.com>
 <20250123181657.GT5556@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250123181657.GT5556@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lmF7KrG-mtbIau376180qgypj288M1Lx8-XihHqUYgM_1738153754
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_042918_319622_0186F196 
X-CRM114-Status: GOOD (  23.02  )
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
Reply-To: eric.auger@redhat.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Jason,


On 1/23/25 7:16 PM, Jason Gunthorpe wrote:
> On Thu, Jan 23, 2025 at 06:10:47PM +0100, Eric Auger wrote:
>> Hi,
>>
>>
>> On 1/11/25 4:32 AM, Nicolin Chen wrote:
>>> From: Jason Gunthorpe <jgg@nvidia.com>
>>>
>>> SW_MSI supports IOMMU to translate an MSI message before the MSI message
>>> is delivered to the interrupt controller. On such systems the iommu_domain
>>> must have a translation for the MSI message for interrupts to work.
>>>
>>> The IRQ subsystem will call into IOMMU to request that a physical page be
>>> setup to receive MSI message, and the IOMMU then sets an IOVA that maps to
>>> that physical page. Ultimately the IOVA is programmed into the device via
>>> the msi_msg.
>>>
>>> Generalize this to allow the iommu_domain owner to provide its own
>>> implementation of this mapping. Add a function pointer to struct
>>> iommu_domain to allow the domain owner to provide an implementation.
>>>
>>> Have dma-iommu supply its implementation for IOMMU_DOMAIN_DMA types during
>>> the iommu_get_dma_cookie() path. For IOMMU_DOMAIN_UNMANAGED types used by
>>> VFIO (and iommufd for now), have the same iommu_dma_sw_msi set as well in
>>> the iommu_get_msi_cookie() path.
>>>
>>> Hold the group mutex while in iommu_dma_prepare_msi() to ensure the domain
>>> doesn't change or become freed while running. Races with IRQ operations
>>> from VFIO and domain changes from iommufd are possible here.
>> this was my question in previous comments
> Ah, well there is the answer :)
>
>>> Rreplace the msi_prepare_lock with a lockdep assertion for the group mutex
>> Replace
>>> as documentation. For the dma_iommu.c each iommu_domain unique to a
>> is?
>>> group.
> Yes
>
> Replace the msi_prepare_lock with a lockdep assertion for the group mutex
> as documentation. For the dmau_iommu.c each iommu_domain is unique to a
> group.
>
>>> @@ -443,6 +449,9 @@ void iommu_put_dma_cookie(struct iommu_domain *domain)
>>>  	struct iommu_dma_cookie *cookie = domain->iova_cookie;
>>>  	struct iommu_dma_msi_page *msi, *tmp;
>>>  
>>> +	if (domain->sw_msi != iommu_dma_sw_msi)
>>> +		return;
>>> +
>> I don't get the above check.
> It is because of this:
>
> void iommu_domain_free(struct iommu_domain *domain)
> {
> 	if (domain->type == IOMMU_DOMAIN_SVA)
> 		mmdrop(domain->mm);
> 	iommu_put_dma_cookie(domain);
>
> iommufd may be using domain->sw_msi so iommu_put_dma_cookie() needs to
> be a NOP. Also, later we move cookie into a union so it is not
> reliably NULL anymore.
OK
>
>> The comment says this is also called for a
>> cookie prepared with iommu_get_dma_cookie(). Don't you need to do some
>> cleanup for this latter?
> That seems seems OK, only two places set domain->iova_cookie:
>
> int iommu_get_dma_cookie(struct iommu_domain *domain)
> {
> 	domain->iova_cookie = cookie_alloc(IOMMU_DMA_IOVA_COOKIE);
> 	iommu_domain_set_sw_msi(domain, iommu_dma_sw_msi);
>
> and
>
> int iommu_get_msi_cookie(struct iommu_domain *domain, dma_addr_t base)
> {
> 	domain->iova_cookie = cookie;
> 	iommu_domain_set_sw_msi(domain, iommu_dma_sw_msi);
>
> So (domain->sw_msi == iommu_dma_sw_msi) in iommu_put_dma_cookie() for
> both cases..
makes sense.

Thanks

Eric
>
> Jason
>


