Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E57DD44D59
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 13:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e2tqqRezTLSNXYh52TzRniqTbgundmm4a3ka/D91TnY=; b=ImR9Urz6XDXItoeNCNv31VDbAg
	qjMKu7lW0aETEm51GijXYFbYxZbo9gSVBW4c+8YAY96EFmzWYPjPuaZZnQxRoTTYxPPOtCX2GvJ6+
	DD062PMDbTTRvMVWQYvOs/iPJGrRxevmUt7XqPaZ9eW5I/iw/AaXjyffk2KqZqb73zgxltj+KcOQd
	hCoYMVkLFcrBzT6P3z/XX/0sATqqtsEAzlYd9OeuiywQC3MMCrlLl/57uG6SCWKFgOiqGk3erm3sj
	cLvB3vCEQCUnbNzEI5Mf6TnpDDy/9LET0y1Wic5vIi/d2a1Ke0cEtQwDtbDyHitb5asoZznk2zJ0t
	3v5CoIlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8fyV-00000003Oyq-2NDp;
	Wed, 06 Nov 2024 13:21:31 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8fMz-00000003God-0MHW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 12:42:46 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 72A89891D7;
	Wed,  6 Nov 2024 13:42:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730896963;
	bh=e2tqqRezTLSNXYh52TzRniqTbgundmm4a3ka/D91TnY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FQ6+ilLtGE641Imvlt74dY90ghem8QojWi4seOo+Uj6bFGlbf8Nr0FaKopCQrCFkq
	 3ULPP6JohOFFuIIixTEXTdziKHBLVdCaopV35s897NNVU9QEprDDz30fsae+VI4biq
	 Hxy/sEM0UChZlgKwRkrc0CMgRAxH5Pp8bNeDBO/dfba+B1s7lao24r/F/3MHcL/gJp
	 JlRFJnDv8xMLwYwU2swJRElUc5NUjjtmaFe8XwNBntz2OwyA7eHABUKcTh5UlbwznW
	 Truok/WAO1HwDr1FIMFYRVwGgRJA9qMq8jtVpRftuo+7UG3ShukyVf0UuF0JYuA1IG
	 wJfTJ9gXDAZmQ==
Message-ID: <f168e5bd-cdab-4405-98ef-20f7ee534e0c@denx.de>
Date: Wed, 6 Nov 2024 12:41:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: xilinx_dma: Fix freeup active list based on
 descriptor completion bit
To: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>,
 "dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>
Cc: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "Simek, Michal" <michal.simek@amd.com>, Peter Korsgaard
 <peter@korsgaard.com>, Vinod Koul <vkoul@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "Katakam, Harini" <harini.katakam@amd.com>
References: <20241031165835.55065-1-marex@denx.de>
 <MN0PR12MB595370521C2E3D61145D15BCB7532@MN0PR12MB5953.namprd12.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <MN0PR12MB595370521C2E3D61145D15BCB7532@MN0PR12MB5953.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_044245_376227_58D9B1E9 
X-CRM114-Status: GOOD (  14.44  )
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

On 11/6/24 10:48 AM, Pandey, Radhey Shyam wrote:
>> -----Original Message-----
>> From: Marek Vasut <marex@denx.de>
>> Sent: Thursday, October 31, 2024 10:28 PM
>> To: dmaengine@vger.kernel.org
>> Cc: Marek Vasut <marex@denx.de>; Uwe Kleine-König <u.kleine-
>> koenig@baylibre.com>; Simek, Michal <michal.simek@amd.com>; Peter Korsgaard
>> <peter@korsgaard.com>; Pandey, Radhey Shyam
>> <radhey.shyam.pandey@amd.com>; Vinod Koul <vkoul@kernel.org>; linux-arm-
>> kernel@lists.infradead.org
>> Subject: [PATCH] dmaengine: xilinx_dma: Fix freeup active list based on descriptor
>> completion bit
>>
>> The xilinx_dma is completely broken since the referenced commit,
>> because if the (seg->hw.status & XILINX_DMA_BD_COMP_MASK) is not
>> set for whatever reason, the current descriptor is never moved to
> 
> I want to understand more on this failure scenario.  How to replicate it?

The very basic test is to use AXI DMA for DMA transfer, which fails to 
complete because of this new chunk of code. By reading the commit 
history, I can only conclude this was something that got added due to 
the irq_delay, but was never tested on core without irq_delay support ?

> Why is completion bit not set ? Based on the documentation completed bit
> indicates to the software that the DMA Engine has completed the transfer
> as described by the associated descriptor. The DMA Engine sets this bit
> to 1 when the transfer is completed.
I don't know, the bit was not used before you added the bit and check of 
the bit in the problematic commit 7bcdaa658102 ("dmaengine: xilinx_dma: 
Freeup active list based on descriptor completion bit")

