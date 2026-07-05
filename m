Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDB7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 09:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSMTXVruDIRjjnXmceDngK0jOBafJI+Ml0R1gPtkUcI=; b=v05ueOogm0KqujwLf2BP+kLFd6
	/t3CErs19svM5A2G/YkhL/x2fJtmo56TVNZQG4H1Cf7HuHplcIeM9ZshX5wCtcIw2PtoXTU4DU0aj
	o4eEKLQj+LsJ9LiHFwXMa8JnZTn3kfZ3AOuQGW7N4/ynpRH1DpF3YMhKx5DJ1lpN/KI8e85iJKxL1
	7Zw9POmuJkyQTxH7DmbbrYhiYnLonzngW6xtnWNyxbPM0tJqrQxJfEhHPdEd3aSNsuPdAhsNi9sjD
	mnyLmZYeA4EZWRYMAFhLtiWxA417mvC8YBzi6ADXPW4jfOEkM0ABVQUfEbfmdy7ZpDqLwfCfbykPN
	f4DQKrlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgJFx-00000009CUr-251I;
	Sun, 05 Jul 2026 09:35:21 +0000
Received: from fhigh-a5-smtp.messagingengine.com ([103.168.172.156])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgJFu-00000009CUW-3lVv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 09:35:20 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id A8EC214000E2;
	Sun,  5 Jul 2026 05:35:15 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Sun, 05 Jul 2026 05:35:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783244115;
	 x=1783330515; bh=LSMTXVruDIRjjnXmceDngK0jOBafJI+Ml0R1gPtkUcI=; b=
	AE5jLDrwbHf+vRixt4gAnNacgHEDARWAOZnsZ1ybgvxkGM5HwMd3u6pOFDScyrQ6
	SDvx5ef/5/XjVz1aR/gzt7lZz3UpXmbdkHt1Fivj1Mc58ni+y4jELUcQI8i8pXJY
	qyVDFffKv+KnVRvyhdwGDnB3qO+2WrOv2GFsi768gCaJcvtKGBM1H4CHE+yDN+76
	MdC5nBPbr6wLjTrAM8iFYbULVwavCs/b92bfWM9uJXlcsHI2Bk8R9bD3k1DSX7af
	oKIFQpZJVTW5fa7z7R9Nb0ZdYp/ReouxShD/8N8G/ZYX3y5K3By2vTke+xVqaczu
	hs+vzucaa7qgQbVDjrExRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783244115; x=
	1783330515; bh=LSMTXVruDIRjjnXmceDngK0jOBafJI+Ml0R1gPtkUcI=; b=L
	Fw15hzssiDDgxmbJwsv1SZzPFmqFSTUJukSFOGvIKx/YB79hixV+qt/9uawmgJRA
	tAWCTDjWd9VW9P9eP0UKy/8OmVmgTEqz14PMNBDZSBxyXoqiFgLw17dzlwTWQXuq
	VlIfUn1DqNdapJAX47T7q8QpFZOBMNNHZ7DqqDoRYtT8kSLkN5LrYgNMIuFIvfA8
	kHl9W/zCRCBGcESMfcVdaHh3JzwxO7xO2CwfVqiATQk+DAd08kvyF3etuXmaPtCo
	Iy8TNH4R2IT8zXuySunpmQhvU2pNM1Fs3u2dbMUCVltitbgPqnfeDn+p5fdCHwNX
	M1lv+OIGrmVsVLBuw19Ig==
X-ME-Sender: <xms:UiVKahnHnDInyNSB3OZZRYqhQoouplTV3MSja4rXzb6TJC4Jd1UvFA>
    <xme:UiVKanoPPHweIZfqqLy2IB1geEPY27qCaVwo5m_uoMkocpmJoaMaCsRGu1dHFdjsx
    Z_2I6pQuJkwuh9qusNPP8zK_9iAHaXl0ChL53oXmGITAXgMg6OD4TqW>
