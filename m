Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88120CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 17:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qTAyakvLktp/e+AMviKRZMNRnJVDyQcT2DmQsBGK+VQ=; b=2B/J2Uk6wsyQ4nTUzzsecPJUgj
	uo/KFllxexBU7xdDEARwEStbSB4ow8EMD+frcsLm1CzWhMUckIyJANP7t9akjvSzcZk4CfVuXdVVX
	GPLWQbnuoNKRX9IhAXeGFsP/Ix5GCEDkNJvlVQOsvyn55dLWoSRiBpguiEp0M4sApeGTQrd7gvpfb
	D/giYrxd19gHJWkCJ9OiJzoBPukuxIeOY+aC9lDfwTaAZBN5qlzE7wdJ3iaPBE4sjnokpMey3OTm/
	FsvzMkw9VhVwN6MqhAYbhyGTr+rogZyN6Mu7gdjY3MHNYlkRIuDz+6NJbLwdkXUNWUDP9VrwrT9TY
	G192m4IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAu2E-0000000EXvI-4B6P;
	Mon, 20 Oct 2025 17:51:06 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAu2C-0000000EXuk-3LnT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 17:51:05 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47109187c32so22293955e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 10:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760982663; x=1761587463; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qTAyakvLktp/e+AMviKRZMNRnJVDyQcT2DmQsBGK+VQ=;
        b=emQ/vw9RMRyFhZpSEOyUIAkmwF5nl4PqpZSIDEwmWVcQySp/zcbBCF/W6N8bi3O09d
         euWzKo7dpo2vkMi6NmjAPVVFGZvGEU9BTA4s3flIYH9hzE67yhYE4HKVRQdJKtGod8vV
         NsRnRdVKO+1FYsvC/S4CIEKpeR3CC0zxj9OL5OoqvVRazuff3eLFcDLyJij3muaTzKIq
         VcK3gKIi7+MOt8oVIzNmies/rNF95FK9b2IuloEOtIWdMmOCjQd645ewMV+FY1uS8/Qi
         9xK8h/pVbdLL6G9lY5uvPwhuCDXrM2CKugsz8uxiSmphMR8gpmtijvzOdpz3g8Srpsye
         A+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760982663; x=1761587463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qTAyakvLktp/e+AMviKRZMNRnJVDyQcT2DmQsBGK+VQ=;
        b=JjFGgHksesFR7HnyYLjVTsmkuIUOjVP3C8d8phI1hIoUGmgZ27Il4GxAX7hnShOccg
         MkYdzbmFFtDUA6rm0A9C2imFEmvEhCV6gNmZKeprAICkSzEm5nKIa9VVsxJUmuBf9beg
         4hvpbphN9PG/OASQWIpTkffNgq58WgQ3qWBqMddhduZxPmpqMvdB3YjICyKJ6feGHi89
         xG/myY/WhRCqPdqqGOjVskySlUfFyw947NU3Y7HuHM38xiT1K54IP9ZzTzwvG5lJPkBD
         t2tyovXfll1YwlqvdQGYx3dvEew3sJuBNbi5JJy3zOVT85c98FtPtln9zvRT0NRxK+Sa
         EK1g==
X-Forwarded-Encrypted: i=1; AJvYcCUXvcChHK5X3aj0warxsTfoxbqWwUt/voaKJYLDyNNO/Yrd0lZL78qEdN/7HweX6V5FOHBqosFXeEHDPUXnlagX@lists.infradead.org
X-Gm-Message-State: AOJu0YxYPrwOMPdTElDVTgnErcfdAqwnfoR7fL1c2qptwnrH26WG9qsd
	d5tOsdOLSC/Q8k8HGi4gpp4I1jkHijYfKtV7FxVUUeBzxRAexWLypfEW
