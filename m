Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5349C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 14:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hkFSXr7AU4WvmRzO82oca+vfaj/I9fJ285U+GlYMs4Y=; b=pNBmn3I8b0Gm0ass1ACHNTNrUe
	PHhLAo2KRdcTFnS2h1G7MaXAvIQXqy9YNtNDxyqhEZqz5DSeAhpwh7bCMl7RLKSbj9h/qBo4gzop9
	vf92sW9iWZWHSZW2K8Yus7hjziQtQJ8bD36iVJqk/PGfyD35X/2k2c1Dtczaioh3IWBcURuf94rns
	6OQyqDTdg7eFK/GsUJBdylqJ+C0H25xJVzjFx3sa6NS1mYuJsyyMDcfCb2quTUUMOYPBxo3MCDFJA
	q99Tiq2qiDVpax7ZlzMYUwT+7uOCjgG/CpbVY6qvwNYcZaLMSqkNNU9crBkocAxiWvEi+9Uaz7Mj/
	h9AHZy7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaF2z-0000000F3d4-2jQJ;
	Fri, 11 Jul 2025 14:48:21 +0000
Received: from flow-b7-smtp.messagingengine.com ([202.12.124.142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEze-0000000F3G1-1wq9;
	Fri, 11 Jul 2025 14:44:56 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id ECDA41300588;
	Fri, 11 Jul 2025 10:44:51 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 11 Jul 2025 10:44:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1752245091;
	 x=1752252291; bh=hkFSXr7AU4WvmRzO82oca+vfaj/I9fJ285U+GlYMs4Y=; b=
	WDGJzIpwx45Q6sqhljeaGH2cOTdluGUt24Ot4wUGxawP4eTO1H9k4pflkdGWEvB3
	VWNVb6H3IA5D6yP6J6o65PYmbVtj0XG7bDroUx5Mrfo8u5atRVyv5+krwpkb0XI0
	W8VMgEB2O1WYBsRFlOhqPv9wSsp3SlUP9hzhulqdKbUQxKHSZ6XPNcQffiekdA2E
	ewOAoROdJ68hKcSmbBg147lb7m1RY446qKkssUPRLSbgOfdNZg8CgasIxYV/tLs3
	81S8lriNz7Ybj+/QTXe7Ib4sdjo3Ox77REKYHRXCyi8fqkqTq9Fp9tBEGv7Vi2rA
	u0ozRr7nQSZ982SS69XSQw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1752245091; x=
	1752252291; bh=hkFSXr7AU4WvmRzO82oca+vfaj/I9fJ285U+GlYMs4Y=; b=K
	f5ZIUcClhfndy6bg0ErwfbauVr1PYBBIIEkkX0qMxOE6m9/I9BqyEg7lDZQIbaJD
	24DJw98ecPKnEZZZ+4J04iSq1mbYn75GAA8dntf2p6cQMTsh1wNi+vycdNRRFcJm
	GxECjfikZJFsfksv3qHQDNLyiVk4o4GWqc3BRk+W8t65kPasbxP358C5naNbYe68
	GmAiAuYtwlGIKqiVPtsiV/JhgByRsgLtIlrpIvDftAfQSYGX2Jh5f9OhpoFx0Gwd
	Kubx5EeitgcW7c54xY4XVUAzFvUyKCFZVgZim8Gh7u7ipCeB+LSVdZk+mNcdGBTe
	nufnpqtsC6TbjwU3pn2XQ==
X-ME-Sender: <xms:YCNxaFZClDNB8V8d2nAY_Ew4n9dxS66oEtyoWWiM3qBWaC9jhuGo0A>
    <xme:YCNxaMae9yxxOrDU5MguHRWe4ID5My4nit7k0UfizUfavF3zgEwVdu61IxG90rZTG
    mjD0D4KKsWAaNWMm0M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegfeeitdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegfedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepshhouhhvihhkrdgthhgrkhhrrghvrghrthihsegrrhhmrdgtohhmpd
    hrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtphht
    thhopehmrghrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehsuhguvg
    gvphdrhhholhhlrgesrghrmhdrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgs
    vghllhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsggtmhdqkhgvrhhnvg
    hlqdhfvggvuggsrggtkhdqlhhishhtsegsrhhorggutghomhdrtghomhdprhgtphhtthho
    pehflhhorhhirghnrdhfrghinhgvlhhlihessghrohgruggtohhmrdgtohhmpdhrtghpth
    htoheprhhjuhhisegsrhhorggutghomhdrtghomhdprhgtphhtthhopehssghrrghnuggv
    nhessghrohgruggtohhmrdgtohhm
X-ME-Proxy: <xmx:YSNxaF0GQ2fa_1SuFfOdOhuhu0Zy36UfpH2r-1ugIAx3Raw8Lckepw>
    <xmx:YSNxaHx6LIEqH4Y9FZ15zgykV3RRQn0SymX0zo76bvrZzyGy6X62gw>
    <xmx:YSNxaN6C-9gfSyFHrY25SMmGx_DUe4WBzIiGs4pI1tGLmBcVJAj_Tw>
    <xmx:YSNxaA-8DMjc745DJxU5J0QF345BoWMq-R8duUpQzgRO49VjxMVCaQ>
    <xmx:YyNxaHIvxWMwaZjAcDljwq14_YEVEBsGlu7kFX79ffc30VsP2_yKMSEg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DC056700065; Fri, 11 Jul 2025 10:44:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T7b8765a73c29189d
Date: Fri, 11 Jul 2025 16:44:28 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>,
 "Rob Herring" <robh@kernel.org>
Cc: "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Sebastian Reichel" <sre@kernel.org>,
 "Sudeep Holla" <sudeep.holla@arm.com>,
 "Souvik Chakravarty" <Souvik.Chakravarty@arm.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Andy Yan" <andy.yan@rock-chips.com>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 "Olof Johansson" <olof@lixom.net>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 cros-qcom-dts-watchers@chromium.org, "Vinod Koul" <vkoul@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Elliot Berman" <elliotb317@gmail.com>,
 "Stephen Boyd" <swboyd@chromium.org>, linux-pm@vger.kernel.org,
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
 "Srinivas Kandagatla" <srini@kernel.org>
Message-Id: <454c8361-151e-42b3-adfc-d82d2af62299@app.fastmail.com>
In-Reply-To: <cdadd6cf-18c9-15c7-c58a-b5d56b53452a@oss.qualcomm.com>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
 <20250710-arm-psci-system_reset2-vendor-reboots-v10-2-b2d3b882be85@oss.qualcomm.com>
 <20250710224740.GA15385-robh@kernel.org>
 <cdadd6cf-18c9-15c7-c58a-b5d56b53452a@oss.qualcomm.com>
Subject: Re: [PATCH v10 02/10] dt-bindings: power: reset: Document reboot-mode cookie
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_074454_829533_86087B8D 
X-CRM114-Status: GOOD (  14.96  )
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

On Fri, Jul 11, 2025, at 14:32, Shivendra Pratap wrote:
> On 7/11/2025 4:17 AM, Rob Herring wrote:
>> On Thu, Jul 10, 2025 at 02:45:44PM +0530, Shivendra Pratap wrote:
>>>    All mode properties are vendor specific, it is a indication to tell
>>>    the bootloader what to do when the system reboots, and should be named
>>> -  as mode-xxx = <magic> (xxx is mode name, magic should be a non-zero value).
>>> +  as mode-xxx = <magic cookie> (xxx is mode name, magic should be a
>>> +  non-zero value, cookie is optional).
>> 
>> I don't understand the distinction between magic and cookie... Isn't all 
>> just magic values and some platform needs more than 32-bits of it?
> Need two different arguments. Will try to clarify a bit below.
> PSCI defines SYSTEM_RESET2 vendor-specific resets which takes two
> parameters - reset_type and cookie. Both parameters are independent and
> used by firmware to define different types of resets or shutdown.
> As per spec:
> reset_type: Values in the range 0x80000000-0xFFFFFFFF of the reset_type 
> parameter
> can be used to request vendor-specific resets or shutdowns.
> cookie: the cookie parameter can be used to pass additional data to the 
> implementation.

I don't see any distinction here either. As Rob says, you have to
get both 32-bit numbers from DT in order to get the desired reboot-mode,
and you have to pass them both to the firmware when rebooting.

The distinction between cookie and magic value may be relevant in the
context of the psci specification, but for the Linux driver, this is
really just a 64-bit magic number.

     Arnd

