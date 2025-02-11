Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F56FC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 13:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fl8OSnLCA195UnsHqHADtSdhh5YuMF6KeCEzc0u9BFU=; b=1SAcL0N4x8WyFInZguzvAUrvuG
	TzzlVajW8Q0oBGDzKo3anZwto08le0SBKEs29UW3JBLiuo+uXJuhYZEVBg9Th5kmzGLRRLz/Cq+SZ
	g+2AFbFuwUBrhFufQHEuOaw3kgVJpBWh0dM1K07anF+HQ14I7sYVK27DEfmVbctbwMguiWAZGqhko
	h2D3dYnbeAjkdB/v48am6WOOPAqKJTdIdFTs91OhfQOYrPsNPAr8hadnEQQ6AnBvdLUPNexd75u0e
	omulXvvmRqjhUqvKgUyDBzI0MqAtGsvJYtq4IfLcAQM2BcVb+NqaAjKNuXkSODQO8a5V3ojpGEZiF
	pQ0oTGZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thq1N-00000003tOn-2zbi;
	Tue, 11 Feb 2025 13:09:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thpbo-00000003ocg-31KX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 12:43:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739277803;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fl8OSnLCA195UnsHqHADtSdhh5YuMF6KeCEzc0u9BFU=;
	b=Q7mq1vEktqkfvEQecyoD8nS0KH4UBeuR86G2L8jiGC78yi73eKH1LDYpf2kUupl8B3XrmN
	eoc9hQIKYlZAEYCE3TdPs/xEBDzvUJVT2rAZyzQtrwCI5Sp5AgKNmCbWRZlEvvDAUdBfWA
	hbLl/ikcmiwDx6mgCmV0wflpyZ66Mo4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-7kN3YuwoMUua6HGipmVMPA-1; Tue, 11 Feb 2025 07:43:21 -0500
X-MC-Unique: 7kN3YuwoMUua6HGipmVMPA-1
X-Mimecast-MFC-AGG-ID: 7kN3YuwoMUua6HGipmVMPA
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4394040fea1so12193925e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 04:43:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739277800; x=1739882600;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fl8OSnLCA195UnsHqHADtSdhh5YuMF6KeCEzc0u9BFU=;
        b=woZstt6N9WwBL+jAgDjtQRGJ2RHoRPAwCEc6lrj5cSCrrA60TxFxineBMMG5KCa0OU
         l6WRdR4SigApZq24UCw9HD/62LkNivz4HFWaC2G6xCL0ziAFvP6x53DzXHPiDaGYGpnV
         W83TewfaEnX0zmUlefbHF6fzeXipglwQpU6LD+aW8nxOcU3SSo90NP25whrYfH7CLdGJ
         Uk7x1kWVahbQoDLOZXhXKOwVKLJP3j5ogV+QdhytAOmIQXWlVnCehzZ1lC2z/hi++GM+
         ehg7JJbOHm1MNGITZMoTFNIv9S8kf2iM7ytOYIOf7A2IjxzQUaGASf4XtVy47RP00QTo
         TudQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQwzuOvaioS2+a/cmsruKPbazpyRzEv3medqJJAy8ypVwxY78d16A8SLDrSLvfjAcb5If4zrWQfjxn3/1vsTd3@lists.infradead.org
X-Gm-Message-State: AOJu0YzD2pmQU8cAFtxD7SAGYLQbFTVkSxTfU+8y+Z7dcBMbmsoVy0l1
	UUhfq0HoZXMyIZfIYlyadWwo+Bp8DsNYVp5SvkHco1trpy3Djv9aCf3MBdLnIkKODFOaDeQLNnJ
	AA8I3sDfp2XXMXAMc6/qw4XbXUbmf0AQPWTpZ+hKw4FbkXvqEoCYo44rNejnUv+MvkQFdue6M
