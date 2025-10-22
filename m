Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0373CCCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 12:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyR5VW+NAmVdJ0hvRREYbhuTAh8CBmPExIybD/RpDM0=; b=zaj++k4V0KO7UFbddzQFNOquT1
	gh9ckqPT1qxeDI1XFNQZKbo+TZGq1P5da5d/uBzepRvOvk41XXbq5EHqc2c9RWVCCVOmI80nnhk+x
	pszC1+sz+mz4IVHDsDSlLoAJBH5rPpcDmcODvoAVQ2p5IJtJhdCdugs+UmtoBCGNvjYAGm5wf0pyx
	hHniHEV7A2EwtkVcENYGa9Wvpe1QUYoUSNLY18MrCaZ1HQV16Gg9DOOuaxv7X4LwwTBgsFIpM8nlx
	6f3FmGP7mcLZfxdwLn19vIaFpJh6Yi0cemCDVqmIHa3bdpn6MiuisgMxKCy6VIeCLEdwA5r0Fvmq9
	CtYv1V9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBXWi-00000002jhx-1iPe;
	Wed, 22 Oct 2025 12:01:13 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBXWe-00000002jgE-3BIP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 12:01:10 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3ecdf2b1751so4109853f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 05:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761134467; x=1761739267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JyR5VW+NAmVdJ0hvRREYbhuTAh8CBmPExIybD/RpDM0=;
        b=hnJPX0iweU+zHBl1Ix1g9/LJWqwIgROgcdt7zjyh3Xb/y58QeykGXSeVQFA5ZiDUJE
         7e9pORbDzPe1tRDzid4imi+QwyJFDD5zw+O6aGH64toLYj5p1JlAsniSZbXDFKnVIZ7e
         meqmAmK3M+JxGYcjIZp4xknN07lDA/Iv1tK/JamRnbb45bgVaIzn0AHb6ZviE6VadH5R
         +/5S5EdmVtLEdkHdRU9uKiHv87a2pJrDIOBQrWsDqWG6yjbcllQ2SApS+OzTa5H/meYg
         NH6pGjSHntTShakqoigwHtFsxYy5Ewaym/Qlp6dSlEWIGprkSE+xUJC8MHYF1XpVT9LL
         o6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761134467; x=1761739267;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JyR5VW+NAmVdJ0hvRREYbhuTAh8CBmPExIybD/RpDM0=;
        b=p5JMYeuEBH7H2g5QT05iSXcoL47Rpgg2lWNSBYvqO6giD185Z4GP4x5B8E+s+TtCB0
         1KFbmtPddoR0Z/fm0Y8WQYnYxqvwjxGH/fbIb0EOevmYpeBKvNmLQ9MgPJSiA/ZgTn1S
         SkVNKMh78Wsyj7tn0w0VHZX7R3zbKcx0GG+FKKdUwppPNQwhVRuUpZ/VUJwVvhhKtd8k
         wFV1MR/9KWvflQULfL9N5f7Q25fmj7PNjcY41wMPZAPn+Y5O9mKTZtq2u8/vLqLzynYS
         z4VNfcW6k+/EzXju1pfTSwvSlYajHmwa7ilaMAUREIeWjgwf7VRmVcZpeQf5n1omFkg+
         Em+A==
X-Forwarded-Encrypted: i=1; AJvYcCWXSs1N7nArked4SWWmYy8nZIz14ngNIYBIiUXSCJHKzlRC4bxnnKc64AA8I/u6T4iJPqjSvXbJT1v1ohQvDVs/@lists.infradead.org
X-Gm-Message-State: AOJu0YzrGOxETzVMoExHshjMbTOeFUPN6J04I+n4m/0xnQKOeTE7U7Oi
	tW++7D5Pwq6CydlWTzPmPjWoEp2uUS34k3HTI4jfYJ0hbuywgMCbXVl813wv6gYOLqw=
