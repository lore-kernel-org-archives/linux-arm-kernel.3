Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9093EFB5E81
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 22:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PeuyGZnZVt73gNnb6AoPMEvixfb/019SA0OSx6BMStU=; b=zyFmsgrEIep8YvLG9w4WSDYQ2Z
	dttlJxLSNrCrDCDkAtFcp0IMCxuRIHYaPJbS2ekHVV++hd6apbmyDyqaERYViktMA+Tb9BQxNbu3F
	Oq8cApNMJDeTwYCGPV56LLpyNB1XWMTHKCU8KddD3hehRm3BQnaJd+wCb1s2jbspBbFkSWODZ5ySh
	LuMkmiCeOyleSxgA/qNWFhdII3eA0Zh/R3H4FdO2n00mUF/tcH5Wh6b7FiMsfkepCxfSOvWDLBV4z
	40I6Jr9y+PLGWsvJtg/ZkWA4MUU7BNH2wd5SrWvt95jGjmJ2lWojOEd6wyoHFJf2BZy4ap4yCpqs1
	5FgUUAdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2GXZ-000000051LX-2Ykb;
	Mon, 16 Mar 2026 22:36:01 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2GXW-000000051L2-3uZ4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 22:36:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7D03C10D582;
	Mon, 16 Mar 2026 23:35:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1773700556;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=PeuyGZnZVt73gNnb6AoPMEvixfb/019SA0OSx6BMStU=;
	b=CnOC9H/DgyUvFXJEapVB9R/QvwEVBkq/W8sLQXIQP3otoy4mSa7/WzwwG0MifVaSPO9J1M
	PHk5ImJ9lQee/1oQHe/pdT5+1YO1VNHdlsqNit6XwkRguPmQLcgsJyjAYD9uEokCOYB6sg
	hzfoMnWWV9ZF/mRSxWz/vgKLux82Bt5RD459LaAbRu55684nuH+LsJh/LKfXQdoltRPibp
	riAQB69fawd79RA8t6H31HJDf7oTivTTG6wtfbiCs86JkvCk1qDD55KdubYKhtMN0jqHjw
	ZW/8hOzCIwPTSWAvcu2g+gCS5bAZoFNJKYiio18gMOrsL/3VtgXl6KDxfjgZww==
Message-ID: <95f13b52-41a4-409c-91c4-20141e208596@nabladev.com>
Date: Mon, 16 Mar 2026 23:35:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] dmaengine: xilinx_dma: Fix per-channel direction
 reporting via device_caps
To: Folker Schwesinger <dev@folker-schwesinger.de>,
 Rahul Navale <rahulnavale04@gmail.com>
Cc: Rahul Navale <rahul.navale@ifm.com>, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, Frank.Li@kernel.org, michal.simek@amd.com,
 suraj.gupta2@amd.com, thomas.gessler@brueckmann-gmbh.de,
 radhey.shyam.pandey@amd.com, tomi.valkeinen@ideasonboard.com, marex@denx.de
References: <DGHGTCJRRZCW.9TGXQW44V6RR@folker-schwesinger.de>
 <20260309072822.5016-1-rahulnavale04@gmail.com>
 <DH2D8WNRXPUD.1205964NAEFPF@folker-schwesinger.de>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <DH2D8WNRXPUD.1205964NAEFPF@folker-schwesinger.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_153559_125442_B9E0B8DD 
X-CRM114-Status: GOOD (  23.60  )
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

On 3/14/26 9:35 AM, Folker Schwesinger wrote:
> On Mon Mar 9, 2026 at 8:28 AM CET, Rahul Navale wrote:
>> I have applied provided patch (with kept RFC patch and debug stuff) and with
>> 7e01511443c3 applied. logs:
>>
>> root@pdm3:~# dmesg | grep ptr_res
>> [  198.997591] ptr_res: ptr = 0x00000000
>> ...
>> [  199.242820] ptr_res: ptr = 0x00000000
>>
>> Also I have applied provided patch (with kept RFC patch and debug stuff) and with
>> 7e01511443c3 reverted. logs:
>>
>> root@pdm3:~# dmesg | grep ptr_res
>> [   60.480754] ptr_res_no: ptr = 0x00000000
>> ...
>> [   60.600877] ptr_res_no: ptr = 0x00001770
>> ...
>> [   60.725869] ptr_res_no: ptr = 0x00002ee0
>> ...
>> [   60.850877] ptr_res_no: ptr = 0x00000000
>> ...
>> [   60.975869] ptr_res_no: ptr = 0x00001770
>> ...
> 
> This confirms that the residue_granularity field in dma_slave_caps,
> which gets properly set since 7e01511443c3 affects progress tracking in
> the PCM DMAEngine layer. Since Xilinx DMA advertises residue reporting
> with segment granularity [1], PCM DMAEngine switches from software based
> [2][3] progress tracking to hardware based progress tracking [4].
>  From my understanding however, residue reporting of the Xilinx DMA is
> incompatible with what the PCM DMAEngine expects. So the progression
> pointer is stuck at 0.
> 
> As I'm neither an expert in the PCM subsystem nor very familiar with
> residue reporting of the AXIDMA (and its limitations), I can't propose a
> solution that fixes the issue for you. I did a quick check of the code to
> see, if there is any way to force the DMAEngine PCM layer into software
> tracking from your custom driver. But I think there's no API to
> force-set the SND_DMAENGINE_PCM_FLAG_NO_RESIDUE bit in
> dma_engine_pcm->flags from your custom driver.
> Maybe there's a way to establish compatibility between PCM and AIXDMA in
> this regard. But to figure that out, I think more eyes on the issue from
> the audio experts and Xilinx/AMD engineers familiar with AXIDMA residue
> reporting would be needed.
> 
> Just to double check, and to make sure the regression you're seeing is
> not a combination of any additional, yet unknown side-effects, could you
> perform one more test?
> In dmaengine_pcm_pointer() (the function we just patched), could you
> replace the call to snd_dmaengine_pcm_pointer() with
> snd_dmaengine_pcm_pointer_no_residue() while keeping 7e01511443c3 active
> and test if this fixes your issue or not?
> 
> [1]: https://elixir.bootlin.com/linux/v6.19.3/source/drivers/dma/xilinx/xilinx_dma.c#L3284
> [2]: https://elixir.bootlin.com/linux/v7.0-rc3/source/sound/core/pcm_dmaengine.c#L136
> [3]: https://elixir.bootlin.com/linux/v7.0-rc3/source/sound/core/pcm_dmaengine.c#L235
> [4]: https://elixir.bootlin.com/linux/v7.0-rc3/source/sound/core/pcm_dmaengine.c#L251

I came to the same conclusion, that the residue handling is broken in 
the Xilinx DMA driver for cyclic transfers, and the fix is below, with 
two extra fixes on top:

https://lore.kernel.org/dmaengine/20260316221943.160375-1-marex@nabladev.com/
https://lore.kernel.org/dmaengine/20260316221728.160139-1-marex@nabladev.com/
https://lore.kernel.org/dmaengine/20260316222530.163815-1-marex@nabladev.com/

