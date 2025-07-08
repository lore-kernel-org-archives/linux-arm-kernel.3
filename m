Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1D9C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 18:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KDWmvBi+xrTnEZOGiVtOCiEcPvDY+R/VmkacimBElWU=; b=OmBFTxDUduR2imLH4n8o0V3hMI
	IHF/sR/Lo8tPLO+7XOWdNEAoZ++BAKaEoJ9dI+7wOCDMr+OzfMf1ZBZEfMKmQTKw28AO3iqmAJzw2
	hYjsnP/9xIPf+1fkZPsuBmljwnvhu9jnEnluKWCj75aTH8Fd99ZB3AxtXzEmHgoW/J17zaaxQTijU
	mDB3zn1xfJ/6NvhUIkWlLyINqTZMHC1nXX0L0GqHdQgDggSNasCx0fMghHkhuj7vhRKHOrgSQZq6L
	hTYsyKDbXtWerol004XD3HohkS481JfzinhMa60ZnIPFLmiNwd0pWM347jXjUjtVa7WKlNd6jo8Us
	idXot2kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCmA-00000006DCp-2ubF;
	Tue, 08 Jul 2025 18:10:42 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZC8r-000000067PV-1Diy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:30:06 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7d95b08634fso134536585a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Jul 2025 10:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751995803; x=1752600603; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KDWmvBi+xrTnEZOGiVtOCiEcPvDY+R/VmkacimBElWU=;
        b=HdoCGaHpBR+W5ncnS9J/8pdHTOBjJpjsLSYkvLbqjHSIUZTsJupEiVvDm1z1c8Tk2d
         4/ZTljPU1F6+qgQWqY4Bd6jeTvF4sN8a0cnyBUDeB6oqKMCHP15QrYHW/wyt5kUsk5Jb
         cVKevLEz4vdm4CXjb5tU1gcKoofMtH41JEYYPuBgZ/iIdHQFXxV4w3R+ki0wVSQ26aOy
         bnppaSo+QaAfgLF0NJGju/P5fVwazKG2bN0Sj/RFFVHHfg1Z54fAA8uDXz3dvgnT2YwZ
         9Mv687/NS66WlRDRVtP3qTrhP4b1TxX+BV9W8u6X+Luf2fdom7BgKDsibYuOLyaj0LrO
         DvMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751995803; x=1752600603;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDWmvBi+xrTnEZOGiVtOCiEcPvDY+R/VmkacimBElWU=;
        b=SZzVXDf5rcPzPmaw8uq8/JGxNf4dPn3jNzoo78F7elw2PopyN1OAN+Vg0hHe8i+7GX
         XUqRz2pA+CFcYty5ADQUjgmCpbQeZ4rpBeWb1dv0b/Qdqb/0v1nvgoZdmp2cEaJnmYbX
         1OGg/cTn/E1s6OGGwQwYdGFPwNFMd5vn/gio3w9T09J8QilfTOA4ZAQ1d6pXj0Dot4dK
         OPmyoy9XQQx7O11yP1uKSshrreaqJgftol+eHDimK1HTrMwFxotAPKv4H6RP6myz0KVA
         Y/SBWRawrIc1niQqpz1SULGJ2BIene3psHDr48VPF2TeGW6oV7i7tl9lvgGRpTS49h9J
         kctw==
X-Forwarded-Encrypted: i=1; AJvYcCU1zh72F8OCf9XsYtakmwlXH50ObWgye142lld7hpZXXrXihjV/4t7cXmJP/gebj4gDOuIorxycUDAaYmSBbqIw@lists.infradead.org
X-Gm-Message-State: AOJu0YyIh+Eqgnvp+uStqJ945cQfE7SiV7dYL593b/4HPB+HNnfOiKen
	DsrsEcWiK3RlLDFYQ3SQhHt29cvanqfAmRX3y7/HgGm8p+luxmDlYCCs
X-Gm-Gg: ASbGnctA3DQn5ihm2jQbMG0mVvbHs3c6T+qinh7njTw+JGG80+BmrDx8yTv74yHUN3D
	vBnEgucaJq/ul8ShTPywjMkzAzZ5RX7zhKlukhIEuKntTIYCb7tqtPuILL0tAXWViCVHBSBmiK2
	V6QRFa/uY3BwawxPtoqk0f1lKGXLG6uzM0TXZdTCYcmTFxaumwNsMcgmtbHWEg8mQpVqb+cCReS
	zE+9A5kUUQ7Lcw01jM5XbXUEFUrvjzbsPLZcl/y+yMa5+A8GivbMv58kThoEWQUOD8Kmq5cHGJa
	dbX3OieBza4HEPbwW4VOHch1LlLgKZ/FSXl2NEYq4y+OFTcrR4/0BJ/u6EI=
X-Google-Smtp-Source: AGHT+IHpicuys1It3Yx8+rY+BPbIsN6Cyx0b4XZQ3+D2q9CPqUCHLJrwgcMoTXm4g+kFQQ5etcBEyA==
X-Received: by 2002:a05:620a:4304:b0:7c5:a463:397b with SMTP id af79cd13be357-7d5df11dcbamr2094173085a.20.1751995802972;
        Tue, 08 Jul 2025 10:30:02 -0700 (PDT)
Received: from hiagonb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbe7baedsm809718785a.57.2025.07.08.10.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 10:29:59 -0700 (PDT)
Date: Tue, 8 Jul 2025 14:29:53 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>,
	Ritesh Kumar <ritesh.kumar@toradex.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: merge ITCM and DTCM regions
