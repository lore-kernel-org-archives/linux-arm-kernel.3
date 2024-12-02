Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04ADD78303
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 10:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l5aWGXl+Mmlx1+Ly+ZtHQ3BQuMifP5arQ43M6MMtklc=; b=Y3AQcHNml6ejKMG+JKxqw1dbE/
	QtZ9ZGohee2EjloNk1lJMoMsI7/uDsmo/EGu91UnKlKDaep+KnVVvqfTry/ZgszdmK2NhglJo7qoB
	cxy2F8hFx+aAtZ7HYhxKpvLqLQw1UvVXhCmiyBEMWcd+qJX0S8/5VG0xxUn8+V74y4V152k/BPBv9
	9+VmcUHRscHxZmztQ21LeY1fQcnQURlBU66brFF4GUwWgeAcR4onOU5cLivsUedjr55Ij5Fgsq+rN
	TNFAPNqY5NsEMSdt5Rkc/qoK//qk+IGTmIgnNSXagjqLbtHoc/6CX02ORyBbdQQHMlHbnt2Gc1DT6
	AJwT4qiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI3e4-00000005izV-2FIw;
	Mon, 02 Dec 2024 10:27:12 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI3d5-00000005it1-23Wu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 10:26:12 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4349fd77b33so32426305e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 02:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733135169; x=1733739969; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l5aWGXl+Mmlx1+Ly+ZtHQ3BQuMifP5arQ43M6MMtklc=;
        b=J5DIWZAYM1OkbA6mQbkdPCHDDZTrGvK2fJSdOuOBNrNBx3Czmm/HzpljCXJwJaPdy+
         esSjesaP8AKziyJIN53qlSydkvTLy7P0WPZd7b0YtTJwPDTOYPOIem2UNL/OUXaQ9tNA
         wMW8KdMM7/+kDkxhfby0kuuxPEp4OnFt5zUTNY+kpH5/Dyr8KyO5yk6DPQS/EXaewq9J
         9AYvpF/wmAgB7sglDPWmKiRi7FAzcn4DuRRMbDRqRHqtJ3cxX+Us9op1PMpKXfv5kA8j
         0W20NbsHIVr/L5Kf9GyuSLKhl/HeRTVs7yiXRYZEnb9yQs7ZiuZ4wRm+Xoc2CbeTW5xN
         TdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733135169; x=1733739969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l5aWGXl+Mmlx1+Ly+ZtHQ3BQuMifP5arQ43M6MMtklc=;
        b=EelV8bMNJiBVVQ88v80TytYjzQG4r8BUyQyiuf3Mb8bhy8GisBXqGwp1DbbFud2n7Z
         NmOcHIPMbEiC/mhbhcBBqjRAITBz9mpYQQjcEU/iA5gy2dgAbglFZ3/xESiAurPKB9oR
         yci9zSb8JqdXP/KO3VZwaJQ0zR56MsQoE0xEhpAilT0TUHpuAacKHjbl/s/vabCFpvAO
         OUF3nv5jVCXPfA3tg9Y4xFC2ILifIVuQpP317G/Cz7RWn7s22q/2NN0IFusZfPSOs3kN
         TzH2xvo1N6k/fst58acRGRHoRnR/rKAHPxemWaOLqQ6Y0pHZh1G6rEPzvIuDB700bCQT
         onVg==
X-Forwarded-Encrypted: i=1; AJvYcCXmV9kwbHmZD9QVsZKwDacZYu252W1Hpoz/j5Kldl8COSWABqV6KLksNPidO4aeUjoY9fnLgQtcWB0HFQ3uH/vb@lists.infradead.org
X-Gm-Message-State: AOJu0YwIXZYXR9NAann37uJRxu6DT8teqG9QVrhLoFKLGhgjN52Np29D
	QzJRx8z96EN4hK3cclyhtOdbgPy44+2zPIsoaEA6OwVgolb+ZxsmARkA112rsb4=
X-Gm-Gg: ASbGncsqnhT7rAMohQB7r5cos40toIYzSpzahV4o20p/njUXz62Yn3SIXiePGWDxjEk
	qUggejHDK5ztc5fEzVt3gY7DIf/RFYcMjrAFtgKJlP8XmHhtZLG2swdjjN7/0VsnutEjKjEcsyd
	tV3Ecow4udhgCSMqYCNTNkfXQ+XYYTwISXB6p21oscm5OSykSc7hFmzoGBJydn3XoOQYgDE31S9
	v0cvmA9F1ueRtdtMB2Xsr5HD0D7Om++RG+yxADvBG2A5GQk
