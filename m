Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E064CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 18:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hA+2wesaVrYL13Ek9PytzgyCt01NNN1W3ZjSk7cfKyA=; b=OzyBHcA+m0aWS6KjHTF5NzcDLM
	tUj7u594+2SLVgKnGrH/P+EUj/v99NNuB/MxaqCdO4K/GzZKyl2i8ksvy3fg+kZY4GpdwBtHXXgtP
	8aJ/+UE6aqkvANkIXzTcQKzOgkE7hs4d1fOI5lcWbcFy3omqHThTVob0mYssSSlbpudduSjMDxNbI
	gMkOeBBTQYAUIQF4B3U+4fpZMFHR9kGMY9b1XI8Q1rsSXxsEi29enU0rmP7FowyyJlEPUJDjOibDS
	qxcwid/f/ZcehFMpO+JpRbOT8KzCR3rIML+fKg/DdK/w+Ectp7WljAf3kGL9lkar6wn64DPi65PeH
	mgSSUD6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4kK6-0000000CuzW-24Hb;
	Fri, 03 Oct 2025 18:16:06 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4kK4-0000000CuyY-0PXP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 18:16:05 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-63606491e66so2262861d50.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 11:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759515362; x=1760120162; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hA+2wesaVrYL13Ek9PytzgyCt01NNN1W3ZjSk7cfKyA=;
        b=JrhIqG4XNP9c1swHX504IxhFg+pDEbcPNbAikpCi6gsG0c61bIli0NcRIPh2RatPlL
         W8n3eCJafFIUcmXESMdb9+2Ww3nwOXLUgGHLo8glnyDlcdI6G4FhdRQwgdeA6u8np5IA
         OG6a3gBAvpSbJhVTqUje8d5LvoOOZm0KErYfKfGsdSprxMWsQrWyriDRmmHPaYo7nqTt
         EMMVNyyfUPlW7sUumdJdyfYuXFTh19vtUK+BnTz1tP+9SDnOisxzD4jIIBvKlRyxzBJn
         uhAwANZvQzz32oHXPG3BxX8sybBPIlwleqvRDpsvptNCmKDdw3IEgCUK2gl66JLhzzVT
         POzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759515362; x=1760120162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hA+2wesaVrYL13Ek9PytzgyCt01NNN1W3ZjSk7cfKyA=;
        b=R6X6cnNNJgiUgbYRsyxjrrf54Kh0/2eBuTY+pi8fU8a9BpGNOd7uD5wkXO+X/ORzlS
         uH5kO/w9j0rlxkDd6xJ0nQ/9haH9Xz5lqSDpyvHJWHhSugP26Z0o8C4UOm7SR1Z8UZzc
         sdiI89TnOz2A9CKSV/fnmRcb7VlCK8shlJtlL7A2AVINtp/pQTRwfxGQ5EOoriiRFX58
         0YcSM5acDYW+3brmEVD0BU0PZw12INvnU4qZ9CwMtO3CxTL09RDy2opZnMw4kqqeRUE4
         G6aksHxmbfGem3o6u6LCGD04pxwVjX7azu4hR7DJaSG5KiGGljlK7w9gEJbTod1mfcVW
         A5wQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtkHdXmN4+wqs9b/UNLKu0PPYI0bxb7sBv0TsIBTePMBWtQVHbRmuvyo8oSBNiNFIaXddjE2EGMxrguzLW35sd@lists.infradead.org
X-Gm-Message-State: AOJu0Ywyk45p0q+LkiTkfpipewVZI2Gb2GNi6SFLDKTgGNZHY+P9lTNA
	xnj7fP3S+vdBMY98Eve7sCpx7x9KCOUyf7/EcJS1K5X6CEUT5kGr6+6Bpk3ojp2r+h7QddOaTlB
	PgD/brdzr+SY64RpSiWlUXSkxIScbBfE=
