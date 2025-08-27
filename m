Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A49C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 08:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=itUnoaFqfbQDsJKy5iAP7CimhLmDmHDeVSdAY05Jcqk=; b=prct5nl6ENFaKuiQ7kvmcsGqE+
	tG9xYzwm+TCnIAmRgiO2uWzdWoLXSEcCXbkEDiZxXP7NyPWW8E3RpC+BJVL94V9dd7yzdCPi8D0W6
	CAEM+g5dyVOXqx7aOYvVdwozAHKaL6EaxEjxe2gY6y4rm/Oapwq8gFswEWkIgJ3Vgsl5oqQ/ruD7A
	08I5sYV0eohLex82cnJABNXN7rHge7sXm5FvysCxg1HnIOFbU0SmWvIraaqXGYcQhs3/7H1l/Sti6
	WSuKCjkDZ5zrgy5RECwx+dkpxdWv7L36OH5AK/odsgWXHkAJ8Xw7Emxh5SW5OjmUPwImTWMwdlNGH
	VSc1VbSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urBdT-0000000Egsy-1abE;
	Wed, 27 Aug 2025 08:36:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urBOu-0000000Edep-1C4f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 08:21:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756282857;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=itUnoaFqfbQDsJKy5iAP7CimhLmDmHDeVSdAY05Jcqk=;
	b=Y7hCds+EMd1x0Eey2CiYRZhhWDhaN5fpRYLn0Awp+VinadrYfdQCcJ55XUBFkSR4HO/jZt
	36qMpzW3YO/uFh0Au8IoZ8J51TG4A5L6f2jMlwXW3Wt/8Cp0ebsXAuT6zGS1LlyiSFT01p
	R+mnQ4m6YYTZgS1DnDiuOeBJZB64o14=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-m6RXjyYWMYmfYplwsCwFCw-1; Wed, 27 Aug 2025 04:20:56 -0400
X-MC-Unique: m6RXjyYWMYmfYplwsCwFCw-1
X-Mimecast-MFC-AGG-ID: m6RXjyYWMYmfYplwsCwFCw_1756282855
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-771d7aa1470so2706760b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 01:20:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756282855; x=1756887655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itUnoaFqfbQDsJKy5iAP7CimhLmDmHDeVSdAY05Jcqk=;
        b=tzvaUgMaT9im/fTi5fM6KfF2079LBjl2GgENfYjDGAfbjrW+ZhzD1Zwn7OzeesLuxI
         vE6BCCIRP6VHoHaY3/Qloywnw1a+PsB7sAmUM202mMnYHJfGQ6I2rBF02K5koCM6eLUh
         Hcngv1PMpjODDLThnrrF6R+Pqf5tgK+8t1b1o9fBR0UGegRg8JlS6CdA4AUV5dNmzCBf
         cLh4brSMuWaKUwKFbB2u1NVb8uGitM2j7QAXDlyqkhAFA71aNb1waJUAiI1ybr6iJg2U
         x00aKyMnXTGKAtNJzb3vTc2q5sEu3vSIvLU62eMmmgw2aB19DdypGdJVRVR2QmV5VsQy
         Vx2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVM7jJx+eHtGcfEMhtfQgtVLveri49k9oGO8It8txjms3577mrCMnQCngxZA8pbIfbdWrjBCVhK/51YYWXeEwL/@lists.infradead.org
X-Gm-Message-State: AOJu0YwQaow8pXtTCZyDC8sDlhWnoiAUB6W95wNbcBMKG88VaXGvGQGc
	e8MHIKjGvVOc7ZrmaBI7YxgX12IOY0PN4vkC1479zz5ai+9B1lCp0gHOhzGl7/6nreb9cogDjv+
	XD2AW3aMaMcVZY0KofGd0z+Pef3H0nmEFb7yG4Qwy4CSGOKkQiDVAdx3d5OM+lGo/l6C1y8/H8t
	jO
X-Gm-Gg: ASbGncu566hCykA13bzWTkZ10G4Knjd9YEiZeATDfd8SKvpc/UpUxvjkDeOMSSLVtBB
	QhwqQu+0kcGknCFyGXq4BZlfbiCJvaJfKh6pPBe6Ifj1XAnDgjRH0OwsWHKZPK5CwqO3pj16Bmn
	RRiVCwTKYrl+gymeXFmk7poXsENY7gAN6vpTQ9uBPFZD1E3JBVbgpQwzqsWXu7JRolLqUqHJPt1
	+QTen6Pzw7Y4oMkUpVKOt+JeZYVGZ+geXmysVIZD9dtytzgnXt4snNI2SH+u1+Bqws7ytwDdZft
	rkWtYKnDBVTu4ufLeiBGvuyEnQlkHts=
X-Received: by 2002:a05:6a20:3949:b0:240:10d2:add2 with SMTP id adf61e73a8af0-24340d0244amr27008077637.31.1756282855133;
        Wed, 27 Aug 2025 01:20:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2FJN8dt6Gdj10YjTZnHD4mWZmsq42NC+Hy4iGGo/P8vtVLMd8cGd0cyzQQ5JOahSfz6NXfg==
X-Received: by 2002:a05:6a20:3949:b0:240:10d2:add2 with SMTP id adf61e73a8af0-24340d0244amr27008051637.31.1756282854686;
        Wed, 27 Aug 2025 01:20:54 -0700 (PDT)
