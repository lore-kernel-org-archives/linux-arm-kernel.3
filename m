Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6B3C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 03:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=myPH6l0fPDFrYP8tIa5SQdEq5I1Vnw5X3g3YUMM3Fvo=; b=crT7LUER5kz6hL3T+1usMYhMZa
	JSt82O+hIJEv6AqThwNFfuyqhxsSsg5Sa+/c2ZLP1scxgNpmXILu/+94g8kAto4qFCF/LkHB2J1v6
	dESwxWtVua1AFnkbC/7SUudoRIEjPcoouNj3C2MYUcl6zr3sK0z0NTfR4h0hwCVbppVu5lmF5BrAq
	jfsu3AvEA2zBL21HHi+Jp1RXLvXdmKNzLjw/Bj8n+u59A4QQK/t4PeD4++ewiBQedFYGrRR8dJ/4N
	224cFKt3ci8V//nR5YifVMUdZYwpfzwwY/4ID4nsQrDF4P8tueVt6UciSwVXFswMhNNAfQTGgObOg
	54AFFSPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj9CM-0000000GwJu-1CN6;
	Sat, 15 Feb 2025 03:50:34 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tj9At-0000000Gw7a-1Xz5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 03:49:05 +0000
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C4F5C11401A1;
	Fri, 14 Feb 2025 22:49:01 -0500 (EST)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-13.internal (MEProxy); Fri, 14 Feb 2025 22:49:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1739591341; x=1739677741; bh=myPH6l0fPDFrYP8tIa5SQdEq5I1Vnw5X
	3g3YUMM3Fvo=; b=f2mN4FYAsZWTmcoXQzLdOm6nhCSQVsklPCaxxA3I0gRl6Llb
	r7XnsUtluxKlfvd0CvNdhDXW5oqw0eXUTxWXGPRwEAe8/48OmMyUZ5DaRga+/+om
	T49CWoIlw6YUesuxbcrecerkGSFutscBq4RLnY1K+DaTvzDIhbaEHI6ax33FgLgC
	zk486z37on20gABwb27Uludiseema+Zywyshlxfjg23XHb1u1FqUPP0o0wbSLfOE
	PgFdntSbZxXBHsucZTX6a1r2UgZiaumeoVzSaJENkC5DisSWrs2ueAAoxpCG8CvJ
	9O+DVifnxQo1Up2Tm7ZUi4DsqFT7BLF9FICa+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739591341; x=
	1739677741; bh=myPH6l0fPDFrYP8tIa5SQdEq5I1Vnw5X3g3YUMM3Fvo=; b=h
	5kGlGKe8nmS4hPtg4pyM/dztqaM1EI/EUXKsufWrss4oipO4lSS9bFUucVo4SNp1
	+JXOOypne61enHqc5tB5kn88ixbz/gd5CDUao5NaeDAq8x7/E6tuc27d16u48QfS
	J9Iu9d8r0Dl+brQaLUprh0KktWb+CYPA0S6JztTAyEdR3yRcZ1ez0ZrzBHN3qU95
	QNhuPw65PjxSjtqcrzSwynVyKoB6pffHN8Nz8U8XLUutkCAHeKFLjQuiswM4xVPu
	QL42I5S4zEcIODBJ8U5WQRaJkgPEV5TgHhhHgq7bDfN5W26/5to+X4KAtzajydcc
	WBVM+Q5TSBs0pR5iPkRcQ==
