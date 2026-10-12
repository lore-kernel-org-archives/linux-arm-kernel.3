Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 062EBCA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 08:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=19boBTCsjzigUNehuNnbCAd0sjXKxyv/w6iDQ2Y4Fdc=; b=XBKW8X38nfwO/1akl896Ib13c2
	dIB8wnTiEq2L6wRYNKSoB+oiZqIXk6ZAh/6e/NvxAG+rG5UR8xAQrtvPef4wCpx+pmcbp+Jxzt6V/
	bpc4PI99VSxAORBCorjG7rcEB1ZPHtI7u0noMbcc4MT/cwGwMpBrgt8fzeAuA13RH+V1mi4DTZhX+
	y1zsFcQ/KffYpZ6ZmBI7ecYhBE6SLLe/+lAZkPkEY/nrs/tzuGDB4r3+zVi4l4yO2tm6CDCV2E6lr
	iRFbZRhE/F5YoYMD/spd+8uS8pVS0lRJ5SzhAdukbC50xjhJkP29XUtmcI4E4+C82ONHVf+IxnN5v
	8+q63TIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBfy-00000009yvC-1GKk;
	Mon, 12 Oct 2026 08:46:30 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGBfv-00000009ytY-0lpD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 08:46:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 957A53EB8E;
	Mon, 12 Oct 2026 08:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1791794782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=19boBTCsjzigUNehuNnbCAd0sjXKxyv/w6iDQ2Y4Fdc=;
	b=AAz8ZPAZyEpuFA2hg1GD2suLLmvBqd0ODa7hc1UL+saONfjIxVSk6G/tnsQe2ISC1P0G4y
	VfxTMHDMvQ0SZdF0yzIY/jsdYFHuCL2MQyvJFMaWhQm9liejE3gEDXTWRaJYvrtY6XxDTY
	QeVKWrkiKVYFh8wizEQb7r8XBHtku4LDZ4ZwEiIndpKFQaTH7DIpd3jqTHzBuTH7olquCm
	HUb/Zl1H7kEfZa5DEizrslSK8++usYILUQQIMp6BKUNSzVEKh+aFJ+ehl/oZFk6NR2R63V
	nudiPNLAPLX9rUQkjM56gpuhxlvy2Vvo5vSA8vmwDlfzD9bBEl+/zdF274qzUQ==
Message-ID: <ee54b08f-b3d8-4a62-bc43-0117a9b11102@yoseli.org>
Date: Mon, 12 Oct 2026 10:46:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] m68k: coldfire: Add RNG support for MCF54418
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Olivia Mackall <olivia@selenic.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Frank Li <Frank.Li@nxp.com>, Herbert Xu <herbert@gondor.apana.org.au>
References: <20251126-b4-m5441x-add-rng-support-v4-0-5309548c9555@yoseli.org>
 <20251126-b4-m5441x-add-rng-support-v4-2-5309548c9555@yoseli.org>
 <bd25e903-30fc-4905-986c-96d1b42e9f02@linux-m68k.org>
 <ddf0ab32-5b66-453e-b7aa-1722aeaf2aa0@yoseli.org>
 <9ba1ebd8-61cc-4e1a-b68d-906b20dd4999@polyxeno.com>
 <asn8e5puc3I01Lva@gondor.apana.org.au>
 <8be9c875-68a9-4bb5-b581-501a0a6819f4@linux-m68k.org>
