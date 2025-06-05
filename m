Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1655AC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 20:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPsR2cXYhTqwpuc7QqcETaUjfbhSR6gtPfcK1O1i0ko=; b=KGJKftG25WoO8k1qV7Uj+wYAhY
	ctiw8EiMPQKqsiGiL+Ny9JjRfihPBk1LK0CqjeiBLSrSWYAQggIrRzE7aviwThMuXsv7KDEDNezqT
	SmwrZPfelXCr8dkwiwQ0FvkHKEh15lOEGLdsyhIwpIuRPC7TQJDJLN46zhFuNS4kIanIgWHdbrTAR
	fFlGMNVYT5Jupbf0pAK/wOlEKLwbN8/6p8u4RwgZcqeoCiKVnWdutkqEX/jZZwFh9Db5bteVb7dtP
	0rprYTwJTbanZmUOV58TVPNaBHtS1K2eeQktsqebni2F3414363Mio3rEuBvV/L+igd5knTak18C2
	giAcojUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNGly-0000000GYaD-2yXd;
	Thu, 05 Jun 2025 20:01:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNGjq-0000000GYMQ-22JV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 19:58:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3640443FDD;
	Thu,  5 Jun 2025 19:58:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9049EC4CEE7;
	Thu,  5 Jun 2025 19:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749153538;
	bh=iPRe+RK96LZ5d6gxUJftAi/t9mj4gB0KkT4eYaf34vQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o0KIL32CBGN8EHubHuRyqOivRdpEPs2Vty7EHNpNNCGIvPp9qE2aat9S7YF7w+z3l
	 Rr4Psr8WOy3iaa7XpTESSNCLfXrIDDTPNLn6xK8I6JCYVn5dbQCy6lHtaJGQyRh+64
	 e6xxP+9+TJXnGt3G957/CcvudD/EXFRQps0pWFabFb9ZqY3kUd6VPNO8CxXFwKMBLw
	 c1jVVgNTfeuX0U1fW5qinKc02waNP2CnuFbBAXqLkN3usLFudVP0pFgQhuQ5ubLtFL
	 4ijh0Hbs0h/PBJwWYEgMwq8rzpuYI3ebtFRiImIvn6H50Bi+cJjBlai3hZCra4qiQF
	 HEP/T/45KDGfA==
Message-ID: <53fec2fa-b37d-4b87-a8bc-5a056ef16c2f@kernel.org>
Date: Thu, 5 Jun 2025 21:58:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
 <b3cbeae1-b0c5-43c3-80ec-3b6654582565@kernel.org>
 <6064d018.2b279.19740a7eb1c.Coremail.chenglingfei22s@ict.ac.cn>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <6064d018.2b279.19740a7eb1c.Coremail.chenglingfei22s@ict.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_125858_569706_0BEC86EB 
X-CRM114-Status: GOOD (  27.78  )
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

