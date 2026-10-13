Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC88CC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 16:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l3/WP5D92dJn63pBVARZJXVp+tuxI1GnuqurUpTZ5jA=; b=FN/zb80NyZXVSkl/A0r4WP+c0P
	/ODSc5/lY/gTm1YnMwncN2bXA3DlLgbYaoy7bNMCZSFJlcfoJ04RkrfzioVLnFo+DQCBNfoEuQyZL
	mskwoFN/PBznrEoyaqn7SvRq0oM/zNndeE7EQe2DHe/iV4FNVHcBG0tknTHR2RbyemsP3+A56IVea
	QECLHfG3rwDZvhEsQWhzzsT85pIytvl+Q5+lK4mPW7MmJfZHraClYmiApTGOG/c3/hJ6ERIjlxxsG
	MWuz5baRNRvMKZav+7tJ2gt8hPC4uvdYoDMLXxrPOkvSrIwtcpu9bV5Ya2PnZ+7AVubUHQwrf3fmv
	+avpqwHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfjL-0000000Dawu-1KKR;
	Tue, 13 Oct 2026 16:51:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGfjJ-0000000Davk-0xlx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 16:51:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0428343DFE
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 16:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD3C01F0089D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 16:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791910316;
	bh=l3/WP5D92dJn63pBVARZJXVp+tuxI1GnuqurUpTZ5jA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HvWia53ZYyhgcZ+OXH68fzSeCTvCqsiRulCTPfoxOQFfsZUMZ7HrmAVwxHq0TSIhj
	 0p0utXPvGUyGvZfDQB4Zcxctz5BdVh9RNiCElplGq3DFOQ58ymsICvXX2ZTjDpPP4B
	 X0wiA+SPk4Lsr7Lf84b/BHLe6yTWho8RUweV+v0/4IPNRf3MO6T4p9lFHjOlHvuMRv
	 KDbjyXUs12NH2QVqjoNNpwHh39PeyGCKmtbRFz3nSwX8yaEs0h5ugUoL2dsycH0fjl
	 yTrrtTaV2/funlxY0mmHwruBFnUq4eeaX+TzpQ6hDC5aiF2tziZWKHelXDMRPTCo4h
	 Tmxw75p8hc4Og==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5ba3ac592faso1664207e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 09:51:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzI2XZHt56fOamnujo3k6RgGz31+/2Rb3a3sv4345LparpwvHTedXd58v4zUY/GM3TcKWx+O+dVFvK+TJaa7GtK@lists.infradead.org
X-Gm-Message-State: AFq9FYKU2aGywoPvFP8Yzy4kdbI5OLZe0aWuuW5+68Rc7c5mlVdnoBx+
	y4l1+DXh44Wy5ZAoPCrTVuLBBBz0GWNbQ0hlduKXKAEUXAUQEbzwdH6X+qO1qI5Eyp1BjXr4m7S
	4s4t7/wKi9bWHn+C0rH8wW13yMnNPovw=
X-Received: by 2002:a05:6512:2245:b0:5ae:b7bc:27a7 with SMTP id
 2adb3069b0e04-5bcde35cab3mr4460647e87.6.1791910315615; Tue, 13 Oct 2026
 09:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20261013-gpio-mxc-cleanup-v7-0-c4d769587d3e@nxp.com> <20261013-gpio-mxc-cleanup-v7-1-c4d769587d3e@nxp.com>
In-Reply-To: <20261013-gpio-mxc-cleanup-v7-1-c4d769587d3e@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 13 Oct 2026 18:51:42 +0200
X-Gmail-Original-Message-ID: <CAD++jLm3vuQr7WeYGMVVaNN5MuzuQvGrZFA4jboYBrTfCUfy8Q@mail.gmail.com>
X-Gm-Features: AclHuK_fxfc0XIQk4rQosnKB8so3c6I-uEvWCQIJ_fa7_pXjDsATNC4VePcqcl4
Message-ID: <CAD++jLm3vuQr7WeYGMVVaNN5MuzuQvGrZFA4jboYBrTfCUfy8Q@mail.gmail.com>
Subject: Re: [PATCH v7 1/4] gpio: mxc: fix race between chained IRQ handler
 install and probe completion
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Oct 13, 2026 at 8:03=E2=80=AFAM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> mxc_update_irq_chained_handler() is called before the IRQ domain, the
> generic IRQ chip, and the port list entry are set up. If an interrupt
> arrives in that window:
>
>  - mx3_gpio_irq_handler() calls generic_handle_domain_irq() with
>    port->domain still NULL.
>  - mx2_gpio_irq_handler() walks mxc_gpio_ports, but the port has not
>    been added to the list yet.
>
> Additionally, if any of the subsequent probe steps
> (gpio_generic_chip_init(), devm_gpiochip_add_data(),
> irq_domain_create_legacy(), or mxc_gpio_init_gc()) fail, the error
> paths never unregister the chained handler, leaving a dangling handler
> that points at freed memory.
>
> Move the handler installation after all its dependencies are ready and
> after list_add_tail(), so the handler is never live while the data
> structures it touches are incomplete, and is never installed if probe
> fails.
>
> Fixes: 5f6d1998adeb ("gpio: mxc: release the parent IRQ in runtime suspen=
d")
> Assisted-by: LLM
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

