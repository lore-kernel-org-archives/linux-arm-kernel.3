Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5506CAC594
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 14:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fymi3Txu8F9VJ1PKSZC54www/a31SqzI6mEZNrMBez4=; b=lVM4rHP2lDQfNq8Y7PJMHg8SH6
	j4N25IfXsOKDWsk69lA8X+rICChaB/7sT3BaqyKg/7HwKHyW4g16TXk7B4/bg9OF38nba1XHamd6X
	pkYBA0jAz+qRwXAK6ZHpxkipDFHKMwHjT+haS8iZMfhXoJq773RQkX+KNRZlfbMPqGrbqrm0N4gk4
	ScA3r0HXJ6xFhPwVxCPR1EYaxJI2KgijIU9q/4jeiqRaLdXR3jPEP6GIKINMyGZwigbH4VDYHqFME
	bE3XWTTmr63wL8I1fvSFR+6d2po72qKKXNhW3aF1e8iRjKjqLTsCPNV7hisrN3l7yJgasBz/Jly/6
	3AA93xXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4h5-00000009rUL-2baF;
	Fri, 12 Sep 2025 14:24:07 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4h1-00000009rQ6-2pdX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 14:24:05 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2570bf6050bso14848135ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 07:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757687043; x=1758291843; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fymi3Txu8F9VJ1PKSZC54www/a31SqzI6mEZNrMBez4=;
        b=ck36hua9z5Ku1JGGsuuWQc9MlG29MZq7lApmQvpKXBxkevW6V6iTviO/0z667rj4sy
         7xTSMeqPPg5cRrsWfaS2lyKBSTLpoCWGOw7U5cDSWCdy2HwCl8aKPcOI7k5sSjuJ2cBE
         HvDQ6CQH7jAKN4ZnyZhYi5W3fd2oeccjww3zKNvRHw6nBsxa/xbqX1k3uaU/x63GYCL4
         311xO4Jk977RuHGcJfkSZUICcidubSbB4AUq7GNBlpvaQDakWXldHncfx7hKwjB+Jzr9
         q7Lo3rVuRvttexdYbLX2FCVDpwQiNFclC6CD2jnTbBkAj40HEqMMonjcufXwavJTFHZ+
         B70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757687043; x=1758291843;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fymi3Txu8F9VJ1PKSZC54www/a31SqzI6mEZNrMBez4=;
        b=pcFWej11CESW4jSHvCwFIcxuz9PhMShi8s7FJ5xIH5l5XkT2n/dHpu4GBDLUeI2e3X
         BEDVEamRFsgX1Y5h/ov5EzJLTxTUerKjl1qGGz3F9MFTd42WeL7romL0Wgzw2vf+OZJI
         4xp+7zjJumDQFTzvG3hBf6EOBmYOwQ0J+hzxqB6dWKXz/Py+N7kikpuo7lmQJ53iiHk1
         GjZnR/1yPMvi7EjtmHw3R954iUqr2WzGKIYGkvIvqOh/e/rbVs1Qg40lmyQgLfRV0CHF
         HGoOwmjbM69VrIRcEuuffmNjYSn5VvIhkj/hfpdoTEua6oRmZPRb0/IiTNpotyy4VAoN
         w+cg==
X-Forwarded-Encrypted: i=1; AJvYcCWD1UArbfsgExvsBXyqG5W92lQMgIbKr8x8WBC0+1C8Y/IPARrgY+6qpv+oY8i4slMjqoKQpeXktowL/K+QaU5Q@lists.infradead.org
X-Gm-Message-State: AOJu0YwckMT22SgpAW07qXfDcLm2de/O5UD6iJjWm8VzZvmi8SrjKC9R
	fyhtWvMgHcP9SqMG/T/ibTlp+z/xV/egz/dCLpa+IhMVFEUSZcFJlEX6jU9p0cDC3wY=
