Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B0B4CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 05:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3pbQnf8CUqRojAhpUlOIMWVPCuywXIR601pJXOx+Vk=; b=yI3u4PDkgfPfSlHMQMbCz7U1lh
	a+mbPUIVjIUoqV5qOMZwvmCiVBHpZ1uCh9ghpipCgILBDPsxCZN9f2zP3glyPzTCSYe/79olAM2G5
	qZSQYZ0R+GLVG5M+9tqgg5PpgVcQxXF3bNDwSfHNPlRipwBUnwjxrP/WEsLObQqQQ8LqhUkoLivjr
	kIM4njwNAMhhlnRu4Q1kulE3JWy9CH2S3qc7Xu5qgNeYLYrruqEctI8oPAtaartZ3oEju1CdTqli0
	CBlOLTo79BeFUNpWMqCgVDKEnrGVIGz1CcZPhluQgKMvw1CMZIVN4ci24O8bxZls5ITnx1kXs838D
	MBv5vKMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuOcU-0000000GsKA-1GkO;
	Fri, 05 Sep 2025 05:04:18 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuOZl-0000000GrkB-2szs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 05:01:30 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-333f92a69d4so16444981fa.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 22:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757048488; x=1757653288; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I3pbQnf8CUqRojAhpUlOIMWVPCuywXIR601pJXOx+Vk=;
        b=n2sL7LgWwxATxAuATFAHOfaRy60xKSCdzCDl1gROpf35CpP3xa44hkJ3pjQW6u3QAZ
         ZGeuaVHOgCPKAgIrCnQBV+DsXxM7mHza587W8i9JvJxdXBsNUgB9BFOD9MLWA/XGL+2h
         8AnYi5TZf3Cy/MyvSCYtUgx8eLsa+NCSctTRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757048488; x=1757653288;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I3pbQnf8CUqRojAhpUlOIMWVPCuywXIR601pJXOx+Vk=;
        b=pOsC2JeveQEMvxl33jee6/pRn2/yTOJ9U2BZOsV/eQF/OlZX90IZRMxUyjvuRD9cqq
         WG0kUSB9Q3YlCqi8iZuqZ87j8qz8zcHgzQUtFvnXJMfpBmDdNR72J5Fkv+/B+kska1Fh
         8bpoBOhoKHL6karVVFqPROKJaE+9Km69D8rDaHog6ld0LsrMNpZDeD9SWVmX3g9Vo1wL
         GMhUB8T7XXeTiM6jRPk7+5ny2nKlhZGIKMALdbEMcUi0FYfaA6xuFYFB38c4PkSwON4a
         I/vuuE9wY/DMc221ngoFx7XRp+6EuzFZ+HVBNgMB1nBrD6zRW8Xvf8sDBaixBNKukmtm
         RsUg==
X-Forwarded-Encrypted: i=1; AJvYcCUNcB9CLmo7CsJFDLXCjWD3mP4SnJ9VpX7FmNrHjcDiE28x9sN++W0SNbHKfYkFU7uvXapTWQTDMJDhWWkCpHub@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq8sWF9vhnel7aaQT1azi04zAgyiFUJOm+/+z8Q94V46ngi650
	vaTBaTGYYGYEm1BI7HbOOnQ/aRUYFbDoqZ2+l/SuSxRv5VSOH50ANwrUQHcTj31Iz+Ww8mGBuP8
	CcPB1+FNTlj/TVd4IJZDc/c7xGBXf6H6fY26LjXGt
X-Gm-Gg: ASbGncv9tCmNvj4yTbGRhvdlEi9QB398VQTCKvP/rcIj95pd7uvm0MPJWuBt7UwEXwz
	ocH44KNWuXI87V0dLnUaufG6vUc5SlPmtkdb1pzU6i+Vjpdgncnc/9HzKo7ozWEP5HWqyTW9zBe
	YHP7iL42BUk2SveHlzSBemmG5i7SdE5xJ2gi24uo7qyvPCejmpzp1bpaz2WtSorkbyFBpRNAjD+
	zeE09ZIKRtQHOhWFJNoISSf6SxabS1pIhTWJw==
