Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7F9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 21:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VNpaj/maNL0E1QeJjWf/EuHS6fHaisLyfyeXNe/3uV8=; b=qMA9ul8LzkebiSjD+pehyjfH4r
	OrnVUVqLoeYzKL8yg2BV1AdmprpVL7xD20UHHeE5p7opTIkoZxxyL1bkDvaEOg4+3SuM97S7opF8a
	lVde43JqgShVffQC71/g4MXZH5otjYjSN5qX8hk3CZ4gnAzxeEy+nxOz0dOTwyk+9pVFHGn0r9Qz6
	54dXsTX2VDh4Ja6MxZg7N21oSMacVXF9pVyBF2iD60RgX6xhH7LCHGIecs7ko5TzhTO/x/qIM4TWd
	lT6vFawtcYjkDfpiMYF9tbMKSXM/taYr+5vufpCdjsTSvZjtwOFtVIfoI6Q3prSROtGkq+6mngIdo
	BqOiRuTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj1Nf-00000007keX-3I7W;
	Sun, 12 Jul 2026 21:06:31 +0000
Received: from fout-a5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj1Nd-00000007ke9-1M76
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 21:06:31 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id ECC36EC01B7;
	Sun, 12 Jul 2026 17:06:27 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Sun, 12 Jul 2026 17:06:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783890387;
	 x=1783976787; bh=VNpaj/maNL0E1QeJjWf/EuHS6fHaisLyfyeXNe/3uV8=; b=
	mjbuPEmFXp+PnMONr5np7w6FgzP+0861ryq4KHUe7UQ3hDIoXgOm0LJ8V3Ae57X4
	aaKTNkOc52d80K0I7567Xt34NkxG0cOooEol0QhmKHkKwqcxvUMOyFCahjfk9fVG
	55WzycbEN7NsG9dlT6aEKPT4Vy9F476/e9wA2Vi4ov0rYXrm88Db4oxMQm4AyWM8
	dOqEQiqHCkGi9t6WRZ5UEpPlm1ySSB2123TwCjOwj8VGFdyb907zKomDaJuxZcBw
	8k1kfsXZy66BKulLp5sCyCG+hgFkWmrS69CP2kV5+kiBebHE0XDveFI8AI21nU35
	Qzzb2Fde7mnkwzjN0nI52Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783890387; x=
	1783976787; bh=VNpaj/maNL0E1QeJjWf/EuHS6fHaisLyfyeXNe/3uV8=; b=F
	ZK0NTPQ1wP7kjVJp9KB2RimARZEK5uddEiSvUZOlVoMi52l0IT6XQW0/WH5DSbl9
	/+U40U++6DEsOpfzyYc0N5SzlIb54gFT05xpTSpb3RPTW91/9++YT02Ql0MAsgTN
	OEabBtx3hidImtB9m7N62mAdgNHGf6Knn9dPgz5jvcLOyVrXDwf90DMSlMS3270k
	/5//fVh09J0c+JXpB4i3bO2SZw/m/mfkrkB7uTOjMgbJiqlwgjc9/L6ftvKlZFlu
	uPESIOgqItb9o9OC8fauWffXtfWuzmawSlBvO5llZuK18cN/lAdUl6mFgM0nO2EW
	6lX0DK1sLQU9aawcDPPzg==
X-ME-Sender: <xms:0wFUarjzbeGzW0GgJmA0KjRd4CdrWdGAB8ZlXUt53p7gALKxXJMG7w>
    <xme:0wFUai3p9t2_muWY5z8U2sp37k5BT0XjsfqUvghKWscYQ0SynrEmIrz1c9WsAagUH
    lDDdN1dqF58kpP4Xr4PuBp4km2MrBGNdAk_xgyQhPgzP1WGtwEz6ChW>
