Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EE59C531FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 14:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KfcU5H+Dkc55kRl5OSkSuyA//fHfe+3ucaRyL28Jci8=; b=eGjsxgLJdRq9ixBRZy0AdHsON6
	ZL6q5M4UXzxASt84hxNgF7qgG8/GAVnJwLt3wn34rDFEDRK9cYOKwhc5/glbH35D8zcQJuvewreiZ
	ya8aEk3i9YYwPBcHEC8CxZNxq4ye587aIoPqhaKZHm1VHxCB2JJTmWhk6L5eGWbq4sc/2zgdD1ADC
	6r9OxpZGfXAMJBZjvf1MXiDq3yN+Cn4PbufkgEkaTscWSXu1mh8c4fuQV8+/VB6iDBvZ18lhajZkU
	+BnA5X3g58qndEV+ucJHxuLnxZnVSQdV3ClrhijiExktKWBQ6fuoh4gJUC0+aIuBY6MEj8uxiNVOc
	7fHLAw4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMFP-00000002yfq-2hfy;
	Mon, 27 Jul 2026 14:24:03 +0000
Received: from relay.yourmailgateway.de ([46.38.247.119])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woMFM-00000002yep-2Grc;
	Mon, 27 Jul 2026 14:24:02 +0000
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4h816M5wNBz8CwK;
	Mon, 27 Jul 2026 16:23:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1785162203;
	bh=JBhZ+LwoQ70+qErV2cTCemtVryLVM0RxTuEG+2Y3/co=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f2/2sxdFVhE94wwd/yWnIycOJh85rGDGpXQf71t2SYYDe4U+iSLNHJd8sUrzcZmaB
	 HPIoqQvSKphfyTmKBJXpjXOBTYrYKmi7JsliX2RN8lwJUA/wl6rTMT1oXG8Drs8hKB
	 rB3xT8wfUN2oOH9lSje2PQkTXmJngjvF5qrUxXM2cumLdwjWoViQWpwJtMCMiWnb0T
	 wanxcSKA98IMuBPfNroyvvV/dD7Qp1GRQthFvDNiat7NqEw02qPj8YhcfUmLn10s96
	 JIG8vb0OjwjevlH0ml8bPMHAydxfektsxPewXwXBbIzjLTp++CQgWc+zs7/XoKxHhZ
	 w23KkSOKbfZSQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4h816M5BSGz4xtW;
	Mon, 27 Jul 2026 16:23:23 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4h816K0sHxz8svG;
	Mon, 27 Jul 2026 16:23:21 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 1FA265FA76;
	Mon, 27 Jul 2026 16:23:16 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <1826ddd9-6edd-4481-a31d-6cbb083b3a56@leemhuis.info>
Date: Mon, 27 Jul 2026 16:23:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
To: Gary Bisson <bisson.gary@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Esben Haabendal <esben@geanix.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Adam Thiede <me@adamthiede.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
 <8733xko1ms.fsf@geanix.com>
 <0f719c00-3cf5-4403-afbf-713b07255981@collabora.com> <aleM9Wy9otpd6Je3@owl5>
 <aRN3_2FHX8XmTcwduTAPwz4UFde4B0tbB09ajyeUg5qZxiIYMmbvMkG7CPoNTl4iySYMZawbLMWijO47R22gkg==@protonmail.internalid>
 <65558ccc-4f2c-492d-8c74-627d27dce864@collabora.com>
 <87h5m0mkca.fsf@geanix.com> <alpTEPsy-SIQv_Oc@owl5>
 <b26a4890-12e9-4995-a71d-d0b7458b1570@leemhuis.info> <amdTnudq48tZUTG2@owl5>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <amdTnudq48tZUTG2@owl5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178516219658.2742281.2869505277937587540@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 1FA265FA76
X-NC-CID: 43uR6QNMyemn/nPkJoEiLbUEjzWk0VHzRbV5Th599RFa0TAAe38=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_072400_903394_9DBF86F7 
X-CRM114-Status: GOOD (  23.83  )
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

On 7/27/26 14:48, Gary Bisson wrote:
> On Mon, Jul 27, 2026 at 02:28:56PM +0200, Thorsten Leemhuis wrote:
>> [top-posting to facilitate]
>>
>> Gary, Angelo, what's the status here? It looks like this fell through
>> the cracks -- or was this issue fixed in between somehow? If yes: great!
>> If not: Would be good to finally resolve this, as we are long past "fix
>> within a week" rule of thumb from Linus:
>> https://www.kernel.org/doc/html/latest/process/handling-regressions.html#on-how-quickly-regressions-should-be-fixed
> 
> Not much happened I'm afraid. The status as I see is:
> - this patch is necessary to have TI SN65DSI83 working
> - this patch also follows the DRM guidelines saying that HS clock must
>   be enabled during pre_enable (see previous answer / [1])
> - this patch has been successfully tested against MIPI-DSI panels (by
>   Angelo) and LVDS panels via TI bridge (by myself)
> - Adam reported an issue with another bridge (PS8640) where resume is
>   broken
> - Esben offered a patch to the TI bridge that would fix the issue we
>   were seeing in the first place.
> 
> But for the last two points, I'm not sure this calls for a revert yet:
> - enabling HS clock in pre_enable still is what should be done [1]
> - maybe the issue Adam is facing is due to the bridge driver instead as
>   it could not be reproduced with another setup
> - Esben patch would break the SN65DSI83 init sequence, suggesting that
>   the culprit really is the MIPI bridge for not following the HS clock
>   requirement in pre_enable instead [2]
It's tricky, yes, but I suspect the right time for a revert was weeks
ago. What Linus afaics basically wants in situations like this (espe.
with two reporters) boils down to "something broke recently, no fix was
found within a week or maybe two, so we go back to the previous state to
restart from there -- and this is nothing bad, that's just done to buy
us time."

If something is right by some hardware or DRM specs often doesn't matter
much. What makes this tricky is the fact that the revert might cause a
regression for those that relied on the functionally the change brought.
But I suspect even then Linus prefers a revert, as it's a recent change
that only went into 7.1. The quoted from Linus on this page cover this iirc:
https://www.kernel.org/doc/html/latest/process/handling-regressions.html#quotes-from-linus-about-regression

If we can't agree on this, we maybe should ask Simona or Airlied for advice.

Ciao, Thorsten

