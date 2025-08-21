Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB5B0CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 07:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=awCl8mZNDWUiA7LOi84dnKU9phxqklU6SWZAtwSFwMc=; b=c0hqgeBTcr9H3cyH+0Y1ljUCqI
	pnVWlkqBPsDnk1owQBJjM9u8fnJxH3fgen9jjGqdiOZRr31xg5oYTGiGv9QgsD3TjRkY14ArJW8+w
	S4A124PQXgmj2I0tCVBqHst16ROR5FWoxUmegHRECeMQ06JzSVJmEVQ2ZpNJ1iKlFXTf4rceY7ETW
	cYo7UqgxLi/dTsc5Q8cUEKgaqEYEXqBjFZXEVMuYIJZ0esfpFeUVuLKYtV7TGt1WRGedTuyTgDKt1
	sOynhJ6Z7WkwI3sAcdBVVCxzh8mCS89/BKuGa0+BbjifWRNX9O1vaZx6OsxxAiT3jHMPiJNQ0+Hsv
	m2xFCplQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozHG-0000000G1un-3O5t;
	Thu, 21 Aug 2025 07:00:03 +0000
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoyu7-0000000FyHW-3BJx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 06:36:09 +0000
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id AAB46EC0064;
	Thu, 21 Aug 2025 02:36:06 -0400 (EDT)
Received: from phl-imap-18 ([10.202.2.89])
  by phl-compute-01.internal (MEProxy); Thu, 21 Aug 2025 02:36:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=traverse.com.au;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm2;
	 t=1755758166; x=1755844566; bh=awCl8mZNDWUiA7LOi84dnKU9phxqklU6
	SWZAtwSFwMc=; b=J7juqJTvx//eV3PJ7g/3JHvO7F/qYTCA43EnQFhCnwFXE83Z
	lUa3dHNqasLVRZTEF9rISjkj9psjKBzHEzaw932+eKU6wIhOHnPIA14S4g4CBCJ3
	AllGN0Lq6k0UdJmZNaHAmd4T3Kmp7dvMHVgKAD2MiOwZQT48Gjf/yNYWXXl7ds8C
	FY1n5T9mQYOdVo7PfaDzhScLfNE1PEeuSyXfqF4NadhXm558YzmJ7+KXMWTDUQlU
	eiegecjvRNkdcFI+Z9LQq/+bv0kpF1YCjRfr7Y4ZAiWMFrZLqRpEzLmwPykdCVFv
	qjwUaCsTO69sr5wHIf+E4xGMVVkEz+zPUV5jjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755758166; x=
	1755844566; bh=awCl8mZNDWUiA7LOi84dnKU9phxqklU6SWZAtwSFwMc=; b=D
	0ae8aPSqTIEc50/HBJTnrKhVO4Ey/y3sPTmlif7+DB+s/BQPCcgETKnO7orzLwJZ
	lKRWZlxAEKZe1ll2uttMEHEBMMuHkBJxUllI3gssxeTZhEFxILHUk2WiLPJIqz5u
	Pmpi1dIQoEk1X/E4cVIFvcxnJSoNnXPmRPoEQz2Xk6mN5rQQOnua1gOUCaUSVsAJ
	vqZcx5iVqGT/XZNsXd+gKS/IeD+lrsXh9x/tfDyUs4TtHPOtaozITNdZ4hAU9fx1
	atJBIs81OoV5luznkpIXDTsYIl2MX15aEfPfls7VqSsTgEKQBDOjlpQwpMpQEehK
	CeD8j1FtCyqp3QF9Gre0g==