X-Google-Smtp-Source: AGHT+IG10f/KUXsl9teEaeQj7H79dcAZoPGx48y81i6F/mMxgob5Z7ShaCVyVzMRSRmKn/PqDEFL3jvm3MNUmJiY2p8=
X-Received: by 2002:a2e:be1d:0:b0:336:dd88:6a02 with SMTP id
 38308e7fff4ca-336dd886e73mr50101251fa.43.1757048487955; Thu, 04 Sep 2025
 22:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com> <20250829091913.131528-14-laura.nao@collabora.com>
In-Reply-To: <20250829091913.131528-14-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 13:01:16 +0800
X-Gm-Features: Ac12FXxt8YDULnOSESMbWAKIOZ29Yui3hZN9Zs_7tmp-v_md5T4Hs_0EWckqSKk
Message-ID: <CAGXv+5E-EM6aMR3M=rk2HMT8qCn5J-zuqFtPJP0G1x7+Lj1gEg@mail.gmail.com>
Subject: Re: [PATCH v5 13/27] clk: mediatek: Add MT8196 vlpckgen clock support
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
X-CRM114-CacheID: sfid-20250904_220129_750349_D3C33F3F 
X-CRM114-Status: GOOD (  19.39  )
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

On Fri, Aug 29, 2025 at 5:21=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> Add support for the MT8196 vlpckgen clock controller, which provides
> muxes and dividers for clock selection in other IP blocks.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/clk/mediatek/Makefile              |   2 +-
>  drivers/clk/mediatek/clk-mt8196-vlpckgen.c | 729 +++++++++++++++++++++
>  2 files changed, 730 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8196-vlpckgen.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefil=
e
> index c415453e02fd..031e7ac38804 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -151,7 +151,7 @@ obj-$(CONFIG_COMMON_CLK_MT8195_VENCSYS) +=3D clk-mt81=
95-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_VPPSYS) +=3D clk-mt8195-vpp0.o clk-mt8195=
-vpp1.o
>  obj-$(CONFIG_COMMON_CLK_MT8195_WPESYS) +=3D clk-mt8195-wpe.o
>  obj-$(CONFIG_COMMON_CLK_MT8196) +=3D clk-mt8196-apmixedsys.o clk-mt8196-=
topckgen.o \
> -                                  clk-mt8196-topckgen2.o
> +                                  clk-mt8196-topckgen2.o clk-mt8196-vlpc=
kgen.o
>  obj-$(CONFIG_COMMON_CLK_MT8365) +=3D clk-mt8365-apmixedsys.o clk-mt8365.=
o
>  obj-$(CONFIG_COMMON_CLK_MT8365_APU) +=3D clk-mt8365-apu.o
>  obj-$(CONFIG_COMMON_CLK_MT8365_CAM) +=3D clk-mt8365-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8196-vlpckgen.c b/drivers/clk/med=
iatek/clk-mt8196-vlpckgen.c
> new file mode 100644
> index 000000000000..c38d1e80a5ba
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8196-vlpckgen.c

[...]

> +static const char * const vlp_audio_h_parents[] =3D {
> +       "clk26m",
> +       "vlp_clk26m",
> +       "vlp_apll1",
> +       "vlp_apll2"
> +};
> +
> +static const char * const vlp_aud_engen1_parents[] =3D {
> +       "clk26m",
> +       "vlp_clk26m",
> +       "apll1_d8",
> +       "apll1_d4"
> +};
> +
> +static const char * const vlp_aud_engen2_parents[] =3D {
> +       "clk26m",
> +       "vlp_clk26m",
> +       "apll2_d8",
> +       "apll2_d4"
> +};
> +
> +static const char * const vlp_aud_intbus_parents[] =3D {
> +       "clk26m",
> +       "vlp_clk26m",
> +       "mainpll_d7_d4",
> +       "mainpll_d4_d4"
> +};

The above parents lists are incorrect. What we want is to exclude the
"clk26m" parent and only have the latter three parents. That is why
we have the parent index table below.

So please remove "clk26m" from the lists that are used together with
vlp_aud_parent_index.

I apologize if my previous explanation wasn't clear. The index table
is meant for "skipping" parent mux values when the values don't start
from 0 and/or the values aren't contiguous. The number of values still
has to match the number of parents given. The index list below is
essentially saying that "parent 0" is actually at "mux value 1".

> +static const u8 vlp_aud_parent_index[] =3D { 1, 2, 3 };

After this is fixed,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

[...]

