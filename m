Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DEB0C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 21:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7vv2zCnn+8YFHVHlCAGyM9+OpN94jh7Pzu1l+wtiw0=; b=q3t358gOJ8X+JX6MCD/b3H4ywm
	Z0oHt/sdAwwA9ujEEYByXF85rG/YiAAxRrFL6ZGIMU/FO9DWLZ119ZhnenFs22lB7x/O38/a6qjL3
	RFgDFpt4l5tvVLmomH4oTsVEZGpEDWYAbx70YJH2ShwyMUkMBBoOr+oV7OOTZ2XzzDvwI9Fp2dyn8
	VxJMe6unCvq3XjuKePnfl+mW+/AE5yiWJTWH4QhKgPoXc/Ag66UNSXNhUT4ibysfz26Wz2jR9wJ1g
	xVpJB5kuX9PAKToN1/OJkIAkTfiqtikib93B6fGeVlFuZlVmMn+cIRiqxy/RdOOU+wZEt91gT7DpV
	II0m4aKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xADH8-0000000ETYV-0Ewz;
	Fri, 25 Sep 2026 21:16:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xADH7-0000000ETYK-1D9e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 21:16:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CC6DF43863
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 21:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09F01F0089E
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 21:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790370968;
	bh=o7vv2zCnn+8YFHVHlCAGyM9+OpN94jh7Pzu1l+wtiw0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TdyNDN3G70qnR90wz9poIu0G3/yuYQ2Og3m0yLnaVSDlUswTRq9W4a0vGyiZ1jRAk
	 pWgltJ87NiUOJR3liXOk0uX9GXKhWY8ejJkk9VA6SZVZnb5lo+MMBdAPVgpCA0u77T
	 1rUavcxAvXe7OonnMHM3PYzctZCNiXdI9RM7gtkcXZljk0YcBlno827Tt4k5V4uLjX
	 hiccwL69s0XCS6sw1W5sYmidXGKw/+o8suurGtmQDa/5E1XrASKng99N9iQq5/V/P2
	 nazgmd2Pohgq2fpwQnR6V384oMkPWXW1g6hgTyEJ2B9NZ3oGok1i9DqaDSlMRg8y3S
	 bYA5p6+tn0p0Q==
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a985fba28bso1665326a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 14:16:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxzW5LiMtZ/O5YSef41BTf62dQfhCP2TYLDJiPUwWFxCQ6CM1utS8hCn//zKdtuPLECavoqbRo9R/Qh3TovvoXQ@lists.infradead.org
X-Gm-Message-State: AFuF++nAz2/VycJI6GEcp2w53EkmYL7BJcxY0FSF/1Tw+9U0LjMvVj1/
	oPVJHyglu0TX+B2bm0yyPRxJ+3NvqiAbrkGGWBfNVsoOmOODTE0VnsYGidyyWqtoF1DPstxWVsm
	5oqsLSCGYFgu6D9QoOSQsCEgStoqEqQ==
X-Received: by 2002:a17:907:a68b:b0:c29:6400:ef8e with SMTP id
 a640c23a62f3a-c2ac262e026mr623148866b.42.1790370967328; Fri, 25 Sep 2026
 14:16:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260923211312.3793073-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20260923211312.3793073-1-Frank.Li@oss.nxp.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 25 Sep 2026 16:15:55 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLKjc2KVbnj=Tyq2Vk_KRV-M3REv3TvwfA_D2R8CU91vg@mail.gmail.com>
X-Gm-Features: AclHuK-zZXzRBN60UkCEC4cL7VJx068Csh0ck7YdxPUbq_OiVD3z-aiLcwOJiIg
Message-ID: <CAL_JsqLKjc2KVbnj=Tyq2Vk_KRV-M3REv3TvwfA_D2R8CU91vg@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mn-solidsense-n8-compact: drop
 undocumented adi,led-polarity
To: Frank.Li@oss.nxp.com
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..." <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..." <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, Josua Mayer <josua@solid-run.com>
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

On Wed, Sep 23, 2026 at 4:13=E2=80=AFPM <Frank.Li@oss.nxp.com> wrote:
>
> From: Frank Li <Frank.Li@nxp.com>
>
> Drop undocument property adi,led-polarity and adi,link-st-polarity.
> ethernet-phy@0 status is disabled and no in tree overlay file to enable i=
t.
>
> Fixed below DTB_CHECK warnings:
>   arch/arm64/boot/dts/freescale/imx8mn-solidsense-n8-compact.dtb: etherne=
t-phy@0: adi,led-polarity: b'\x00\x00\x00\x01' is not of type 'object', 'in=
teger', 'array', 'boolean', 'null'
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> cc: Josua Mayer <josua@solid-run.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mn-solidsense-n8-compact.dts | 2 --
>  1 file changed, 2 deletions(-)

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

