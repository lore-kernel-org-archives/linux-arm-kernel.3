Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D13E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 16:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSpc6VQBDb8JoEfMgCNEhRDbGhq1uPR/LeYIvEpv6E8=; b=kpHtdzails49d5ZaZSz72esbVu
	O0Ld23yS62VeryELZySOsQjkf2kJ6CUogqrqjCa5UGThUfSxdYHV9CynyBzGo181QnbAg1tBFQrbB
	Fyf8+R40+K9gq4xqidC3x8MTKVKSVQKYRQ2Uq+Z7p1mzA3Gvq/lb2fyyORHfZW40jEib2uBoc+Y/7
	Kqh3ZHsUxZdMYlC2WC78FJNmN3Lcba44XuI7awGrRsKw9lSuoU4kAegICFwzxtgAnu6VFFAikJtUV
	XlzKAwxGpuJvQ6C0K3Kz4cjtXLNOxn0FTvTy1qG1XDWfrsaj46HFEGKc6I6/X/2UK8N7BmL8GU8im
	8ja64dzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHWV-0000000G9KA-1cRD;
	Fri, 10 Jan 2025 16:06:11 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWH7e-0000000G0zv-1vg6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 15:40:31 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68B7E40002;
	Fri, 10 Jan 2025 15:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736523627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FSpc6VQBDb8JoEfMgCNEhRDbGhq1uPR/LeYIvEpv6E8=;
	b=XsaKQJa1dm9gvKtfk04b/ubKT3ff/t4Kpn/YpVN3Nizo87LlyZp8WUD16Pv5orCRashuaC
	XmSQuGhqCtqxKw+8YvamI8N09XCpRSzudCrhxJN6UsR32W3VgjEV2+1wWo0gwzrM0o1iOa
	n2NdoPVAK8qSwcvzaJUU6fUwln6WHzd9w4b+ia51sFAz/Bsf8af9X152YfaOIr7myAw0kG
	UI8pmzCw8yaMZ8vI32bJljU3RjNqG8vTfgJluENX2ReH5J4Qz70QQG+mjXA75Lk/XWWGdZ
	8SA1PRjdshzzFuKbljgsUKGN20N0HorIpcCflnLDWmdxC2IL697yEjkMfnJMVA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Maxime Ripard <mripard@redhat.com>
Cc: Stephen Boyd <sboyd@kernel.org>,  Abel Vesa <abelvesa@kernel.org>,  Peng
 Fan <peng.fan@nxp.com>,  Michael Turquette <mturquette@baylibre.com>,
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
In-Reply-To: <20250106-fabulous-tapir-of-acceptance-c4e3e7@houat> (Maxime
	Ripard's message of "Mon, 6 Jan 2025 15:36:33 +0100")
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
	<20241121-ge-ian-debug-imx8-clk-tree-v1-4-0f1b722588fe@bootlin.com>
	<20241217-brown-wapiti-of-promotion-e3bec6@houat>
	<87bjx2tf3y.fsf@bootlin.com>
	<c80a9fcd3fbe99c77c2cef1c241e8610.sboyd@kernel.org>
	<20250106-fabulous-tapir-of-acceptance-c4e3e7@houat>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 10 Jan 2025 16:40:26 +0100
Message-ID: <878qri8yol.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_074030_768993_3B2B35A3 
X-CRM114-Status: GOOD (  21.71  )
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

>> The exclusive rate code could support this if it doesn't already do so.
>> If you call clk_set_rate_exclusive(child, <constant rate>) followed by
>> clk_set_rate(parent, <new rate>) the core code should try to keep the
>> child at the constant rate, or fail the clk_set_rate() call on the
>> parent. It should be possible to confirm this with some KUnit tests for
>> clk_set_rate_exclusive(). Similarly, if another child, child_B, of the
>> parent changes the parent rate, we should speculate the new rate of the
>> child_A that's protected and fail if we can't maintain the rate. We need
>> to start generating a list of clks that we operate a rate change on to
>> support this though, because right now we rely on the stack to track the
>> clks that we change the rate of.
>>=20
>> Initially we thought that we could do this with clk notifiers. That may
>> work here, but I suspect it will be clunky to get working because clk
>> notifiers operate on struct clk.
>
> I think notifiers are great for customers, but not really adequate for
> the clock drivers tree. Indeed, you can only react to a (sub)tree
> configuration using notifiers, but you can't affect it to try something
> new that would be a better fit.
>
> Like, if we have a PLL A, with two child clocks that are dividers. B is
> initially (exclusively) set to freq X, and then you want to set C to 2X.
>
> The best thing to do is to set A to 2X, and double B's divider. It's
> simple enough, but we have no way to try to negociate that at the
> moment.

Indeed. Do you have something in mind to address this situation (eg. a
new clk provider or core API)?

Thanks,
Miqu=C3=A8l

