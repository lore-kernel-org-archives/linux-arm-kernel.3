Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA25E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 11:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ci7wnLIzNqmNz75nivDXvWBXrlhn2mUTEZWoKXtryRc=; b=KmKh3lj0oYtMzC+sEEs9ZiK8Dw
	A6xEgDiQBeHJrieOhz6Z9YMqG/iuFIejiy+wn5hi9ZYfTy5dBkHJleIpCtO68fjVW+m2ISxYwZH2H
	5Zcb6SM64lLzdyLqY5C0Aj4V5NazHhxMLPg2s0hQ3sfVz3Ap2HxiQy1BnTis7Pg9JUtiJer59kDHY
	LEt7DyTP/j/TeBCo5vx6PNNFOM91bzMToYFjTBLnIqUoSfir19J5c+x8rkGOj5qb+8TzyzHSdKJAr
	NOwBH3YEISBiyCHOzYYexGOvd+DAYZWNnRcDe6BbywgItvaoJlJKZJwAauDCn89FSkpYFJOHAux3h
	HR+6HmEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsXG-0000000GVD3-3Ffj;
	Wed, 18 Dec 2024 11:48:14 +0000
Received: from fhigh-b1-smtp.messagingengine.com ([202.12.124.152])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsU3-0000000GUV4-3Srk;
	Wed, 18 Dec 2024 11:44:57 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id E1B8525401B9;
	Wed, 18 Dec 2024 06:44:53 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 18 Dec 2024 06:44:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734522293;
	 x=1734608693; bh=ci7wnLIzNqmNz75nivDXvWBXrlhn2mUTEZWoKXtryRc=; b=
	Gtt4oKTCAz7iXjLBdaJ4fk339JtG6NYSxELsvVQO3k5YvfRM4056SFYMV132AXo+
	gJ9VPV81TwbOU/2+2QIs0CS0impr1wL1ej5OycK14fVy2c8VlKB2xegX/EAlF2QD
	a+3o7S+WGrOvk1ndnDBX2ogjOZuSpGJ3MIIoEdFAfUQ4xcAzl2O5Oqm2M2AbBZYy
	0ePFobymW08vdnAxkJjbVOkaSM1berjAU5/EpWz0NU19fDU113dgHF3FHAxhbw1t
	pZMJFJma0l2lroPBTrg1/GssZ3QYPjch1JZKOWP9DjKWKeMYTCFp2XVaxCNSjw4I
	ftgmhuxxDdB+nLQKgOKYHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734522293; x=
	1734608693; bh=ci7wnLIzNqmNz75nivDXvWBXrlhn2mUTEZWoKXtryRc=; b=v
	RJXlDfeQ8IUknWvagwmoM7Y222DsLiSmJY9Tc88UfLEtRpc1Oiw4fziWVWc7mtRP
	d1TGaeCLMp5KlgDe0Ibu5AkDstLXdEm56HtjUfFuDKeu6JASW0Wo0lDXnOjLTVCE
	XdlAZ1FKoPGrNETptTsqUXCp/3N5cA3DY9CF8On75Z0AiTgkfjDQ4xmEQ664cLc4
	vDXI6uK6jfElAYfT79gh1WXFRyPhuT4jwWDnGvHlaqqXGD9n+MXATgNWBlkQ8Gnt
	Zc0BCpP60DejNWN0GvPXOXsMfkOl6sjwqEVKZ8he/6kfsyk4ripFUcIPNoJrlIxI
	fS74XsYUgkWfxAsOy2a+g==
X-ME-Sender: <xms:s7ViZw_WczuLTGcK5AsmEHe_qCWtQrv9QNJXd1djQ9v_soZwcPGt_Q>
    <xme:s7ViZ4u6bQKtQd9pjfrw1s2oOLJKMXhQmZWPgcKd86-v90xvakU-7EoKLWfO4GEuJ
    2mMujT7WmevCchQFHU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrleekgdeftdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffg
    vedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduledp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfigvnhhsthestghhrhhomhhiuhhmrd
    horhhgpdhrtghpthhtoheprghnghgvlhhoghhiohgrtggthhhinhhordguvghlrhgvghhn
    ohestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehsihhmohhnrgesfhhffihllh
    drtghhpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvghrrdgsvgdp
    rhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhgrth
    hthhhirghsrdgsghhgsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhgrnhhirdhnihhk
    uhhlrgesihhnthgvlhdrtghomhdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheptghhuhhnkhhurghnghdrhhhusehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:s7ViZ2Cn1RcrBCDROIhRmqeOw2PRvn1kDatQL5l6jneBYFz6OVLnvw>
    <xmx:s7ViZwfwu-sth1xTDkADc8f6UwbsV4pG8Y2C6bAv8U8EzDSQ5o3l9g>
    <xmx:s7ViZ1NBY82dAMyphK71CoxVaOJyTnYiVqFUP-I9NPemy_OCXZDgog>
    <xmx:s7ViZ6n-XVPhlRtDT4PWaOECGCYBRAzgoK0rNqshK3gCOIssX7jvSg>
    <xmx:tbViZwHLykl3Y92jepGrVWSYFaN8pXEfza8ZswrzRsdrTl9L52Dn2M7Z>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A6BB02220072; Wed, 18 Dec 2024 06:44:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 18 Dec 2024 12:44:30 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Arnd Bergmann" <arnd@kernel.org>, "Chun-Kuang Hu" <chunkuang.hu@kernel.org>,
 "Philipp Zabel" <p.zabel@pengutronix.de>, "Dave Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, "CK Hu" <ck.hu@mediatek.com>
Cc: "Maxime Ripard" <mripard@kernel.org>,
 "Jani Nikula" <jani.nikula@intel.com>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Chen-Yu Tsai" <wenst@chromium.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 =?UTF-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Message-Id: <1d8c6f65-5baa-459e-ba34-4e45ca20baf6@app.fastmail.com>
In-Reply-To: <46f871e3-bb1e-4bee-95f3-2121c6a6eef7@collabora.com>
References: <20241218085837.2670434-1-arnd@kernel.org>
 <46f871e3-bb1e-4bee-95f3-2121c6a6eef7@collabora.com>
Subject: Re: [PATCH] drm/mediatek: stop selecting foreign drivers
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_034456_502390_2BC03ADF 
X-CRM114-Status: GOOD (  10.76  )
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

On Wed, Dec 18, 2024, at 11:50, AngeloGioacchino Del Regno wrote:
> Il 18/12/24 09:58, Arnd Bergmann ha scritto:
>> From: Arnd Bergmann <arnd@arndb.de>
>
> The problem is - no PHY no party, it's not going to work without... but 
> I get the
> reasons behind this change.
>
> Are we sure that we can't just add a `depends on PHY_MTK_xxxx` (or extend
> depends on DRM_MEDIATEK && PHY_MTK_xxx)?

Doing this wouldn't cause any problems, but it also doesn't
really help much, you just have to know which devices are
present and enable all their drivers anyway.

We used to just select all drivers from arch/arm/mach-*/Kconfig
on some older platforms, but this was too much of a hassle.

      Arnd