X-Gm-Gg: ASbGncsrknu/XECW7fpCu5cDutLBj5Owr1I1dqI5VXidcr7WRVyd2+vUGoHcE0hQwHY
	ZivPLT3ry+2H+yFCjG0HRJSVJhIc381Xt8F/8QdHx/EK54F8tDZz+dInDK2JdeYyBbSV0U6Vmzc
	KE7JCT8ZtD2tdVzIZQVJAXvytzayJ4Ys/ugaoqZB0qO+iBAcdn4JmEWqGaCHce5O0I3QguObz0p
	7vPTVZz0g9TuLXkh34tyAByxzu2A6n7ae7jxwF7OFpNSZIZQ1lqLgOHmSNzaITIfXfRGqWgtaD/
	tzhnnM3uBBBAaSKR7R0PpzvrIhM40HdjF3Sf1oM/yY9Mf/nuSk9lSA==
X-Received: by 2002:a05:600c:2053:b0:434:e65e:457b with SMTP id 5b1f17b1804b1-4394ceaf842mr28612805e9.3.1739277800594;
        Tue, 11 Feb 2025 04:43:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEk//W2BZo5OkvrLHLvMbFfjLDfIdPmBrP4srGuM2VWkzHyhBkqsKX8bhs4FGGa0+OXOscEUA==
X-Received: by 2002:a05:600c:2053:b0:434:e65e:457b with SMTP id 5b1f17b1804b1-4394ceaf842mr28612595e9.3.1739277800283;
        Tue, 11 Feb 2025 04:43:20 -0800 (PST)
Received: from rh (p200300f6af0e4d00dda53016e366575f.dip0.t-ipconnect.de. [2003:f6:af0e:4d00:dda5:3016:e366:575f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc5a8a9e4sm13420373f8f.10.2025.02.11.04.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 04:43:19 -0800 (PST)
Date: Tue, 11 Feb 2025 13:43:18 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Oliver Upton <oliver.upton@linux.dev>
cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
    Suzuki K Poulose <suzuki.poulose@arm.com>, 
    Zenghui Yu <yuzenghui@huawei.com>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, 
    Cornelia Huck <cohuck@redhat.com>, Eric Auger <eric.auger@redhat.com>, 
    linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] KVM: arm64: Allow userspace to change MIDR_EL1
In-Reply-To: <Z6pBd0XgEvrMoLcS@linux.dev>
Message-ID: <99f6301e-69dd-47e6-2cc6-10f44f6760cd@redhat.com>
References: <20250210154953.27002-1-sebott@redhat.com> <20250210154953.27002-2-sebott@redhat.com> <Z6pBd0XgEvrMoLcS@linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ydIM5jhGHr2mX4EdbPeY6BqfPhklOvcEvS8C_BBdNns_1739277801
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_044324_835200_FD075863 
X-CRM114-Status: GOOD (  18.49  )
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

Hi Oliver,

On Mon, 10 Feb 2025, Oliver Upton wrote:
> On Mon, Feb 10, 2025 at 04:49:50PM +0100, Sebastian Ott wrote:
>> Enable VMMs to write MIDR_EL1 by treating it as a VM ID register.
>> Since MIDR_EL1 is not handled as a proper arm64_ftr_reg apply only
>> a sanity check against the writable mask to ensure the reserved
>> bits are 0.
>
> How exactly does the VMM's MIDR_EL1 find its way to the guest? VPIDR_EL2
> is still set to the hardware value.

Ouch. Completely missed that part, sry.

>
>> @@ -2021,7 +2037,11 @@ static int set_id_reg(struct kvm_vcpu *vcpu, const struct sys_reg_desc *rd,
>>  		return ret;
>>  	}
>>
>> -	ret = arm64_check_features(vcpu, rd, val);
>> +	if (skip_feature_check(id))
>> +		ret = arm64_check_mask(rd, val);
>> +	else
>> +		ret = arm64_check_features(vcpu, rd, val);
>> +
>
> Can you add a new implementation of ->set_user() for MIDR/REVIDR/AIDR
> instead?

Yes, sure.

>> @@ -2542,6 +2571,8 @@ static const struct sys_reg_desc sys_reg_descs[] = {
>>
>>  	{ SYS_DESC(SYS_DBGVCR32_EL2), undef_access, reset_val, DBGVCR32_EL2, 0 },
>>
>> +	{ ID_DESC(MIDR_EL1), .set_user = set_id_reg, .visibility = id_visibility,
>> +	  .reset = reset_midr_el1, .val = (u32)-1 },
>
> nit: GENMASK() instead of truncation by casting.

All done. I add a test and send out V2.
Thanks a lot!
Sebastian


