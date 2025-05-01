Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F3BC3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 19:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nC7ipxL1fdl2uYrkYPPZnulQm29mK968I5U4sr/nWKo=; b=Zu5OG3I7WjYg0mi9IWGs5c3LHc
	SwOD5j0dXFv6LSdgQueFYFfJ9Hw5/FOc8GO/gx5RjRka6LHc9YyaE9d88xPtRhxk0xIS5CmGFtJDH
	VlPSq8I8BqlIoWuj6asFFyR6SASxNu6Dje296k8KH5Yv0LdOclqS5yu0iIDgOgZcr+uryJ9ZFxi4r
	HOuLVhlyh3obiHXPwGZv8b5u6eq5CzWXiW6ONEj4tzUUcWB7QZKMj7LKkrANXG7oCEkVa+vcQHfFR
	sDIUfLHDin66++CjjHD4IjY4t4ZrhflZiHWQRxVbBUwIgPLgB9VjPMw4aJXd6ygYhMHzGldmekKm+
	jFWwl0Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAZiR-0000000GUzo-3tSs;
	Thu, 01 May 2025 19:37:03 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAZgW-0000000GUkY-1G5d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 19:35:05 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-30384072398so1088693a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 12:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1746128103; x=1746732903; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nC7ipxL1fdl2uYrkYPPZnulQm29mK968I5U4sr/nWKo=;
        b=YZIJ+NHCntfDJ72p+gR1lpaoEKB4jIQ45yUriZfpRJnjouIqJV7qepWiCKEmw3fice
         SGR31kK1aatvk/i/9pw2WXrvCJxyX0/pocffHVYnRD+VnGaf38uooC+lCaTXiyTgIXXj
         7ggnf/Jx1W0RcLnsCy84/MefFqNWjQ6Rek2r8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746128103; x=1746732903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nC7ipxL1fdl2uYrkYPPZnulQm29mK968I5U4sr/nWKo=;
        b=nx2NMlM6fXVDQnIaSlGlqCEtyYG9YMN6t0iD9uIMEg7YKFVu195eZ8cVRvRTAACFLi
         98tBH+FJ6L1XoE4EqsKHsz+/hX3LJ/3pkfdnIGxAwMZTbYxDfHInAcJupscLscU6qP4b
         99EsVkkrq2uIYEk1nj/tRpIS2/WDg6XnkXkHdj1CR9aUeccOGBRHL3OARQZnRSONn7Wl
         rizaVqtuLmlYml/w+ckoCIG07spsRlFOe1+lDhpFF1E5+JMK1l7ODBoZZr2GA+cdO/+b
         pKFNYcfDkbYapddqoewgWA9I9/oe1ffKEge7AAirFYc0lBtAJledi3YGj6AnjMWxWUua
         m1RA==
X-Forwarded-Encrypted: i=1; AJvYcCVv0kBOty5GDzZnMWKpAW/En5z6CdEPkJhE5Aiw6/uNVw9BY83G2WFLO2ZtvvkLkxxUg6X97jRa0ddBxWt6ZuOP@lists.infradead.org
X-Gm-Message-State: AOJu0YxtGkTSf88/yb8jG8hQ2IxbUAKSFUKR2RVhQjM1Uvlb48cDBVIK
	QYpjQUD8YR8ojEwaTd/Nt9pkbS/bvWYpWMU4tgUDL0IBR6PywLjt0XSPqHGYXMv/cCBt5g5doG0
	6VXBlXpMCitdoV4rZsBLxldre8CGbN0aCy0ywLA==
X-Gm-Gg: ASbGncsxvjAjmSXN1aUJh8X6DFBW24U3yQeNVtUXzZIKd6twEHBNpDQ507znomj3KWN
	eo+z7qUrZDhgnyjjZiYjy5rALeEuducRzW6D75qJqAYPhj6PMnq1JWf6oL5oRgAoBGaI44RKjQ8
	MGCWof7j8p9OQONhMvwwmSqWUjIOGOAvs9h0tC84IAifKFywrxWlsKIDI=
