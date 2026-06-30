Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEADC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 06:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IyZqIa5MSoFJjLuTNcs1EIIWqpAU9hip3sA0H6a8zU0=; b=ZcU7W/tkBDB2xK1+VvOB2vuHH+
	hQsre97JAHlmNnukjZh3lzHDgA0Z7r3eSmvI9phnIHtFDAciqS1XUWGQAN70iTB85wUEwI/rQY27G
	HvykHTymuaa9HKqmlPeINhPrbAwumcacK0gi2DKlKVxefE9OSqubWVc52z0CpozLW7Dv1zRQbbHl9
	HU8HlqWnVWi1jh2PA4fu3r3bxfDL4z4d6ZE3U4wMSvDFaW4FcotyFcTudY4BDc9xdkKxPsstuQFaP
	PpLM3yAIWjicSEa0InOf2tS4QUWW1VzLLBj7bWySK/KnknToAh23NUbEW40EpT7eRjmiCUua+6m4X
	f4h9C24Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSN4-0000000G2bV-2NyI;
	Tue, 30 Jun 2026 06:55:02 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weSN1-0000000G2aR-0ytO;
	Tue, 30 Jun 2026 06:55:01 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 061CE1A0D57;
	Tue, 30 Jun 2026 06:54:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C712560233;
	Tue, 30 Jun 2026 06:54:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 08518106F1C24;
	Tue, 30 Jun 2026 08:54:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782802492; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IyZqIa5MSoFJjLuTNcs1EIIWqpAU9hip3sA0H6a8zU0=;
	b=Z8d/49Eys89RVLsciixPBotekygSHb1peRZ8C1zf/KK6JdTXPV58v3pivGMR9KWAM/SHDd
	V6eyfhgpYfmiSK/ta19YL/n/Lthu3O2PWazx6BfBzSHA/6FinA7MVx9dxz5OG5iqBSkgLk
	5UxQvx3mRqvcxCeuRYu3HIZvBzN5H9cmx1tuGBG/rD5zbKjuZYRBGj8C9wLZEHqCtNA3Ep
	HyVtnjWABpiHBs1iK06Y82Qh3FLa8k8TuMdNCh+BCe1a5sNyozuoRpoVPIxileLwL5zQEa
	rqfZSyv/R3YFfmkKW7mwuSV/dmBBQlika2iqYfeLoZE/Gc9Fphjy+8ni9N2xZA==
Date: Tue, 30 Jun 2026 08:54:39 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, Nick Li
 <nick.li@foursemi.com>, Support Opensource
 <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Srinivas Kandagatla <srini@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu
 <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, Oder Chiou
 <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com,
 Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari
 <marco.crivellari@suse.com>, Kees Cook <kees@kernel.org>, HyeongJun An
 <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Qianfeng Rong
 <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 16/27] ASoC: codecs: peb2466: Use guard() for mutex
 locks
Message-ID: <20260630085439.2483f232@bootlin.com>
In-Reply-To: <20260630063449.503996-17-phucduc.bui@gmail.com>
References: <20260630063449.503996-1-phucduc.bui@gmail.com>
	<20260630063449.503996-17-phucduc.bui@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_235459_436883_7454CEF7 
X-CRM114-Status: GOOD (  10.82  )
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

Hi,

On Tue, 30 Jun 2026 13:34:38 +0700
phucduc.bui@gmail.com wrote:

> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>  sound/soc/codecs/peb2466.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
> index 2d71d204d8fa..5a1ed02abb84 100644
> --- a/sound/soc/codecs/peb2466.c
> +++ b/sound/soc/codecs/peb2466.c

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé


