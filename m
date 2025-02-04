Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A44C02194
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 12:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=twPDg30fIiJNLDt2SiVRKkvqJ/64dc+oeH98LcXpjks=; b=NSLx7JTY0FDZSQ
	5SXrxt8kH1fG406QxWKNexnh9uC29WK7zwzMPX0qpd1DlxY5RIktJwogl5KYWLg3PDKaTWBeH6l2V
	NnLNgOIt1T8nSct7as4JVPyRzOpwn34QIuHLuZzcTgbkOcNJTTLicX2vwZ3cbnThIupT4adag91L7
	pfydewwep9+b8xvvwF0D5nPgHsL9/IHdp7arOIk7WmrFI3q765hnX3yWkXNfV3bP2NTotX53LCdjv
	jC7VRlK3JMN5J+6Wv+uVdlsV9Q5d2DzNKJDyRFmKIKHibMMOJIs2p2jyLTvjkyQaHQPUJhopG8g3t
	stvL0Nwehb5EN/TLfdnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfITk-00000000TkN-22zc;
	Tue, 04 Feb 2025 12:56:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfISP-00000000Tdv-1vvy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 12:55:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738673711;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=twPDg30fIiJNLDt2SiVRKkvqJ/64dc+oeH98LcXpjks=;
	b=gQBBbAwGK3Lrsik53QJyxNdghbg2qd0FnEv4Hc/NKVxC6zGCoTMc/aHJghETMFJenA7kCk
	GSwLku7xc+8fKKKZESb3teec9WPtvqCTSO+CaI3fv5PVRd/7RUhn0P8KZnjcUIqAFEuFks
	xy6v2syZSk9rdaXDlDbeqrciXbDDmvE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-HXXMiy-dMimflyx8UHN3Sw-1; Tue, 04 Feb 2025 07:55:10 -0500
X-MC-Unique: HXXMiy-dMimflyx8UHN3Sw-1
X-Mimecast-MFC-AGG-ID: HXXMiy-dMimflyx8UHN3Sw
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d88d56beb7so51607086d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 04:55:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738673709; x=1739278509;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=twPDg30fIiJNLDt2SiVRKkvqJ/64dc+oeH98LcXpjks=;
        b=aNPZoUKhv8A/Z2wABglv+k6hFdrckbxIOjDC+CVWETv8+606XuSHxy8zjeY+DR8O28
         v+eE6RwsZYu+9rgloWXRkDPH/K9YhN370kRkqt7eCEAXeSfRuqPyHo6A3fadc84eZHl5
         5QCvbcYn8mu8AdcYlxw6vIWEH8NyHfL2NCgbbYpgXxXefWKbJ8Q5EthV8I6AV8qxpwEW
         9/AKwqzlNUf7y7oX3zJZGfFPLB7kh4SyxnwDTP5Pl0pCrERKggwLxoTRdoMW+6IT36ik
         17MQQp63xJvji4lbFjzi2qlODRZgR5AdkWRUX8C/+Ed4ib2owEBdWC0VIJtm+4lKg7k5
         Na2g==
X-Forwarded-Encrypted: i=1; AJvYcCV9kRNMFU7gEu8UBTPtOKA0IZvdiBUUyeEQ78GxDgiysF1LUis4T6FllDJg0PSF/co2XncxcFB76/NYBQwjAG1X@lists.infradead.org
X-Gm-Message-State: AOJu0YyfNyzwWkyesISkBhhFQULr0VN8vdm4Yx3ZfQwR82zvW1fHOOjr
	3lQ1CRQsrQlQa6JhPdcVxW/Z+c8EZvntPF3KzAEaU4Hf1XhQFlUJVdh4/xvUFi48otAmLXCUpUV
	GGbB6ISYxGatyqAHdOEkhCgJY69tWnPJ805MxL6+MhbUJ+790Bap2CrcaxnUw2W1kAxYw7wMk
X-Gm-Gg: ASbGnct3mQ6kzD1WalTb2bNELQg9b7LTwK+Mr004zbB5HqbmW/zEwarfEwq+4JfRNS0
	ljoY9rLYqlAlOEgxdp3bh045+dtFduEk0FGTTnsIKoJECJ6yziQ7sZkVZXL+2LUg+BiupOIXWVB
	vSG9lAlnzfN8rpBQn12ySTWuDIu7MgfLw6d+/WtAXa2lmi7wyInDV7EriPO/xxqA2c8lJ5gxZBn
	nawbypsS0uFB1vDaqIx8eJdrHUFO0664G1thwqdv088ztDEwIcIBr58+t+YCWYfyTVVh9lnBe/i
	8PXm0uol2dUuhYL0lxS0Br+AlrnUtZyRkavkmj4nmz1aLxmvWN/3
X-Received: by 2002:a05:6214:1c0b:b0:6d9:2e46:dc35 with SMTP id 6a1803df08f44-6e243bf84c3mr422214506d6.25.1738673709601;
        Tue, 04 Feb 2025 04:55:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1a38N2TZdISEECvq/s7iOToAmmfm3GmVQAMYB+u0Kmi1Pw+6Ta7PfZF01eEC876vzaXAEXA==
