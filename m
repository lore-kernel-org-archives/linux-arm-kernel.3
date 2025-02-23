Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78976C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 09:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rR0lG1HqwLHdKmh1L1Q+3HA+XJIsSU89HsqNgZSMZYY=; b=iCyWVi98xk9VRrRvqW7/Pp8oYb
	OV/c4+jfBOx81LD8j3m4IbxuN7+cxzvqXnq3gMLlJok/3YZRl7f7RTnFXbv0mEkWRf/pwJ2yenH2H
	8WqjKs5HEKbnCFEldywpyBk7V1Ffom0QxB9Y7hPjZl/sdp5Q+IjwsxKgoilP05r2J6+kme/MgifHf
	AYaNamNR6z42ialCOkN7Fv0qqJF7LXnwkmIboPcwhZLupQ5f9YoKa2jN95Oj6l1yklFDlFeLxgql9
	pQmLLTKvmKcA5L8yie0RFf7rRoE3+S3sYvcKCr2hxo46/xuE57Zqn07N3rKacDxV/XouJDzBjQbtn
	6AMx4p1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm7ur-0000000Aj5U-3fzX;
	Sun, 23 Feb 2025 09:04:49 +0000
Received: from flow-a6-smtp.messagingengine.com ([103.168.172.141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tm7tN-0000000Aixf-0NT6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 09:03:19 +0000
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailflow.phl.internal (Postfix) with ESMTP id 68ABD200D15;
	Sun, 23 Feb 2025 04:03:13 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-13.internal (MEProxy); Sun, 23 Feb 2025 04:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1740301393; x=1740308593; bh=rR0lG1HqwL
	HdKmh1L1Q+3HA+XJIsSU89HsqNgZSMZYY=; b=UP91jSsrK21sGc1fKzC0Xubvi/
	Px4QjbV6BgKX2of72GCoI1++xhm58Y90bUtAlQ8BbromQukfP7uRjf+QBosA4tKU
	xjNVvZlyxAYwOg6qUGA14YxpESaNeXo++GKCMa4ZVkPxYgTiL/34P0HXI5P9QB5Q
	hRNCaCh3kHcJt5kZceiqMlJhsarUcbc7BPUZVF6e/RFvumm1S/qyvuHBKOy0SQSL
	cTxOZlG6l8J8AhLzPmZVZqGgE8p876szBPfQ6yJET1S3b/5J491YdjOBZHNefgIU
	epYvEHMx9EdFtPqr6EZT/K0DkwavXSKyBQYMff8efUrsI6lzy4+seUPKdMlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1740301393; x=1740308593; bh=rR0lG1HqwLHdKmh1L1Q+3HA+XJIsSU89Hsq
	NgZSMZYY=; b=ozyeWCSVrq6ZeFCaCQrEBXXOybLROwbF7zB4axtI05UnC8bMek/
	HplkY+Yvidoj+m8cI1r4lRSwj9ZTJ7TaZqHt3HMlT4PIflL+DlVGoN5K1oCG8aUz
	p3F9I69j3MnwgJyvJzTSxQabyUBOzBhPMlK28TqnxjcRrKc30e93jAjx8kwUhAwD
	3Zyj1O3z02AAVqY37WA7wMAFH4ZFwzdoXYjR+3riyStqb67uD6p9j0ByZkOcC+59
	uBAaryvqNyaDSmPXMMRmkluf8DVrYM5VyyRDPL/eo6mY45RZdsFB8QX5Inuyrd9P
	AG8VzmK4W5axKyqv2tT30XAg+H2GfBS0ylw==
X-ME-Sender: <xms:T-S6Z2C_xYV3bNnptucocY4qCtKeewxrsC0NAgKeJtJHQOEnAvf_IA>
    <xme:T-S6ZwjYmJMzaRjxL0LrFwxA-ln-OAx4dKP6-Z6hCSL2O4048xGhSw4v0UFmtDOeC
    3B0MlGpmv5vJ4UGKGA>
X-ME-Received: <xmr:T-S6Z5mD6zi27a04xfe7S4HaT139eF6aNHYgTPpzBta_8Oc-LAlDN2BGuz2sAmgbwgWzae5WkzIuim3CprI_Zam768WV9ky-65U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejheegtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttdej
    necuhfhrohhmpeflrghnnhgvucfirhhunhgruhcuoehjsehjrghnnhgruhdrnhgvtheqne
    cuggftrfgrthhtvghrnhepudefhfehudetjeeutdfhvefhtdeltdfgheefkeefleegveev
    tedtveelfffhiedtnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjsehjrghnnhgruhdrnhgv
    thdpnhgspghrtghpthhtohepvddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    hfnhhklhdrkhgvrhhnvghlsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhvvghnsehs
    vhgvnhhpvghtvghrrdguvghvpdhrtghpthhtoheprghlhihsshgrsehrohhsvghniiifvg
    highdrihhopdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrodguth
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhgtrghnsehmrghrtggrnhdrshht
    pdhrtghpthhtohepuhhlfhdrhhgrnhhsshhonheslhhinhgrrhhordhorhhgpdhrtghpth
    htohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:T-S6Z0zqcRiXeOlqKx8mmZ-1komXthg5pod44TaAINRYJcNV8t5iTw>
    <xmx:T-S6Z7TOVONgPflH1HKdseNAh33d0XxwpGvUFdpRLFugHALGbaLAcQ>
    <xmx:T-S6Z_ZWqCOWzXqX9ZYAAtiduWdDKEfNkz9cFA_BldrCFC1LmRChjA>
    <xmx:T-S6Z0ScM17wGYjATkl3QKYgA9tAn_PeJErj30vEXjLZkqKlK1MzRw>
    <xmx:UeS6Z1nV0QWUnynP-qzHUMWNgfwJNKMvjNTeFFlmE23wPF3FtzGIHOd8>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Feb 2025 04:03:11 -0500 (EST)
Date: Sun, 23 Feb 2025 10:03:09 +0100
From: Janne Grunau <j@jannau.net>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	Eileen Yoon <eyn@gmx.com>, Asahi Lina <lina@asahilina.net>
Subject: Re: [PATCH 4/5] media: apple: Add Apple ISP driver
Message-ID: <20250223090309.GA430621@robin.jannau.net>
References: <20250219-isp-v1-0-6d3e89b67c31@gmail.com>
 <20250219-isp-v1-4-6d3e89b67c31@gmail.com>
 <20250219113422.GA26386@robin.jannau.net>
 <CAMT+MTR4yPzC-NBLT6uLhveHFDWpwwn=hUzU6=WDc73+UVEMwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMT+MTR4yPzC-NBLT6uLhveHFDWpwwn=hUzU6=WDc73+UVEMwQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_010318_061771_62CAB556 
X-CRM114-Status: GOOD (  11.35  )
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

On Sun, Feb 23, 2025 at 09:48:30AM +0100, Sasha Finkelstein wrote:
> On Wed, 19 Feb 2025 at 12:34, Janne Grunau <j@jannau.net> wrote:
> > > +     while (maps < end) {
> > > +             maps++;
> > > +             maps = of_translate_dma_region(dev->of_node, maps, &heap_base,
> > > +                                            &heap_size);
> > > +     }
> >
> > The hand-rolled reserved memory parsing looks like it can be replaced
> > with of_iommu_get_resv_region();
> 
> I have looked into it, and `of_iommu_get_resv_region` does the wrong
> thing. We fill out `reg`, and it grabs that instead of `iommu-addresses`.

Downstream commit 704ace01cd3c4 [0] ("iommu: Add IOMMU_RESV_TRANSLATED
for non 1:1 mapped reserved regions") adds device virtual addresses to
struct iommu_resv_region. Sorry for the added dependency but it is
required anyway for the isp to work.

ciao Janne

[0] https://github.com/AsahiLinux/linux/commit/704ace01cd3c423b1e2492f0777d9c4c0f3404d8

