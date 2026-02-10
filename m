Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C424EF06ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 11:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V8crLI44g1DsLEHB024GHulFB1kvu+UtDdlE2bSCrX4=; b=No53xtutatTAlfFhoJRLQ3nCyL
	jTrhP22MCBaEZFbL7/uozp5bm3dXHbvJp6Z2EbyKsbaut5c3/xnTNcOIrM5gdHpQRyg8IONfR89nm
	l8gtzSqM0Myxatbfuv+GgRx7F/uu8sy4UQ6IR3UdEuBm3iteTJj7XByLouU5whdB/9ZnLRKlY62FZ
	HPKCV2JlxZFDr4T7NyTrFuuWIOgNOPON5TfSr4pTRaav5frfFARKFkGER+2NtyWFDVdxcqVhgTBGX
	7GsoV531n77obXK0kfx9y9/pK3XgPfzzeHfDkiUWAObvXvQcH753Bw4S6iBcJgP6SOBodPhUO2Hrj
	YZq9WPyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vplxx-0000000Gt9p-2wdQ;
	Tue, 10 Feb 2026 11:31:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vplxu-0000000Gt95-2aTc;
	Tue, 10 Feb 2026 11:31:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770723090;
	bh=Dda5EyfS/mUf58NECP6/RPGWDX/572xH+xh6MoBCJCY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Nfihc0kHazcC50eVR4FMsM5nDqivuBoghIHrKvFJlSyifQ9YeM7ucf+rvIV2C2FKu
	 FQ1+3Z8I+yLDhq1xyBwUbdBKCjk+LKytHEJP9HgXjCVyNi6Pa8dZcJhn40Isaez+IY
	 Z+GIFXQGo22NdkhgmeLGKYAbAcpot8ejF/0oZ+dFZx5VsDVgz2ffXTdJTpj15C1bXq
	 UaMydpBX+gXDk8SADeSMBktGYbjo77dmu3GPTZkpeDo7ReJnUPVrfA8BaEk+V8sllu
	 39aWwAyyEEgdNQcqXSIiVwMN/nhmEDxyDfFBZaFEUA4/MJcr9M5Op/idvTDY+wAoIt
	 2YIEq66cNiPHQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C845117E12C5;
	Tue, 10 Feb 2026 12:31:29 +0100 (CET)
Message-ID: <0960ece8-02e6-468f-9ee6-38e529939d35@collabora.com>
Date: Tue, 10 Feb 2026 12:31:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: dsi: Store driver data before invoking
 mipi_dsi_host_register
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260209090516.14369-1-l.scorcia@gmail.com>
 <5535ac41-efb8-4bf5-91bb-9b6f63517e8f@collabora.com>
 <CAORyz2J=zEMgNS6n6ouVZ3QA1moYfP053Jr5vhcscR9nDmKOfA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAORyz2J=zEMgNS6n6ouVZ3QA1moYfP053Jr5vhcscR9nDmKOfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_033134_834009_1685705F 
X-CRM114-Status: GOOD (  24.71  )
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

Il 09/02/26 19:46, Luca Leonardo Scorcia ha scritto:
> Il giorno lun 9 feb 2026 alle ore 12:40 AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> ha scritto:
>>
>> Il 09/02/26 10:05, Luca Leonardo Scorcia ha scritto:
>>> The call to mipi_dsi_host_register triggers a callback to mtk_dsi_bind,
>>> which uses dev_get_drvdata to retrieve the mtk_dsi struct, so this
>>> structure needs to be stored inside the driver data before invoking it.
>>>
>>> As drvdata is currently uninitialized it leads to a crash when
>>> registering the DSI DRM encoder right after acquiring
>>> the mode_config.idr_mutex, blocking all subsequent DRM operations.
>>>
>>> Fixes the following crash during mediatek-drm probe (tested on Xiaomi
>>> Smart Clock x04g):
>>>
>>> Unable to handle kernel NULL pointer dereference at virtual address
>>>    0000000000000040
>>> [...]
>>> ---[ end trace 0000000000000000 ]---
>>>
>>> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
>>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>> ... but wait, what have I just read? Xiaomi Smart Clock?! MT8167?
>>
>> Are you running upstream on this device?
>> If so, why don't you also contribute a nice devicetree to get this device finally
>> upstream?!?! :-)
> 
> That's correct! Most of the work had already been done by the
> wonderful people at postmarketOS, I just had to connect the dots. Some
> crucial patches (mt6392 regulator, mt8167 display nodes) were
> submitted in the past but weren't merged for various reasons.
> 
> Just rebased on v6.19: https://pasteboard.co/6bXQeWlwUqmz.jpg

Oh that's so cool!

> 
> I am trying to get it working as much as I can, then cleanup and
> submit. At the moment storage, usb networking, rtc, buttons, screen,
> touch, backlight, light/presence sensors, drm and gce are all working;
> still missing wifi/bt, audio and cpuidle.
> 

You got an astonishingly big amount of features working fine then.
That is practically almost everything.

I do encourage you to send all this good stuff upstream, as I'd anyway not really
expect your v1 to be perfect (however, I'm ready to get pleasantly surprised, so
please do?!).

Getting your current state correctly upstreamed makes you able to avoid refactors
during development and to actually get all the rest here upstream in relatively
less time.

After all, while it would be nice to have something complete and 100% working in
the first-ever iteration, you got really a lot of nice stuff there - and from an
upstream point of view, a device with this percentage of completion would be
perfectly acceptable.

Sending patches to add up more features later, even one by one, is just a regular
workflow, so that'd be perfectly acceptable as well.

What is not acceptable is non-functional placeholders that get deleted entirely
with subsequent patches (like adding a UART node with fake pinctrl because the
bootloader leaves that configured, but then deleting everything and refactoring
to make it proper ... bar exceptional cases, of course, everything is always
relative to specific situations).

Ultimately, it's your choice though, of course.

Keep up the good work!

Cheers,
Angelo

>> Cheers,
>> Angelo
>>
>>> ---
>>>    drivers/gpu/drm/mediatek/mtk_dsi.c | 4 ++--
>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
>>> index 4c2983852596..2358407b8a6b 100644
>>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>>> @@ -1232,6 +1232,8 @@ static int mtk_dsi_probe(struct platform_device *pdev)
>>>
>>>        dsi->host.ops = &mtk_dsi_ops;
>>>        dsi->host.dev = dev;
>>> +     platform_set_drvdata(pdev, dsi);
>>> +
>>>        ret = mipi_dsi_host_register(&dsi->host);
>>>        if (ret < 0)
>>>                return dev_err_probe(dev, ret, "Failed to register DSI host\n");
>>> @@ -1254,8 +1256,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
>>>
>>>        init_waitqueue_head(&dsi->irq_wait_queue);
>>>
>>> -     platform_set_drvdata(pdev, dsi);
>>> -
>>>        dsi->bridge.of_node = dev->of_node;
>>>        dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
>>>
>>
>>
> 
> 

