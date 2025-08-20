Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5E5CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 15:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fuL07DRJO79zA2iBNSloCcbrQR7X9zT3dVlz/w8Hr0A=; b=YoCun0UOl55cHryKfClMzsnyux
	2r8QCt5RThIO+ww9jJUeLK5lBUu7ExGTRxBZVaGJB03sHEk/iUnoFEo4pnmZj0TGOlWQh2M85G2w2
	7We7F7yBFBEFHS+KmtSYBLddcthX0+nH0eG2yQznMnf2UCcgI1WMqm3QjvANt52pINUyFPOs2oJqK
	aq1CYzQlVZ15q2qRW69VDWyhXRYHQ2goV39PWu1kgaBViAE4mlgsofpAwPSCpQU2jshcNd23C7bDa
	124WAwV9vWp6gAPPnPAo8NWsUEfTHNDVauy9kU0vb83sGmC3s23EFNyKVsLBpISlyc343ncEijlfq
	iMJwLVJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokUs-0000000ED2i-0y8e;
	Wed, 20 Aug 2025 15:13:06 +0000
Received: from fhigh-a7-smtp.messagingengine.com ([103.168.172.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojI1-0000000Dulm-0C1D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 13:55:46 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D62E714003B5;
	Wed, 20 Aug 2025 09:55:41 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 20 Aug 2025 09:55:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1755698141;
	 x=1755784541; bh=fuL07DRJO79zA2iBNSloCcbrQR7X9zT3dVlz/w8Hr0A=; b=
	luK0T24IvqvWu4t0RgdNcMaVI4vQICLNzlHEqzGzR71KZDaSFf2eKG+/3zHHSSzl
	IW0oTNCdyo+oAoM8v0F1QLs0Boyj2Cyd2ZInaMh/Rzw7No4AZcp3hEeaNc1n/tny
	nnEkJMCNKKaKEARW6qUE+38UCODGXOmWr3s99LULlbTriPf+zDNqlndsbv6fpCBF
	zCaCCDZA0Ftkm3iXuiLDkIatM1a9n0s1uwGpYaATuYEzd5hHfjPu3u17Yj1Nehzz
	ZavT95XQBwtw1p5sM1WWkE0jpJXdwL5ihtvbXUEC2zLt21zUKMJwu5TZDkB+7NFq
	ZFEzVC1A/qO+wYt5rMz5Fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755698141; x=
	1755784541; bh=fuL07DRJO79zA2iBNSloCcbrQR7X9zT3dVlz/w8Hr0A=; b=R
	dJCO9FGdE/G1X8z8Ffy6zaMhgDAbwWpVCLbIgc1QRVT/sCG4aQxQKHq2NkLa2F64
	Hi/Xe01bDoTi2v0DAp1hezu5v510QE7VRl7APF9UhJFvsrDTJGUgyh1iZ8M9OuZ/
	wbPv1CouOsXUZpGvZw7ja1RIWJ23gkrXey91M1VTtPYiCc+7TJ68pIX7u/yImIAm
	qKgy36XINDSjsMgNQmulCznFKlGq0+KHDUc7pdutzPgLoa6jU99sjJqcrgwv+qnj
	o2p/FTYEuO9F8BWcRaU63Bnkrz9wQLXy1nxhINQyb/QiDxCy4jwX2R3EHcnmkT/f
	JSp9zjAGb+i8vN80mzHVg==
X-ME-Sender: <xms:3dOlaC12QBmR8HOZbmnydAT7i3OzhAwDPz-DIbIDOI2rQJC_UrV-Dw>
    <xme:3dOlaFHbEOq8RNK6O0eLthVhVepbV-UjAMxvWtSwdtySdiWV9dZ3s1q0QyEkG3dMK
    _ki7ofR_qjByp67pBU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduheekheegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegtrhhishhtihgrnhdrmhgrrhhushhsihesrghrmhdrtghomhdprh
    gtphhtthhopehsuhguvggvphdrhhholhhlrgesrghrmhdrtghomhdprhgtphhtthhopehf
    vghsthgvvhgrmhesghhmrghilhdrtghomhdprhgtphhtthhopehshhgrfihnghhuoheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehl
    ihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepihhmgieslhhishhtsh
    drlhhinhhugidruggvvhdprhgtphhtthhopehpvghnghdrfhgrnhesnhigphdrtghomhdp
    rhgtphhtthhopehkvghrnhgvlhesphgvnhhguhhtrhhonhhigidruggvpdhrtghpthhtoh
    epshdrhhgruhgvrhesphgvnhhguhhtrhhonhhigidruggv
X-ME-Proxy: <xmx:3dOlaMgm8Rx40rQo-fHuLR_nYeJRhd-Z074yzDQqUEJiqxXwq-HExQ>
    <xmx:3dOlaEv1X7VS52qV4C7Qck3weUhbeXo4JOYwp0H8FH78-52p3dZ0iQ>
    <xmx:3dOlaPtY2f3hhBovMMn94Vq0LQx22CJWQFa8eq2w8GDJspbgK7fJWw>
    <xmx:3dOlaJGoLgRoyRePbEX6yKtRuxeH5adOa9bHNDp8ShHnNGL2l4yK5A>
    <xmx:3dOlaP7lRSGUGWmvzpFeTgZvAUkILUMg5UPaiGKMsKqP4IUuQVFHKV-I>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2F60F700068; Wed, 20 Aug 2025 09:55:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A6YapAphagno
Date: Wed, 20 Aug 2025 15:55:20 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Peng Fan" <peng.fan@nxp.com>, "Shawn Guo" <shawnguo@kernel.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>, "Sudeep Holla" <sudeep.holla@arm.com>,
 "Cristian Marussi" <cristian.marussi@arm.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <2ff85fec-b571-4423-9161-674f88a32e18@app.fastmail.com>
In-Reply-To: <20250807-imx9-sm-v1-1-3489e41a6fda@nxp.com>
References: <20250807-imx9-sm-v1-0-3489e41a6fda@nxp.com>
 <20250807-imx9-sm-v1-1-3489e41a6fda@nxp.com>
Subject: Re: [PATCH 1/3] firmware: imx: Add stub functions for SCMI MISC API
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_065545_408460_AFAF0AE7 
X-CRM114-Status: GOOD (  15.08  )
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

On Thu, Aug 7, 2025, at 03:47, Peng Fan wrote:
> To ensure successful builds when CONFIG_IMX_SCMI_MISC_DRV is not enabled,
> this patch adds static inline stub implementations for the following
> functions:
>
>   - scmi_imx_misc_ctrl_get()
>   - scmi_imx_misc_ctrl_set()
>
> These stubs return -EOPNOTSUPP to indicate that the functionality is not
> supported in the current configuration. This avoids potential build or
> link errors in code that conditionally calls these functions based on
> feature availability.
>
> Fixes: 540c830212ed ("firmware: imx: remove duplicate scmi_imx_misc_ctrl_get()")
> Fixes: 0b4f8a68b292 ("firmware: imx: Add i.MX95 MISC driver")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

I don't think this does what you describe, at least not reliably:
 
> +#if IS_ENABLED(CONFIG_IMX_SCMI_MISC_DRV)
>  int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val);
>  int scmi_imx_misc_ctrl_set(u32 id, u32 val);
> +#else
> +static inline int scmi_imx_misc_ctrl_get(u32 id, u32 *num, u32 *val)
> +{
> +	return -EOPNOTSUPP;
> +}

When a caller of this function is in a built-in driver but the
IMX_SCMI_MISC_DRV code is in a loadable module, you still
get a link failure, see 514b2262ade4 ("firmware: arm_scmi:
Fix i.MX build dependency") for an example.

As you still need the correct Kconfig dependencies, I
think your patch here is not helpful.

     Arnd

