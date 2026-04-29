Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D69EFF8873
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 03:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PUJpmlvqpve17BcNmp2udGYzVJHJtDkfq1rS2TN41mA=; b=ppw2fkowy7mhISRlmG9Fa8i0DL
	DFTCf0nZWKE5WVOQeNrUnG84HrePNyc87Mm8NaoE9dGLrDvBeylLcHmZoJ5HHfyvl+KhfTzalJZ20
	QrfaDdhAldLlTpKQxBZGdrXdzaFZTvOCONeoyUuf0wITJCKPK9QPpD2/OX3mjR0NtSBm7I60mx5vg
	tWSR+aQrwGVHsakrlEJ5+pmdY/mICFD7AWCtMfkxTCJCAdW9xP4t9W2+MjH+PEQTWijN9Ne3euf83
	cAXu97ZEWa94/e/fUoHy3ytKOduco5AfPRTpTTLgjAMPICSKfAvj/rT2Nue1wmvrJNo8zGYzrjLP9
	2dp2LCOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvtN-00000002s2e-0Z5q;
	Wed, 29 Apr 2026 03:47:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvtI-00000002rx8-2Gqq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Apr 2026 03:47:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 32B3840E55;
	Wed, 29 Apr 2026 03:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 036F4C2BCB4;
	Wed, 29 Apr 2026 03:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434432;
	bh=kmlYhPPO7si0Y03tGLFg/g4545mtNj4YJC/GOASuHs8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Z7i+osfdORJpLv7U6encAiWyXyx6atxjZPWZVVbqE2/pL83dB8+zxlHAfglmmEiFw
	 zGSJX/ihv8yAC+/otyArnUyZRppIPrjwD3iBv7NuzZIxAvd1lJMpm8z5nOAgO8ZQuN
	 eCtxgFCbgjutDuN+OeIsZ6Z/zkBVWZS6+K9rnXJqDwtMyJcmawuuMJxxVisZKmA+s2
	 lUHDG90TeAgWyK7aPoAINvcsDaTLjAsJb9qGEdadMzkeP5eDAj3JVkTff6zoAbrAmC
	 bJ1Bi6rOQtTqptfN6MrH3a2rrWATqrg1Hmwm3aB3LDBJ8rPd3tJ7p3vWsT/1H7Au+P
	 JJ1j3PTYt7Sew==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260309-clk-det-rate-fw-managed-v2-1-c48ef5a3100a@redhat.com>
References: <20260309-clk-det-rate-fw-managed-v2-0-c48ef5a3100a@redhat.com> <20260309-clk-det-rate-fw-managed-v2-1-c48ef5a3100a@redhat.com>
Subject: Re: [PATCH v2 01/12] clk: add new flag CLK_ROUNDING_NOOP
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>, Sudeep Holla <sudeep.holla@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Andrea della Porta <andrea.porta@suse.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Bjorn Andersson <andersson@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Frank Li <Frank.Li@nxp.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, arm-scmi@vger.kernel.org, Chunyan Zhang <zhang.lyra@gmail.com>, Cristian Marussi <cristian.marussi@arm.com>, Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, Pengutronix Ker
 nel Team <kernel@pengutronix.de>
To: Brian Masney <bmasney@redhat.com>, Michael Turquette <mturquette@baylibre.com>
Date: Tue, 28 Apr 2026 19:15:36 -0700
Message-ID: <177742893645.5403.3938693995862346406@localhost.localdomain>
User-Agent: alot/0.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_204713_105434_84FCBF51 
X-CRM114-Status: GOOD (  17.99  )
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

Quoting Brian Masney (2026-03-09 07:38:40)
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index fd418dc988b1c60c49e3ac9c0c44aa132dd5da28..1187e5b1dbc123d2d2c1f4369=
0d7dcf75a7c4ac3 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1673,7 +1690,7 @@ EXPORT_SYMBOL_GPL(clk_hw_forward_rate_request);
> =20
>  static bool clk_core_can_round(struct clk_core * const core)
>  {
> -       return core->ops->determine_rate;
> +       return core->ops->determine_rate || clk_is_rounding_noop(core);
>  }
> =20
>  static int clk_core_round_rate_nolock(struct clk_core *core,
> @@ -3528,6 +3545,7 @@ static const struct {
>         ENTRY(CLK_IS_CRITICAL),
>         ENTRY(CLK_OPS_PARENT_ENABLE),
>         ENTRY(CLK_DUTY_CYCLE_PARENT),
> +       ENTRY(CLK_ROUNDING_NOOP),
>  #undef ENTRY
>  };
> =20
> @@ -3906,13 +3924,19 @@ static int __clk_core_init(struct clk_core *core)
> =20
>         /* check that clk_ops are sane.  See Documentation/driver-api/clk=
.rst */
>         if (core->ops->set_rate && !core->ops->determine_rate &&
> -             core->ops->recalc_rate) {
> +             core->ops->recalc_rate && !clk_is_rounding_noop(core)) {
>                 pr_err("%s: %s must implement .determine_rate in addition=
 to .recalc_rate\n",
>                        __func__, core->name);
>                 ret =3D -EINVAL;
>                 goto out;
>         }
> =20
> +       if (clk_is_rounding_noop(core) && core->ops->determine_rate) {
> +               pr_err("%s: %s cannot implement both .determine_rate and =
CLK_ROUNDING_NOOP\n",
> +                      __func__, core->name);
> +               goto out;
> +       }
> +

This hunk has me irked. I'd rather we export some function like
clk_determine_rate_noop() that just returns 0 instead of adding another
flag. The chance that someone can get it wrong goes down and you can
naturally grep for any clks that are using determine_rate() without
having to also include this flag in the grep. It makes it easier to
reason about as well because we can have code that just checks for
determine_rate presence instead of both (i.e. clk_core_can_round() isn't
changed). Plus a clk_ops structure is more self-contained because it
doesn't rely on the clk flags to go with it.