Message-ID: <20250708172953.rbsvk6gy4xuxo42l@hiagonb>
References: <20250703130831.18830-1-hiagofranco@gmail.com>
 <aGgAbwToGhsc5VV9@p14s>
 <20250704190816.kth7bdf34ufc2ht6@hiagonb>
 <aGvyDp36iWv5UQ19@p14s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGvyDp36iWv5UQ19@p14s>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_103005_335282_F5E93369 
X-CRM114-Status: GOOD (  43.13  )
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

Hi Peng, Mathieu,

On Mon, Jul 07, 2025 at 10:13:02AM -0600, Mathieu Poirier wrote:
> On Fri, Jul 04, 2025 at 04:08:16PM -0300, Hiago De Franco wrote:
> > Hi Mathieu,
> > 
> > On Fri, Jul 04, 2025 at 10:25:19AM -0600, Mathieu Poirier wrote:
> > > Good morning,
> > > 
> > > On Thu, Jul 03, 2025 at 10:08:31AM -0300, Hiago De Franco wrote:
> > > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > > 
> > > > Merge the contiguous ITCM and DTCM regions into a single region to
> > > > prevent failures when loading ELF files with large sections:
> > > > 
> > > > remoteproc remoteproc0: powering up imx-rproc
> > > > remoteproc remoteproc0: Booting fw image rproc-imx-rproc-fw, size 151824
> > > > imx-rproc imx8mp-cm7: Translation failed: da = 0x1f48 len = 0x1fcb0
> > > > remoteproc remoteproc0: bad phdr da 0x1f48 mem 0x1fcb0
> > > > remoteproc remoteproc0: Failed to load program segments: -22
> > > > remoteproc remoteproc0: Boot failed: -22
> > > > 
> > > > This approach is the same as commit 8749919defb8 ("remoteproc:
> > > > imx_rproc: Merge TCML/U").
> > > > 
> > > > Suggested-by: Ritesh Kumar <ritesh.kumar@toradex.com>
> > > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > > ---
> > > > Hi,
> > > > 
> > > > The ELF I tested had the following data section:
> > > > 
> > > > Memory region         Used Size  Region Size  %age Used
> > > >     m_interrupts:         680 B         1 KB     66.41%
> > > >           m_text:        6984 B       127 KB      5.37%
> > > >           m_data:      130224 B       128 KB     99.35%
> > > >          m_data2:          0 GB        16 MB      0.00%
> > > > [100%] Built target hello_world_cm7.elf
> > > > 
> > > > Which triggered the error. After this patch, remoteproc was able to boot
> > > > and work fine. Thanks!
> > > > ---
> > > >  drivers/remoteproc/imx_rproc.c | 6 ++----
> > > >  1 file changed, 2 insertions(+), 4 deletions(-)
> > > > 
> > > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > > index 74299af1d7f1..bbf089ef48ee 100644
> > > > --- a/drivers/remoteproc/imx_rproc.c
> > > > +++ b/drivers/remoteproc/imx_rproc.c
> > > > @@ -166,8 +166,8 @@ static const struct imx_rproc_att imx_rproc_att_imx8qxp[] = {
> > > >  
> > > >  static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
> > > >  	/* dev addr , sys addr  , size	    , flags */
> > > > -	/* ITCM   */
> > > > -	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
> > > > +	/* D/ITCM */
> > > > +	{ 0x00000000, 0x007E0000, 0x00040000, ATT_OWN | ATT_IOMEM },
> > > >  	/* OCRAM_S */
> > > >  	{ 0x00180000, 0x00180000, 0x00009000, 0 },
> > > >  	/* OCRAM */
> > > > @@ -180,8 +180,6 @@ static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
> > > >  	{ 0x08000000, 0x08000000, 0x08000000, 0 },
> > > >  	/* DDR (Code) - alias */
> > > >  	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
> > > > -	/* DTCM */
> > > > -	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN | ATT_IOMEM },
> > > 
> > > In commit 8749919defb8 "dev addr" and "sys addr" were both contiguous, but in
> > > this patch "dev addr" is not.  How will this work with new kernel that use old
> > > FW images?  Am I missing something?
> > 
> > No, you are correct, I think the use case I tested was not good enough.
> > 
> > If I understand correctly, this will break older firmware expecting
> > .data at 0x20000000 because dev_addr is no longer mapped for DTCM entry.
> > 
> 
> Correct.  Older firmware would still expect DTCM at 0x20000000.
> 
> 
> > Do you think it is possible (or reccomend) another approach to fix this
> > issue? In this case to keep using the TCM, instead of going to OCRAM or
> > DDR.
> >
> 
> To me the best way to proceed is understand why using the current mapping is a
> problem.  The changelog describes a failure condition when dealing with large
> sections but does not indicate _why_ that is happening.  I think that's what
> needs to be fixed rather than trying to move mappings around.

Thanks for the information you both provided, sorry for the noise, so
please Mathieu ignore this patch. I will work around this in a different
way.

By the way, Peng, I noticed the DDR linker from MCUXpresso does not work
if the firmware is larger than 128KB, since the .data is placed right
after .text and loaded later to DDR. The imx_rproc driver should instead
have a way to do the other way around: starting from the firwmare inside
DDR, we could set PC and stack from M7 to point to DDR and start the
execution. Probably will be slower, but it would make the DDR case
possible.

Correct me if I am wrong, but as my current understanding the DDR linker
is broken without this change to the driver. Anyway, maybe something for
a future patch.

Thanks,
Hiago.

>  
> > Thanks,
> > Hiago.
> > 
> > > 
> > > Thanks,
> > > Mathieu
> > > 
> > > >  	/* OCRAM_S - alias */
> > > >  	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
> > > >  	/* OCRAM */
> > > > -- 
> > > > 2.39.5
> > > > 

