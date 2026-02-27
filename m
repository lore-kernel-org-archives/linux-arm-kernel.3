Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD0AFD531E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 09:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJcN9mJUhTg9JnRFFAenfSiTLRwJZ36vwMgQ8p3zjEg=; b=3QO9V+ey6gZaW/vO7C+tXwPpqK
	48P1KOJGPRINEZ50b23sRACWr1QIymKif+0lffArw6PjkMreNJEZJYn0XRim8BJgclcuFmOHGTP+J
	8HpsdUvKuQiPRs2eo7WOIkD7dSqljrmXqhCWOHPZYJH21K9tsNk6rOg4vFaRv79bC/tzlXdu3LekS
	bD/F5JzJpF7dPbzF0F5uxZ/Kn4/9fe8QJf8qUyBFfPmuG687yaCvNNX37M8wWhbspSlvQ1VnuyK9Z
	iq5b1rZlXR9sz0SKDfCf6+UvolJ9rAvriwHsmBeZSP7k2g8jTAMXC+bMv9HUMracHCKsLnmsXLkrW
	CwGHSS7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvu9u-0000000879h-32uo;
	Fri, 27 Feb 2026 09:29:18 +0000
Received: from fout-b5-smtp.messagingengine.com ([202.12.124.148])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvu9s-0000000876m-18Q4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 09:29:17 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 268E01D00119;
	Fri, 27 Feb 2026 04:29:15 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 27 Feb 2026 04:29:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772184554;
	 x=1772270954; bh=QJcN9mJUhTg9JnRFFAenfSiTLRwJZ36vwMgQ8p3zjEg=; b=
	Xy65DSxhpWzoXXJtzZvlJJ7mhXP63MX79epS2V4TyIDvma0lGCQ3h+Xl1mivCJ4h
	5CTJSDjKRCbImz8xyywpnXdhujbw6UdxJ0ScHasBzW3fsf9jzdjezlYxzGuANVDh
	BAU3BmqGYGhtZrvBXtmLVcrFFQsEHe87SFBCXYLMmH08L8RySf3QZNLP+8MREWZF
	66uffsx3jKrQATd4F8EjhuwyqywTq28KdJJ3y9Ze3IQOxZR7BdbP3UsMBEvJVPkU
	U+YliFN8UpqdW4K9tBf0/kVzGiG2xq7jDddBg00m3WME0/ATxPm/6QLH8DRXY+Q6
	L2XMtu/clApJecu/1czuhQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1772184554; x=
	1772270954; bh=QJcN9mJUhTg9JnRFFAenfSiTLRwJZ36vwMgQ8p3zjEg=; b=E
	lN+KAHDdHRCUgnyyvJCduTzwqUaNB5rVU3x+KLIpm+kSyr3FjyMFc+UcmKx2exjx
	hN7hqyYuHv/FnOyX7EcPSbG0pKSDEVlA5dLMWCAwAxDgAL2CTZQgUSMTIuFdjO2Z
	64JHSPDHvODsLv2kS/Fbu6iq59WXnc9tzYVped7v3sqkRr1TlyUcxch8jEJQxS5O
	YnDpY2daEs9bXYJZc9++vy5ZbSqNM5JDPr6euOOTjcJaRDY4zsbWRM+Kvq1doXFl
	FIVG0xWCEteJxUjczEVkayHyTJppKSpLbC6bWFtql5X1ZQONs0DFfrvgSkBhpg4A
	ca8p/atgdlaIUSFRXi+Sg==
X-ME-Sender: <xms:6mOhaa9OOEiu5LOf9WuvuD39Zej-Ueq33IILkTDrCuHisXffly2BmA>
    <xme:6mOhaViOjX088T7tZgHEpyXRdLPnbf50uu36P3FXglmovafhbSQfi4hT_VTB1Z49W
    aQriWUa6PRhSG4p6a7mwytGo9lQwZsMO3MdFbuIU-RSdvn98GI_MXJc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeekieegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdegjedvfeehtdeggeevheefleej
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtg
    hpthhtohepsghrghhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhnohhrsehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgr
    rhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtth
    hopehnihgtohhlrghsrdhfvghrrhgvsehmihgtrhhotghhihhprdgtohhmpdhrtghpthht
    ohepsggrrhhtohhsiidrghholhgrshiivgifshhkihesohhsshdrqhhurghltghomhhmrd
    gtohhmpdhrtghpthhtoheptghlrghuughiuhdrsggviihnvggrsehtuhigohhnrdguvghv
X-ME-Proxy: <xmx:6mOhadghJrlmO67itgkGSu6_JrgV4elcTKICv1okbYQBkMEWDYzZxg>
    <xmx:6mOhaaOJNl3dUnHyIw3skW2B4XTKXI5Cf-XILVnhuN8fHhn7K6KIdA>
    <xmx:6mOhaYrOn3WgOYoY2KxgDxqIZZqf0RtomuZunliKSqKsH0-_TXukuQ>
    <xmx:6mOhac5ySx67WsSlXtcB6lV0nD9Bc6D4axpsvLGFgeHcEtpdEOPYnw>
    <xmx:6mOhacW7zicIDR-6QLOrJk_ZcCMuOjHsGSsO9d7F2_Rot_VDJBEuq3kq>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 63F17700065; Fri, 27 Feb 2026 04:29:14 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AS5Jn35VdNwF
Date: Fri, 27 Feb 2026 10:28:53 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>
Cc: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Conor Dooley" <conor@kernel.org>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Message-Id: <244fdbad-0d9f-42bc-a005-5f5ef34d067d@app.fastmail.com>
In-Reply-To: <9132501f-76e9-46c0-839d-bde7246c3883@kernel.org>
References: <20260226143615.65788-1-bartosz.golaszewski@oss.qualcomm.com>
 <84da053d-97d5-4d07-8e76-b162a5b23d2a@kernel.org>
 <CAMRc=MehMLoBL573cWjQNN2eCiTCyqCv1xwVKqfkZ5isBhBUaA@mail.gmail.com>
 <10bb25d3-2f46-4b62-affb-31257d51e24f@app.fastmail.com>
 <CAMRc=MfupCCr8J+qnJACVeri4nZZCnULWaRgSvi4LWs4J3-5vw@mail.gmail.com>
 <9132501f-76e9-46c0-839d-bde7246c3883@kernel.org>
Subject: Re: [PATCH] arm64: Kconfig: provide a top-level switch for Microchip platforms
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_012916_352662_83AAC70B 
X-CRM114-Status: GOOD (  10.71  )
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

On Fri, Feb 27, 2026, at 10:21, Krzysztof Kozlowski wrote:
> On 27/02/2026 09:51, Bartosz Golaszewski wrote:
>> On Fri, Feb 27, 2026 at 9:49=E2=80=AFAM Arnd Bergmann <arnd@arndb.de>=
 wrote:

> I don't think this is fixable, that's why I wrote that I accept the
> negative impact because I like the cleanup more.

Agreed. I remember when we split up the ethernet drivers into per-vendor
subdirectories and had to add 'default y' to each one in 88f07484ccdf
("drivers/net/ethernet/*: Enabled vendor Kconfig options"). Changing the
default to 'n' would be a regression now as much as it was then, so it's
not something we can expect to do more easily in the future.

If the Microchip maintainers think the change will cause too much
extra work, we can leave the current version forever, otherwise lets
apply it for 7.1.

   Arnd

