Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32505C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 10:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSgcD6ZLjHSu9Hjz5ZIpaSW1p7NU8SDifL7N+PTVyEo=; b=GTeHJt2jCa5eZ8V9qk/0mK2LWO
	O7zQXD6f2do06pX9cIj4QNiGET21EI/wcR6o/rCWJVx/r6xCSkUmbEQ6/maWPw0M9OJq3Nneu0gch
	1X659XGdl4ZPdu6CVPZLEVyUG+G5eaymN2qeIXdelaAGxwBiSB0g+F+AI9ywGL4HwCP2IhxxSNrBR
	yi4jNkJGRO592gEhx7aI5oOsGpTihdPXgTGaaYp//dHKYnsDHPbruvSK88Qpq/44a9jWI88YKXzDG
	lvJBjqeibif3v0K2NyGo5YOSHf6Da4D8sLfAY1lXSGqH4w+vOicbc9KKv+1Ee+lFLb+xLZLnogtMO
	T5R4whRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAQtk-0000000FAOY-2pZO;
	Thu, 01 May 2025 10:12:08 +0000
Received: from fhigh-b5-smtp.messagingengine.com ([202.12.124.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAQrn-0000000FAAs-4Bg8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 10:10:09 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B01D525402A7;
	Thu,  1 May 2025 06:10:03 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 01 May 2025 06:10:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1746094203; x=1746180603; bh=rSgcD6ZLjHSu9Hjz5ZIpaSW1p7NU8SDi
	fL7N+PTVyEo=; b=e0Fd4erXhDz1mlWy5wYwG56lLX+hpnmRVdHvjZBR4OQfLGKD
	NsvQ7p2gSfF/wZtR5y8RBw+6F3nDb9g3Vcp6OxkSUNW0embKpO4PVnAM802LEh/O
	DzwCwbDrMRYUyqs5/+kGg17fc2JRzRNaSp608Wpv5qSr516zaXtid0MNFbR+Pks9
	UrnEGZTX9JSZSvMU2LU6796XgDUNqGQcaCXvR7RbudnCLDpX8O2lyE+bUhd3Ccew
	kdY81nAOanWcYgC8WUIyk8+DCXNBAQZhCt8p0rKXoVJvmzXCs2ysTvh2Rg4h7uOg
	NCIg4feUtD45cHLla8Zmi6jV8djpbeBABAOAjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746094203; x=
	1746180603; bh=rSgcD6ZLjHSu9Hjz5ZIpaSW1p7NU8SDifL7N+PTVyEo=; b=k
	8qGmVkMd/OQEwdZUYMe1W0l1Cnyk00WNmrNVZfIGmy5UV65FTJiHCu67K4qXwUZ/
	G9ZtpE/c5d3airW/8wraUJXW1IKYyXCaHKl4H3oICSsHU8mZYLG0yQOrg7OLdeeX
	dojrNxprPz2/e3Xss5ZjrJxWhPv3zDCUYYtaxwR+YHSwI9IcwHreCEZVHitUZaTm
	LmeRQUyDjmX/ToKjPPBZnfhlYZa14F9kMQylOnlBdzR1FNKxGUjHfFN8n5uwRLLa
	c7L/DerJuE0WbY5w5F4xne98bftT94YDrd3EQ8kKuzSdEJwlV8M4a6FZ9o+U/yzR
	o0C7sNwtzgCDEMyVB+new==
X-ME-Sender: <xms:ekgTaKLGmPkCCZpF1zzJs5raJpd2THhHpaHxUhKxnUEyEJbI-H1hVA>
    <xme:ekgTaCI70GlI4oyix02sXix7GHvc37ktuhy5MeT36ip-dv8wh_CE2HQxPxw1-fUNi
    IwNhZgZc2jEiaIUI20>
X-ME-Received: <xmr:ekgTaKsRghlelS6ylnXqHkzqKjH3Oqem96mRKqPuZ0NYPtprA_0KPqAVuGIfyOL3UmFxJPoAR-WMXq6269eW_tM_UTPkisWLLodDquOE78eCpXrfdg64zdcNcSC4bwA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieelfedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhggtgfgsehtkeertder
    tdejnecuhfhrohhmpefuvhgvnhcurfgvthgvrhcuoehsvhgvnhesshhvvghnphgvthgvrh
    druggvvheqnecuggftrfgrthhtvghrnhepleetudehlefgteduffeijeehfeduudekhffg
    fedvueekvedvveeuhefgieetgfegnecuffhomhgrihhnpehgihhthhhusgdrtghomhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsvhgvnhes
    shhvvghnphgvthgvrhdruggvvhdpnhgspghrtghpthhtohepudehpdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopehjsehjrghnnhgruhdrnhgvthdprhgtphhtthhopegrlhih
    shhsrgesrhhoshgvnhiifigvihhgrdhiohdprhgtphhtthhopehnvggrlhesghhomhhprg
    druggvvhdprhgtphhtthhopehsrhhinhhivhgrshdrkhgrnhgurghgrghtlhgrsehlihhn
    rghrohdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpth
    htohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdo
    ughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehfnhhklhdrkhgvrhhnvghlsehgmh
    grihhlrdgtohhmpdhrtghpthhtohepshhvvghnsehsvhgvnhhpvghtvghrrdguvghv
X-ME-Proxy: <xmx:ekgTaPaTyJC-BVZaiND3BRyFFwTMhdJLd9wD5F0amvQtv5gfjKVvwQ>
    <xmx:ekgTaBbIYdG3hNe7dMD3Q4MRfJ1dbE5y2ONIJwfS1VSdzFLAS_ktZQ>
    <xmx:ekgTaLCRlAnWh3H6eKexKkm-exDJ29PAP8WHjeH93UypQlU8_Jv5Cw>
    <xmx:ekgTaHa5A_BrWF1-QS4ZQ68JPkm8AsG7G_NIholT9cS5FTk2Tc6mhg>
    <xmx:e0gTaISTGBFTZDu6y690LuX9--NKQkLocgt9l64useMdlN0GHfAHQwqx>
Feedback-ID: i51094778:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 May 2025 06:10:00 -0400 (EDT)
From: Sven Peter <sven@svenpeter.dev>
To: Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hector Martin <marcan@marcan.st>,
	Nick Chan <towinchenmi@gmail.com>
Subject: Re: (subset) [PATCH v3 0/3] Apple PMIC NVMEM cell driver (Formerly: Generic SPMI NVMEM cell driver)
Date: Thu,  1 May 2025 12:09:53 +0200
Message-Id: <174609415563.2892.911410190691203446.b4-ty@svenpeter.dev>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250423-spmi-nvmem-v3-0-2985aa722ddc@gmail.com>
References: <20250423-spmi-nvmem-v3-0-2985aa722ddc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_031008_528631_E2F0A49F 
X-CRM114-Status: GOOD (  10.67  )
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

On Wed, 23 Apr 2025 19:55:12 +0200, Sasha Finkelstein wrote:
> This patch series adds a driver for exposing a set of registers
> as NVMEM cells on a SPMI-attached PMIC on Apple ARM platforms.
> Those are used to store the RTC offset and to communicate platform
> power state between the OS and boot firmware.
> 
> The NVMEM cell consumer drivers will be sent in a further series.
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (asahi-soc/dt), thanks!

[3/3] arm64: dts: apple: Add PMIC NVMEM
      https://github.com/AsahiLinux/linux/commit/d8bf82081c9e

Best regards,
-- 
Sven Peter <sven@svenpeter.dev>


