Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D9CC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 17:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7C39AcP479z7PaOLmWGBMx2cDdXkmF+MZl53H1pFh10=; b=oz6GGf6ngTXl1P
	fvCwQwWm4r5+mNYRbSzOl0BU5upVaAJCG5M9K+kW2zUAvm66AQfXqELzoOHuQJxzimNc8HSpWcVH0
	wC/gp7+UYPRgxgq9i6RCfhfDTg8uYo6BQTdY90cGYmhQp3Sf3UyKadcVWlapUpqmP7mrUqa/6/moV
	yzC5JFvmhV00C6+DHhbU0Dp1z6/rwFoXC8TCXAPAKF5HdP6IVwesUATIIa1J8PW3KcXfT6Kbz/blk
	P42LkfwhF3C8S9nEwLSiz0t9h6A0WfpmkR8pSLp/qgkxm98AmgHCdV/yAn3PEROZLw1tWT44ayFhW
	U6OeXq2P5Ox2bmbIgwjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdCBW-00000007Xgz-1vjr;
	Wed, 29 Jan 2025 17:49:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdC93-00000007XLD-3N9t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 17:46:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738172789;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7C39AcP479z7PaOLmWGBMx2cDdXkmF+MZl53H1pFh10=;
	b=SX8/TJhHwQRfR7GL/OUT0NYL3KbB/YPM0S1gJiUm6QAPML0prCzp0Vpv/CIXM+nTS1UwjF
	f/OTU9nphyopGi7lur+B5L1UDbnEpDoR6lNuKNfAL2SpvTsCsb0NPWCXEuy6DtpF3tZtG3
	/2/O9MQ5JwlaWm/BKR2bo+BVEr2C13U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-9bVlQRacPB2ec15O-BLabw-1; Wed, 29 Jan 2025 12:46:26 -0500
X-MC-Unique: 9bVlQRacPB2ec15O-BLabw-1
X-Mimecast-MFC-AGG-ID: 9bVlQRacPB2ec15O-BLabw
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4388eee7073so4865455e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 09:46:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738172785; x=1738777585;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7C39AcP479z7PaOLmWGBMx2cDdXkmF+MZl53H1pFh10=;
        b=xTYTykvfT9xpbM6A0lhaXrxv3LXyNpWGzPil/2W1W3u0SCgRT/HArroguNf2c2sTBR
         XeQ0I9+BcMl9ndWLhLKe9OuHl5CEKMqaJuVb9Z8Ao9SuT2zkKk/YQqjTWSw7KdiCsfV3
         OpkSrouKQTyHuo6uGyQycGSnof2uj/zMo2pOunZSoeDZDoXI4kxpQKRBTKGPKz6jNdqJ
         JnKrsu4ald55Sz2asJy/C0YmLKUYeFeRfYdXVJ5rOiym8Q8vp7YrMhCQo5s2/o2qngwO
         vwGyUl+ftW6QW7aKgFwvFBgz8rfyiNoRMi82CS9NGU6/qjVjWpapQ0PjDSlsHFmLZ23O
         nqnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkJ7JIHuQ3+72AGBo+vHwoADW3TOCUgB2yt5l58pJivQGMf2AlRMEE20cLe4whxk+Ijemq1wClqcxRfxS0PoGG@lists.infradead.org
X-Gm-Message-State: AOJu0YxLsWjXhyai11aY/e+XJuPXIH8IwMdQeaBAHI3wdF7UdONlRRq4
	lKpo579YoZb9wz0ugX+hmZZNsyFOBlyowsifTLcctddOpHIKp8L2czq5ZEpyGSkwaMxnSM2gitS
	3aYMWPOYywUse1K9H/+3e4cYxF5d6RfWXRs+LniXG2EFRUYf7tilM4B+r2EXUZPE0BNRgKNmK