X-Gm-Gg: ASbGnct/G4c07pm7JslN8d8Kqf/UR7tDoUBQjL6T3+T0/MzCSv670DTzPiJaqMcn3TU
	cTaaAQy5P9cwAs15p4Os7/zeC3s2Gr3eyXKWD3Rf+EkUV3zIG4ao55cXGUzfWJVOSkZHj2e4oYI
	wDgGkoWRrl6RxjxDGerK7VXCPZB1qEOv6sLQOp/PKFPeT0mr6/d2yZWt7kgVyXxBdgaRE3joFDZ
	+aFhHr2oKCrUkV1kxFT0pXpKIxbZd2mVZWFofltVXTJIY9m8iR5X2O4dQ+4MO+BBlHYljVjwz40
	Iua/V43DNBJmXEcIpyxe+Udy4YW7q2YWKL1ZetVJB0ovGpu4hm5CxmUY1WNfr16wtPpIsBm0Kfz
	pvKMSX3NWfK5LKglevUkiP4NLJP/tMVEM+2JF1tCOkVbPtkmoqUeIqySyHbWE1pscAMTtiDOXsT
	c=
X-Google-Smtp-Source: AGHT+IHbsKbAfuuLVLCAlwiAoOjeCSzSKz7jOyG6Tnh4cKgyrUKbbUqK56xJxiIvGc2SH5FLobbRRQ==
X-Received: by 2002:a5d:5f94:0:b0:425:856f:70ff with SMTP id ffacd0b85a97d-42704d99cf6mr15941694f8f.45.1761134466809;
        Wed, 22 Oct 2025 05:01:06 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:bdae:f4f4:58be:ea26])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427f009a797sm24998630f8f.27.2025.10.22.05.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 05:01:06 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: amlogic: Optimize PLL enable timing
In-Reply-To: <20251022-optimize_pll_driver-v1-2-a275722fb6f4@amlogic.com>
	(Chuan Liu via's message of "Wed, 22 Oct 2025 14:58:52 +0800")
References: <20251022-optimize_pll_driver-v1-0-a275722fb6f4@amlogic.com>
	<20251022-optimize_pll_driver-v1-2-a275722fb6f4@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Wed, 22 Oct 2025 14:01:05 +0200
Message-ID: <1j347b403i.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_050109_661663_9B3E1435 
X-CRM114-Status: GOOD (  27.19  )
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

On Wed 22 Oct 2025 at 14:58, Chuan Liu via B4 Relay <devnull+chuan.liu.amlo=
gic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> Amlogic PLL locking procedure shall follow this timing sequence:
> 1 Assert reset signal: Ensures PLL circuits enter known initial state.
> 2 Deassert lock-detect signal: Avoid lock signal false triggering.
> 3 Assert enable signal: Powers up PLL supply.
> 4 udelay(20): Wait for Bandgap and LDO to power up and stabilize.
> 5 Enable self-adaptation current module (Optional).
> 6 Deassert reset signal: Releases PLL to begin normal operation.
> 7 udelay(20): Wait for PLL loop stabilization.
> 8 Assert lock-detect signal: lock detection circuit starts to work.
> 9 Monitor lock status signal: Wait for PLL lock completion.
> 10 If the PLL fails to lock, it should be disabled, This makes the
> logic more complete, and also helps save unnecessary power consumption
> when the PLL is malfunctioning.

Is this applicable to all supported SoC ? from meson8 to s4 ?

What did you test ?


>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 68 ++++++++++++++++++++++++++-------------=
------
>  1 file changed, 40 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index b07e1eb19d12..26c83db487e8 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -353,6 +353,23 @@ static int meson_clk_pcie_pll_enable(struct clk_hw *=
hw)
>  	return -EIO;
>  }
>=20=20
> +static void meson_clk_pll_disable(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk =3D to_clk_regmap(hw);
> +	struct meson_clk_pll_data *pll =3D meson_clk_pll_data(clk);
> +
> +	/* Put the pll is in reset */
> +	if (MESON_PARM_APPLICABLE(&pll->rst))
> +		meson_parm_write(clk->map, &pll->rst, 1);
> +
> +	/* Disable the pll */
> +	meson_parm_write(clk->map, &pll->en, 0);
> +
> +	/* Disable PLL internal self-adaption current module */
> +	if (MESON_PARM_APPLICABLE(&pll->current_en))
> +		meson_parm_write(clk->map, &pll->current_en, 0);
> +}