On 05.06.25 17:13, chenglingfei wrote:
> 
> 
> 
> &gt; -----原始邮件-----
> &gt; 发件人: "Sven Peter" <sven@kernel.org>
> &gt; 发送时间: 2025-06-05 22:02:35 (星期四)
> &gt; 收件人: chenglingfei <chenglingfei22s@ict.ac.cn>
> &gt; 抄送: j@jannau.net, alyssa@rosenzweig.io, neal@gompa.dev, zhangzhenwei22b@ict.ac.cn, wangzhe12@ict.ac.cn, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, andi.shyti@kernel.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
> &gt; 主题: Re: [BUG] rmmod i2c-pasemi-platform causing kernel crash on Apple M1.
> &gt;
> &gt; Hi,
> &gt;
> &gt; On 05.06.25 13:55, chenglingfei wrote:
> &gt; &gt;
> &gt; &gt;
> &gt; &gt;
> &gt; &gt; &gt; -----原始邮件-----
> &gt; &gt; &gt; 发件人: "Sven Peter" <sven@kernel.org>
> &gt; &gt; &gt; 发送时间: 2025-06-05 18:25:09 (星期四)
> &gt; &gt; &gt; 收件人: 程凌飞 <chenglingfei22s@ict.ac.cn>, j@jannau.net, alyssa@rosenzweig.io, neal@gompa.dev
> &gt; &gt; &gt; 抄送: zhangzhenwei22b@ict.ac.cn, wangzhe12@ict.ac.cn, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, andi.shyti@kernel.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
> &gt; &gt; &gt; 主题: Re: [BUG] rmmod i2c-pasemi-platform causing kernel crash on Apple M1.
> &gt; &gt; &gt;
> &gt; &gt; &gt; Hi,
> &gt; &gt; &gt;
> &gt; &gt; &gt; On 05.06.25 05:02, 程凌飞 wrote:
> &gt; &gt; &gt; &gt; Hi, all!
> &gt; &gt; &gt; &gt;
> &gt; &gt; &gt; &gt; We’ve encountered a kernel crash when running rmmod i2c-pasemi-platform on a Mac Mini M1 (T8103) running Asahi Arch Linux.
> &gt; &gt; &gt; &gt;
> &gt; &gt; &gt; &gt; The bug was first found on the Linux v6.6, which is built manually with the Asahi given config to run our services.
> &gt; &gt; &gt; &gt; At that time, the i2c-pasemi-platform was i2c-apple.
> &gt; &gt; &gt; &gt;
> &gt; &gt; &gt; &gt; We noticed in the Linux v6.7, the pasemi is splitted into two separate modules, one of which is i2c-pasemi-platform.
> &gt; &gt; &gt; &gt; Therefore, we built Linux v6.14.6 and tried to rmmod i2c-pasemi-platform again, the crash still exists. Moreover, we fetched
> &gt; &gt; &gt; &gt; the latest i2c-pasemi-platform on linux-next(911483b25612c8bc32a706ba940738cc43299496) and asahi, built them and
> &gt; &gt; &gt; &gt; tested again with Linux v6.14.6, but the crash remains.
> &gt; &gt; &gt; &gt;
> &gt; &gt; &gt; &gt; Because kexec is not supported and will never be fully supported on Apple Silicon platforms due to hardware and firmware
> &gt; &gt; &gt; &gt; design constraints, we can not record the panic logs through kdump.
> &gt; &gt; &gt;
> &gt; &gt; &gt; Do you have UART connected to a device under test which you could use to
> &gt; &gt; &gt; grab the panic log from the kernel? Alternatively you can also run the
> &gt; &gt; &gt; kernel under m1n1's hypervisor and grab the log that way. It'll emulate
> &gt; &gt; &gt; the serial port and redirect its output via USB.
> &gt; &gt; &gt;
> &gt; &gt;
> &gt; &gt; I don't have UART, but I have tried to run the kernel under m1n1's hypervisor. However, it does not trigger the release of cs42l83.
> &gt; &gt; Given that m1n1 provides full peripheral device emulation capability, the most plausible explanation would be an incorrect
> &gt; &gt; firmware loading sequence. But the documentation of Asahi provides little details about how to generate an initramfs with
> &gt; &gt; firmware (I think), can you give more guidance about it?
> &gt;
> &gt; I'm not sure why you are even trying to create a special initramfs. Just
> &gt; load your usual kernel using the usual boot flow as a guest. There's
> &gt; also no firmware involved in i2c and I'm not sure what you mean with
> &gt; "full peripheral device emulation" either or how that's related to firmware.
> &gt; You also mention that the crash happens when you run rmmod so I again
> &gt; don't understand what "it does not trigger the release of cs42l83" means
> &gt; here.
> &gt;
> 
> Well, simply running rmmod i2c-pasemi-platform doesn't directly cause a crash.
> The crash occurs when the module removal triggers device_remove for cs42l83,
> which ultimately calls pasemi_smb_waitready in i2c-pasemi-platform. You may refer
> to the brief analysis provided in my first email for more details.
> 
> When booting the kernel without m1n1, cs42l83 is automatically probed after
> i2c-pasemi-platform loads and subsequently removed when executing rmmod
> i2c-pasemi-platform, resulting in a kernel crash. However, when booting under m1n1,
> cs42l83 isn't probed or removed -- the device appears to be non-existent. This
> observation led me to mention "full peripheral device emulation."

I'm still not sure what "full peripheral device emulation" means in that 
context. If cs42l83 isn't probed that's most likely an issue with your 
kernel or your device tree or your boot device. Hence my suggestion to 
just the regular kernel and boot device.


Unrelated, there's something wrong with your email setup, see e.g. 
https://lore.kernel.org/asahi/6064d018.2b279.19740a7eb1c.Coremail.chenglingfei22s@ict.ac.cn/ 
how your mail arrive.

Sven