Received: from localhost ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7720c63d660sm644421b3a.71.2025.08.27.01.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 01:20:54 -0700 (PDT)
Date: Wed, 27 Aug 2025 16:17:28 +0800
From: Coiby Xu <coxu@redhat.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org, kexec@lists.infradead.org, 
	jbastian@redhat.com, cmirabil@redhat.com
Subject: Re: [Regression] kdump fails to get DHCP address unless booting with
 pci=nomsi or without nr_cpus=1
Message-ID: <r3k7yvv3ezpmudnmqphlpx56lvd43gabqcaewucwfzsgcwopml@s7zm2cmeifug>
References: <878qjq80yu.ffs@tglx>
 <86v7mt9ai3.wl-maz@kernel.org>
 <i2l2ujhqjd6akzosvzj4njv2vemsfuvywz4gsnj2nwo3fwyjyz@cfhekxpartf2>
 <86ms84974v.wl-maz@kernel.org>
 <gec2yl5wx6vvt67smx5emhcoifvtp4orw6sub24b2nrqwryhp2@i4h7qbtwjo3r>
 <86ldno8yxa.wl-maz@kernel.org>
 <yweverlt7onyse3rbm7phxzwrwfk4pq2dipzdjenrx4onrak6r@dsm4ra3x3gv6>
 <j4atkwhumotioe2nhu6esrb3yrvwsoz2eyqeopwmr7o6iw65ga@wdkvgahnyhln>
 <87qzx6jrql.wl-maz@kernel.org>
 <p7aa2fcm3g32ydulq3nqrvsg57tyvt5ro5cs3oqrdahxesoroj@tqpulky4drlo>
MIME-Version: 1.0
In-Reply-To: <p7aa2fcm3g32ydulq3nqrvsg57tyvt5ro5cs3oqrdahxesoroj@tqpulky4drlo>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OZAei5ioPvJeay-5rQk1c70LjbJ6n61NNNUzHLhf7vM_1756282855
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_012100_392908_08AF974F 
X-CRM114-Status: GOOD (  26.19  )
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

On Sat, Aug 23, 2025 at 11:00:11AM +0800, Coiby Xu wrote:
>Hi Marc,
>
>If I understand correctly, you want to reproduce the issue by yourself.
>Then finally I manage to reproduce this issue by playing with the setup
>shared by my collogue. Here are the five prerequisites to reproduce the
>bug,

Hi Marc,

It turns out host kernel and host machine are not absolute prerequisites to
reproduce the problem. But they matter because they can make it much
more difficult to reproduce this problem. I also did a bisection against
QEMU to find out which commit make the issue gone. For details, please
check following inline comments.

>
>1. Guest kernel    Newer than commit b5712bf89b4b 
>("irqchip/gic-v3-its: Provide MSI parent for PCI/MSI[-X]")
>
>2. Host kernel
>   Relatively older ones like v6.10.0. Newer ones like v6.12.0 and
>   v6.17.0 don't have this issue.

It turns out with other conditions met, the latest host kernel
(6.17.0-0.rc3) can still reproduce the issue but it's much more
difficult to reproduce it. For example, with RHEL8 kernel
4.18.0-372.9.1.el8.aarch64, I need to trigger kernel crash for 3
times at maximum to reproduce it. But for Fedora rawhide kernel
6.17.0-0.rc3.31.fc43.aarch64, 3/10 times I can't reproduce this issue
after triggering kernel crash for 60 consecutive times. For a
comparison, I've listed the times of triggering kernel crash to reproduce
the issue in 10 trials,

RHEL8:           2  1  1  1  1  1  2  1  3  2
Fedora rawhide: 43 60 47 60 12 56 60 45 49 18

>
>3. QEMU <= v6.2

I did a bisection and it shows the issue is gone with QEMU commit
f39b7d2b96e3e73c01bb678cd096f7baf0b9ab39 ("kvm: Atomic memslot updates")
which is last/3rd patch of patch set "KVM: allow listener to stop all
vcpus before"
https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg02172.html
Note this commit shows in QEMU > 7.2 so QEMU <= v7.2.0 can also
reproduce this issue.

>
>4. Specific host machines    I'm not familiar with the hardware so 
>currently I haven't figured out
>   what hardware factor makes the issue reproducible. I've attached
>   dmidecode outputs of four machines (files inside indmidecode_host folder).
>   Two systems (dmidecode_not_work*) can reproduce this issue and the
>   other two systems (dmidecode_work*) can't despite all have the same
>   product name R152-P31-00, CPU model ARMv8 (M128-30) and SKU
>   01234567890123456789AB. One difference that doesn't seem to found in
>   the dmidecode output is the two machines that can't reproduce the issue
>   have the model name "PnP device PNP0c02" where the problematic
>   machines have "R152-P31-00 (01234567890123456789AB)" according to our
>   internal web pages that show the hardware info.

It turns out all four machines can reproduce the issue. I tried to
reproduce this issue for 10 times and counted the times to trigger
kernel crash and here's a comparison

R152-P31-00:        2  1 1  1  1  1 2 1  3 2 
PnP device PNP0c02: 8  3 5 15 11 18 2 5 12 4 

>
>5. The Guest needs to be bridged to a physical host interface.    
>Bridging the guest to tun interface can't reproduce the issue (for
>   example, the default bridge (virbr0) created by libvirtd uses tun
>   interface)

I tried triggering kernel crash for 100 consecutive times for virbr0 in
one trial but can't reproduce it. So I think bridging the guest to a
physical network interface is still a must.


[...]


-- 
Best regards,
Coiby


