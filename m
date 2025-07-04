Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EABC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 14:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nt7xUyaSY2bwlKzrDx5dkOnSZrDMwc3BRrdM7IQmPSg=; b=qgb+suWz12cdLXbMUgYKpIbauW
	txOmrJ021JY066npEvjfi+Vvsd/qQJzg0Mu2mcjMldGx51ZTXQEXFmzO+mFIcqSXOJAqxSadwwpQt
	zac3breGyFsLEmsdGP1fcFOx0xi4kNwXxbPBhIv6pVWaxQACB4XtLWmA7l9mvHJSKenhi3ABXjZCe
	lPfp+OxWcfgxe4751BVUCA4vWR+qXz0VnlEnahZxNz1y90FlzQQA3PDO/qrgSdrMgRfVYuavZLTES
	6w18D0RlT3Q5CqxldvpuLdMP+M9YCpz1rbfyjCdCOJJxg//Fdz2MggZKGuRA8+fvOhGvZhT8pnSmz
	bdY1+29A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhMV-0000000EfWw-14bp;
	Fri, 04 Jul 2025 14:25:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXh6b-0000000EccJ-1vKe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 14:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751638172;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=nt7xUyaSY2bwlKzrDx5dkOnSZrDMwc3BRrdM7IQmPSg=;
	b=ARyHvwE5G5jkmUhq7NoiJgjNdYWz8tVOKtrRiLqu+O2gZqshRgztgAK0eFXNT7+7N1QxnS
	Z6Q+lHEbI+QcVWjqp3DwoB0HsoP0i4fXXihLWjzLbAGtytXRmjuab5RzuLsoR0XF6k406x
	sJ84h3mZvyt1+rUotzoXErfNtWu6ubI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-GQ5aiXDzNUyq14kjDjOrKQ-1; Fri, 04 Jul 2025 10:09:31 -0400
X-MC-Unique: GQ5aiXDzNUyq14kjDjOrKQ-1
X-Mimecast-MFC-AGG-ID: GQ5aiXDzNUyq14kjDjOrKQ_1751638171
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4f6ba526eso663585f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 07:09:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751638170; x=1752242970;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nt7xUyaSY2bwlKzrDx5dkOnSZrDMwc3BRrdM7IQmPSg=;
        b=PncWjd46Tz9P/GTIz2oeO76lZdqMzdeVBz4GJgImdCvdgI+vcm+HpxL0sJCB5ZbTUW
         c40+axf9Tykhs2NZ7ELPJSkgcZF8BLm74viwM+TJNt3ahHsB5ge91jy/bsMK5yvgZkIv
         moLQWv9R+ff4es9iQhFBRc6NjNZnLCIR2caPoau5w0E/9o7jalOrOpHsX1ZoH3skvIat
         /tjkRDZHL4TQNO/9ZLHHS6wON30uHo8cPOmHdURJ+ABzl7x8SkvryE3tbvazcGPYZPek
         zG2OzCKbKKXf7nzEQwH0bBCI7JZAM9QF7L/fYEk5p+XjxKyghXK1hs1I87cWEznIbcTK
         WCXg==
X-Forwarded-Encrypted: i=1; AJvYcCX0Wx3hZ9WskkZd32z08iYTResKL39zTmaw8k+d0lG7dchveWqJJ+/ym+wgyxBTgclWk2roq3iMd60pMr9KVeAU@lists.infradead.org
X-Gm-Message-State: AOJu0YyAyxuj2SLPuVaZ4kRsPRt5U7kfRlLAGOaNF8QR6I35MDugBX3W
	EvzghM9wUreokBOyDgvPwHQ+vkDIaJXrasy9P3tvyPbnnEzZaAFdUUxJXWurPsrLvYuMl0Hv5Jt
	u/Pw6ugynRIMIt7b8X88msKD0mVjQyX0USDDcgxPuTtsJx9LwPhusxFRW+fsHeXdtYiSpRUqNJo
	e7