X-Gm-Gg: ASbGnct3BsInwtTVYJieFILiXZD4K1B0R+nUEFNnUYGh02hxgqCJGToExQ9klRofn0o
	TTGasULrvDiXLMIE0oRbaMyymcko1qLYwmyYOrUpRGDonMjSyQ06NkdH9bgrsW/mCR+eVJlcow7
	ae/Svd0hqB18gYmss0RrFokfx54yYpBw7EPToSoRFYaRVUZaWGsyh1ww7/CyQF5zcjDHlgQxxku
	ebgpPnR+aXTvpFUlWdd5wftPQB7J69nxIdQB76dvmQujNnOergmF3O6LTnPWsxF+KJbBBnERh45
	YU6PMP/c/QzD+gg0ouNY7J8sijXyohj+/Rf5sg58heto7HFfXGFXhR9bEMv+qetcZN8do5sOLC5
	kO0fh/Sgf/6YMQhnSFl7YZOkC47HYqHn0dM1QcRdxwoChs+auKUsCTugjInTmy0UEhAlCFp4vJD
	F+cuX3SobjB2HjXU+YtSVMDwDgIQRmnXTV/Q==
X-Google-Smtp-Source: AGHT+IGMDVPXyTQDYA0Vd681zaPN1yMd0UU4f/S1dUbx+go1grsAzp3XxSeIp5gGIJYIiu6eOsXJww==
X-Received: by 2002:a17:902:ef11:b0:24c:cca1:7cfc with SMTP id d9443c01a7336-25d279225afmr40886435ad.59.1757687042503;
        Fri, 12 Sep 2025 07:24:02 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:650:9892:cdf9:70db])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c37294b4fsm50284915ad.34.2025.09.12.07.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 07:24:01 -0700 (PDT)
Date: Fri, 12 Sep 2025 08:23:59 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	linux-remoteproc@vger.kernel.org, arnd@arndb.de,
	andersson@kernel.org, wenst@chromium.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH] remoteproc: mtk_scp: Construct FW path if firmware-name
 not present
Message-ID: <aMQs_wEr1Cy3_QXX@p14s>
References: <20250911140043.190801-1-angelogioacchino.delregno@collabora.com>
 <6f60bb97-86fc-4cda-a373-a991547bbd77@gmail.com>
 <9fafe6a4-e30b-4ea8-a85c-2e66ebd34040@collabora.com>
 <748d6a49-3ee0-45af-bee3-fb40b98f94c4@gmail.com>
 <67dafd8e-42cc-4107-b5ab-5793aae310d1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67dafd8e-42cc-4107-b5ab-5793aae310d1@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_072403_760479_0E4B7C34 
X-CRM114-Status: GOOD (  80.11  )
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

