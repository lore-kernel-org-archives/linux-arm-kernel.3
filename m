Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C93D35162
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 11:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rGi3+b9PYSRUSUN6fg8GwyoE7KR890hxP+JIX+fz2zU=; b=arw9s2WGaNWqpNwIgDHplVfqNW
	xrAt6tMy3J2yNYgRqpSv/szI9R/fLPY4vaWPw/hiy7k55wsyQu/7qlTLhBz5RY0KYuE9Icxh1NQ4X
	PizH+NyKLV6sXNOf5MJmU50vLh5IhNlsoDrOPMV1bHOya230okqr2xNi2zM5BL6YFyLaUMvzGLmn/
	kHQju9ePPou58N3W23VoLhKJXNZjvEeFHvD/6z+mUYA8MOca1mXb01X5VGXUhR2YztD923SMYTPvg
	pb6B79aXRqMOTVe6UN01ey5ifWwuboRe6T+sW1OeIZkshMRpSZ5htUSBeuJ7GL5r4MfgMTOYFt7AN
	35WsY4DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7twv-0000000EfTV-0x1d;
	Wed, 01 Apr 2026 11:41:29 +0000
Received: from fsn-vps-1.bereza.email ([162.55.44.2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7twl-0000000EfSz-2ZG0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 11:41:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bereza.email; s=mail;
	t=1775043677; bh=rGi3+b9PYSRUSUN6fg8GwyoE7KR890hxP+JIX+fz2zU=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=mlrDwguGri0x0UDUD8Sxay4cdgmLeCaw4o5i6d7ogyvyzSOFpxWaXNmoYNCbbWTHW
	 BQpAaEjWbEv2Wq+CtgD3XzN7CxehHlcDabNyEnWg2KOCYlOvqXLUn2dBDcGtV6OHhs
	 5wBfjXBebpZA+c8yRJN46JV+FP4QucOXSdRBuDo69N28YyGoK5ALxGtF+8xMDRm/hN
	 T4M97sCiBu1/xm5WB6SmsVayhL+QqI5hoOgwUAa7LrLuXUIDQ3bDRdTXBG1Zw7Ogtd
	 lGWc6USRSKvVJkANUSiu1baHEdhTfElV8Hv2ro5ykEujlRBNewgvLhocKjrtgVvTy6
	 8vYcFm1WW6Uww==
Received: from localhost (pd95bbad8.dip0.t-ipconnect.de [217.91.186.216])
	by fsn-vps-1.bereza.email (Postfix) with ESMTPSA id 52AA95DF94;
	Wed,  1 Apr 2026 13:41:17 +0200 (CEST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 13:41:17 +0200
Message-Id: <DHHSGVWF7G9L.2SRDJY6GS561B@bereza.email>
Cc: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dmaengine: xilinx_dma: Fix CPU stall in
 xilinx_dma_poll_timeout
From: "Alex Bereza" <alex@bereza.email>
To: "Gupta, Suraj" <suraj.gupta2@amd.com>, "Alex Bereza"
 <alex@bereza.email>, "Vinod Koul" <vkoul@kernel.org>, "Frank Li"
 <Frank.Li@kernel.org>, "Michal Simek" <michal.simek@amd.com>, "Geert
 Uytterhoeven" <geert+renesas@glider.be>, "Ulf Hansson"
 <ulf.hansson@linaro.org>, "Arnd Bergmann" <arnd@arndb.de>, "Tony Lindgren"
 <tony@atomide.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260331-fix-atomic-poll-timeout-regression-v1-1-5b7bd96eaca0@bereza.email> <vA8GpbivDeKzKN1k0B6m1cvW-rZwJjKzvhksYdUJPo4fsfhLQoXtWoK59V1YX_U2U3jcVR2PAmzrleamvq8Dmw==@protonmail.internalid> <833bb42a-65b8-4c93-8109-d2959f8b807f@amd.com> <DHHOCNHDN27K.RIE745OFAACD@bereza.email> <kOnlFSDZQEhF3ojzQjMcbXIfkhwssDgozLNV7KPXr_zaZ_9QOifwp4nyFe8li-AkYulMsLHKXtgEBihiXHhCzQ==@protonmail.internalid> <f5a8ac32-3c65-4703-87fc-d0990839887d@amd.com>
In-Reply-To: <f5a8ac32-3c65-4703-87fc-d0990839887d@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_044119_867664_CAB620A5 
X-CRM114-Status: GOOD (  15.49  )
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

Hi Suraj,

On Wed Apr 1, 2026 at 1:15 PM CEST, Suraj Gupta wrote:

>>>> Hi, in addition to this patch I also have a question: what is the poin=
t
>>>> of atomically polling for the HALTED or IDLE bit in the stop_transfer
>>>> functions? Does device_terminate_all really need to be callable from
>>>> atomic context? If not, one could switch to polling non-atomically and
>>>> avoid burning CPU cycles.
>>>>
>>>
>>> dmaengine_terminate_async(), which directly calls device_terminate_all
>>> can be called from atomic context.
>>
>> Right, thanks! Just for my understanding: I still think there is potenti=
al for improvement, because
>> from my understanding it would be beneficial to do the waiting for the b=
its in the status register
>> and the freeing of descriptors in xilinx_dma_synchronize. Do I understan=
d correctly that this is
>> currently not possible due to how the DMA engine API is structured? To m=
ake this possible I think
>> the deprecated dmaengine_terminate_all would have to be removed and all =
users of this API would have
>> to be adapted accordingly, correct? So this would be a patch of much lar=
ger scope than xilinx_dma
>> driver alone.
>
> Yes, your understanding of xilinx_dma_synchronize()and proposed changes
> looks correct.

Thank you for the feedback on this. It is really helpful since I'm quite ne=
w to
writing patches for the kernel. I was thinking about whether I can improve =
the
xilinx_dma driver in this regard, but given the large scope of changing the
whole DMA engine API and all its users unfortunately this task is too big f=
or
me.

BR
Alex

