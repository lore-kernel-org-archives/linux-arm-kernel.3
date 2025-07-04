Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52602C83F0B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XWPuLH+r945MMXMKIDI54FYqxlY/reitRUTj8Ejgnuo=; b=LFthgj6CcfD8veYAyswSiOJKj+
	zAL5UYPjF5ImWn1AQnEC5pKHbSbS0UlO1CMvCZKRplGhylAUB6cfRPuXRd7rr9LX5Kboi3v+T+rwO
	8F9OE2mayFZ8egaqEdQKSDx+fsMJqK9oAR8TOLQ+mDV4LpNAUrBZbr7hbcujqXDdFRSv27SbCM29z
	3B8eFWsIU7I3aSyfWKslMSBOMHr0ULoWfkqbPmjHaoV/+gyncMRXAh89qss5vb9GZECx3gxvHxR57
	TsDqNX/lQs/KroiPO70MPXqPvDTC54MGUpy72hXLibh5fhDEb+A2nSnUtLOKpERFB5i7TH4NqXUpi
	bgMjOM/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeUK-0000000ECHv-1Ba7;
	Fri, 04 Jul 2025 11:21:52 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXc0W-0000000DmCs-1vxH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 08:42:57 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-557e20222c3so166009e87.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 01:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751618575; x=1752223375; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XWPuLH+r945MMXMKIDI54FYqxlY/reitRUTj8Ejgnuo=;
        b=OFGLDKUeCUZp5vy4kJ8j6o3Z3drGpOEwmIUpHoPa6mSASOIAs5B1wDA43/5NsEhr2O
         R0Dn6NbRAmLfgTG+fnXtJcTS9k6pCy8EQE7k3kTJ2DBmhIhkmjSCyaY7GK/TGhvXgxrt
         8OrP+CzFRenQxpfWkRmtgzAWcpd6HMER2zZAbQ9UIoutAKh+yJ6PlUO0xfjA4gqpYo+C
         J5TQikJJcRMNagcnczyg6NMswLmXvdp/oxH8rLl0ERxj3k6TlD/b8P9fglb8FFPsIwyL
         Oix7X3nCLbh21pk83UcZca8eU4IBKHcnneqAVaH7+vgDdv/qLpmXTi+jGW7rRz1uahjL
         2KVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751618575; x=1752223375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XWPuLH+r945MMXMKIDI54FYqxlY/reitRUTj8Ejgnuo=;
        b=C7R/j0z/xPq9GvExup1poKrXChDhgByCKc6Gt/8Uh7DOAIzBo/SBsD/RcEqpbbFudy
         VehdjZaMum7W1pIxIzE73TMvDsHWvOHlCh+bOA85i5hO5Udf8VzqPEKPkeThIETBtXa9
         NUruJPB/++itlDG1Byw4FtF82U7h5GfJBQlcMW++qv8MRD+z7bDuImKRjyraBAB8Hjh5
         kMmDcxXzII7W/a9sapog/oDAwuYwXHPjH9flctvbgLWHqHTyHxulFqq/6U6CiPssWcV3
         /EaXtp7Gee30fKPMn+r6kPekGoK1+rye/DxN75EOflm6Ynd2awt3X7rS71vt2dru33Dw
         h/uQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJA5H9IE34L2t3MLNJj9vK3KBhg+gsmu1Ak5rJncTDMyD1Jx5TvUXVEDZfEWKb+KJmjkVPIMvy7f0Ax86F4txi@lists.infradead.org
X-Gm-Message-State: AOJu0YxuYcT4A1No9yF1jNIbpSrHWDkQKNqFfpkyL+/eSwkzU6WzRO7x
	76r9M0Y/rzuGOAKLB6p2bZztNAjMk8nRDmIkRBJwhBaf6XP5bnw666Di6TTLlbHzUHfft8eUNbh
	6fmLRxoJzY+yQvuoPzyoXkqntodPo6e9J9om9BqOkrg==
X-Gm-Gg: ASbGnctpQ5kjlhm9IpQIajRiKzNxc4VNeO9bSfDR3J4eLSi10Iaxd3W7oieGCCQzUw6
	iEGhbk3qjZIaRJvmjLQgthwwOh9ebIoB2AtEixRezJ+/xKeFCeljqdSU7UbCkzbmWMpuSb+cZqn
	Zh+7ZmaeE9l93IrFQPXNeO9bpP5WguJ2mo80+Y5mHY9xw=
X-Google-Smtp-Source: AGHT+IGodMjqDkDesQdG4Hjakhr0TOM9xUbyJgILsRTpZGqTHkPFTfySztIXo8nEvUZyWt2JWT7aRKctMeet0pwrsBw=
X-Received: by 2002:a05:6512:3e1b:b0:553:35e6:393b with SMTP id
 2adb3069b0e04-556e684bda8mr524787e87.45.1751618574621; Fri, 04 Jul 2025
 01:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com> <20250704075420.3219092-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20250704075420.3219092-1-sakari.ailus@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 4 Jul 2025 10:42:43 +0200
X-Gm-Features: Ac12FXznXJQ0ImElx8AS_65o16qEpHJnw8V0OHvMEe3Y5zyTtUuH2rGO4fQjXsY
Message-ID: <CACRpkdb8Z3oLwmB26q1xdHMwa2xTm1sz5g8_a0BHMK8oHsiF1g@mail.gmail.com>
Subject: Re: [PATCH 28/80] iio: adc: Remove redundant pm_runtime_mark_last_busy()
 calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Cai Huoqing <cai.huoqing@linux.dev>, Haibo Chen <haibo.chen@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Marek Vasut <marek.vasut@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Francesco Dolcini <francesco@dolcini.it>, 
	=?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Mike Looijmans <mike.looijmans@topic.nl>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Julien Stephan <jstephan@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_014256_502929_D07B2179 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jul 4, 2025 at 9:54=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

