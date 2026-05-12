Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5153CCD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 14:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YUGYCdIcdICL813vLCBpl3h3EVc5y+lVwut7DzH8AtE=; b=n9OicCwR4QdsDMx3QgXShOKjz6
	MVX//QI4yeGt+YzxQpLRBIdhSBFSkIZdefNaIpDPjqUjJAjzTeWDzP7fJjz22WN8+nytVy58uOScx
	4sNw2UfPcaurDvfXjs28rgoWcZVcgVbVDvrWyjS/gIqVgJ5JcvI71j6xT2hkmibytZY+XHc4w1OHf
	nhhdgM5MlZ8bEFGZKreNwielI4qv45HJaEh0EpmEywhMCNzvA7DzNzpcXxhM9stSfMZ2UqYNsYZO3
	yamSQQtpZUZtABIzUzbbg5WQxPSDVi09DxhdzZ6irLb8XcBinyv69kFSnhBGweyamSfLm5LdfeIFg
	SFZaPswQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnsi-0000000GzcL-0Htx;
	Tue, 12 May 2026 14:14:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnsh-0000000Gzc4-3Ii6
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 May 2026 14:14:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YUGYCdIcdICL813vLCBpl3h3EVc5y+lVwut7DzH8AtE=; b=OhkSXOifuFISCCi3MYmCXVxc1r
	uj5H25nvNg55uubl70Ncfu8qCFYn7GpMGg55Q3erpORSDuJPUVBqi2Wn8aLJQreZEZJSf5WkoJUJ/
	ev5Ty6m5MPE1DJLDVsC+ts/HLiafGvHZc/pABBWu0KCuXo1rcXDHJcUqdrEGZjEX6ouG4gsNsia/A
	4N7eQ0SCJeVgDD3l8ZndGORUysaOUVXVfax6ivbaxKd+MWuRlFzMTKq41eTjhiK8ni8wNNIuyS9KP
	q3zrKFODGCffpJGN29FPegqSlhqvYg/dfap7T0p7UNcxazDwX5bxeJgCjQvx/i6zS/FMOof0YPim9
	BTjqZI+A==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnsY-0000000EwuA-1e5H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 14:14:42 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.pueschel@pengutronix.de>)
	id 1wMnsJ-0003VA-2A; Tue, 12 May 2026 16:14:19 +0200
Message-ID: <2138b7ee-641f-4727-bcaa-f16dc9982a90@pengutronix.de>
Date: Tue, 12 May 2026 16:14:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/29] media: rockchip: rga: fix too small buffer size
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Jacob Chen <jacob-chen@iotwrt.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@pengutronix.de,
 sebastian.reichel@collabora.com
References: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
 <20260428-spu-rga3-v5-6-eb7f5d019d86@pengutronix.de>
 <7cf0950e51e4917a0b4d565f71b1e8f2a41e4bbe.camel@ndufresne.ca>
Content-Language: en-US
From: =?UTF-8?Q?Sven_P=C3=BCschel?= <s.pueschel@pengutronix.de>
In-Reply-To: <7cf0950e51e4917a0b4d565f71b1e8f2a41e4bbe.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.pueschel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_151434_974043_04965DDA 
X-CRM114-Status: GOOD (  18.92  )
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

Hi Nicolas,

On 5/8/26 11:11 PM, Nicolas Dufresne wrote:
> Le mardi 28 avril 2026 à 11:00 +0200, Sven Püschel a écrit :
>> Fix the command buffer size being only a quarter of the actual size.
>> The RGA_CMDBUF_SIZE macro was potentially intended to specify the length
>> of the cmdbuf u32 array pointer. But as it's used to specify the size of
>> the allocation, which is counted in bytes. Therefore adjust the macro
>> size to bytes as it better matches the variable name and adjust it's
>> users accordingly.
>>
>> As the command buffer is relatively small, it probably didn't caused
>> an issue due to being smaller than a single page.
>>
>> Fixes: f7e7b48e6d79 ("[media] rockchip/rga: v4l2 m2m support")
>> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
> Reviewed-by: Nicolas Dufresne  <nicolas.dufresne@collabora.com>
>
>> ---
>>   drivers/media/platform/rockchip/rga/rga-hw.c | 2 +-
>>   drivers/media/platform/rockchip/rga/rga-hw.h | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
>> index 43ed742a16492..d1618bb247501 100644
>> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
>> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
>> @@ -414,7 +414,7 @@ static void rga_cmd_set(struct rga_ctx *ctx,
>>   {
>>   	struct rockchip_rga *rga = ctx->rga;
>>   
>> -	memset(rga->cmdbuf_virt, 0, RGA_CMDBUF_SIZE * 4);
>> +	memset(rga->cmdbuf_virt, 0, RGA_CMDBUF_SIZE);
> So we had a buffer overrun ?

 From my point of view, yes [1]:

     /* Create CMD buffer */
     rga->cmdbuf_virt = dma_alloc_attrs(rga->dev, RGA_CMDBUF_SIZE,
                        &rga->cmdbuf_phy, GFP_KERNEL,
                        DMA_ATTR_WRITE_COMBINE);


Given that 0x20 * 4 is smaller than a page, it probably didn't caused an 
issue as we didn't write out of the one page allocated.

Btw.: I've noticed it while reading a bit over the comments from 
sashiko.dev [2]. I'll also add this link for clarity to the comment in 
my next series (seems to be the common way of referring to sashiko.dev).

Sincerely
     Sven


[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/platform/rockchip/rga/rga.c?id=50897c955902c93ae71c38698abb910525ebdc89#n880

[2] 
https://sashiko.dev/#/patchset/20260325-spu-rga3-v4-0-e90ec1c61354%40pengutronix.de?part=10

>
> Nicolas
>
>>   
>>   	rga_cmd_set_src_addr(ctx, src->dma_desc_pa);
>>   	/*
>> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media/platform/rockchip/rga/rga-hw.h
>> index cc6bd7f5b0300..2b8537a5fd0d7 100644
>> --- a/drivers/media/platform/rockchip/rga/rga-hw.h
>> +++ b/drivers/media/platform/rockchip/rga/rga-hw.h
>> @@ -6,7 +6,7 @@
>>   #ifndef __RGA_HW_H__
>>   #define __RGA_HW_H__
>>   
>> -#define RGA_CMDBUF_SIZE 0x20
>> +#define RGA_CMDBUF_SIZE 0x80
>>   
>>   /* Hardware limits */
>>   #define MAX_WIDTH 8192

