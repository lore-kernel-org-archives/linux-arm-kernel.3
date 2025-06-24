Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CEBEC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 09:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jdlbyzwhOvR0TOSckRhTiUQnf05D9iDWTr7qMjHW2U=; b=VCOSeey6sPN6RZ/NvhI4pO+pMa
	XvQstRalJtZv3t7yMn7+fuaPRP9ZauibIKie76hjcmc5qi1S7FkCpm1KLaHXL22NZZRQitPEdZk/f
	84uP/pGUfpSS5MPexlf0fHrb8Bq0j8z+ZiXMks8Lo3JUZ6wuV9I+PUfEO0zeoBqOBCtZ0J33a5WVx
	/6yqZCohi/Bo+Qtj81hazKHF2FgIz1m8ADX2UfHkCcqbcruEhq2tcdBzQokf+3l3KeykoCWVqXNwV
	cD8+y/NcN4b/jcp6cdHYyfqYWwqRMtMyRBdJlRvtptHjbaB530eVc6ZPYE22tO+XOyAQbXqzxxrkT
	AFnxB9ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzrz-00000005ApH-2qe2;
	Tue, 24 Jun 2025 09:23:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTzpC-00000005A4R-1JfK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 09:20:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750756817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0jdlbyzwhOvR0TOSckRhTiUQnf05D9iDWTr7qMjHW2U=;
	b=KujFx520bgx1ysu3Oxs6FYplQENSPZubbzZt3G3/03ldtZPtxvAzN+4GHoyjh1PCH5TGPc
	D3TXmGnbHUprdRcR44P57UJP/hxbPz+tR83OJjoWJ73lUP8DC2ugN0sQ9hRvcI8nwBs+oZ
	3UhOfYbSifmkCjP5yy6Ay+Mmxj6QfE4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-7JCkuKyGOXiJ-R3e6V0r_w-1; Tue, 24 Jun 2025 05:20:14 -0400
X-MC-Unique: 7JCkuKyGOXiJ-R3e6V0r_w-1
X-Mimecast-MFC-AGG-ID: 7JCkuKyGOXiJ-R3e6V0r_w_1750756814
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a6df0c67a6so1683995f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 02:20:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750756813; x=1751361613;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0jdlbyzwhOvR0TOSckRhTiUQnf05D9iDWTr7qMjHW2U=;
        b=vWrPQNVRsP+IuSUWZ4QfwlZruOvmYyKFR7m5tpyYyHMYzCF8z8KlveGlbbkq64v1IT
         4V8pE25UJJS/C2FJja+p7NqMSlTD5iLH4Ij1gBRKxbhWi5WeT3mTQ1BZNpEvfHaH2kAL
         /eXz6CiKUeAEFVK/EFtZS2CaqMjeYqjZ0Kie15gqgTROOuDy4oMPu9Cuyw3fXF/tqgTE
         4Q7h1rCB4C1IUcKCGN2MZVzPx//OSOdAv64VCAZ8MObceDK2r5u2YsP+vG4C59MmR/tA
         ZlMWt1GWg7B1GBrlPy+tTgbQap+jOkLLzC0P1nNVzELufXd69ajseRqshmWVeqBGPr4Q
         axIg==
X-Forwarded-Encrypted: i=1; AJvYcCVBKh44JJz8IoTrEtrBsQ2UZxpYqcZYpajqJ2NAGTRZYPevjX981P56oj9xXE2T6USc++uzJqnlMCmMVL7qXBNw@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2q8he/JR2beEtU9azzRnIWPJGpMT+Lz5ids8oevVbpJvjJqox
	oQabZIDKmLfvzmR7Hq8reIqqkrb8Vd9reCIBEvFiIRK0oEvm6Gv1ZXf+V/yNYlXT41DVLoY9EPq
	9Q03wyZ43udUpcv420tM2PQW5D3lz6E0dS8/b7ehNsnINGDldjnC71M8e4xvcY7er+8mcQ85S13
	JK
