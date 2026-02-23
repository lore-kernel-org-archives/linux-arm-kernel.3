Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F388EA4FAD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 11:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JV6MMROodIfNHs5yZIiROnA2XT+gIEtvvO+RXDqEFEw=; b=qdc6l5cy7Gafxaodjdln3eOyLM
	AIprZLgaBgpkSjWwEKQk13MtjHVh12mzDmgwPghjTdu8dE+/bCj92lvCp4xNSnrmCFMrdhjYIkOkO
	JkbL5WFK8z/fKZHvutG3EIIoklHT7MVvlMnEIDZE9VLPMh0SlCrRaODPfFjK4IWLMLO4zMf5SsZ+q
	6oZLSRo4HoNmqK9CDs3XGZ0txoUbyxtITK3r1q146CH8+2ZDflZIa1aSaSXQpjSa+dLTyf2nClOOm
	1hsfdavW0OGdB5jOTJ7LUFg/eUl/stcVbqryfcqMAN/UlsZQHyto+vWSwrMuw5bY7p90DWhx4vx3j
	ijCWSD0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUAw-00000000Bat-1pfI;
	Mon, 23 Feb 2026 11:32:30 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuUAt-00000000BZi-0pV5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 11:32:29 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-64ad79dfb7cso3872868d50.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 03:32:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771846345; cv=none;
        d=google.com; s=arc-20240605;
        b=Wzn+rdM2L7ss3BskQhkRj4evl602er1TOvnivi/NVHHs9HwMiPggJbFbsKFxDROw+l
         pcPcFjCoPRgKolShi94Ith2NCpY1JXQsPRL0AmdbvEWxjoDFFtXBDyZy2km0LeGwSG4o
         +hMtEaR2XNjyIh4nEvQAwml2GFGutjND5FVy99A6tlY8WFdHnzRFuNEc0eX0YXgBOMpp
         a3LlHaClcmiG73cfN4pqk8qgCLK0LeVRru4lU3Wqh/8xApDSissQqu4LUGCOexfVLjaz
         Rpf6NCG+zsFA3+SEYRY8K0V7cpwStX8i1YSklcgmyhrG7sualzUOYIQ9P5BO8NDvQjcK
         s2XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JV6MMROodIfNHs5yZIiROnA2XT+gIEtvvO+RXDqEFEw=;
        fh=QVkH2JJHFOwYEzgXaOW84xeTg+FnuAbYF38DhDY8YyE=;
        b=Jz+qV+fRNt7nT1Qu6IQwjdHqufxcCm6UBiPFp8tAFQ0QEoBwreiDzRZfmqS1fFqkGz
         27/QOKjoQMvZLkM/drPvC3yWGO8dKWn5Jvxg3HVWPin5pFExfoQ3/5t8LEoyEZY8OFVT
         3Vs+ZYzs0tl076SG8/NjnOXss7uSs6lu99TWrrV1HLFjhBY6youdvPNfCt/oUF2us0Y+
         n5OQBSht+EtA17t9UDzXCybyeODuvsFZjs00WNGOf6hw1bohE/uFBq9u+RwnlztMa73p
         WOS5tDhB2TIXEzBXPSbxA4++3wUFEOoHxA2LwQpD6+1wczwjKiZqqBp2NEq5/nMSX9Cx
         HLjQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1771846345; x=1772451145; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JV6MMROodIfNHs5yZIiROnA2XT+gIEtvvO+RXDqEFEw=;
        b=lIHBDE1WwfXP+c/KlVxiy7aCrB0c+RRRRvQ0HOXhZCEc90x1NKHRx0k9oBciesbK+F
         U3S2CmyVVo+6KDHQMdXQFB45NITlK5Ahju/FHr5fht/vSYMXS55XxOrCu3gjg/6Z0GAa
         Fnb/tgaUkIeQkxmwknFTQR7f2p+XxsGKY0pPjU5RXRuVV/v/lBTysxwSQzRhnW/yunFb
         CALS0XHBzl1OE+8KFFWM4vPJbvHuue7bqp2IjSisBxoQkZrgjoczZGrYxvCTDwXIQkwq
         jCIBnLFi41GHVaVqtP1v0E9I/GjmOZln34Zp1gg6/wLu/cX8oCfFRN5b/2uLL+sHiOX7
         1LfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771846345; x=1772451145;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JV6MMROodIfNHs5yZIiROnA2XT+gIEtvvO+RXDqEFEw=;
        b=YK1qnZ8siQTXB9GM1pw9sSWxxg/WpEaSiZ2uEFuzv//tFTiEjVCUOFKe17wmcJU4zV
         l2TH97aCoximqppe/uiEzIVhB0V60vMhRWu0qr9Y+Pj04/Tk5NnXURceTrVWdwhfJOKu
         3VLNupQdc8cs0lZb4uFJgXa9xMTEgNF54J8FWbdJ5b0rypXU/1de5TEOd248eVImWHui
         2Z8WNjwXJdU+/kGatZ+QMmLs0SwBK8RoAfGsmgFDROxiJTVeSrFyxy46wMF1HYXxqwQR
         cp6Jsc7v4JlAE9q1yFH6rTFcEXKouUYSGMK+gMFPnpoLnc/2nqbfYXJ5ewVyC7ya9wNV
         s8+A==
