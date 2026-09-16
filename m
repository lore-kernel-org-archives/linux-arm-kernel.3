Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE743C982C1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 17:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E5wNtv0wDkIe9aO5f3le6LmPTDNX74MWkohjzIuB+hQ=; b=av9DsVp9lFtSf/wl8CWJICHTUa
	dyP7TJJtRE9DnwSC6VdZVUGz7Fzcn/3UgmA5/gI08JA5insLLj6tSeAQAWcyp2qKtWop+bI+Yd35z
	KaAVZbZtmJKeZXNJ9ly/ZnNE31A/PfWG+PZyJH2yctTCrg7wVg0wC9+Z60iNW/4HUQD9CLgMZQ+3S
	0p7OfwjFEobcuccYEh3+DoUMlij7PFmeCNorzQDTpyfIOsGzS/BgxvjeOm3+D6G4taPVQSKftOSRV
	jX+GgJBekuuWptNbgNARDLs+zYAcrK+/kSo248Q0rCjrEWuFFk0iZZjUL0NsUYeaU12a0UmWQM51b
	PBUdmiAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6t7R-00000009pny-36eX;
	Wed, 16 Sep 2026 17:08:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6t7P-00000009pni-3FIX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 17:08:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E652E6022B
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 17:08:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 914391F0089C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 17:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789578502;
	bh=E5wNtv0wDkIe9aO5f3le6LmPTDNX74MWkohjzIuB+hQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fvQIKcZ0BSExGtlyc2FZkuUme8eICV13j8MfU6a/QfHlpMnHaAxJF+/NOvji76qW0
	 tXDpoH+2uenQ0cyGKI5VeS5JqKmGqCq5xFHCE86dc8wVE2pX9JJLVTYSRJc+qE4tpj
	 JeEN1KJWH/OyQsBVPCSSGU9MLXqPPZgwCWdTmOCEgW7/uTyJCiPg7za1pw6/aKXL+2
	 Nup06Hm2bqpJLZg/KuQd5AWgIS+8G5q4mxHzrtdSnNSA5AHVhrHzyybYkLsaftXVIJ
	 bNVSZT4qqXAXnOHll3Wqq2UDapA3vUEKkHKLqDh2YbIdVmCwEDY7c997RSw66OGPxw
	 WNgI1685s3eiQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b899413537so1673329e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 10:08:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwrHF76lUv7oh8WADxDeDjqbJswexa4JPVBVKpGqp0nFNafMrhzhVaynYjqfMVoMd67e8QovbsNpfqDCdgZR/2x@lists.infradead.org
X-Gm-Message-State: AFuF++mAuWWMtt+ushpmz1OZIaFet/ZuheZzGicx55nYmn+BZ13tUsXv
	dckmnn5QMO2Z8mvFAGyGDpst55nZqACRXD/8N34vrd9G33QH0g73nvBCwbTx5yp2jOcNtTZiPg2
	FY/qHkZtPmni2F/RFRgziTGRsjnbmA1A=
X-Received: by 2002:a05:6512:3a85:b0:5b6:183b:d215 with SMTP id
 2adb3069b0e04-5b8b6666edbmr1065811e87.60.1789578501266; Wed, 16 Sep 2026
 10:08:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260914100744.1039050-1-andre.przywara@arm.com>
In-Reply-To: <20260914100744.1039050-1-andre.przywara@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 19:08:08 +0200
X-Gmail-Original-Message-ID: <CAD++jLnMB_Fr0i=FgjsqoBj3tOc=nrKy89zsZLMQGup_+Xh0FA@mail.gmail.com>
X-Gm-Features: AcwNN1UmIpTpGrnLd6YNTpMeKuWu3aLaJO6OkS3CIGZ1a2xTye0vQ771yZj10e0
Message-ID: <CAD++jLnMB_Fr0i=FgjsqoBj3tOc=nrKy89zsZLMQGup_+Xh0FA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sunxi: A523: fix voltage withstand encoding
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
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

On Mon, Sep 14, 2026 at 12:07=E2=80=AFPM Andre Przywara <andre.przywara@arm=
.com> wrote:

> The Allwinner A523 uses the same GPIO voltage "withstand" programming
> (setting the input level voltage thresholds) as the previous SoCs, but
> for some odd reason inverts the encoding of 1.8V vs. 3.3V.
>
> Add a new bias voltage type to note this difference, and select it for
> the A523. At the same time also use the newer "CTL" version, which in
> addition allows to turn off the withstand programming for I/O voltages
> other than exact 1.8V or 3.3V (for instance for 2.5V sometimes used for
> Ethernet PHYs). The A523 has that enable register, but didn't use it
> so far.
>
> This fixes eMMC and reportedly Ethernet operation on some A523 boards.
>
> Fixes: 648be4cd9517 ("pinctrl: sunxi: Add support for the Allwinner A523"=
)
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Tested-by: Per Larsson <per@palvencia.se>
> Tested-by: Juan Manuel Lopez Carrillo <juanmanuellopezcarrillo@gmail.com>
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> Tested-by: Chen-Yu Tsai <wens@kernel.org> # Fixes eMMC on Orange Pi 4A

Patch applied for fixes!

Yours,
Linus Walleij