X-Gm-Gg: ASbGnctpplSpPCPSB2Q3EohO7FT6lgVjOVLcPsfmzPE4iixUszXC7F6r5xKKw8VU0A4
	wPzOjBIBfpDdZZHqHFS6nmleE2jsOSYSP0MMFdOFPVh/akW/nD8LHu1NH/cHo/cOVB9SxT5p20E
	RLxhrMNm7iN27wxFiIKWyrb26DzKYaJYxH4oAwpn4bruW/XF0WfFWX37b4vs9aJguLkWMeMyOgE
	ALMG4Qin6YyaLV1JBS/J979AjOyZG2Emp7N7GJqdb1qSDqlgeOy1Y3Lm3KSyUGGAUJayCfyZIqj
	Z1QbCo4u7quP6mAl+1lQ7L3fQlLqFQwLp94MtZ3AewdJ01IhnPJeQ8sNU+/aQ5yJ
X-Received: by 2002:a5d:5846:0:b0:3a4:e6e6:a026 with SMTP id ffacd0b85a97d-3a6d131708fmr13847246f8f.28.1750756813567;
        Tue, 24 Jun 2025 02:20:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG90ssd/Q7UJyYLoQ/soeF+R1DyWoiSsSC9z7zTe1BY8pnooxTi/4aCxQxIMA8YQroBd4jqAA==
X-Received: by 2002:a5d:5846:0:b0:3a4:e6e6:a026 with SMTP id ffacd0b85a97d-3a6d131708fmr13847222f8f.28.1750756813145;
        Tue, 24 Jun 2025 02:20:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e810b140sm1417562f8f.80.2025.06.24.02.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 02:20:12 -0700 (PDT)
Message-ID: <55346a73-d20e-494a-a287-6874216457c8@redhat.com>
Date: Tue, 24 Jun 2025 11:20:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KVM: arm64: vgic-its: Return -ENXIO to invalid
 KVM_DEV_ARM_VGIC_GRP_CTRL attrs
To: David Woodhouse <dwmw2@infradead.org>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Jing Zhang <jingzhangos@google.com>,
 Kunkun Jiang <jiangkunkun@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sebastian Ott <sebott@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 Keisuke Nishimura <keisuke.nishimura@inria.fr>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <bbbddd56135399baf699bc46ffb6e7f08d9f8c9f.camel@infradead.org>
 <5e22442e-ddf8-4f5d-b7e4-5e2c9bf783b0@redhat.com>
 <0f86df0c2866114898da1e9f4274e23b3d1c38b4.camel@infradead.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <0f86df0c2866114898da1e9f4274e23b3d1c38b4.camel@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 85UB9ngFwl3TceXT-e_Kt9HCPDrrASpewLCFN6wgE10_1750756814
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_022018_421997_B5D4B9E5 
X-CRM114-Status: GOOD (  18.65  )
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

Hi David,

On 6/24/25 11:01 AM, David Woodhouse wrote:
> On Tue, 2025-06-24 at 09:25 +0200, Eric Auger wrote:
>> Hi David,
>>
>> On 6/23/25 3:22 PM, David Woodhouse wrote:
>>> From: David Woodhouse <dwmw@amazon.co.uk>
>>>
>>> A preliminary version of a hack to invoke unmap_all_vpes() from an ioctl
>>> didn't work very well. We eventually determined this was because we were
>>> invoking it on the wrong file descriptor, but not getting an error.
>>>
>>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>>
>> In the corresponding doc (virt/kvm/devices/arm-vgic-its.rst)
>> it is said about possible returned values:
>>      -ENXIO  ITS not properly configured as required prior to setting
>>              this attribute
>> which does not exactly match your situation. Shouldn't we also update
>> the doc or change the returned value?
> 
> Hi Eric, thanks for looking at this.
> 
> I think this is OK because the -ENXIO return is covered by the high-
> level description of KVM_[GS]ET_DEVICE_ATTR in virt/kvm/api.rst:
> 
> Errors:
> 
>   =====   =============================================================
>   ENXIO   The group or attribute is unknown/unsupported for this device
>           or hardware support is missing.
> 

Ah OK I missed that. Anyway that's not a big deal I think.

Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric



