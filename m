Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D24C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 05:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EriOcw6Ti5BC4myF5JQ02kFXKB9Pwigas67q+yAyzZY=; b=PttIjrYXqniXUh0gyRpdYkd1JI
	1I0rLA+q65+OQ8jkNDO8PW4NhuAinKZDDUiclbRjDFVDy9PweiaEkzVwNg2ne0i51LCjrLxRuWxS8
	wOjcswjW1EKR2SEQxrS255/+5aSQyIMxk906Bu1K4RpHgkK12tzqUj2vSZwd70S9XZmNPBTjtIRxe
	Hwy/UN7P0BdIFarphYG00UtpmcwmQ63OVw0a5qsueql2QujFLvj5zc8SEYyKMzS0v4TByjMMH66m5
	NZ+23NqTGI9ui/4XOaUoexWKVryjhtb6uqUZRkKBzTJwINS1x4v2OmfaXP0QFTwG9XshrWUr/CANv
	/CxX5Mfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubYE7-000000046fJ-2vmB;
	Tue, 15 Jul 2025 05:29:15 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubYBf-000000046Gj-0AO9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 05:26:44 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-54b10594812so4941633e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 22:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752557201; x=1753162001; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EriOcw6Ti5BC4myF5JQ02kFXKB9Pwigas67q+yAyzZY=;
        b=kam0cDcqiCOFFv1dC0j9X80Hg+eHk5+OD31gtjI2fY6yjJgQyMcCktzX8lJh/N/g3y
         t923rnULTSqa/AD5IUHXuVi0AIDSSSJRwg08+sHRQdplE+WxLWsNg8EchDGWK1iReoR1
         sBXnThAcEq1TMgGtijQcB/2PhFr6wSBu8pi2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752557201; x=1753162001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EriOcw6Ti5BC4myF5JQ02kFXKB9Pwigas67q+yAyzZY=;
        b=Fhe6mCTeOUDfDBvc/b2BqyjqSgmpSfLd5uZdbwDCXgVGbCDQkyx1RVFGa+d+OkL24Z
         3OVMFfJCtkzChHT9HeqCQblYqttdcNuhIlEv/gZaMvtpiqRSAu/1yT5WvQmfRx7EdUdF
         s2YyVP5zNLUz5D58rlQg8X21drfzSN99dpqzO0B3ify8o/KolTG9Sq1nJmdRwRyFsW7m
         BuDyXJh6WDn72B6rUCnn5axdT0s6AN8VlQXqlpP8GXlMWtBe+Bm2m0XMMAy3bGzXFJFX
         HdcOd++tti2cIOifW2E1AY740zwedYKzgYPY1aR3HYzWuDGw8Gq0NlwQcaDzO0q/BMXZ
         N0Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWH5HQ06YjwA6sEcHyh5dQTFusByILKiQhklf5/mISAP3klP8C3FYmYtXwgPv+6/KPHJo+dcJkDKgDkbwpk5zup@lists.infradead.org
X-Gm-Message-State: AOJu0Ywnvq7DKJJbXN7YCSQf0wTivYYGvWQzIx53yNT68+CCCTNL+xMQ
	YPpxLY3zhV8ByENN8k5/BB9N4W4PukIU4Ifm/H/7EeEsUr3SXJTfTJPyY6xJylAOA9v2EPTCphZ
	7YAE57spGcthT28Y1gSjSlXzdkjnc4FhUYFowmO3/
X-Gm-Gg: ASbGncti1IagF7So29AcUtU1YIlDYMqagOnBBNXDy+xM7WhaFGvl0nGMlAfM+JHv0q9
	gjcmRqOWeI5bWmqyEAIOO8i1nBA6Gmg35Gz3I2SddoXI4QfAGHiikux8F4+EC8TXOzompQyE9JM
	bWfK3Z3bKqNKl+gEiZ5Ok7Y8kEN8WY/i031H+NupeQTWZ4GHcyJQYxqtSXGU3aob6Zb5tvDcta5
	x2YqWGtRmnbFIYCu//lFT5zZ37EtAdqiwY=
X-Google-Smtp-Source: AGHT+IEQf0W1yeQYNRbpUyAxFlgjb3kYw5Q0BNqfDsziWw7aP+1TqaYvLMXYRwQa9tomb76nSKuU56uoGnkXehDyLpc=
X-Received: by 2002:a05:6512:3b9c:b0:556:341b:fb0a with SMTP id
 2adb3069b0e04-55a044ca226mr6271614e87.15.1752557201192; Mon, 14 Jul 2025
 22:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250624143220.244549-1-laura.nao@collabora.com> <20250624143220.244549-13-laura.nao@collabora.com>
In-Reply-To: <20250624143220.244549-13-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 15 Jul 2025 13:26:30 +0800
X-Gm-Features: Ac12FXx0XfJFXA_DIIE4IblGQiwtiWyeXBGiD295gCS64kpCUO8jzl3QeCZ10ZM
Message-ID: <CAGXv+5EWEsLBS86G828ezpnD3x-MaC3F-AtyGFyzKxPvZ0GcAw@mail.gmail.com>
Subject: Re: [PATCH v2 12/29] clk: mediatek: Add MT8196 topckgen clock support
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_222643_123996_756C6C2D 
X-CRM114-Status: GOOD (  17.48  )
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

Another thing,

On Tue, Jun 24, 2025 at 10:33=E2=80=AFPM Laura Nao <laura.nao@collabora.com=
> wrote:
>
> Add support for the MT8196 topckgen clock controller, which provides
> muxes and dividers for clock selection in other IP blocks.
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/clk/mediatek/Makefile              |    2 +-
>  drivers/clk/mediatek/clk-mt8196-topckgen.c | 1257 ++++++++++++++++++++
>  2 files changed, 1258 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8196-topckgen.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefil=
e
> index b1773d2bcb3d..bc0e86e20074 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -160,7 +160,7 @@ obj-$(CONFIG_COMMON_CLK_MT8195_VDOSYS) +=3D clk-mt819=
5-vdo0.o clk-mt8195-vdo1.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_VENCSYS) +=3D clk-mt8195-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_VPPSYS) +=3D clk-mt8195-vpp0.o clk-mt8195=
-vpp1.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_WPESYS) +=3D clk-mt8195-wpe.o
> -obj-$(CONFIG_COMMON_CLK_MT8196) +=3D clk-mt8196-apmixedsys.o
> +obj-$(CONFIG_COMMON_CLK_MT8196) +=3D clk-mt8196-apmixedsys.o clk-mt8196-=
topckgen.o
>  obj-$(CONFIG_COMMON_CLK_MT8365) +=3D clk-mt8365-apmixedsys.o clk-mt8365.=
o
>  obj-$(CONFIG_COMMON_CLK_MT8365_APU) +=3D clk-mt8365-apu.o
>  obj-$(CONFIG_COMMON_CLK_MT8365_CAM) +=3D clk-mt8365-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8196-topckgen.c b/drivers/clk/med=
iatek/clk-mt8196-topckgen.c
> new file mode 100644
> index 000000000000..fc0c1227dd8d
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8196-topckgen.c

[...]

> +       FACTOR(CLK_TOP_APLL1_D4, "apll1_d4", "vlp_apll1", 1, 4),
> +       FACTOR(CLK_TOP_APLL1_D8, "apll1_d8", "vlp_apll1", 1, 8),
> +       FACTOR(CLK_TOP_APLL2_D4, "apll2_d4", "vlp_apll2", 1, 4),
> +       FACTOR(CLK_TOP_APLL2_D8, "apll2_d8", "vlp_apll2", 1, 8),

These aren't used anywhere in this driver, but they are referenced
directly in the vlpckgen driver. Maybe these should be moved over
to that driver instead? Otherwise we end up with some weird circular
link between the two clock controllers which doesn't seem correct
to me.

[...]

