Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1604BC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 10:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22nzGWHZvbYaZQRZMdCHmym8UvnMl7KxB4uEGF5YMj8=; b=eGRzvnDw2/Nv3YsO96mHeA/KPF
	AOdYr9PYBR0F1qZq6swzadVrDvBXLiUeL9Gm8LkEW7Rlw/CYnwscch3/+ybf0tO7Pr+ECPh++3YLP
	wmQ/Qx2bddis2/Asfm+ckkMX7sdH+f5XYxFDNEC9xotNJOuno5JAc6AfebGhTz7kikAykEAKQm7Nn
	xtQ4kMFZkrK8p2zAxkPVfIDucc0kb8xUwftTwWqigjgMW0EM4ugVNa3VO1+CTQW6ytz7k23dyWgGx
	9yykeR6s6V07NTfe3uJOzS//E8rB33BiTPGbF6eZYPtj5rjOEnNdiPKI/X9xcU1EVetuyo4t1GHqS
	BHd/tgMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN7oo-0000000FFGk-3ccr;
	Thu, 05 Jun 2025 10:27:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN7md-0000000FF08-1s3F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 10:25:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DD85F5C5753;
	Thu,  5 Jun 2025 10:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA39C4CEE7;
	Thu,  5 Jun 2025 10:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749119114;
	bh=YdJvMMxNeJZ4ws+mkLoEmNugy4D3YfkKWs3ds4JIL/4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=f4PPodmGDavBEPsrZH6CTP09Oz6VdO24835qnpwrQF7qR5Ng57NXXpxvd9Fe6yCJ9
	 ZWQs9LT6MR03KUhBwDM+qyCAhlW/qA9J50X9SLcQs4lViFsNGn8mbG7/ExG/rpwBvF
	 HetZqNnqNbBtJYhDcKMwRW5OX0z+RL+shCvGmS6oFnEJpeivlSVd5GGzTMRj/wbffB
	 CNU3TYc10Nm6vaNPxFg7B03NQ9Jx816OJyV79UqJ14fSJ1ef36k/DxAvFNmruTRIuV
	 f696TTLTlqadTX1aCP2YtcxX3zueLEj39X9pXWt/9ttLekYbtlJqC2HjFb8K4Y7JTj
	 98dbQqEkzkQ4w==
Message-ID: <dafd58ae-0a08-4fe6-b94d-c8c6c8c1fa97@kernel.org>
Date: Thu, 5 Jun 2025 12:25:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sven Peter <sven@kernel.org>
Subject: Re: [BUG] rmmod i2c-pasemi-platform causing kernel crash on Apple M1.
To: =?UTF-8?B?56iL5YeM6aOe?= <chenglingfei22s@ict.ac.cn>, j@jannau.net,
 alyssa@rosenzweig.io, neal@gompa.dev
Cc: zhangzhenwei22b@ict.ac.cn, wangzhe12@ict.ac.cn, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 naveen@kernel.org, andi.shyti@kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <5c598fea.3165d.1973e0a9a3a.Coremail.chenglingfei22s@ict.ac.cn>
Content-Language: en-US
In-Reply-To: <5c598fea.3165d.1973e0a9a3a.Coremail.chenglingfei22s@ict.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_032515_577786_6276D3C0 
X-CRM114-Status: GOOD (  21.97  )
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

Hi,

On 05.06.25 05:02, 程凌飞 wrote:
> Hi, all!
> 
> We’ve encountered a kernel crash when running rmmod i2c-pasemi-platform on a Mac Mini M1 (T8103) running Asahi Arch Linux.
> 
> The bug was first found on the Linux v6.6, which is built manually with the Asahi given config to run our services.
> At that time, the i2c-pasemi-platform was i2c-apple.
> 
> We noticed in the Linux v6.7, the pasemi is splitted into two separate modules, one of which is i2c-pasemi-platform.
> Therefore, we built Linux v6.14.6 and tried to rmmod i2c-pasemi-platform again, the crash still exists. Moreover, we fetched
> the latest i2c-pasemi-platform on linux-next(911483b25612c8bc32a706ba940738cc43299496) and asahi, built them and
> tested again with Linux v6.14.6, but the crash remains.
> 
> Because kexec is not supported and will never be fully supported on Apple Silicon platforms due to hardware and firmware
> design constraints, we can not record the panic logs through kdump.

Do you have UART connected to a device under test which you could use to 
grab the panic log from the kernel? Alternatively you can also run the 
kernel under m1n1's hypervisor and grab the log that way. It'll emulate 
the serial port and redirect its output via USB.

> 
> Thus we tried to find the root cause of the issue manually. When we perform rmmod, the kernel performs device releasing on
> the i2c bus, then calls the remove function in snd-soc-cs42l83-i2c, which calls the cs42l42_common_remove in cs42l42,
> because cs42l42-&gt;init_done is true, it performs regmap_write, and finally calls into pasemi_smb_waitready in i2c-pasemi
> -core.c. We noticed that smbus-&gt;use_irq is true, and after it calls into wait_for_completion_timeout, the system crashs!>
> We found that wait_for_completion_timeout is one of the core scheduler APIs used by tens of thousands of other drivers,
> it is unlikely causing the crash. So we tried to remove the call to wait_for_completion_timeout, then the system seems to
> run well.
> 
> However, because we have little knowledge about i2c devices and specifications, we are not sure whether this change will
> cause other potential harms for the system and device. Is this call to wait necesary here? Or can you give a more
> sophisticated fix?

Yes, that call is necessary. It waits for the "transfer completed" 
interrupt from the hardware. Without it the driver will try to read data 
before it's available and you'll see corruption. I'm surprised hardware 
attached to i2c (usb pd controller and audio I think) works at all with 
that change.


Sven


