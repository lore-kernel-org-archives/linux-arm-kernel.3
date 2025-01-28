Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96DD6C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 06:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZfRypJrBXY8TUZ/BgiawVGat4WmGQVQwJaXYpw4b6P4=; b=2K1zTsGkciSi3I2+y0Esbfs8qW
	hSHE89KLcg7JfQJ6JKzPbF/vB4DjQCz2CDXCvfBazjHgDX9aMNVkEmfuYlaL0CSajrhyNhU4XDkYv
	pjw/Ahm59KbWbEj9tA7QAb2pcFNsj7s6/iHkD0DNB4wKvgIVHGgwLnVlg6vXjaGTw4EaEqlW9dHPM
	5wLHJtJRn/KUJHdipZcfnC6p/zaZfS619P9vqNAgr8UYAhL+LfJqJG6I8riCYYqYZ1TwSXTZG/ru6
	RhsPYCXoNxad9UtmxG4ctgVjJQuTbL+o99rQ8Bre3iGkptOnv0P01wP3e3+NN6f1bTGGoN2atxwjk
	sxhH33/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcfQw-00000004FaH-0T6z;
	Tue, 28 Jan 2025 06:50:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tceRR-00000004BEK-36q6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 05:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738043235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZfRypJrBXY8TUZ/BgiawVGat4WmGQVQwJaXYpw4b6P4=;
	b=h1pp2J5oV2LbLUQ7u8/l/cLg3V7VyVHldNy1UOoiBvQw4rUWk+QfAnDCoozwnZTmM3neUJ
	Q1o1F2U0QySw6yOEqbY2o5NbhlC0e771yUUJuQaXSLD2yT95tfFvIa8bJy0XND+N0pyiMY
	1vseXGZDeyw80Zogrgmc61yJvqHJpdM=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-pc3wUzyTMX2Xf072cQ4XKg-1; Tue, 28 Jan 2025 00:47:13 -0500
X-MC-Unique: pc3wUzyTMX2Xf072cQ4XKg-1
X-Mimecast-MFC-AGG-ID: pc3wUzyTMX2Xf072cQ4XKg
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2163dc0f689so155303455ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jan 2025 21:47:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738043232; x=1738648032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZfRypJrBXY8TUZ/BgiawVGat4WmGQVQwJaXYpw4b6P4=;
        b=oodSeyTk4dheiHyKNIUlQUUNNc5BVc6a4qrKWahzLyXMg1knsdcvn87UkuPuHwiXXx
         0eLLjMWxr/xBMW/UAqIm3RdEpt5es65dnDfl7F7fQkXOKlvgm0WjDZiY6F3NJlq+K1pJ
         y2+MkvbDp5uGMymCl+m4lyp4QRPhOLWszrM2+UKgSVBeMvHzxAVPGjvn1w78tXHyl9ke
         HWQqj58+vFNs7fzouBsQHF+bAkkZIM+oc7AgeU4YANEJRdMuoT6kvPAeqU4CdBECxM/y
         OZxk/OaX0qXPsF/7ZOZUEas4n/1O3vpSokQKx4yYhgxyjxxaNjGIIQzE4g5PO+iPg23m
         tTDA==
X-Forwarded-Encrypted: i=1; AJvYcCWQVDIBWdFOpUExwB3sGiDQ+xdGl0l3m0xowX+zqObiLzbfV+uKGkF4skX+uqz1Jbye45/03w+2nuPVmxGbTiw1@lists.infradead.org
X-Gm-Message-State: AOJu0Yxag1Sxsh7Ca1GhtA0IhcFwIvZI5iUuCiWNm+bYwa8dyWsA53Gg
	B9fiVF59pKv2aRAOucSmHuMDFoOu2z/ivqcYTblslloOQNwDax+AJkuyUrHNwueZJnGS4YQhJZx
	ipcWXZDec+06Hh4KDGFNsO5kDT/Sq6nVSzjqw7q+ahzNhgiND9deq1JnzoA5uNMlu4/2ddbsm
