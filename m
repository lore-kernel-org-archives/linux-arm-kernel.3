Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F269EC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 13:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PGZ9B42C0yWg7Qpk0chgVgDrU0joNg71F+OhP9lllNY=; b=4bmfchF1l0zX9wnU4Mi2BzjRdi
	rvYNIgZEWJ/K/h0iNIXIolc9yiP/y0t4NKy661etDKDCiY/ND3Aur1kuJm0YkVOf2DmUlEcX3xG/v
	fHjsnSrj6AvXPNErH4HefWbaQVMCLO+saMMl74TSv57K5tbLa9TAvtA06eQaIoIRHli6mpmLoawUp
	YCAy/CPPhyt2260rZq79y8FnR1d0eztci2TIC3dtTgB+nBIlEwXkeR8FSqyfLc/xo7qD5PykqagXj
	sm8giq74r8caE2osNrusE8NReIGXEAb/AHTeiNDOeStQoYBeUn3M1dDPG7T1L+h6G8XKvEVrh+/T3
	LbZ+Y8qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gXQ-00000005xMA-19qw;
	Tue, 15 Apr 2025 13:41:20 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gRO-00000005vzW-02zN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 13:35:07 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5e686d39ba2so10061488a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 06:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744724104; x=1745328904; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PGZ9B42C0yWg7Qpk0chgVgDrU0joNg71F+OhP9lllNY=;
        b=l6YD2F/f3zSfMaWJXDd7P4GpEBI++D8uGKqlZpp1vqi3mELvXbbpmTCNC76XajXa9e
         DQ+KzROFaOSjBkXRfQqKLGE75JVuWkqsbas3DWQJ+7sVtGOyiyAGugsTdFLTuQENiNuF
         UUiYffVnsle3vdGmFafDe2IFAqX2fuIPWlPGQ9NC8wI9dOku6RKF3nUwvPAHlXR78qbX
         gfxdqrHG322BaLNGSguochbdmY/FUXqhwU6kzX65kvVJKKs7F3hVjyVK28FoIRlgDI7a
         8IVm8UWkfMJL2DC2446XwSnZi2fFWuE0JmuF2HUaN7niuLSW4pqEtxXK3bX7uhMR3Ow8
         z7bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744724104; x=1745328904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PGZ9B42C0yWg7Qpk0chgVgDrU0joNg71F+OhP9lllNY=;
        b=qlji50n1XtK9D2gHF/xEbVe0sV4k/mKWYfvfq7h4+qCQOUgGmILm6KZCV89xSKnz88
         yE5iakNY2lLzZlRSrvcGvNAOeMouz4jDRL+pgM8pbyVn+LkRQo9SMMHfYox6g07njMQc
         Roc91cRIzQRfFIPNOSPikYDSFUUtb+FCHCnBKPmsKCEjBbIOejnG7gRpDdxFg4486n95
         i90aIQTSPHVAyXAI/FNov9Osi/RDN4N3NzXebQgCgIOmLdoa09XX1RXPytKcLQHKdqED
         2UzgexkLWlGLB8FAuEMjMlYjCovw6whlpPaA5vfDxalxNCiYx6faNbCg5Mjx+VzXP8AZ
         ruWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjsRQB4juWkJ7Qc3N8IwUgeOYBJh2qgbVBhyaKHI1GxQC64YQ/8TVHJIykd65I7vGvGrmv1Q4yXukzSreFSPVE@lists.infradead.org
X-Gm-Message-State: AOJu0YyF50hMSvmjNwcEYmgFyFSYodRnZfNMg/HSRsn7HRa2HJNdc7D9
	nl7Zbk/2anCXxNbOWHyu7FDi42kMXvbCiI55E6akfomrAWTrCRT3LLyUVn1aBY2Ug8Easf5ACMd
	wYWE+//vix0qKKMZDoapbbyPwoyo0noaRh+q7Tg==
X-Gm-Gg: ASbGncuk+OVZNfi2eYdvAgD++X2BOJP2zzSmW/rmaeTy6/2kR3rmUWlviCbJ+0aRkqS
	pADmfhyifcl2romLBKlmFCX7Sb7z06+0k+WXNanIyrIB2VbN6dtApd3m11vAflr30nRInkOxlxR
	qGwBJ+cNgEpOsQTIhuxZAytBzikcAFBvxaNQkd7oGPvJPSC1UX/hnU1M2s
