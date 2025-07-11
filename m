Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E47C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 05:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r96/LWevDQA5QoU12k6l8P8gXdbwX2VPCNFYESFP6u0=; b=Xch8hD5olFxB9gfY8QP3uyNlH7
	XL/xwGRrnHT7rLZpliFatufWRrO2D97+OBr1scOM7FVqaGOylpzrRK4nFEt2E7ttk8qGtkPcpWlQX
	pmgxsa3IFy6aB6Y6TGc4HcsKTdI9ArJYvcFEvBdYld/4wIvxLZIrXTk1OAb5uPKeqqis6rxnIFt51
	Uo8K1FUdiR1lA765q1lbWeHLhfRtH4UDVcPKhxjkLPQn/PQLdeX3EYyl7q4lj7EPNSMflN4PBjIXA
	B0qDZ3kwtGBGvJa2z8gTm8XXrB5b5uZQoZ/RmBK+8962bkM48QYbMyr9QHk7hIp2a+4AJUD+Q/WnK
	cVC55d+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua6Wh-0000000DmHK-2b4c;
	Fri, 11 Jul 2025 05:42:27 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua6Ro-0000000DlXK-3X6r
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 05:37:26 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id B9A911D001EE;
	Fri, 11 Jul 2025 01:37:22 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 11 Jul 2025 01:37:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1752212242;
	 x=1752298642; bh=r96/LWevDQA5QoU12k6l8P8gXdbwX2VPCNFYESFP6u0=; b=
	irAa5DHEYglNfT2T8x7duweSdMgX43U9kXf45akuXeKt5xTvr6LAVzMvmnlz8UrU
	7cKNVBLyyfVBLrxW7wLKEL38/21mDS+7fuxClLh+49Tw0JGfRRU7uz96lnlxoE25
	qW7ZoLDffY/WP/WPaILMZLIkduPBnTvTDLR86gTqET3BmuUqHQgFfboy1J16spWR
	cm0dmoeQ83v+RoA9oVLfMNP7PxUBaOUVOffVL3HLWSDs72szszfwHyP4w/yFtd8o
	TqBu7DKmRORa9pxAXKZtOpanrrotN97N2IWhJhmBdysI10hSEN2L6MgckOcoclRl
	G4Qnn8WJGYZoAXT/KkA/Qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1752212242; x=
	1752298642; bh=r96/LWevDQA5QoU12k6l8P8gXdbwX2VPCNFYESFP6u0=; b=N
	N1NCPa6QCdGpKZXD31k3JOkNFeFzL/4R8MNVDiyj6QDY10oKeF3JoU+DSWHu30TV
	LKJEnH95ZqnVRv0boeZMMdJojqZLFoVcPt1oEz20h+kUlwj0lPq3i1WMamNApqcN
	SxIaJFiSkMkZnH5kbO1tKSOlmKgcfsd7H3U9ULq11mveKeuMrStcQpxesZfrYxrX
	PmRrQ4bVXtLNOIjvMM3FTIEKc06Y5Qw80BGC1uzkwqlhN/jw4p0RqOb5S2R2YWvw
	u08N9ybF7voulAm3MaaeD9ZGSETK7CRrBpIev/zm+3Ymd42D5snzl2M08bGDk8M1
	LUER2LaBm3XypDeRFs+qg==
X-ME-Sender: <xms:EqNwaP6hZjoBie5RLQl2Av8zKn0lrUJxOdQxU7XMCX0OCGF8F8LAeA>
    <xme:EqNwaE5JW_UJd4XWI0aZjNC3W7P2tYnK0EahLKzGR_lGYuga-dVSDFP8VQOjGPrYd
    J_jAWfGNfD6izfy2-I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegvdehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeefuddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepsghrghhlsegsghguvghvrdhplhdprhgtphhtthhopegthhgvshhtvg
    hriedvheduheesghhmrghilhdrtghomhdprhgtphhtthhopehfvghsthgvvhgrmhesghhm
    rghilhdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgv
    vgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepshhh
    rgifnhhguhhosehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:EqNwaPurB6eFkk7DG09IAWVeSIcArnv3j9fMMUDYuwXzjo1B-lRHPg>
    <xmx:EqNwaAb9jDevrQdh1WxnAWyBkv0ji7_019Wwp73nEh8oOLeGeK4gvw>
    <xmx:EqNwaOU95NeDE3iOPYNGpaEWgHi_xT_ybrH5N3VHcQSANIkOblu8Lg>
    <xmx:EqNwaDJtrv1hyYthi53dfAhJaIVaAeuPdac623zJH2wudMn7uspiWA>
    <xmx:EqNwaOv28YUbdR5nbbgAHZ7XUk4RF2ouQkGKfXZ0id1-h6ecNmvvOJGq>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id F0641700065; Fri, 11 Jul 2025 01:37:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T0d3a9be5bc6b3506
Date: Fri, 11 Jul 2025 07:37:01 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andrei Stefanescu" <andrei.stefanescu@oss.nxp.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Rob Herring" <robh@kernel.org>,
 krzk+dt@kernel.org, "Conor Dooley" <conor+dt@kernel.org>,
 "Chester Lin" <chester62515@gmail.com>,
 "Matthias Brugger" <mbrugger@suse.com>,
 "Ghennadi Procopciuc" <Ghennadi.Procopciuc@nxp.com>,
 "Larisa Grigore" <larisa.grigore@nxp.com>, "Lee Jones" <lee@kernel.org>,
 "Shawn Guo" <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>, aisheng.dong@nxp.com,
 "Jacky Bai" <ping.bai@nxp.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 "Srinivas Kandagatla" <srini@kernel.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, "NXP S32 Linux Team" <s32@nxp.com>,
 "Christophe Lizzi" <clizzi@redhat.com>, "Alberto Ruiz" <aruizrui@redhat.com>,
 "Enric Balletbo" <eballetb@redhat.com>, echanude@redhat.com,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, imx@lists.linux.dev,
 "Vincent Guittot" <vincent.guittot@linaro.org>
Message-Id: <9d004ea4-0bb2-4a21-8501-82ecf3482c3e@app.fastmail.com>
In-Reply-To: <20250710142038.1986052-11-andrei.stefanescu@oss.nxp.com>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
 <20250710142038.1986052-11-andrei.stefanescu@oss.nxp.com>
Subject: Re: [PATCH v7 10/12] nvmem: s32g2_siul2: add NVMEM driver for SoC information
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_223725_389771_D38868D6 
X-CRM114-Status: UNSURE (   7.15  )
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

On Thu, Jul 10, 2025, at 16:20, Andrei Stefanescu wrote:
> The SIUL2 hardware module has registers which expose information about
> the given SoC (version, SRAM size, presence of some hw modules).
>
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>

This does not look like an nvmem at all, it appears that you
are creating an alternative to the soc_device infrastructure
based on a binary interface tunneled through the nvmem subsystem.

Why not just make this a soc_device and have drivers use
soc_device_match() if they need to know what chip they are
running on?

    Arnd