X-Gm-Gg: ASbGncvj/znQqlwMlk5rs6kkwkXep77X5M6QGZj1iY7ofcVETFD25hfX/6Zok+ljZe7
	/p7LwkWbaFJ57na9D3S2Pek84dbcAdDsf8t0bam0J3eNcyqc3zmhEhkl9y56Easysifdz/NI7Ip
	8btu5E+W8lWLNyxkDCuVRYoVQVybX037JIHtQ6s65+oHaL1izaIx1m2ca9Jh2m+O5Jz65LHKpDr
	IjF6s559zsTLw68M5cMhDgSGRdbttqkM+e5B14ji/krOK8sVgF94r5qIS0nnXBSr5yntad5l3Kn
	yUMNkeMAuEv9BG2ybxQ8jm0HByE8wABRTlN4AHF7mZOXM28tfy6y7UaAvtHemqTxkX8SwWRluhv
	32g9IwANup8FjP+wDtQpq1GNGc5J3K+3HSFueyhHEaOOIt02d6cYvGrJFsDX8iNxakCR0HtenI9
	PEIDtmj5zagI3axapgveIU4hNtFrm1AxfmoQbdlLLEXSws0z+oecVP1oqNk9hQv7QABlQine2Q8
	sBGR6g=
X-Google-Smtp-Source: AGHT+IEf+pLydZZJlPsNS9klI6Ppz7HfqYBrVGwlK2LGcq8ett6vc+FT1k0DRHTRyZXn1XwlZQ3W5w==
X-Received: by 2002:a05:600c:444d:b0:46e:4cd3:7d54 with SMTP id 5b1f17b1804b1-471178b124amr91678925e9.18.1760982662640;
        Mon, 20 Oct 2025 10:51:02 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4715257d8b2sm187794005e9.3.2025.10.20.10.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:51:02 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Mark Brown <broonie@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/11] clk: sunxi-ng: sun55i-a523-r-ccu: Mark bus-r-dma as
 critical
Date: Mon, 20 Oct 2025 19:51:00 +0200
Message-ID: <3374980.aeNJFYEL58@jernej-laptop>
In-Reply-To: <20251020171059.2786070-6-wens@kernel.org>
References: <20251020171059.2786070-1-wens@kernel.org>
 <20251020171059.2786070-6-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_105104_853790_ED9DA091 
X-CRM114-Status: GOOD (  18.95  )
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

Dne ponedeljek, 20. oktober 2025 ob 19:10:51 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> The "bus-r-dma" clock in the A523's PRCM clock controller is also
> referred to as "DMA_CLKEN_SW" or "DMA ADB400 gating". It is unclear how
> this ties into the DMA controller MBUS clock gate; however if the clock
> is not enabled, the DMA controller in the MCU block will fail to access
> DRAM, even failing to retrieve the DMA descriptors.
>=20
> Mark this clock as critical. This sort of mirrors what is done for the
> main DMA controller's MBUS clock, which has a separate toggle that is
> currently left out of the main clock controller driver.
>=20
> Fixes: 8cea339cfb81 ("clk: sunxi-ng: add support for the A523/T527 PRCM C=
CU")
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c b/drivers/clk/sunxi=
=2Dng/ccu-sun55i-a523-r.c
> index 70ce0ca0cb7d..fdcdcccd0939 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c
> @@ -121,7 +121,7 @@ static SUNXI_CCU_GATE_HW(bus_r_ir_rx_clk, "bus-r-ir-r=
x",
>  			 &r_apb0_clk.common.hw, 0x1cc, BIT(0), 0);
> =20
>  static SUNXI_CCU_GATE_HW(bus_r_dma_clk, "bus-r-dma",
> -			 &r_apb0_clk.common.hw, 0x1dc, BIT(0), 0);
> +			 &r_apb0_clk.common.hw, 0x1dc, BIT(0), CLK_IS_CRITICAL);
>  static SUNXI_CCU_GATE_HW(bus_r_rtc_clk, "bus-r-rtc",
>  			 &r_apb0_clk.common.hw, 0x20c, BIT(0), 0);
>  static SUNXI_CCU_GATE_HW(bus_r_cpucfg_clk, "bus-r-cpucfg",
>=20





