Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDFAFC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 16:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ZISPdfq/Ebr+c07sYJ54++ZX34Ve9JE67WSECkdKHE=; b=twa3YwOPa09b1el7WgFxV6jG/I
	Vx2nBwovFPH2boBXda5NMkVZoLk/OA2GsS+Q4zGrY2nejwO/HMNO2VmP970c9zeMyhGaRyBTC7E20
	9bs1TWCXjZYE+3O4vZjRWXU11aZUJ/NfYtxRRER7BjRU6Js1F33wVRYMFr9DxpNZhvraz/mPKABRU
	MgzaFMWr+WFVED6JlJ0+pxi6FfWfDEPKIYPH3lbXKMx/pEKSEsUEUilVpQzUSBq2BJ+RuP+T40FkK
	gq5bL++yH+VcSoe6tve6TtcJQvlhSwhjPdCkpwci7tAIL2LfoclxQZsIJ9wwG28qyLtBiM7mhETXx
	YNlnzYNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7Fd-0000000FDtz-0QUB;
	Tue, 07 Jul 2026 14:58:21 +0000
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7FZ-0000000FDsw-2hxa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 14:58:19 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 95D4BEC0224;
	Tue,  7 Jul 2026 10:58:14 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 07 Jul 2026 10:58:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783436294;
	 x=1783522694; bh=4ZISPdfq/Ebr+c07sYJ54++ZX34Ve9JE67WSECkdKHE=; b=
	ldiMtVZjhL8WLStNNeyPSWYRvpWSvjnsF8T7WgujEZSLbj1egVpzRVUM56B1NgYB
	l6n4daTp1AycMotVlVgVDtXq+nliGmlx799wQcOA3r5LyBS7frGaNs5JQCVy/Wqz
	QxLqXGEGtt8qYLocVCkVnRZKPAr7EhrRYR/IRBoNsIlNOcvnKR86bESTYX33y15p
	aEh2r00njGhONcNCUXqrE0BNKiJWRIUt18FWdOzltJTSM0s1c/IiB74mOfy9Ei56
	ftQMMK7L1aR8JIOIGwJT7YT05YO2tA8jFX4SCC8csVJRvhy8SAqO9Y+pVzcvzHCP
	2l2JGJCu6NTy1um0DX1WqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1783436294; x=
	1783522694; bh=4ZISPdfq/Ebr+c07sYJ54++ZX34Ve9JE67WSECkdKHE=; b=W
	v65Z4d8RC7GiZw1zBLTM8Yqc7W2BNAegD8Qv3JA4wP7qLnOcCTQlre0z1jSthYWX
	faOL1TvVaPVLCgEZxpMXBdUinOSLVGYeTO7ixG/iYBowUQz2Z/s0vvvCSrVOgEdy
	oGE7zWS2Bpu05w0F/xGzdKGw49FYybLYUyL6RpwL3vGOsK6TBaj6kryKNuvvY2yh
	52hBqbQmnnXbko8DPesO8K7cjuMR5gf0M67FeZTgNTh59FiffBKK/ZnKiub32zmW
	T1PQL2LGpomteH//jIrOoCInz3DYc5UHgzLr5vHWS1GjtEVaaMbL41FWhYAd2Wjp
	I42uhKsmjFzCLeibuYbRw==
X-ME-Sender: <xms:BRRNavrNNdjnbiWCFen_ztj6E-NNJ1jZMC1uzxkFacXq0TfS9tKitA>
    <xme:BRRNakcj_u-yN9gY-xhhadY7fLUXidZYoPlx5xQIDGOg8JKj4kTLfHvkThOBMHEC-
    niPzFZy2WezNaGi4ZfAnrsZ8cTnzIGTvHFm2b2O7BgygGqRAZu-h-Q>
