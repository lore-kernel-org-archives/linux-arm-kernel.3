Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113AEC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ca2xjCcIPwv5SZpb+hHKk6ykuub1mXNAkOrPLcxmPi4=; b=Lveo3vUAHWMPlelhqR0+P2ncoi
	zx7SDvoj8kMVQf8mHAy94MerNJf/8EetpbWqsFArQ+FRxpBs+uH2jDLCgDZLXPtCTtIJ4FzMLAKcT
	Ks37AWnLYP8RkLnk/2RYxvjNSKILVkiIrjFzrRCLBjrvsD/9rL16v5z2ERJGW8O8aP/OxQuuRth27
	ZNhHnJUohrG1JyeGpTO4PuviWNCH0llEYVcd2BGL4UvY/ylQzuq3ID9qHaTBfVlt9m0w16kG1nVjt
	h4ZQXK2KZJ3ITFyor+/0ihbj+r6iLS+eXAUP0JYaejkrIHqOKJXKuPifvBJKiEJjWeD6ovQMaO6qi
	ZB+UAR7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzqt-0000000EyHx-292y;
	Wed, 15 Jul 2026 13:40:43 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjzqq-0000000EyHV-44uo;
	Wed, 15 Jul 2026 13:40:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784122838;
	bh=o/mx+IN6C01zZLNimc1fWVcEnAB8uqWOfSp7yzRlGTQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=h6HIF+R9TYxE7aHeLmINbKqn5m4qofb1wYuAazpsR/fFZMfuod1n3QUNAp4zRG3Og
	 SpkfqjciJ7Ku39dxKB1e5YbnT2jE+WAIKpFG41SUFb7sUoHSKNYI5ajah2DUYVtilB
	 VYLbpqnuT6mawGrcQYTM3o1vqh+sMNbssoJfU+qP5Fd38fpv0ySDNBnPnCo0vLtkfD
	 ToRQYRq6w0aLRrsMZKkiAQOJLtaOVRCkVHXGhgjWDzJTZYaIbewu6o3PxLgq5nn2BS
	 /jiqkwMRd+xSbJ8e7Jy7cOT/zQ72nrX5+811Fl6OkHXzXHInnN5bNC8H6+jzMuyo3S
	 +nsCNakXsDIAg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3504517E0018;
	Wed, 15 Jul 2026 15:40:38 +0200 (CEST)
Message-ID: <65558ccc-4f2c-492d-8c74-627d27dce864@collabora.com>
Date: Wed, 15 Jul 2026 15:40:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
To: Gary Bisson <bisson.gary@gmail.com>
Cc: Esben Haabendal <esben@geanix.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Adam Thiede <me@adamthiede.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>
References: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
 <8733xko1ms.fsf@geanix.com>
 <0f719c00-3cf5-4403-afbf-713b07255981@collabora.com> <aleM9Wy9otpd6Je3@owl5>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <aleM9Wy9otpd6Je3@owl5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_064041_163983_47FDDD91 
X-CRM114-Status: GOOD (  16.75  )
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

On 7/15/26 15:36, Gary Bisson wrote:
> Hi,
> 
> On Wed, Jul 15, 2026 at 03:25:11PM +0200, AngeloGioacchino Del Regno wrote:
>> On 7/15/26 14:53, Esben Haabendal wrote:
>>> Gary Bisson <bisson.gary@gmail.com> writes:
>>>
>>>> Some bridges, such as the TI SN65DSI83, require the HS clock to be
>>>> running in order to lock its PLL during its own pre-enable function.
>>>>
>>>> Without this change, the bridge gives the following error:
>>>> sn65dsi83 14-002c: failed to lock PLL, ret=-110
>>>> sn65dsi83 14-002c: Unexpected link status 0x01
>>>> sn65dsi83 14-002c: reset the pipe
>>>>
>>>> Move the necessary functions from enable to pre-enable.
>>>>
>>>> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
>>>
>>> Hi
>>>
>>> I have run into the same problem, but in combination with another
>>> pipeline. I am seeing same problem with an i.MX8 using the nwl-dsi
>>> bridge and the dcss driver.
>>>
>>> I have submitted a fix that adresses the problem in the ti-sn65dsi83
>>> driver instead. With a bit of luck, it can replace the fix proposed in
>>> this thread.
>>>
>>> See https://lore.kernel.org/all/20260711-ti-sn65dsi83-fixes-v1-2-d85eb5342b98@geanix.com/
> 
> Thanks, just tried it on 7.2-rc3 with my patch reverted and confirm that
> it works too. My assumption was that the SN65DSI83 was locking the PLL
> earlier for some specific reason and therefore was reluctant to change
> it.
> 
>>> /Esben
>>
>> That clarifies a lot of things.
>>
>> The patch on mtk_dsi shall be reverted then.
> 
> Angelo, do you want me to offer the revert patch? Should I wait to see
> how the other thread goes?
> 

Gary, yes please, send a revert and make sure to explain the reason why
we're reverting this in the commit description :-)

Cheers,
Angelo

