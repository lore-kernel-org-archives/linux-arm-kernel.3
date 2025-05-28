Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A900C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 13:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UQ9g5LYyLjb8/iVLB1DcVfsrw8TL+AlPQukLnrUz7KA=; b=RPyfBXrGyNrnpWuLqpSevkeVwt
	qOnxp3of/+J/1064y9iA+aDz+O1tvaULvfvhApa++8Mns1m1Csb0aTrRvxlvvVIuh8/KD61gr8Chg
	QVczAo20zfiVdmEVSy1/chhag8NveZMBPDuA3WZs+uMTrQQPurxL3Nxjm2rcxd8Ji02ABIFOabHqE
	fswm51wdLzG2B3lc29mssyCmVEVAAZS+5SKFOz1aaPlp7ZshpLqq6t8aoXiAgCil6EicRI824MM32
	KaPeFpHpaVfADrFxln5Mt7Y4jqr67Ifz8h4D2fhdeNzzxvGG3+14V2oiG6Kl7ZdT+JKiod6gzT0Jb
	czOz6QMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGt1-0000000DFZh-3gzM;
	Wed, 28 May 2025 13:32:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKGqd-0000000DF9y-2RaM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 13:29:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748438973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UQ9g5LYyLjb8/iVLB1DcVfsrw8TL+AlPQukLnrUz7KA=;
	b=BgTusbLIjxBSm5SL7HV5FYCEnRjL0hKmkEpbNHqiDd6tzu/z3NUpBQJnryM8dQHtNzUoiO
	6CqMUmJPU8gumbjriMmSuq13B07uvUr31hup0mi2yx9sWxHKsbrb1J51QnyVUqP4S+sApS
	gFbu3RIaTGamoAmEztTUJdvY8IMPs1A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-520-rEXD6ZIkN_yxLWVC4M4kwQ-1; Wed, 28 May 2025 09:28:10 -0400
X-MC-Unique: rEXD6ZIkN_yxLWVC4M4kwQ-1
X-Mimecast-MFC-AGG-ID: rEXD6ZIkN_yxLWVC4M4kwQ_1748438889
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a3696a0d3aso2062507f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 May 2025 06:28:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748438888; x=1749043688;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UQ9g5LYyLjb8/iVLB1DcVfsrw8TL+AlPQukLnrUz7KA=;
        b=BubAEdG7+85v9Lhv7mLqt8nl24BYhuhghr7S0AmfOaWYVSnV2dPQwkNy6u8tQ2alXP
         XufTwMKdnLSP9iKXSPGk3Yne4ndu3uF9ukjl5Yz8JA3ZeSRjZ5zPetecZjLUtoHIDCx1
         WycQZJATZ7zqDhH93ySndXDJ4JZAaXMTXT1v0XIQ417Ni4ED36ue5ZT0tBS/F7HZfiXV
         lpWyYgYMQ4RSCx0fCN4Z3CNYer9hrFjX3GvPwGt7R5W8+0BaYbuV1jZ/ubVUzCLWZPAJ
         MMEDKeoldy21Tqkc2K/ufKk5GQFHp7RNXOzWkfaHD1R5Zij/YpnKRx369Qacb8IlPcU0
         whnw==
X-Forwarded-Encrypted: i=1; AJvYcCVJ5K0CAcyDMY7kHy5V4zYvCfIwhdxirPC4TG2Ie8vDW4Ww6BGOnqPge7835tKmfIxQWRhEcFKOxekUv46iAKHr@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr0jfi6sn9rQyMWieMoIttAtN/idybxf4LZkZWEmuKn4Jxp6ST
	XBwr4Bksmq2L/S0RVnQvTn2Wxc0Klra4cOzVrEwF/f20zacm3e0PMVft0vVOWFDBZXA5vOBnPMM
	X2q4p+AI1n7g6KdPeCkQw10zyNyQc4kD8HtjcYaOrKhmElq02uI+vcx6JNLz1dxhi5LGZkNmdUW
	MjMKa2qZPa
X-Gm-Gg: ASbGncvBHJ63Z7fP7b2ihnX1kX+ceqcO754zvhjwMRWzVFImZd0UnjRoAW67AZG1w24
	WamtvWzFrIEy3Qp1c71wMKIPRaXTInx2bhP9Sl2UFqYZntzH2FNgH6yGbGgtlAoo5stnBYEVvMd
	e8f6u/L/4f6tUxh6VRXuTCBVlCJrz/LD3CIrZSUMbupm3uGT69SJ5tm7vwVjB1I4jOrKZXiJDk3
	qcPuq2YT2utzFz/5Nlifdsb3QCZjpJk6Zqh+rKvQEYbr2kiuGqIj81iW05tXvVL29kzWAysTgT7
	jzDX4prqW9a6vfxK7DwADs2JDx1I1pk32lLQH5Ip+T4eWQODIFIxQw==
X-Received: by 2002:a05:6000:250f:b0:3a4:eac6:e320 with SMTP id ffacd0b85a97d-3a4eac6e4cfmr2302686f8f.3.1748438888529;
        Wed, 28 May 2025 06:28:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFbyayzrF6O0WPxMeyUA9UrtC3EPJ8bgX9wDZpJ1+cDqAh15SKbYxky+R1yioFLQpmt8Yx37g==