X-Google-Smtp-Source: AGHT+IG8bGb9k6ogXkDyTn1lVDUam0rrds2nfPCjABZzTJXZMxXF7ulluPar4hnOqOBRYveY9u3LOQ==
X-Received: by 2002:a05:600c:1d18:b0:426:8884:2c58 with SMTP id 5b1f17b1804b1-434a9dbbcc7mr211036535e9.4.1733135169207;
        Mon, 02 Dec 2024 02:26:09 -0800 (PST)
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e4a54b71sm6444957f8f.79.2024.12.02.02.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 02:26:08 -0800 (PST)
Date: Mon, 2 Dec 2024 10:26:32 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Steven Price <steven.price@arm.com>
Cc: Itaru Kitayama <itaru.kitayama@linux.dev>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
Subject: Re: [PATCH v5 00/43] arm64: Support for Arm CCA in KVM
Message-ID: <20241202102632.GB1704077@myrica>
References: <20241004152804.72508-1-steven.price@arm.com>
 <Z01BYOgsLXV5yULk@vm3>
 <01205247-ffcd-439f-b00f-d8e70720d049@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01205247-ffcd-439f-b00f-d8e70720d049@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_022611_529705_9A8830AC 
X-CRM114-Status: GOOD (  26.95  )
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

On Mon, Dec 02, 2024 at 08:54:11AM +0000, Steven Price wrote:
> Hi Itaru,
> 
> On 02/12/2024 05:10, Itaru Kitayama wrote:
> > On Fri, Oct 04, 2024 at 04:27:21PM +0100, Steven Price wrote:
> >> This series adds support for running protected VMs using KVM under the
> >> Arm Confidential Compute Architecture (CCA).
> ...
> > 
> > On FVP, the v5+v7 kernel is unable to execute virt-manager:
> > 
> > Starting install...
> > Allocating 'test9.qcow2'                                    |    0 B  00:00 ...
> > Removing disk 'test9.qcow2'                                 |    0 B  00:00
> > ERROR    internal error: process exited while connecting to monitor: 2024-12-04T18:56:11.646168Z qemu-system-aarch64: -accel kvm: ioctl(KVM_CREATE_VM) failed: Invalid argument
> > 2024-12-04T18:56:11.646520Z qemu-system-aarch64: -accel kvm: failed to initialize kvm: Invalid argument
> > Domain installation does not appear to have been successful.
> 
> Can you check that the kernel has detected the RMM being available, you
> should have a message like below when the host kernel is booting:
> 
> kvm [1]: RMI ABI version 1.0
> 
> My guess is that you've got mismatched versions of the RMM and TF-A. The
> interface between those two components isn't stable and there were
> breaking changes fairly recently. And obviously if the RMM hasn't
> initialised successfully then confidential VMs won't be available.
> 
> > Below is my virt-manager options:
> > 
> > virt-install --machine=virt --arch=aarch64 --name=test9 --memory=2048 --vcpu=1 --nographic --check all=off --features acpi=off --virt-type kvm --boot kernel=Image-cca,initrd=rootfs.cpio,kernel_args='earlycon console=ttyAMA0 rdinit=/sbin/init rw root=/dev/vda acpi=off' --qemu-commandline='-M virt,confidential-guest-support=rme0,gic-version=3 -cpu host -object rme-guest,id=rme0 -nodefaults' --disk size=4 --import --osinfo detect=on,require=off
> > 
> > Userland is Ubuntu 24.10, the VMM is Linaro's cca/2024-11-20:
> > 
> > https://git.codelinaro.org/linaro/dcap/qemu/-/tree/cca/2024-11-20?ref_type=heads

Indeed, QEMU branch 2024-11-20 has to be used with an older version of the
KVM patch and older RMM. For KVM v5+v7 you need the most recent QEMU
branch, confusingly called cca/v3 (because it's the third patch series).

Thanks,
Jean

> 
> I don't think this is the latest QEMU tree, Jean-Philippe posted an
> update last week:
> 
> https://lore.kernel.org/qemu-devel/20241125195626.856992-2-jean-philippe@linaro.org/
> 
> I'm not sure if there were any important updates there, but there are
> detailed instructions that might help.
> 
> Regards,
> Steve
> 

