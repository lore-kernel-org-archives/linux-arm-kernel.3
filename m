Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89868EA7950
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 02:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HjF1oe/j6F+p4WP4e0eq4iSGoPJ70DW7/iIuXSYvlGc=; b=bZ3BiHEq6NmiTwZOA2TKM/s6jp
	zFhtBlkPVXqVTTtBvtx8vNEQttCHuNFMlJbndM/v+t5Z0ciItdikOjnFWEGcMfFbzke+B9v0GNc4u
	cG/eod2OmCRlnYJwflcu+v7mwnb6O+KNzPsAl5TE4v9a+SteQJC7ote7ARs7pnaaZ5+DHNu+YrTLx
	xwO5q+g5sKKn7Bl44FKcIIbReZNJZN36LSNqKb889yoEPJ2kUwxjbDPliKZGBIGjggHfE+nPVWBJB
	43G8hLHhzVkxLaQZgKqal/+l2uXP5/wIckst9h+tO3b+BiwJSzI6UGrCSXoncWt2SIlbehh8xCx/v
	FeZcGFZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnpEA-00000009KP9-1XDR;
	Thu, 05 Feb 2026 02:36:20 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnpE7-00000009KOh-0t4w
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 02:36:16 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-bc17d39ccd2so126444a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 18:36:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770258974; cv=none;
        d=google.com; s=arc-20240605;
        b=dcU4Wa7APNbmwMBN7YU5lZ/+HMn/hC7HRTnkJFPxry6YCjUd9pWbZJ8GHPSDQUtlYT
         IjuBg/ejSvD/9kgmJx2WbeeyAxG1CYeZCZp/C+2M5xa/NOegHLlgB1zjv7v1eUqQ4SB8
         quf5bh/815eqLgIaC1hDz7m6obT/EC+gNzxhp7ZViJRM3MuzxNoLzjd0INggOnAJW1CW
         u00lGTaDHTH4FVt9OE7ua6MHCblJETU/rr05KityTFX0rimdDHcTI3bjuPWM0Rc8lzGj
         r41Mib6049iEaYH54b99CavmL/4EFuJ0Sblv0tJdQ4ZCs4ewzsx8ur74nFf1zKKSO9lg
         Fpeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HjF1oe/j6F+p4WP4e0eq4iSGoPJ70DW7/iIuXSYvlGc=;
        fh=0D1kD/spCG+JeBhLEZBpsz63nlL2gt4T8v22wAtYnOM=;
        b=E1i8L3i2aCSGNoGkP+na9c2sRuQbFOSDwt1rrXPN4DdMNACTR8O8HoZNpz76756EXA
         qD5lwE6TdL7tW6pphxKFSmsMUvs82925Xi1Y3jku9IF1e3n4ATWepcazEKJrLx2coDiO
         50VNMekHxo1iYduq+s/mXx2Dfi6M2Pn/ptEVkQMm3j3/V57P4GD3mXvOmDrjjt+TVrWn
         64OIjA93tCGR+lCBS1dasVvvH1blcipVRyC2lPTZPhaPnvBRUZ3855BQxolwn5+anVKN
         MiyYjIPJwblwZ4JvITnF5/+fwf3nQ3+7+L/25cCYNH8Ls9kywvUiA3BErdOeySVMKKbH
         l7Ug==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770258974; x=1770863774; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjF1oe/j6F+p4WP4e0eq4iSGoPJ70DW7/iIuXSYvlGc=;
        b=TFJ68WUoOTnjENn6zx4Ku81+sf0h5lWmq9bLrSqGPlHWWpWI4ilWgWMkGxA3uYttan
         VB1Z52ySRsXL0jgHQdi6PBUdspn0KO4vz7wdmQu2FyNfpVgMdXcR9R4mzoNhB+UQc91x
         0vyfFj7v6ZdcLmWPMeXsnXr+4YYrVJRChYo8xO6RUSnuzl00ZtAdZJEAZ9pACrsg1NtI
         4nfbNGsdumtmgi/ZgJpIiwcwDWbvPgmXMERscHhUsZlV/9W0FON68znzqGVoWejiCvmQ
         Civ7GYheLSVd6vMk7ms8cFRcFOcnHEHWmilA8nxmeW/ihKtTxrBj9W8DqZDadxYtUYmH
         Vjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770258974; x=1770863774;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HjF1oe/j6F+p4WP4e0eq4iSGoPJ70DW7/iIuXSYvlGc=;
        b=TBbZKVSgp6GltLkhybzXcgkR4+CMsmfxjJ/RDYzIepbg7uefkeN1seO1tU48nLscRY
         oTSJVu2cJocbF6A+TaEOGcAqD7D0gWNyMju+VUwmRq4br8IwbmAVToZVaEI6jTgQL+8I
         dJgFg++xxQU8CaTOObtDkal7+Bvgu8FahDEhddMyhAAcBf+AKg3cgXYX6LF0ib6seDjt
         6TWT7HEhOZUcer6F8wiIzvlDZWGFy/UKVp8c8NEpkA/lMTxi24QSn2AZeiX1TZNHWyfi
         s4vwlYNgHD9xexzhdJnFcylAaBg2IjYo/tV00ZHVtWawGD9rBQXTlVAIGpUOnjQXphAb
         THcg==