X-Forwarded-Encrypted: i=1; AJvYcCUXGPE27g4679DyDEI49iNrCTDndAn8iOMQFXzbNAi/9nYwpGJAPIpGZURIbn0YFjDcUWLz/PsKdJwhjSfN5F7d@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ277Ax4XHCHhhG49rqs17v4eXu/I2rGB/cb59RDsnlX5uTpHl
	p0UnHW7vAIKazGxPEL/FtIqEcjHo7Qdr+x2WuQR2ITN8lgSlmoo3uxUXFr9YhrMn7+xch1Szxv5
	UTZ7PEbHnvsAHAvgdCnrsLvfvePD5cXZBRzUfr8Nerg==
X-Gm-Gg: ATEYQzxmF2kIqYB7nbSjiDEcD7hKnCwyZD98AFj2N7tsrSr/O21mlIqAKVxdU6AG0o3
	am5ixmJi+EYq1MKFaTH64y8bfX1Di28i1TYsl5zmiEtL4icrxrId2m+Y5hhYOBuPoKQxj3BgAxc
	H+fnvLPJ934AmeKzAmxqdgNRz3/CiejDRpxuMXUN/hmA8erk7WKwJMWhDYYT/J+CXtJY7eFxOpa
	adeMOMb1Ot5AZKYtGjrLDvvDfxDXoZ9aBmJZ6NTgVjyVIqveD0mqONC7eXjFl76LgVYwHjVOYNp
	rQBM/iYGlzg69xqPaFsk/XKuITbT1eAO2Kh8+g==
X-Received: by 2002:a05:690e:1601:b0:63f:a7dc:5661 with SMTP id
 956f58d0204a3-64c789c7e4dmr4751859d50.12.1771846345547; Mon, 23 Feb 2026
 03:32:25 -0800 (PST)
MIME-Version: 1.0
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com> <20260223-i2c-adap-dev-config-v2-12-d78db0a6fcf7@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-adap-dev-config-v2-12-d78db0a6fcf7@oss.qualcomm.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 23 Feb 2026 11:32:11 +0000
X-Gm-Features: AaiRm53g18kb_D8a8Rz5gsK9_gN4L3-bPSeoZhzvicFe1V_X2f1sAQaShwQ_SAw
Message-ID: <CAPY8ntDgMHgjX65ZW8dFvo5jb+yZDUQq6cEJuw=zP6DddmTPrQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/12] i2c: bcm2835: set device parent and of_node
 through the adapter struct
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_033227_327774_2817F689 
X-CRM114-Status: GOOD (  16.95  )
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

On Mon, 23 Feb 2026 at 09:07, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Configure the parent device and the OF-node using dedicated fields in
> struct i2c_adapter and avoid dereferencing the internal struct device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

When used alongside [PATCH v2 01/12] i2c: allow setting the parent
device and OF node through the adapter struct:

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  drivers/i2c/busses/i2c-bcm2835.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
> index 0d7e2654a534e92a529f27fdc049812359678522..4f7e4a178b33fdd172657cc625a34018b18f88ca 100644
> --- a/drivers/i2c/busses/i2c-bcm2835.c
> +++ b/drivers/i2c/busses/i2c-bcm2835.c
> @@ -474,8 +474,8 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
>         snprintf(adap->name, sizeof(adap->name), "bcm2835 (%s)",
>                  of_node_full_name(pdev->dev.of_node));
>         adap->algo = &bcm2835_i2c_algo;
> -       adap->dev.parent = &pdev->dev;
> -       adap->dev.of_node = pdev->dev.of_node;
> +       adap->parent = &pdev->dev;
> +       adap->of_node = pdev->dev.of_node;
>         adap->quirks = of_device_get_match_data(&pdev->dev);
>
>         /*
>
> --
> 2.47.3
>
>

