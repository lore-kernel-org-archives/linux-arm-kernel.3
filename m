Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCF9CA1014
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 03:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5rBTWZqYxMCbwIRVUHkkykppHi5qw7KCSrBOdLy9bbQ=; b=AofsxArRN7AViyDg+NB74FT5v8
	HK/GPOI22o2QQEHP66GoKXWzpjCv67O+5KMGc7CMwLmxsGElSvRIFWfOp12Pg4piNSU3r4ye+2vHB
	Epbt8HiVUidn5ROjcnKBUB3kZuH43ElMnvQ8TyCl7aulRyjus0QdXpTm9IT72SWMY84ifCXD1fgdJ
	Cyrio2D0mszEIqAvdpaCykz069z3MNyyxC0KvrnKRFR3lzBVWTRtIgTKOH0ICY/srlfmwDGmEnXex
	mRZJxEb3KzNVCQLsS2Wz2s4t53iB6I7oul8FQVp4Ro0P/rffW5oxfKgvAT/brHzWm/sKfcllXlZPh
	FU53coGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0bo-00000008fRs-2MaT;
	Thu, 04 Sep 2025 03:26:00 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uty8A-000000080lp-1d9l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 00:47:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756946833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5rBTWZqYxMCbwIRVUHkkykppHi5qw7KCSrBOdLy9bbQ=;
	b=IbujJXk7H43ADZD+V6ui1NgZsX+40PFbBOBpZWGGLeeQ35qJO1/5peWP4jQqh6HsUcB2Vg
	KXqOd4+IR2iXbDH1AcCJCI86ChRYqeR0eSMgsZLqwGEQYPJrnFHDoQRHyKUHf/rbyNMJqF
	nNt+FJAqeQlyI/SkC0gFLdf3+ZqDowM=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-56-EeIqVEzlPkex0-Upvghlhg-1; Wed, 03 Sep 2025 20:47:11 -0400
X-MC-Unique: EeIqVEzlPkex0-Upvghlhg-1
X-Mimecast-MFC-AGG-ID: EeIqVEzlPkex0-Upvghlhg_1756946830
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b47253319b8so303203a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 17:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756946830; x=1757551630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5rBTWZqYxMCbwIRVUHkkykppHi5qw7KCSrBOdLy9bbQ=;
        b=ocGvnNNm4J6/fSpvz2H/4itPC/6e2L4nopaiejUr0Vg03lSy0Hzj6MJbZ7cgtuu1iv
         EXf3bS+Mti0cxnv4qA/vOCFVVCA97udljr9GQ3XBjnWHx3jDaoPROkF1UFQ/Rwq5ZbDj
         /ozVPOupvi1J9Yb1gSr9imxSAlRyns3urManqCJwem47r/x0v5PY7NYY92LmkdkDyDF/
         Jdvn0FW5wMLI3Wgh6PMm0T+Kxd+IqinhAIeKBah0ghZisbp1TG5lHwrlZ0UxOFriyg5t
         B/L/uyd4S/rCI1eB2E0qDjvyfx7uBcWqmYHxg6E8vpY02gedH54txxLJgRapPX3DW4eI
         W49w==
X-Forwarded-Encrypted: i=1; AJvYcCXbEI+CEXaevKKOUIGtcnnv0nryFZl2x+/RQsIWFRoi/4dP7NaqFBtGuXSEXhMp2Lph0grYfX6ydwpCuo4egTx5@lists.infradead.org
X-Gm-Message-State: AOJu0YyY36mMTKoKKsHimH/y5nxlRvtXQFhj4qgnIFB+4peFzXYMIjb+
	rBcxESbasseiwt88hLjCbXBOCtssSuk3AgEbIVWYIpeVLSRDQMewwEId83PKdEE0xoZj1M99coD
	g8Nd5XoWwuH5MeRafCQ/kuwihZWbLX+iL/RIc+dXAoZTn+QrbfuijJO0Dagq2BcktI6WH8cobsF
	ES
X-Gm-Gg: ASbGncv2JQE3Klm6cPm8PiORxqcalPOtbhgOLbES5uq/2cInGsreLUqtG19IR6ceVab
	O0iz484le1v79eWX9cgbei5VG9Wx0mxrh6tB8NP2l5DlB4sPRz/ERvBws9ayGz5+gpKyqVEe+cy
	NLE7uKMqlZhzD1mePZo4bbGWyMSv2ArfPoxF/2Gnl7iYwSh9kgEzQL7CiY0vSL23F10/dSByZau
	Xl/H53O03n/JKKppynomOvwAp20/OXTk3Huy/vyznDEuUvYfbmL8J/JI4sUA0+mnTlWKnp5DT2K
	Cyri6WsA/bZJvGnyLGDhnc8LYLOrZDgwQCDNDzqDk7h2cABuC2mtiJuMYpJW8k27OAH1qUpokOV
	qGK+m
