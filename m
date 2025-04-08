Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C80ECC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 14:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgyLbZSexnBswDW15MI4UUpeOtwC0wIn58I5qn7B25M=; b=DSbAtz1dX86orGQcoDlo/ox1j5
	jUqSVoIaoGaVZOreAOAPkP8pOD0Xfmz1RhJYX8Fl5vpMIyVOaZjrPw4uNEW+KV3mwvHziHYlQxlmu
	0QmHe0Jh1aMZvWEushyVze8BohVUgvq62kXKyf9RptOWjfSiZFxQ+ZZFtvYaQbrcO7EV/l8XqiYw2
	T40ks562v+YLrtgRDpb3/y4AzTnbME5gfSJ4o666NG4krojbBMXSZGpYlfTsAM9ee7mlPAiEthRza
	IaKDNrMURqezx0CTIV44niE2vg6JGPOZRwQNKXfktvScADnjC6eFTJ+L3qpmTSgTxa3qfY7vUcmKl
	oIjNK7sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29Xb-00000004J3K-2YBK;
	Tue, 08 Apr 2025 14:03:03 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29I2-00000004G6O-25Yp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 13:46:59 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5e5e22e6ed2so8171338a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 06:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744120017; x=1744724817; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bgyLbZSexnBswDW15MI4UUpeOtwC0wIn58I5qn7B25M=;
        b=PUKJ43RKU5Koo87tv1PAmQxgAjvWGQJ6K6a7Tw3DmhxrcgyPKSf2pv+emE0gctOF8d
         p8dniupbPXdSbhZVJrtbsT4j/2ghecgtEQSIR4S49eD7JY1yEtLSUCcOurV02QXTCkn9
         2vdv+73WP1y3//iQcUYsY+8lna7ed4yTbddDHjCeJjDoeBYHk8dUrSyvgXORTTP0gs1C
         7zVSaQPtpeXf0NunGlr8aZmYY1IBz2tzbXpu/Z4BK9+rmRYg4NZ+b1DkxhHpxuKzxoWB
         gQto1e6UW9VX5kBnnoba3HwhdJlfXeNFnqEkm/n2OD0xHkVwBZb9VQ93kwQeJyXk3+DA
         TIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744120017; x=1744724817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bgyLbZSexnBswDW15MI4UUpeOtwC0wIn58I5qn7B25M=;
        b=trB3PE4qp3Ix0iyC1/0jwLhzQx2emBvhqxwVIq8CGnKFNP5A73clP+grK10xkUouZ3
         0vFa/u/eVwvSeSAJ1sJZXXQx6m7HC353pGZUNxFOhJzTF4/xUQCUaMu9sAbH3v2mfKw1
         F9d5ljj3wQ9pO9qP+8fORLHH4aIAOmxdYo1TmPEgjCc3ShVFMT2oXd7GuZK5RF6Lpw6i
         /mjnUWuV4s1xFRHwaNjAsuo3/L04du5JzSbu0ZnixuFLS9O0oeyseUi7Gv4EKxgd1J4x
         OOkXCN5IjInaj8oVNfpyvDTRBouTMmBUj/QkJmHdJmD2HQaZeIRsq4mDtYSzTy6yUkeA
         j8Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWz6cUmdUGu58TtMQc/3oF4ynEB9r2zfrhDIm4rKJkMoQtPEq52KI3plOw2vq8mNs0bm6WCz8hSH7EwqUoKNWIX@lists.infradead.org
X-Gm-Message-State: AOJu0Yzbj6DHLSR4Nupo1/DuFZKIho29OBaPC/klRjGuh/KSFZXnEzTg
	Dv3GXiR87oeN0I7AP4Fpm4P3mr5FkriSi1skTbXaYvzYXCd+otiaGkubZX/jzkxL5WYyNpV7tBt
	1koQxk2xrgLqoHmUP9RVA3LKiIWNovoE5qAQU8Q==
X-Gm-Gg: ASbGncuFwG184tff8yhikcRNfZEuwARfo1vH2EbGf/lWJkaLByTh8msIn2+o6YF2J9M
	4G1pZuGST2xwB0czKLL1TOXjASm+U0Xq2n86zm71zeKqdwOzuneUBrS1alkOUfsovXYvt61mc9v
	Bt5EokA4bsZAAe9SCz498gzVsb4JHh0Fjhpobjkh7fbBwcnw60mdZ0VJ0jLI8=
