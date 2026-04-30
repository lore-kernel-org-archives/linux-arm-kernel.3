Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34506CD13D3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 08:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6hLCQ07POUMPihVDz6HIWM9c5fAD2FVAZ8qcNb+Lmms=; b=hE4+5b9cM+JIcnHidrAxxZCnpu
	evn56EjuKQS2E/LB/wtEpKvlEFaZUdsOlU+OW7dcPBSvuwAeSSVUx/pl/sg0iWOuBBZdpDqsrmMou
	Q4hjwiQnhF16QFO35k5/LccftqVprfRxn/HsbNCCWVXBCouCf/pXkaWSMhhSIzvRWmZ82ukgugCHn
	FcEQ/VJx+cziUEdvYBkQM6Vpg8fRH3RFHEcONKoH13fuW6wOTnjaQZy5adhV5k+wLieDZDP0c/c9l
	c7c5VRSPQ3/1XOfbbrQFrhzwnAobBR1+swnJZXOD3hzN1WYFT2MFF/YdLF9xIrV3SL9kGd/o7313h
	U2TnAPAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMd4-00000004zYd-3m1w;
	Thu, 30 Apr 2026 08:20:14 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIMd2-00000004zXd-1qTi;
	Thu, 30 Apr 2026 08:20:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777537207;
	bh=CvZdTuDsOPbOOmFVZSdMX9Q+/W011Sk793y54eFmV0Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XaUMvcwjVufXn463hhg7uWcS9Rxv4Tru74bsB2yGvC44ZNYhwnpiLzll7Gb+tm6TG
	 UqehcY/XL/b/r6ZKGeKJhciwp1yH/flVzYSRMTNzCW72taUSt8Ki6JokO9N1XqkCRN
	 IW4WwECF47QGtHp5iU8wk8GOtZM/wUr+4lw6vHxj6KV9Euxytw/N3w5tdQZMlZXsC1
	 Wv7Af0VSwdITetenf94ZVMVV0uqFFNpWhr3WCvdNDPXW8QKz2HpHfWl9sQjCZA3EOl
	 jrDBSBPkekD7cfEF1pN3iXYFUYu0w9AVubP0oSDTUOA2sgKL9/QOviFMqGwZGvcadX
	 zDOilydgE2mQw==
Received: from [100.64.1.43] (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7176017E1340;
	Thu, 30 Apr 2026 10:20:06 +0200 (CEST)
Message-ID: <6ff04d04-ebe8-4a57-bdc2-b98346080055@collabora.com>
Date: Thu, 30 Apr 2026 10:20:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] media: verisilicon: Simplify motion vectors and
 rfc buffers allocation
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Frank Li <Frank.li@nxp.com>
Cc: p.zabel@pengutronix.de, mchehab@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, heiko@sntech.de,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 kernel@collabora.com
References: <20260415140420.282084-1-benjamin.gaignard@collabora.com>
 <20260415140420.282084-2-benjamin.gaignard@collabora.com>
 <aeIRWW937ev_F8zF@lizhi-Precision-Tower-5810>
 <4064d0168c3409a1e15f9c92da56cea93956b31e.camel@collabora.com>
Content-Language: en-US
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
In-Reply-To: <4064d0168c3409a1e15f9c92da56cea93956b31e.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_012012_665914_96663096 
X-CRM114-Status: GOOD (  11.13  )
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


Le 29/04/2026 à 20:11, Nicolas Dufresne a écrit :
> Hi Benjamin,
>
> Le vendredi 17 avril 2026 à 06:54 -0400, Frank Li a écrit :
>> On Wed, Apr 15, 2026 at 04:04:19PM +0200, Benjamin Gaignard wrote:
>>> Until now we reserve the space needed for motion vectors and reference
>>> frame compression at the end of the frame buffer.
>>> Disentanglement mv and rfc from frame buffers by allocating
>>> distinct buffers for each purpose.
>>> That simplify the code by removing lot of offset computation.
>> Can you try split to more small and straight forward patches, for example
>>
>> for example create patch just move hantro_h264_mv_size() to header file,
> Marking this has Change Requested, as I completely agree with Frank that a split
> of this giant will help proper review.

I will cut the series in two: one clean up series (which will come after av1 lib series been merged)
and buffer simplification patch after that.

Benjamin

>
> Nicolas
>
>> ...
>>> +++ b/drivers/media/platform/verisilicon/hantro_hevc.c
>>> @@ -44,30 +44,49 @@ dma_addr_t hantro_hevc_get_ref_buf(struct hantro_ctx *ctx,
>>>   	int i;
>>>
>>>   	/* Find the reference buffer in already known ones */
>>> -	for (i = 0;  i < NUM_REF_PICTURES; i++) {
>>> +	for (i = 0; i < NUM_REF_PICTURES; i++) {
>>>   		if (hevc_dec->ref_bufs_poc[i] == poc) {
>>>   			hevc_dec->ref_bufs_used |= 1 << i;
>>>   			return hevc_dec->ref_bufs[i].dma;
>>>   		}
>>>   	}
>>> -
>>>   	return 0;
>> Move this code style change to new patches.
>>
>> Frank

