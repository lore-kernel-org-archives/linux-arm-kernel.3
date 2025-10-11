Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B1BCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 18:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0IoRmI9dIdW/8tPvD1y1soViMNpZ5KK4la8nRiO8vo=; b=4DWdZW+/HoAVoNjryXJCz4GpOI
	y+PMwtwRjAf6EF41ktVUd+kb28RrJ/cNoKTSV6gOxrw8NtgeBvGzIbzuAqJl0dgL+wTxwIhHKlqDY
	CgsnOZQD69150s8MbozuigX+OSsX3mcTaGT27yA6KtezWIRZRjwr/15HSoyElRQLNCw2u/74gbr92
	/hE6Sj2kL9H8IoiDaq8UQTVHBk54zuO0PJanksW2o4QChRvsn9s2IfkBBMXE96rgcJso4XD7Hvn+A
	mlc2MU1fygpvhcIl6VdERw1oRRMqFTDyhtPQ5StYvsV5NhVxaSngbgwFwO9DfahdeB27NPWPZ7cCw
	e1dKF2yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7edd-0000000AWFj-18oE;
	Sat, 11 Oct 2025 18:48:17 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7eda-0000000AWFK-3wgt
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 18:48:16 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ckXgG5ny4z9snK;
	Sat, 11 Oct 2025 20:48:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760208490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u0IoRmI9dIdW/8tPvD1y1soViMNpZ5KK4la8nRiO8vo=;
	b=Jq9h/UN3orRqvLMiSTIsWeNqeWFNhDzhw0w/XhrQgk+Rf8dSNzK5EGqkkoEcZOg24xlrrc
	2gBDQw0ccVpdg0ENxRtCycSHfrM9qOPgNYi5/KT9fbzOyWJvhTNSn4mFVdNCUsfDa4CUKm
	3RF8lckp+Z5CSkSvu1WeGElfFErzMoTsgd1wW0E42irV95lxpNHZENYf9Ojsd1vXt3xn3d
	d2IijdtqxzkwZWScoktp26428trHtEWz5gnl/2iM/Nwtjgz2m436buL0i/evIGbQot6IVM
	vwFUAfKCXhpKMkDgknD3Ux0RkJDtP720mc619GH9Emw/qxSTzqlIZXHAnH7IzA==
Message-ID: <6c53d0bb-e623-4b56-8ea5-79e4ac9f059c@mailbox.org>
Date: Sat, 11 Oct 2025 20:48:08 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] media: imx-jpeg: Fix JPEG encoder ready race condition
To: "Ming Qian(OSS)" <ming.qian@oss.nxp.com>, linux-media@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mirela Rabulea <mirela.rabulea@nxp.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20250820162938.209892-1-marek.vasut@mailbox.org>
 <4a8531f9-801b-4744-8821-923961211199@oss.nxp.com>
 <1a25c41e-1139-41da-b056-50be47016138@mailbox.org>
 <218903ea-82fa-45f8-9826-481ded93281a@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <218903ea-82fa-45f8-9826-481ded93281a@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: io95sxgpo1hgi1kyyw1yycjx6mdditcw
X-MBO-RS-ID: 5a203776b7cd3b5680e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_114815_121948_5123A7E5 
X-CRM114-Status: GOOD (  25.37  )
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

On 8/21/25 11:24 AM, Ming Qian(OSS) wrote:

Hello Ming,

sorry for my late reply.

> On 8/21/2025 4:59 PM, Marek Vasut wrote:
>> On 8/21/25 9:06 AM, Ming Qian(OSS) wrote:
>>> Hi Marek,
>>
>> Hi,
>>
>>> On 8/21/2025 12:29 AM, Marek Vasut wrote:
>>>> [You don't often get email from marek.vasut@mailbox.org. Learn why 
>>>> this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>
>>>> The current mxc_jpeg_job_ready() implementation works for JPEG decode
>>>> side of this IP, it does not work at all for the JPEG encode side. The
>>>> JPEG encode side does not change ctx->source_change at all, therefore
>>>> the mxc_jpeg_source_change() always returns right away and the encode
>>>> side somehow works.
>>>>
>>>> However, this is susceptible to a race condition between 
>>>> mxc_jpeg_dec_irq()
>>>> and mxc_jpeg_start_streaming(), where mxc_jpeg_start_streaming() might
>>>> start decoding another frame before mxc_jpeg_dec_irq() indicates 
>>>> completion
>>>> of encoding of current frame. Add new state, MXC_JPEG_ENC_DONE, 
>>>> which is
>>>> set in three locations, first when streaming starts to indicate the 
>>>> encoder
>>>> is ready to start processing a frame, second in mxc_jpeg_dec_irq() 
>>>> when the
>>>> encoder finishes encoding current frame, and third in 
>>>> mxc_jpeg_dec_irq() in
>>>> case of an error so the encoder can proceed with encoding another 
>>>> frame.
>>>>
>>>> Update mxc_jpeg_job_ready() to check whether the encoder is in this new
>>>> MXC_JPEG_ENC_DONE state before reporting the encoder is ready to encode
>>>> new frame.
>>>>
>>>
>>> The jpeg encoder and jpeg decoder are 2 different devices, so they won't
>>> compete with each other.
>>
>> I know.
>>
>>> For encoder, we always want mxc_jpeg_job_ready() to return true.
>>
>> For encoder, mxc_jpeg_job_ready() currently returns !ctx- 
>>  >source_change , which is only set by decoder side of the driver. 
>> This seems wrong.
>>
> 
> That is what we want, the ctx->source_change of encoder is never set, so
> mxc_jpeg_job_ready() will always return true.
> If you think this is not clear enough, maybe the following code is
> enough:
> 
>      if (jpeg->mode == MXC_JPEG_ENCODE)
>          return 1;
> 
> 
>>> And v4l2_m2m has ensured that there will be no race condition between
>>> mxc_jpeg_dec_irq() and mxc_jpeg_start_streaming().
>>>
>>> After v4l2_m2m_job_finish() is called in the mxc_jpeg_dec_irq(),
>>> then it is possible to start encoding the next frame.
>> This part would be true if the IRQ function couldn't be called by 
>> anything except end of configuration or end of encoding, but it can be 
>> triggered by other things, like AXI READ error IRQ.
> 
> The mxc_jpeg_dec_irq() has filtered out the irrelevant interrupts:
> 
>      ctx = v4l2_m2m_get_curr_priv(jpeg->m2m_dev);
>      if (WARN_ON(!ctx))
>          goto job_unlock;
> 
>      if (slot != ctx->slot) {
>          /* TODO investigate when adding multi-instance support */
>          dev_warn(dev, "IRQ slot %d != context slot %d.\n",
>               slot, ctx->slot);
>          goto job_unlock;
>      }
> 
>      if (!jpeg->slot_data.used)
>          goto job_unlock;
> 
> 
> In other cases, it means the v4l2 m2m job has been started, we just need
> to call v4l2_m2m_job_finish()
> 
> If CONFIG ERROR occurs, driver still call
> v4l2_m2m_job_finish().
> 
> So I don't think this patch changes anything.
I can't seem to be able to reproduce the issue on MX95 A0 with the SRAM 
patch in place, I will keep an eye on this and possibly revisit this if 
it shows up again.

Thank you for your help.