X-Forwarded-Encrypted: i=1; AJvYcCVdR/8GoxUAXaAABP3kaMNLLtR/pVDDMbR+zmY+aL9XM7hQGVomOj1Q4vx4gOyQSfj2JbpMpKUqH4oDhGN08o0A@lists.infradead.org
X-Gm-Message-State: AOJu0Yzjstehp10Jvu7jjty/6/iiE7Bskn52RdPLp0hYDeWZTFnJd9Tb
	+T/6ARQSTcBQcwzjRpNvcG29DAFnqsrlKO34NW9nRFM5qWrXBNn3yiF8BrU1fUxmNKXcbDLvW3p
	ehnd5z3e5/Y35uf1oRbDc3Gm4rXTA260=
X-Gm-Gg: AZuq6aJB7goutCa5UNNYgTlCySjnQBJVzlJBDR7snUbxWk27KxnnTSOafOF4kvfWWpl
	A/n9L4zn3fjkdAPSn51pi8fRvbBMd/7DPrvjyhZ/2U2nAq0PGGqOA6jCHYtF2Rtry3zYrD9GQYe
	H100DNp9Hjn3lyWBmNVXm5Yho+zwcpszZoUmm/mBlsiqiIlO5tGZHBPhYjvRBJvM0G6B3LvQcOO
	K6aQTlEGQPkI+yF4QAQIzaukhEYl3linT7+DV7g37n2DvdDxLu6QIaAguVbabr/U+3uxYD4Syk3
	y2jrIw==
X-Received: by 2002:a17:90b:3884:b0:340:4abf:391d with SMTP id
 98e67ed59e1d1-35487125d82mr4318915a91.16.1770258973498; Wed, 04 Feb 2026
 18:36:13 -0800 (PST)
MIME-Version: 1.0
References: <20260203031345.3850533-1-shengjiu.wang@nxp.com>
 <20260203031345.3850533-3-shengjiu.wang@nxp.com> <aYI2KZE8/MGQ633A@lizhi-Precision-Tower-5810>
 <CAA+D8APXwucOLhhnZF7ASPufWyQs4tbxtR46UFdpm=4wRyHOyA@mail.gmail.com> <aYN0CQbRwyYJDlJn@lizhi-Precision-Tower-5810>
