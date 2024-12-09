Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD2B0E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 15:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1wpLU7NdMNLKMJXitPexq3zWQMmtGFqtdStBciFX6Y=; b=Z/ZtqGT2OtdQbX3NQaW+C8MwnS
	mUGqKjhTYfjYDuqxPw4FEwrHk7+T8ackSwV7hX9fmxYOOXO/OsIAC64PsQjeIVVV0PP36AyRYlk9a
	1d+SJ9kLL7IL8xd93dkXhiebtCDcoGszZK4YyW1UsWJwBmx41ghRcMSroEyLTwnjFjkYBUWczzMuM
	ZJ2rjYknCldYI8NT7JnGNuqi6GzChcDj4mcfqvpdb4Fsrr9g1yddqgsjnqZ3rrEpB+85ZtNczGaFk
	H7WXlFeGHIWBMvfjD+JBZnPgxqnnua20Ybc/Zd+0dW3NboNEM2mKXZeXsl+7SvZah0/QPm6t9d7ek
	RCiQ12Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKfh1-00000008O8Q-0HrS;
	Mon, 09 Dec 2024 15:29:03 +0000
Received: from fhigh-b7-smtp.messagingengine.com ([202.12.124.158])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKffg-00000008NtU-01ZQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 15:27:42 +0000
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CE99A254015E;
	Mon,  9 Dec 2024 10:27:36 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Mon, 09 Dec 2024 10:27:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1733758056;
	 x=1733844456; bh=g1wpLU7NdMNLKMJXitPexq3zWQMmtGFqtdStBciFX6Y=; b=
	PjtCvuIBomD0NC33tx10Lr/RuHaGuTSMMuNWOlh7t3f+jPDHD7FBKum3PaB0PPSv
	ZjeCk7FUXnZbOyd85LgLy0eDaxDi09/amwyiYxaydufp8IblfYKIb630Byl0WaLn
	XVJzIHVWTzGn0q2+CCOlsI4DQeCzU7RyivMnMWz+c/0NeozuqcfgGp3EpI2HswcA
	fd/TbomeVmZNvtebel+97+Gg/UqkPJdOveRJFk6naLIfaCh0+9E2RqOACwMWjtkd
	+JH0+yJemuQHVyMiXx+RY6Q0WFVhGQj2CEa6Zzf4LM5jE3gF1RhqavgfXGuNJzLO
	buyZusiLiKh1BlKUw71GyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1733758056; x=
	1733844456; bh=g1wpLU7NdMNLKMJXitPexq3zWQMmtGFqtdStBciFX6Y=; b=r
	Fvst69zJKY8+MrLbf4po14ZKBgbWBi0L/Y4feBgdxdPp0WD+H0Bsl/4ASUVVL6wh
	knS5li5jUx4w9avH4xG/37CcWOCfc4YvF3ZTZ4aLNdCNuqIf3NyA+j7IQR71Zq4s
	XeEJcfdCgqm3WkJYw1xAtddoBS2bXVyPzRDDbj+ygc8v6W4zt1MKWPWqTrNubPd5
	HzrTP654g0g66Mdd4NOsFCt+mEvvzbnJUanbDNLuAzpKLlztwayeD0SAi2W54qjy
	gk+j0dccwAdwJzJy7F5wqVzaiYz6hyP4PdUYR4xuF1h6c30JJi9ODLR3ZDsTKFPC
	yO3HAxafVazR1A1/BHNvg==
X-ME-Sender: <xms:aAxXZ0Qh7KNgoQ4rjLgGnlKYMsD6Y-9hiCz03FtyYgiI3wy3c7mHOw>
    <xme:aAxXZxxeE9xwcuxWQtA081_mNeEfaphU_iGMaqU4k5CAEjFuYjfbWMitW9ODizP2E
    UPEImLIqo7CnuMx-I0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrjeeigdehtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffg
    vedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeehpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehnugesrghrmhdrtghomhdprhgtphhtth
    hopehsuhguvggvphdrhhholhhlrgesrghrmhdrtghomhdprhgtphhtthhopeihvghorhgv
    uhhmrdihuhhnsegrrhhmrdgtohhmpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrh
    hnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhu
    gidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:aAxXZx2S_Bv21hz3hVLHNM0DhYNB_S3FJFmyop0i2y0TbMmnhzWpWQ>
    <xmx:aAxXZ4Cwb_NTepIABwjTYBvgDmiN9SjwlgSu5K4MIwo-EFiyeIe11w>
    <xmx:aAxXZ9jqZPGXA85VrApzvxYeFMkxLb09CJntam5wpKF29um7fywB7Q>
    <xmx:aAxXZ0qq_MJtxNOA6H7x-Rr9pVBN5-ZjvRsS_uCWBrFnOYjKyeF3Rw>
    <xmx:aAxXZ9f2abhBisLhbbeovIqnN-gYz6v4OIXdLe4edRfywWTCGVxoh1Q1>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 028E32220073; Mon,  9 Dec 2024 10:27:35 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Mon, 09 Dec 2024 16:27:14 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Yeoreum Yun" <yeoreum.yun@arm.com>, "Sudeep Holla" <sudeep.holla@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 nd@arm.com
Message-Id: <9e60e996-070e-43a7-80e9-efdfda9f6223@app.fastmail.com>
In-Reply-To: <20241203143109.1030514-3-yeoreum.yun@arm.com>
References: <20241203143109.1030514-1-yeoreum.yun@arm.com>
 <20241203143109.1030514-3-yeoreum.yun@arm.com>
Subject: Re: [PATCH v2 2/2] firmware/arm_ffa: remove __le64_to_cpu() when set uuid for
 direct msg v2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_072740_841732_F36F7421 
X-CRM114-Status: GOOD (  13.15  )
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

On Tue, Dec 3, 2024, at 15:31, Yeoreum Yun wrote:
> From: Levi Yun <yeoreum.yun@arm.com>

I just saw this commit in the pull request, and I'm very
confused because the description does not match the
patch contents.

> Accoding to FF-A specification[0] 15.4 FFA_MSG_SEND_DRIECT_REQ2,
> then UUID is saved in register:
>     UUID Lo  x2  Bytes[0...7] of UUID with byte 0 in the low-order bits.
>     UUID Hi  x3  Bytes[8...15] of UUID with byte 8 in the low-order bits.

The specification you cite here clearly describes little-endian
format, i.e. the low-order byte corresponds to the first
memory address.

> That means, we don't need to swap the uuid when it send via direct
> message request version 2, just send it as saved in memory.

"As saved in memory" does not sound like a useful description
when passing arguments through registers, as the register
contents are not defined in terms of byte offsets.

Can you describe what bug you found? If the byteorder on
big-endian kernels is wrong in the current version and your
patch fixes it, it sounds like the specification needs to
be updated describe both big-endian and little-endian
byte-order, and how the firmware detects which one is used.

> Remove le64_to_cpu() for uuid in direct message request version 2,
> and change uuid_regs' type to unsigned long.

'unsigned long' makes the code unnecessarily incompatible
with 32-bit builds.

     Arnd

