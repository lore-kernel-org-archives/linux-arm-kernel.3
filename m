Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5140D68BCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 19:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JjVpzz7rrwn9sD/anIgIO4Wd5itVBXvna3LVl+1VzIE=; b=NXvu+gxdg8pMZYtco6fbNSMyf8
	jLVN5c2prwcXuBoIalJsIhyTKNFYhlsd1iGR/GbJcTwHINesl10frPZTTTYtV0rVfdwY/sMwtXl9T
	GsB5YV/sGxlU9gMA76g/dHdQb8GleWxfrFeYih4FRsRnBT9nX+ODh6Yprf/dKx6IoYeoh4+tcSMTi
	4uw4OaVtAtFHsh3foF5bdOGRrmoLXPk2/NWydzd1XNr6xeyL2XrHRTGnu3sOWJVChNFA3ftnzRq6x
	bufFAE579QCgECROYRmbbADB/HMaptgIDucq/wAuOiZ5Z3TSnxDaqR9mhYuBTqO19CL+L6g0s1XN+
	er1w0ufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC1Z6-00000003mlX-3LXN;
	Fri, 15 Nov 2024 19:01:08 +0000
Received: from mout.perfora.net ([74.208.4.196])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tC1YA-00000003mUC-2Izu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 19:00:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=finest.io;
	s=s1-ionos; t=1731697183; x=1732301983; i=parker@finest.io;
	bh=JjVpzz7rrwn9sD/anIgIO4Wd5itVBXvna3LVl+1VzIE=;
	h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=P72VuWdkg8flIDByk8mejscF1bP8JOMM8wQMJ/Ujq6JbK1A+EOGNDHy0bnI9aM/C
	 gsmQucY0TlIsVwjuGmcd90VN/bCz1Rg52+ZRoaXovo8a87/W8FANQcwPNLAYlVA3p
	 PXMUR93e0idikezocrKr+6ecYNq4kokWyqL5LpvwgpvtxLO4Fi1xG+Snu5ZhbZb+z
	 m2nCVrephyEmlLUDduzGsjs6rYxkGbkSGivDHHztOLtlNf36xEEKx9WG+Ht6e7hMe
	 DmfgYzizqeEx9RG4iQnInMq5fkpYFlt0VdwGMRhh2UKyRHVogD5ZHWJ29tnpTRiim
	 xtJ1xUZMnV+1z0iUGQ==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from SWDEV2.connecttech.local ([98.159.241.229]) by
 mrelay.perfora.net (mreueus004 [74.208.5.2]) with ESMTPSA (Nemesis) id
 1MXpU8-1tHbbH21Ea-00WOVK; Fri, 15 Nov 2024 19:59:43 +0100
Date: Fri, 15 Nov 2024 13:59:40 -0500
From: Parker Newman <parker@finest.io>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, Parker Newman <pnewman@connecttech.com>
Subject: Re: [PATCH v1 1/1] net: stmmac: dwmac-tegra: Read iommu stream id
 from device tree
Message-ID: <20241115135940.5f898781.parker@finest.io>
In-Reply-To: <ed2ec1c2-65c7-4768-99f1-987e5fa39a54@redhat.com>
References: <cover.1731685185.git.pnewman@connecttech.com>
	<f2a14edb5761d372ec939ccbea4fb8dfd1fdab91.1731685185.git.pnewman@connecttech.com>
	<ed2ec1c2-65c7-4768-99f1-987e5fa39a54@redhat.com>
Organization: Connect Tech Inc.
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SFy/NKLNIwSILLteMFW/RS4w4hsJ0Lq5clxhKWhdd5K4p2oB9I7
 9E9yNKCESFsfEU0sj+5Y9V+rZNMMQFjkMFnnYmmhyhhtXpf+Lg5IH4+6SdB2u4yxJPhoy59
 aSUqUXK8ay7+Nvwtd9u0LH4v948NFr9VXi4995v9PaDbK6ftWGEYEL0r6aFdA+cDnsjk0pM
 b5HC5M3cqWpsKjRB+Smmg==
