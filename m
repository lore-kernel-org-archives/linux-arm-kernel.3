Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD9CD58D60
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 15:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nbi7jGHMHqCOiVJdgNk+yM5Aex5D7yPTPOFZz9QtO4Y=; b=JPZ4dlMCmIySTZEWkwx3BBgw6s
	Jqn4Pj8ru7mCdxRPI0MEI3JvP6UIwkBTeGQs4XiNUxyZeiuDVquHOa5+GccnaTCJnPKTDL1Bnpm/G
	u9Xydoc5kI0Y+WVpRAvvSa3fKk38MhInUGcAs0GL5RRrScFBJ5dX+a7x0kB1jwQpemIUA0EG8+oTu
	n7h4yJ+dmIRiHvO5MO4tTD25L7v89YWnODueAYHhg3phNEk2JsJHPZ+QHbnOg1hooXOCFbGlIu8v/
	k8RZM16Sv4YfMyGuHjkHssXrDkURtG9ya4o6PNe1Nle5uC9QciL/iwskcrNsZxJ72o2jWuAwJtB1u
	ZC1UVw+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFbRb-00000008Zbo-103g;
	Mon, 25 Nov 2024 15:56:11 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFbQe-00000008ZRc-08co
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 15:55:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id BF2F541A48;
	Mon, 25 Nov 2024 15:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1732550109; bh=Nbi7jGHMHqCOiVJdgNk+yM5Aex5D7yPTPOFZz9QtO4Y=;
	h=Date:From:To:CC:Subject:In-Reply-To:References;
	b=UBjsckh9mezNpgAv1OBbxdguxzVBpMiV456rgWaUT13XQgWO+iA7HihREOcrTh7Cf
	 9MMScOaAT2AXHeLQdaF+BpipbD6nkUaH7cwmcjECCORCcJBQ+d/g/9+1irOEhFY5Fv
	 gpvDptEQ4r4BhTuWaHZRyt/V9sa/cSnUhu16TzQsLPcpTa3LwOkxb0O5jy6TdZ56q/
	 vukcqHwux/0UYuDXEuRQr/ckvDjB1yI0mwVygvHum2kOYQJvsQdaNhMi5E+VPUej/t
	 6NBI0BP2Nb/Ipwd//qkRFHAv0YZic4IykczXrOODGeKKJHxJFlfd4Gj9FoqNddkXU9
	 Tap+AiIiLaxKg==
Date: Mon, 25 Nov 2024 16:55:04 +0100
From: Hector Martin <marcan@marcan.st>
To: Maxime Ripard <mripard@kernel.org>
CC: Sasha Finkelstein <fnkl.kernel@gmail.com>, neil.armstrong@linaro.org,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Janne Grunau <j@jannau.net>
Subject: Re: [PATCH 2/5] gpu: drm: adp: Add Apple Display Pipe driver
User-Agent: K-9 Mail for Android
In-Reply-To: <20241125-gabby-furry-rooster-cf28a9@houat>
References: <20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com> <20241124-adpdrm-v1-2-3191d8e6e49a@gmail.com> <10d0aa88-de2e-4856-a137-301519e58b2d@linaro.org> <CAMT+MTRWZWj=3AP7wyooXr49-W4vcm0ZbAoqPyEuNkQBMOaJfw@mail.gmail.com> <cc71021e-b53d-4eda-bad8-abb4df13575f@marcan.st> <20241125-gabby-furry-rooster-cf28a9@houat>
Message-ID: <891D03B0-1A2C-4C38-85F2-F8CBBAC1A5CC@marcan.st>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_075512_218742_6160DC7B 
X-CRM114-Status: GOOD (  22.17  )
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

On November 25, 2024 4:28:00 PM GMT+01:00, Maxime Ripard <mripard@kernel=2E=
org> wrote:
>On Mon, Nov 25, 2024 at 11:24:25PM +0900, Hector Martin wrote:
>>=20
>>=20
>> On 2024/11/25 20:24, Sasha Finkelstein wrote:
>> > On Mon, 25 Nov 2024 at 09:50, Neil Armstrong <neil=2Earmstrong@linaro=
=2Eorg> wrote:
>> >>
>> >> So this controller only supports a single mode ???????
>> >>
>> > Most likely=2E On all devices it is connected to a single built-in di=
splay=2E
>>=20
>> More specifically, the controller obviously supports multiple modes but
>> it is pre-initialized by the bootloader for the single hardwired
>> display's only mode=2E So as far as the driver is concerned, there is a
>> single possible mode, and there's no point in trying to be more generic
>> if there is no hardware that would use that=2E
>
>It's not only about being generic, it's also about fitting nicely in the
>usual abstractions=2E You could also always register a single panel, with
>a single timing set, and the driver would never see anything else=2E And
>still fall within the usual pattern=2E
>
>> In general, it is not possible/practical to be generic for reverse
>> engineered hardware with no specs documenting how to drive it
>> generically=2E You just can't know how to implement the options that ar=
e
>> never used in practice=2E I spent a lot of time on exceptions to this
>> rule for the GPIO and SPI controllers, and that's not going to happen
>> for more complex hardware like MIPI DSI=2E
>
>How is GPIO or SPI even remotely related to that discussion? We are
>different maintainers, with different concerns, and different things to
>care about=2E
>
>Also, "My way or the highway" is never a great discussion opener=2E

This was not an attempt to push back on the review feedback at all=2E I wa=
s just trying to add context about *why* the controller will never be used =
with nor support more than a single mode, not argue about how that should b=
e implemented=2E Sorry if it came across as otherwise=2E

GPIO and SPI are relevant not because of anything related to the kernel, b=
ut because I was able to reverse engineer the generic features of those con=
trollers quite comprehensively by literally probing a GPIO routed to an ext=
ernal USB-C port with a custom test bench and an oscilloscope (for GPIO) an=
d by using the GPIO registers along with a bespoke bare-metal test platform=
 as a "software" logic analyzer to inspect the signals generated as I twidd=
led register bits (for SPI)=2E I'd love to have all hardware comprehensivel=
y documented like that (I did GPIO and SPI because I wanted to, not because=
 any maintainer asked for it), but as you might imagine, this kind of deep =
hardware RE doesn't scale and isn't practical for anything more complex, an=
d I was just trying to convey that fact=2E

(Sending from mobile, apologies for the likely dodgy line wrap)


-- Hector