X-ME-Proxy-Cause: dmFkZTFMvw6d1AO6NN17g3fEgXceIekx5pCKysbKgirsFeEFXPWfXcdYlXTfFL8kBN9Kmn
    23Yp6qKDDvdGZGluptYZ2FQjUvUgrx1dFmrj+h7INIYNugxIUs2nJybWumJT71ZdJqr9Tn
    u5sy/6gAsi8Etp4vAY1glcxVFA/NC6RPkTjeY3t1mfJ9kiUjihs6aKEYUTXmvIHR3a/G/s
    /Z+IM9+CAuGmQyqGXh4d7yQVTWkD/DH6+FPWj96I8tor7h/QvaS8WUZ514KUeh2NgSwioA
    WD68OUxeJ8QDo2lndqD6Hd2cuXkphZKsLqGHZajb8FBqchiwarAJZVPHa7MmThKos/sPlT
    5W0tFgYaRU6MSWRb7FceeQK3jZcCCCdJxB2llVa1dI/Y5CvGiEESSdaMq/3rg3SAWlfmFq
    xWgFOYS+xY8m4Um6mEq0GqCqkaXO2fqy+TYMqL6EOWoR26WV+yYlq5oOO8miOIwyouBufN
    gn5LH9N+d3hgr7lT3TeIwjQyjNjcdx32w8KOVmS3HHiEg2GZcRvN+BQPDHMvGQC62k+Ekj
    nXHLtgy4dezIk0eeqUKn0gaAfdbBy98L/6oNW/ouJ34M8Hd/fji0ZQyfHmYR2bmysZru8X
    0Isp0BwAgaZjPtaInI99cJCDU2QVSInbKOJSGFwJzYkCLIzA4pfGPO0W1Q1Q
X-ME-Proxy: <xmx:BRRNamaTruIusFkRPBSBosE7cRtjiWjqB5WXN0qprheLwOczM0ij0w>
    <xmx:BRRNar9GfuUjRWuewcNsABjTSOrwPCHoGRAN_lQuOvacOz_W0XoTXg>
    <xmx:BRRNakmOhYsDhuVHDQm2WAL9G8d9HLZMOru3WgWyCbjMqQuH3kzm3Q>
    <xmx:BRRNaozgi-zAelHiYUVjEEAlAc2-YuBbj3s8AhI3tN4VluxinH4iSQ>
    <xmx:BhRNatPrGaHfjXJpE_IMbh94bWKmjPuTpO-YCXjfHaoJH3_ckS8RB3CP>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 99D4F182007E; Tue,  7 Jul 2026 10:58:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A9WOz104Gfyk
Date: Tue, 07 Jul 2026 16:57:52 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: "Andrew Lunn" <andrew@lunn.ch>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Bartosz Golaszewski" <brgl@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <e0ff0694-0fd3-45c6-9092-d1c6c0339fb4@app.fastmail.com>
In-Reply-To: <akwm0xsquU3tu_Rk@google.com>
References: <20260705-orion-mv78xx0-swnode-v1-0-07d95ef4f447@gmail.com>
 <fc4f8eb9-7da0-4e65-b93f-e54f101de351@app.fastmail.com>
 <akwm0xsquU3tu_Rk@google.com>
Subject: Re: [PATCH 0/7] ARM: orion: convert legacy gpio-keys to software nodes
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_075817_803789_9E413127 
X-CRM114-Status: GOOD (  13.63  )
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

On Tue, Jul 7, 2026, at 00:08, Dmitry Torokhov wrote:
> On Mon, Jul 06, 2026 at 08:50:36AM +0200, Arnd Bergmann wrote:
>> 
>> These all look good to me. Unless there is an objection from the
>> platform maintainers, I'd suggest you can send them directly to
>> soc@lists.linux.dev for inclusion in 7.3, or alternatively
>> keep them together with any other gpio-keys patches you have in
>> the input tree if that lets you finish off the platform_data
>> support in the driver more quickly.
>
> Maybe I should create an immutable branch(es) for both myself and soc
> tree to pull from?

If you send a pull request for those to the soc tree,
I'll merge it, but I think it's also sufficient to only
have them in the gpiolib tree, as I don't expect any
conflicts for 7.3.

If the patches don't make 7.3, the files are likely all
gone though.

      Arnd

