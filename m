Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D16C9E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 18:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vC2iV4OwakMwa517Uq3365YZVqec+LRelz4Fh+drw5s=; b=p9j4H1jpr0+VeDL46JqRC8gvRh
	n6Hzk4cdg76/aOFcfk1Fyaula7dKJk8hCYKhj5gNnOWmMIRI+d6rhB/zVDBiTsgjAsVFEZuQnxppv
	y5EIAiEUZrKHk3DR82/tXxjuHTdWHcgmSSJ184OtAQunFvkzbFG2GWfqxBvM/LKfBSLK7e00Ul2vB
	lVqMWL9RpCI01LTBW7vowMYNloljsuekjBC5er5aAftQYRvGkS7Yew85KFD/6ehkvAsrgin4ApuTL
	Z1dTEwp70ziqi1HD0nVIhyJidsvEEScha5NFDTc3TPZeELSQkNMfxEdAPx6FVwkLPHsi24RQcWx3J
	AtEDngyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPnPt-0000000AZWu-2pGH;
	Mon, 23 Dec 2024 18:44:33 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPnOh-0000000AZQp-3aue
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 18:43:21 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFFA460005;
	Mon, 23 Dec 2024 18:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734979396;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vC2iV4OwakMwa517Uq3365YZVqec+LRelz4Fh+drw5s=;
	b=o8YbE1A8M5Wk+WJj303PoOyMqOb3lY0FmnkCryQ1Duhok7CFcWDa8XGO47pLGkA2rnRHPO
	IrxXHjgdYedODe7iN5BhJMjYRT8kl2AuRydSgOGRRmh+xF0CS00L40MO5XLXOBoeZi/Glv
	rcsrsUPuruiYvn6ocB5PoVR6238/qyidXY6ZnhHdA97QT8fwNYPJgV64EFzEM3IJqAyX8X
	S2juydpWqTBfonB6B3QFlqOyrpfxAkHh3xl02I+eXnnGB67G77CmotkgjZ3u7t3gaFU546
	rDvRC2M2aAPXqe1y7YoG8jcv7RIau0BWsTEVPYGkkL3YB5AkN32byaqG6Q04Bg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maxime Ripard <mripard@redhat.com>
Cc: Abel Vesa <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Shawn Guo <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Ying Liu <victor.liu@nxp.com>,  Marek Vasut
 <marex@denx.de>,  Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
  linux-clk@vger.kernel.org,  imx@lists.linux.dev,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  dri-devel@lists.freedesktop.org,  Abel Vesa <abel.vesa@linaro.org>,
  Herve Codina <herve.codina@bootlin.com>,  Luca Ceresoli
 <luca.ceresoli@bootlin.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Ian Ray <ian.ray@ge.com>
Subject: Re: [PATCH 4/5] clk: Add flag to prevent frequency changes when
 walking subtrees
In-Reply-To: <20241217-brown-wapiti-of-promotion-e3bec6@houat> (Maxime
	Ripard's message of "Tue, 17 Dec 2024 13:47:53 +0100")
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
	<20241121-ge-ian-debug-imx8-clk-tree-v1-4-0f1b722588fe@bootlin.com>
	<20241217-brown-wapiti-of-promotion-e3bec6@houat>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 23 Dec 2024 19:43:13 +0100
Message-ID: <87bjx2tf3y.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_104320_192546_BB2DB85F 
X-CRM114-Status: GOOD (  18.80  )
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

Hi Maxime,

On 17/12/2024 at 13:47:53 +01, Maxime Ripard <mripard@redhat.com> wrote:

> On Thu, Nov 21, 2024 at 06:41:14PM +0100, Miquel Raynal wrote:
>> There are mainly two ways to change a clock frequency.
>
> There's much more than that :)

"mainly"

Or maybe I should have added "on purpose".

>
> Off the top of my head, setting/clearing a min/max rate and changing the
> parent might also result in a rate change.
>
> And then, the firmware might get involved too.
>
>> The active way requires calling ->set_rate() in order to ask "on
>> purpose" for a frequency change. Otherwise, a clock can passively see
>> its frequency being updated depending on upstream clock frequency
>> changes. In most cases it is fine to just accept the new upstream
>> frequency - which by definition will have an impact on downstream
>> frequencies if we do not recalculate internal divisors. But there are
>> cases where, upon an upstream frequency change, we would like to
>> maintain a specific rate.
>
> Why is clk_set_rate_exclusive not enough?

I am trying to protect these rate changes from subtree walks, I don't
see where setting an exclusive rate would have an effect? But I might be
overlooking something, definitely.

...

>> @@ -2272,7 +2271,13 @@ static void clk_calc_subtree(struct clk_core *cor=
e)
>>  {
>>  	struct clk_core *child;
>>=20=20
>> -	core->new_rate =3D clk_recalc(core, core->parent->new_rate);
>> +	if (core->flags & CLK_NO_RATE_CHANGE_DURING_PROPAGATION) {
>> +		core->new_rate =3D clk_determine(core, core->rate);
>> +		if (!core->new_rate)
>> +			core->new_rate =3D clk_recalc(core, core->parent->new_rate);
>> +	} else {
>> +		core->new_rate =3D clk_recalc(core, core->parent->new_rate);
>> +	}
>
> Sorry, it's not clear to me how it works. How will the parent clocks
> will get notified to adjust their dividers in that scenario? Also, what
> if they can't?

The idea is: if the flag is set, instead of accepting the new upstream
rate and recalculate the downstream rate based on a previously set
divider value, we change our divider value to match the same frequency
as before. But if we cannot, then we just keep the old way.

Cheers,
Miqu=C3=A8l


