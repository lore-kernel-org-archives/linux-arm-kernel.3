Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EFED3F078
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 14:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JCdegKDDMfDXAfXqsR2Uvxu0kBnW9fcc8iY6+4cJYno=; b=EgDH67+fxQRuNFI7rX3MKSmWjJ
	e6zq1FVGeQk9kmKwQ2kJSOdkEEZx2zjv/YW/DSIZ+qA7+DeEfhv9OezH1cFKGR2NuvWe+s2D20XNO
	D3ngR0E91OS2RCtYMXpNNHLKQruYtopHZ3nr4wq5pxl9odrUeIULE7B8IqZVlZTOx4k33qXlUZUmP
	ZjK5Oj5El5NlL9RxTllWIb6mv1DagGvrOvlYEGj/Qjl1cm23IFcn7wDyhrCi1ZRLISGuRFCjcYOnE
	oxNDZ1QAUaWMMApj/uNIhn8/4y4uq+M6iK7nb2zQggm/IiNlTnt/CcSlTp4bbK7BFj+J6xI4lSUvj
	L9/G0zWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6zd-0000000GDnW-3Q0s;
	Wed, 28 Jan 2026 14:58:05 +0000
Received: from mx-relay47-hz3.antispameurope.com ([94.100.134.236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6zb-0000000GDmj-3okF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 14:58:05 +0000
ARC-Authentication-Results: i=1; mx-gate47-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=JCdegKDDMfDXAfXqsR2Uvxu0kBnW9fcc8iY6+4cJYno=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1769612177;
 b=buDQ14l23vykszOtKms1dq1dgSB/XgGtEk0J7dUsMS0MPBK60pdI33rhME8iT8e7fnh87N8b
 e33Na9RdbjqMW8COsehqi58w/5trIuHyiarD2u1Z8sG15jpGSYCCCU/XbVgUcCBE92du+MRC/36
 gqPExZC703GgiUfUd+k4ejdbzMPdYt9fje28ZgK1kpvcRXdrLz1SjkRT7imLl12tGB1JPdzdTZN
 aGTLF+Rl/B8DxWqEwuRQnJFmNGl0C4W8xA7sqlmW9e6zw7ClsvdxHi5lc0ayQQWYxjx3JOEn/7B
 +YZb3XvFFQsyrpN8Io6RCyJm6CxySEqL+hW4mgR3v9kUg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1769612177;
 b=sex0i8+2UmKrB/4ro3sEWhOI/yEa5xOUwn8NjUlKonKjkcIxE3u5z0ijTsBItjw9cHLq+99h
 zD4bQM50pcZ0sZYoAYAI6bObmXv9nQY3WygmKEfQc7KjmO/oSnKgDEb9zfpuh+BMyR0FgXg6OCR
 kICogfVlb08qxDR26UXu1hK2MTOwumGQNUVzkQpCOl77OQQoXBGjG5zqZJ3a0geIZ0vHrNfhsTf
 BSTL9wK5+iuNYbWll3Exk7qEgjr2Sug9HNZKWGUsxRbCw5oPqzJXrQAEkOvFlpQcy1hUDFSaPJX
 YoOvmuO8D81Ed2DY7NaqA8eVcRibMFCX4vcII/RG+FfTA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay47-hz3.antispameurope.com;
 Wed, 28 Jan 2026 15:56:17 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 63D9FCC0E8A;
	Wed, 28 Jan 2026 15:56:04 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Chia-I Wu <olvaffe@gmail.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Laura Nao <laura.nao@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 =?ISO-8859-1?Q?N=EDcolas_F=2E__R=2E__A=2E?= Prado <nfraprado@collabora.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RESEND v3 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
Date: Wed, 28 Jan 2026 15:55:27 +0100
Message-ID: <2403222.ElGaqSPkdT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <5791016.31r3eYUQgx@workhorse>
References: <20251215-mtk-pll-rpm-v3-0-5afb3191e869@collabora.com>
 <6239343.lOV4Wx5bFT@steina-w> <5791016.31r3eYUQgx@workhorse>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay47-hz3.antispameurope.com with 4f1QM92RwJz4MM95
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 35114e83581fa19bd9a5fa78e3850a51
X-cloud-security: scantime:2.290
DKIM-Signature: a=rsa-sha256;
 bh=JCdegKDDMfDXAfXqsR2Uvxu0kBnW9fcc8iY6+4cJYno=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1769612176; v=1;
 b=sidsiOsO7pnnhvNWmMFZq9ammXibNtGAbmjRbzTcf1gmqM4rQ4Ut6/5xBmTLFb3X16pCMnqw
 z10T6UtKf0ViOeK/bGJCsDSa5XZ0wImLXcA+NSf2NIY4FYPtnfnZwg91cCdbrUis2juniSyCMNi
 kC63cFDrvt+oOmXvaAWe3qW4WnVwhTaaDmli4M8WDwmTs8dW0UhCBWAuFTrcppvR5x5Q0n6l9ha
 XD4vWBqLMAA8CGmkPYKHsFTYrX0FJD3cYN/y01I9IKJ9Hk9ZwgYeC6Hzhwk9EjtQvp/i924S9f5
 TFUvgRtpJNL5AOiWRAN+h6ItwhxLEUgeIKPW8ITs8ycdw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_065804_112726_92F89936 
X-CRM114-Status: GOOD (  26.81  )
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

Hi Nicolas,

Am Mittwoch, 28. Januar 2026, 15:11:33 CET schrieb Nicolas Frattaroli:
> On Tuesday, 27 January 2026 15:55:29 Central European Standard Time Alexa=
nder Stein wrote:
> > Hello,
> >=20
> > Am Freitag, 23. Januar 2026, 02:45:33 CET schrieb Stephen Boyd:
> > > Quoting Nicolas Frattaroli (2025-12-15 03:23:58)
> > > > When CLK_OPS_PARENT_ENABLE was introduced, it guarded various clock
> > > > operations, such as setting the rate or switching parents. However,
> > > > another operation that can and often does touch actual hardware sta=
te is
> > > > recalc_rate, which may also be affected by such a dependency.
> > > >=20
> > > > Add parent enables/disables where the recalc_rate op is called dire=
ctly.
> > > >=20
> > > > Fixes: fc8726a2c021 ("clk: core: support clocks which requires pare=
nts enable (part 2)")
> > > > Fixes: a4b3518d146f ("clk: core: support clocks which requires pare=
nts enable (part 1)")
> > > > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@=
collabora.com>
> > > > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> > > > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > > > ---
> > >=20
> > > Applied to clk-next
> >=20
> > Unfortunately this breaks my board TQMa8MPxL+MBa8MPxL on next-20260126.
> > Last lines on bootlog (earlycon is necessary)
> > > [    1.175639] Initialise system trusted keyrings
> > > [    1.178907] workingset: timestamp_bits=3D42 max_order=3D19 bucket_=
order=3D0
> > > [    1.185822] NFS: Registering the id_resolver key type
> > > [    1.190295] Key type id_resolver registered
> > > [    1.194473] Key type id_legacy registered
> > > [    1.198515] nfs4filelayout_init: NFSv4 File Layout Driver Register=
ing...
> > > [    1.205235] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver
> > > Registering... [    1.213235] cryptd: max_cpu_qlen set to 1000
> > > [    1.274689] Key type asymmetric registered
> > > [    1.275939] Asymmetric key parser 'x509' registered
> > > [    1.280896] Block layer SCSI generic (bsg) driver version 0.4 load=
ed
> > > (major 242) [    1.288278] io scheduler mq-deadline registered
> > > [    1.292840] io scheduler kyber registered
> > > [    1.299245] ledtrig-cpu: registered to indicate activity on CPUs
> >=20
> > Reverting commit 669917676e93fca5ea3c66fc9539830312bec58e fixes the pro=
blem.
>=20
> Hi Alexander,
>=20
> sorry for breaking -next.
>=20
> Can you try the following patch to print which clock+parent is causing
> the hang on your platform?
>=20
> ---
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 1b0f9d567f48..fa1443517768 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1921,13 +1921,21 @@ static unsigned long clk_recalc(struct clk_core *=
core,
>  	unsigned long rate =3D parent_rate;
> =20
>  	if (core->ops->recalc_rate && !clk_pm_runtime_get(core)) {
> -		if (core->flags & CLK_OPS_PARENT_ENABLE)
> +		if (core->flags & CLK_OPS_PARENT_ENABLE) {
> +			pr_info("%s: enabling parent %s for %s\n", __func__,
> +				core->parent ? core->parent->name : "(null)",
> +				core->name);
>  			clk_core_prepare_enable(core->parent);
> +		}
> =20
>  		rate =3D core->ops->recalc_rate(core->hw, parent_rate);
> =20
> -		if (core->flags & CLK_OPS_PARENT_ENABLE)
> +		if (core->flags & CLK_OPS_PARENT_ENABLE) {
> +			pr_info("%s: disabling parent %s for %s\n", __func__,
> +				core->parent ? core->parent->name : "(null)",
> +				core->name);
>  			clk_core_disable_unprepare(core->parent);
> +		}
> =20
>  		clk_pm_runtime_put(core);
>  	}
> @@ -4038,8 +4046,12 @@ static int __clk_core_init(struct clk_core *core)
>  	 */
>  	clk_core_update_duty_cycle_nolock(core);
> =20
> -	if (core->flags & CLK_OPS_PARENT_ENABLE)
> +	if (core->flags & CLK_OPS_PARENT_ENABLE) {
> +		pr_info("%s: enabling parent %s for %s\n", __func__,
> +			core->parent ? core->parent->name : "(null)",
> +			core->name);
>  		clk_core_prepare_enable(core->parent);
> +	}
> =20
>  	/*
>  	 * Set clk's rate.  The preferred method is to use .recalc_rate.  For
> @@ -4056,8 +4068,12 @@ static int __clk_core_init(struct clk_core *core)
>  		rate =3D 0;
>  	core->rate =3D core->req_rate =3D rate;
> =20
> -	if (core->flags & CLK_OPS_PARENT_ENABLE)
> +	if (core->flags & CLK_OPS_PARENT_ENABLE) {
> +		pr_info("%s: disabling parent %s for %s\n", __func__,
> +			core->parent ? core->parent->name : "(null)",
> +			core->name);
>  		clk_core_disable_unprepare(core->parent);
> +	}
> =20
>  	/*
>  	 * Enable CLK_IS_CRITICAL clocks so newly added critical clocks
> ---
>=20
> Thanks for reporting this.

thanks for the debugging patch. I'll respond to the other thread where
Mark is active as well.

Best regards,
Alexander

> Kind regards,
> Nicolas Frattaroli
>=20
> >=20
> > Best regards,
> > Alexander
> >=20
>=20
>=20
>=20
>=20
>=20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