X-Google-Smtp-Source: AGHT+IFaA6tYh/ixqokAeN51veqxmI6baDoKuIBqp0NvCY+LdImghfFhSFlno0afKLlPeKb2PBEk5yKiA9fEgcZjpUw=
X-Received: by 2002:a05:6402:35cc:b0:5ec:fd7d:fdd5 with SMTP id
 4fb4d7f45d1cf-5f0b66314e8mr12642169a12.29.1744120016443; Tue, 08 Apr 2025
 06:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250403100124.637889-1-iuliana.prodan@oss.nxp.com>
 <Z_P6n5wQfGuSmV2B@p14s> <29a04e57-2b41-4571-8bb9-ab3222105d8c@nxp.com>
In-Reply-To: <29a04e57-2b41-4571-8bb9-ab3222105d8c@nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 8 Apr 2025 07:46:44 -0600
X-Gm-Features: ATxdqUGODn7x4BOhzuqDm2fA1myzbrI7LuEBpht_dHz_Knr0r42GIWxUl-efsI0
Message-ID: <CANLsYkzNkgNs03oaEeERxuqrxfjcp3cgs346AnTw1aeOqz5+ww@mail.gmail.com>
Subject: Re: [PATCH v3] remoteproc: imx_dsp_rproc: Add support for
 DSP-specific features
To: Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, "S.J. Wang" <shengjiu.wang@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Mpuaudiosw <Mpuaudiosw@nxp.com>, imx@lists.linux.dev, linux-remoteproc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, "Iuliana Prodan (OSS)" <iuliana.prodan@oss.nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_064658_541042_06564A9D 
X-CRM114-Status: GOOD (  44.39  )
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