X-Received: by 2002:a05:6214:1c0b:b0:6d9:2e46:dc35 with SMTP id 6a1803df08f44-6e243bf84c3mr422214216d6.25.1738673709310;
        Tue, 04 Feb 2025 04:55:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e254814029sm61998046d6.29.2025.02.04.04.55.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 04:55:08 -0800 (PST)
Message-ID: <cb087202-3a64-428c-bba2-196a3612e5ff@redhat.com>
Date: Tue, 4 Feb 2025 13:55:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv2 00/13] iommu: Add MSI mapping support with nested
 SMMU
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Nicolin Chen <nicolinc@nvidia.com>, "will@kernel.org" <will@kernel.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "maz@kernel.org"
 <maz@kernel.org>, "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "joro@8bytes.org" <joro@8bytes.org>, "shuah@kernel.org" <shuah@kernel.org>,
 "reinette.chatre@intel.com" <reinette.chatre@intel.com>,
 "yebin (H)" <yebin10@huawei.com>,
 "apatel@ventanamicro.com" <apatel@ventanamicro.com>,
 "shivamurthy.shastri@linutronix.de" <shivamurthy.shastri@linutronix.de>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "anna-maria@linutronix.de" <anna-maria@linutronix.de>,
 "yury.norov@gmail.com" <yury.norov@gmail.com>,
 "nipun.gupta@amd.com" <nipun.gupta@amd.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "patches@lists.linux.dev" <patches@lists.linux.dev>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "mdf@kernel.org" <mdf@kernel.org>, "mshavit@google.com"
 <mshavit@google.com>, "smostafa@google.com" <smostafa@google.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>
References: <cover.1736550979.git.nicolinc@nvidia.com>
 <4946ea266bdc4b1e8796dee1b228bd8f@huawei.com>
 <20250123132432.GJ5556@nvidia.com>
 <de6b9dc1-dedd-4a3d-9db7-cb4b8e281697@redhat.com>
 <20250129150454.GH5556@nvidia.com>
 <8e4c21b5-3b79-4f0b-b920-59b825c2fb81@redhat.com>
 <20250129201307.GJ5556@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250129201307.GJ5556@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: agzChS_9syB9zpCRWWMCvj8XVxWaaIOgXz2zqGk-l3Q_1738673709
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_045513_575674_72A17233 
X-CRM114-Status: GOOD (  25.02  )
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


On 1/29/25 9:13 PM, Jason Gunthorpe wrote:
> On Wed, Jan 29, 2025 at 06:46:20PM +0100, Eric Auger wrote:
>>>>> This missing peice is cleaning up the ITS mapping to allow for
>>>>> multiple ITS pages. I've imagined that kvm would someone give iommufd
>>>>> a FD that holds the specific ITS pages instead of the
>>>>> IOMMU_OPTION_SW_MSI_START/SIZE flow.
>>>> That's what I don't get: at the moment you only pass the gIOVA. With
>>>> technique 2, how can you build the nested mapping, ie.
>>>>
>>>>          S1           S2
>>>> gIOVA    ->    gDB    ->    hDB
>>>>
>>>> without passing the full gIOVA/gDB S1 mapping to the host?
>>> The nested S2 mapping is already setup before the VM boots:
>>>
>>>  - The VMM puts the ITS page (hDB) into the S2 at a fixed address (gDB)
>> Ah OK. Your gDB has nothing to do with the actual S1 guest gDB,
>> right?
> I'm not totally sure what you mean by gDB? The above diagram suggests
> it is the ITS page address in the S2? Ie the guest physical address of
> the ITS.
Yes this is what I meant, ie. the guest ITS doorbell GPA
>
> Within the VM, when it goes to call iommu_dma_prepare_msi(), it will
> provide the gDB adress as the phys_addr_t msi_addr.
>
> This happens because the GIC driver will have been informed of the ITS
> page at the gDB address, and it will use
> iommu_dma_prepare_msi(). Exactly the same as bare metal.

understood this is the standard MSI binding scheme.
>
>> It is computed in iommufd_sw_msi_get_map() from the sw_msi_start pool.
>> Is that correct?
> Yes, for a single ITS page it will reliably be put at sw_msi_start.
> Since the VMM can provide sw_msi_start through the OPTION, the VMM can
> place the ITS page where it wants and then program the ACPI to tell
> the VM to call iommu_dma_prepare_msi(). (don't use this flow, it
> doesn't work for multi ITS, for testing only)
OK so you need to set host sw_msi_start to the guest doorbell GPA which
is currently set, in qemu, at
GITS_TRANSLATER 0x08080000 + 0x10000

In my original integration, I passed pairs of S1 gIOVA/gDB used by the
guest and this gDB was directly reused for mapping hDB.

I think I get it now.

Eric
>
>> https://lore.kernel.org/all/20210411111228.14386-9-eric.auger@redhat.com/
>> I was passing both the gIOVA and the "true" gDB Eric
> If I understand this right, it still had the hypervisor dynamically
> setting up the S2, here it is pre-set and static?
>
> Jason
>