X-Google-Smtp-Source: AGHT+IFeWYl7QrxdNMXm+KJ0xt4slhUexWmapLP1aBEJ5DfrmKAWMNsZFlYEzQq89QgGem5AgCQoBcOQpxhvkd68zAk=
X-Received: by 2002:a05:6402:1e96:b0:5f0:9eb3:8e76 with SMTP id
 4fb4d7f45d1cf-5f3702b02eamr14469259a12.34.1744724103928; Tue, 15 Apr 2025
 06:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250409213030.3489481-1-iuliana.prodan@oss.nxp.com>
 <Z_0snwzpkPTJqjWX@p14s> <8116ac27-4c2e-41a4-9e05-7d20a7c6a361@nxp.com>
In-Reply-To: <8116ac27-4c2e-41a4-9e05-7d20a7c6a361@nxp.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Tue, 15 Apr 2025 07:34:52 -0600
X-Gm-Features: ATxdqUGSQ5S_l_W8BKKUHjnxrDXxD3sYIeidnBz7Dp1f6y94_0PqsAy6EwgwgCw
Message-ID: <CANLsYkzehT=ghX0XCNEp7Dod1Jc1YCm33B3ByDrfMoKvbssHag@mail.gmail.com>
Subject: Re: [PATCH v4] remoteproc: imx_dsp_rproc: Add support for
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
X-CRM114-CacheID: sfid-20250415_063506_051352_479EC991 
X-CRM114-Status: GOOD (  47.78  )
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

