Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F7CC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 12:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FfYT43qInjD7+NE+73mPjG28PGMRFzMEZ6xoue/ST5Q=; b=Ryjbj+kCDVunbS
	iKh4ITYJMsj4AtsCTOj6OwdBoPxB+WvIwubQeJx4JntefZBvV/q0ir62uTvzzQvKkeGrLJ6nZ7gjA
	zQeUY7PCmn2BFANUMYcw7ZLlUU58m4SGg+Dj5luO+oXCE8mJd29M7sgEbTEMDFAoR3FHbrAU7Zi1k
	A2YUnQazwOZWhV2rDTExEkSMJ4kBsOxWK0+q9gHMKJaE7Qc8CPnEvHuN7xEgK6cBq5h7jFswDe0TD
	8dEQooKvuG753p8HJktt1JTRor/EDNTu56OKjBs4AzbUHmBJH31NI04CgWe9g/fxDEQh8OrAyRThn
	j4QEknINSMYHzKQDDLpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td6vt-00000006uu5-1000;
	Wed, 29 Jan 2025 12:12:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td6uZ-00000006uon-0aUb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 12:11:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738152673;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FfYT43qInjD7+NE+73mPjG28PGMRFzMEZ6xoue/ST5Q=;
	b=BJdAHDd7d8BsG9OJUN5bA0aVzgMPEhtaF8Yd1I5JBAajVukD+Oi3aWA65zaxkkvmMTM9JV
	uDWTZQQMeCRgPL+LH/5rH/U4iksiwDBySSdTIhXvoOnHPO8wwVzcRjNLJTxroVq5LwT2qw
	tHsBg2uWt/GmBGRW5YLwnKFgFxYjZrk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-oLsuMclzMnqStjH0IoPOTg-1; Wed, 29 Jan 2025 07:11:10 -0500
X-MC-Unique: oLsuMclzMnqStjH0IoPOTg-1
X-Mimecast-MFC-AGG-ID: oLsuMclzMnqStjH0IoPOTg
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5d3c284eba0so8813044a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 04:11:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738152669; x=1738757469;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FfYT43qInjD7+NE+73mPjG28PGMRFzMEZ6xoue/ST5Q=;
        b=NAck1+aizhkCI8hyR+fbZ6z7zFXgTMw5cMR/9JYNgBYYCGHI3o5Uqn2O6jrZP18mMi
         RIpgUwBHiLw/5YQTXPMB28fDRKySSdK7m7PS4UgdwHPzbZ4si8ck2EuYEsL0ExxfUqy5
         wC/0CHEM1Q6VLWaWRzJXswoVgaUqeDQPo8yZ88cEvbfEVOZVbCxqG7ZV4ixm9Zhd2ttO
         BizG8CaZFMnjWbGH21TD7XqXS8QvogeuT6Zljv463w0buxSJWf0U0WwBogcYIMzVNyZC
         yObBK6WlRK5gzub+fwX9PiqdtUhtL3zjZOeoNviMPj8bjKLrjzWcUSFz8Ahql8BukC2d
         IPjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS131jNIS01Eqivek4VXbmogWyaaTQgP4ynK+ogRt+HI5ElvRvli5PleQhgTjSpJ2yF0YVxqDrKbDkJ4ALobUz@lists.infradead.org
X-Gm-Message-State: AOJu0YzvHhzBlvDGxQLOWy8nmNe7UiOOeCroqrdwx8xA7yMwyZKMpWW7
	cE2R/FJjqAWzETkZrLRAsugUtrR8JV4fFcgzR1ev4gzZ0Rp4X+aDArw19EtWK0yyNkD33fuBmg+
	9tcjLDg+sCz9TR++54ISMCh+kHluLT4g/chGUcldw+jXq3WBMWAAbAh9/DHjgt0ucUqfYtNRq
X-Gm-Gg: ASbGncuRogX5i2/UPRvsPhf6daM/LuZYD/Rtv4YqcqgcejdzlUl08284fuolL9VxpYk
	6q7JFdHrdqhQIn0rHJ1Vmm4Fr58gOt1R+AJE5diVvpWhBrYeh+0Ta23VLyyDJuctD20KIK6uGKH
	+ciu+q1FvhFe4rFg0cWrtjC+vZPGUACO+g99PY+1NXSxE0woZsy7I+mUnsSgBQMeDPaIRvExp3s
	tjbzeJ//DFX1H6YFWcletgfavYtQ7sg52MxA6urMK9J5/2RGxCn/IHpvgaf03O8ZhbNMW+AL6UG
	JdJBa1spsxIdJ2hi0nUojFGjn/aurGJtkX/d+C2TbPbqRyPT97qV
