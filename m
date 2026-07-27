Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0348C53219
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 12:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2DwJync12MoNs5MixgQMQ177aBKK+JMAGvJmNJHNnhg=; b=RorECFSFcxpHdk2SVrJRKstzXy
	/kGUHy1h0Wqv0Xsa6GLQNHv3i7FUvNJCXcea8Dt3mmHZOK2FsxjdBZJ0wEmvRc/c1umTohCIhomI9
	gJ9oSDermSBvg7FUaR5zky7VsSqNzZj6mLScclggnUNCHvbXQPwumBMYRNvhx7HXrc22l89dRweru
	3vZjBKsriwbYuwDkyQkIOxSdnqU1qEGAaPKd/GGheJWajdleA2OkmZzyPg4vOyJ8q+6gEzhsbgyF+
	sdJBhE3s3FukmT6NV/o6S782U+pjOP1Oi0CQe3D/4rdMkEGfRilrNwTpqld6S1nMt9y9ouxWQXm8t
	bkz74GFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKSS-00000002hJK-01XV;
	Mon, 27 Jul 2026 12:29:24 +0000
Received: from relay.yourmailgateway.de ([188.68.63.170])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woKSF-00000002h5X-1gAD;
	Mon, 27 Jul 2026 12:29:13 +0000
Received: from mors-relay8203.netcup.net (localhost [127.0.0.1])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4h7yZS3MP5z8lpL;
	Mon, 27 Jul 2026 12:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1785155344;
	bh=nfwLFm2s3mkTM2bTTozuGx3qZH+WyTsP4vZXhJR8xH8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NmYTf66zpT0fsBdmv33DJ8RG8WMVRTMkfi9JcJ6TfctfqSYEKXa5exH7YICu4MAbU
	 JwGbcPgrINpDPX7v5PhiSpYvq1q/Ak0TdVfGSkytnBlZExdmnJU8HxoEyahugZC0dq
	 F2tH9ZxwiAK1lX48M2II0eJt1JeffQf9xGYpObjHlDTwe+UpIm6w77gyRzPj9y9c2Q
	 t+ISnj5vFbyUl6SuOcWUFlQ36kechQSwpQ4xb1tCW/Ol3uQaUkMvitNOQ7ILjJvMrI
	 fUnPT61/l/aRzVxIRVkpuH+P3WrOYzRcjlkVcFBmVMphddc9QfY9+8PzlxqsiAHaFp
	 FdhQtskRYTDEw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4h7yZS2ds8z8lmR;
	Mon, 27 Jul 2026 12:29:04 +0000 (UTC)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4h7yZQ5Gysz8sWT;
	Mon, 27 Jul 2026 14:29:02 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id A081C5F960;
	Mon, 27 Jul 2026 14:28:57 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <b26a4890-12e9-4995-a71d-d0b7458b1570@leemhuis.info>
Date: Mon, 27 Jul 2026 14:28:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Gary Bisson <bisson.gary@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Esben Haabendal <esben@geanix.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Adam Thiede <me@adamthiede.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
 <8733xko1ms.fsf@geanix.com>
 <0f719c00-3cf5-4403-afbf-713b07255981@collabora.com> <aleM9Wy9otpd6Je3@owl5>
 <aRN3_2FHX8XmTcwduTAPwz4UFde4B0tbB09ajyeUg5qZxiIYMmbvMkG7CPoNTl4iySYMZawbLMWijO47R22gkg==@protonmail.internalid>
 <65558ccc-4f2c-492d-8c74-627d27dce864@collabora.com>
 <87h5m0mkca.fsf@geanix.com> <alpTEPsy-SIQv_Oc@owl5>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <alpTEPsy-SIQv_Oc@owl5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178515533816.1620399.13965770473853452397@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: A081C5F960
X-NC-CID: 920WuA/XGeNGLrNeQjm1inAdNyxnyRkYtAsxTGFvbL+809nYB2I=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_052911_788602_B16BC62E 
X-CRM114-Status: GOOD (  21.20  )
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

[top-posting to facilitate]

Gary, Angelo, what's the status here? It looks like this fell through
the cracks -- or was this issue fixed in between somehow? If yes: great!
If not: Would be good to finally resolve this, as we are long past "fix
within a week" rule of thumb from Linus:
https://www.kernel.org/doc/html/latest/process/handling-regressions.html#on-how-quickly-regressions-should-be-fixed

And also nearing -rc6, which is when Linus would like to see all known
regressions fixed.

Ciao, Thorsten

On 7/17/26 18:06, Gary Bisson wrote:
> On Wed, Jul 15, 2026 at 03:52:05PM +0200, Esben Haabendal wrote:
>> "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
>> writes:
>>> On 7/15/26 15:36, Gary Bisson wrote:
>>>> On Wed, Jul 15, 2026 at 03:25:11PM +0200, AngeloGioacchino Del Regno wrote:
>>>>> On 7/15/26 14:53, Esben Haabendal wrote:
>>>>>> Gary Bisson <bisson.gary@gmail.com> writes:
>>>>>>
>>>>>>> Some bridges, such as the TI SN65DSI83, require the HS clock to be
>>>>>>> running in order to lock its PLL during its own pre-enable function.
>>>>>>>
>>>>>>> Without this change, the bridge gives the following error:
>>>>>>> sn65dsi83 14-002c: failed to lock PLL, ret=-110
>>>>>>> sn65dsi83 14-002c: Unexpected link status 0x01
>>>>>>> sn65dsi83 14-002c: reset the pipe
>>>>>>>
>>>>>>> Move the necessary functions from enable to pre-enable.
>>>>>>>>>>>> I have run into the same problem, but in combination with
another
>>>>>> pipeline. I am seeing same problem with an i.MX8 using the nwl-dsi
>>>>>> bridge and the dcss driver.
>>>>>>
>>>>>> I have submitted a fix that adresses the problem in the ti-sn65dsi83
>>>>>> driver instead. With a bit of luck, it can replace the fix proposed in
>>>>>> this thread.
>>>>>>
>>>>>> See https://lore.kernel.org/all/20260711-ti-sn65dsi83-fixes-v1-2-d85eb5342b98@geanix.com/
>>>>
>>>> Thanks, just tried it on 7.2-rc3 with my patch reverted and confirm that
>>>> it works too. My assumption was that the SN65DSI83 was locking the PLL
>>>> earlier for some specific reason and therefore was reluctant to change
>>>> it.
>>>>
>>>>> That clarifies a lot of things.
>>>>>
>>>>> The patch on mtk_dsi shall be reverted then.
>>>>
>>>> Angelo, do you want me to offer the revert patch? Should I wait to see
>>>> how the other thread goes?
>>>
>>> Gary, yes please, send a revert and make sure to explain the reason why
>>> we're reverting this in the commit description :-)
>>
>> Maybe test if my fix actually solves the problem with the mtk_dsi driver
>> also ;)
> 
> As mentioned in the other thread, your patch works but it might break
> the init sequence recommended by the bridge datasheet.
> 
> Moreover, the drm_bridge.c doc [1] does mention that the clock lane
> should be initialized during pre_enable. If we agree on this assumption
> I believe my patch should not be reverted.
> 
> Maybe Adam's bridge driver must be patched instead, just like the
> nwl-dsi driver should be updated to follow the drm recommendation.
> 
> Let me know your thoughts.