I don't get why you moved that code around and make the diff even harder
to read

> +
>  static int meson_clk_pll_enable(struct clk_hw *hw)
>  {
>  	struct clk_regmap *clk =3D to_clk_regmap(hw);
> @@ -366,53 +383,48 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>  	if (MESON_PARM_APPLICABLE(&pll->rst))
>  		meson_parm_write(clk->map, &pll->rst, 1);
>=20=20
> +	/* Disable the PLL lock-detect module */
> +	if (MESON_PARM_APPLICABLE(&pll->l_detect))
> +		meson_parm_write(clk->map, &pll->l_detect, 1);
> +
>  	/* Enable the pll */
>  	meson_parm_write(clk->map, &pll->en, 1);
> -
> -	/* Take the pll out reset */
> -	if (MESON_PARM_APPLICABLE(&pll->rst))
> -		meson_parm_write(clk->map, &pll->rst, 0);
> +	/* Wait for Bandgap and LDO to power up and stabilize */
> +	udelay(20);
>=20=20
>  	/*
>  	 * Compared with the previous SoCs, self-adaption current module
>  	 * is newly added for A1, keep the new power-on sequence to enable the
>  	 * PLL. The sequence is:
> -	 * 1. enable the pll, delay for 10us
> +	 * 1. enable the pll, ensure a minimum delay of 10=CE=BCs
>  	 * 2. enable the pll self-adaption current module, delay for 40us
>  	 * 3. enable the lock detect module
>  	 */
>  	if (MESON_PARM_APPLICABLE(&pll->current_en)) {
> -		udelay(10);
>  		meson_parm_write(clk->map, &pll->current_en, 1);
> -		udelay(40);
> -	}
> -
> -	if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
> -		meson_parm_write(clk->map, &pll->l_detect, 1);
> -		meson_parm_write(clk->map, &pll->l_detect, 0);
> +		udelay(20);
>  	}
>=20=20
> -	if (meson_clk_pll_wait_lock(hw))
> -		return -EIO;
> +	/* Take the pll out reset */
> +	if (MESON_PARM_APPLICABLE(&pll->rst))
> +		meson_parm_write(clk->map, &pll->rst, 0);
>=20=20
> -	return 0;
> -}
> +	/* Wait for PLL loop stabilization */
> +	udelay(20);
>=20=20
> -static void meson_clk_pll_disable(struct clk_hw *hw)
> -{
> -	struct clk_regmap *clk =3D to_clk_regmap(hw);
> -	struct meson_clk_pll_data *pll =3D meson_clk_pll_data(clk);
> +	/* Enable the lock-detect module */
> +	if (MESON_PARM_APPLICABLE(&pll->l_detect))
> +		meson_parm_write(clk->map, &pll->l_detect, 0);
>=20=20
> -	/* Put the pll is in reset */
> -	if (MESON_PARM_APPLICABLE(&pll->rst))
> -		meson_parm_write(clk->map, &pll->rst, 1);
> +	if (meson_clk_pll_wait_lock(hw)) {
> +		/* disable PLL when PLL lock failed. */
> +		meson_clk_pll_disable(hw);
> +		pr_warn("%s: PLL lock failed!!!\n", clk_hw_get_name(hw));
>=20=20
> -	/* Disable the pll */
> -	meson_parm_write(clk->map, &pll->en, 0);
> +		return -EIO;
> +	}
>=20=20
> -	/* Disable PLL internal self-adaption current module */
> -	if (MESON_PARM_APPLICABLE(&pll->current_en))
> -		meson_parm_write(clk->map, &pll->current_en, 0);
> +	return 0;
>  }
>=20=20
>  static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,

--=20
Jerome