UI-OutboundReport: notjunk:1;M01:P0:O1wAl8LMaVo=;D2BnCpZbxQfWSIkE7z45IOy7zNg
 U8Alp9c6UVr5okWRhEhSL5n1pbeO+AzORuE9RDkpCYpVAsgPM7L67Q0Qi0nTVWQxX34+n+BB3
 lgERJ0pDZil5xYIRQHMzkmfxoXVZcxdbj9Q2A4a5RZ6kt4s6Jv/MCCCxw1YhXHA4jitgO/5gn
 0AZalep2Uf/1ufOfpn6uk1QhDtd3CkNG8lwZObGj7GZYBJIQp+IBsAf8ktRZandaNFT+ujPVk
 ZIyU1+Scy3sEqoG3RZ5oyIlV6qrxs2UrYIAp3ltvgpoqHtFFNBZVAX6ut4LQmlpoKL9yWC/oI
 iR+k9jTuMXK19Kip/rMVuePCDxIBFi/ezcuWHxRw1kjUZSZtnS/9C7JrD3uFpCmHek7Zvtyub
 pbWjxGS5D92HBqkjzSr9cfhNn4KvoTltDTEKjjf2KZn8TAyfqa049znfSxKqr63+necLfE1Cn
 GWHWds9/wOxpRjPFQL8w7mBXZG6466J0XxBltikARJuJyk5T3gp1MzKya8Z5mIpbUblOb4qGy
 A2cwd8QSzccGq8WikGeAHjz59XF7QWZI3yXTyrRmxzMW2fpm8MJbGm9twncq0JosZ4jJL3Hnm
 wJPFUGeTL7C7ZJlsbdzab/7wjSx0lECOBZLfElOOVxqFWzM1lvwXPwGc4QeEk3ro1Aa4GmZAR
 3N1jYmURAZmnrqTA+yS2g3rYBS36H/lT6yNhkUA6c63TgeeFB3Hv/1aQzNr0yHyD4ckfSwh7E
 JlWAIUpkgxiuI5g5BGtfbP8TOet0DQU4gUU7T9RNE2jnnCqgtFC3GorvcXHDdENqoHaoqwHuX
 mA2DL+v2o77sT+qfM087IugzDMUJ3o80LXH5T10ButyS9p6jhR1zuX9VJXM+cJc8y0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_110010_814703_02F4FC12 
X-CRM114-Status: GOOD (  20.05  )
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

On Fri, 15 Nov 2024 18:17:07 +0100
Paolo Abeni <pabeni@redhat.com> wrote:

> On 11/15/24 17:31, Parker Newman wrote:
> > From: Parker Newman <pnewman@connecttech.com>
> >
> > Read the iommu stream id from device tree rather than hard coding to m=
gbe0.
> > Fixes kernel panics when using mgbe controllers other than mgbe0.
>
> It's better to include the full Oops backtrace, possibly decoded.
>

Will do, there are many different ones but I can add the most common.

> > Tested with Orin AGX 64GB module on Connect Tech Forge carrier board.
>
> Since this looks like a fix, you should include a suitable 'Fixes' tag
> here, and specify the 'net' target tree in the subj prefix.
>

Sorry I missed the "net" tag.

The bug has existed since dwmac-tegra.c was added. I can add a Fixes tag b=
ut
in the past I was told they aren't needed in that situation?

> > @@ -241,6 +243,12 @@ static int tegra_mgbe_probe(struct platform_devic=
e *pdev)
> >  	if (IS_ERR(mgbe->xpcs))
> >  		return PTR_ERR(mgbe->xpcs);
> >
> > +	/* get controller's stream id from iommu property in device tree */
> > +	if (!tegra_dev_iommu_get_stream_id(mgbe->dev, &mgbe->iommu_sid)) {
> > +		dev_err(mgbe->dev, "failed to get iommu stream id\n");
> > +		return -EINVAL;
> > +	}
>
> I *think* it would be better to fallback (possibly with a warning or
> notice) to the previous default value when the device tree property is
> not available, to avoid regressions.
>

I debated this as well... In theory the iommu must be setup for the
mgbe controller to work anyways. Doing it this way means the worst case is
probe() fails and you lose an ethernet port.

Having it fall back to mgbe0's SID adds the risk of the entire system cras=
hing.

I can see arguments for both methods. I can add the fallback to mgbe0's SI=
D
and change the message to a warning when I send V2 if you like.

Thanks!
Parker

> Thanks,
>
> Paolo
>


