Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A37C44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 20:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AgV3CfQUwCOxKpQCcZeddgank8+lUGwPj10cL5YRgn8=; b=P9XNcyM18muoKJMJnlQR6Bsj8D
	SzzsMml+e7++5EEGPi5cvH0VJZV5FDfC7V4ZNh6H/LsG8g30v3CVTIM1qSI94c0zLV8H5ki37vbds
	tsUFZUogkeG1U4mzN7fk2EGIOjKR3E2tXbndX+lyOiY6+66FR/ziXIClDQ3ygUy6bJh9iiGHpkdR1
	3Jvv8cK3AVlzjb5ANjWivCyAd2iWoJcUIoObW4W/c/h8TR+cth01zgaYsRH4mGoqQdnUwRi9990rW
	vhR5el3+WbBFoag8O2Ys/I0qTtCuNsdt7kUktGU8PZKHjcFRDpYWpWX8UzGKeVdnJ219xXFYC0ZWP
	RcUF1TWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdjI-0000000CkON-3OWo;
	Wed, 22 Jul 2026 20:39:48 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdjF-0000000CkO2-3F3X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 20:39:47 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 714581D000FA;
	Wed, 22 Jul 2026 16:39:43 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Wed, 22 Jul 2026 16:39:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784752783;
	 x=1784839183; bh=AgV3CfQUwCOxKpQCcZeddgank8+lUGwPj10cL5YRgn8=; b=
	PG3xCcFXHJQpgThFFaE/ZZQONEdI23t1R+9LPtodbMydg3Tynges1uH6KswJhLSf
	XbbK7/Qu9+KkVAlm2FUgHX5G10xMTO2ko6JzxeL5jGZIyrxihltyfuJfJK+VNVFW
	2ozox8N5x8WCN68bsqebNlrGpPnx+D/aaxY53BbO2o++RD8p9H7fnCX86pBtBmey
	BV1K+XXK1Lnko+7l52VKUkhhLwugVwd5RzOQsuWC4d3bhdQqeqEkPM6vRCPYylc2
	aMkoqioDdFjqkH4okICAjI8u5tX8Wpzzlra4TkKv3ihWVEqm2sYGggLJlFP7UfZD
	xU3LXoKWX/DATwWSW5oRsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784752783; x=
	1784839183; bh=AgV3CfQUwCOxKpQCcZeddgank8+lUGwPj10cL5YRgn8=; b=G
	ZntU8UuZe/gOWBKUr6Q8GltNzwN1EHOH8UyN1e2Lg/ZaD5ihKrpTcM4mo6cpJiC9
	4Pz9SndFN9PART1bKjHcCyoicG+RGYNbwpLLUgcEjxlNRKRc4nhw6z+E8mJDA2vw
	COMLAFkcXejsS1S2Yw14gSX+jaKpkwvoqtzL4Cvm0oR6uUzxYGmc3PvYVQr33koO
	tM0pgCXJkWRQZT6Vm4TMgt/byKJx4nno3v57NkcvtfZSG0F76IYR1szBaotmKGRq
	wxMplHzv2enOzjUvRTSuTwRSdXmakq5dXywK17FPAanD6NQC+tSuRpRSvYQ/o2gO
	SKOxhoxuRkagzEkCyDIug==
X-ME-Sender: <xms:jiphal-KIIvCiIQffsya-AcKwckBuJH2uIrSnEh0kCzW-iFi5Z8-rg>
    <xme:jiphakgYT0YedyasEwwOldfz4EcS-DY2Z_Jz2Nl0ATO5bTEz4yYMRjVTGxdzyE3VP
    jCfNtp5nZo7zik9Cw8L9ddusy7mRLvhzp2kYwiajIp_c5nnhrUH3k0>
