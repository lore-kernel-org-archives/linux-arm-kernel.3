Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC1FC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 13:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDCxRirisfN6uyLux6/NztFWSmSCbhNLIdUjj9NMzD4=; b=UzfjCygBS55VogBLePAgWR6GaI
	kZ74rAWWiI3mx+lY7eZBakOUF/WjdMJj2QpXHD0f5bSySocOvRZR0u8rhQ874lVLaW4TEtTNs5TGV
	jGIDoH18HnIe/yZaYIgjAe/Msre3mZYTrGCZmXAw7aRDx9dTtfgvROI6ZyuV29nMAcyUdvIvvHlvO
	eIHSF2BMZAbunRqjcyuMdBHWnVibH6XSu3EVyfwg/9fS/Jq+eko1V/ZzZS39bjKua/XymJWujjdIk
	3iv02uB9zu94RKaFdfw/DrzpDGLUmV2W5BZsHbdrGUg/3s0v+COTdjwTmVcI2yCheOxga4Z1JlyYC
	/9Bla9XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk024-0000000F04t-41Mm;
	Wed, 15 Jul 2026 13:52:16 +0000
Received: from mail-43172.protonmail.ch ([185.70.43.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk01z-0000000F02p-1Xdw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 13:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail3; t=1784123528; x=1784382728;
	bh=UDCxRirisfN6uyLux6/NztFWSmSCbhNLIdUjj9NMzD4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=a0Bkiclvw7YtsGdiNjijqEeosPqVmlBJqkPRQOPVjRIcWdpBc5/QHRK6DQJprrq+t
	 IfvVn2dizCjb17bdJFwICujNj8H6+pvdUjbsWcadr3arvnYa46wdSmqXScdp2Ki9Va
	 Todt33JafTXncgGHC7VTBIY2pY+XfoMh7SZi4GmxyzJKjEpI5E+igZp837cHzF7U8Q
	 mJpF3MPRFuxliBSQwWyzwUi9GCbyFfrfu/9Y/+1EQcHFMFBzZ+dC+8kIk5yXU0PYcx
	 4PouPhkKWaSEpPYvHTCfQNyZ4pIxTrrwiztTovh8S1cscxjYwpmzjtxHP6FUohyo+3
	 2V1fw1pkrQYUA==
X-Pm-Submission-Id: 4h0czp2zL3z2ScqH
From: Esben Haabendal <esben@geanix.com>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: "Gary Bisson" <bisson.gary@gmail.com>,  "Chun-Kuang Hu"
 <chunkuang.hu@kernel.org>,  "Philipp Zabel" <p.zabel@pengutronix.de>,
  "David Airlie" <airlied@gmail.com>,  "Simona Vetter" <simona@ffwll.ch>,
  "Matthias Brugger" <matthias.bgg@gmail.com>,
  <dri-devel@lists.freedesktop.org>,  <linux-mediatek@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  <linux-arm-kernel@lists.infradead.org>,
  "Adam Thiede" <me@adamthiede.com>,  "Thorsten Leemhuis"
 <regressions@leemhuis.info>
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
In-Reply-To: <65558ccc-4f2c-492d-8c74-627d27dce864@collabora.com>
	(AngeloGioacchino Del Regno's message of "Wed, 15 Jul 2026 15:40:37
	+0200")
References: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
	<8733xko1ms.fsf@geanix.com>
	<0f719c00-3cf5-4403-afbf-713b07255981@collabora.com>
	<aleM9Wy9otpd6Je3@owl5>
	<aRN3_2FHX8XmTcwduTAPwz4UFde4B0tbB09ajyeUg5qZxiIYMmbvMkG7CPoNTl4iySYMZawbLMWijO47R22gkg==@protonmail.internalid>
	<65558ccc-4f2c-492d-8c74-627d27dce864@collabora.com>
Date: Wed, 15 Jul 2026 15:52:05 +0200
Message-ID: <87h5m0mkca.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_065211_565950_466E19F8 
X-CRM114-Status: GOOD (  14.25  )
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

"AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
writes:

> On 7/15/26 15:36, Gary Bisson wrote:
>> Hi,
>>
>> On Wed, Jul 15, 2026 at 03:25:11PM +0200, AngeloGioacchino Del Regno wrote:
>>> On 7/15/26 14:53, Esben Haabendal wrote:
>>>> Gary Bisson <bisson.gary@gmail.com> writes:
>>>>
>>>>> Some bridges, such as the TI SN65DSI83, require the HS clock to be
>>>>> running in order to lock its PLL during its own pre-enable function.
>>>>>
>>>>> Without this change, the bridge gives the following error:
>>>>> sn65dsi83 14-002c: failed to lock PLL, ret=-110
>>>>> sn65dsi83 14-002c: Unexpected link status 0x01
>>>>> sn65dsi83 14-002c: reset the pipe
>>>>>
>>>>> Move the necessary functions from enable to pre-enable.
>>>>>
>>>>> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
>>>>
>>>> Hi
>>>>
>>>> I have run into the same problem, but in combination with another
>>>> pipeline. I am seeing same problem with an i.MX8 using the nwl-dsi
>>>> bridge and the dcss driver.
>>>>
>>>> I have submitted a fix that adresses the problem in the ti-sn65dsi83
>>>> driver instead. With a bit of luck, it can replace the fix proposed in
>>>> this thread.
>>>>
>>>> See https://lore.kernel.org/all/20260711-ti-sn65dsi83-fixes-v1-2-d85eb5342b98@geanix.com/
>>
>> Thanks, just tried it on 7.2-rc3 with my patch reverted and confirm that
>> it works too. My assumption was that the SN65DSI83 was locking the PLL
>> earlier for some specific reason and therefore was reluctant to change
>> it.
>>
>>>> /Esben
>>>
>>> That clarifies a lot of things.
>>>
>>> The patch on mtk_dsi shall be reverted then.
>>
>> Angelo, do you want me to offer the revert patch? Should I wait to see
>> how the other thread goes?
>>
>
> Gary, yes please, send a revert and make sure to explain the reason why
> we're reverting this in the commit description :-)

Maybe test if my fix actually solves the problem with the mtk_dsi driver
also ;)

/Esben