X-ME-Sender: <xms:qw6wZ3Nc5rAOzMC_OTcN0l0edsxhS-uHEt9Sa7PrG6D6mwUQAtKocA>
    <xme:qw6wZx_LHoVEOB_G13QugvaiTAkZRDFj1YEa9aHqHFd8i9vQqGs7dbXxGCPuXrDmp
    0CcVTkoHx1_LLGRgA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehudeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdfthigrnhcuhggrlhhklhhinhdfuceorhihrghnsehtvghsthhtoh
    grshhtrdgtohhmqeenucggtffrrghtthgvrhhnpeejhfeukeejjefguddvffehveevjefh
    tddutdfhudduvdevfeejfffgvdelfeeugfenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehrhigrnhesthgvshhtthhorghsthdrtghomhdpnhgs
    pghrtghpthhtohepvddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgurh
    gvrdhprhiihiifrghrrgesrghrmhdrtghomhdprhgtphhtthhopehmthhurhhquhgvthht
    vgessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepfigvnhhssegtshhivgdrohhrgh
    dprhgtphhtthhopegurghnihgvlhesfhhffihllhdrtghhpdhrtghpthhtoheprghirhhl
    ihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtg
    esghhmrghilhdrtghomhdprhgtphhtthhopehmrggtrhhorghlphhhrgekvdesghhmrghi
    lhdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:qw6wZ2SujnKu_6uipJMxuvzHBwznXkOUFi4IQc6DAf04ouMRp0sR3Q>
    <xmx:qw6wZ7uEgbjmfrGBLm1FIJath51BFS5DtwamInX0oUUVWq--KZOe0Q>
    <xmx:qw6wZ_dJDa88Ul43SQZRdrfFvtanu8cSuRQkj_uri896EP7RTUWTjw>
    <xmx:qw6wZ30Et1uGUl--L6okTQMkGs0qI1C2w6hwzu_tR1UxvxTfY84y7A>
    <xmx:rQ6wZ18oljfrxqA20zSQwEBuF_J-YT7KozvLnYThvbAI55hTEkpjvDsM>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 981AEBA006F; Fri, 14 Feb 2025 22:48:59 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sat, 15 Feb 2025 16:48:39 +1300
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
Message-Id: <6f14b319-fbb8-413d-a88d-edebf624c7fb@app.fastmail.com>
In-Reply-To: <4c31826f-0ffa-4ada-bcf9-199fcbe6db07@app.fastmail.com>
References: <20240929091107.838023-1-ryan@testtoast.com>
 <20240929091107.838023-9-ryan@testtoast.com>
 <4cumvwkhmbi7fecjeq6r7elon63u3ytootqcvavjg5vfnargy3@wrjpy6pnphmb>
 <4c31826f-0ffa-4ada-bcf9-199fcbe6db07@app.fastmail.com>
Subject: Re: [PATCH v5 08/26] drm: sun4i: de3: add YUV support to the DE3 mixer
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_194903_989414_F5229264 
X-CRM114-Status: GOOD (  11.57  )
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

On Sat, 15 Feb 2025, at 2:18 PM, Ryan Walklin wrote:
> On Sun, 20 Oct 2024, at 3:14 AM, Dmitry Baryshkov wrote:
>> On Sun, Sep 29, 2024 at 10:04:40PM +1300, Ryan Walklin wrote:
>
>>> diff --git a/drivers/gpu/drm/sun4i/sunxi_engine.h b/drivers/gpu/drm/sun4i/sunxi_engine.h
>>> index c48cbc1aceb80..ffafc29b3a0c3 100644
>>> --- a/drivers/gpu/drm/sun4i/sunxi_engine.h
>>> +++ b/drivers/gpu/drm/sun4i/sunxi_engine.h
>
>>> @@ -151,6 +153,9 @@ struct sunxi_engine {
>>>  
>>>  	int id;
>>>  
>>> +	u32				format;
>>> +	enum drm_color_encoding		encoding;
>>
>> Should these be a part of the state instead of being a part of the
>> sunxi_engine?
>
> Sure, would you suggest in sun8i_mixer_cfg?

Hmm, on second thought the mixer config is a const struct, presumably because it is defined per engine variant in sun8i_mixer.c. Is there a better place to store state like this? Otherwise the engine may not be the worst choice, as the color format and encoding apply to the entire pipeline, at least in the case of a single display?

Regards,

Ryan

