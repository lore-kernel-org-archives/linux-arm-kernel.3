Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08251CDE001
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 08:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Z2dXNv3rLrXY82Odx71lPH+DoZfD3dtEOh0UsRZ4zM=; b=X6wPgIshR7+8n4c7x/5YIGEtiY
	EJIf1Y1hvLW9JmxPCZL0MgAOil4hzkYwguoAIkkVtcOWBKV1yF2a57++gVo2YjGxIIqlNB9NZ3rqi
	aqpFBwjtUTcyk17P5GSS9lNYpzGF693NLBYofq1gYD9xeT22gAQ7qX9Urnj55BWYxhkMzAJyeaLJd
	5cOHvkvUO4QCKSC4E9/Cy23F33CfrGOKRsktJlRteO/XTOtij90I3yb3OjZGsBSj2QA4qg38hexs6
	GSTBeuRyjGrC4FTlLzSi8CrnT7aa1lDrLIu8gKbG+0V5vRuohl+CzE8RkAruaO4A6OgXzjXp3z0AC
	FsnsShDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJQC-00000007Rnn-2N5u;
	Wed, 24 Jun 2026 08:57:24 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcJQ8-00000007Rmo-0F9v;
	Wed, 24 Jun 2026 08:57:21 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1782291430; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DpFn91+bjtZWhARFvMO9f4K+LOcTIP2YjffTyQTCGVBAV+cmPymOyQx4vDfMzJ5bayy0oaEa46Mo/gwBfeKEN8XNKX6BpTglrAOPQbxWww1Kzpp42IOPxkL47rzSFlhSABDbZ0MqtSvd0ovVZjdbh1XA6h0jNVn8Wq46CPNPXEU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1782291430; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7Z2dXNv3rLrXY82Odx71lPH+DoZfD3dtEOh0UsRZ4zM=; 
	b=AubUZqFX1geExzk9Xi7xJ2unHheQPgR1qlRKVgML+hnfSdW9Av29jeJZ3I7ekswTg3RdouenHUyqcpsBQro369H5+X36QS4OY719RPP8FM5sU8r5fxCX0wl/pebzKfr4AClthv7WGM4azR/KYzWK93likM/dmWhL8UkSEj/PB8E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1782291430;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=7Z2dXNv3rLrXY82Odx71lPH+DoZfD3dtEOh0UsRZ4zM=;
	b=evKOpiaTtlp9o4Y34yZPFp7VUp4y9ORV2307SCujKdZHOCrKClNcHC43f+1tbZgu
	qd+jDg/7/aPEnOlJugGbTv7K9ikkexBTf8Vu/XQ8LUTr0y9jr+fcBrxHyV0mnbFJdZI
	xTgK1IEuPYIzQQDJAFdnkRj/ST1N9gVdB8yFIT14=
Received: by mx.zohomail.com with SMTPS id 1782291428934490.12484575176916;
	Wed, 24 Jun 2026 01:57:08 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZyAoVGhlIENhcGFibGUgSHViKQ==?=
 <u.kleine-koenig@baylibre.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ASoC: rockchip: rockchip_sai: #include
 <linux/platform_device.h> explicitly
Date: Wed, 24 Jun 2026 10:57:03 +0200
Message-ID: <rKfcwvouTiqAemuVUZWRbg@collabora.com>
In-Reply-To: <20260624083708.254517-2-u.kleine-koenig@baylibre.com>
References: <20260624083708.254517-2-u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_015720_150841_9ED412E0 
X-CRM114-Status: GOOD (  12.29  )
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

On Wednesday, 24 June 2026 10:37:07 Central European Summer Time Uwe Kleine=
=2DK=C3=B6nig (The Capable Hub) wrote:
> Currently that header is only included via:
>=20
> 	<sound/dmaengine_pcm.h> ->
> 	<sound/soc.h> ->
> 	<linux/platform_device.h>
>=20
> which doesn't look reliable, still more in the presence of the comment:
>=20
> 	/* For the current users of sound/soc.h to avoid build issues */
>=20
> in <sound/soc.h>.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>
> ---
>  sound/soc/rockchip/rockchip_sai.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/sound/soc/rockchip/rockchip_sai.c b/sound/soc/rockchip/rockc=
hip_sai.c
> index a195e96fed0a..37e81d56bc16 100644
> --- a/sound/soc/rockchip/rockchip_sai.c
> +++ b/sound/soc/rockchip/rockchip_sai.c
> @@ -11,6 +11,7 @@
>  #include <linux/delay.h>
>  #include <linux/of_device.h>
>  #include <linux/clk.h>
> +#include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
>=20
> base-commit: ef0c9f75a19532d7675384708fc8621e10850104
>=20

Makes sense.

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>