X-Received: by 2002:a05:6000:250f:b0:3a4:eac6:e320 with SMTP id ffacd0b85a97d-3a4eac6e4cfmr2302654f8f.3.1748438888177;
        Wed, 28 May 2025 06:28:08 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45072555885sm17994055e9.17.2025.05.28.06.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 06:28:07 -0700 (PDT)
Message-ID: <92c7e99c-5574-422c-92f1-62d5cde58fec@redhat.com>
Date: Wed, 28 May 2025 15:28:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/9] KVM: Enable Nested Virt selftests
To: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
 suzuki.poulose@arm.com, yuzenghui@huawei.com, seanjc@google.com,
 darren@os.amperecomputing.com
References: <20250512105251.577874-1-gankulkarni@os.amperecomputing.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20250512105251.577874-1-gankulkarni@os.amperecomputing.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fZ1Wmw4QQig0vc4OgtNpMuFm4njHQLTVpkpb8aG4XMA_1748438889
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_062935_692915_290A9C4C 
X-CRM114-Status: GOOD (  16.62  )
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

Hi Ganapatrao,

On 5/12/25 12:52 PM, Ganapatrao Kulkarni wrote:
> This patch series makes the selftest work with NV enabled. The guest code
> is run in vEL2 instead of EL1. We add a command line option to enable
> testing of NV. The NV tests are disabled by default.

For commodity, I would add in the coverletter that for all tests
enhanced with vEL2 testing "-g 1" option shall be added to force that mode.

I don't really get how you chose tests capable to run at vEL2 and
excluded others? Wouldn't it make sense to have a way to run all tests
in either mode?

Thanks

Eric

> 
> Modified around 12 selftests in this series.
> 
> Changes since v1:
> 	- Updated NV helper functions as per comments [1].
> 	- Modified existing testscases to run guest code in vEL2.
> 
> [1] https://lkml.iu.edu/hypermail/linux/kernel/2502.0/07001.html 
> 
> Ganapatrao Kulkarni (9):
>   KVM: arm64: nv: selftests: Add support to run guest code in vEL2.
>   KVM: arm64: nv: selftests: Add simple test to run guest code in vEL2
>   KVM: arm64: nv: selftests: Enable hypervisor timer tests to run in
>     vEL2
>   KVM: arm64: nv: selftests: enable aarch32_id_regs test to run in vEL2
>   KVM: arm64: nv: selftests: Enable vgic tests to run in vEL2
>   KVM: arm64: nv: selftests: Enable set_id_regs test to run in vEL2
>   KVM: arm64: nv: selftests: Enable test to run in vEL2
>   KVM: selftests: arm64: Extend kvm_page_table_test to run guest code in
>     vEL2
>   KVM: arm64: nv: selftests: Enable page_fault_test test to run in vEL2
> 
>  tools/testing/selftests/kvm/Makefile.kvm      |   2 +
>  tools/testing/selftests/kvm/arch_timer.c      |   8 +-
>  .../selftests/kvm/arm64/aarch32_id_regs.c     |  34 ++++-
>  .../testing/selftests/kvm/arm64/arch_timer.c  | 118 +++++++++++++++---
>  .../selftests/kvm/arm64/nv_guest_hypervisor.c |  68 ++++++++++
>  .../selftests/kvm/arm64/page_fault_test.c     |  35 +++++-
>  .../testing/selftests/kvm/arm64/set_id_regs.c |  57 ++++++++-
>  tools/testing/selftests/kvm/arm64/vgic_init.c |  54 +++++++-
>  tools/testing/selftests/kvm/arm64/vgic_irq.c  |  27 ++--
>  .../selftests/kvm/arm64/vgic_lpi_stress.c     |  19 ++-
>  .../testing/selftests/kvm/guest_print_test.c  |  32 +++++
>  .../selftests/kvm/include/arm64/arch_timer.h  |  16 +++
>  .../kvm/include/arm64/kvm_util_arch.h         |   3 +
>  .../selftests/kvm/include/arm64/nv_util.h     |  45 +++++++
>  .../selftests/kvm/include/arm64/vgic.h        |   1 +
>  .../testing/selftests/kvm/include/kvm_util.h  |   3 +
>  .../selftests/kvm/include/timer_test.h        |   1 +
>  .../selftests/kvm/kvm_page_table_test.c       |  30 ++++-
>  tools/testing/selftests/kvm/lib/arm64/nv.c    |  46 +++++++
>  .../selftests/kvm/lib/arm64/processor.c       |  61 ++++++---
>  tools/testing/selftests/kvm/lib/arm64/vgic.c  |   8 ++
>  21 files changed, 604 insertions(+), 64 deletions(-)
>  create mode 100644 tools/testing/selftests/kvm/arm64/nv_guest_hypervisor.c
>  create mode 100644 tools/testing/selftests/kvm/include/arm64/nv_util.h
>  create mode 100644 tools/testing/selftests/kvm/lib/arm64/nv.c
> 


