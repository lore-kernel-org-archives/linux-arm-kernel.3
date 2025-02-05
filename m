Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709FAC02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Feb 2025 15:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jXKQZYwIMRdWb1WTyhDach9eNkGuIVB94zg4DR+3xaU=; b=y0wumUp1RD9bw23h/vMYcepcJl
	hTwErScAtFN/sMLD0QljrhsSyqs/cV4SH3825/hN9KrKXtabiJDB30WDjh5XdusLTuWo8Y0VIMXci
	x6aUML//TLKAigNrnEKOuheYoFxJtDTQWD7zHBT/7ahaxdhEXL6CGVuDlpeWZrtI6/pHZFFDf69Df
	WBeKR+L8uPWllcaiqApU+uAf0AOiYbEUXhoUdXOg7r76DJT59NbAcjqa9caMIx8d4uWRbKcj/QIHj
	Y5tQnRwr4Rx2Zb0cPAa53U6IszcrBchPgdX2DJrXrZYv+HdBxWGQV7lM8eGZTIR+4QjfFPcpMVTjJ
	V7YDlD7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgyu-00000003hKU-12h3;
	Wed, 05 Feb 2025 15:06:24 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfgsj-00000003gPH-2Jmp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Feb 2025 15:00:04 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-38dabb11eaaso1059937f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Feb 2025 07:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738767599; x=1739372399; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jXKQZYwIMRdWb1WTyhDach9eNkGuIVB94zg4DR+3xaU=;
        b=yWLB0SuA4W6OS6jABkJqM5GfoVeCRoIQlS9vcd5GynM3UaoU9rphTSpe0hsc8xu17H
         T2yqlY2BJEFPmziYrlmmy7UKHmELaOAsIRm3JpeMG3tvqn6vz706hEN7JbulAsWN0Ysi
         WeMBM8XeiAa+f1WBdHk8uqfOhBIjLBE6MJCeOlAPTc2tHSjCE3KoYDsO/Ww4JbHa4rIN
         pzJMTbLnTbtJ/FJ7PHBXh1hy1moCWTxGt0AKTiN3KG4dB5TDhqJ9jQWLpjakJiC2abKH
         olx8eJkPDQrTBSj4DqmabtnzSFTIlP4OVSxlpWmKmj9FrUhMspjFWgWTZv08ztNSeEbE
         sRug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738767599; x=1739372399;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXKQZYwIMRdWb1WTyhDach9eNkGuIVB94zg4DR+3xaU=;
        b=GbjsRJS2DD4He/2D63QcYBIbTa2WephaKwOI/MKY3PimKUz1AvLIV3Y1X1qEDyP55I
         joj+n0ob+Zwd0hh+tmkuk/VAPL9HBJAm0vzevqvU3Pzo8Yn04YgrBNATAKL/tg6/vf5U
         75H/KMOtvqX+IgQUuB5brVHS1gqRTrVqWovvUiumrCrI4bbJ7rEanBJEzneuh4s8UcPc
         sFQyuW+hj+zqzrf63X2Xiq5iEJ1+TbFQE4yv1Cr8jlpzxJcT/jOVl+VtIZ2Ro78HpDlc
         7cJTrE83qFrkdl/ZTbt9X4LCjJYfrdfLjatS1dSRnibaghAPnKyk5pJJAc6PJaadIQOk
         4HuA==
X-Forwarded-Encrypted: i=1; AJvYcCXjtI1qQTuq7Sd9Oxy8gaggI/I1rG/zL4sInqk3G53GuXRayPcaeNKUkTg+gjtL384i4P6q2mU//3242MVlgm2H@lists.infradead.org
X-Gm-Message-State: AOJu0YxqywfZgZXaDTCAJ5z1Rdrd37rcL+nw8Bptwz8fmDsy9kgwR53B
	sEsKxuvTNhTlhg71xNyVxaXXUjCYfp+QVYHbEnXnFJi9g/sLhyYaAJ+ePQATfqdyfxlvMjYb10t
	5IZo=
X-Gm-Gg: ASbGncvBCb5IhEOulMEvq4uhcXdWESNsRvrHM3Yy8tqUUtA1A/2RShP2+nGcTj6oJND
	44OaZRrvqf6NLL71YwLG4UmOrf3KDPP9XdbA5edoB78ivhIRHMBROoGZKyOZ7p9AdrFw7hipALH
	poA7pZDBIhvY/ZLGl7H1asaMuOYhODFfx8PHie0s6bvfsIcwf4K6+TNM6NBhKQhpc+i6Lb/Zyiu
	rjmKp5wjtrJMh69+xCcpBMuHbcgSSDcQyBgNonyUQSgwPOXCg0eH1kuWcFSoI9UqICUSzginKtc
	5zR9QjFz/FeV4rQ=
