Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07401CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 08:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VU8uRCsjTSwrlvmYL3d8u/PULJsMie63xUHiHDK3zBs=; b=Kb1qzvMVcsbNJBNujmIRUzHyNW
	h2ac1H1SsKfCq4dsXvLmo9i2sqOBXK7yOwMvlBZIDtBnENe+rDhcBis6oxiEtOwOS9eJCleYP2mFe
	C+6D+DCTSUJWlI9sSlHPtGPrRPtjq6c2V+vZ/UA6aL6GiBGiIn6kF3/3MWoYRSPGbkZ7A2JDM0aTt
	26/ksatyBpTcRLAjgx5/1NXBtz+07ZXBwX0V/QH1qZMfzWlCadHgUik5B0qEq8utGbumCFEzZd0FY
	N/a2lmXXQi8W+l+P67mW5Y62vnhFS0gpLIg0+ZDV2MGw1IxvXzD7mDbazlGt+J6MCzkiU0hf2Gp4o
	gxTmvpeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEODY-00000003lzV-2dQy;
	Thu, 30 Oct 2025 08:41:12 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEODX-00000003lyl-0x7U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 08:41:12 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-421851bcb25so426119f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 01:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761813669; x=1762418469; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VU8uRCsjTSwrlvmYL3d8u/PULJsMie63xUHiHDK3zBs=;
        b=r3zylcjZXR+M/aCSjnZspTUqmFu5gtogAqs+BjBAg4Cg9ZKJQAl1g2JnNqSd2goUDf
         m5bK3p6rQEKNeYoSZEWoN0VI9sO5wtKT2sZEp7H+5hRm+q+7EHwXDzRY8W92BEoi3wTt
         sNVccADaY8En/ibAtHsV7eUYZdlo11pg2zEKegct5+AAb9+lznhCmymWwaN8vxfOOyrE
         Xk9Csef1XVtvAlocj6GVaBH/n9IR1VgyxrPJazBEazg1B+PZmGD1yh2wtMk3sgjucrlO
         NZzhoadfZKqFUND5LU4uxCX9zCENHMF2w6YF6IbOWFAzNn+LL4zgLv3K/xds2QpFny0O
         QKFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761813669; x=1762418469;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VU8uRCsjTSwrlvmYL3d8u/PULJsMie63xUHiHDK3zBs=;
        b=cnDN+90PpJ4blacjET7BbJ5WvGJA57ymFSZcDXct7j+2CqmEBj/K42k+IExK1Nrkj3
         3ZYQ5Od+Vuh2ugwGns4JFRm29o1brVBHYIOM1gfGtdtSA41clRkQAx6jhHu7/h94mH8c
         ot34hXG+5le/qY6lrM1we1JoTUdTSE5YP3poJMZ69kxJKv/OGTdNis2HnSTg9zITfZ39
         rF6FKHu1TrqaqS2YPIx3xIdKTzv0IQnr5hJsCdN8qaZoBghpY3hLCjlOggUthL3dv6Oy
         I6BJz1s4P1kNePoNN+8H/kG43Kj41Sl1Zh1rcysYlRzAZQrzXw4fEPpRK6XOf8N5zGp2
         6Y3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX+rk/jdguoZZiauN3SP3lsn6ByujnUqWahoCJqWRVjWQwtXwD4Yv51y5r4PA0sGEv8mAFMboOKT7kyiVbO7t9v@lists.infradead.org
X-Gm-Message-State: AOJu0YwWqZm8y7tRZAlqPRMf4Qf0hYi0Hsdi+EdaT6DJME94Fx560gr+
	6lYu4LPLRKH4Oqtqh7i3wPLGfSNbDmt2/ryZS/JgLveIfzTDrUxfIqGrYH9dq6aOWpc=
X-Gm-Gg: ASbGnct/uoVgywqXnfwaQ7fob6jHZ4mi2oFWvnl1NvcQ9683CRR18JL4Ho7TblkBU/3
	krLHft8QhpZWf4E6wDWJe8C/y62/2zS2Qa0rMBrKCYAAixDnR0rPy4W9YCJwFXuGdB4Z8AZSWJs
	cUCTsNRE5JMr+ifLbN0SWOQH8suE1lcy6PKbstos7atZroDcL8/2hlha6VE8Ea2G2ewqpXkFByh
	nYYuYtYEZSOFS63t7xH5xYPaJj7riM0UI+GDNprGdYyTg0FQTKNTPkMgXJZXNdwH7E8hN6HrV/2
	8BLwTrIj4hBk1EgsTRMd6H6HEjtifNdXdZBk2Xyxo/qATwqXBTYqZtE7QwjH7PSbsTbdq+KbiPi
	gm/wYxstTcRXMc5Nv7lA12D1/tFO4IIFyecHX9h/Kq1s5OkB9G7L9vTkBrKAIkrnrU3t7l3Znaw
	==
X-Google-Smtp-Source: AGHT+IFwKPzXQBj8+qdUcovmW5nKytQ1wr3jkj35PQinv3BFL4IiVgDQRKAM+0DPrZKXF0WjOPRCMA==
X-Received: by 2002:a05:6000:25c2:b0:429:8ceb:ac3d with SMTP id ffacd0b85a97d-429b4ca2f6emr2088198f8f.56.1761813669384;
        Thu, 30 Oct 2025 01:41:09 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:64bd:9043:d05:7012])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477285d1e43sm32002085e9.0.2025.10.30.01.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 01:41:08 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  chuan.liu@amlogic.com,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  da@libre.computer
Subject: Re: [PATCH v2 2/5] clk: amlogic: Improve the issue of PLL lock
 failures
In-Reply-To: <20251030-optimize_pll_driver-v2-2-37273f5b25ab@amlogic.com>
	(Chuan Liu via's message of "Thu, 30 Oct 2025 13:24:12 +0800")
References: <20251030-optimize_pll_driver-v2-0-37273f5b25ab@amlogic.com>
	<20251030-optimize_pll_driver-v2-2-37273f5b25ab@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 30 Oct 2025 09:41:07 +0100
Message-ID: <1jy0osye70.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_014111_280955_F3C3657A 
X-CRM114-Status: GOOD (  18.23  )
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
> Due to factors such as temperature and process variations, the
> internal circuits of the PLL may require a longer time to reach a
> steady state, which can result in occasional lock failures on some
> SoCs under low-temperature conditions.
>
> After enabling the PLL and releasing its reset, a 20 us delay is
> added at each step to provide enough time for the internal PLL
> circuit to stabilize, thus reducing the probability of PLL lock
> failure.
>
> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> ---
>  drivers/clk/meson/clk-pll.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 629f6af18ea1..f81ebf6cc981 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -368,11 +368,16 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
>  
>  	/* Enable the pll */
>  	meson_parm_write(clk->map, &pll->en, 1);

New line

> +	/* Wait for Bandgap and LDO to power up and stabilize */
> +	udelay(20);
>  
>  	/* Take the pll out reset */
>  	if (MESON_PARM_APPLICABLE(&pll->rst))
>  		meson_parm_write(clk->map, &pll->rst, 0);
>  
> +	/* Wait for PLL loop stabilization */
> +	udelay(20);
> +
>  	/*
>  	 * Compared with the previous SoCs, self-adaption current module
>  	 * is newly added for A1, keep the new power-on sequence to enable the

-- 
Jerome

