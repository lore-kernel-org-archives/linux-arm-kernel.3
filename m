Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DF3C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 01:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tOuJgsb9reT9v24EZ+TEHw2W8peMs2GzsTIwm6goNGc=; b=e3Snj2xLKp/HLUhDxK2lasnJbr
	NeKAOhvYMpgY5+A7Q0ZsheUEllzxgM9LJeahYpOP7BIlH+y6GXYBUBbBcwdiV00jgFXvwJ1C0Szj/
	8eRdX8Y0g0k/s0AMXBFojgvOVz+DXr054+xgBYZf5gQNY76i9pY8f5L2s9rbE+kS4V2q0S1rRC5rT
	wZ0RzfOtaGFwaPh+izLbnYQt4j3GiWW3xCtgYLQ3ygoQ6ECIQuESL6Z6QvjDoeJDNroml5bTB0iER
	DApaqOq+1LnOStrHkxf2YmRuYUrNnh1tqwoO01I1iKlJfQmUIlnSCi7DCmnp3H9pZDe8Q9fTcqIKp
	JaPYXspQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj6rU-0000000GkNp-2gF2;
	Sat, 15 Feb 2025 01:20:52 +0000
Received: from fhigh-a3-smtp.messagingengine.com ([103.168.172.154])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj6q1-0000000Gk6t-3PNA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 01:19:23 +0000
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6BC6D11401B6;
	Fri, 14 Feb 2025 20:19:20 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-13.internal (MEProxy); Fri, 14 Feb 2025 20:19:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1739582360; x=1739668760; bh=tOuJgsb9reT9v24EZ+TEHw2W8peMs2Gz
	sTIwm6goNGc=; b=Hl2dxZXeV307gE122iJ/3jRfFeTDxZQISO5FBFwIgCvbs1YP
	wlQSzTfHHGgfDCSf33uabD+jcQ/2J+kDGe3EXgl6CVJOQxMZ4BAEM5VwWxt1HXqk
	9OuiO7JMiFpCk3ApcVeW43JiwT0PbPyJWCZOXWnkUhHm5XzH3Cd/CZu3VAkwpcsi
	MHEY/eNmSzIuA1Sf83jhjQRJ0YF107EhoS860ucNxGMRLcePEsL5b84978STsWFz
	HqZBmn/KHUcUWLoO2iQJLLxhJHvt6NlWNT6kfODpJRyu+zpRZeahwSuTDEoBhMkH
	mTQXVxpLYMyYYG7Lztqxjs77wEE3XbYccaQlwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739582360; x=
	1739668760; bh=tOuJgsb9reT9v24EZ+TEHw2W8peMs2GzsTIwm6goNGc=; b=F
	vlWvLG99wUSOP/zMRkP9qVr+B/2dTNe9AqxVr/mKKNc091mS3zqVrQaXyBthor6E
	h3Gi01UYL62L1mCUPEc8zgpIpyO7th9jNVXOz0hnrh2620vFL0zdm5TFnjibaxYj
	d8Yrbyz84MBTgHzs4ByzZWeUxrwtAUJ9NjotRP/1z4IXmWTMhxQLIyrStHAecjU5
	qOLyqJYS3nr/zJcCeb3REIOP4keYza2EoF1pLP1RvHu7X5W1xLnDeVqXbISURuaj
	YxSvtk64lz1qunGsuK96u8qYQT3ehZmoikZjpotygo0TuyZP9sAg++o4iyRQ8OwD
	N+g+r9C27UMzGyYgm6XHg==
X-ME-Sender: <xms:mOuvZ58osQ0I3vOmGKfQdpQBY83_i83DfAdI1HvRkVEiTHu7nuOEMQ>
    <xme:mOuvZ9tBd5v0DM5FjV4xHRfRyyqqcMDevNG9toTbWfUfQ47ox966KmbitaTyH25U-
    UlIU4ixnQP3lM1efQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehuddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfthigrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtoh
    grshhtrdgtohhmqeenucggtffrrghtthgvrhhnpeejhfeukeejjefguddvffehveevjefh
    tddutdfhudduvdevfeejfffgvdelfeeugfenucevlhhushhtvghrufhiiigvpedunecurf
    grrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgs
    pghrtghpthhtohepvddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurh
    gvrdhprhiihiifrghrrgesrghrmhdrtghomhdprhgtphhtthhopehmthhurhhquhgvthht
    vgessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrgh
    dprhgtphhtthhopegurghnihgvlhesfhhffihllhdrtghhpdhrtghpthhtoheprghirhhl
    ihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtg
    esghhmrghilhdrtghomhdprhgtphhtthhopehmrggtrhhorghlphhhrgekvdesghhmrghi
    lhdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:mOuvZ3AkNu5FEzvDhjznN9rdipvJ5mHnqNeSuE_PNojHd9hrZ3GCUg>
    <xmx:mOuvZ9eP7Q2NP4e19l68Xa3Ayi3Xa_JDMDbqWUZM17dql_ttn57l0g>
    <xmx:mOuvZ-Ms2aUq_dCBvtstZfX12jE7Pg0D0K-hYv-Lgy7o6ecsb4JeIA>
    <xmx:mOuvZ_mq9nez5yynAmFWQX2RcXkvq5vB-b_HS8xMf6VWMfpwfc7zlA>
    <xmx:mOuvZ6srJHxh6iK0HRdurHbPvILiwIhGlkJpRxXqAmBtbtDB62vIttO7>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 408AEBA0070; Fri, 14 Feb 2025 20:19:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sat, 15 Feb 2025 14:18:59 +1300
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
Cc: "Maxime Ripard" <mripard@kernel.org>, "Chen-Yu Tsai" <wens@csie.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Andre Przywara" <andre.przywara@arm.com>,
 "Chris Morgan" <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Message-Id: <4c31826f-0ffa-4ada-bcf9-199fcbe6db07@app.fastmail.com>
In-Reply-To: <4cumvwkhmbi7fecjeq6r7elon63u3ytootqcvavjg5vfnargy3@wrjpy6pnphmb>
References: <20240929091107.838023-1-ryan@testtoast.com>
 <20240929091107.838023-9-ryan@testtoast.com>
 <4cumvwkhmbi7fecjeq6r7elon63u3ytootqcvavjg5vfnargy3@wrjpy6pnphmb>
Subject: Re: [PATCH v5 08/26] drm: sun4i: de3: add YUV support to the DE3 mixer
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_171921_925966_B1B90107 
X-CRM114-Status: UNSURE (   8.14  )
X-CRM114-Notice: Please train this message.
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



On Sun, 20 Oct 2024, at 3:14 AM, Dmitry Baryshkov wrote:
> On Sun, Sep 29, 2024 at 10:04:40PM +1300, Ryan Walklin wrote:

>> diff --git a/drivers/gpu/drm/sun4i/sunxi_engine.h b/drivers/gpu/drm/sun4i/sunxi_engine.h
>> index c48cbc1aceb80..ffafc29b3a0c3 100644
>> --- a/drivers/gpu/drm/sun4i/sunxi_engine.h
>> +++ b/drivers/gpu/drm/sun4i/sunxi_engine.h

>> @@ -151,6 +153,9 @@ struct sunxi_engine {
>>  
>>  	int id;
>>  
>> +	u32				format;
>> +	enum drm_color_encoding		encoding;
>
> Should these be a part of the state instead of being a part of the
> sunxi_engine?

Sure, would you suggest in sun8i_mixer_cfg?

Regards,

Ryan

