Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 249D6109E52F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 00:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ls8wjcbdyWhGqHWxekvGDwcUF0lyag9U62sJrXk3qX0=; b=Z5tS3/knpN0LIQsf2+jgHut0Pe
	bemx4KaTMoVdZdrngVpd9MdOE+A8hQF3Vx0YV4n5mENUXc2Hg0Ch9CutJz3gciLDMtzzfMZ4zwYBE
	03vU2ZEhPNrUYO25ttHUmMP2zQLxPyvoP90WVmkq7B5LR0cGEgrrpT/rOASDczQ601rY/rm41gLeP
	zHXl0hvG+tQbjYoTwOcnxdRsvYPeFW91nTwqJU+tqswPPqua4jfCu43kJFNpL0b/6+/QEP0GUXWsA
	Qngw+dyVph9+zrrZxg2H4OvXl02kwI20Ck+2K6AfAolOQkzyZ8cwVWHxVoRM2MDO7Mgp4kGH+C1kS
	VDc/+3Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5YuF-00000004UU9-12zs;
	Thu, 26 Mar 2026 00:49:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5YuB-00000004UTk-2QKv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 00:49:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774486137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ls8wjcbdyWhGqHWxekvGDwcUF0lyag9U62sJrXk3qX0=;
	b=QcGK7cXqc5HI1fLf0YxeZVuHTmOdfJexf+Hq+vpKjRwIpmUU1HAHkE/0Yg2BUGWwR3xj4t
	/KAnI7BOY2pCxw+2/UVeppyhBJDF5BKsfYheQlPA9xg5GXr3Etm8shnUsXnBuLXQ8XjyC2
	8xJaV1sNSlALpmAj1jJx0NP+zSr1rN8=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-HCdZKCQsM-yD4R2iqjMOHQ-1; Wed, 25 Mar 2026 20:48:55 -0400
X-MC-Unique: HCdZKCQsM-yD4R2iqjMOHQ-1
X-Mimecast-MFC-AGG-ID: HCdZKCQsM-yD4R2iqjMOHQ_1774486134
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2adef9d486bso7324795ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 17:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774486134; x=1775090934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ls8wjcbdyWhGqHWxekvGDwcUF0lyag9U62sJrXk3qX0=;
        b=ls6m3JqxKuDdi4aQVKo2PSC3rgwKSW0qKcxODQgPz8/I+7/HhyqKc/VfvNsViM9kgI
         lqTKNshL89G5Zr11veNVMYg5Km7C/2PPp2w/qwXfl2ijiVOK8PQoOBR9QnD4NyGLTAs1
         yD025rVWD33wTtMIIUP4IzJSUZzwhkQSAePOO9CtJRtiNLx6O37Mt0smEHstyBe1lnxq
         AmO9iX1dj4h8F4P2LeSdk5/nwePehOIFBmztjL5elYaPV71W8RRNq6Cp04uQkaIwBik8
         BhN6tRSpy/ipaQR4atPgh/9N+cJhIW74OrN39EUst6UZX4I0tazN2FHbjfBpkEZYg6Ou
         6EDw==
X-Forwarded-Encrypted: i=1; AJvYcCVylPxjs5xWPXGGIYPAmh3Acdo8XEJwCEPX0mWDE37jhyHijJENj7P6q7eoSwMwHt6EuUuECQjtluqoWhLbhltC@lists.infradead.org
X-Gm-Message-State: AOJu0Yxy3lRnGhmE43DaQUEyATdpoZsMn9j5XWTQ4OmxITJWbloUMOKL
	HniWxPpf58LJw+pK8tL4m5iNM6uX1sS77MBkddfTa0z66E0M1KvSDgRYNTq+qVu75mWjIVjxSm2
	qQ4M8Jre8UcUGyyPWI8zruAcSbzOwQOPaxsH/Kx+3X3zJLFOFmlnkP2xn4epCGqT29xuAbD7Iqh
	7x
X-Gm-Gg: ATEYQzw8OmlsS4eBbJq9pCHE4clwohhMu/2MN1aNdRu3ge88gqzuxmuea30tqlJKg6r
	GWyU91vOGnMQXc1DRMXp683/WDz3+LVTn+9Cq28HQ/+CdLoFfzLJQBe/cmOc9fSDDu6Osk4+0X3
	5Yxl3qeNFly+LSUwYm1QbOr6z/AO7LS3tI+E4ymZXPsZFEtap7k6xipIzp2TbupYz64CFrISXDw
	KBnjIcmvOXEx12MLtzbrA5MWzo7eQi3kJv9u5swd/cZD8kodYviRtUYOWyI9pT9aIElzRmsPN3E
	a/DQf+fHAF9IXCUAtUv5qsBvWc1jqZpKm0H3dhoAEZ+MBlxbs+VB/iWSHmOXpFfTqn7JerkHuVo
	iFUWaLlwpLnvdHx0JbHeY/novVW4tkxeGaztwHJw7eLJDx0ntzh5rKtYxes/d8XWv
