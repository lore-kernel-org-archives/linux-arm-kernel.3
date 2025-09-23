Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832F3CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 07:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJaxzkgGMS2WBlrlop8PHPlSP36j70ySVSvjHs1aEs4=; b=AFIuwv21PvpCkzV7sDhh0Gq+hh
	5LPu177z38y2CRR6E+MdC1x0BCS5qLiNV/YsEVfG0KbUX0ftkAUlEGJX3uUtZ7LJXbmufTd8mF1y9
	n7TCUJB0px/Qfb+we3PXd4JWbukHlU38tUKUwDVLlnJZb+GVH8DPhyRYBlV4de5RjoW48suZO7BFX
	EQljV8kWsVvQ9GDjFzjoKNqLL5/Ac7EEpY7YURcaNkMszN1ISyGZ0f9OOsuTI1a32YppzVNrRzk2T
	LrxFcdevY7K8MTlP7seAKQvdch/p3u36Rp9ovwzKvalhQpZ4nAVZkpWv2pYkR5E3UoQHADsNyyfrn
	RpcTUd1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0xli-0000000CjEC-0KkU;
	Tue, 23 Sep 2025 07:48:58 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0xlf-0000000CjDU-0SQB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 07:48:56 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-57afc648b7dso3508428e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 00:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1758613733; x=1759218533; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJaxzkgGMS2WBlrlop8PHPlSP36j70ySVSvjHs1aEs4=;
        b=mJbyz8QDVQbhXARwxgIGW+GpDtElRe12pozzr4YrmeUFNBARozxEd0ehpIBw8Dos8p
         E0mZJH1I3WseeX8woqyz1AtTayjMgn6bqtHVXvu8cw3B9RjOdc4x3dudpTD85TB//yrP
         /tyI/WbsQJU4UZNmmcy/JO+Ah1FRWb7Hz8tVcfpJaao0+zgRy9vvLCSwWppnnZuIetRn
         tj2zIVdawPI9+IkSIDT+PDKhsTGdX5NOW67SfW0kNHbVVA1CQyp0WNUFrjmROmetqqo3
         FdwYWJaPkAd/153JbMLCQWO8QQmqSKdCbLt1L3V/baTDFu/fBufL9CtUEvXYDXRde0YF
         7YAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758613733; x=1759218533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AJaxzkgGMS2WBlrlop8PHPlSP36j70ySVSvjHs1aEs4=;
        b=YzLJ8/d1s3MY5CR+JQywEfyoakjWYQ/3g3MzHvLd+eQ6dvje+iLV1VUbVWUsCeYTUL
         5ixQrbDImp416FHHE7BW6Isht3cT63yKdpdpEPTVTvU435uWwP8FNSPOKb+lZP+pEWVj
         1MkD3Svzt8U72KPVv9oz7A3+lk2MR5c0TtkgOJEGns6gpAZgV49NQU/KCIsuaejLM/vQ
         g2mCiB3CSrJmdnTlTvjbbtY9rkY3qaQpPlHBZepYYi/ILNVLbQN2p4+/3ckaKYRXUJqJ
         7Dia57YmLf2nEOaLEewjLdYLK248xQM1xVg3UM8Ew0D1J5cmn2PX+29TFTCMQnvIFeZr
         CNqA==
X-Forwarded-Encrypted: i=1; AJvYcCUkDVBSnpqkhg9qS6E+VZX2qEUc0cCGYm/yUYxFw9rN2U51yUeMd2eKHwp01JnbQhF+T4zA+ebjIFQ39qCqF8gn@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu5PhdmvrcBVyBtM8sUgjl22sgm6jEsHBe2SAeTGA6TjDssYY+
	jQTmFmRc8RFbKL9Iuwb9qVNTqxxB5JI//iSXsUzs4uI7ssGQYkkLWuCUqqaDEkYYYWS8NLYGBFF
	/r+Yt6/At5eBMQ6ZkazGdQgvL9hbCpvSffXp4Z9Up0w==
X-Gm-Gg: ASbGncvu0s/gsjh6uf9nxikCcq1HUwtd1r2YtGglfSSgyjWJvYrWye9PXR+GCvdqMqa
	UwCpCzn7iKu7Y8xva9vc4/RJOgM9sbHlrhVQwm+ZfwWHYIRoUzvElUGraWVyF2w75htiHxa0GW2
	iYIciD0yewRIQ1+FunveFdn2agDgkkumfvje+ZoSVxQb0BdSMK4SR47ibslN5hWVdVDv6e7NATk
	ZKfUQSEXDJSI+AvfWt5/QdRQm7FlHsctjrmOZa5LMuXAZWl
X-Google-Smtp-Source: AGHT+IFXCbUC7OKlJXhiIcyp3/0pEbhIPcVmkwcaoRpLoXztj3Zx0ZDwfLpI5huj43NEMpkp0HP1DS+xrpQFvaRxUT4=
X-Received: by 2002:a05:6512:b19:b0:578:cee7:7aa9 with SMTP id
 2adb3069b0e04-580734f07d9mr498868e87.48.1758613732567; Tue, 23 Sep 2025
 00:48:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250919-rda8810pl-mmc-v1-0-d4f08a05ba4d@mainlining.org>
 <CAMRc=Mc4hO1LDumxAfkB1W6miTJXR1NUVAKBVarkwiF2yGvSLA@mail.gmail.com> <2wwi3ktbcuyp7y7mqplndvawagae5hdhcx3hn375kycoqtows6@xcww2237rxpe>
In-Reply-To: <2wwi3ktbcuyp7y7mqplndvawagae5hdhcx3hn375kycoqtows6@xcww2237rxpe>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 23 Sep 2025 09:48:41 +0200
X-Gm-Features: AS18NWDP_wgtg5ZAo1aJS0Vwp6mqsgj6RBa2BQg1A6VrGdFXcg4GLeRrQ88qOWM
Message-ID: <CAMRc=MdhQMR=-ayz+GfigUMVy+j1QNO3LguMoZYa5_+Es3E5Ow@mail.gmail.com>
Subject: Re: [PATCH 00/10] RDA8810PL SD/MMC support
To: Dang Huynh <dang.huynh@mainlining.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-unisoc@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_004855_274138_F1D6F5A0 
X-CRM114-Status: GOOD (  19.69  )
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

On Tue, Sep 23, 2025 at 5:45=E2=80=AFAM Dang Huynh <dang.huynh@mainlining.o=
rg> wrote:
>
> On Mon, Sep 22, 2025 at 04:17:05PM +0200, Bartosz Golaszewski wrote:
> > On Thu, Sep 18, 2025 at 8:49=E2=80=AFPM Dang Huynh via B4 Relay
> > <devnull+dang.huynh.mainlining.org@kernel.org> wrote:
> > >
> > > This patch series aims to add SDMMC driver and various drivers requir=
ed
> > > for SDMMC controller to function.
> > >
> > > This also fixed a bug where all the GPIO switched from INPUT to OUTPU=
T
> > > after the GPIO driver probed or by reading the GPIO debugfs.
> > >
> > > This patch series is a split from [1] to ease the maintainers.
> > >
> >
> > This is still targeting at least 4 subsystems and isn't making the
> > merging any easier. Are there any build-time dependencies here? If
> > not, then split it further into small chunks targeting individual
> > subsystems and the relevant ARM SoC tree.
> The MMC driver depends on both the clock and the DMA driver.
>

But is the dependency a build-time one or does the MMC DT node
reference clocks and the DMA engine by phandle? I assume it's the
latter in which case it's fine for them to go into next separately.

Bart