On Fri, Sep 12, 2025 at 12:34:01PM +0200, AngeloGioacchino Del Regno wrote:
> Il 12/09/25 11:51, Matthias Brugger ha scritto:
> > 
> > 
> > On 12/09/2025 10:45, AngeloGioacchino Del Regno wrote:
> > > Il 12/09/25 09:01, Matthias Brugger ha scritto:
> > > > 
> > > > 
> > > > On 11/09/2025 16:00, AngeloGioacchino Del Regno wrote:
> > > > > After a reply on the mailing lists [1] it emerged that the DT
> > > > > property "firmware-name" should not be relied on because of
> > > > > possible issues with firmware versions.
> > > > > For MediaTek SCP, there has never been any firmware version vs
> > > > > driver version desync issue but, regardless, the firmwares are
> > > > > always using the same name and they're always located in a path
> > > > > with a specific pattern.
> > > > > 
> > > > > Instead of unconditionally always relying on the firmware-name
> > > > > devicetree property to get a path to the SCP FW file, drivers
> > > > > should construct a name based on what firmware it knows and
> > > > > what hardware it is running on.
> > > > > 
> > > > > In order to do that, add a `scp_get_default_fw_path()` function
> > > > > that constructs the path and filename based on two of the infos
> > > > > that the driver can get:
> > > > >   1. The compatible string with the highest priority (so, the
> > > > >      first one at index 0); and
> > > > >   2. The type of SCP HW - single-core or multi-core.
> > > > > 
> > > > > This means that the default firmware path is generated as:
> > > > >   - Single core SCP: mediatek/(soc_model)/scp.img
> > > > >     for example:     mediatek/mt8183/scp.img;
> > > > > 
> > > > >   - Multi core SCP:  mediatek/(soc_model)/scp_c(core_number).img
> > > > >     for example:     mediatek/mt8188/scp_c0.img for Core 0, and
> > > > >                      mediatek/mt8188/scp_c1.img for Core 1.
> > > > > 
> > > > 
> > > > As we inventing a naming scheme here: if we decide that signle
> > > > core FW is calle scp_c0.img we can get rid of some code.
> > > > 
> > > 
> > > Ohey!
> > > 
> > > No, well, we're not inventing a naming scheme... if you check in linux-firmware
> > > and in the current devicetrees, you'll see that the path adheres to what I wrote.
> > > 
> > 
> > Well I'm not able to find any *spc_c* firmware :)
> > Actually mt8188 has scp.img as the only file.
> > 
> 
> Yeah I was talking about the single-core ones, not the multicore ones, my bad for
> not clarifying :-)
> 
> > > As in - all of the single core SCP always had the firmware in path
> > > mediatek/mtXXXX/scp.img - and the dual core SCP has two firmwares.
> > > 
> > > The dual core one is a bit special in that the two cores are *almost* (but not
> > > fully) independent from each other (not entirely relevant to this discussion tho)
> > > and can load one firmware per core.
> > > 
> > > In short - in upstream, the only naming that we're inventing is the multicore SCP,
> > > but we're simply keeping the same name for the singlecore ones.
> > > 
> > > Even for multicore, I'm not really inventing that out of the blue - MediaTek are
> > > using that naming in downstream, so I'm just copying that.
> > > 
> > 
> > Which is no guarantee to be a good way to go ;)
> > 
> 
> Of course it's no guarantee.
> 
> > Anyway I think the actual naming scheme just makes us add code for no
> > buy-in. For me it would make more sense to fix the firmware naming in
> > linux-firmware then "working around" that in kernel code.
> > 
> 
> I'm not convinced yet. We'd be sparing just two lines of code (or 3?), which is
> not a big deal really...
> 
> > > Btw... I really don't want to change the single core FW name to "scp_c0.img"
> > > because my plan is to get this merged and then cleanup the devicetrees for all
> > > MTK machines to *remove* the firmware-name property from the SCP node(s).
> > > 
> > 
> > OK, but that's independent. We could keep symlink in linux-firmware for
> > backward compability, if needed (delta linux-firmware maintainer gets
> > mad).
> > 
> 
> If we do that, then yes that would be 100% needed to retain backwards compatibility
> with the old devicetrees, unless we add even more code to this driver to check if
> the firmware exists and, if not, check if the old name exists and, if not, fail.
> 
> Also, why should we make the linux-firmware maintainer get mad? :-)
> 
> > > firmware-name support in this driver is retained only for retrocompatibility
> > > with old DTs (and perhaps "very special" devices needing "very special" firmwares,
> > > of which none exist right now and hopefully we'll never see anything like that in
> > > the future).
> > > 
> > > > > Note that the generated firmware path is being used only if the
> > > > > "firmware-name" devicetree property is not present in the SCP
> > > > > node or in the SCP Core node(s).
> > > > > 
> > > > > [1 - Reply regarding firmware-name property]
> > > > > Link: https://lore.kernel.org/all/7e8718b0-df78-44a6-
> > > > > a102-89529d6abcce@app.fastmail.com/
> > > > > Signed-off-by: AngeloGioacchino Del Regno
> > > > > <angelogioacchino.delregno@collabora.com>
> > > > > ---
> > > > >   drivers/remoteproc/mtk_scp.c | 64 ++++++++++++++++++++++++++++++++----
> > > > >   1 file changed, 58 insertions(+), 6 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> > > > > index 8206a1766481..80fcb4b053b3 100644
> > > > > --- a/drivers/remoteproc/mtk_scp.c
> > > > > +++ b/drivers/remoteproc/mtk_scp.c
> > > > > @@ -16,6 +16,7 @@
> > > > >   #include <linux/remoteproc.h>
> > > > >   #include <linux/remoteproc/mtk_scp.h>
> > > > >   #include <linux/rpmsg/mtk_rpmsg.h>
> > > > > +#include <linux/string.h>
> > > > >   #include "mtk_common.h"
> > > > >   #include "remoteproc_internal.h"
> > > > > @@ -1093,22 +1094,73 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
> > > > >       }
> > > > >   }
> > > > > +/**
> > > > > + * scp_get_default_fw_path() - Get default SCP firmware path
> > > > > + * @dev:     SCP Device
> > > > > + * @core_id: SCP Core number
> > > > > + *
> > > > > + * This function generates a path based on the following format:
> > > > > + *     mediatek/(soc_model)/scp(_cX).img; for multi-core or
> > > > > + *     mediatek/(soc_model)/scp.img for single core SCP HW
> > > > > + *
> > > > > + * Return: A devm allocated string containing the full path to
> > > > > + *         a SCP firmware or an error pointer
> > > > > + */
> > > > > +static const char *scp_get_default_fw_path(struct device *dev, int core_id)
> > > > > +{
> > > > > +    struct device_node *np = core_id < 0 ? dev->of_node : dev->parent->of_node;
> > > > > +    char scp_fw_file[7] = "scp_cX";
> > > > 
> > > > We provide a string that we later overwrite. I'd prefer to have
> > > > just the reservation without any 'artificial' string in it.
> > > > 
> > > 
> > > Yeah, this one is a leftover that I forgot to cleanup. I fully agree with you.
> > > 
> > > Will change that in v2.
> > > 
> > > > > +    const char *compatible, *soc;
> > > > > +    int ret;
> > > > > +
> > > > > +    /* Use only the first compatible string */
> > > > > +    ret = of_property_read_string_index(np, "compatible", 0, &compatible);
> > > > > +    if (ret)
> > > > > +        return ERR_PTR(ret);
> > > > > +
> > > > > +    /* If the compatible string's length is implausible bail out early */
> > > > > +    if (strlen(compatible) < strlen("mediatek,mtXXXX-scp"))
> > > > 
> > > > Seems like a double check of compatible. Why is dt-bindings for that not enough?
> > > > 
> > > 
> > > It's more than that... (check below)
> > > 
> > > > > +        return ERR_PTR(-EINVAL);
> > > > > +
> > > > > +    /* If the compatible string starts with "mediatek,mt" assume that it's ok */
> > > > > +    if (!str_has_prefix(compatible, "mediatek,mt"))
> > > > 
> > > > Same here.
> > > > 
> > > 
> > > ....and it's because.... (check below)
> > > 
> > > > > +        return ERR_PTR(-EINVAL);
> > > > > +
> > > > > +    if (core_id >= 0)
> > > > > +        ret = snprintf(scp_fw_file,
> > > > > ARRAY_SIZE(scp_fw_file), "scp_c%1d", core_id);
> > > > > +    else
> > > > > +        ret = snprintf(scp_fw_file, ARRAY_SIZE(scp_fw_file), "scp");
> > > > > +    if (ret <= 0)
> > > > > +        return ERR_PTR(ret);
> > > > > +
> > > > > +    soc = &compatible[strlen("mediatek,")];
> > > 
> > 
> > Shouldn't we use strchr(compatible, ',') or similar here?
> > 
> 
> The logic here is to get this optimized by the compiler: "mediatek," is a constant
> and the result of strlen is predefined (same for the other occurrence in the string
> length plausibility check up there).
> 
> On the other hand, finding the pointer with strchr() means iterating.
> 
> > > ...I'd otherwise anyway have to check here, as this is a pointer to the middle of
> > > the compatible string, used below to extract "mtXXXX" (mt8195, mt1234 etc) from it.
> > > 
> > > Sure I get your point about bindings - but IMO those multi-purpose checks make the
> > > code robust, and will avoid exposure of random memory locations (and/or produce
> > > undefined behavior) in the event that the compatible string is shorter than needed.
> > > 
> > > > > +
> > > > > +    return devm_kasprintf(dev, GFP_KERNEL, "mediatek/%.*s/%s.img",
> > > > > +                  (int)strlen("mtXXXX"), soc, scp_fw_file);
> > 
> > I would have expected that there exists a function to extract a
> > substring, but I didn't find any. Anyway, I think instead of hardcode
> > the value we should search for '-' or use the remaining string as a
> > whole. That would also fix the issue of a too short compatible string.
> > 
> 
> I thought about that, and tried it too: comes out with more lines of code than what
> you see here, and also gets trickier to read... especially when wanting to support
> "scp.img" and "scp_c0.img".
> 
> Unless you mean to change the path to "mediatek/(soc_name)/rest-of-compatible.img"
> as in "mediatek/mt8188/scp-dual-c0.img" (because we still have to append a core
> number text as the core 0 firmware cannot be loaded on core 1 and vice-versa), but
> even then.... honestly, I'm not sure how objectively better could that be compared
> to just hardcoding "scp" and "scp_c(core-number)"... just because either one or the
> other solution still implies doing similar checks (which might be more expensive?
> didn't write a poc for this idea, so not sure about that).
> 
> > > > > +}
> > > > > +
> > > > >   static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
> > > > >                         struct mtk_scp_of_cluster *scp_cluster,
> > > > > -                      const struct mtk_scp_of_data *of_data)
> > > > > +                      const struct mtk_scp_of_data *of_data,
> > > > > +                      int core_id)
> > > > >   {
> > > > >       struct device *dev = &pdev->dev;
> > > > >       struct device_node *np = dev->of_node;
> > > > >       struct mtk_scp *scp;
> > > > >       struct rproc *rproc;
> > > > >       struct resource *res;
> > > > > -    const char *fw_name = "scp.img";
> > > > > +    const char *fw_name;
> > > > >       int ret, i;
> > > > >       const struct mtk_scp_sizes_data *scp_sizes;
> > > > >       ret = rproc_of_parse_firmware(dev, 0, &fw_name);
> > > > > -    if (ret < 0 && ret != -EINVAL)
> > > > > -        return ERR_PTR(ret);
> > > > > +    if (ret) {
> > > > > +        fw_name = scp_get_default_fw_path(dev, core_id);
> > > > 
> > > > Wouldn't it make more sense to encapsulate the whole fw_name
> > > > retrival in one function, e.g. scp_get_fw_path.
> > > > 
> > > 
> > > Sorry, not a fan of that, I don't see the actual benefit, as in, (imo) it doesn't
> > > improve readability and it doesn't remove any duplication (as it's called only once
> > > in one single place).
> > > 
> > > But of course, I'm open to understand if I'm missing any point :-)
> > > 
> > 
> > My point would be to encapsulate the logic how to determine the fw_name
> > in one function call. I think it improves readability because you look
> > at the code and can say "OK here they somehow determine the fw_name" and
> > only have to look into the function if you really care and skip over it
> > otherwise.
> > 
> 
> I don't have very strong opinions on that, and seeing one function call or two is
> not making me happy, nor sad. I did what you proposed in other occasions (and not
> in remoteproc) but then got suggestion to do otherwise, and that's the main reason
> why you see the code laid out like that and the reasoning I wrote.
> 
> Finally, I'm open for whichever of the two solutions - it probably just boils
> down to maintainers' preference, in which case...
> 
> Mathieu or Bjorn: what do you prefer seeing here?