X-Received: by 2002:a17:902:da91:b0:2b0:6e4a:1c1c with SMTP id d9443c01a7336-2b0b0a1554dmr62523295ad.19.1774486134082;
        Wed, 25 Mar 2026 17:48:54 -0700 (PDT)
X-Received: by 2002:a17:902:da91:b0:2b0:6e4a:1c1c with SMTP id d9443c01a7336-2b0b0a1554dmr62522885ad.19.1774486133511;
        Wed, 25 Mar 2026 17:48:53 -0700 (PDT)
Received: from [192.168.68.51] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc76b6casm11221805ad.16.2026.03.25.17.48.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 17:48:52 -0700 (PDT)
Message-ID: <807b844c-32f6-4094-8c24-15d7eb1d3638@redhat.com>
Date: Thu, 26 Mar 2026 10:48:41 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/48] arm64: Support for Arm CCA in KVM
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Steven Price <steven.price@arm.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Emi Kisanuki <fj0570is@fujitsu.com>, Vishal Annapurve <vannapurve@google.com>
References: <20260318155413.793430-1-steven.price@arm.com>
 <abyAbPIkDn2bGZwd@p14s> <37bc1222-6fc7-48f0-94d3-6eaac420aa55@arm.com>
 <0b7121e7-3c74-4303-a200-01d2b7c535ce@redhat.com>
 <9247d9ea-64b4-4e8e-81f8-3c8e00750acf@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <9247d9ea-64b4-4e8e-81f8-3c8e00750acf@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: j8wDUpjQ4HIoj7SDLAN-CX5GSu3GfN4e_HWTWKGgkDk_1774486134
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_174859_692010_10577634 
X-CRM114-Status: GOOD (  19.66  )
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

On 3/25/26 8:16 PM, Suzuki K Poulose wrote:
> On 25/03/2026 06:37, Gavin Shan wrote:
>> On 3/21/26 2:45 AM, Steven Price wrote:

[...]

>>
>> In upstream TF-A repository [1], I don't see the config option 'RMM_V1_COMPAT'.
>> would it be something else?
>>
>> [1] git@github.com:ARM-software/arm-trusted-firmware.git    (branch: master)
>>
> 
> suzuki@ewhatever:trusted-firmware-a$ git grep RMM_V1_COMPAT
> Makefile:       RMM_V1_COMPAT \
> Makefile:       RMM_V1_COMPAT \
> docs/getting_started/build-options.rst:-  ``RMM_V1_COMPAT``: Boolean flag to enable support for RMM v1.x compatibility
> include/services/rmmd_svc.h:#if RMM_V1_COMPAT
> include/services/rmmd_svc.h:#endif /* RMM_V1_COMPAT */
> make_helpers/defaults.mk:RMM_V1_COMPAT                  := 1
> services/std_svc/rmmd/rmmd_main.c:#if RMM_V1_COMPAT
> services/std_svc/rmmd/rmmd_main.c:#if RMM_V1_COMPAT
> services/std_svc/rmmd/rmmd_main.c:#if !RMM_V1_COMPAT
> services/std_svc/rmmd/rmmd_main.c:#if RMM_V1_COMPAT
> services/std_svc/rmmd/rmmd_main.c:#if RMM_V1_COMPAT
> services/std_svc/rmmd/rmmd_main.c:#if RMM_V1_COMPAT
> services/std_svc/rmmd/rmmd_rmm_lfa.c:#if RMM_V1_COMPAT
> services/std_svc/rmmd/rmmd_rmm_lfa.c:#if RMM_V1_COMPAT
> services/std_svc/rmmd/rmmd_rmm_lfa.c:#if RMM_V1_COMPAT
> services/std_svc/rmmd/rmmd_rmm_lfa.c:#if RMM_V1_COMPAT
> suzuki@ewhatever:trusted-firmware-a$ git log --oneline -1
> 8dae0862c (HEAD, origin/master, origin/integration, origin/HEAD) Merge changes from topic "qti_lemans_evk" into integration
> suzuki@ewhatever:trusted-firmware-a$ git remote get-url origin
> https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git
> 

Thanks for the details. It turned out that I used the wrong TF-A repository. In
the proposed repository, I'm able to see the option 'RMM_V1_COMPAT' and the EL3-RMM
interface compatible issue disappears. However, there are more issues popped up.

I build everything manually where the host is emulated by QEMU instead of shrinkwrap
and FVP model. It's used to work well before. Maybe it's time to switch to shinkwrap
and FVP model since device assignment (DA) isn't supported by an emulated host
by QEMU and shrinkwrap and FVP model seems the only option. I need to learn how
to do that later.

