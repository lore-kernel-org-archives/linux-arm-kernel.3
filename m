Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87773FEA803
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 04:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WgjWcQoj7oLaeFNKzaIEePhWh+sZwFHeBhNTOW06Lw4=; b=cYybCeZ81aosH4ljgbC8psb1JG
	GlKT+kGZJaZ0Uu2HOBPYzb1MMkY6cn9Miyfle3KtFyLVNAp5tQG7XrxB1FwGL9Ku+cAq/ikkKGcSv
	KhZGxgdf4S+G2Zffusuaz75HV8yAuVwZmknKssVTdQ6seYGFOg0K8a9vjFAakTPmoT9g4g/A74rUZ
	hPZhCTP7lcCfK21EV2kNdb0P3Q2dwx+1T57+yfVmVnhUyW2k13DtY6HD2J/9KI1MhhWich0Zlqp6q
	uenTF+wOilDEanKJzPEThCQD/dm/Z1LhZ5elYQEoGAhxgxGiPa1eKmz04m0HKGiuj1RrYv2ORS2Q/
	0s1kQOrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5FWt-00000002ed5-2c33;
	Wed, 25 Mar 2026 04:07:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5FWq-00000002ecR-3Dfc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 04:07:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774411655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WgjWcQoj7oLaeFNKzaIEePhWh+sZwFHeBhNTOW06Lw4=;
	b=iim9kJIwVD2PB2GsXSFoTfoubVniGfOeaJ7gO63zERHMepDd8iIywkA8A/36r7t+6OdX89
	//iHC8nmWicrLjK3sdVQmH+JHh055fsQeacDTnw1zvitF6P1auzbnpeiV+HesOK/0mmoSj
	XA0zk6Il0hPBoptGkeltJ4NBs2qrCFQ=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-AB-yvGXePOS-ky2XeOHwLA-1; Wed, 25 Mar 2026 00:07:31 -0400
X-MC-Unique: AB-yvGXePOS-ky2XeOHwLA-1
X-Mimecast-MFC-AGG-ID: AB-yvGXePOS-ky2XeOHwLA_1774411651
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c70dd30025fso19901264a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 21:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774411650; x=1775016450;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WgjWcQoj7oLaeFNKzaIEePhWh+sZwFHeBhNTOW06Lw4=;
        b=g5nCnJ1H5rZhz7NcItPqwP8dWpKPmj/JVtR1maCAyRrmU+zc212hMWvVm6GH2bRWgV
         twpwFRV1HUfgbav9bZOipUuTs9oVLAX+Wlm4bRAWFXZ3H05B1l3hQZra0yAvUWa1v0HP
         kOEPeZ/DiXNbGdSFLF9rsNZhwED2ykvyaQSoEGG5pHjwD67RAldIYAdY4v+Lvi/Ja7pB
         u2B2UYnmtYY1pyWD4V57lY9rnNczXo9hiJnHXmBWPJRGjenFjgCFa8v95xQSAReiqmiP
         BTKovT6HbTdXeVUS3205SQ9Eacf1wFKblJ+REUNZRryRP1XwvkTXOmoZRw+/xJCilq3g
         eY1w==
X-Forwarded-Encrypted: i=1; AJvYcCW/hdH71wT3r38cwSy9NP+WqqUfimznqaQO+M+pW5iiK5LsWVypffcx4oNUgDGBo9qF6SczCEHEkTInZBK4dlcr@lists.infradead.org
X-Gm-Message-State: AOJu0Ywtyz/IRRtgaK41UpfJ7I4aHt3UkFYu1lCq8AGUi6qIewBIHdKH
	M0TwJt4JTo+xB59cA5z1GvfIhbN4aDEAilSuvOxj50FLcQfcXQt+289BM2SQJ7cXHpf4P/9vP8Y
	8Q3NRlaJlKBGVNZxPpMDyfgpiIoM7FXSE7ionH6qtAkCBlnbzS7sWsPRSHlU5o7slMJqujNKywS
	sJ
X-Gm-Gg: ATEYQzygEPDMMgk1ZHLFHXAjZADyBePxM3TOKovCSd2aJlOxU0ksWoRlUFIciZQOZ+Y
	8Fr3B30tIs3BTc3bCNcgakNR3ddb2zxMYSY1tjt7m4Qr62y90lKnJh+UPBoNRxWMXpg8VQym8OT
	kH1iRPL+Fy3WkfBw9mQOzetQmEoDbE9spMqcpv0ByAUnI6seZ3NBBZYEmkBBBgkFd6gHKCmewYP
	7jeS4dKx09iw1+mUACyxWh2wPNdlLiZlfUCi8SPYcjjGZWdNAtjgfV+cPttaD7FB/zcKgqxCnpE
	sRGq8s+e+df3gLYefy8lMb/SIiXuh7pfShWTbe07UVNHKaKDRF/Q4js9sFu0u7jlIvjUrQ/5AGa
	PpLAVo6RZWkrRQczqvWyx/xs9itUOka0c5g4SMhFIMYwIpV/SHt0vvnqpPTs1tVvV
X-Received: by 2002:a05:6a00:298e:b0:81e:d7c3:2f3a with SMTP id d2e1a72fcca58-82c6e0d1e6emr1790906b3a.46.1774411650531;
        Tue, 24 Mar 2026 21:07:30 -0700 (PDT)
