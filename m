Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2C4C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 09:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ICAnzqRn8f548e/xF9gHUGpMoaEnzr4UV/vlaT50lSk=; b=USLK3DAzXZLKjfNcOAOCncT1wz
	XNl9oMTWwi5i1XY6Num5GZ3TgufQxqT2/6h6mIXoSR6fTHcjVyL57Ky7WGAMZv6z2SWv8e5AbbdMI
	92Ud2MyROJgUlWeuPG6Rk98KBeYHk2cTqBV1jKCdW/j6PkP2MIkyALso7hgO9gpwcueKN+w7yIPzP
	TdnKviZFc2VBheZY0XyA2AVYAz4TW4VA0SCFDwqKtzAGOLyMtomxkt6NsJxOiMlkq2MrnNy8+xlsr
	mQrfIBp9K3lZUlFtzYp7NpDmdwgnnp2ONPuZy4eekRx7lbIxuK3yJJzPP0tOGNZnqon3uv15hZBLc
	AQwuv6pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFrjq-000000033AM-3Ynk;
	Fri, 16 May 2025 09:52:22 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFrho-000000032u7-22Im
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 09:50:17 +0000
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 524571140104;
	Fri, 16 May 2025 05:50:15 -0400 (EDT)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-06.internal (MEProxy); Fri, 16 May 2025 05:50:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm3;
	 t=1747389015; x=1747475415; bh=ICAnzqRn8f548e/xF9gHUGpMoaEnzr4U
	V/vlaT50lSk=; b=GEx+yCQH6hcWVDweddJQzydxrrzZeZdKPGUKJdP46h1wvpVF
	4Kpd5MNYEEXeMaGtZadn11Tr6PPhJMd4qXvZjvFy8wdjJKZMNTydgjYhRnLiUHEg
	rY4YdrJDV8hw1aXQ2NGw0IKDKdU7C7ljRCCowjjwUDN1c1dD32iCnbVkq/cNRtsN
	WlF5AtKfS4WOzEijOB0iIMrfOeI46MiQAe9dxNVaaBY8scu0OxnFm44V23vjxotz
	LDU6QvpeMpav/fE9TS1l5F0AcujKL+vPuO7C+dMCHoj9mRHJg81n2j1PZvsCbktI
	HYCogxEyhRKqiFwKBPveRoqMEALnFXK8RqOE1w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747389015; x=
	1747475415; bh=ICAnzqRn8f548e/xF9gHUGpMoaEnzr4UV/vlaT50lSk=; b=U
	mgyP2smkPYT4zFKGycsILpZGr1Vl6Iy4PZING0yw38DZ965IDdQZolchV+hsZURE
	Ibs9r0scwq+nNxmkj1W4eVx3fONWHaFMR/Hyq1hXgrpnGh5YKwLmyBWj7mJOnAoM
	9yZIisSXkJe3IE8P0i2CJPn6fi/yd1FSwsVbcsYQ76i0gULwCcnRx8ZrnvVkI9+A
	RrsbAtXltYeTMWo3cLXHR/waAE1VMQKfTYh9+QSSe0IUV++OfxvIFsYYChhETJQH
	FLSHsrPpZhFjTuAL0TpidTDia7Vyzst/wxybqh9v6zSAB90YkBKXQmzjDzDfGiCh
	DNnYikGwvKQ6/MHeng0aQ==
X-ME-Sender: <xms:VgonaOAJcFfpMwmNAZqnNyXo2Oth442oIk7wlq6Fzy16oe3M6baPSA>
    <xme:VgonaIiQCYbSvHRBkR4pzGe5rkX8pjWQDjTddI4nP1QZXZRqp_JrqKH0_ZyiUHQPz
    sj7JrlNQ0VwfMrzmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddvgeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftfihrghnucghrghlkhhlihhnfdcuoehrhigrnhesthgvshhtth
    horghsthdrtghomheqnecuggftrfgrthhtvghrnhepjefhueekjeejgfduvdffheevveej
    hfdtuddthfduuddvveefjeffgfdvleefuefgnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhn
    sggprhgtphhtthhopedvgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnug
    hrvgdrphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghpthhtohepmhhtuhhrqhhuvght
    thgvsegsrgihlhhisghrvgdrtghomhdprhgtphhtthhopeifvghnshestghsihgvrdhorh
    hgpdhrtghpthhtohepuggrnhhivghlsehffhiflhhlrdgthhdprhgtphhtthhopegrihhr
    lhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvg
    gtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkhhikhhutghhrghnleeksehgmhgrihhl
    rdgtohhmpdhrtghpthhtohepmhgrtghrohgrlhhphhgrkedvsehgmhgrihhlrdgtohhmpd
    hrtghpthhtohepshhimhhonhhsrdhphhhilhhiphhpvgesghhmrghilhdrtghomh