I will take a look next week.

> 
> Cheers,
> Angelo
> 
> > > > > +        if (IS_ERR(fw_name)) {
> > > > > +            dev_err(dev, "Cannot get firmware path: %ld\n", PTR_ERR(fw_name));
> > > > > +            return ERR_CAST(fw_name);
> > > > > +        }
> > > > > +    }
> > > > >       rproc = devm_rproc_alloc(dev, np->name, &scp_ops, fw_name, sizeof(*scp));
> > > > >       if (!rproc) {
> > > > > @@ -1212,7 +1264,7 @@ static int scp_add_single_core(struct platform_device *pdev,
> > > > >       struct mtk_scp *scp;
> > > > >       int ret;
> > > > > -    scp = scp_rproc_init(pdev, scp_cluster, of_device_get_match_data(dev));
> > > > > +    scp = scp_rproc_init(pdev, scp_cluster, of_device_get_match_data(dev), -1);
> > > > >       if (IS_ERR(scp))
> > > > >           return PTR_ERR(scp);
> > > > > @@ -1259,7 +1311,7 @@ static int scp_add_multi_core(struct platform_device *pdev,
> > > > >               goto init_fail;
> > > > >           }
> > > > > -        scp = scp_rproc_init(cpdev, scp_cluster, cluster_of_data[core_id]);
> > > > > +        scp = scp_rproc_init(cpdev, scp_cluster,
> > > > > cluster_of_data[core_id], core_id);
> > > > >           put_device(&cpdev->dev);
> > > > >           if (IS_ERR(scp)) {
> > > > >               ret = PTR_ERR(scp);
> > > > 
> > > 
> > > 
> > 
> 