Content-Language: fr-FR, en-US, en-GB
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <8be9c875-68a9-4bb5-b581-501a0a6819f4@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTEPWrJqe016L8I3chHHuK71fvLMlYu+6IrNfxrvD/MyQtgB2kOmSroRn5pztNxyoPXTsP3v9st2xoK0cTKVkCkEXnzk+tyydkEnZa3BeDOpN+lBo3VSfju+U2Tk5DFLr2QTf3rS7cF70bZN6RCshXOZ6HVSfbaHlah6rgF+S1ghDvtrdNc33ylG978pFkIVKZAjrHrrK4lzsId4ZikSGWG++dyZRIZYSLuxWGOy6uWwFvRqYp7eHk+F8lCkqQkRzDYLf/PNuPs9yHrHnCbSXcwXnUuKid+zR4eyu85684+A5SFc3yxeSVSajXUtZMboFqBEssGGUH2TBR8Yk1f07MSZJgLkJ/dO+CwPvwngLjI92MEv73dMHbbBqJibq0do1B0Lz0Zo4mzA4OezcBN5mVpeb0VThW9sEYznRUJeYGoRvkCbWRdrYkcknQFhqJwUI1dRKs9JjHOG0kHLDHZ8rpKjMT14YRCg/zYDN9c5wK/DOOHXEvlA1ipL+b+3rKxzP3fnDw63p4Y44/pyd0xok+TQxEAM35f5EE+5btGH4X2G7kPlNHHh5Ik+e2cJFW/1kSa3D12NjWBUnaHClNFyhqUsOcUOJZDYAZk3O5uHc2Xx45m7gaOtKGgKEbDe1QC01g3/kF2lnlW+BO6+ah4NHNgEER4kazqxwF5roUA2tzhB1w
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_014627_394342_487C2E0D 
X-CRM114-Status: GOOD (  17.18  )
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

Hi Greg,

Le 11/10/2026 à 17:28, Greg Ungerer a écrit :
> Hi JM,
> 
> On 10/10/26 18:51, Herbert Xu wrote:
>> On Wed, Aug 19, 2026 at 07:36:36AM +1000, Greg Ungerer wrote:
>>> Hi JM,
>>>
>>> On 19/8/26 01:09, Jean-Michel Hautbois wrote:
>>>> Hi Greg,
>>>>
>>>> Sorry for the very long silence on this one, it fell off my radar...
>>>>
>>>> Le 03/12/2025 à 13:15, Greg Ungerer a écrit :
>>>>> Hi Jean-Michel,
>>>>>
>>>>> On 26/11/25 17:08, Jean-Michel Hautbois via B4 Relay wrote:
>>>>>> From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
>>>>>>
>>>>>> Add support for the hardware Random Number Generator (RNGB) found on
>>>>>> MCF54418 ColdFire processors with clock enabled at platform
>>>>>> initialization.
>>>>>>
>>>>>> The RNGB block is compatible with the imx-rngc driver.
>>>>>>
>>>>>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>>>>>> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
>>>>>> ---
>>>>>>    arch/m68k/coldfire/device.c       | 28 ++++++++++++++++++++++++++++
>>>>>>    arch/m68k/coldfire/m5441x.c       |  2 +-
>>>>>>    arch/m68k/include/asm/m5441xsim.h |  9 +++++++++
>>>>>>    drivers/char/hw_random/Kconfig    |  3 ++-
>>>>>>    drivers/char/hw_random/imx-rngc.c |  7 +++++++
>>>>>>    5 files changed, 47 insertions(+), 2 deletions(-)
>>>>>
>>>>> I am happy with the ColdFire arch parts, so from me:
>>>>>
>>>>>       Acked-by: Greg Ungerer <gerg@linux-m68k.org>
>>>>>
>>>>> I don't mind taking this commit via the m68knommu git tree if the hw_rng
>>>>> maintainers are ok with that. Otherwise if you break out the arch/m68k
>>>>> parts I can apply those on their own.
>>>>
>>>> I think Herbert acked ?
>>>> Do you need another ack ?
>>>
>>> I would like to see an acknowledgement that taking this patch via the
>>> m68knommu git tree (to Linus) is ok with the RNG maintainers.
>>
>> I have no objections to this.
> 
> Thanks Herbert.
> 
> JM: I have applied this to the for-next branch of the m68knommu git tree.
> I didn't quite go on cleanly, so please double check it for me.

Thanks, I think you missed 1/2 ?
Or did I miss something ?

Thanks !
JM

> 
> Regards
> Greg


