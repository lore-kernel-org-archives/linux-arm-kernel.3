Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A987D3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 15:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P/m1vxR02WOyUjv42kPGF/giy/R0/NhZdgtsGDSOxAM=; b=AUQx47Rp36r9n0PxLNcCurSIRu
	B2rbJ1rf5NsjRfTFvQH1bU2o/yW5aMx0tGvfAtVPtKN4MXU9KCyRACNmaUQqUXdv49jtt+pVpXOu0
	Ko+499cN4PBRp2TFWd/i7m7Auq1nvV+58md/8VUTYrT5SiFFQB5GWLWqqPEDz8Ndn7Td0/minJS35
	cbEXB11qOJ7agxhw6BxPGUXqEWTRzEIpwsAXyWEAFD6Net28eM1dzbk/nHQOrc61St2HsFpxCGGNW
	CgFoy/7gcp3nXxJ5EJvl7LpC5bweZQzi8HIzzbTNF7iwa3D2CyAwD/xoG5qCjuLHnisrF19ZdYI3L
	1B+Ftnog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZt3s-00000002r1R-1URp;
	Sun, 28 Dec 2025 15:52:04 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZt3m-00000002qza-1X3u
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 15:52:01 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-37bb8bef4cdso80836311fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 07:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1766937116; x=1767541916; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P/m1vxR02WOyUjv42kPGF/giy/R0/NhZdgtsGDSOxAM=;
        b=MK8+6i7jDgiRhVe86CqmcMePlRSlPmCuro38Ug9uOqtDwG21BmPqK04ERvwktnurU6
         w1jXC2j/VDzs43o5c4emHzvW68LfHrl9A+iyBdiukAVZPIunxxi4A4LWrYaz/MjSrB1I
         1Zjxxdy7gpEBqtru2l4mFml/wf5Mvg7WExkc15TPbkvDQ5pWAN31sDQi5C6oOdYaSv0D
         vg4SruExyQ8yf36wVJSd6YUAYC4MFvAL8lSdRV6TRKIN9KVF714a7FZDRUt57Lf6jf0V
         6S/pmIsOMegbfLAxLY9ifDrNyc60Fgu8ZgOuQodkhGXSGi7Pi0cPl1/Hb41IdgR8HDQ0
         9dpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766937116; x=1767541916;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/m1vxR02WOyUjv42kPGF/giy/R0/NhZdgtsGDSOxAM=;
        b=AWyaUkA+m4OQTLJ2iDg4f/B+xbNABu7U9dB+b4F2b5+XXg8Wgp+EwZz4Z9PQC+fYqO
         ZbRdHvY7QToA+2nhJEOsFBUWXIY7s23sd2UtuGKq60Nh1Vx+wkaxRjVw0cY2ayd3eHUy
         eVcZsNU0vEWcS9cxUPLY3JSOnkGI1NPaIH5f5loWS1uSagBRP0tuGJBsKSMmJip2AFbh
         hqZJ+LbqpkfUafBAFJbftR/j5D5chdXN/u8TmvhsXB1x1IE1cK6YCiZMk0Z8ZI/5lhY4
         7fvCvzpdTpQkTS1xjQk4ft6LWfy3SCTXA+Z4KaCLg6ky+4zEhPRrPJm9j06f6oleJGF2
         IXQg==
X-Forwarded-Encrypted: i=1; AJvYcCUs4PiMPufR+N7TyWpScsj8Vn8P5CCjHsYbzZBFDNPW/ymZhQnMoQ57PfIF+T0JgNBu09rFffcRkriHXwT70eVW@lists.infradead.org
X-Gm-Message-State: AOJu0Yzk3nCizq0lnkfTil7dzIhZ4jTtIQdIIj6Vz9WCkXcYlQGkBz6L
	k6bWNc5yA8nRyhA4OEm7PP6BGJY1/ImoLGtyVfXJqQ9kSqKMQhmO0/sqw7RljVctI6NwVTUlxSJ
	gMcWjlmXjRO5PFPRfiWWn28Z8CM5X9iyhkvrxafRkWKLdy4WGRBWc
