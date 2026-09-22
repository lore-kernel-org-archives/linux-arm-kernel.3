Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E790C982FF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ofxcWs5wvUKXDp1OvqNuIaoTkk52/+tItoWNT6uQhGU=; b=xEtP4PRYjMMisAl1O8s3leVZRA
	e9w4A7Gyz+DXPBJ0M6M4hpP0uBrYMeHAIGeAd3lthdEcaYsmO087nnafu0T2IraIVPt6c7T4dk9cR
	W++rcSsaMSZJkS4WqanmKHbyujD5mBFBW2+yb5Rk6eaKlgVRyu90rBSh2IV3jT1swktSyh9N0gYLl
	RsU2GSjwaREXUutzyFQcxfdGhEvnsWYx3Wmi8KpGsmbi+JIlkDeIRpPjha1AnGh62eeDmrIbGRR84
	/OTeo6Xrd/eqPibXA2XeaPDUQ293Fn2t3pH+jevw1m0utBe8pQMm7IDTgkZ+l5nY3f9MumccHcZB9
	W6zX3h2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90W9-00000005Vta-1ASG;
	Tue, 22 Sep 2026 13:26:41 +0000
Received: from mail-ej2-x05.google.com ([2a00:1450:4864:34::5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90W6-00000005VsW-0yhV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:26:40 +0000
Received: by mail-ej2-x05.google.com with SMTP id a640c23a62f3a-c2950c25486so346237166b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:26:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790083596; cv=none;
        d=google.com; s=arc-20260327;
        b=NK2gbTow38N3LJ4t5M8kOXdbNfESoRidN6eXs4oGYiefvC1xRf0CzOvfApKR/qieOP
         +JzCWRAzA5+bmm6XPCr4ud8UwwPPDTPrWZ+0A+FOeVsAmfBJMDdEnVZBOv7zzz/sOurp
         Ci6t8SJYQPkWS38l6Pin3Z8iCNF6QgnPxnP3cOkOnIj5pdA4YxvPZylKi6+cCbf0V7aL
         rWxBP7HOsm5hiFcsAJZY7HxvfC+IGiS0hu5c94RAX0Sz5OodEYRtM8bj1nsfDNLTmK8j
         DEe8SrMbGMi/hedKe440VCE33+mMqh08G1FQLL/cozW69pJQlPf6ebnBLarrJnOM2THe
         9Bhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ofxcWs5wvUKXDp1OvqNuIaoTkk52/+tItoWNT6uQhGU=;
        fh=AitjQMHuBYk7H6fn19gABFWxwG1Y2rL0zusYyZ66HOc=;
        b=DrbMElFLvz6bvwfeM6knoBf/YQrebhoZ+h9yhhtnd/Uk/awwjS6J1SsR6G/cfSq7kk
         GBmGV65xuq4INdYs2hERIemlBssFh3EUwIJym+1CoRffWPQ8PydwVSJNST7xblk08Mgt
         mwlDOSuvF9r/6wvXLpI4izt8gKUF27fO9ibKNix6dlUAK2yDtgw3V5KkAQJPTb4lktwj
         DO9uJH2syrwlUcIQUaNzMcvj4HZIRtK0301XcQLh9IlXOu1HKNq0TbE+/Lw+HocPcEfL
         ZcbTfigtlVfAYpNQKXsVZInYXmy0+FBhY0wTdMVYaupYSVM5K1eB/WAvcKMe7RDdKP4T
         FBeQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790083596; x=1790688396; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ofxcWs5wvUKXDp1OvqNuIaoTkk52/+tItoWNT6uQhGU=;
        b=QxR2Jg6sC+NJw97vsTDMB4QK94JLweFSKuI+aPPpQi8f2H+QrWBEnnN0TVGy0lS1yf
         RNEWNpFyh/K3BhmWnXvFFBSdiQKmXLbkG3EEw4inJ4pNKfbip+tyHe1zWZsG6an9zo60
         cPz/Sl4Enc001Hh59MCDxeGnAbEfUsP2dDXeeMs8YX25JJV6f5HntSAqkielhZV0Mb+n
         CTp6KnuiRb1rY4QNu8YgBDA6NCBghV9OvmzVup0Aey0q+UyNhFZuGuSOP/aV7oznZyo3
         tVdsttnMnckGHFW5W/aPnRtIxa76o3iIXH7Mji9oKuh9H0SdoitTwyAVx3tkrENWc/rX
         R+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790083596; x=1790688396;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ofxcWs5wvUKXDp1OvqNuIaoTkk52/+tItoWNT6uQhGU=;
        b=yrfxgeVgxk++UmFfeAy1/+a7NP90j3Lu2KeS7YslSatF+qiGmPeF3HC+d6nKy85B6C
         JB+QOsDXXIyLU7oFtwkysOdTUCtXdntmyhy8DvwFwQCsvu4Qrt8h4YIzjYlwWljWDIeZ
         P79Rh1HVXv6gY3RZiWEiP8oJQ6WUVoIg48aa3Xc0k1eRuxGN8zvQicLlWGuIHLG/No+U
         3U3nkDzFG3uuOBYF8cqC93cbHZk7S3izm2swJSWJrZRRekVZQK1+5tlMx/6qqeogPl/8
         gsvuQGSKO69jIXBnn9EZ3V1BFAykAJU0w+Tke78G2C511BmFPGqP7P0M17+5n7PrLYNq
         rc8w==
X-Forwarded-Encrypted: i=1; AKwUvBwKSDuX8VAyNtUwIhDc6aMx3cb6yoMxbzdNr5lbOOMmvpI8nxFjrVs60QPHJSSFyQFu6fQHeSlT5uMX4AUJvYcN@lists.infradead.org
X-Gm-Message-State: AFuF++n3QePelBm79zq4F+IvF3zYhxS+wVvGfwCUGbJtqxDmwgIw5/Nw
	wS4cTNpixhqNFT5l0ApyGQNLyI8n+3ojTyIfBc0k/oBylFg2Cv9EwSlllmq8aQz2tKVvD69v4cN
	ws5NBsBajXeRCI7Z03tBXPw+QGyTEfdQ=
X-Gm-Gg: AYBFou0+JWmmqNwmHcBW8qgfecwZ5c3am4PaV5F2zxrsDtSDPszkEYnooGb1bfEI2F8
	nqVqxLi7wUR/7aeP6XUa2wuJBvVgycEj6eeRoIEDCdkvTR/VsUcHm4DqYpY0UX1PlmFLw5H6AQ7
	dO8rfG5SNSJUQxNNsJ15UYgmzgwBHNCvDPfg/Gui4YJmseo5Ul5Lr5fwXMpwzr+1KuWU84tpP2Y
	kkUHMygUlNehP9gDmgoaKNmJ/VjsgkNIAuaxxgtHEXz4WTetEEfoiFRnduB462eYc8oRZsDCF+E
	poOe6RYQKP1CpsZDS5DrA2Eboo0sIqrgLs9hyxOs48b9dgXA8zsU0w9qOQ==
X-Received: by 2002:a17:907:962a:b0:c25:6c9a:88bc with SMTP id
 a640c23a62f3a-c2a156ed781mr1064393666b.19.1790083595818; Tue, 22 Sep 2026
 06:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260916235200.20712-1-ansuelsmth@gmail.com> <20260921135933.7e8857ba@kernel.org>
 <CA+_ehUwy9RUKCCHDnqoED3AMVnErgGr9RCrCR4ceg5QONq1wOQ@mail.gmail.com> <033fc935-c37a-4b0f-8b79-68248e45da8f@bootlin.com>
In-Reply-To: <033fc935-c37a-4b0f-8b79-68248e45da8f@bootlin.com>
From: Coia Prant <coiaprant@gmail.com>
Date: Tue, 22 Sep 2026 21:26:23 +0800
X-Gm-Features: AcwNN1Ur2tt8b16s6pIVEQsDoiyvx1gOYWr_ba3DyTwWp74e1eP8TDNhMjUzs84
Message-ID: <CALj3r0gyfggFP-T+yXM2P=ooyQMk0AUfnpxtArk5ioU+wMNrxw@mail.gmail.com>
Subject: Re: [PATCH net-next v16 00/12] net: pcs: Introduce support for fwnode PCS
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>, Jakub Kicinski <kuba@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_062638_298693_42B69109 
X-CRM114-Status: GOOD (  20.98  )
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

Maxime Chevallier <maxime.chevallier@bootlin.com> =E4=BA=8E2026=E5=B9=B49=
=E6=9C=8822=E6=97=A5=E5=91=A8=E4=BA=8C 20:50=E5=86=99=E9=81=93=EF=BC=9A
>
> I'm attending a Rust training until thursday, I'll see if I can squeeze i=
n some
> time to re-test on mvpp2 :(
>
> There're a few series pending for rockchip and S32 on stmmac that deal wi=
th
> PCS support and their PCS handle. It would be nice to have some stmmac gl=
ue
> maintainers that are using complex PCS to help with maintainance or at le=
ast
> testing, maybe Coia can help with the tests ?
>
> Maxime

Hi Maxime,

Thanks for thinking of me. I should be upfront about where I am though.

My focus this cycle is landing the RK3568 XPCS glue before the next
merge window so it lands in the next LTS, and so downstreams like
OpenWrt and ImmortalWrt don't have to carry a backport.

On testing Christian's series: my current glue goes from
ethernet-pcs-mii@N up to the XPCS platform device and hands the virtual
MDIO bus to xpcs_create_mdiodev(). Christian's series changes how the
PCS is looked up, so testing it now would mean restructuring the
Rockchip glue and rewriting the binding, and I can't fit that into this
cycle on top of the initial merge.

Once my glue is in and the lookup story has settled, I'll be glad to
rebase and test =E2=80=94 and convert to xlate if that turns out to be the
direction. I'd like to use xlate long-term, the timing just doesn't
work for this window.

On maintenance: I'm a student and fairly new to this, so I can't take
on the PCS subsystem as a whole. What I can commit to is helping where
I have the bandwidth: testing when I can, and sharing some of the load
on the XPCS glue layer (pcs-xpcs-plat and the platform glue drivers),
plus a bit of pcs-xpcs work. If there are stmmac glue maintainers who
can help cover the rest, that would be very welcome.

Thanks,
Coia

