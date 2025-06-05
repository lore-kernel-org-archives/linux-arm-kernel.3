Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDF9C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 14:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5uK2i3PQtgjLrrWFtuaofjfiE8UiJnHn2HsiWlBHcI=; b=EQZuzA/Qta+tTjIQ2F6B5OtuFb
	IIe27dirghjXXTfQ2F7nPouMReOCNlKCfveldBFFEGboxkyrZNdhsl8BArt+ZtEvYyxwtklDBBC5A
	Id6prQwCt5jTxQ51JY0vJVJDaCptXuYvyTtpNAFbfIwXfUGWfjjWdmPBrD7FkqNosgoy0tnpIn4nT
	ez59Lyrvc0LRWeakYeXfz/N7K9ZLcvuLNxaoliiGdfgsPPYEoDJcXkKC8n+752eDPm3vfVN8N/5Kp
	prdYk0VNShv1G6kHIyUdQyW68RpaoKkFnCL5MOqQ97EseTt7jePdFwO/CCETd7+34yaoZ8IyRsgk+
	Kgs/NtTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNBNj-0000000FkSn-3Unr;
	Thu, 05 Jun 2025 14:15:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNBB3-0000000FivA-3O1r
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 14:02:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4DC8B5C67BB;
	Thu,  5 Jun 2025 14:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C7D4C4CEE7;
	Thu,  5 Jun 2025 14:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749132160;
	bh=iat9T/bPiMblSlK8d+zjpseMEDTU2L2gOx5NeoRkbMg=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=gu1SckNE3ydDy4+TPJ5hb90KWEtEJL7UQ4YxDNMsCyoErspywvpPZflGF86/Lds8N
	 2CepgkWnmX/C16+jg8uf0zefUHcv5auHG6x2dW5P6PhyMoiB+q5pH51bhoHvYgkb9v
	 tGsLt46b1Jqd/jhpUJI3Jl7q9DCtRCN9yDpqIAviHRmN0ab4xzWs1PixjB96Z5INAT
	 ZsejwGMdmWfHwMfA8LlF1ebjHAbcdqooW1LTqAD6Jxf9E0b70Sk2n5IGeagqT2HfNB
	 WSWBlRXkdzNSbUWRdhhQ8zCHndoIk8LmySF1ueBCBm2mr8YscM9fWJqP8/Rc8vAOAA
	 KK15FRZIK7PYQ==
Message-ID: <b3cbeae1-b0c5-43c3-80ec-3b6654582565@kernel.org>
Date: Thu, 5 Jun 2025 16:02:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Sven Peter <sven@kernel.org>
Subject: Re: [BUG] rmmod i2c-pasemi-platform causing kernel crash on Apple M1.
To: chenglingfei <chenglingfei22s@ict.ac.cn>
Cc: j@jannau.net, alyssa@rosenzweig.io, neal@gompa.dev,
 zhangzhenwei22b@ict.ac.cn, wangzhe12@ict.ac.cn, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 naveen@kernel.org, andi.shyti@kernel.org, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <5c598fea.3165d.1973e0a9a3a.Coremail.chenglingfei22s@ict.ac.cn>
 <dafd58ae-0a08-4fe6-b94d-c8c6c8c1fa97@kernel.org>
 <4cfe2276.2c0da.1973ff1cc40.Coremail.chenglingfei22s@ict.ac.cn>
Content-Language: en-US
In-Reply-To: <4cfe2276.2c0da.1973ff1cc40.Coremail.chenglingfei22s@ict.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_070241_933071_4B57C894 
X-CRM114-Status: GOOD (  31.85  )
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

