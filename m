Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB737CFC28A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Nov 2025 15:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DzcM0SEDw1Im8fyyYBvoRQL2qFmDyiUwqhJDAcQietI=; b=IVNRFuAaMJ42YrOKtxIqsrQQqu
	SzwSU55HCWzEzgMqoUiuuBrjMj4nDHQpYpkzTx56ZjhaCDgZ3qk5K2hincM4E0LJ6rPiUCCAtKPnn
	OLIiyXV6TDZRt/BS5/5MGVZdqcWUiImpVdHKqtbsg6l50se+EEi07wDpVKPmrtpAW7xcS1gtD0GAP
	mgs7jL0EedSOJzwqC+eC6krMEVz5ETLfAgQm5mhR9vJpB2UjkuZBvCUpUkOD28t/sF0ijXE20cEHc
	uQDQ9JbhUU7Iz5U2Y9sKiUDCAgdSLU4izMMAaY6hPybzQ4+ERmGPNhpqT7dpppQDaMfr2t3bpCjMu
	Z+J+dEZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSmK-00000008aID-1Dq4;
	Fri, 21 Nov 2025 15:10:28 +0000
Received: from fhigh-b6-smtp.messagingengine.com ([202.12.124.157])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMSmH-00000008aHX-1Z92;
	Fri, 21 Nov 2025 15:10:27 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 7B06C7A013B;
	Fri, 21 Nov 2025 10:10:21 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 21 Nov 2025 10:10:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1763737821;
	 x=1763824221; bh=DzcM0SEDw1Im8fyyYBvoRQL2qFmDyiUwqhJDAcQietI=; b=
	dtY7eTXm6z72fUOOO/qOQRCZCE7nLB5/COnsayJ2X3an2s6zR/DpxY7eInL21wlQ
	WIQopkjoX7PAbVqd3MT9lU3RtJ600pmCc5N1Dm1coHHww/H0laqmBQBlTVnZ3QXQ
	L4ESBSaG+iCHeJKZfvIhFj+AXJtwP2SYhBOaIuKJTzcFC5TOw4wWh15FKL7gocyJ
	Y6WH3Sv43ZoCTATa+bMHhkWHLvJxIeNA+QgEyv9Ruf/+sPqGJGs+I3Q/RZL/8UF7
	Zrx6C3Erl9ZKl95quATmJELhFxjo/nlckGUtbyfQHbF9awIjOxMxyt4qMVSp+9yt
	uFeKQR1s4lhzCtMxwTGR0Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763737821; x=
	1763824221; bh=DzcM0SEDw1Im8fyyYBvoRQL2qFmDyiUwqhJDAcQietI=; b=Q
	UA0Fo5SvUkmXgGqQuJvjUSByoK42NUh42UjDqOaKiWgbS6MinxkT0sd272hB7W+D
	HvctXy7+yEhgAJ51/xXbP/xAE6qW5YvtfY59YHMu/ol287owpGlf3fMiYgOTAhyW
	jfgr7VTJf4K/GEf0acuiLyf/OCJS7wf69DtpG7zhHxO5/FuFETNEinUa3dQODHdL
	bhI7i0QGvSML5IlRuw+oEHe20JqklyfVVF67csPpgl27AxWTgmo4Ei9BmwmnVtpu
	oEZY1uUd1HRUEudf1xgj4V8nhLJkhDjDENxNkQ9AYvBlnY7msfO2AieYL6fNn/h1
	xvgSLLmJJxqt/eOuC19Gg==
X-ME-Sender: <xms:3IAgaYHUEGvo-ne5gkZhxxQ-MevE0ITlKZfF8bv2TXLk6DXyvgcZMg>
    <xme:3IAgacI0kVVgEWlixUuWUfiT6FuFhLx9CpWjrWM5eHx1ERCwPpjdKNtgYZhIja-5v
    kroOAJ2zKrzVh1F6q6_qLLg_H8k2HpnqsZ9Jsn5kdkdpsxS6h0dFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfedtvdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegrrhgusgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgiekie
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdr
    fhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvg
    hrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhn
    uhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoh
    eplhhoohhnghgrrhgthheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthhopehj
    rghvihgvrhhmsehrvgguhhgrthdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnh
    hnsehsuhhsvgdruggvpdhrtghpthhtoheplhhinhhugidqvghfihesvhhgvghrrdhkvghr
    nhgvlhdrohhrgh
X-ME-Proxy: <xmx:3IAgaQobINDk36AsLM6qAi37y35WNG8fcy-IPYwT81UtDOP69W5h3Q>
    <xmx:3IAgaXHy2EKi4JZDENLJjNgh2jqPvL0iGJdWo6ROzCZAfVBSSOEUpg>
    <xmx:3IAgaU8wQD8W2AA4zezbIVBARPkZc-2doMkJoyEm_GT9fAygZG2L4g>
    <xmx:3IAgaURbIfsqA_WQy6F7q2MeK8e-4Qti348yk5jtKvNDZdcs-FFwjw>
    <xmx:3YAgaeSI3c_MRk18gVsMtEXTcvu2Jwxiwr0-6n59AFRitQQGspBnOGUo>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8EB84700054; Fri, 21 Nov 2025 10:10:20 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A5Y7Dcvi2yON
Date: Fri, 21 Nov 2025 16:09:50 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Ard Biesheuvel" <ardb@kernel.org>,
 "Javier Martinez Canillas" <javierm@redhat.com>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org
Message-Id: <96a8d591-29d5-4764-94f9-6042252e53ff@app.fastmail.com>
In-Reply-To: <20251121135624.494768-1-tzimmermann@suse.de>
References: <20251121135624.494768-1-tzimmermann@suse.de>
Subject: Re: [PATCH 0/6] arch,sysfb: Move screen and edid info into single place
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_071025_932098_20BF4D91 
X-CRM114-Status: GOOD (  10.15  )
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

On Fri, Nov 21, 2025, at 14:36, Thomas Zimmermann wrote:
> Replace screen_info and edid_info with sysfb_primary_device of type
> struct sysfb_display_info. Update all users.
>
> Sysfb DRM drivers currently fetch the global edid_info directly, when
> they should get that information together with the screen_info from their
> device. Wrapping screen_info and edid_info in sysfb_primary_display and
> passing this to drivers enables this.
>
> Replacing both with sysfb_primary_display has been motivate by the EFI
> stub. EFI wants to transfer EDID via config table in a single entry.
> Using struct sysfb_display_info this will become easily possible. Hence
> accept some churn in architecture code for the long-term improvements.

This all looks good to me,

Acked-by: Arnd Bergmann <arnd@arndb.de>

It should also bring us one step closer to eventually
disconnecting the x86 boot ABI from the kernel-internal
sysfb_primary_display.

    Arnd