In-Reply-To: <aYN0CQbRwyYJDlJn@lizhi-Precision-Tower-5810>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 5 Feb 2026 10:36:01 +0800
X-Gm-Features: AZwV_QgTCuKmUaXOlpjmbiCTEgTaxxVjxr1vFqJ32-N2ro_Vxt5AFFdiFJtKCnI
Message-ID: <CAA+D8AN_xej-DWHbWKMCwgZVVcW9N2mHrK=4GUyoRiGLXBAoTw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] ASoC: fsl_asrc_m2m: Add option to start ASRC
 before DMA device for M2M
To: Frank Li <Frank.li@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, perex@perex.cz, tiwai@suse.com, 
	linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_183615_292678_29C57BEC 
X-CRM114-Status: GOOD (  37.20  )
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

On Thu, Feb 5, 2026 at 12:30=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrote:
>
> On Wed, Feb 04, 2026 at 09:41:55AM +0800, Shengjiu Wang wrote:
> > On Wed, Feb 4, 2026 at 1:53=E2=80=AFAM Frank Li <Frank.li@nxp.com> wrot=
e:
> > >
> > > On Tue, Feb 03, 2026 at 11:13:43AM +0800, Shengjiu Wang wrote:
> > > > There is a limitation on i.MX952 that dma request is not cleared at=
 the
> > > > end of conversion with dma slave mode. Which causes sample is dropp=
ed
> > > > from the input fifo on the second time if dma is triggered before t=
he
> > > > client device and EDMA may copy wrong data from output fifo as the =
output
> > > > fifo is not ready in the beginning.
> > > >
> > > > The solution is to trigger asrc before dma on i.MX952, and add dela=
y to
> > > > wait output data is generated then start the EDMA for output, other=
wise
> > > > the m2m function has noise issues.
> > > >
> > > > So add an option to start ASRC first for M2M before ASRC is enabled=
 on
