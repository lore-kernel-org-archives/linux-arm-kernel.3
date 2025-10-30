Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A2E8CCF9FA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 08:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wQpNXFj7qvzhx2BPwql3tijlryztnIxnxGrC8hqO70I=; b=zhNrZMWv4pWmX9DUPI+ZK1Gkc3
	CvJc+uc6vYyFlJhHDR5XCiNCQCmD1p1BwaWbMD8R/57k6yeUJW8qiBj/6xsk5HBA4jyXP3yXBs36I
	vsatORcY77ObqFeAqVkXTuVCnDUl5Q4BriyD3LmwtEpxm48VHLZpqHmXQ9lLYKN48iDdRt0e6R1ki
	1P+5g1wbr4CyBVd62qcLSMwNYUpI/0KIE5Zuhzuag+7vhJs8CSDCVCRyvUmPFTfSE+K85/CWWW9qf
	oJ1yvoRE/DmvpHufrA4s4uhDv3Baf46QUt5M2M9LTz/UeIGdNXn3HTyTz/bktrJagPWVme6s54QmP
	CUUOQr7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEO5D-00000003kqh-1qgc;
	Thu, 30 Oct 2025 08:32:35 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEO59-00000003koY-1fZp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 08:32:33 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-47710acf715so3798495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 01:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761813149; x=1762417949; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wQpNXFj7qvzhx2BPwql3tijlryztnIxnxGrC8hqO70I=;
        b=q4BWGevMV4Um+feUwE1u1f2aKjWIAlx47mQxF0Eg+VLca6/gteNCgeWbYBGkk8lqV0
         96B0y6Y132WikE5WZs8dA3dXUEFlPbHsZWC/B9vtxFLxLPIkqcNoyfzB0WQ05pBVOueN
         OxfppWjErzm6t/7aGA7pcF3wGku67Rpbnk9tLvcFiEiw6M/YoN0WE2akZN6+6UmT2ppy
         Am39+LPTauVIHqXLTreqOyXruHWGdIZNjpM7bvNuUSa7qcwrgxexZoTJijKRzMcAdGOe
         dHrck5ESJgY1MzOU80uEkMM77y06BJvRDYCE929hLQtTUvEjn2rytqH7ORCuj08R28rg
         h5Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761813149; x=1762417949;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wQpNXFj7qvzhx2BPwql3tijlryztnIxnxGrC8hqO70I=;
        b=hamB/mhC4jn7GbpBh1irDQk3xawuhKf+1HPUZuN3bW1Y/LOb9VG6v6WamexSjwxGfd
         Lsn5xlzHd/eVND9Bj1m7uSDH41vi82vFzAsjLa8trYex6u+DDyG8pOtJ3q5dhSwxaKqq
         PbGiaGMnYzZKYb90rOUhrgJ01ITtNOHYbbhNWFkl01TvST7LIei0c/Qg7e3eVYKd1mVN
         yR7JjJCC+NoiJ9xiL2hBITB9dPdlShjSOLQNd2nr03IO8Zoy6OK9umkzWfatBOd5CCnz
         iEFKh/0qHFgrqk1p9pR3HRYCmsAJiXiU/p1my1g7yCVoGXiJiToPLggOhezK16VCHFu+
         Q1WA==
X-Forwarded-Encrypted: i=1; AJvYcCUpW4sTqGcsYpuRZdHwMqabjoYWP8Z3rtUj7A52QYxELJyTV38vxPu+YydzNHJNRJys0gTVq0dEXyXagpwJkuck@lists.infradead.org
X-Gm-Message-State: AOJu0YwQsKgS7+4HYyYpFRfYw0Vdo/aRfQosJ8nUR7NzKWybdyJDps2S
	mvhRa5eTJ8pgDjRF1ku8BOn5e6Wgi8/tTa7r2hs+juMnorYuedQTrt94A8vHvpPoGA4=