X-ME-Proxy-Cause: dmFkZTE9y5C/6RIdS+5QVbQ29xta7Gw2toEPS1iuIlAx8rzJVQT3j9cubDQryc46qus1Pu
    Idr96Bwew5Kd7xVwCdS6Dt7pwXOD9wzscTOZHEu3dK6v5UVUp3HN7/J0twgmyCdONaGeBD
    p7JDetbzGJSScU5K94RmmVmBPlDHD1iaHOL27wRFddbZ16KeVHH2ojlMM9qu+tUsH0OqiD
    TO3vrmI10eW09YG0tGvuSQRg1TVpA+lDLK53n+RWOuYTumuYFCwJQZeL0VYdqB31AtrHOO
    CEU4LAWotUtKo7xWR9G79aTMKHZSyGgMVA1KScmkAN1lg4Gm5b0yXIMi2u4ysjtV+ZG1Te
    QR9MhTEg6n2ukUnTx1BLhhoY9RgqdEEEN2auejwik8VZegxzLGsXwNGRhT+izp1CxCNlud
    3hP1MPK4cL6Ed4pRHUu8F4KjBCtfOFSrdYLVxEHuGV0XGjb6y7/ioC8E7cFadsNzxN+hn0
    SVflZRr5xBYCoUmqjNlwdEPkgGkFQradPkNc2iFEichqWqxAgHyU/qEhgbpbYkede+sQGf
    7W6rU0VWi2LaCzpy8Q5Q0IdGBjRq3zoHdHbQ3IlnZklu/xqkW9J+ZVONylWdLAt8/xFB10
    VvMvJEcZkgtJQOm5tcX3omnc2pFTeAAZvI66nJ4EO7RUXs0fDfz3xVgYPbcw
X-ME-Proxy: <xmx:0wFUaqvUOgfQOUerfQn1dEyJO_9OaiAU1rnBDI_D-RirTTDidrFjoA>
    <xmx:0wFUaoaIvkpTfPHZUEpu7uH7a_1ra-Nrda-hNGWKuVNR4NO3TGWp-w>
    <xmx:0wFUahXNiWd_6BO1LKVHgQEsNNIs3So335yhDKz_QX96KSxTlU50yg>
    <xmx:0wFUalRxuiDNWCZ-CPBIQ_MR4-h0JXTBbhXmbXWXMyX69SewVhauqQ>
    <xmx:0wFUaqz5vLbumBuplO5s-EdsEl19-X6fOIFn-bkNXCBtYScNDF1UX9tW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AD9B9182007E; Sun, 12 Jul 2026 17:06:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AMjyoxKQRD77
Date: Sun, 12 Jul 2026 23:04:51 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Karl Mehltretter" <kmehltretter@gmail.com>,
 "Vladimir Zapolskiy" <vz@mleia.com>,
 "Piotr Wojtaszczyk" <piotr.wojtaszczyk@timesys.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <b0202a09-af6d-4dda-ad9f-64e727cd9df0@app.fastmail.com>
In-Reply-To: <20260712205617.44944-1-kmehltretter@gmail.com>
References: <20260712205617.44944-1-kmehltretter@gmail.com>
Subject: Re: [PATCH] ARM: lpc32xx: only run arch_initcalls on LPC32xx hardware
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_140629_804979_F69775F3 
X-CRM114-Status: GOOD (  12.99  )
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

On Sun, Jul 12, 2026, at 22:56, Karl Mehltretter wrote:
> lpc32xx_check_uid() and lpc32xx_pm_init() are arch_initcalls that poke
> LPC32xx-only registers (the CLKPWR unique-ID and the EMC control
> register). Since the multiplatform conversion they also run on other
> ARCH_MULTI_V5 boards, where the access faults, e.g. on versatile:
>
>   Unable to handle kernel paging request at virtual address f4004130
>   PC is at lpc32xx_check_uid+0x2c/0x9c
>
> Bail out of both unless we are running on an LPC32xx SoC, reusing the
> machine's DT_MACHINE compatible list so the guard can't drift from it.
>
> Fixes: 75bf1bd7d2f9 ("ARM: lpc32xx: allow multiplatform build")
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Hi Karl,

This fix looks correct to me, but I think it would be better
to replace the arch_initcall() entries with a direct function
call from lpc3250_machine_init(), which also runs at the
arch_initcall level and is already guarded properly.

The calls should be entered in link order, which would
mean common.c, pm.c, phy3250.c.

      Arnd