On 05.06.25 13:55, chenglingfei wrote:
> 
> 
> 
> &gt; -----原始邮件-----
> &gt; 发件人: "Sven Peter" <sven@kernel.org>
> &gt; 发送时间: 2025-06-05 18:25:09 (星期四)
> &gt; 收件人: 程凌飞 <chenglingfei22s@ict.ac.cn>, j@jannau.net, alyssa@rosenzweig.io, neal@gompa.dev
> &gt; 抄送: zhangzhenwei22b@ict.ac.cn, wangzhe12@ict.ac.cn, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, andi.shyti@kernel.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
> &gt; 主题: Re: [BUG] rmmod i2c-pasemi-platform causing kernel crash on Apple M1.
> &gt;
> &gt; Hi,
> &gt;
> &gt; On 05.06.25 05:02, 程凌飞 wrote:
> &gt; &gt; Hi, all!
> &gt; &gt;
> &gt; &gt; We’ve encountered a kernel crash when running rmmod i2c-pasemi-platform on a Mac Mini M1 (T8103) running Asahi Arch Linux.
> &gt; &gt;
> &gt; &gt; The bug was first found on the Linux v6.6, which is built manually with the Asahi given config to run our services.
> &gt; &gt; At that time, the i2c-pasemi-platform was i2c-apple.
> &gt; &gt;
> &gt; &gt; We noticed in the Linux v6.7, the pasemi is splitted into two separate modules, one of which is i2c-pasemi-platform.
> &gt; &gt; Therefore, we built Linux v6.14.6 and tried to rmmod i2c-pasemi-platform again, the crash still exists. Moreover, we fetched
> &gt; &gt; the latest i2c-pasemi-platform on linux-next(911483b25612c8bc32a706ba940738cc43299496) and asahi, built them and
> &gt; &gt; tested again with Linux v6.14.6, but the crash remains.
> &gt; &gt;
> &gt; &gt; Because kexec is not supported and will never be fully supported on Apple Silicon platforms due to hardware and firmware
> &gt; &gt; design constraints, we can not record the panic logs through kdump.
> &gt;
> &gt; Do you have UART connected to a device under test which you could use to
> &gt; grab the panic log from the kernel? Alternatively you can also run the
> &gt; kernel under m1n1's hypervisor and grab the log that way. It'll emulate
> &gt; the serial port and redirect its output via USB.
> &gt;
> 
> I don't have UART, but I have tried to run the kernel under m1n1's hypervisor. However, it does not trigger the release of cs42l83.
> Given that m1n1 provides full peripheral device emulation capability, the most plausible explanation would be an incorrect
> firmware loading sequence. But the documentation of Asahi provides little details about how to generate an initramfs with
> firmware (I think), can you give more guidance about it?

I'm not sure why you are even trying to create a special initramfs. Just
load your usual kernel using the usual boot flow as a guest. There's 
also no firmware involved in i2c and I'm not sure what you mean with 
"full peripheral device emulation" either or how that's related to firmware.
You also mention that the crash happens when you run rmmod so I again 
don't understand what "it does not trigger the release of cs42l83" means 
here.

> 
> &gt; &gt;
> &gt; &gt; Thus we tried to find the root cause of the issue manually. When we perform rmmod, the kernel performs device releasing on
> &gt; &gt; the i2c bus, then calls the remove function in snd-soc-cs42l83-i2c, which calls the cs42l42_common_remove in cs42l42,
> &gt; &gt; because cs42l42-&gt;init_done is true, it performs regmap_write, and finally calls into pasemi_smb_waitready in i2c-pasemi
> &gt; &gt; -core.c. We noticed that smbus-&gt;use_irq is true, and after it calls into wait_for_completion_timeout, the system crashs!&gt;
> &gt; &gt; We found that wait_for_completion_timeout is one of the core scheduler APIs used by tens of thousands of other drivers,
> &gt; &gt; it is unlikely causing the crash. So we tried to remove the call to wait_for_completion_timeout, then the system seems to
> &gt; &gt; run well.
> &gt; &gt;
> &gt; &gt; However, because we have little knowledge about i2c devices and specifications, we are not sure whether this change will
> &gt; &gt; cause other potential harms for the system and device. Is this call to wait necesary here? Or can you give a more
> &gt; &gt; sophisticated fix?
> &gt;
> &gt; Yes, that call is necessary. It waits for the "transfer completed"
> &gt; interrupt from the hardware. Without it the driver will try to read data
> &gt; before it's available and you'll see corruption. I'm surprised hardware
> &gt; attached to i2c (usb pd controller and audio I think) works at all with
> &gt; that change.
> &gt;
> &gt;
> &gt; Sven
> 
> Are there any methods or tools to systematically verify its functionality? I am not sure whether the devices attached to i2c
> should work well even after the i2c-pasemi-platform has been removed.

I don't understand. You say you saw a crash inside pasemi_smb_waitready 
when calling wait_for_completion_timeout and decided to remove that 
method. When you remove the call you break the entire driver because it 
will now try to read data long before the i2c transaction has been 
completed.
Obviously, no i2c device will work when the driver isn't loaded but 
without waiting for the completion they also won't work when the driver 
is loaded.


Sven