X-Received: by 2002:a05:6a00:298e:b0:81e:d7c3:2f3a with SMTP id d2e1a72fcca58-82c6e0d1e6emr1790860b3a.46.1774411650026;
        Tue, 24 Mar 2026 21:07:30 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c38565096sm8738528b3a.51.2026.03.24.21.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 21:07:29 -0700 (PDT)
Message-ID: <779079e1-7193-46e9-b18c-9ab5e69bb077@redhat.com>
Date: Wed, 25 Mar 2026 14:07:17 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/48] arm64: Support for Arm CCA in KVM
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
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
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve <vannapurve@google.com>
References: <20260318155413.793430-1-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260318155413.793430-1-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yP0L5EgPcSkQv9F3cn-En-YetYk2vAz_5z5yt-DuB4E_1774411651
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_210736_883318_76B04C95 
X-CRM114-Status: GOOD (  18.03  )
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

Hi Steven,

On 3/19/26 1:53 AM, Steven Price wrote:
> 
> This series is based on v7.0-rc1. It is also available as a git
> repository:
> 
> https://gitlab.arm.com/linux-arm/linux-cca cca-host/v13
> 
> Work in progress changes for kvmtool are available from the git
> repository below:
> 
> https://gitlab.arm.com/linux-arm/kvmtool-cca cca/v11
> 

Could you please share if we have a working qemu repository on top of this
(v13) series? The previous qemu repository [1] seems out of dated for long
time. I heard Jean won't be able to continue his efforts on QEMU part, who
is going to pick it up in this case.

[1] https://git.codelinaro.org/linaro/dcap/qemu.git    (branch: cca/latest)

> Note that the kvmtool code has been tidied up (thanks to Suzuki) and
> this involves a minor change in flags. The "--restricted_mem" flag is no
> longer recognised (or necessary).
> 
> The TF-RMM has not yet merged the RMMv2.0 support, so you will need to
> use the following branch:
> 
> https://git.trustedfirmware.org/TF-RMM/tf-rmm.git topics/rmm-v2.0-poc
> 

I'm seeing error to initialize RMM with the suggested RMM branch (topics/rmm-v2.0-poc)
and the upstream TF-A [1]. It seems the problem is compatible issue in the
RMM-EL3 interface. RMM requires verion 2.0 while TF-A only supports 0.8. So
I guess I must be using a wrong TF-A repository. Could you please share which
TF-A repository you use for testing?

[1] git@github.com:ARM-software/arm-trusted-firmware.git    (branch: master)

Booting logs
=============
NOTICE:  Booting Trusted Firmware
NOTICE:  BL1: v2.14.0(debug):67edb4f8e
NOTICE:  BL1: Built : 00:01:39, Mar 25 2026
INFO:    BL1: RAM 0xe0ee000 - 0xe0f7000
INFO:    BL1: Loading BL2
INFO:    Loading image id=1 at address 0xe05b000
INFO:    Image id=1 loaded: 0xe05b000 - 0xe0642bc
NOTICE:  BL1: Booting BL2
INFO:    Entry point address = 0xe05b000
INFO:    SPSR = 0x3cd
NOTICE:  BL2: v2.14.0(debug):67edb4f8e
NOTICE:  BL2: Built : 00:01:39, Mar 25 2026
INFO:    BL2: Doing platform setup
INFO:    Reserved RMM memory [0x40100000, 0x418fffff] in Device tree
INFO:    BL2: Loading image id 3
INFO:    Loading image id=3 at address 0xe090000
INFO:    Image id=3 loaded: 0xe090000 - 0xe0a292b
INFO:    BL2: Loading image id 35
INFO:    Loading image id=35 at address 0x40100000
INFO:    Image id=35 loaded: 0x40100000 - 0x401a11e0
INFO:    BL2: Loading image id 5
INFO:    Loading image id=5 at address 0x60000000
INFO:    Image id=5 loaded: 0x60000000 - 0x60200000
NOTICE:  BL2: Booting BL31
INFO:    Entry point address = 0xe090000
INFO:    SPSR = 0x3cd
INFO:    GPT: Boot Configuration
INFO:      PPS/T:     0x2/40
INFO:      PGS/P:     0x0/12
INFO:      L0GPTSZ/S: 0x0/30
INFO:      PAS count: 6
INFO:      L0 base:   0xedfe000
INFO:    Enabling Granule Protection Checks
NOTICE:  BL31: v2.14.0(debug):67edb4f8e
NOTICE:  BL31: Built : 00:01:39, Mar 25 2026
INFO:    GICv3 without legacy support detected.
INFO:    ARM GICv3 driver initialized in EL3
INFO:    Maximum SPI INTID supported: 287
INFO:    BL31: Initializing runtime services
INFO:    RMM setup done.
INFO:    BL31: Initializing RMM
INFO:    RMM init start.
ERROR:   RMM init failed: -2                           <<<< Error raised by RMM here
WARNING: BL31: RMM initialization failed
INFO:    BL31: Preparing for EL3 exit to normal world
INFO:    Entry point address = 0x60000000
INFO:    SPSR = 0x3c9
UEFI firmware (version  built at 19:33:51 on Mar  3 2026)


Thanks,
Gavin




