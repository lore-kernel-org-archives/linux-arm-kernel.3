Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDAAFD5311
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 08:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+KCsio2wrHwIiV5/dMoK3Tw/3j2a8KEfcABD565rOG4=; b=wrxBBK1AQqJ64/sKnoIhwP87MA
	v521jNrjgomWcbynwu7uNVlIMnJXU5qgl3Yn30HrhIQ7ivMhb0nl28fopAmoq4ok3pHm/vssM6De8
	uiEEQQn5ws/kGk1FMkmjpghHtn7jaXsj9DXbx4ABfvqlCikVLtza3osAYNqnpEJYzgN5QUBtqF1iZ
	9O0Dg9eRBW7jH5rBsZOMi30zd6TkXgNkaHty8VTjfv2+4XBmRWf2LFaTReP+FWzByNCGVDsyVFZQ1
	aqH2sdchbFMwiRxGiGGOFYbUesf/qABnm4oK/ouHABHU7ksix0h43gv3WDGFa1AxEKTsW2X7ABnqO
	YNTE7XBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtZq-000000081zU-1Wv5;
	Fri, 27 Feb 2026 08:52:02 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtZn-000000081yz-3bH0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 08:52:00 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B193B7A0090;
	Fri, 27 Feb 2026 03:51:58 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 27 Feb 2026 03:51:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772182318;
	 x=1772268718; bh=+KCsio2wrHwIiV5/dMoK3Tw/3j2a8KEfcABD565rOG4=; b=
	Blq25ZTIr2oecLSxKNEUueJHjo4Evtx26CAq9L8MjT0z2zDKnwTIxAIj/Zu5djrd
	7qzXiXqL/PwjOp5EfNRC8OPb34ozFWwrtdfMyw1HboBSWlZfa9EEhfdDoSm6aBKQ
	VGoZUgtcBIFNI61PU7/lbEe+C75i5BAGouT1SL+9PDRH1LhPxwTVTZjOtEBCWYWe
	nnlXz6pqvrBQvkr2UQxUiL7NIlzwXbsSAI6ceOjzrd1PeFQ775FgObKnWtcxVPSN
	6aOTxej5pe9OSwP+/TqZJT4k3hejBMbsYW8iXX8fXFR58C9gniRSbZAoUiqXoaMZ
	nxrLJPWqZBZoZ/VVr3MNcQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1772182318; x=
	1772268718; bh=+KCsio2wrHwIiV5/dMoK3Tw/3j2a8KEfcABD565rOG4=; b=J
	GOXmZzMJnGKWMmUc0ue+u2pXOBIrYTmAxLuSpTsDuTA5n+4c/vPWyCj15FGwcRVK
	0fkFIm6TdWSW3J7Nn0U9/1Z2eTnPTMgxfIpBU6Ul6Mybmo0ZOpuUoqoXzqkLFO76
	13lDWTgKrLRbY2anDPqF1c8UO1H3I+sgEXDTXTjMCVg7G7fFfDWQNNYFyIc+4ST/
	+l6aNHJ1K6YEyzCd19lv7Ov8bpTEojUBLObCB4Jb3/vYDuTPbyNnKxXYyQxabwbK
	rwcWaGKjkbdZa54IgyKm0QuDgPq5L8lZorSgZ5UUzU1QXmpef0pXIhRE9VC2G4jz
	BUeuwyKS/6B4Zl91OHsxQ==
X-ME-Sender: <xms:LluhaSAzAZPE6KRpH-aznGnF-edp0VO-ppRwUVRjiDU_PLNE5eifNw>
    <xme:LluhaXVYgGg7XgYWCfF-hlJ8ZwLAiAe7nZuMDZj6Q6diFbueVzkr-FShp7OpwZj4_
    OGHjawiQzyyZPvBUw2XeIV1qQBo18Uem0bu1iyHO03nIT4-gCKjs44>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeekheeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvddupdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopehtshgsohhgvg
    hnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtoheptggrthgrlhhinhdr
    mhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehvihhntggvnhiiohdrfhhrrg
    hstghinhhosegrrhhmrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhig
    rdhorhhgrdhukhdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdprh
    gtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtoheptghhlhgv
    rhhohieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhuthhosehkvghrnhgvlhdroh
    hrgh
X-ME-Proxy: <xmx:Lluhaa_Z-NYZFJU8JxieTGZ8X3mA1PQy2-Wi-UNa4EOIGcjh0y3j-A>
    <xmx:LluhaWSQ7VCUZ699wMGLPT878vS4RJq1aVEnB16IRyXAvSX5DB0rsQ>
    <xmx:LluhaQDvCoc1WHlNRQytR8CUzFe0vNQ5VFFCAmDi1T64p4zRiMCv7g>
    <xmx:LluhaXa2sqhlcTFagSv8ygCNJkXiUVnmn1YeXZkzLMSw8yQbGYA5lg>
    <xmx:LluhafC83NJGThoiRMmADNRyjJkNd33U8dE4gx47yWse_NbXWivPWLf4>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3B969700065; Fri, 27 Feb 2026 03:51:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ARwL1vy566MZ
Date: Fri, 27 Feb 2026 09:51:37 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Andy Lutomirski" <luto@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org
Message-Id: <c29f5e70-bd17-4e1b-a005-5a3282e70075@app.fastmail.com>
In-Reply-To: <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
 <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
Subject: Re: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_005159_935872_9A5777D0 
X-CRM114-Status: GOOD (  10.20  )
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

On Fri, Feb 27, 2026, at 07:57, Thomas Wei=C3=9Fschuh wrote:
> If CONFIG_COMPAT_32BIT_TIME is disabled then the vDSO should not
> provide any 32-bit time related functionality. This is the intended
> effect of the kconfig option and also the fallback system calls would
> also not be implemented.
>
> Currently the kconfig option does not affect the gettimeofday() syscal=
l,
> so also keep that in the vDSO.
>
> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

