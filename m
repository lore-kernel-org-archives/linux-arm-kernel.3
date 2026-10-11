Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04069CA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 15:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SUy5fWmePPbEAj+YDJ2/MdoOMrg1j6oPRs7MuTMGWto=; b=3DE5Moa7IQjzMApOV2MZ+M2FOx
	ZV9jIlDd+9Kbx0CKqyOnEIFw5opgJiIgw137MS0tmOt3O5S0uDmnfxnOSMYGCht+gCgUjOUJYcXgS
	6/IU95XdXK6SlrREptJXD1GF5FJAXiltRdMhGkJ+QNWfEcUvOWmExyq5qYJYXCv1dMFRO01kCdL6e
	V3GhyGmWskYJNKkivJN9cq9rgtr7g9LINewBT6Mvy/o10bBSY4xdRx6hkAHO/ruwU6zIscJX7pMUf
	jXpoouRE9fQBhvVUHliOTuIB6EyLN1CHp4egt7w3ou8iDD4oU4hunXatI8ST9Hu0RAN0Jc83JaKsz
	jRkA7BcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFvTU-00000009Bcn-2q2f;
	Sun, 11 Oct 2026 15:28:32 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFvTT-00000009BcX-1TKV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 15:28:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7EF78600E2;
	Sun, 11 Oct 2026 15:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 258B71F0089B;
	Sun, 11 Oct 2026 15:28:26 +0000 (UTC)
Message-ID: <8be9c875-68a9-4bb5-b581-501a0a6819f4@linux-m68k.org>
Date: Mon, 12 Oct 2026 01:28:24 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] m68k: coldfire: Add RNG support for MCF54418
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
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
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <asn8e5puc3I01Lva@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi JM,

On 10/10/26 18:51, Herbert Xu wrote:
> On Wed, Aug 19, 2026 at 07:36:36AM +1000, Greg Ungerer wrote:
>> Hi JM,
>>
>> On 19/8/26 01:09, Jean-Michel Hautbois wrote:
>>> Hi Greg,
>>>
>>> Sorry for the very long silence on this one, it fell off my radar...
>>>
>>> Le 03/12/2025 à 13:15, Greg Ungerer a écrit :
>>>> Hi Jean-Michel,
>>>>
>>>> On 26/11/25 17:08, Jean-Michel Hautbois via B4 Relay wrote:
>>>>> From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
>>>>>
>>>>> Add support for the hardware Random Number Generator (RNGB) found on
>>>>> MCF54418 ColdFire processors with clock enabled at platform
>>>>> initialization.
>>>>>
>>>>> The RNGB block is compatible with the imx-rngc driver.
>>>>>
>>>>> Reviewed-by: Frank Li <Frank.Li@nxp.com>
>>>>> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
>>>>> ---
>>>>>   arch/m68k/coldfire/device.c       | 28 ++++++++++++++++++++++++++++
>>>>>   arch/m68k/coldfire/m5441x.c       |  2 +-
>>>>>   arch/m68k/include/asm/m5441xsim.h |  9 +++++++++
>>>>>   drivers/char/hw_random/Kconfig    |  3 ++-
>>>>>   drivers/char/hw_random/imx-rngc.c |  7 +++++++
>>>>>   5 files changed, 47 insertions(+), 2 deletions(-)
>>>>
>>>> I am happy with the ColdFire arch parts, so from me:
>>>>
>>>>      Acked-by: Greg Ungerer <gerg@linux-m68k.org>
>>>>
>>>> I don't mind taking this commit via the m68knommu git tree if the hw_rng
>>>> maintainers are ok with that. Otherwise if you break out the arch/m68k
>>>> parts I can apply those on their own.
>>>
>>> I think Herbert acked ?
>>> Do you need another ack ?
>>
>> I would like to see an acknowledgement that taking this patch via the
>> m68knommu git tree (to Linus) is ok with the RNG maintainers.
> 
> I have no objections to this.

Thanks Herbert.

JM: I have applied this to the for-next branch of the m68knommu git tree.
I didn't quite go on cleanly, so please double check it for me.

Regards
Greg

