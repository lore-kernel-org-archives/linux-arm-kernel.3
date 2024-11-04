Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C2ED132BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 12:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v587H4AT/xkyw5xEGYTsDbmep2Q/ZXljfom78DGKkPk=; b=EKP0df8NDezJ6jTM7gU/AdOn6t
	yYnaOz6Dii3HE4Th7PryTD57dT9ZT8pDYLmdtXRvoW3q6SPCx0gkfYV65vJzuvrA54VjGTpo6BRva
	mnsR+dNyOOQM3Ch7tHbpamqVPM+8zTc64QLW4vI8hy4UI5aGN8UInwMWhzTwKiLkZP81CWwcRAEXg
	xtCXcaZp7yUu6G7R3ZT79IuULOU/A7vZD0EW+TYnrX2Xby9Y4thbURnmo7RINJcT77WhhSKiEvx36
	ZPPihSqCNwPTpnlU+bRKuOzli7iM/bEAoo2YUQbxR5I1Xs2WObJAknwgG5CoR7GMrZJ1Wm4jtTftH
	ekb+2aMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wTQ-0000000Djqf-1y0B;
	Mon, 04 Nov 2024 12:46:24 +0000
Received: from fout-b7-smtp.messagingengine.com ([202.12.124.150])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wPv-0000000Dj1q-0oHT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 12:42:49 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.stl.internal (Postfix) with ESMTP id 5A82B114010A;
	Mon,  4 Nov 2024 07:42:43 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Mon, 04 Nov 2024 07:42:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1730724163;
	 x=1730810563; bh=v587H4AT/xkyw5xEGYTsDbmep2Q/ZXljfom78DGKkPk=; b=
	d9qLtqC5l0hBlxErLDVhQYk7t/MRDXtfzk1oI96W6p5rVsLl8nY9+v/qphyy2hvH
	rLAo36N+brlXs1xl8GgTlVq16YV6AxcLCPMyCWvOPDtvyQ21Z+G9yEIrvUrzdL0h
	3IIDvyg5YzwepQfQkCIAqAriiKi8XobI4iMPdpRuPouJ7HtAXD3sUjKHuq/k0u03
	RN9Ip4+sM3xDGvzbak5Zb5G8ufUHkfJODa4ALST/14vo9PHLvhcNHrOPWI4khyhR
	TnHz0XA2kYVSeeG2P52WfODNmwzZU9aqmhhqYx+jWxCkcEHeCK188ojYcjG7gj4B
	KAntiVZKDp7TsOviD+BZOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1730724163; x=
	1730810563; bh=v587H4AT/xkyw5xEGYTsDbmep2Q/ZXljfom78DGKkPk=; b=a
	GU92Whb2QY0NHFcgFhQI4HTXF9gYjzK0fcztD55fcgjeST7ZY8J8iqFT+t0S6yKB
	hP7TA18gZZdC3twKtb1drwdPRJmAin+SqMt+wI5fhzDmIG8u4ynsqlNpW1/c1QiP
	1kImbxH8QpDykCZv5LTUt3xplS7BalIO/Z4r/b/LiIK3nkUAH2cjtnEuAb0y2dUS
	4oVaUdqFbhogiU3UuajROUDC1nz/qSsEFy/KVKw5wuksdpCNPTkmmSQqW+J6mS7B
	/xa5jjPqhoT65N+QJ1jPb1FNmtzm7u8fflroWUq2H2+auqYvrbMCXUWM0SJy3YGf
	DhCZhUGCiHhInJouplz8A==
X-ME-Sender: <xms:QsEoZ4SUHYlk_XCkwwl29CeKo8JFYtZHUJr-O1zXM2fWcR_VXv_3tg>
    <xme:QsEoZ1zwrJ4WUSXpw1c3eONX8heNWIR03HweklQxnJPHZPjBRQZkOuP1_Yq82uCA4
    nXd5XyocZ78yJo5tio>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdeliedggedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudel
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsihhmohhnrgesfhhffihllhdrtg
    hhpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehf
    vghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopegrrhhnugeskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepshhhrgifnhhguhhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopegumhhith
    hrhidrsggrrhihshhhkhhovheslhhinhgrrhhordhorhhgpdhrtghpthhtohepmhgrrghr
    thgvnhdrlhgrnhhkhhhorhhstheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtth
    hopehvihhllhgvrdhshihrjhgrlhgrsehlihhnuhigrdhinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:QsEoZ11XxUNsFEyXAGgXYjlepuRSzArr5-7LOdQqNzlK5seUEEFZuA>
    <xmx:QsEoZ8AsI5zybqXaKdo16RUETP_zhWH6vmy-wAB1LHNWv0FoGMSZzw>
    <xmx:QsEoZxhSchLa9tkfxqj27_SJNgD0QKi6XpXcu1KL1KVsEDo3g8NA5Q>
    <xmx:QsEoZ4ogdY9mULhAyeQR4tUN9idY0nOgIgCF4qRzn0Y7Q6Nk_gNtnQ>
    <xmx:Q8EoZ6YyjU_EjNPNSoL5tL8GZRoepVzNsOns-NnLuRpqOeFgKOOy3rhu>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 281A72220072; Mon,  4 Nov 2024 07:42:42 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 04 Nov 2024 13:42:21 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>,
 "Laurentiu Palcu" <laurentiu.palcu@oss.nxp.com>
Cc: "Arnd Bergmann" <arnd@kernel.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 =?UTF-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Lucas Stach" <l.stach@pengutronix.de>, "Dave Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <cc09326a-2d76-4783-a6b9-fcfa9a704cec@app.fastmail.com>
In-Reply-To: <ix34xln3tl6l2h3jt7t4bhrydxfmh2m53dkl5rugxj335p7hgb@kfauvwrusipr>
References: <20241028163527.2425783-1-arnd@kernel.org>
 <2byo7263izup45hcdyoxr57sh2dzdasnwotpfqnayqe6znvzjt@adou6qmyhq6y>
 <ix34xln3tl6l2h3jt7t4bhrydxfmh2m53dkl5rugxj335p7hgb@kfauvwrusipr>
Subject: Re: [PATCH] drm/imx/dcss: include drm/drm_bridge.h header
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_044247_953437_C8B49666 
X-CRM114-Status: GOOD (  12.30  )
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

On Mon, Nov 4, 2024, at 13:24, Dmitry Baryshkov wrote:
> On Mon, Nov 04, 2024 at 02:10:54PM +0200, Laurentiu Palcu wrote:
>> On Mon, Oct 28, 2024 at 04:35:07PM +0000, Arnd Bergmann wrote:
>>> Fixes: 004555a18d57 ("drm/imx/dcss: Allow build with COMPILE_TEST=y")
>>
> I can pick it up.
>
> However I think it is:
>
> Fixes: e7033bdfd43b ("drm/imx/dcss: use drm_bridge_connector API")

It's probably both commits. My randconfig builds showed it only
failing on x86, which means that it was still working by
accident on all builds that include ARCH_MXC && ARM64, between
the two commits. The commit you pointed out should have added
the #include, but that seems to come indirectly from
include/drm/drm_of on all arm64 builds.

> With that
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks,

      Arnd

