Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6ADFD5310
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 08:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5Bl1ZduDLzVxSXBUWTKpj/hN3djT8hEup1G+obA35k=; b=1cxedWsDIwQ7RlUYVAcMkOYSfI
	NimlYgYKTDdQadq2t3pZpO0ziRz29uParwhj2pTmKmJE6QbTgX4phAb59jWol5lIpllOSDlfG4UK8
	K21XUKVddjoq1VrRBqylx1Aw92FG5k6i2GMAw2hNgnkzt+kU/nUXz9fQAylfHP25MrdegTZDTp9jm
	ymVUltaD2ZieMNm4Sjp3o8LgTwNdO68Lx7J2Q9QJIhQBjU1qeJrKeQXd31UZbkahSXpKBd61hgpRi
	O9+r5jpGKJI8jpRJDpsKxbgBBtzPJfwrlbBXsCSjjt4cNjZ7zG2VN40UR4bFt1ZYS45+b4IMoqdJ2
	CXLamLIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtXE-000000081ij-25f1;
	Fri, 27 Feb 2026 08:49:20 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvtXB-000000081iO-2lmW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 08:49:18 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id B6E471D001DF;
	Fri, 27 Feb 2026 03:49:16 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 27 Feb 2026 03:49:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772182156;
	 x=1772268556; bh=u5Bl1ZduDLzVxSXBUWTKpj/hN3djT8hEup1G+obA35k=; b=
	TlqjyPTNv0GxDZ+AQB+7nJCuy+/6M+rv4MyT3JS9TqcU67OoAILNpCfv+CXi3fqA
	1RdgPG8250Pf1Juzez9+F2ilu2GpClueCJ7vVYsX5lM3PW2PKu/M+D4R/xAnKfiu
	Ouqz1hshV/CA+deO+DmlBz6uSxzMo12XNfXr4Tt+nIQ5NUm6s92KbKWEVfEkE2bj
	9ozx9315mEoLuMwPvAgo8/APp4XWOI1CHbtjHGHDj1cR0LRF7Frtim7HxclFPzwJ
	vNtn5XNiHpYrvfD7qxzt9VVvLdN2YqCpy0qI11+xHO2lR4bxsST5hL3HIc6MZAvD
	/IyayYMTuZHzUJq2th4bvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1772182156; x=
	1772268556; bh=u5Bl1ZduDLzVxSXBUWTKpj/hN3djT8hEup1G+obA35k=; b=q
	uSdg9/f9t7bofmFwDOHxXSqsLLqWaElXp6WdyyIAfewDAsFs/FmjfLCGpQjqD3It
	87SJ3spufHvFd1A/5LTnpAKsJaFHe6G+1hDKR2clY+vB1baNz7oyRR9CueW4SMCi
	tH7B6KVVZg3LsZkt60a0YnQjPGDnUIgv1M4FayV863rS+Xz/MXjxnCiYcFtmY7Nu
	WOqELNBW7PmXMEkhBTJyMFikPRkjE+XTE6htw2cmTgB7OS/JuCVE2gLSdYhFlJ4s
	lGByIiJgRq9fptVOEFhmoakvKN0o6aFb6tPsPLJtphA1PFXMbOgdk7qdhqwwvySj
	eQ+qw+T0Yt360mzlO0SnA==
X-ME-Sender: <xms:jFqhacmom8s-6Jk8xTeHbg__zIs1AgNwKnZpg93D3CSYezLEFbMymQ>
    <xme:jFqhaWpHxk36z8LVnlVh2nAQwGTzQSsnbOio2kEKvIu64KH3owCuK-XPvnmr6dW1N
    _YToSUO7Acm0i1hHmjP7-89txkoGCurSe8du51iG0xHFuk8kFE0yJTo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeekheehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtg
    hpthhtohepsghrghhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgr
    rhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopehnihgtohhlrghsrdhfvghrrhgvsehmihgtrhhotghhihhprdgtohhmpdhrtghpthht
    ohepsggrrhhtohhsiidrghholhgrshiivgifshhkihesohhsshdrqhhurghltghomhhmrd
    gtohhmpdhrtghpthhtoheptghlrghuughiuhdrsggviihnvggrsehtuhigohhnrdguvghv
X-ME-Proxy: <xmx:jFqhaZINiPd139F9nupy2Iy3Iao2OynFNNbT6JWUV_7M4C44WJoA3A>
    <xmx:jFqhadUDKYL-nlixQW7KtSo-aPK_QINVSXkE9omBTP3Cid7FR2ULxQ>
    <xmx:jFqhadTBvgyNnTXu2zW96e0KCdml1caJuMRFkBj88ytvF9TJd3zAhg>
    <xmx:jFqhaVCFRblcjrzrjv8NQfAMWZqDs5k7wCqLJ_CcC_DMRRkMS2Bmjg>
    <xmx:jFqhaeeEBwshkBUgXehH-5N3p6h__0AB3oV3S7Yjtp9_jIYkL8mSY8fo>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1846A700065; Fri, 27 Feb 2026 03:49:16 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AS5Jn35VdNwF
Date: Fri, 27 Feb 2026 09:48:43 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Bartosz Golaszewski" <brgl@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Conor Dooley" <conor@kernel.org>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <10bb25d3-2f46-4b62-affb-31257d51e24f@app.fastmail.com>
In-Reply-To: <CAMRc=MehMLoBL573cWjQNN2eCiTCyqCv1xwVKqfkZ5isBhBUaA@mail.gmail.com>
References: <20260226143615.65788-1-bartosz.golaszewski@oss.qualcomm.com>
 <84da053d-97d5-4d07-8e76-b162a5b23d2a@kernel.org>
 <CAMRc=MehMLoBL573cWjQNN2eCiTCyqCv1xwVKqfkZ5isBhBUaA@mail.gmail.com>
Subject: Re: [PATCH] arm64: Kconfig: provide a top-level switch for Microchip platforms
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_004917_742065_287297BC 
X-CRM114-Status: GOOD (  11.12  )
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

On Fri, Feb 27, 2026, at 09:42, Bartosz Golaszewski wrote:
> On Thu, Feb 26, 2026 at 3:49=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
>>
>> This will surprise all out-of-tree non-defconfig users, because their
>> boards will stop working (drivers depend on ARCH_LAN969X|ARCH_SPARX5
>> which will be now disabled), but I like the consistency.
>>
>
> I'm not following, ARCH_SPARX5 remains enabled in defconfig and
> ARCH_LAN969X was already disabled by default.

Your patch to the in-kernel defconfig is fine, but most users don't
use that but instead have their own defconfig files which they now
need to update.

      Arnd