X-Received: by 2002:a05:6402:42d4:b0:5d9:a54:f8b4 with SMTP id 4fb4d7f45d1cf-5dc5efbf5bamr2757084a12.11.1738152669153;
        Wed, 29 Jan 2025 04:11:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWwGofFlveJZZ8Y8RCQ261keTvS+w2IGgafzQLJiEPoI+LUqDstLACEsFV9aVwDeaatRYmZg==
X-Received: by 2002:a05:6402:42d4:b0:5d9:a54:f8b4 with SMTP id 4fb4d7f45d1cf-5dc5efbf5bamr2757022a12.11.1738152668668;
        Wed, 29 Jan 2025 04:11:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc1863978asm8680072a12.33.2025.01.29.04.11.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 04:11:06 -0800 (PST)
Message-ID: <38896dfc-b5d9-4efd-8aff-bbe8cdb47c6e@redhat.com>
Date: Wed, 29 Jan 2025 13:11:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv2 01/13] genirq/msi: Store the IOMMU IOVA directly in
 msi_desc instead of iommu_cookie
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
 <671b2128c193fc9ac9af0f4add96f85a785f513a.1736550979.git.nicolinc@nvidia.com>
 <1b48e138-3134-442a-9796-e3a33b106221@redhat.com>
 <20250123184855.GU5556@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250123184855.GU5556@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k3avb9PY4t-3-zAI8fBdoHPaLpTfoDOapnDN8AbHE7c_1738152669
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_041115_264952_02E87213 
X-CRM114-Status: GOOD (  22.45  )
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

Hi,


On 1/23/25 7:48 PM, Jason Gunthorpe wrote:
> On Thu, Jan 23, 2025 at 06:10:48PM +0100, Eric Auger wrote:
>
>>> However iommufd now permits the domain to change while the driver is
>>> probed and VFIO userspace can create races with IRQ changes calling
>>> iommu_dma_prepare/compose_msi_msg() and changing/freeing the iommu_domain.
>> and is it safe in iommu_dma_prepare_msi()?
> iommu_dma_prepare_msi() takes the group mutex:
>
> int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr)
> {
> 	struct device *dev = msi_desc_to_dev(desc);
> 	struct iommu_group *group = dev->iommu_group;
>
> 	mutex_lock(&group->mutex);
> 	if (group->domain && group->domain->sw_msi)
> 		ret = group->domain->sw_msi(group->domain, desc, msi_addr);
>
> Which prevents changing domain attachments during execution.
>
> For iommufd, if the domain attachment changes immediately after
> iommu_dma_prepare_msi() unlocks, then the information given to
> msi_desc_set_iommu_msi_iova() is still valid on the new domain.
>
> This is because the iommufd implementation of sw_msi keeps the same
> IOVA for the same ITS page globally across all domains. Any racing
> change of domain will attach a new domain with the right ITS IOVA
> already mapped and populated.
> It is why this series stops using the domain pointer as a cookie
> inside the msi_desc, immediately after the group->mutex is unlocked
> a new domain can be attached and the old domain can be freed, which
> would UAF the domain pointer in the cookie.
OK thank you for the clarification
>
>>> diff --git a/include/linux/msi.h b/include/linux/msi.h
>>> index b10093c4d00e..d442b4a69d56 100644
>>> --- a/include/linux/msi.h
>>> +++ b/include/linux/msi.h
>>> @@ -184,7 +184,8 @@ struct msi_desc {
>>>  	struct msi_msg			msg;
>>>  	struct irq_affinity_desc	*affinity;
>>>  #ifdef CONFIG_IRQ_MSI_IOMMU
>>> -	const void			*iommu_cookie;
>> you may add kernel doc comments above
> I wondered if internal stuff was not being documented as the old
> iommu_cookie didn't have a comment..
>
> But sure:
>
>  * @iommu_msi_iova: Optional IOVA from the IOMMU to overide the msi_addr.
>  *                  Only used if iommu_msi_page_shift != 0
>  * @iommu_msi_page_shift: Indicates how many bits of the original address
>  *                        should be preserved when using iommu_msi_iova.
Sounds good

Eric
>
> Jason
>