X-ME-Proxy-Cause: dmFkZTF3pnwFZPirFYTFt8PAub3hCi9T3P7hmDxFcXyeP15oLDFgTlcs9QGPjThyW6zZga
    tVI9vbe6pbo0MOCfo2i/53HFVfSJ0e2NweFXqtPTlAoyPQ3mvF+tliJ6/XLoRO+24qpPxA
    GEDwzgYX5UKBJSxg3f0XB8wb3A/ptnESl1EkF4/5jRBKtAQR1Jjk/+bIlPvzTH1/hMfJa+
    TSK6OCibcG4ScnCREQppL5oFfDT09wB++iTu5oR37hBNo+u7gNLfmKl63M1dGobJIdOQWE
    QHbFohEssvH+oL63OFT3mvliLOiae2cc0hYm+w7nvNZgFOkXeofSg72M8GDeZDiTSNn/Qi
    DfhxTM/wCzid4wa+faTSZBjx1KT9W7UWJZ+AeqmvGVKt/gVaOnPVdKoebtlFZyIhfqKbcl
    AQ+lFBsM93dvn1Fnogl/kELNts5Xnls29tOr2BJS2Z8qJfhL/j+mtgwL/Beb8le52cMwdr
    zSyjCaDGdGcVW27YAfEB4D+Qhfpf6yR+poCPEXiHHqhG13ormKRzyMK4h5NUT/rNg/O4XK
    c9OCguadSE0IZvJ+R1g5MqjZSphTXnqs5hBd1cDpxRn03KDdfZs/WrMq/bTaNFCzjsI3MO
    D0vW0+qSJaXs0tHEdKhrr04UTxl3Fi/VXzb6c8lF1BpwjovRvofM2oiByStw
X-ME-Proxy: <xmx:UiVKapgx8ntcP7YeJwT7bRQMnuIcMuQCG3FK2ZTqlx6-5BaZ9jY5tA>
    <xmx:UiVKakYsODm2R4KRU697r2dI-kJvLWxQdH8Eccymr-F_j17MrhxnJg>
    <xmx:UiVKalXfKdamc6WoRWk3US8en4yflN2lG7VeIjiaIkXPzXUgbqkgYA>
    <xmx:UiVKasEURMyjItbiVhTuFnBuBC99alvkAmLlQNCtR2WAhjWktotZbQ>
    <xmx:UyVKarGhdiznsWF-IMVqWaTxDMsqK3bDhCcoyVjTBxMLTjbVxYiZQEpk>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1453F1820086; Sun,  5 Jul 2026 05:35:14 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ARgniXuJ1PtZ
Date: Sun, 05 Jul 2026 11:34:53 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Linus Walleij" <linusw@kernel.org>
Cc: "Drew Fustini" <fustini@kernel.org>, soc@lists.linux.dev,
 "Imre Kaloz" <kaloz@openwrt.org>, "Russell King" <linux@armlinux.org.uk>,
 "Daniel Mack" <daniel@zonque.org>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 linux-arm-kernel@lists.infradead.org
Message-Id: <d5ded362-abe4-4e6b-9585-a2a75dba27a7@app.fastmail.com>
In-Reply-To: <20260705085000.3510576-2-u.kleine-koenig@baylibre.com>
References: <20260705085000.3510576-2-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH] ARM: Don't let ARMv5 platforms select USE_OF
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_023519_467608_580C9000 
X-CRM114-Status: GOOD (  10.64  )
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

On Sun, Jul 5, 2026, at 10:50, Uwe Kleine-K=C3=B6nig (The Capable Hub) w=
rote:
> USE_OF is already selected by ARM (unless ARCH_FOOTBRIDGE || ARCH_RPC =
||
> ARCH_SA1100; these all conflict with ARCH_MULTI_V5). So there is no ne=
ed
> for an explicit select and it can be dropped.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koeni=
g@baylibre.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

> ---
> Hello,
>
> If I should split this patch by mach-*, tell me, but I think it's simp=
le
> enough and these architectures don't move much, so getting this in via
> armsoc should be fine?!

Hi Uwe,

I'd prefer it as a combined patch, but either way is fine with me.

Please send this to soc@lists.linux.dev in a few days with any
Acks you have received by then.

     Arnd