X-ME-Sender: <xms:Vr6maJPsETLIxCzpY0xs-UQTZCjBh8RKyJ-uo_ty6aGgPJgy6KzhNw>
    <xme:Vr6maL_op0W_LTi4mR3vD0UbjjiJO_ruSoxb0IffE5fOLnxupSOXjE0lopwFdLqE3
    L6tDUClWe6eXL04GKY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduiedtheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfofgrthhh
    vgifucfotgeurhhiuggvfdcuoehmrghtthesthhrrghvvghrshgvrdgtohhmrdgruheqne
    cuggftrfgrthhtvghrnhepvdeitdeufeffheeltddutddtuddugfdtveffffekvdffvdfh
    gfejuedtgeeluddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepmhgrthhtsehtrhgrvhgvrhhsvgdrtghomhdrrghupdhnsggprhgtphhtthho
    peefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehkrhiikheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhi
    nhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvggvsehvghgvrh
    drkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Vr6maM0C-vOL3QsoAgcqMBlvO-x1lGauUm1ll6E5xhD4hV3L_W8arA>
    <xmx:Vr6maB9pxkhQ-608VgtvyVD7WxNTOMeBjdgRpuXbyetcpaR5_Cw5Mw>
    <xmx:Vr6maMtcr2zjRUXBQB8U_gRKuqWOrszUOQhjyjdL4r8A1dAFiK_sbg>
    <xmx:Vr6maEDyFtdrtI6QBlzYk7aINfpFrO1RBmlQb082VSUKvCQlsJcxTg>
    <xmx:Vr6maL6XNoTFixNrjH3VVeY8CwJ-00ZRHRQC_ZZmwbJG3pzvbi1P9ZgJ>
Feedback-ID: i426947f3:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 747A515C008C; Thu, 21 Aug 2025 02:36:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: Abvx3TMA-vy3
Date: Thu, 21 Aug 2025 16:35:22 +1000
From: "Mathew McBride" <matt@traverse.com.au>
To: "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Message-Id: <26199775-297f-4b91-9cc9-ec06d0a86e7e@app.fastmail.com>
In-Reply-To: <58192df0-aa6e-44e2-9dfd-9e0402d1fe9a@kernel.org>
References: <20250813023435.27776-2-matt@traverse.com.au>
 <20250821061115.18254-1-matt@traverse.com.au>
 <20250821061115.18254-2-matt@traverse.com.au>
 <58192df0-aa6e-44e2-9dfd-9e0402d1fe9a@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: mfd: add Traverse Ten64 board controller
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_233607_870937_F59D1A47 
X-CRM114-Status: GOOD (  21.81  )
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

Hi Krzysztof,

Thank for your feedback.

On Thu, Aug 21, 2025, at 4:19 PM, Krzysztof Kozlowski wrote:
> On 21/08/2025 08:11, Mathew McBride wrote:
> > Add device tree binding for the board (micro)controller on Ten64 family
> > boards[1].
> > 
> 
> Do not attach (thread) your patchsets to some other threads (unrelated
> or older versions). This buries them deep in the mailbox and might
> interfere with applying entire sets.
> 
Understood, my apologies.

> > The schema is simple and is (presently) only consumed by U-Boot, but it
> > is possible that it could be consumed by nvmem or other type drivers in
> > the future, as well as extended to future Traverse boards.
> > 
> > The categorisation as a "MFD" follows that of comparable devices such
> > as "gw,gsc", "google,chros-ec" and "kontron,sl28cpld".
> 
> That is not MFD device. Google EC is for example, but you have only one
> function. I think we will move all of them to some separate ec directory.

Noted, I will wait for that change to progress before moving any further with this.

Hypothetically, the ten64-controller may acquire some sort of "child" binding such as
watchdog and nvmem in the future, similar to the other "EC" devices, there just has not
been a need to do so yet.

[snip]

> > +  Communication between the SoC and controller is via I2C, at a fixed address
> 
> Either you make it a schema or drop it.
Is this in reference to the "fixed address"? In which case, I'll remove references to any fixed address.
> 
> > +  of 0x7e. While the controller firmware implements several functions, there
> > +  are presently no parameters that are configurable by DT properties, except
> > +  those that are required of an I2C bus endpoint.
> 
> This paragraph wasn't here before. It's completely redundant, drop.
Will be removed as noted above.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 

Many Thanks,
Matt

