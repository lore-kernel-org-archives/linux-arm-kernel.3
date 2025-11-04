Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2598CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 03:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/LVRVU1wb4ki3KWvhjOwWIYph+e4orXiwLs8iLuRhYs=; b=qWYabg5V8PH9x0zRufZXA+9WmJ
	PU5gHijRgyg1S3F0QBkuZ58tjGzRgT35WX14ngv0R+sdMCTaAK9D2qlriKWmY6r8gvYj/UwvsdP7J
	46T/10rr+RQwVrxm0XoIMQS79y832r77FViX1YnZwkGbLbqAxwAUcsTv3Ca7Mebd8Cl46HV+HBDvC
	NYjHRHKRBhU/ASrgPUu32nEp+f4kVJtPYgTmIbWk3evmbrhd2Q5FjNVo2MbVeGKfll996o98dgooH
	D1g+tlExzLALenC0j0HZcnwmt1rAWJ3ZXn7XBJgTwxB/BRwo7wR4JukYvEDXb3TSbX8rD1MbkMRfA
	QW7IY7Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG7Wn-0000000B2c9-0ahJ;
	Tue, 04 Nov 2025 03:16:13 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG7Wf-0000000B2ZW-3RRS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 03:16:10 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4d0trb68f1z9tp6;
	Tue,  4 Nov 2025 04:15:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1762226159;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/LVRVU1wb4ki3KWvhjOwWIYph+e4orXiwLs8iLuRhYs=;
	b=bz/Sz5G8bDTmcs8MxDKW4GltYYSQcPT2kwltLV72ozxSYKorHJ6pdUKASScZlcbdRoFCM2
	+7Jeezt4eCpWWGH3Qb4y2RGeYLhwPKOlEL2QJ/jSua12nB+hF4SgfY2UW7QCY0NGNglDgd
	yIAItR7wjisn+gU69yYQaJYsOCS4gwJOStdU3IEWLPzRCu+ALZsOlWi5a9yFgUBC6oRHz4
	LdylWetW3JFdrmXR6WVwlaz0impWKUT4Lsn04B96gBH1p53vhSDXKRkUaZqrqhSLehXQSL
	n4xVKjRpMZdTgdg5ublAxVhue9ALk4uIxmX2cTeWiwiY4qtW53gOZIN6AoYg4w==
Message-ID: <3064e20f-92c8-4e3b-82bc-ef949f312826@mailbox.org>
Date: Tue, 4 Nov 2025 04:07:26 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] drm/bridge: fsl-ldb: Parse register offsets from DT
To: Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org
Cc: Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251017154029.105099-1-marek.vasut@mailbox.org>
 <dc4b1b65-542f-4bd2-bd91-af3fe4223b63@nxp.com>
 <55d44163-4f37-462f-b860-c862cb5ada5a@mailbox.org>
 <b65d9221-bdb3-4e69-beed-6b7646c5d5eb@nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <b65d9221-bdb3-4e69-beed-6b7646c5d5eb@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 2b6b09f05eb987a5cbe
X-MBO-RS-META: m56ydbxsgw89ewsit8a191x7o38ki4um
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_191606_012237_D1D36A5C 
X-CRM114-Status: GOOD (  14.08  )
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

On 11/4/25 3:26 AM, Liu Ying wrote:

Hello Liu,

>>>> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
>>>> @@ -61,24 +61,16 @@ enum fsl_ldb_devtype {
>>>>    };
>>>>      struct fsl_ldb_devdata {
>>>> -    u32 ldb_ctrl;
>>>> -    u32 lvds_ctrl;
>>>>        bool lvds_en_bit;
>>>>        bool single_ctrl_reg;
>>>
>>> single_ctrl_reg can be dropped then, as it can be expressed by failing to
>>> get the second register.
>>>
>>> Furthermore, with this done, lvds_en_bit is the only member left and hence
>>> struct fsl_ldb_devdata can also be dropped, as IIRC there is no need to
>>> use a structure for device data with only a flag.
>> I plan to add more bits into the driver match data when adding the MX95,
>> so I would like to retain these instead of removing them and the adding
>> them back.
> 
> i.MX95 LDB supports two LVDS channels.  Two DRM bridges are needed in single
> or separate LDB mode, while one DRM bridge is needed in split LDB mode.

What do you refer to by "split LDB mode" , some interleaving or some 
such thing ?

> Also, each channel connects to a standalone LVDS PHY.  All these could make
> it intrusive to support i.MX95 LDB in fsl-ldb.c.  Maybe, we could discuss
> about this later, but IMO this patch should remove struct fsl_ldb_devdata.
> It doesn't hurt if we really need to add it back.
OK. The current integration seems to be working fine. Which exact case 
are you concerned about, do you have an example ?