There are two issues I can see with the following combinations. Details are provided
like below.

     QEMU:      https://git.qemu.org/git/qemu.git                            (branch: stable-9.2)
     TF-RMM:    https://git.trustedfirmware.org/TF-RMM/tf-rmm.git            (branch: topics/rmm-v2.0-poc)
     EDK2:      git@github.com:tianocore/edk2.git                            (tag:    edk2-stable202411)
     TF-A:      https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git  (branch: master)
     HOST:      https://git.gitlab.arm.com/linux-arm/linux-cca.git           (branch: cca-host/v13)
     BUILDROOT: https://github.com/buildroot/buildroot                       (branch: master)
     KVMTOOL:   https://gitlab.arm.com/linux-arm/kvmtool-cca                 (branch: cca/v11)
     GUEST:     https://github.com/torvalds/linux.git                        (branch: master)

(1) The emulated host is started by the following command lines.

     sudo /home/gshan/sandbox/cca/host/qemu/build/qemu-system-aarch64                  \
     -M virt,virtualization=on,secure=on,gic-version=3,acpi=off                        \
     -cpu max,x-rme=on -m 8G -smp 8                                                    \
     -serial mon:stdio -monitor none -nographic -nodefaults                            \
     -bios /home/gshan/sandbox/cca/host/tf-a/flash.bin                                 \
     -kernel /home/gshan/sandbox/cca/host/linux/arch/arm64/boot/Image                  \
     -initrd /home/gshan/sandbox/cca/host/buildroot/output/images/rootfs.cpio.xz       \
     -device pcie-root-port,bus=pcie.0,chassis=1,id=pcie.1                             \
     -device pcie-root-port,bus=pcie.0,chassis=2,id=pcie.2                             \
     -device pcie-root-port,bus=pcie.0,chassis=3,id=pcie.3                             \
     -device pcie-root-port,bus=pcie.0,chassis=4,id=pcie.4                             \
     -device virtio-9p-device,fsdev=shr0,mount_tag=shr0                                \
     -fsdev local,security_model=none,path=/home/gshan/sandbox/cca/guest,id=shr0       \
     -netdev tap,id=tap1,script=/etc/qemu-ifup-gshan,downscript=/etc/qemu-ifdown-gshan \
     -device virtio-net-pci,bus=pcie.2,netdev=tap1,mac=b8:3f:d2:1d:3e:f1

(2) Issue-1: TF-RMM complains about the root complex list is invalid. This error is
     raised in TF-RMM::setup_root_complex_list() where the error code is still set to
     0 (SUCCESS) in this failing case. The TF-RMM initialization is terminated early,
     but TF-A still thinks the initialization has been completely done.

     INFO:    BL31: Initializing RMM
     INFO:    RMM init start.
     RMM EL3 compat memory reservation enabled.
     Dynamic VA pool base address: 0xc0000000
     Reserved 20 pages. Remaining: 3615 pages
     Reserve mem: 20 pages at PA: 0x401f2000 (alignment 0x1000)
     Static Low VA initialized. xlat tables allocated: 20 used: 7
     Reserved 514 pages. Remaining: 3101 pages
     Reserve mem: 514 pages at PA: 0x40206000 (alignment 0x1000)
     Dynamic Low VA initialized. xlat tables allocated: 514 used: 514
     Invalid: Root Complex list                                         <<<<< ERROR
     INFO:    RMM init end.

(3) Issue-2: The host kernel gets stuck in rmi_check_version() where SMC_RMI_VERSION
     is issued to TF-A, but it can't be forwarded to TF-RMM because its initialization
     isn't completely done (issue-1).

     [   37.438253] Unpacking initramfs...
     [   37.563460] kvm [1]: nv: 570 coarse grained trap handlers
     [   37.581139] kvm [1]: nv: 664 fine grained trap handlers
     <... system becomes stuck here ...>

So my workaround is to skip fetching root complex list from the EL3-RMM manifest data
in TF-RMM::setup_root_complex_list() since it's not provided for the qemu platform by
TF-A. With this workaround, the host can boot up into shell prompt and the guest can
be started by kvmtool.

     host$ uname -r
     7.0.0-rc1-gavin-gd62aa44b2590
     host$ lkvm run --realm -c 2 -m 256                   \
           -k /mnt/linux/arch/arm64/boot/Image            \
           -i /mnt/buildroot/output/images/rootfs.cpio.xz
           -p earlycon=uart,mmio,0x101000000
     Info: # lkvm run -k /mnt/linux/arch/arm64/boot/Image -m 256 -c 2 --name guest-163
     Info: Enabling Guest memfd for confidential guest
     Warning: The maximum recommended amount of VCPUs is 1
     [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x000f0510]
     [    0.000000] Linux version 7.0.0-rc2-gavin-g0031c06807cf (gshan@nvidia-grace-hopper-01.khw.eng.bos2.dc.redhat.com) (gcc (GCC) 14.3.1 20251022 (Red Hat 14.3.1-4), GNU ld version 2.41-64.el10) #2 SMP PREEMPT Wed Mar 25 20:28:05 EDT 2026
     [    0.000000] KASLR enabled
          :
     [  267.578060] Freeing initrd memory: 4728K
     [  267.921865] Warning: unable to open an initial console.
     [  270.327960] Freeing unused kernel memory: 1792K
     [  270.669368] Run /init as init process

Thanks,
Gavin