X-Google-Smtp-Source: AGHT+IHOLuAj/5xzNMR3/SrWZLN04PLzTmucQdi2b4aTmuv84jCbJj8QTn25C6A94hVDNMJN4E2zzZv3E4D+BSsezYs=
X-Received: by 2002:a17:90b:6c4:b0:2ff:4e90:3c55 with SMTP id
 98e67ed59e1d1-30a4e608dd6mr443815a91.27.1746128102848; Thu, 01 May 2025
 12:35:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250414-spi-dma-v2-1-84bbd92fa469@amlogic.com>
 <CACdvmAhEXstEBdaiktU4n-R6M6mYiBnSx15ZJfb1FOKGD7Zfaw@mail.gmail.com>
 <b202538e-5520-48ce-a957-034c0ce7beb1@linaro.org> <CACdvmAhcCUTFBrMkgrnt03iY4=siSiYKU9Ss4M-+HT-h6wphWA@mail.gmail.com>
In-Reply-To: <CACdvmAhcCUTFBrMkgrnt03iY4=siSiYKU9Ss4M-+HT-h6wphWA@mail.gmail.com>
From: Da Xue <da@lessconfused.com>
Date: Thu, 1 May 2025 15:34:50 -0400
X-Gm-Features: ATxdqUGFuzarQn_VgMDlF3zTcW19V8slaxK3HL0ZRQVZCv6HFO0chXXIRGFF72I
Message-ID: <CACdvmAi-e8E1h2mACMSNB3PuxBH4LM2p-F8Src+f=AGfxP8N9A@mail.gmail.com>
Subject: Re: [PATCH v2] spi: meson-spicc: add DMA support
To: linux-spi@vger.kernel.org
Cc: xianwei.zhao@amlogic.com, Mark Brown <broonie@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Sunny Luo <sunny.luo@amlogic.com>, neil.armstrong@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_123504_353409_AA8DF901 
X-CRM114-Status: GOOD (  43.54  )
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

