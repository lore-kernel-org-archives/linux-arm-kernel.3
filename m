Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 711B9C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 04:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gqg4UcH4HOCD8WdGE4+ik0rgx/yjtc/u1ELlwLDaNkk=; b=iEQZPMB9kPHDNBxPKMgTtKVLC/
	NfFeZbnqquqCxxLCCcjNVUbTrRXgaDuz14UYmAN/YOyd3FDR1NjhcyuxQXZAAvejwyjP6NXivqi4P
	tNMZXS0R2flxgqJdFT5hkoccfF2uRzDQf7tMTSXBHGq/VxVzUJXc6+RV9vnlQ9JIu2ACzcsSnGzis
	ERpRfV/9EixwQFSyvL2QKEIgGhS4Vfrpjowevzx0RFJjm4FzfQj5N4f+Oh74R6YFPYkcDjzAwa3Sx
	EceoSviGY1pQQ2Om8FtNu3CKS1dmtrz1wZlzo7tcMkYIOIm9D10i23feeCeFB3fcJ+wIoav2kH3ss
	vH2R33yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubXbd-000000042me-0zsV;
	Tue, 15 Jul 2025 04:49:29 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubXPe-000000041cQ-2vP6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 04:37:08 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-312e747d2d8so4990104a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 21:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752554226; x=1753159026; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gqg4UcH4HOCD8WdGE4+ik0rgx/yjtc/u1ELlwLDaNkk=;
        b=oE/ng87CYhOgky9jzs+JqG7+L77LnKzvq8NiZAA7OUvdHjRrCX2Lt43H3qfhBmdoeg
         HOOKL6H1eIUfgd65ZrRqWLKTvAIIKhjpCWOsL2WwzQEyvEn3kaeTBIui6OSpOGpPI6RQ
         vXbFZaFrxMJ421PEV4PIpV0a99Mrlpgz2k+9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752554226; x=1753159026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gqg4UcH4HOCD8WdGE4+ik0rgx/yjtc/u1ELlwLDaNkk=;
        b=rmrGMLQt+K1/RWJSExXaKz4f4yFAhY0pLqppXFr5LcaoraCaBt6hjDiCqZa0Mb4C41
         LJkzGRZoRhYmiPXhU642ugY/nkYn1NEPRrkBDBNG4mnKGWX4jmtMKi+tzfUHoTdMR671
         bjzV1KNY6RPitz15rBw2tkakErvvwMS7a5BjgsH0iis7GqiDyrbMzChHDlcPlTY76QSf
         7Fiol+D+VjW10j5zSNOIq0tmGdeh17O8sku94wEG44s3Wglz9rGnGgsYTt6GFVEHIjJZ
         65LKBFNRpyzNuPQFt03KL+YkVYQR0641+KVsGZHROdJCVwxRJNnYhcG4sG36+Aku4z1o
         GK/w==
X-Forwarded-Encrypted: i=1; AJvYcCWBF3byOF1wJZj3R+PpXCzuMwoaUetCwR4AGDxJ0WLIy5Blh6FhNUF/hlcZEL21G8CyjeN6qy1UGG7Lv8bswbMI@lists.infradead.org
X-Gm-Message-State: AOJu0YyvFl3Y+PVc0fxtzKPiEHNMoI7RDJVLdRETpOLhcV/NktmbQKuY
	OFOykGaQoRNMdySxP/qpLNs+PWXvnynac6tOTLSetPwmrQTidcxDcP1VjOtM//EHyR5eDNtBY5v
	B/1VMNFhrt/qE6fje+mmildF3Fk0/OB5Ba5l/oCS3
X-Gm-Gg: ASbGncvqyNvatELfmsG7lvedGeW79OJWUWjzceCSg6xChfE9LOKOKaYZ1Dmtf2nwRIA
	0HmWiSe1/TioiPIpKh3qUhgERdA8DLx21p799h0LvPfQIInbpNvdIUH/s+oxKxnf4maPw9lF5ZC
	8e8Gg69aU3VQfzpDBThHRS5PDhKKH3gVyqoaL0gTRXNbcqfDgtEDlIhp708dRw/xalqPHv6eErg
	q5SHcJoS9v7iWD/Zx8TJACxKDYbANd3Gd/tRob1UlPOJw==
X-Google-Smtp-Source: AGHT+IHf1xc3dLDnNYF/fDC0d2YbPGxvPK9FwAjwgXDKEU1kkJL2K+WT5K+79jl9PQ6eV0yj7I0MMHxdLoUbmyObj2Y=
X-Received: by 2002:a17:90b:57ef:b0:30e:6a9d:d78b with SMTP id
 98e67ed59e1d1-31c8f88d387mr3132859a91.12.1752554225889; Mon, 14 Jul 2025
 21:37:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250624143220.244549-1-laura.nao@collabora.com> <20250624143220.244549-19-laura.nao@collabora.com>
In-Reply-To: <20250624143220.244549-19-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 15 Jul 2025 12:36:52 +0800
X-Gm-Features: Ac12FXyo_hm6-LevP76Ht3AHw10mSGdmwELcsNXs6PZZNLb0jYOFlkoLp35KGco
Message-ID: <CAGXv+5ERCTTJVfgfY=LLTKasz7RpTdpPfHJDKtKiUfcYyrS8uQ@mail.gmail.com>
Subject: Re: [PATCH v2 18/29] clk: mediatek: Add MT8196 adsp clock support
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
X-CRM114-CacheID: sfid-20250714_213706_793095_1A2CF143 
X-CRM114-Status: GOOD (  19.33  )
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

Hi,

On Tue, Jun 24, 2025 at 10:33=E2=80=AFPM Laura Nao <laura.nao@collabora.com=
> wrote:
>
> Add support for the MT8196 adsp clock controller, which provides clock
> gate control for Audio DSP.
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/clk/mediatek/Kconfig           |   7 +
>  drivers/clk/mediatek/Makefile          |   1 +
>  drivers/clk/mediatek/clk-mt8196-adsp.c | 193 +++++++++++++++++++++++++
>  3 files changed, 201 insertions(+)
>  create mode 100644 drivers/clk/mediatek/clk-mt8196-adsp.c
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index cd12e7ff3e12..d4c97f64b42a 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -1068,6 +1068,13 @@ config COMMON_CLK_MT8196
>         help
>           This driver supports MediaTek MT8196 basic clocks.
>
> +config COMMON_CLK_MT8196_ADSP
> +       tristate "Clock driver for MediaTek MT8196 adsp"
> +       depends on COMMON_CLK_MT8196
> +       default m
> +       help
> +         This driver supports MediaTek MT8196 adsp clocks
> +

This is part of the AFE block, and really should not be a separate
device node nor driver. The AFE driver should internalize all these
controls and ideally model some of them as ASoC widgets so that DAPM
can handle sequencing altogether.

So please drop this patch, and also drop the entry from the binding.

I've mentioned this to MediaTek's audio and clock owners, though I
assume this request was somehow lost in the process.

ChenYu

