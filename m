Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCCAC79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 11:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3K+cGIQpWKO1Yr5hRTXgQHb8/73OGKtddJAzidJdgJk=; b=zyoduSAR1n3HwgNVn/eFev6NT2
	jdv2jwVr6je9+L02IS7QywTD4IrFzSK2PxfaCNIeOIbnrwur9YkKToN2mo5RNi0xtwXpxyXQQCfzn
	wDOJobBbxi2+MuqEnp4munQsh/4XePRaeypsWaGJDR5sH0yk3yo/Ht3YSbT7zdAqGjboQSTjD29ih
	DYeP5ZEEfRJAFYZt7RVZBKgtP3ZYFM1S2HdMZ9QsLEYfbNjnj25NyB3TtSPixPwBAl0TCtzaX00c+
	T52LinfcgwnazdFOx3hglyenW+D7jQzHaa69wdOuXgM7WVaiQY0HzJSYA7K2t0q7ClaPWCd7PMAek
	CEsxvbVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4GUE-0000000BZbv-1Ag9;
	Wed, 09 Sep 2026 11:29:07 +0000
Received: from out-13.mta0.migadu.com ([2001:41d0:1004:224b::d] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4GUB-0000000BZb3-1Ov6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 11:29:04 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=3K+cGIQpWKO1Yr5hRTXgQHb8/73OGKtddJAzidJdgJk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788953340; v=1; x=1789558140;
 b=hBWL3T46EWGoOecRZaOD0aeCnoQM0DPwgyWWn+wifdiX0b/ipxLqssa5mcyTUD6e6OMi1KEJ
 kBGRvVGtbaP8eqSHy34JWmQGoV542HVWyyRfUa9z9UwF27KP6Aw8KZEbuQyeNXrejKSYeUjwnaO
 bx0g/Yhc348PeYHDAksyFMVE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 077cc7cf1e819a18;
	Wed, 09 Sep 2026 11:29:00 +0000
X-Mizu-Trace-ID: 077cc7cf1e819a18
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384b7so5894e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Sep 2026 04:28:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxTgY35t5xjMsIPWFn4/wtW+YvVs0P2ej3sVx/EUDDhWsoOjArTiwYzNCbtR1qAMtMtoKAIvZwh7C8MkEggrvBn@lists.infradead.org
X-Gm-Message-State: AFuF++nD5OuGRc4qeTyGKJTjSHnjjuGTZyJIctlOlBEMpaRXQc8Y+wTR
	AkE7NTuBTqZ4uLuV9pzzxyq3L4jsRW9M4wMc28h46oBoRiCdO/6Tzy7qcoEbGqDEtUKXBIP1Yaa
	1aTYcOsN/IFSyDZxFoEEp816ditaEn7+2oJQIYpgc
X-Received: by 2002:a05:6512:288:b0:5b7:78bc:ec07 with SMTP id
 2adb3069b0e04-5b778bcee15mr40479e87.14.1788953335800; Wed, 09 Sep 2026
 04:28:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260908162223.1683432-1-suzuki.poulose@arm.com> <20260908162223.1683432-4-suzuki.poulose@arm.com>
In-Reply-To: <20260908162223.1683432-4-suzuki.poulose@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 9 Sep 2026 12:28:19 +0100
X-Gmail-Original-Message-ID: <CA+EHjTybMZ1TORs25En0eb7_41FBcB=BK1ygYPy5cOHUnQO84A@mail.gmail.com>
X-Gm-Features: AcwNN1XnVfoUpkUpC2kOrZN-6IIczUYCQWaTNJXNhIJk8ffOOnhKQ4oEGT6SciA
Message-ID: <CA+EHjTybMZ1TORs25En0eb7_41FBcB=BK1ygYPy5cOHUnQO84A@mail.gmail.com>
Subject: Re: [PATCH v17 03/20] KVM: arm64: Track the type of VM in kvm_arch
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org, 
	will@kernel.org, catalin.marinas@arm.com, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com, 
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com, 
	joey.gouly@arm.com, yuzenghui@huawei.com, linux-coco@lists.linux.dev, 
	gankulkarni@os.amperecomputing.com, sdonthineni@nvidia.com, 
	alpergun@google.com, fj0570is@fujitsu.com, WeiLin.Chang@arm.com, 
	lpieralisi@kernel.org, enju.kohei@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_042903_535048_40EB3679 
X-CRM114-Status: GOOD (  11.44  )
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

Hi Suzuki,

On Tue, 8 Sept 2026 at 17:23, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>
> KVM arm64 has different types of VMs with all the different modes in which the
> hypervisor code can be run. e.g., VHE, nVHE, PKVM etc. Then there is protected
> VM and normal VMs with PKVM. We might soon add other types, e.g., Arm CCA Realm.
> So in an effort to make the handling of these different types of VMs a bit more
> friendlier to the eyes, add a VM flavor to the kvm_arch and we could then add

nit: "friendlier"

> handlers for different operations based on the VM type.
>
> Keep the flavor initialisation at the beginning to allow for the detection
> early enough and fail out on any unsupported requests. (e.g., protected on !PKVM)

In the commit msg and later in the code (not in the enum though), can
you please spell pKVM with a lower-case p?

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