On Tue, 8 Apr 2025 at 02:47, Iuliana Prodan <iuliana.prodan@nxp.com> wrote:
>
> Hello Mathieu,
>
> On 4/7/2025 7:17 PM, Mathieu Poirier wrote:
> > Good morning,
> >
> > On Thu, Apr 03, 2025 at 01:01:24PM +0300, Iuliana Prodan (OSS) wrote:
> >> From: Iuliana Prodan <iuliana.prodan@nxp.com>
> >>
> >> Some DSP firmware requires a FW_READY signal before proceeding, while
> >> others do not.
> >> Therefore, add support to handle i.MX DSP-specific features.
> >>
> >> Implement handle_rsc callback to handle resource table parsing and to
> >> process DSP-specific resource, to determine if waiting is needed.
> >>
> >> Update imx_dsp_rproc_start() to handle this condition accordingly.
> >>
> >> Signed-off-by: Iuliana Prodan <iuliana.prodan@nxp.com>
> >> ---
> >> Changes in v3:
> >> - Reviews from Mathieu Poirier:
> >>    - Added version and magic number to vendor-specific resource table entry.
> >>    - Updated defines to maintain backward compatibility with a resource table that doesn't have a vendor-specific resource.
> >>      - By default, wait for `fw_ready`, unless specified otherwise.
> >> - Link to v2: https://lore.kernel.org/all/20250318215007.2109726-1-iuliana.prodan@oss.nxp.com
> >>
> >> Changes in v2:
> >> - Reviews from Mathieu Poirier:
> >>    - Use vendor-specific resource table entry.
> >>    - Implement resource handler specific to the i.MX DSP.
> >> - Revise commit message to include recent updates.
> >> - Link to v1: https://lore.kernel.org/all/20250305123923.514386-1-iuliana.prodan@oss.nxp.com/
> >>
> >>   drivers/remoteproc/imx_dsp_rproc.c | 102 ++++++++++++++++++++++++++++-
> >>   1 file changed, 100 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> >> index b9bb15970966..80d4470cc731 100644
> >> --- a/drivers/remoteproc/imx_dsp_rproc.c
> >> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> >> @@ -35,9 +35,17 @@ module_param_named(no_mailboxes, no_mailboxes, int, 0644);
> >>   MODULE_PARM_DESC(no_mailboxes,
> >>               "There is no mailbox between cores, so ignore remote proc reply after start, default is 0 (off).");
> >>
> >> +/* Flag indicating that the remote is up and running */
> >>   #define REMOTE_IS_READY                            BIT(0)
> >> +/* Flag indicating that the host should wait for a firmware-ready response */
> >> +#define WAIT_FW_READY                               BIT(1)
> >>   #define REMOTE_READY_WAIT_MAX_RETRIES              500
> >>
> >> +/* This flag is set in the DSP resource table's features field to indicate
> >> + * that the firmware requires the host NOT to wait for a FW_READY response.
> >> + */
> >> +#define FEATURE_DONT_WAIT_FW_READY          BIT(0)
> >> +
> >>   /* att flags */
> >>   /* DSP own area */
> >>   #define ATT_OWN                                    BIT(31)
> >> @@ -72,6 +80,10 @@ MODULE_PARM_DESC(no_mailboxes,
> >>
> >>   #define IMX8ULP_SIP_HIFI_XRDC                      0xc200000e
> >>
> >> +#define FW_RSC_NXP_S_MAGIC                  ((uint32_t)'n' << 24 |  \
> >> +                                             (uint32_t)'x' << 16 |  \
> >> +                                             (uint32_t)'p' << 8 |   \
> >> +                                             (uint32_t)'s')
> >>   /*
> >>    * enum - Predefined Mailbox Messages
> >>    *
> >> @@ -136,6 +148,24 @@ struct imx_dsp_rproc_dcfg {
> >>      int (*reset)(struct imx_dsp_rproc *priv);
> >>   };
> >>
> >> +/**
> >> + * struct fw_rsc_imx_dsp - i.MX DSP specific info
> >> + *
> >> + * @len: length of the resource entry
> >> + * @magic_num: 32-bit magic number
> >> + * @version: version of data structure
> >> + * @features: feature flags supported by the i.MX DSP firmware
> >> + *
> >> + * This represents a DSP-specific resource in the firmware's
> >> + * resource table, providing information on supported features.
> >> + */
> >> +struct fw_rsc_imx_dsp {
> >> +    uint32_t len;
> >> +    uint32_t magic_num;
> >> +    uint32_t version;
> >> +    uint32_t features;
> >> +} __packed;
> >> +
> >>   static const struct imx_rproc_att imx_dsp_rproc_att_imx8qm[] = {
> >>      /* dev addr , sys addr  , size      , flags */
> >>      { 0x596e8000, 0x556e8000, 0x00008000, ATT_OWN },
> >> @@ -300,6 +330,73 @@ static int imx_dsp_rproc_ready(struct rproc *rproc)
> >>      return -ETIMEDOUT;
> >>   }
> >>
> >> +/**
> >> + * imx_dsp_rproc_handle_rsc() - Handle DSP-specific resource table entries
> >> + * @rproc: remote processor instance
> >> + * @rsc_type: resource type identifier
> >> + * @rsc: pointer to the resource entry
> >> + * @offset: offset of the resource entry
> >> + * @avail: available space in the resource table
> >> + *
> >> + * Parse the DSP-specific resource entry and update flags accordingly.
> >> + * If the WAIT_FW_READY feature is set, the host must wait for the firmware
> >> + * to signal readiness before proceeding with execution.
> >> + *
> >> + * Return: RSC_HANDLED if processed successfully, RSC_IGNORED otherwise.
> >> + */
> >> +static int imx_dsp_rproc_handle_rsc(struct rproc *rproc, u32 rsc_type,
> >> +                                void *rsc, int offset, int avail)
> >> +{
> >> +    struct imx_dsp_rproc *priv = rproc->priv;
> >> +    struct fw_rsc_imx_dsp *imx_dsp_rsc = rsc;
> >> +    struct device *dev = rproc->dev.parent;
> >> +    size_t expected_size;
> >> +
> >> +    if (!imx_dsp_rsc) {
> >> +            dev_dbg(dev, "Invalid fw_rsc_imx_dsp.\n");
> >> +            goto ignored;
> >> +    }
> >> +
> >> +    /* Make sure resource isn't truncated */
> >> +    expected_size = imx_dsp_rsc->len + sizeof(imx_dsp_rsc->len);
> > Something seems odd with this check... I don't see how adding
> > imx_dsp_rsc->len with 4 will give us any indication of the expected size.
> The fw_rsc_imx_dsp structure is based on Zephyr and OpenAMP ([1]).
>
> The imx_dsp_rsc->len indicates the available resource size. Adding 4
> bytes (for uint32_t len member) gives the total structure size. If this
> does not match sizeof(struct fw_rsc_imx_dsp), the structure is incomplete.
>

Ok, but why is adding 4 to imx_dsp_rsc->len needed?  Why doesn't
imx_dsp_rsc->len already contain the right size?

The size of struct fw_rsc_imx_dsp is 16 byte.  From your
implementation, it seems like ->len is equal to 12 and 4 needs to be
added to make it 16.  To me ->len should be 16... What am I missing?

> I will also verify with avail and send a v4.
>
> [1]
> https://github.com/OpenAMP/open-amp/blob/main/lib/include/openamp/remoteproc.h#L356
>
> Thanks,
> Iulia
> >   To me
> > two checks are required here:
> >
> > 1) if (sizeof(*rsc) > avail)
> >
> > 2) if (sizeof(*rsc) != imx_dsp_rsc->len)
> >
> > Otherwise I'm good with this new revision.
> >
> > Thanks,
> > Mathieu
> >
> >> +    if (expected_size < sizeof(struct fw_rsc_imx_dsp)) {
> >> +            dev_dbg(dev, "Resource fw_rsc_imx_dsp is truncated.\n");
> >> +            goto ignored;
> >> +    }
> >> +
> >> +    /*
> >> +     * If FW_RSC_NXP_S_MAGIC number is not found then
> >> +     * wait for fw_ready reply (default work flow)
> >> +     */
> >> +    if (imx_dsp_rsc->magic_num != FW_RSC_NXP_S_MAGIC) {
> >> +            dev_dbg(dev, "Invalid resource table magic number.\n");
> >> +            goto ignored;
> >> +    }
> >> +
> >> +    /*
> >> +     * For now, in struct fw_rsc_imx_dsp, version 0,
> >> +     * only FEATURE_DONT_WAIT_FW_READY is valid.
> >> +     *
> >> +     * When adding new features, please upgrade version.
> >> +     */
> >> +    if (imx_dsp_rsc->version > 0) {
> >> +            dev_warn(dev, "Unexpected fw_rsc_imx_dsp version %d.\n",
> >> +                     imx_dsp_rsc->version);
> >> +            goto ignored;
> >> +    }
> >> +
> >> +    if (imx_dsp_rsc->features & FEATURE_DONT_WAIT_FW_READY)
> >> +            priv->flags &= ~WAIT_FW_READY;
> >> +    else
> >> +            priv->flags |= WAIT_FW_READY;
> >> +
> >> +    return RSC_HANDLED;
> >> +
> >> +ignored:
> >> +    priv->flags |= WAIT_FW_READY;
> >> +    return RSC_IGNORED;
> >> +}
> >> +
> >>   /*
> >>    * Start function for rproc_ops
> >>    *
> >> @@ -335,8 +432,8 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
> >>
> >>      if (ret)
> >>              dev_err(dev, "Failed to enable remote core!\n");
> >> -    else
> >> -            ret = imx_dsp_rproc_ready(rproc);
> >> +    else if (priv->flags & WAIT_FW_READY)
> >> +            return imx_dsp_rproc_ready(rproc);
> >>
> >>      return ret;
> >>   }
> >> @@ -936,6 +1033,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
> >>      .kick           = imx_dsp_rproc_kick,
> >>      .load           = imx_dsp_rproc_elf_load_segments,
> >>      .parse_fw       = imx_dsp_rproc_parse_fw,
> >> +    .handle_rsc     = imx_dsp_rproc_handle_rsc,
> >>      .find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
> >>      .sanity_check   = rproc_elf_sanity_check,
> >>      .get_boot_addr  = rproc_elf_get_boot_addr,
> >> --
> >> 2.25.1
> >>