X-Gm-Gg: ASbGncs3Ekt/JZixEcCSSxG4CfQVdDzq2YbKTZtfUz4/XLJIWBgGESONaC3WyEp4zS6
	ikRRDNqZuXSmn+iUa8yJ04rl1I3PBdG7wZrGPih0SzpoQ3ND8/dfPRIa5mUup2TyU5CCbkra2uo
	V5E+evo9iPJ2H5fCjubQGAqQiwLoquR7AMRahnweOyvHNhR0ckrA8GDF07iQWJjnq8ejwDgHFHg
	EqOdTkXyAC8/T5Z0V14K04xRcUvtqcZe9gP8kE1UZxyjlgy5283yf6zgB1qoQXdGkTnNiDc9Wg3
	uUJXaSmb+daS0iYkdahIzcsF09LjauWeXzVC3fhNE21+4TGBDzi4xQDzhDW/gnNiEpAtV9YdvBC
	Piy8ZMwr9lgpmnBhCR6JEDcatbVdjc03fALpfeaoG3ic9UfQ=
X-Received: by 2002:a5d:584c:0:b0:3a4:e68e:d33c with SMTP id ffacd0b85a97d-3b49661da3fmr2465457f8f.47.1751638169904;
        Fri, 04 Jul 2025 07:09:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyZaHm3cvEEMqssF8essbFIJLOElulWn/9VcRsQbLa7wt2W+gUgffDY85V2Xx5K0zPawIpyw==
X-Received: by 2002:a5d:584c:0:b0:3a4:e68e:d33c with SMTP id ffacd0b85a97d-3b49661da3fmr2465397f8f.47.1751638169344;
        Fri, 04 Jul 2025 07:09:29 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2c:5500:988:23f9:faa0:7232? (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b16865c2sm27363175e9.19.2025.07.04.07.09.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 07:09:28 -0700 (PDT)
Message-ID: <9c45c671-9330-493f-9a8b-2c08062ea0f9@redhat.com>
Date: Fri, 4 Jul 2025 16:09:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/6] KVM: arm64: Block cacheable PFNMAP mapping
To: ankita@nvidia.com, jgg@nvidia.com, maz@kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
 ryan.roberts@arm.com, shahuang@redhat.com, lpieralisi@kernel.org,
 ddutile@redhat.com, seanjc@google.com
Cc: aniketa@nvidia.com, cjia@nvidia.com, kwankhede@nvidia.com,
 kjaju@nvidia.com, targupta@nvidia.com, vsethi@nvidia.com,
 acurrid@nvidia.com, apopple@nvidia.com, jhubbard@nvidia.com,
 danw@nvidia.com, zhiw@nvidia.com, mochs@nvidia.com, udhoke@nvidia.com,
 dnigam@nvidia.com, alex.williamson@redhat.com, sebastianene@google.com,
 coltonlewis@google.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 ardb@kernel.org, akpm@linux-foundation.org, gshan@redhat.com,
 linux-mm@kvack.org, tabba@google.com, qperret@google.com,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, maobibo@loongson.cn
References: <20250621042111.3992-1-ankita@nvidia.com>
 <20250621042111.3992-4-ankita@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250621042111.3992-4-ankita@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GpCoTYoDkOw7dNVmuCaPu_NAq2f8EAjynUb5PfZhaQ0_1751638171
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_070933_576207_64D14755 
X-CRM114-Status: GOOD (  10.30  )
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

On 21.06.25 06:21, ankita@nvidia.com wrote:
> From: Ankit Agrawal <ankita@nvidia.com>
> 
> Fixes a security bug due to mismatched attributes between S1 and
> S2 mapping.
> 
> Currently, it is possible for a region to be cacheable in the userspace
> VMA, but mapped non cached in S2. This creates a potential issue where
> the VMM may sanitize cacheable memory across VMs using cacheable stores,
> ensuring it is zeroed. However, if KVM subsequently assigns this memory
> to a VM as uncached, the VM could end up accessing stale, non-zeroed data
> from a previous VM, leading to unintended data exposure. This is a security
> risk.
> 
> Block such mismatch attributes case by returning EINVAL when userspace
> try to map PFNMAP cacheable. Only allow NORMAL_NC and DEVICE_*.
> 
> CC: Oliver Upton <oliver.upton@linux.dev>
> CC: Catalin Marinas <catalin.marinas@arm.com>
> CC: Sean Christopherson <seanjc@google.com>
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


