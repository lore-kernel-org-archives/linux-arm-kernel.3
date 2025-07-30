Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EDCC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 14:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k5GMeG03tjewtcK58G4TQ57zAvN4HNyzHDLLhPeneKI=; b=mhga2cIlXTjJyqTs06QK22Lb7i
	iwh44gx/0wNeEsGsUacH8/zrUFXLPIfGg+GcildDmYH7lH5MaU8BNowGbd2Dit5Mk2k3sy7eW4Mve
	stOdHrwpzR5iBZ5lIAu7wkCL2p5bV5WfuxAIbKGiaoyqKE61nGSUdbtIoIKUTRfWBULa6YYEr/EwI
	897nKnnrJy/vSLch4IIF0VaLmQImmYoDNqUAw4rqQWZeTv+bydFmMtkerfF82eD3JgxrpMjfk4Qit
	YgJGsnQd6adrZmPgr76n8sGuDWMJIJsc7cHTzmlO6vCah2vbkh5ddHNBFQ+I7SSNeaH3mrGX/AVxT
	VlSjHlzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh7Ts-00000001h8j-2BRu;
	Wed, 30 Jul 2025 14:08:32 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh7Hc-00000001fDD-0ByM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Jul 2025 13:55:53 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id B46721D014C3;
	Wed, 30 Jul 2025 09:55:48 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 30 Jul 2025 09:55:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753883748;
	 x=1753970148; bh=k5GMeG03tjewtcK58G4TQ57zAvN4HNyzHDLLhPeneKI=; b=
	gaqjJ9YSGEVQDtJh18xB+957rxtqekgkY5cIsZe5QfKIl66kOSTta/swukoZgDfJ
	D6rQWt/fptu4LzUQHC8V7yyA3jK6VvHFaJjM1L3c/xA5F+0vYh1PqLSxkXWfOsCn
	/EO+msnPd98znrcO1S50DoImaMfm+iVQmIfcV1X1BbsYZOKpNQ7jWKddI8AtjR68
	IjWlgkgyeC3ZCNmLIw+VFsMaUnzF1oeL8rcDYygY9plFn8m4mmAEweZM2x012BvV
	7swMUhd1zdXpdswAHLc818OMPwtNpPFH1bQdWNSQgVZP6ZsqKndWq9fpR6b06eVn
	BvifuEpuc6yqAKTduO+pNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1753883748; x=
	1753970148; bh=k5GMeG03tjewtcK58G4TQ57zAvN4HNyzHDLLhPeneKI=; b=g
	lruIOeQbETX0RZEC6R3DaKV6hVAptYrCQJP452Gv4BFn4yx2r1mwEwGIEm/7ZXwj
	QHpqbLhniv7dZenu27wOuMxCAVs1B0NcuBjuHIIw8rXqrxMm+muxDjsgVluY09bl
	eDkaKqYBkO+5I2IFcOzflekJANl++9w+dGd95XvcsPwqsb+v6VwSmeFWeE1Y6rX9
	DzRPyXjoCaEQfM4wKzZGaQRwOe/vWowgtKwYuqB8x1RpnWJA0cRen1tAVzlcdZvd
	q0t1heC/UOzl9El1GnThNwfG1r9PN96jFCWr3FgWsN2E+Q+6vWdL4W9lHNGF7CPo
	XLPJQk8nxJ7WHHhKMojQA==
X-ME-Sender: <xms:YySKaBuhOCzwvpmVBFNoSo6EzpdeMcPjw9woEnLN14d41rr7PtYPsA>
    <xme:YySKaKf2tOsiTm_IOtOcNLsRcm8QqAScDNVyeB9-fjKcdizV-1cA4gdFDuaOzdpnG
    XOwO3ugsKhWIxqg8V8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelkeduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopegsrhhglhessghguggvvhdrphhlpdhrtghpthhtohepshhfrhestggrnh
    gsrdgruhhughdrohhrghdrrghupdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghr
    ohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnh
    gvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhig
    qdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhnvgigthesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:YySKaOGB5iPrpPPT5udIB6aQdFEPCEb2c33bc470a0V_oTL_hWlY7w>
    <xmx:YySKaG_OG69IZY7HfuLELQnvMc10xHwIu2JJfcgJyYKCiDWWDrX2jQ>
    <xmx:YySKaFyaC6ksiJ6iKJmRCIgFX879-d_ClzXZQWkM5swXHZjkkxMXtw>
    <xmx:YySKaCMf_A5s_GZPyktKw0RSRcZds5sG-hGuPCRwpoxDmPLY-JaNEA>
    <xmx:ZCSKaFEq8hBkwwxo-4e_WxypxyEZqcsqLwtnvCH25aHR0ndZPjaHyg5R>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6D6EB700065; Wed, 30 Jul 2025 09:55:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T1270fe1a31e2c778
Date: Wed, 30 Jul 2025 15:55:27 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>
Cc: ARM <linux-arm-kernel@lists.infradead.org>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "Stephen Rothwell" <sfr@canb.auug.org.au>,
 linux-next <linux-next@vger.kernel.org>
Message-Id: <6eac14b4-765b-4a29-b278-364dba47e0e9@app.fastmail.com>
In-Reply-To: <627cbb55-2a55-4124-8f6e-7b4ba0441558@csgroup.eu>
References: <20250723094558.5bcfca69@canb.auug.org.au>
 <627cbb55-2a55-4124-8f6e-7b4ba0441558@csgroup.eu>
Subject: Re: linux-next: duplicate patch in the fsl tree
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_065552_485960_01C49781 
X-CRM114-Status: GOOD (  11.26  )
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

On Wed, Jul 30, 2025, at 15:41, Christophe Leroy wrote:
>
> Le 23/07/2025 =C3=A0 01:45, Stephen Rothwell a =C3=A9crit=C2=A0:
>
> I was going to send a pull request for this fix but I see the duplicat=
e=20
> patch is already tagged in the soc tree:
>
> $ git tag --contains 12702f0c3834
> next-20250728
> next-20250730
> soc-drivers-6.17
>
> Shall I do anything or just ignore it and drop it from my tree ?

Linus has already pulled the soc-drivers-6.17 tags, so I think
both copies of the patch ended up in mainline and there is nothing
left you can do to change that.

    Arnd