X-ME-Proxy: <xmx:VgonaBkSrc6upcBvaEARz4TVu4qk0C-Y9CBwKCoMyEVJqNMl7C118A>
    <xmx:VgonaMyW4h-Kg4A4Xl9joK7Sj0IeX-CytUlAHPn_MsDGRgvcZnHCFg>
    <xmx:VgonaDRBSU9tKa7_dqw48bEbsHl2uo8GTbdALULRsfPSDaWEnu4LPg>
    <xmx:VgonaHYXnEeePGIQMdCtqv36fx2DNs_4rwUjRiW4DrsW7cxH8ecxPA>
    <xmx:VwonaDe0fJJ5QBICmoOWjLcBLnNmwHyH09TKXiPR3IYwFeRpljAmSHPT>
Feedback-ID: idc0145fc:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 49704C40061; Fri, 16 May 2025 05:50:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Tf495426756189e99
Date: Fri, 16 May 2025 21:49:54 +1200
From: "Ryan Walklin" <ryan@testtoast.com>
To: "Maxime Ripard" <mripard@kernel.org>
Cc: "Chen-Yu Tsai" <wens@csie.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "David Airlie" <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>,
 "Samuel Holland" <samuel@sholland.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Andre Przywara" <andre.przywara@arm.com>,
 "Chris Morgan" <macroalpha82@gmail.com>,
 "Hironori KIKUCHI" <kikuchan98@gmail.com>,
 "Philippe Simons" <simons.philippe@gmail.com>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, "Chris Morgan" <macromorgan@hotmail.com>
Message-Id: <70232334-a0c5-454c-8e1f-551860d74cba@app.fastmail.com>
In-Reply-To: <nze2olzqtgagrkiws2dt3uptehyvcgw7kai5ceycroaroin7jb@xeoddccn5uqh>
References: <20250511104042.24249-1-ryan@testtoast.com>
 <20250511104042.24249-11-ryan@testtoast.com>
 <nze2olzqtgagrkiws2dt3uptehyvcgw7kai5ceycroaroin7jb@xeoddccn5uqh>
Subject: Re: [PATCH v10 10/11] drm: sun4i: de33: mixer: add Display Engine 3.3 (DE33)
 support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_025016_577775_1A8B14E9 
X-CRM114-Status: GOOD (  12.18  )
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

On Thu, 15 May 2025, at 3:07 AM, Maxime Ripard wrote:
> On Sun, May 11, 2025 at 10:31:19PM +1200, Ryan Walklin wrote:

>> +enum sun8i_mixer_type {
>> +	sun8i_mixer_de2,
>> +	sun8i_mixer_de3,
>> +	sun8i_mixer_de33,
>> +};
>
> enum variants typically have their name in upper-case.

Ah of course, will correct, thanks.

> With that fixed,
> Acked-by: Maxime Ripard <mripard@kernel.org>
>
> Maxime

Thanks for the review! Will submit a v11 with the enum fixed and without the clock bits Chen-Yu has already picked up.

Regards,

Ryan

>
>>  /**
>>   * struct sun8i_mixer_cfg - mixer HW configuration
>>   * @vi_num: number of VI channels
>> @@ -171,8 +180,9 @@ struct sun8i_mixer_cfg {
>>  	int		scaler_mask;
>>  	int		ccsc;
>>  	unsigned long	mod_rate;
>> -	unsigned int	is_de3 : 1;
>> +	unsigned int	de_type;
>>  	unsigned int	scanline_yuv;
>> +	unsigned int	map[6];
>>  };
>>  
>>  struct sun8i_mixer {
>> @@ -184,6 +194,9 @@ struct sun8i_mixer {
>>  
>>  	struct clk			*bus_clk;
>>  	struct clk			*mod_clk;
>> +
>> +	struct regmap			*top_regs;
>> +	struct regmap			*disp_regs;
>>  };
>>  
>>  enum {
>> @@ -220,13 +233,16 @@ sun8i_blender_base(struct sun8i_mixer *mixer)
>>  static inline struct regmap *
>>  sun8i_blender_regmap(struct sun8i_mixer *mixer)
>>  {
>> -	return mixer->engine.regs;
>> +	return mixer->cfg->de_type == sun8i_mixer_de33 ?
>> +		mixer->disp_regs : mixer->engine.regs;
>>  }
>>  
>>  static inline u32
>>  sun8i_channel_base(struct sun8i_mixer *mixer, int channel)
>>  {
>> -	if (mixer->cfg->is_de3)
>> +	if (mixer->cfg->de_type == sun8i_mixer_de33)
>> +		return mixer->cfg->map[channel] * 0x20000 + DE2_CH_SIZE;
>> +	else if (mixer->cfg->de_type == sun8i_mixer_de3)
>>  		return DE3_CH_BASE + channel * DE3_CH_SIZE;
>>  	else
>>  		return DE2_CH_BASE + channel * DE2_CH_SIZE;
>> -- 
>> 2.49.0
>> 
>
> Attachments:
> * signature.asc

