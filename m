Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E419C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 05:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+c4cfk5bIIVixUFmq0Bup+UjA5hE+VOmmk++Lxu70M=; b=yzchIsusVNsTfGulZFvQYDp1aN
	BwLXLE2m2vKEH+H4fsOl/6iJkUQzt0Miw1UuyPvd8KsHXskiLGaEBOOTtzgsFgvmm9329tXd8KxXg
	xY10WsQkU2/Fy6hdHizRuUrXixS6kNRLN/zdeuH9r5EzPk/4faz/4Bq2PCtFdmU4m9MAiG23HGto+
	ncXALOfG9zQf1SYruZbTB8EwfayGyLMEk3/wwdMWbncW3Adfq1MwFkItFdd8jDujG8Bh1wQsSEsNu
	RCigEkUJH7EGRJhxJT/OHKrknWskLrQrE51rOYp66jwMEG/e60JJfLUAKzI9UuGV+XbJAC3HcMRO/
	aIBWH6gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua6dd-0000000Dn50-3PSh;
	Fri, 11 Jul 2025 05:49:37 +0000
Received: from flow-b8-smtp.messagingengine.com ([202.12.124.143])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua6Vc-0000000Dm9Y-3nWK;
	Fri, 11 Jul 2025 05:41:22 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id B7630130002D;
	Fri, 11 Jul 2025 01:41:18 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 11 Jul 2025 01:41:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1752212478;
	 x=1752219678; bh=K+c4cfk5bIIVixUFmq0Bup+UjA5hE+VOmmk++Lxu70M=; b=
	HumDKL0v0T1NJLhwr7jorqx1vvP05PA4e7HznW7B5DO5PxN8083rX9TxWizbtOZO
	u/xFeEad3A9mupqIZOGe+F1zbfBf/gpc2t/WShiOY89OmC0pR9wzgzqR7cn8rftT
	4Aib3kQwmJy2raUNW61UEjiwa028RW2yuc2bMl3UIxxZsyllZ630SZGVLKCalfRw
	E3mWXuBeJpQCX18MM3BmtGe2DVN2wtPRkX9unVbs1mQoZP8KMvE/QdqDWk0oAClE
	unvhalCoUSqD5KtjP/RwaDcwvzNYtZV6zWPFH2MwW1MXaETwubbd7ONLzshV49LH
	5isCvpJWKsNacACiTXxgkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1752212478; x=
	1752219678; bh=K+c4cfk5bIIVixUFmq0Bup+UjA5hE+VOmmk++Lxu70M=; b=F
	B+ou8KfW0Z2ZwTJ6TD76msOg4vedRCHv+T7arkXqrDXZHbgpZ/TpbfwfFyQtxs9T
	Dh7ikS34egNK2DHtsMkRm+hiHlPb0L6iwiAFiNQIebGr4ic/An4CpykugrL8avLf
	ecRqzDIOOtB29CR1x9ZCB2r44btykK6otD6XLlbjaFl5LcOX6ar3MQNOeK5vU1uO
	USX5PNSn8rRil0XB2WigpBZ4waf5+J8RXdScV/uq/4KAUeKOZHMU4tCkE4YhbYJd
	l+W2YfJbBo8sX6ZZp577t2IkSE5lN1eyaL6CC1Ztc5xfKTQU+EX2XqMd0s6wczGD
	wHk5kbDRz6Kct6TmgNBTA==
X-ME-Sender: <xms:-6NwaE9lod84s0CXMHkWfZC0AO7TO311GcRRwtgrwS1_5zEsM_swlg>
    <xme:-6NwaMs4h2clYaMgfLfM6-evGe8bWGyOpzKbQ4XqdLBrZ5Hy9U4xyxWBT6fxFrHxr
    ln44xztCgiO9ZIM3t8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegvdehudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeggedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepshhouhhvihhkrdgthhgrkhhrrghvrghrthihsegrrhhmrdgtohhmpd
    hrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphht
    thhopehmrghrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehsuhguvg
    gvphdrhhholhhlrgesrghrmhdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgs
    vghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsggtmhdqkhgvrhhnvg
    hlqdhfvggvuggsrggtkhdqlhhishhtsegsrhhorggutghomhdrtghomhdprhgtphhtthho
    pehflhhorhhirghnrdhfrghinhgvlhhlihessghrohgruggtohhmrdgtohhmpdhrtghpth
    htoheprhhjuhhisegsrhhorggutghomhdrtghomhdprhgtphhtthhopehssghrrghnuggv
    nhessghrohgruggtohhmrdgtohhm