X-Received: by 2002:a05:6a20:c489:b0:246:2c:fc with SMTP id adf61e73a8af0-246002c0243mr7913946637.48.1756946830307;
        Wed, 03 Sep 2025 17:47:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIE1heha6NLiL0Mkgu6redBGDU2JQIw5VRfT/dIGF69ITV4kWD+34/z44Af0YiNh4zlPvwtw==
X-Received: by 2002:a05:6a20:c489:b0:246:2c:fc with SMTP id adf61e73a8af0-246002c0243mr7913928637.48.1756946829873;
        Wed, 03 Sep 2025 17:47:09 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-62-5.mrk21.qld.optusnet.com.au. [175.34.62.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-327e21d14a8sm17973206a91.2.2025.09.03.17.47.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 17:47:09 -0700 (PDT)
Message-ID: <2aa76e3c-1e97-46d8-a8b7-c13cbbf05e8b@redhat.com>
Date: Thu, 4 Sep 2025 10:46:59 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 00/43] arm64: Support for Arm CCA in KVM
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
References: <20250820145606.180644-1-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250820145606.180644-1-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pVI38lQBrWTIakiRy47hgtpVtL-1Vh3A6WYpjYj7usg_1756946830
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_174714_686181_E11C8E38 
X-CRM114-Status: GOOD (  26.16  )
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


On 8/21/25 12:55 AM, Steven Price wrote:
> This series adds support for running protected VMs using KVM under the
> Arm Confidential Compute Architecture (CCA).
> 
> The related guest support was merged for v6.14-rc1 so you no longer need
> that separately.
> 
> There are a few changes since v9, many thanks for the review
> comments. The highlights are below, and individual patches have a changelog.
> 
>   * Fix a potential issue where the host was walking the stage 2 page tables on
>     realm destruction. If the RMM didn't zero when undelegated (which it isn't
>     required to) then the kernel would attempt to work the junk values and crash.
> 
>   * Avoid RCU stall warnings by correctly settign may_block in
>     kvm_free_stage2_pgd().
> 
>   * Rebased onto v6.17-rc1.
> 
> Things to note:
> 
>   * The magic numbers for capabilities and ioctls have been updated. So
>     you'll need to update your VMM. See below for the updated kvmtool branch.
> 
>   * This series doesn't attempt to integrate with the guest-memfd changes that
>     are being discussed (see below).
> 
>   * Vishal raised an important question about what to do in the case of
>     undelegate failures (also see below).
> 

[...]

I tried to boot a guest using the following combinations, nothing obvious went to
wrong except several long existing issues (described below). So feel free to add:

Tested-by: Gavin Shan <gshan@redhat.com>

Combination
===========
host.tf-a        https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git      (v2.13-rc0)
host.tf-rmm      https://git.codelinaro.org/linaro/dcap/rmm                       (cca/v8)
host.edk2        git@github.com:tianocore/edk2.git                                (edk2-stable202411)
host.kernel      git@github.com:gwshan/linux.git                                  (cca/host-v10) (this series)
host.qemu        https://git.qemu.org/git/qemu.git                                (stable-9.2)
host.buildroot   https://github.com/buildroot/buildroot                           (master)
guest.qemu       https://git.codelinaro.org/linaro/dcap/qemu.git                  (cca/latest) (with linux-headers sync'ed)
guest.kvmtool    https://gitlab.arm.com/linux-arm/kvmtool-cca                     (cca/latest)
guest.edk2       https://git.codelinaro.org/linaro/dcap/edk2                      (cca/latest)
guest.kernel     git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git (v6.17.rc3)
guest.buildroot  https://github.com/buildroot/buildroot                           (master)

Script to start the host
========================
gshan@nvidia-grace-hopper-01:~/sandbox/qemu/host$ cat start.sh
#!/bin/sh
HOST_PATH=/home/gshan/sandbox/qemu/host
GUEST_PATH=/home/gshan/sandbox/qemu/guest
IF_UP_SCRIPT=/etc/qemu-ifup-gshan
IF_DOWN_SCRIPT=/etc/qemu-ifdown-gshan

