Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4650AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 16:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g3zvNqD36Ly2VZ9tkKT3O7sEgisvEdurJQ6LVf2r8P8=; b=iyBoNcM/2sDzprIAyMqBm/ZtW2
	YzyYV6Dbd4rFDnCJseiBovbqR8HbO0eymoqrgrFJj9Px0fHCgMFQ40jQH6v4Kt3m7H2ZkoJ4Iv08e
	ZOfaPtQ2sO5HLYJHwq16yhbLvsLYMSojoWuDmLb+LVLvsVRKktPiKQCTNBNYJrguKU2xMp5Yf7XT6
	QF/bC3H383UkOlNi2d+rELgfbd5f7A6lO/MOw4nChKnzAGMErg4ZLC6SGYmLlUQnwlbAZIYImpZ5F
	6cp1ocXAm/SVyBYaTMzxSW2kjJD0A0F2d4sOb19q4cL2xqxrexZdnZry2zGu2kJAhwAq47P/Mv/zZ
	hPLmdIMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWHU8-0000000G8xP-0VqV;
	Fri, 10 Jan 2025 16:03:44 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWH5T-0000000FzRw-07Nx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 15:38:16 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AF21660005;
	Fri, 10 Jan 2025 15:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1736523491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g3zvNqD36Ly2VZ9tkKT3O7sEgisvEdurJQ6LVf2r8P8=;
	b=il0RCBZtzS8MM8CP4vxI7ia+4m8a8on3dAjyRA714QxWf1h7Cemz9TvNjcwrsEsXeM+0fo
	2GlfKRiqgDw0g6LFkFFsene205lRx/b1e2AnEsNq8nmkc5vA7INqPqwhgo14eNUtnvnKc2
	wBgsGEKC09Aymfm+L7iAn3Rj8OIMS6X7ImxVv4TMlEIK3DZoFbsGvAf+7ftNkoQ50zmUuJ
	f7Syqi7PfIWaV5uT85CZja6zaC+3yMaGQdMyIPtpmBMJSKdHur+CpJI5L1KkOv95v0/U90
	10O/L9AgIj/PgbDAGZSZQkr6o9KeWd2T0Nd14/0S/BMnDJHEn1AIZSuN+MTneQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Maxime Ripard <mripard@redhat.com>,  Abel Vesa <abelvesa@kernel.org>,
  Peng Fan <peng.fan@nxp.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Shawn Guo <shawnguo@kernel.org>,  Sascha Hauer
 <s.hauer@pengutronix.de>,  Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,  Ying Liu
 <victor.liu@nxp.com>,  Marek Vasut <marex@denx.de>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org,  dri-devel@lists.freedesktop.org,  Abel
 Vesa <abel.vesa@linaro.org>,  Herve Codina <herve.codina@bootlin.com>,
  Luca Ceresoli <luca.ceresoli@bootlin.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Ian Ray <ian.ray@ge.com>
Subject: Re: [PATCH 4/5] clk: Add flag to prevent frequency changes when
 walking subtrees
In-Reply-To: <c80a9fcd3fbe99c77c2cef1c241e8610.sboyd@kernel.org> (Stephen
	Boyd's message of "Mon, 30 Dec 2024 17:22:56 -0800")
References: <20241121-ge-ian-debug-imx8-clk-tree-v1-0-0f1b722588fe@bootlin.com>
	<20241121-ge-ian-debug-imx8-clk-tree-v1-4-0f1b722588fe@bootlin.com>
	<20241217-brown-wapiti-of-promotion-e3bec6@houat>
	<87bjx2tf3y.fsf@bootlin.com>
	<c80a9fcd3fbe99c77c2cef1c241e8610.sboyd@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 10 Jan 2025 16:38:09 +0100
Message-ID: <87msfy8yse.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_073815_216214_7731A750 
X-CRM114-Status: GOOD (  17.57  )
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

Hi Stephen,

>> The idea is: if the flag is set, instead of accepting the new upstream
>> rate and recalculate the downstream rate based on a previously set
>> divider value, we change our divider value to match the same frequency
>> as before. But if we cannot, then we just keep the old way.
>>=20
>
> The exclusive rate code could support this if it doesn't already do so.
> If you call clk_set_rate_exclusive(child, <constant rate>) followed by
> clk_set_rate(parent, <new rate>) the core code should try to keep the
> child at the constant rate, or fail the clk_set_rate() call on the
> parent. It should be possible to confirm this with some KUnit tests for
> clk_set_rate_exclusive(). Similarly, if another child, child_B, of the
> parent changes the parent rate, we should speculate the new rate of the
> child_A that's protected and fail if we can't maintain the rate. We need
> to start generating a list of clks that we operate a rate change on to
> support this though, because right now we rely on the stack to track the
> clks that we change the rate of.
>
> Initially we thought that we could do this with clk notifiers. That may
> work here, but I suspect it will be clunky to get working because clk
> notifiers operate on struct clk.

I see, thanks a lot for the feedback, I'll have a look.

Thanks,
Miqu=C3=A8l