On Wed, Apr 30, 2025 at 9:33=E2=80=AFAM Da Xue <da@lessconfused.com> wrote:
>
> On Wed, Apr 30, 2025 at 3:43=E2=80=AFAM Neil Armstrong
> <neil.armstrong@linaro.org> wrote:
> >
> > On 30/04/2025 04:13, Da Xue wrote:
> > > On Mon, Apr 14, 2025 at 2:30=E2=80=AFAM Xianwei Zhao via B4 Relay
> > > <devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:
> > >>
> > >> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> > >>
> > >> Add DMA support for spicc driver.
> > >>
> > >> DMA works if the transfer meets the following conditions:
> > >> 1. 64 bits per word;
> > >> 2. The transfer length must be multiples of the dma_burst_len,
> > >>     and the dma_burst_len should be one of 8,7...2,
> > >>     otherwise, it will be split into several SPI bursts.
> > >>
> > >> Signed-off-by: Sunny Luo <sunny.luo@amlogic.com>
> > >> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> > >> ---
> > >> Changes in v2:
> > >> - Make formatting adjustments and code optimizations according to Ne=
il's suggestions.
> > >> - Remove two special DMA trigger modes that are not fully implemente=
d.
> > >> - Link to v1: https://lore.kernel.org/r/20250408-spi-dma-v1-1-3c38be=
62c09c@amlogic.com
> > >> ---
> > >>   drivers/spi/spi-meson-spicc.c | 241 ++++++++++++++++++++++++++++++=
++++++++----
> > >>   1 file changed, 220 insertions(+), 21 deletions(-)
> > >>
> > >> diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-s=
picc.c
> > >> index df74ad5060f8..6b9137307533 100644
> > >> --- a/drivers/spi/spi-meson-spicc.c
> > >> +++ b/drivers/spi/spi-meson-spicc.c
> > >> @@ -21,18 +21,26 @@
> > >>   #include <linux/interrupt.h>
> > >>   #include <linux/reset.h>
> > >>   #include <linux/pinctrl/consumer.h>
> > >> +#include <linux/dma-mapping.h>
> > >>
> > >>   /*
> > >> - * The Meson SPICC controller could support DMA based transfers, bu=
t is not
> > >> - * implemented by the vendor code, and while having the registers d=
ocumentation
> > >> - * it has never worked on the GXL Hardware.
> > >> - * The PIO mode is the only mode implemented, and due to badly desi=
gned HW :
> > >> - * - all transfers are cutted in 16 words burst because the FIFO ha=
ngs on
> > >> - *   TX underflow, and there is no TX "Half-Empty" interrupt, so we=
 go by
> > >> - *   FIFO max size chunk only
> > >> - * - CS management is dumb, and goes UP between every burst, so is =
really a
> > >> - *   "Data Valid" signal than a Chip Select, GPIO link should be us=
ed instead
> > >> - *   to have a CS go down over the full transfer
> > >> + * There are two modes for data transmission: PIO and DMA.
> > >> + * When bits_per_word is 8, 16, 24, or 32, data is transferred usin=
g PIO mode.
> > >> + * When bits_per_word is 64, DMA mode is used by default.
> > >> + *
> > >> + * DMA achieves a transfer with one or more SPI bursts, each SPI bu=
rst is made
> > >> + * up of one or more DMA bursts. The DMA burst implementation mecha=
nism is,
> > >> + * For TX, when the number of words in TXFIFO is less than the pres=
et
> > >> + * reading threshold, SPICC starts a reading DMA burst, which reads=
 the preset
> > >> + * number of words from TX buffer, then writes them into TXFIFO.
> > >> + * For RX, when the number of words in RXFIFO is greater than the p=
reset
> > >> + * writing threshold, SPICC starts a writing request burst, which r=
eads the
> > >> + * preset number of words from RXFIFO, then write them into RX buff=
er.
> > >> + * DMA works if the transfer meets the following conditions,
> > >> + * - 64 bits per word
> > >
> > > Just for clarification, DMA can only send 64-bit words due to hardwar=
e
> > > design, right?
> > > The bit-per-word in spi control register (CONREG) has no effect?
> > >
> > >> + * - The transfer length in word must be multiples of the dma_burst=
_len, and
> > >> + *   the dma_burst_len should be one of 8,7...2, otherwise, it will=
 be split
> > >> + *   into several SPI bursts by this driver
> > >>    */
> > >>
> > >>   #define SPICC_MAX_BURST        128
> > >> @@ -128,6 +136,23 @@
> > >>
> > >>   #define SPICC_DWADDR   0x24    /* Write Address of DMA */
> > >>
> > >> +#define SPICC_LD_CNTL0 0x28
> > >> +#define VSYNC_IRQ_SRC_SELECT           BIT(0)
> > >> +#define DMA_EN_SET_BY_VSYNC            BIT(2)
> > >> +#define XCH_EN_SET_BY_VSYNC            BIT(3)
> > >> +#define DMA_READ_COUNTER_EN            BIT(4)
> > >> +#define DMA_WRITE_COUNTER_EN           BIT(5)
> > >> +#define DMA_RADDR_LOAD_BY_VSYNC                BIT(6)
> > >> +#define DMA_WADDR_LOAD_BY_VSYNC                BIT(7)
> > >> +#define DMA_ADDR_LOAD_FROM_LD_ADDR     BIT(8)
> > >> +
> > >> +#define SPICC_LD_CNTL1 0x2c
> > >> +#define DMA_READ_COUNTER               GENMASK(15, 0)
> > >> +#define DMA_WRITE_COUNTER              GENMASK(31, 16)
> > >> +#define DMA_BURST_LEN_DEFAULT          8
> > >> +#define DMA_BURST_COUNT_MAX            0xffff
> > >> +#define SPI_BURST_LEN_MAX      (DMA_BURST_LEN_DEFAULT * DMA_BURST_C=
OUNT_MAX)
> > >> +
> > >
> > > LD_CNTL0 and LD_CNTL1 are not in this datasheet for GXL
> > > (S805X/S905X/S905D). Do they exist on these SoCs and are not
> > > documented?
> > >
> > >>   #define SPICC_ENH_CTL0 0x38    /* Enhanced Feature */
> > >>   #define SPICC_ENH_CLK_CS_DELAY_MASK    GENMASK(15, 0)
> > >>   #define SPICC_ENH_DATARATE_MASK                GENMASK(23, 16)
> > >> @@ -171,6 +196,9 @@ struct meson_spicc_device {
> > >>          struct pinctrl                  *pinctrl;
> > >>          struct pinctrl_state            *pins_idle_high;
> > >>          struct pinctrl_state            *pins_idle_low;
> > >> +       dma_addr_t                      tx_dma;
> > >> +       dma_addr_t                      rx_dma;
> > >> +       bool                            using_dma;
> > >>   };
> > >>
> > >>   #define pow2_clk_to_spicc(_div) container_of(_div, struct meson_sp=
icc_device, pow2_div)
> > >> @@ -202,6 +230,148 @@ static void meson_spicc_oen_enable(struct meso=
n_spicc_device *spicc)
> > >>          writel_relaxed(conf, spicc->base + SPICC_ENH_CTL0);
> > >>   }
> > >>
> > >> +static int meson_spicc_dma_map(struct meson_spicc_device *spicc,
> > >> +                              struct spi_transfer *t)
> > >> +{
> > >> +       struct device *dev =3D spicc->host->dev.parent;
> > >> +
> > >> +       if (!(t->tx_buf && t->rx_buf))
> > >> +               return -EINVAL;
> > >> +
> > >> +       t->tx_dma =3D dma_map_single(dev, (void *)t->tx_buf, t->len,=
 DMA_TO_DEVICE);
> > >> +       if (dma_mapping_error(dev, t->tx_dma))
> > >> +               return -ENOMEM;
> > >> +
> > >> +       t->rx_dma =3D dma_map_single(dev, t->rx_buf, t->len, DMA_FRO=
M_DEVICE);
> > >> +       if (dma_mapping_error(dev, t->rx_dma))
> > >> +               return -ENOMEM;
> > >> +
> > >> +       spicc->tx_dma =3D t->tx_dma;
> > >> +       spicc->rx_dma =3D t->rx_dma;
> > >> +
> > >> +       return 0;
> > >> +}
> > >> +
> > >> +static void meson_spicc_dma_unmap(struct meson_spicc_device *spicc,
> > >> +                                 struct spi_transfer *t)
> > >> +{
> > >> +       struct device *dev =3D spicc->host->dev.parent;
> > >> +
> > >> +       if (t->tx_dma)
> > >> +               dma_unmap_single(dev, t->tx_dma, t->len, DMA_TO_DEVI=
CE);
> > >> +       if (t->rx_dma)
> > >> +               dma_unmap_single(dev, t->rx_dma, t->len, DMA_FROM_DE=
VICE);
> > >> +}
> > >> +
> > >> +/*
> > >> + * According to the remain words length, calculate a suitable spi b=
urst length
> > >> + * and a dma burst length for current spi burst
> > >> + */
> > >> +static u32 meson_spicc_calc_dma_len(struct meson_spicc_device *spic=
c,
> > >> +                                   u32 len, u32 *dma_burst_len)
> > >> +{
> > >> +       u32 i;
> > >> +
> > >> +       if (len <=3D spicc->data->fifo_size) {
> > >> +               *dma_burst_len =3D len;
> > >> +               return len;
> > >> +       }
> > >> +
> > >> +       *dma_burst_len =3D DMA_BURST_LEN_DEFAULT;
> > >> +
> > >> +       if (len =3D=3D (SPI_BURST_LEN_MAX + 1))
> > >> +               return SPI_BURST_LEN_MAX - DMA_BURST_LEN_DEFAULT;
> > >> +
> > >> +       if (len >=3D SPI_BURST_LEN_MAX)
> > >> +               return SPI_BURST_LEN_MAX;
> > >> +
> > >> +       for (i =3D DMA_BURST_LEN_DEFAULT; i > 1; i--)
> > >> +               if ((len % i) =3D=3D 0) {
> > >> +                       *dma_burst_len =3D i;
> > >> +                       return len;
> > >> +               }
> > >> +
> > >> +       i =3D len % DMA_BURST_LEN_DEFAULT;
> > >> +       len -=3D i;
> > >> +
> > >> +       if (i =3D=3D 1)
> > >> +               len -=3D DMA_BURST_LEN_DEFAULT;
> > >> +
> > >> +       return len;
> > >> +}
> > >> +
> > >> +static void meson_spicc_setup_dma(struct meson_spicc_device *spicc)
> > >> +{
> > >> +       unsigned int len;
> > >> +       unsigned int dma_burst_len, dma_burst_count;
> > >> +       unsigned int count_en =3D 0;
> > >> +       unsigned int txfifo_thres =3D 0;
> > >> +       unsigned int read_req =3D 0;
> > >> +       unsigned int rxfifo_thres =3D 31;
> > >> +       unsigned int write_req =3D 0;
> > >> +       unsigned int ld_ctr1 =3D 0;
> > >> +
> > >> +       writel_relaxed(spicc->tx_dma, spicc->base + SPICC_DRADDR);
> > >> +       writel_relaxed(spicc->rx_dma, spicc->base + SPICC_DWADDR);
> > >> +
> > >> +       /* Set the max burst length to support a transmission with l=
ength of
> > >> +        * no more than 1024 bytes(128 words), which must use the CS=
 management
> > >> +        * because of some strict timing requirements
> > >> +        */
> > >> +       writel_bits_relaxed(SPICC_BURSTLENGTH_MASK, SPICC_BURSTLENGT=
H_MASK,
> > >> +                           spicc->base + SPICC_CONREG);
> > >> +
> > >> +       len =3D meson_spicc_calc_dma_len(spicc, spicc->xfer_remain,
> > >> +                                      &dma_burst_len);
> > >> +       spicc->xfer_remain -=3D len;
> > >> +       dma_burst_count =3D DIV_ROUND_UP(len, dma_burst_len);
> > >> +       dma_burst_len--;
> > >> +
> > >> +       if (spicc->tx_dma) {
> > >> +               spicc->tx_dma +=3D len;
> > >> +               count_en |=3D DMA_READ_COUNTER_EN;
> > >> +               txfifo_thres =3D spicc->data->fifo_size - dma_burst_=
len;
> > >> +               read_req =3D dma_burst_len;
> > >> +               ld_ctr1 |=3D FIELD_PREP(DMA_READ_COUNTER, dma_burst_=
count);
> > >> +       }
> > >> +
> > >> +       if (spicc->rx_dma) {
> > >> +               spicc->rx_dma +=3D len;
> > >> +               count_en |=3D DMA_WRITE_COUNTER_EN;
> > >> +               rxfifo_thres =3D dma_burst_len;
> > >> +               write_req =3D dma_burst_len;
> > >> +               ld_ctr1 |=3D FIELD_PREP(DMA_WRITE_COUNTER, dma_burst=
_count);
> > >> +       }
> > >> +
> > >> +       writel_relaxed(count_en, spicc->base + SPICC_LD_CNTL0);
> > >> +       writel_relaxed(ld_ctr1, spicc->base + SPICC_LD_CNTL1);
> > >> +       writel_relaxed(SPICC_DMA_ENABLE
> > >> +                   | SPICC_DMA_URGENT
> > >> +                   | FIELD_PREP(SPICC_TXFIFO_THRESHOLD_MASK, txfifo=
_thres)
> > >> +                   | FIELD_PREP(SPICC_READ_BURST_MASK, read_req)
> > >> +                   | FIELD_PREP(SPICC_RXFIFO_THRESHOLD_MASK, rxfifo=
_thres)
> > >> +                   | FIELD_PREP(SPICC_WRITE_BURST_MASK, write_req),
> > >> +                   spicc->base + SPICC_DMAREG);
> > >> +}
> > >> +
> > >> +static irqreturn_t meson_spicc_dma_irq(struct meson_spicc_device *s=
picc)
> > >> +{
> > >> +       if (readl_relaxed(spicc->base + SPICC_DMAREG) & SPICC_DMA_EN=
ABLE)
> > >> +               return IRQ_HANDLED;
> > >> +
> > >> +       if (spicc->xfer_remain) {
> > >> +               meson_spicc_setup_dma(spicc);
> > >> +       } else {
> > >> +               writel_bits_relaxed(SPICC_SMC, 0, spicc->base + SPIC=
C_CONREG);
> > >> +               writel_relaxed(0, spicc->base + SPICC_INTREG);
> > >> +               writel_relaxed(0, spicc->base + SPICC_DMAREG);
> > >> +               meson_spicc_dma_unmap(spicc, spicc->xfer);
> > >> +               complete(&spicc->done);
> > >> +       }
> > >> +
> > >> +       return IRQ_HANDLED;
> > >> +}
> > >> +
> > >>   static inline bool meson_spicc_txfull(struct meson_spicc_device *s=
picc)
> > >>   {
> > >>          return !!FIELD_GET(SPICC_TF,
> > >> @@ -293,6 +463,9 @@ static irqreturn_t meson_spicc_irq(int irq, void=
 *data)
> > >>
> > >>          writel_bits_relaxed(SPICC_TC, SPICC_TC, spicc->base + SPICC=
_STATREG);
> > >>
> > >> +       if (spicc->using_dma)
> > >> +               return meson_spicc_dma_irq(spicc);
> > >> +
> > >>          /* Empty RX FIFO */
> > >>          meson_spicc_rx(spicc);
> > >>
> > >> @@ -426,9 +599,6 @@ static int meson_spicc_transfer_one(struct spi_c=
ontroller *host,
> > >>
> > >>          meson_spicc_reset_fifo(spicc);
> > >>
> > >> -       /* Setup burst */
> > >> -       meson_spicc_setup_burst(spicc);
> > >> -
> > >>          /* Setup wait for completion */
> > >>          reinit_completion(&spicc->done);
> > >>
> > >> @@ -442,11 +612,36 @@ static int meson_spicc_transfer_one(struct spi=
_controller *host,
> > >>          /* Increase it twice and add 200 ms tolerance */
> > >>          timeout +=3D timeout + 200;
> > >>
> > >> -       /* Start burst */
> > >> -       writel_bits_relaxed(SPICC_XCH, SPICC_XCH, spicc->base + SPIC=
C_CONREG);
> > >> +       if (xfer->bits_per_word =3D=3D 64) {
> > >> +               int ret;
> > >> +
> > >> +               /* dma_burst_len 1 can't trigger a dma burst */
> > >> +               if (xfer->len < 16)
> > >> +                       return -EINVAL;
> > >> +
> > >> +               ret =3D meson_spicc_dma_map(spicc, xfer);
> > >> +               if (ret) {
> > >> +                       meson_spicc_dma_unmap(spicc, xfer);
> > >> +                       dev_err(host->dev.parent, "dma map failed\n"=
);
> > >> +                       return ret;
> > >> +               }
> > >> +
> > >> +               spicc->using_dma =3D true;
> > >> +               spicc->xfer_remain =3D DIV_ROUND_UP(xfer->len, spicc=
->bytes_per_word);
> > >> +               meson_spicc_setup_dma(spicc);
> > >> +               writel_relaxed(SPICC_TE_EN, spicc->base + SPICC_INTR=
EG);
> > >> +               writel_bits_relaxed(SPICC_SMC, SPICC_SMC, spicc->bas=
e + SPICC_CONREG);
> > >> +       } else {
> > >> +               spicc->using_dma =3D false;
> > >> +               /* Setup burst */
> > >> +               meson_spicc_setup_burst(spicc);
> > >>
> > >> -       /* Enable interrupts */
> > >> -       writel_relaxed(SPICC_TC_EN, spicc->base + SPICC_INTREG);
> > >> +               /* Start burst */
> > >> +               writel_bits_relaxed(SPICC_XCH, SPICC_XCH, spicc->bas=
e + SPICC_CONREG);
> > >> +
> > >> +               /* Enable interrupts */
> > >> +               writel_relaxed(SPICC_TC_EN, spicc->base + SPICC_INTR=
EG);
> > >> +       }
> > >>
> > >>          if (!wait_for_completion_timeout(&spicc->done, msecs_to_jif=
fies(timeout)))
> > >>                  return -ETIMEDOUT;
> > >> @@ -545,6 +740,14 @@ static int meson_spicc_setup(struct spi_device =
*spi)
> > >>          if (!spi->controller_state)
> > >>                  spi->controller_state =3D spi_controller_get_devdat=
a(spi->controller);
> > >>
> > >> +       /* DMA works at 64 bits, the rest works on PIO */
> > >> +       if (spi->bits_per_word !=3D 8 &&
> > >> +           spi->bits_per_word !=3D 16 &&
> > >> +           spi->bits_per_word !=3D 24 &&
> > >> +           spi->bits_per_word !=3D 32 &&
> > >> +           spi->bits_per_word !=3D 64)
> > >> +               return -EINVAL;
> > >> +
> > >>          return 0;
> > >>   }
> > >>
> > >> @@ -853,10 +1056,6 @@ static int meson_spicc_probe(struct platform_d=
evice *pdev)
> > >>          host->num_chipselect =3D 4;
> > >>          host->dev.of_node =3D pdev->dev.of_node;
> > >>          host->mode_bits =3D SPI_CPHA | SPI_CPOL | SPI_CS_HIGH | SPI=
_LOOP;
> > >> -       host->bits_per_word_mask =3D SPI_BPW_MASK(32) |
> > >> -                                  SPI_BPW_MASK(24) |
> > >> -                                  SPI_BPW_MASK(16) |
> > >> -                                  SPI_BPW_MASK(8);
> > >
> > > This should not be removed. SPI_BPW_MASK(64) needs to be added.
> > > Removing bits_per_word_mask causes other code to assume this is an
> > > 8-bit only controller.
> >
> > SPI_BPW_MASK(64) doesn't not exist, it's only a 32bit field, removing i=
t is fine,
> > the check is done later.
>
> The spi_is_bpw_supported function in include/linux/spi/spi.h checks
> bits_per_word_mask.
> Without this set, drm_mipi_dbi behavior is changed to 8-bit transfers.

Hoping for some feedback from the SPI maintainers.
MIPI DBI use the function spi_is_bpw_supported in
drivers/gpu/drm/drm_mipi_dbi.c.
spi_is_bpw_supported checks against a 32-bit bit mask to validate if
the bpw is supported.
SPI transfers are also validated against this mask if it is set but
this mask cannot support 64-bit words.

This driver patch adds 64-bit word support but breaks MIPI DBI since
bits_per_word_mask is no longer set.
Should the u32 bits_per_word_mask be converted to an u64?

>
> Yeah, the 64 won't work. I didn't check the macro.
>
> >
> > Neil
> >
> > >
> > >
> > >
> > >>          host->flags =3D (SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MU=
ST_TX);
> > >>          host->min_speed_hz =3D spicc->data->min_speed_hz;
> > >>          host->max_speed_hz =3D spicc->data->max_speed_hz;
> > >>
> > >> ---
> > >> base-commit: 49807ed87851916ef655f72e9562f96355183090
> > >> change-id: 20250408-spi-dma-c499f560d295
> > >>
> > >> Best regards,
> > >> --
> > >> Xianwei Zhao <xianwei.zhao@amlogic.com>
> > >>
> > >>
> > >>
> > >> _______________________________________________
> > >> linux-amlogic mailing list
> > >> linux-amlogic@lists.infradead.org
> > >> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> >