sudo ${HOST_PATH}/qemu/build/qemu-system-aarch64                        \
-M virt,virtualization=on,secure=on,gic-version=3,acpi=off              \
-cpu max,x-rme=on -m 3G -smp 8                                          \
-serial mon:stdio -monitor none -nographic -nodefaults                  \
-bios ${HOST_PATH}/tf-a/flash.bin                                       \
-kernel ${HOST_PATH}/linux/arch/arm64/boot/Image                        \
-initrd ${HOST_PATH}/buildroot/output/images/rootfs.cpio.xz             \
-device pcie-root-port,bus=pcie.0,chassis=1,id=pcie.1                   \
-device pcie-root-port,bus=pcie.0,chassis=2,id=pcie.2                   \
-device pcie-root-port,bus=pcie.0,chassis=3,id=pcie.3                   \
-device pcie-root-port,bus=pcie.0,chassis=4,id=pcie.4                   \
-device virtio-9p-device,fsdev=shr0,mount_tag=shr0                      \
-fsdev local,security_model=none,path=${GUEST_PATH},id=shr0             \
-netdev tap,id=tap1,script=${IF_UP_SCRIPT},downscript=${IF_DOWN_SCRIPT} \
-device virtio-net-pci,bus=pcie.2,netdev=tap1,mac=b8:3f:d2:1d:3e:f1

Script to start the guest
=========================
gshan@nvidia-grace-hopper-01:~/sandbox/qemu/guest$ cat start_full.sh
#!/bin/sh
key="VGhlIHJlYWxtIGd1ZXN0IHBlcnNvbmFsaXphdGlvbiBrZXkgaW4gZm9ybWF0IG9mIGJhc2U2NCAgICAgICAgIA=="
IF_UP_SCRIPT=/etc/qemu-ifup
IF_DOWN_SCRIPT=/etc/qemu-ifdown

qemu-system-aarch64 -enable-kvm \
-object rme-guest,id=rme0,measurement-algorithm=sha512,personalization-value=${key} \
-M virt,gic-version=3,confidential-guest-support=rme0                               \
-cpu host -smp 4 -m 2G -boot c                                                      \
-serial mon:stdio -monitor none -nographic -nodefaults                              \
-bios /mnt/edk2/Build/ArmVirtQemu-AARCH64/RELEASE_GCC5/FV/QEMU_EFI.fd               \
-device pcie-root-port,bus=pcie.0,chassis=1,id=pcie.1                               \
-device pcie-root-port,bus=pcie.0,chassis=2,id=pcie.2                               \
-drive file=/mnt/rhel10.qcow2,if=none,id=drive0                                     \
-device virtio-blk-pci,id=virtblk0,bus=pcie.1,drive=drive0,num-queues=4             \
-netdev tap,id=tap0,script=${IF_UP_SCRIPT},downscript=${IF_DOWN_SCRIPT}             \
-device virtio-net-pci,bus=pcie.2,netdev=tap0,mac=b8:3f:d2:1d:3e:f9

Issues
======
1. virtio-iommu isn't supported by QEMU. The guest kernel becomes stuck at IOMMU
probing time where the endpoint's capabilities is queried by sending request over
virtio device's vring and the response is expected to be fed by QEMU. The request
can't be seen by QEMU due to the wrong IOMMU address translation used in QEMU as
virtio-iommu provides a different IOMMU address translation operations to override
the platform one, leading the DMA address (in the shared space) can't be properly
recognized. The information has been shared to Jean.

2. 'reboot' command doesn't work in the guest. QEMU complains some registers aren't
accessible from QEMU. I didn't sorted out a workaround for this.

3. HMP command 'dump-guest-memory' causes QEMU to exit abnormally. The cause is the
realm is reconfigured when the VM is resumed after the guest memory is dumped. The
reconfiguration is rejected by the host, leading QEMU's abnormal exit. The fix would
be to avoid the reconfiguration on the realm. The issue was originally reported by
Fujitsu and all the information has been shared to Fujitsu.

4. In QEMU, the CPU property 'kvm-no-adjvtime' can't be set to off. Otherwise, QEMU
tries to access the timer registers, which have been hidden by the host. So we need
to take the parameter (for QEMU) to by pass it: "-cpu host,kvm-no-adjvtime=on".

5. I didn't try virtio-mem and memory balloon, which isn't expected to work, especially
when the guest memory is hot added or hot removed.

Thanks,
Gavin