X-ME-Proxy: <xmx:-6NwaAKKFPiix-Afsub2jew7TZkSNHqvQc0vt7cI6doA_m_pMEoBNg>
    <xmx:-6NwaAUUPtPEsWr3Hikpbe4OZuFzJ04UMTX_-_fCFZIGyordVvxKjQ>
    <xmx:-6NwaKNtpq6HXvZORQd_4Are9OXcNBqTFMAhhOHgg7tM0TbYGY-U0Q>
    <xmx:-6NwaMfVeIX68FhwV5CX_NT4Go1KiFOsqTBQmFgwSIpixngJ2Yvd-Q>
    <xmx:_qNwaAWvRqSa4EGy36-XT2ZxBnr1FJDRZBtWxWMPy17gkSSWTXSfNgi1>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id ADDDD700068; Fri, 11 Jul 2025 01:41:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T17e904bff5b9beaf
Date: Fri, 11 Jul 2025 07:40:55 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>,
 "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Sebastian Reichel" <sre@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Sudeep Holla" <sudeep.holla@arm.com>,
 "Souvik Chakravarty" <Souvik.Chakravarty@arm.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Andy Yan" <andy.yan@rock-chips.com>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 "Olof Johansson" <olof@lixom.net>, "Konrad Dybcio" <konradybcio@kernel.org>,
 cros-qcom-dts-watchers@chromium.org, "Vinod Koul" <vkoul@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Elliot Berman" <elliotb317@gmail.com>
Cc: "Stephen Boyd" <swboyd@chromium.org>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 "Alim Akhtar" <alim.akhtar@samsung.com>,
 linux-samsung-soc@vger.kernel.org, "Wei Xu" <xuwei5@hisilicon.com>,
 linux-rockchip@lists.infradead.org,
 "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Sen Chu" <sen.chu@mediatek.com>, "Sean Wang" <sean.wang@mediatek.com>,
 "Macpaul Lin" <macpaul.lin@mediatek.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Ray Jui" <rjui@broadcom.com>, "Scott Branden" <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Elliot Berman" <quic_eberman@quicinc.com>,
 "Srinivas Kandagatla" <srini@kernel.org>,
 "Elliot Berman" <elliot.berman@oss.qualcomm.com>
Message-Id: <23e0f0d5-c0f6-4fc5-9775-c0ae73681d31@app.fastmail.com>
In-Reply-To: <9bd63c0b-cf14-d00b-c600-9582061e3afc@oss.qualcomm.com>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
 <20250710-arm-psci-system_reset2-vendor-reboots-v10-4-b2d3b882be85@oss.qualcomm.com>
 <2d8e17ad-6bd6-47a9-b5ab-0a91689684ee@app.fastmail.com>
 <9bd63c0b-cf14-d00b-c600-9582061e3afc@oss.qualcomm.com>
Subject: Re: [PATCH v10 04/10] dt-bindings: arm: Document reboot mode magic
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_224121_050796_3620039F 
X-CRM114-Status: GOOD (  10.70  )
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

On Thu, Jul 10, 2025, at 18:53, Shivendra Pratap wrote:
> On 7/10/2025 9:00 PM, Arnd Bergmann wrote:
>> On Thu, Jul 10, 2025, at 11:15, Shivendra Pratap wrote:
>> 
>>> +  reset-types:
>>> +    type: object
>>> +    $ref: /schemas/power/reset/reboot-mode.yaml#
>> 
>> The other users of the reboot-mode.yaml binding all call this
>> node 'reboot-mode' instead of 'reset-types', can you change that
>> here for consistency?
> nvmem-reboot-mode and syscon-reboot-mode use reboot-mode in the
> device tree node name.
> qcom-pon does not uses reboot-mode at its device tree node name, it
> uses pon.
> Kept it reset-types as this patch was already reviewed earlier and
> the name makes it closer to vendor-specific reset-type.
> Should we make it reboot-mode? Please suggest.

Yes, I would still change that. At least all the platform-independent
drivers are consistent that way.

      Arnd

