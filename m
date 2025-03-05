Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E48B1C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 03:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+mJRNWDqZaDl0D1j/RlDn06NEO5jFGolr9VYIE5+CIg=; b=2pmWhfERUnrde+S/IrFSgeCCUr
	Ngjt0rFelppRW62AfRqMftHJ0SF/qm7tJAJusG4ymjoY1jKs+9Z+vxeRbo5S+U2Ndn34XIQJ5Qe6w
	BoSLjD8sXa464/2inrZcfJ1LrMwt+Kr9j4CxeIa8w/uJT9z+ctvi9DBz4T75BIzTT9CPt1V2dkwL2
	dqpYK0xrZApkOsvGa3VktbJcRxukEFVG2dL6/82XgqBTvaSylKaoA2ZoG8JiBi8EMdz6qEAFOW9Jk
	wqJYBWenGm5sfV6OTh9OIcx0f03JZI6dZG1akUqRnRiSvhm63sII9bS+e6gZFbMewngf4mMBojnJj
	gUB0WPwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpfqZ-00000006v3v-0FMo;
	Wed, 05 Mar 2025 03:55:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpfox-00000006utt-1Rsl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 03:53:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741146801;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+mJRNWDqZaDl0D1j/RlDn06NEO5jFGolr9VYIE5+CIg=;
	b=I94N0q0hTwIR/W5zU8e+SrWCtiJj0HfPjY/9lyI4qO10ZIMprKuV5J3j/USjsXeQ1l9+ge
	BLzhMDNBOjrIvPFIDVBxmbn0IHVJsF03u9QNv3vdjLxZFkgwsoksR6WAiIMMuhCHPsD6Nc
	PiCnePi8X72QaJvJtsOWbQt6o9r7h4U=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-2-ZTRsNVO_GDS4QEnCjOgQ-1; Tue, 04 Mar 2025 22:53:17 -0500
X-MC-Unique: 2-ZTRsNVO_GDS4QEnCjOgQ-1
X-Mimecast-MFC-AGG-ID: 2-ZTRsNVO_GDS4QEnCjOgQ_1741146796
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-223551ee0a3so148478615ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 19:53:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741146796; x=1741751596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+mJRNWDqZaDl0D1j/RlDn06NEO5jFGolr9VYIE5+CIg=;
        b=cgJ1cPG0gfYYPHoAbpxKXglOkM3qHroKlB1gTPzduazNAq4rPSh5FaLi7IN3j2ePRv
         L3a3HDj1DidoH4P9Yjb5yziFYnCqyHsE9h1ntzq9/09z+58NzTB7Ydi/L7+IXjDSWbZa
         VzWImcBb7nTwrwhGl/E1cvIVk3YHFgHSGTyBNWDiu9kAYUsbFuWRNIpPlOkD0eQE9gfQ
         Gs1Fsb988gQ/hE27PxhhIOEk1S21zTvmNq6+rc44W4YQMaiBXSvJiFKka5Bo7Y/IUH31
         OQcOWgWqDqJsWi92dlO/oeYj32MAO24bLReYBtJVrtuMnK0CI9B5ubWAzo0tfq9CyG+S
         /Saw==
X-Forwarded-Encrypted: i=1; AJvYcCW7gaDl2Td3731j1WPUGOmlau9oJBXYt8b6TXUq9xV9y0OnIBmRjUo7EgJuGIwIVPV4OgVfImpRgkscy01D46ls@lists.infradead.org
X-Gm-Message-State: AOJu0YyRo0xJWtZC+Hb2C2pd1/x2ucMXOgoe+7QTb/oEX3erhexbnmMf
	Y6dJAV96wcrkk9Udi5OKw8Qq0b4p+o/HBhKBQSB7uGQXhEla1wxq8pe8n1rMKE+JJOKi0gJflRk
	D+vVFKeyRvZ0DrH6ShPeGpF2mRh2LMrXpT2IHBhXMQ3DoPzw3nhhLeEXeHt4ojP6dOztIutbF
X-Gm-Gg: ASbGnctp3s0ybjupBHTvvQbOhFcjWfXCoKOf2P+Gp23DZF4iYHfHEXR8UpM5vD9Lr8Y
	Dimo925EngAWvNW7MzGsAoq2JkCZvPR+DPnUd6h6ajgQlJWBF4JMH0s7ttvZghzSV2I1XJKmulE
	TmcC1sLM7vAUMebNd5gtX0OEYJ7fEgjUcSRR3ZuCekEfvBcQuClyvvsWDq8Ejt38IqIm2LRoG7j
	+sUVOAXzCtypj0VL4hYg1pKwFl7fKw0xO/tJuisc9q4uqHkW1JD5g7ysqQHUx7rOIQXp33F8V3Q
	Z83hhxqxJRwiecY=
X-Received: by 2002:a05:6a21:150c:b0:1ee:cf13:d4b5 with SMTP id adf61e73a8af0-1f3495afc1dmr2823100637.39.1741146796422;
        Tue, 04 Mar 2025 19:53:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuyA16zIv02ugj3FPLruOV0ZdxdHMNTCUw0ZHSpkP3eGnIKTFgv0oqMKMfRXj1Nc/YwnybSw==