X-Gm-Gg: AY/fxX4AapQg4MmSAG95uGhuqeY8Ng2GBTUNggq68TqWWDHB42g0hKqxhs5yLLtiLgI
	YhBlq6n8Adt8oCKO/9SUzz1C8Xxt3BlUasSBYJW3rYUI9u2ZaRp80N3CEs24Gwl+YT3WKHW80yA
	DkYdy2ikZTMjNofnugjOyg1sCBKtHMusmZ7Q30O7qkSvy4g0lTiU2LURWlArThXlh5tGB4BG3gV
	wy+FrGZT7G6M1FaByLxlrfkI6hzoE5r+B2xKQrl1Lnea5Pws8dTZJmAH5PycNPuvxqiGUbj2FFf
	O/2nkoI=
X-Google-Smtp-Source: AGHT+IGB3UutjLANyz+UGrs1Pqtz1ghxCPTBV3dlt5zsd0azNruBIQWwpwIrTOgY2yNs1XyuNUwLWDwXCb5ktjQfulg=
X-Received: by 2002:a2e:ae08:0:b0:37e:884f:b6ad with SMTP id
 38308e7fff4ca-381216725damr72755891fa.23.1766937116107; Sun, 28 Dec 2025
 07:51:56 -0800 (PST)
MIME-Version: 1.0
References: <20251215-v6-18-topic-imx93-blkctrl-v3-0-51dbd1333938@pengutronix.de>
In-Reply-To: <20251215-v6-18-topic-imx93-blkctrl-v3-0-51dbd1333938@pengutronix.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Sun, 28 Dec 2025 16:51:19 +0100
X-Gm-Features: AQt7F2rrgyY9PnfhYGRnz3aE_FjJItGK6XwPKeNDQpDGt15NF8-FEH9rM6gu3fs
Message-ID: <CAPDyKFqjJV8=PH7bTkWKJD4Dc7JoT6p02mPMrKA3uGuAKGsYvQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] i.MX91/93 BLK-CTRL improvements
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, Frank Li <Frank.Li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_075200_581936_88478F6C 
X-CRM114-Status: GOOD (  15.91  )
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

On Mon, 15 Dec 2025 at 20:18, Marco Felsch <m.felsch@pengutronix.de> wrote:
>
> Hi,
>
> there were several approaches to bring the sub-devices population
> mainline [1,2] but non of them made it upstream. Both approaches were
> part of either the i.MX93 LVDS or MIPI-CSI enablement.
>
> This small patchset decouples the blk-ctrl changes which allows the
> MIPI-CSI and LVDS patchstack to be rebased ontop of this patchset.
>
> Before adding the sub-device supprt, I converted the driver to devm_*
> only API.
>
> Regards,
>   Marco
>
> [1] https://lore.kernel.org/all/20250701-95_cam-v1-3-c5172bab387b@nxp.com/
> [2] https://lore.kernel.org/all/20250304154929.1785200-4-alexander.stein@ew.tq-group.com/
>
> ---
> Changes in v3:
> - Link to v2: https://lore.kernel.org/r/20251202-v6-18-topic-imx93-blkctrl-v2-0-e73501034adc@pengutronix.de
> - Add r-b (Frank)
> - Rebase to v6.19-rc1
>
> Changes in v2:
> - Link to v1: https://lore.kernel.org/r/20251201-v6-18-topic-imx93-blkctrl-v1-0-b57a72e60105@pengutronix.de
> - Adapt patch2 commit message (Frank)
> - Check devm_pm_runtime_enable() return (Frank)
> - Add r-b tags (Frank, Alexander)
>
> ---
> Marco Felsch (3):
>       pmdomain: imx93-blk-ctrl: cleanup error path
>       pmdomain: imx93-blk-ctrl: convert to devm_* only
>       pmdomain: imx93-blk-ctrl: add support for optional subnodes
>
>  drivers/pmdomain/imx/imx93-blk-ctrl.c | 77 ++++++++++++++++-------------------
>  1 file changed, 36 insertions(+), 41 deletions(-)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251201-v6-18-topic-imx93-blkctrl-341220f7084d
>
> Best regards,
> --
> Marco Felsch <m.felsch@pengutronix.de>
>

The series applied for next, thanks!

Kind regards
Uffe