X-Gm-Gg: ASbGnctPpZSiTQ7i3xfVYTcn+4UTwMt2BtRStRqflsluoR8wHI0G9Qb+OX4y5Mq6y0+
	3AK3zKB9/xoyppGT21hCW4sgrDMOWx99aTZlnWIrXsHX0JW0MaukxsB2wU0t1GpvXN9Kn/gKwX8
	rfRb4zWPmf3AT9KrbRmQEKZpEZltExHBRbOmtqRI7PNrvR5rbzgutbIfihIWWyrcnsEq6j9nDDI
	b1mjpF3pheNNuWliKOecMs0C5ihBMAupdjUoinG7SbgjkQRDLQRLlkONHIVyJedTR9AoaS3qlDx
	aQlO7Q==
X-Received: by 2002:a05:6a20:1591:b0:1e6:5323:58c5 with SMTP id adf61e73a8af0-1eb214a06f0mr63365309637.12.1738043232186;
        Mon, 27 Jan 2025 21:47:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGj7WcMyL/2PjgoUCXeF8pDrIwXJ8iDNSOsLtS1l4yE0zK1FCS82DOSLWaxPfSPcfKWvA2L5w==
X-Received: by 2002:a05:6a20:1591:b0:1e6:5323:58c5 with SMTP id adf61e73a8af0-1eb214a06f0mr63365273637.12.1738043231858;
        Mon, 27 Jan 2025 21:47:11 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a69eb81sm8276685b3a.26.2025.01.27.21.47.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 21:47:10 -0800 (PST)
Message-ID: <1032c158-c5a6-4845-affa-f444e0071e5a@redhat.com>
Date: Tue, 28 Jan 2025 15:47:02 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/43] arm64: RME: Check for RME support at KVM init
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-7-steven.price@arm.com> <yq5amsgsrzva.fsf@kernel.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <yq5amsgsrzva.fsf@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PKWdB9gWkCMCu-T_fz1a52zGCnPKuPAcDa8YTFiFE_k_1738043232
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_214717_853216_95C228D8 
X-CRM114-Status: GOOD (  11.88  )
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

On 12/19/24 3:44 PM, Aneesh Kumar K.V wrote:
> Steven Price <steven.price@arm.com> writes:
> 
>> +static int rmi_check_version(void)
>> +{
>> +	struct arm_smccc_res res;
>> +	int version_major, version_minor;
>> +	unsigned long host_version = RMI_ABI_VERSION(RMI_ABI_MAJOR_VERSION,
>> +						     RMI_ABI_MINOR_VERSION);
>> +
>> +	arm_smccc_1_1_invoke(SMC_RMI_VERSION, host_version, &res);
>> +
>> +	if (res.a0 == SMCCC_RET_NOT_SUPPORTED)
>> +		return -ENXIO;
>> +
>> +	version_major = RMI_ABI_VERSION_GET_MAJOR(res.a1);
>> +	version_minor = RMI_ABI_VERSION_GET_MINOR(res.a1);
>> +
>> +	if (res.a0 != RMI_SUCCESS) {
>> +		kvm_err("Unsupported RMI ABI (v%d.%d) we want v%d.%d\n",
>> +			version_major, version_minor,
>> +			RMI_ABI_MAJOR_VERSION,
>> +			RMI_ABI_MINOR_VERSION);
>> +		return -ENXIO;
>> +	}
>> +
>> +	kvm_info("RMI ABI version %d.%d\n", version_major, version_minor);
>> +
>> +	return 0;
>> +}
>> +
> 
> Should we include both high and low version numbers in the kvm_err
> message on error? ie,
> 
> 	high_version_major = RMI_ABI_VERSION_GET_MAJOR(res.a2);
> 	high_version_minor = RMI_ABI_VERSION_GET_MINOR(res.a2);
> 

I think so since a range of supported versions are returned in the failing case.

Besides, 'unsigned short' is more suitable for the local variable version_{major, minor}
since both are 16-bits in width. 'unsigned short' explicitly indicates their
width.

Thanks,
Gavin