X-Received: by 2002:a05:6a21:150c:b0:1ee:cf13:d4b5 with SMTP id adf61e73a8af0-1f3495afc1dmr2823058637.39.1741146796108;
        Tue, 04 Mar 2025 19:53:16 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7ddf20b8sm11041231a12.7.2025.03.04.19.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 19:53:15 -0800 (PST)
Message-ID: <af65c1ea-202a-4a60-ab13-0c325385b7ec@redhat.com>
Date: Wed, 5 Mar 2025 13:53:06 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/45] arm64: Support for Arm CCA in KVM
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
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-1-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BXOYTJ01vZF56iSncSODJLHn6Lr5zYOsEXqbZkPT6kY_1741146796
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_195323_489966_EB8B7191 
X-CRM114-Status: GOOD (  12.17  )
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

On 2/14/25 2:13 AM, Steven Price wrote:

[...]

> 
> The ABI to the RMM (the RMI) is based on RMM v1.0-rel0 specification[1].
> 
> This series is based on v6.14-rc1. It is also available as a git
> repository:
> 
> https://gitlab.arm.com/linux-arm/linux-cca cca-host/v7
> 
> Work in progress changes for kvmtool are available from the git
> repository below:
> 
> https://gitlab.arm.com/linux-arm/kvmtool-cca cca/v5
> 
> [1] https://developer.arm.com/documentation/den0137/1-0rel0/
> [2] https://lore.kernel.org/r/a7011738-a084-46fa-947f-395d90b37f8b%40arm.com
> 

I had a chance to test it by following Jean's instructions [1-2]. The guest can
boot up and kvmtool also can boot the guest. I'm listing the repositories I used
in case some body else want to give it a try.

[1] Jean's guide to build software components needed by ARM CCA stack
     https://linaro.atlassian.net/wiki/spaces/QEMU/pages/29051027459/Building+an+RME+stack+for+QEMU
[2] Jean's guide to build firmware needed by the emulated host

host
====
tf-rmm    https://git.codelinaro.org/linaro/dcap/rmm.git                       (cca/v4)
edk2:     git@github.com:tianocore/edk2.git                                    (edk2-stable202411)
tf-a:     https://git.codelinaro.org/linaro/dcap/tf-a/trusted-firmware-a.git   (cca/v4)
qemu      https://git.qemu.org/git/qemu.git                                    (stable-9.2)
linux     https://git.gitlab.arm.com/linux-arm/linux-cca.git                   (cca-host/v7)
buildroot https://github.com/buildroot/buildroot                               (master)

guest
=====
qemu      https://git.codelinaro.org/linaro/dcap/qemu.git                      (cca/latest)
kvmtool   https://gitlab.arm.com/linux-arm/kvmtool-cca                         (cca/latest)
linux     https://git.gitlab.arm.com/linux-arm/linux-cca.git                   (cca-guest/v7)

Command lines to start the host
================================
[gshan@virtlab723 host]$ cat start.sh
#!/bin/sh
HOST_PATH=/home/gshan/sandbox/qemu/host
GUEST_PATH=/home/gshan/sandbox/qemu/guest

sudo ${HOST_PATH}/qemu/build/qemu-system-aarch64                      \
-M virt,virtualization=on,secure=on,gic-version=3,acpi=off            \
-cpu max,x-rme=on -m 4G -smp 8                                        \
-serial mon:stdio -monitor none -nographic -nodefaults                \
-bios ${HOST_PATH}/tf-a/flash.bin                                     \
-kernel ${HOST_PATH}/linux/arch/arm64/boot/Image                      \
-initrd ${HOST_PATH}/buildroot/output/images/rootfs.cpio.xz           \
-device pcie-root-port,bus=pcie.0,chassis=1,id=pcie.1                 \
-device pcie-root-port,bus=pcie.0,chassis=2,id=pcie.2                 \
-device pcie-root-port,bus=pcie.0,chassis=3,id=pcie.3                 \
-device pcie-root-port,bus=pcie.0,chassis=4,id=pcie.4                 \
-device virtio-9p-device,fsdev=shr0,mount_tag=shr0                    \
-fsdev local,security_model=none,path=${GUEST_PATH},id=shr0           \
-netdev tap,id=tap1,script=/etc/qemu-ifup,downscript=/etc/qemu-ifdown \
-device virtio-net-pci,bus=pcie.2,netdev=tap1,mac=78:ac:44:2b:43:f0

Command lines to start the guest
================================
[gshan@virtlab723 guest]$ cat start_guest.sh
#!/bin/sh
key="VGhlIHJlYWxtIGd1ZXN0IHBlcnNvbmFsaXphdGlvbiBrZXkga"
key+="W4gZm9ybWF0IG9mIGJhc2U2NCAgICAgICAgIA=="

qemu-system-aarch64 -enable-kvm                                                     \
-object rme-guest,id=rme0,measurement-algorithm=sha512,personalization-value=${key} \
-M virt,gic-version=3,its=on,confidential-guest-support=rme0                        \
-cpu host -smp 2 -m 1024M                                                           \
-serial mon:stdio -monitor none -nographic -nodefaults                              \
-kernel /mnt/linux/arch/arm64/boot/Image                                            \
-initrd /mnt/buildroot/output/images/rootfs.cpio.xz                                 \
-append earlycon=pl011,mmio,0x10009000000

Thanks,
Gavin