X-Google-Smtp-Source: AGHT+IHwhmaSRrFFNWvkKMkvBDoo/mSQ2n4IGzbyDDbD6YkLJZIfCEMLSF3RcPUjOCdhwhP+nUxtfQ==
X-Received: by 2002:a5d:4cca:0:b0:38d:af8b:6d73 with SMTP id ffacd0b85a97d-38db4889c49mr1918537f8f.26.1738767599221;
        Wed, 05 Feb 2025 06:59:59 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:a66c:715c:b646:6f06])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dae1a1e4bsm4765667f8f.55.2025.02.05.06.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 06:59:58 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/4] clk: amlogic: drop clk_regmap tables
In-Reply-To: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com>
	(Jerome Brunet's message of "Mon, 20 Jan 2025 18:15:29 +0100")
References: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Wed, 05 Feb 2025 15:59:57 +0100
Message-ID: <1jlduksahe.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_070001_836525_2688D153 
X-CRM114-Status: GOOD (  19.08  )
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

On Mon 20 Jan 2025 at 18:15, Jerome Brunet <jbrunet@baylibre.com> wrote:

> This patchset removes the need for clk_regmap tables in each clock
> controller driver. These were used to populate regmap with in the regmap
> based clocks.
>
> This saves memory and is the 1st step in a series of rework of Amlogic
> clocks, to clean-up, increase code re-use and ease future maintenance.

Hey Stephen,

Are you ok with clock core part of this patchset ?

I have more clean-ups on amlogic clock queued after this. If possible,
I'd like to be able share these in this cycle.

Thanks
Jerome

>
> Changes in v3:
> - Fix some typos
> - Link to v2: https://lore.kernel.org/r/20250117-amlogic-clk-drop-clk-regmap-tables-v2-0-d1f77cb0773e@baylibre.com
>
> Changes in v2:
> - Add clk_hw_get_of_node and kunit tests for the new helpers
> - Split patch adding the .init() and the dropping the table
> - Drop devres based solution and something temporary but simple
>   while a more generic solution to hook controller init is discussed.
> - Link to v1: https://lore.kernel.org/r/20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> Jerome Brunet (4):
>       clk: add a clk_hw helpers to get the clock device or device_node
>       clk: amlogic: get regmap with clk_regmap_init
>       clk: amlogic: drop clk_regmap tables
>       clk: amlogic: s4: remove unused data
>
>  drivers/clk/Makefile                    |   1 +
>  drivers/clk/clk.c                       |  33 +++
>  drivers/clk/clk_test.c                  | 116 +++++++--
>  drivers/clk/kunit_clk_dummy_device.dtso |  10 +
>  drivers/clk/meson/Kconfig               |   1 +
>  drivers/clk/meson/a1-peripherals.c      | 163 +-----------
>  drivers/clk/meson/a1-pll.c              |  16 +-
>  drivers/clk/meson/axg-aoclk.c           |  22 --
>  drivers/clk/meson/axg-audio.c           | 433 --------------------------------
>  drivers/clk/meson/axg.c                 | 131 ----------
>  drivers/clk/meson/c3-peripherals.c      | 210 +---------------
>  drivers/clk/meson/c3-pll.c              |  32 +--
>  drivers/clk/meson/clk-cpu-dyndiv.c      |   1 +
>  drivers/clk/meson/clk-dualdiv.c         |   2 +
>  drivers/clk/meson/clk-mpll.c            |   6 +
>  drivers/clk/meson/clk-phase.c           |  11 +
>  drivers/clk/meson/clk-pll.c             |   7 +
>  drivers/clk/meson/clk-regmap.c          |  49 ++++
>  drivers/clk/meson/clk-regmap.h          |   4 +
>  drivers/clk/meson/g12a-aoclk.c          |  34 ---
>  drivers/clk/meson/g12a.c                | 261 -------------------
>  drivers/clk/meson/gxbb-aoclk.c          |  19 --
>  drivers/clk/meson/gxbb.c                | 393 -----------------------------
>  drivers/clk/meson/meson-aoclk.c         |   5 +-
>  drivers/clk/meson/meson-aoclk.h         |   2 -
>  drivers/clk/meson/meson-eeclk.c         |   4 -
>  drivers/clk/meson/meson-eeclk.h         |   2 -
>  drivers/clk/meson/meson8-ddr.c          |   9 -
>  drivers/clk/meson/meson8b.c             | 200 ---------------
>  drivers/clk/meson/s4-peripherals.c      | 341 -------------------------
>  drivers/clk/meson/s4-pll.c              |  31 ---
>  drivers/clk/meson/sclk-div.c            |   5 +
>  drivers/clk/meson/vclk.c                |   2 +
>  drivers/clk/meson/vid-pll-div.c         |   1 +
>  include/linux/clk-provider.h            |   2 +
>  35 files changed, 239 insertions(+), 2320 deletions(-)
> ---
> base-commit: 1909d0d351ed98fdb9f5cbe377213ba0154bf2e0
> change-id: 20241220-amlogic-clk-drop-clk-regmap-tables-18e5cf572356
>
> Best regards,

-- 
Jerome