> > > > i.MX952.
> > > >
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > ---
> > > >  sound/soc/fsl/fsl_asrc.c        | 23 +++++++++++++++++++++++
> > > >  sound/soc/fsl/fsl_asrc.h        |  4 ++++
> > > >  sound/soc/fsl/fsl_asrc_common.h |  4 ++++
> > > >  sound/soc/fsl/fsl_asrc_m2m.c    |  8 +++++++-
> > > >  4 files changed, 38 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> > > > index 92fb16f7be45..b6d4f1e09e2e 100644
> > > > --- a/sound/soc/fsl/fsl_asrc.c
> > > > +++ b/sound/soc/fsl/fsl_asrc.c
> > > > @@ -1078,6 +1078,27 @@ static unsigned int fsl_asrc_get_output_fifo=
_size(struct fsl_asrc_pair *pair)
> > > >       return val >> ASRFSTi_OUTPUT_FIFO_SHIFT;
> > > >  }
> > > >
> > > > +static bool fsl_asrc_m2m_output_ready(struct fsl_asrc_pair *pair)
> > > > +{
> > > > +     struct fsl_asrc *asrc =3D pair->asrc;
> > > > +     enum asrc_pair_index index =3D pair->index;
> > > > +     int retry =3D 1000;
> > > > +     u32 val;
> > > > +     int ret;
> > > > +
> > > > +     /* Check output fifo status if it exceeds the watermark. */
> > > > +     ret =3D regmap_read_poll_timeout(asrc->regmap, REG_ASRFST(ind=
ex), val,
> > > > +                                    (ASRFSTi_OUTPUT_FIFO_FILL(val)=
 >=3D ASRC_M2M_OUTPUTFIFO_WML) ||
> > > > +                                    (--retry =3D=3D 0), 0, USEC_PE=
R_SEC);
> > >
> > > are sure need "retry"? there are timeout, which should be equal to 'r=
etry'.
> >
> > Yes, "retry" is what I want, timeout is not what I expected.
>
> Okay, but it will be strange. you polling a register, you suppose it will
> be finished below 1000 IO read, which is certain time in SoC, for example
> 1ms. Compare to timeout us value, 1000 is hard to understand why you choo=
se
> this value.

It can be removed by reducing the timeout time.
will update in the next version.

best regards
Shengjiu Wang

>
> Frank
> >
> > Best regards
> > Shengjiu Wang
> >
> > >
> > > Frank
> > > > +
> > > > +     if (ret || !retry) {
> > > > +             pair_warn("output is not ready\n");
> > > > +             return false;
> > > > +     }
> > > > +
> > > > +     return true;
> > > > +}
> > > > +
> > > >  static int fsl_asrc_m2m_prepare(struct fsl_asrc_pair *pair)
> > > >  {
> > > >       struct fsl_asrc_pair_priv *pair_priv =3D pair->private;
> > > > @@ -1275,6 +1296,7 @@ static int fsl_asrc_probe(struct platform_dev=
ice *pdev)
> > > >
> > > >       asrc_priv->soc =3D of_device_get_match_data(&pdev->dev);
> > > >       asrc->use_edma =3D asrc_priv->soc->use_edma;
> > > > +     asrc->start_before_dma =3D asrc_priv->soc->start_before_dma;
> > > >       asrc->get_dma_channel =3D fsl_asrc_get_dma_channel;
> > > >       asrc->request_pair =3D fsl_asrc_request_pair;
> > > >       asrc->release_pair =3D fsl_asrc_release_pair;
> > > > @@ -1289,6 +1311,7 @@ static int fsl_asrc_probe(struct platform_dev=
ice *pdev)
> > > >       asrc->m2m_get_maxburst =3D fsl_asrc_m2m_get_maxburst;
> > > >       asrc->m2m_pair_resume =3D fsl_asrc_m2m_pair_resume;
> > > >       asrc->m2m_get_cap =3D fsl_asrc_m2m_get_cap;
> > > > +     asrc->m2m_output_ready =3D fsl_asrc_m2m_output_ready;
> > > >
> > > >       if (of_device_is_compatible(np, "fsl,imx35-asrc")) {
> > > >               asrc_priv->clk_map[IN] =3D input_clk_map_imx35;
> > > > diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
> > > > index 1c492eb237f5..60b6865ca952 100644
> > > > --- a/sound/soc/fsl/fsl_asrc.h
> > > > +++ b/sound/soc/fsl/fsl_asrc.h
> > > > @@ -257,6 +257,8 @@
> > > >  #define ASRFSTi_OUTPUT_FIFO_WIDTH    7
> > > >  #define ASRFSTi_OUTPUT_FIFO_SHIFT    12
> > > >  #define ASRFSTi_OUTPUT_FIFO_MASK     (((1 << ASRFSTi_OUTPUT_FIFO_W=
IDTH) - 1) << ASRFSTi_OUTPUT_FIFO_SHIFT)
> > > > +#define ASRFSTi_OUTPUT_FIFO_FILL(v)  \
> > > > +     (((v) & ASRFSTi_OUTPUT_FIFO_MASK) >> ASRFSTi_OUTPUT_FIFO_SHIF=
T)
> > > >  #define ASRFSTi_IAEi_SHIFT           11
> > > >  #define ASRFSTi_IAEi_MASK            (1 << ASRFSTi_IAEi_SHIFT)
> > > >  #define ASRFSTi_IAEi                 (1 << ASRFSTi_IAEi_SHIFT)
> > > > @@ -432,10 +434,12 @@ struct dma_block {
> > > >   *
> > > >   * @use_edma: using edma as dma device or not
> > > >   * @channel_bits: width of ASRCNCR register for each pair
> > > > + * @start_before_dma: start asrc before dma
> > > >   */
> > > >  struct fsl_asrc_soc_data {
> > > >       bool use_edma;
> > > >       unsigned int channel_bits;
> > > > +     bool start_before_dma;
> > > >  };
> > > >
> > > >  /**
> > > > diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_as=
rc_common.h
> > > > index 0cd595b0f629..c8a1a2b5915d 100644
> > > > --- a/sound/soc/fsl/fsl_asrc_common.h
> > > > +++ b/sound/soc/fsl/fsl_asrc_common.h
> > > > @@ -107,6 +107,7 @@ struct fsl_asrc_pair {
> > > >   * @asrc_rate: default sample rate for ASoC Back-Ends
> > > >   * @asrc_format: default sample format for ASoC Back-Ends
> > > >   * @use_edma: edma is used
> > > > + * @start_before_dma: start asrc before dma
> > > >   * @get_dma_channel: function pointer
> > > >   * @request_pair: function pointer
> > > >   * @release_pair: function pointer
> > > > @@ -116,6 +117,7 @@ struct fsl_asrc_pair {
> > > >   * @m2m_start: function pointer
> > > >   * @m2m_unprepare: function pointer
> > > >   * @m2m_stop: function pointer
> > > > + * @m2m_output_ready: function pointer, check output fifo ready or=
 not
> > > >   * @m2m_calc_out_len: function pointer
> > > >   * @m2m_get_maxburst: function pointer
> > > >   * @m2m_pair_suspend: function pointer
> > > > @@ -143,6 +145,7 @@ struct fsl_asrc {
> > > >       int asrc_rate;
> > > >       snd_pcm_format_t asrc_format;
> > > >       bool use_edma;
> > > > +     bool start_before_dma;
> > > >
> > > >       struct dma_chan *(*get_dma_channel)(struct fsl_asrc_pair *pai=
r, bool dir);
> > > >       int (*request_pair)(int channels, struct fsl_asrc_pair *pair)=
;
> > > > @@ -154,6 +157,7 @@ struct fsl_asrc {
> > > >       int (*m2m_start)(struct fsl_asrc_pair *pair);
> > > >       int (*m2m_unprepare)(struct fsl_asrc_pair *pair);
> > > >       int (*m2m_stop)(struct fsl_asrc_pair *pair);
> > > > +     bool (*m2m_output_ready)(struct fsl_asrc_pair *pair);
> > > >
> > > >       int (*m2m_calc_out_len)(struct fsl_asrc_pair *pair, int input=
_buffer_length);
> > > >       int (*m2m_get_maxburst)(u8 dir, struct fsl_asrc_pair *pair);
> > > > diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_=
m2m.c
> > > > index f46881f71e43..77999526dd9e 100644
> > > > --- a/sound/soc/fsl/fsl_asrc_m2m.c
> > > > +++ b/sound/soc/fsl/fsl_asrc_m2m.c
> > > > @@ -253,15 +253,21 @@ static int asrc_m2m_device_run(struct fsl_asr=
c_pair *pair, struct snd_compr_task
> > > >       reinit_completion(&pair->complete[IN]);
> > > >       reinit_completion(&pair->complete[OUT]);
> > > >
> > > > +     if (asrc->start_before_dma)
> > > > +             asrc->m2m_start(pair);
> > > > +
> > > >       /* Submit DMA request */
> > > >       dmaengine_submit(pair->desc[IN]);
> > > >       dma_async_issue_pending(pair->desc[IN]->chan);
> > > >       if (out_dma_len > 0) {
> > > > +             if (asrc->start_before_dma && asrc->m2m_output_ready)
> > > > +                     asrc->m2m_output_ready(pair);
> > > >               dmaengine_submit(pair->desc[OUT]);
> > > >               dma_async_issue_pending(pair->desc[OUT]->chan);
> > > >       }
> > > >
> > > > -     asrc->m2m_start(pair);
> > > > +     if (!asrc->start_before_dma)
> > > > +             asrc->m2m_start(pair);
> > > >
> > > >       if (!wait_for_completion_interruptible_timeout(&pair->complet=
e[IN], 10 * HZ)) {
> > > >               dev_err(dev, "out DMA task timeout\n");
> > > > --
> > > > 2.34.1
> > > >