X-Gm-Gg: ASbGncurJhYptxOucbsjhD01WspOSrQ/eijUe/dCOCSRhZ4MjQDnmy3KAPb0lpRA1X9
	Kfumn4DVbkTzmdpX/1zP5Mc5m3neflDDLfA3qAHSGjHsrD8KOJ02S9sQ5Va4b2gLhxvLLJvymge
	xlTz6hP44jmzhO/Gd0lxOfFpWU1GIlunkYCnaH8q5DSTV+M+a/RuAGioWsN7safnK73avDttGdH
	IW+QbI3gf4A0OD6BAYf8El3jiZ7FJWv28yp1dOxyF75+JVxbbpLDn4DCcONqWCxEjl16UrDWJ/R
	hscULV97WGH4wr/KhabUZ+1HvyQ27BnWxRaNhodG1rx1qDjL3Yq45N9FVTckN09mFTGbUzYx6/1
	g1MrbE1aoK0xvuCWqgfDIWV9a0beVWfyu1RXwPNyPJALolhXMGyMGoaCxrIvd7QZQm3OyaHryvw
	xQe2RFwjN2
X-Google-Smtp-Source: AGHT+IF53HCqpWXmn28GEFR5xxqhKQykU6oDGofkTXxxX4sugVLIN1Bm6oCHAyukU29ODdUC1YBslg==
X-Received: by 2002:a05:600c:1c22:b0:46e:5100:326e with SMTP id 5b1f17b1804b1-4772686f074mr23463575e9.23.1761813148710;
        Thu, 30 Oct 2025 01:32:28 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:64bd:9043:d05:7012])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47718fc0335sm62830805e9.2.2025.10.30.01.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 01:32:27 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  da@libre.computer
Subject: Re: [PATCH v2 3/5] clk: amlogic: Add handling for PLL lock failure
In-Reply-To: <20251030-optimize_pll_driver-v2-3-37273f5b25ab@amlogic.com>
	(Chuan Liu via's message of "Thu, 30 Oct 2025 13:24:13 +0800")
References: <20251030-optimize_pll_driver-v2-0-37273f5b25ab@amlogic.com>
	<20251030-optimize_pll_driver-v2-3-37273f5b25ab@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 30 Oct 2025 09:32:26 +0100
Message-ID: <1jikfwzt5x.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_013231_477992_E2AFEAAD 
X-CRM114-Status: GOOD (  21.44  )
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

On Thu 30 Oct 2025 at 13:24, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:

> From: Chuan Liu <chuan.liu@amlogic.com>
>
> If the PLL fails to lock, it should be disabled, This makes the logic
> more complete, and also helps save unnecessary power consumption when
> the PLL is malfunctioning.
>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 41 +++++++++++++++++++++++------------------
>  1 file changed, 23 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index f81ebf6cc981..6c794adb8ccd 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -353,6 +353,23 @@ static int meson_clk_pcie_pll_enable(struct clk_hw *hw)
>  	return -EIO;
>  }
>  
> +static void meson_clk_pll_disable(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
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
> +
>  static int meson_clk_pll_enable(struct clk_hw *hw)
>  {
>  	struct clk_regmap *clk = to_clk_regmap(hw);
> @@ -397,29 +414,17 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>  		meson_parm_write(clk->map, &pll->l_detect, 0);
>  	}
>  
> -	if (meson_clk_pll_wait_lock(hw))
> +	if (meson_clk_pll_wait_lock(hw)) {
> +		/* disable PLL when PLL lock failed. */
> +		meson_clk_pll_disable(hw);
> +		pr_warn("%s: PLL lock failed!!!\n", clk_hw_get_name(hw));
> +

This is something that's likely to spam, so pr_warn_once() (if you must warn)
and I don't think 3 "!" are necessary to convey the message.

>  		return -EIO;
> +	}
>  
>  	return 0;
>  }
>  
> -static void meson_clk_pll_disable(struct clk_hw *hw)
> -{
> -	struct clk_regmap *clk = to_clk_regmap(hw);
> -	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
> -
> -	/* Put the pll is in reset */
> -	if (MESON_PARM_APPLICABLE(&pll->rst))
> -		meson_parm_write(clk->map, &pll->rst, 1);
> -
> -	/* Disable the pll */
> -	meson_parm_write(clk->map, &pll->en, 0);
> -
> -	/* Disable PLL internal self-adaption current module */
> -	if (MESON_PARM_APPLICABLE(&pll->current_en))
> -		meson_parm_write(clk->map, &pll->current_en, 0);
> -}
> -
>  static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>  				  unsigned long parent_rate)
>  {

-- 
Jerome