On Tue, 15 Apr 2025 at 05:04, Iuliana Prodan <iuliana.prodan@nxp.com> wrote:
>
> On 4/14/2025 6:41 PM, Mathieu Poirier wrote:
> > On Thu, Apr 10, 2025 at 12:30:30AM +0300, Iuliana Prodan (OSS) wrote:
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
> >> Changes in v4:
> >> - Reviews from Mathieu Poirier:
> >>    - Adjusted len to include the size of struct fw_rsc_imx_dsp.
> >>    - Updated len validation checks.
> >> - Review from Frank Li:
> >>    - In imx_dsp_rproc_handle_rsc(), removed the goto ignored statement.
> >> - In probe(), set flags to WAIT_FW_READY to ensure the host waits
> >> for fw_ready when no vendor-specific resource is defined.
> >> - Link to v3: https://lore.kernel.org/all/20250403100124.637889-1-iuliana.prodan@oss.nxp.com/
> >>
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
> >>   drivers/remoteproc/imx_dsp_rproc.c | 98 +++++++++++++++++++++++++++++-
> >>   1 file changed, 96 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/remoteproc/imx_dsp_rproc.c b/drivers/remoteproc/imx_dsp_rproc.c
> >> index b9bb15970966..e4212e624a91 100644
> >> --- a/drivers/remoteproc/imx_dsp_rproc.c
> >> +++ b/drivers/remoteproc/imx_dsp_rproc.c
> >> @@ -35,9 +35,18 @@ module_param_named(no_mailboxes, no_mailboxes, int, 0644);
> >>   MODULE_PARM_DESC(no_mailboxes,
> >>               "There is no mailbox between cores, so ignore remote proc reply after start, default is 0 (off).");
> >>
> >> +/* Flag indicating that the remote is up and running */
> >>   #define REMOTE_IS_READY                            BIT(0)
> >> +/* Flag indicating that the host should wait for a firmware-ready response */
> >> +#define WAIT_FW_READY                               BIT(1)
> >>   #define REMOTE_READY_WAIT_MAX_RETRIES              500
> >>
> >> +/*
> >> + * This flag is set in the DSP resource table's features field to indicate
> >> + * that the firmware requires the host NOT to wait for a FW_READY response.
> >> + */
> >> +#define FEATURE_DONT_WAIT_FW_READY          BIT(0)
> >> +
> >>   /* att flags */
> >>   /* DSP own area */
> >>   #define ATT_OWN                                    BIT(31)
> >> @@ -72,6 +81,10 @@ MODULE_PARM_DESC(no_mailboxes,
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
> >> @@ -136,6 +149,24 @@ struct imx_dsp_rproc_dcfg {
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
> >> @@ -300,6 +331,66 @@ static int imx_dsp_rproc_ready(struct rproc *rproc)
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
> >> +
> >> +    if (!imx_dsp_rsc) {
> >> +            dev_dbg(dev, "Invalid fw_rsc_imx_dsp.\n");
> >> +            return RSC_IGNORED;
> >> +    }
> >> +
> >> +    /* Make sure resource isn't truncated */
> >> +    if (sizeof(struct fw_rsc_imx_dsp) > avail ||
> > We agree on that part.
> >
> >> +        sizeof(struct fw_rsc_imx_dsp) < imx_dsp_rsc->len) {
> >  From the above, "sizeof(struct fw_rsc_imx_dsp) > imx_dsp_rsc->len" would be a
> > valid condition when it clearly isn't.  I am still convinced the only
> > valid option is:
> >
> >              sizeof(struct fw_rsc_imx_dsp) != imx_dsp_rsc->len)
> >
> > I am happy to change my mind but would need more information.
>
> You're right, it should be sizeof(struct fw_rsc_imx_dsp) > imx_dsp_rsc->len.
> The ->len comes from the remote size, while in Linux we need to check if
> the length is at least sizeof(struct fw_rsc_imx_dsp).

To be clear, I think it should _not_ be sizeof(struct fw_rsc_imx_dsp)
> imx_dsp_rsc->len, this is an error condition.

> This is for backwards compatibility - if someone changes the structure
> on the remote side and increases the length, in Linux we can still load
> that firmware, but probably not all features will be checked.

And nothing good can come out of that situation.

>
> If you agree with this, I'll send a v5 with this fix - s/</>.

To me, the only valid condition is:

sizeof(struct fw_rsc_imx_dsp) != imx_dsp_rsc->len)

>
> Thanks,
> Iulia
>
> > Thanks,
> > Mathieu
> >
> >> +            dev_dbg(dev, "Resource fw_rsc_imx_dsp is truncated.\n");
> >> +            return RSC_IGNORED;
> >> +    }
> >> +
> >> +    /*
> >> +     * If FW_RSC_NXP_S_MAGIC number is not found then
> >> +     * wait for fw_ready reply (default work flow)
> >> +     */
> >> +    if (imx_dsp_rsc->magic_num != FW_RSC_NXP_S_MAGIC) {
> >> +            dev_dbg(dev, "Invalid resource table magic number.\n");
> >> +            return RSC_IGNORED;
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
> >> +            return RSC_IGNORED;
> >> +    }
> >> +
> >> +    if (imx_dsp_rsc->features & FEATURE_DONT_WAIT_FW_READY)
> >> +            priv->flags &= ~WAIT_FW_READY;
> >> +
> >> +    return RSC_HANDLED;
> >> +}
> >> +
> >>   /*
> >>    * Start function for rproc_ops
> >>    *
> >> @@ -335,8 +426,8 @@ static int imx_dsp_rproc_start(struct rproc *rproc)
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
> >> @@ -936,6 +1027,7 @@ static const struct rproc_ops imx_dsp_rproc_ops = {
> >>      .kick           = imx_dsp_rproc_kick,
> >>      .load           = imx_dsp_rproc_elf_load_segments,
> >>      .parse_fw       = imx_dsp_rproc_parse_fw,
> >> +    .handle_rsc     = imx_dsp_rproc_handle_rsc,
> >>      .find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
> >>      .sanity_check   = rproc_elf_sanity_check,
> >>      .get_boot_addr  = rproc_elf_get_boot_addr,
> >> @@ -1053,6 +1145,8 @@ static int imx_dsp_rproc_probe(struct platform_device *pdev)
> >>      priv = rproc->priv;
> >>      priv->rproc = rproc;
> >>      priv->dsp_dcfg = dsp_dcfg;
> >> +    /* By default, host waits for fw_ready reply */
> >> +    priv->flags |= WAIT_FW_READY;
> >>
> >>      if (no_mailboxes)
> >>              imx_dsp_rproc_mbox_init = imx_dsp_rproc_mbox_no_alloc;
> >> --
> >> 2.25.1
> >>