X-Gm-Gg: ASbGncvUkhFvBIuYqO1NMzqJveMciA8UTuRRuAkfXx/1Y9uhh3gwbZZ5soEKMXP/2HF
	NZ8iaJ7hR/GOdmjCSBmZQW5MU3JW+MARMA0oVM2oUcqTF6gUuoCZyj5TAMmP3W1r5K5DLxiBw5T
	S2p+xQcVNDMoFiiv0QbnWb3/qinr2KAxsTdN5mKpw0wQG33Wrgi4FmUNV+IU42z0BLyaURFDI5b
	slHXfBT9g/Z8AdQ9GP2Z/lEFwV6/jF6NoAvN2YTic64ExvGRlWSoTBvmFiMf4a/7u/Q5822eQV7
	H0ysxJaBKpMO71lVZEgD5uwMvcvlk78D
X-Google-Smtp-Source: AGHT+IHcaFQJqVTztaB0e9RyZeNiAagOyj3g8KNYxpfdC0wTuijqki+QAQ/mSLPGzCBtgMgInYIWdXqQgPlyAlcpaNk=
X-Received: by 2002:a05:690e:28d:b0:604:3849:89a8 with SMTP id
 956f58d0204a3-63b9a076118mr3027885d50.16.1759515362277; Fri, 03 Oct 2025
 11:16:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250929-mt8196-gpufreq-v5-0-3056e5ecf765@collabora.com> <20250929-mt8196-gpufreq-v5-4-3056e5ecf765@collabora.com>
In-Reply-To: <20250929-mt8196-gpufreq-v5-4-3056e5ecf765@collabora.com>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Fri, 3 Oct 2025 11:15:51 -0700
X-Gm-Features: AS18NWBanN0MXtcDFrnukKn4J7dSEQIT7fLhFbzGJzYOporRHK4S0vyKzeHBSFc
Message-ID: <CAPaKu7Tz9tw=fbz17kpPn1Pj_YsGRJZR9o28zkfiBgvxL3rdxg@mail.gmail.com>
Subject: Re: [PATCH v5 4/7] mailbox: add MediaTek GPUEB IPI mailbox
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_111604_135056_8207BF19 
X-CRM114-Status: GOOD (  21.81  )
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

On Mon, Sep 29, 2025 at 12:47=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> The MT8196 SoC uses an embedded MCU to control frequencies and power of
> the GPU. This controller is referred to as "GPUEB".
>
> It communicates to the application processor, among other ways, through
> a mailbox.
>
> The mailbox exposes one interrupt, which appears to only be fired when a
> response is received, rather than a transaction is completed. For us,
> this means we unfortunately need to poll for txdone.
>
> The mailbox also requires the EB clock to be on when touching any of the
> mailbox registers.
>
> Add a simple driver for it based on the common mailbox framework.
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> ---
>  drivers/mailbox/Kconfig             |  10 ++
>  drivers/mailbox/Makefile            |   2 +
>  drivers/mailbox/mtk-gpueb-mailbox.c | 318 ++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 330 insertions(+)
[...]
> +static irqreturn_t mtk_gpueb_mbox_thread(int irq, void *data)
> +{
> +       struct mtk_gpueb_mbox_chan *ch =3D data;
> +       u8 buf[GPUEB_MBOX_MAX_RX_SIZE] =3D {};
nit: move to inside the if-block below.
> +       int status;
> +
> +       status =3D atomic_cmpxchg(&ch->rx_status, GPUEB_MBOX_FULL | GPUEB=
_MBOX_BLOCKED,
> +                               GPUEB_MBOX_FULL);
> +       if (status =3D=3D (GPUEB_MBOX_FULL | GPUEB_MBOX_BLOCKED)) {
> +               mtk_gpueb_mbox_read_rx(buf, ch);
> +               writel(BIT(ch->num), ch->ebm->mbox_ctl + GPUEB_MBOX_CTL_I=
RQ_CLR);
> +               mbox_chan_received_data(&ch->ebm->mbox.chans[ch->num], bu=
f);
> +               atomic_set(&ch->rx_status, 0);
> +               return IRQ_HANDLED;
> +       }
> +
> +       return IRQ_NONE;
> +}