X-ME-Proxy-Cause: dmFkZTEFxCd0Ea8kWsgVnw2Dbt/3aQul2rC2oAV6UkFHegQJsFFS0R4+O+23+sWjXW74qd
    ePkg3xRl7tl77bd/rGjW954UW3Vcaseypa3jbIyxKpf0fmw5I5NKFEVzrjB47TVttFHAL8
    C4SM7VR6hqDjL7fpVJOmuHWDbaJYE0apCr0EGxLLw3+dWsNVvUD7YW9L39WCGoMrVZDNJm
    iAO9A4exeTTC8kh6ScvNsHTYlr87owabfxsuHZs4wKPxQ5JxSH1QXkUtoBkaZpsVCauzwL
    /YTEEdNfogzTkPhu77LGWBE10pL9t+0AFBJ8VtCdE0eABkqx/4sgJYlv0136aUcpn91rVn
    gI8gNyaNKpeqZu7GiGU5GRCGPG0rG3322Lwa4EA43BL4OnElaDK/c4ZeSLz8udGc+liGJn
    C2y5CI4R64DsC6E90z5Zbdwr0omvP8qZ+Z4xVyNzzIgLu+smgt5LZmS4MC0ayZRyoVpAi3
    STCCfeNIbcOi6IsRfiSoel/LlxaVPTk8YFk5XtgvFP/oGcO2r+UZzrVeNuQO1iROylpLcT
    XhsuGppc6GulX5EZjy0H91z/jL3iRJHVSK6z0hazQP/w+dayfOy3uvvv/a7GrUbhTZ4G6d
    3cHsQ4t2fWJNnHmsw9a0DSiNBVjJ6yHB4mYoJ1kFqHwBRiI5ZSl9DmDWwAGg
X-ME-Proxy: <xmx:jiphahyoO8icTS5nw-v-LVNH0718-Wa9hihwtBFUi34YhTUIP1fHqQ>
    <xmx:jiphaipTWn7oIZdNQLIQzCIpdftpAA2eczpYYeCRVZ4FiWLSOtlEHg>
    <xmx:jiphaknkm6UIwhS404H9W7esUgfF3vopRZEtG-fr6mzpDYvK_wQ6ag>
    <xmx:jipharx_vFe6PeYZs3AhMsWAng6SGYKGjQGttMaX0lHCBG-kLNLM5w>
    <xmx:jyphahwiTPgnuolJuli_AvFbDS2cSxw605l3qtwe9neRrXz4AHj6DA8S>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A119D1820082; Wed, 22 Jul 2026 16:39:42 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AURDlYaRfEWV
Date: Wed, 22 Jul 2026 22:39:22 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Julian Braha" <julianbraha@gmail.com>,
 "Aisheng Dong" <aisheng.dong@nxp.com>, "Fabio Estevam" <festevam@gmail.com>,
 "Frank Li" <Frank.Li@nxp.com>, "Jacky Bai" <ping.bai@nxp.com>,
 "Linus Walleij" <linusw@kernel.org>
Cc: "Chester Lin" <chester62515@gmail.com>,
 "Matthias Brugger" <mbrugger@suse.com>,
 "Ghennadi Procopciuc" <ghennadi.procopciuc@oss.nxp.com>,
 "NXP S32 Linux Team" <s32@nxp.com>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>,
 "Andrei Stefanescu" <andrei.stefanescu@oss.nxp.com>,
 "Khristine Andreea Barbulescu" <khristineandreea.barbulescu@oss.nxp.com>,
 linux-kernel@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org
Message-Id: <0a99e10e-b4c4-4a64-bcb4-fee8d777d0b7@app.fastmail.com>
In-Reply-To: <20260722202638.135277-1-julianbraha@gmail.com>
References: <20260722202638.135277-1-julianbraha@gmail.com>
Subject: Re: [PATCH] pinctrl: s32cc: fix unmet dependency for PINCTRL_S32CC
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_133946_243905_07D518DD 
X-CRM114-Status: GOOD (  10.31  )
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

On Wed, Jul 22, 2026, at 22:26, Julian Braha wrote:
> Currently, PINCTRL_S32CC selects PINCTRL_S32CC which needs GPIOLIB, without
> selecting or depending on GPIOLIB.
>
> However, other similar options in this subsystem actually select GPIOLIB
> instead of depending, so I think we can do the same here.
>
> This unmet dependency was found by kconfirm, a static analysis tool for
> Kconfig.
>
> Fixes: 94cb9e8f2707 ("pinctrl: s32cc: implement GPIO functionality")
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

The patch looks fine, but I'm curious about what type of rule found
the mistake. Is this a heuristic that found that drivers/pinctrl/*
overwhelmingly uses select instead of depends, or did kconfirm
find a circular dependency that was caused by inconsistent
rules?

    Arnd