X-Gm-Gg: ASbGncvXp98nq3MR76EcL+a+8JZ09vm4RSmzOkx8BDWI8tR8lSk/DvSzWL3H7fUr8LG
	CiOPYjz91O353IE3wr9VR2GYtybcvuflS3b/WnknAMlkHWfFunKbXLlr+H+Q2vk2bLnVBd/MuP3
	O+EAlcAkUZh43CFjr9GVLYvuxntpdF/89RgCBHA0/tw4onNhum7/p1BhF1Pf/EVsUtY4d6oUqNz
	kIUtn4EfF/Qh703xE79GwAfl8Hmp6mkY/VJnJTnKVGnDlM/fO4K8ceTtSijK/9EiLywyTFVxLlX
	Il5+90WrTh0L8WWMd+7W5tjj8yerUyB3+7Qw4+Nm07AQiCIIx+SG
X-Received: by 2002:a05:600c:6555:b0:436:fdac:26eb with SMTP id 5b1f17b1804b1-438e15e7fdamr1934825e9.7.1738172785113;
        Wed, 29 Jan 2025 09:46:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQmQmuNWdwXKR1WA8YUMR0neWSl2UDPcJoTIpWOkS9ogRoZv55tiuXIIRNpwuKJUpW+TAzXQ==
X-Received: by 2002:a05:600c:6555:b0:436:fdac:26eb with SMTP id 5b1f17b1804b1-438e15e7fdamr1934415e9.7.1738172784724;
        Wed, 29 Jan 2025 09:46:24 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc13151sm30025435e9.1.2025.01.29.09.46.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 09:46:22 -0800 (PST)
Message-ID: <8e4c21b5-3b79-4f0b-b920-59b825c2fb81@redhat.com>
Date: Wed, 29 Jan 2025 18:46:20 +0100
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
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250129150454.GH5556@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NPqq6BdzY79JNpefZMcfcn4cLwc6GHqOq0GB6Tq1v9I_1738172785
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_094633_920567_2C331E63 
X-CRM114-Status: GOOD (  22.96  )
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




On 1/29/25 4:04 PM, Jason Gunthorpe wrote:
> On Wed, Jan 29, 2025 at 03:54:48PM +0100, Eric Auger wrote:
>>>> or you are just mentioning it here because
>>>> it is still possible to make use of that. I think from previous discussions the
>>>> argument was to adopt a more dedicated MSI pass-through model which I
>>>> think is  approach-2 here.  
>>> The basic flow of the pass through model is shown in the last two
>>> patches, it is not fully complete but is testable. It assumes a single
>>> ITS page. The VM would use IOMMU_OPTION_SW_MSI_START/SIZE to put the
>>> ITS page at the correct S2 location and then describe it in the ACPI
>>> as an ITS page not a RMR.
>> This is a nice to have feature but not mandated in the first place,
>> is it?
> Not mandated. It just sort of happens because of the design. IMHO
> nothing should use it because there is no way for userspace to
> discover how many ITS pages there may be.
>
>>> This missing peice is cleaning up the ITS mapping to allow for
>>> multiple ITS pages. I've imagined that kvm would someone give iommufd
>>> a FD that holds the specific ITS pages instead of the
>>> IOMMU_OPTION_SW_MSI_START/SIZE flow.
>> That's what I don't get: at the moment you only pass the gIOVA. With
>> technique 2, how can you build the nested mapping, ie.
>>
>>          S1           S2
>> gIOVA    ->    gDB    ->    hDB
>>
>> without passing the full gIOVA/gDB S1 mapping to the host?
> The nested S2 mapping is already setup before the VM boots:
>
>  - The VMM puts the ITS page (hDB) into the S2 at a fixed address (gDB)
Ah OK. Your gDB has nothing to do with the actual S1 guest gDB, right?
It is computed in iommufd_sw_msi_get_map() from the sw_msi_start pool.
Is that correct? In
https://lore.kernel.org/all/20210411111228.14386-9-eric.auger@redhat.com/
I was passing both the gIOVA and the "true" gDB Eric
>  - The ACPI tells the VM that the GIC has an ITS page at the S2's
>    address (hDB)
>  - The VM sets up its S1 with a gIOVA that points to the S2's ITS 
>    page (gDB). The S2 already has gDB -> hDB.
>  - The VMM traps the gIOVA write to the MSI-X table. Both the S1 and
>    S2 are populated at this moment.
>
> If you have multiple ITS pages then the ACPI has to tell the guest GIC
> about them, what their gDB address is, and what devices use which ITS.
>
> Jason
>


