Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782D4C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 19:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HGyFNj1Ny6SfNjSNttjmfgWyIBUWUNO7iH1czi2I1Jw=; b=2nHRtAvDeVVoGrCatBv6e3H596
	1jfJehl5yED50KtCYjbPBLJKcqu2UGYFVDf2z7zf5XF4u/Ld5xLhEOyTAmKtGaoBlMfE7aFas3FbN
	GLVlxtV5+hxO8zJWnmuf4Bz7hNst4FNehGkifEy+hJjsf3zJ6/7Nsd6O7nGiave57UShetIQI2KDw
	VyvzkfC81leb9JWxDjed7XWdb7KZyB/BV37X8x1ijlRSttQoK0JE6GjVi1S2hj05ItlmpK745Wmwp
	CLe7jkvh7kyPLq7DKovaWcs8S2GCcKYDYvM2dVhiTT7uiqfxW6ufXaPkarcqVyi1k/4T3hPW/ENnH
	4wcWz4jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXloA-0000000FJ3n-2hvf;
	Fri, 04 Jul 2025 19:10:50 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXllo-0000000FIov-3GBz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 19:08:25 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4a4312b4849so16111941cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 12:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751656103; x=1752260903; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HGyFNj1Ny6SfNjSNttjmfgWyIBUWUNO7iH1czi2I1Jw=;
        b=J/nY7EUfZ2MsNUZ7zrh39sZw4wE48PFejuZLuF++x8ffFSgMH5c4h+aKQxKAb2XF8P
         VM4B3pqvhAR0YMuZseQyvBk6ZBq4Ppsg3CsxO4opDf4d5n04F7zyXKoom5PpV00zZ/9Y
         dbkfQach31R+J93l4UwF5iRu0CwiNJ4jTjXGSlCvGLHF+sG3lIgmFVPYBC7L/v6tSAM6
         3XpmERHEqhn2ZwDXex8XlcePpglpYvM4WzyAVkqzMJHGUkrr9zK603U9jWUZ9CS0zG8l
         fjhbVvR+7NO5Fovh6NqVEU+XoiWyN5MBUqf/sIXN+RLIiRh4LI8JGN4SEnG+vcn2zpgt
         Qp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751656103; x=1752260903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGyFNj1Ny6SfNjSNttjmfgWyIBUWUNO7iH1czi2I1Jw=;
        b=XmN/VKOo4odf4EjD3M/IyK+M9UVWIVn/pMAobjgggcZeadutCqeN8sc6C3bIz3RnxJ
         Y61znTCixpLLAuFv7EbqVEk/nUTlWl8PVfAXowrfjY8ZrlFZfrzuJBcaSVCg5UM2WlMa
         xTCDda//dm4FxOg0/ymjoxkfPp9fT0pjBDj8lEM+rTTgpz8tPw2bFDNSax2YxdpPJkoT
         LsYDgZpQLhaW2DAKzPnPDYWytO2Mn9dEyXoPDMy9LD9TPKv+mKFZidJUaZgxjhg1tdxu
         72/8B+PEkFeOz3rYsa2W1CMrKYu+Q+iZ5oAIYTpOePrBbqNR16dOSNrEBxw0eBf6P3aG
         rajw==
X-Forwarded-Encrypted: i=1; AJvYcCWDcGzmOBzdqFmQqPH2/Fl/anP+b7+QGKPsfmDWVecHnmZQ6zDQ43PYX2znTjEzTZGaN0+C5XbvbG+QPTapo21U@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2YeJIXh4LPK5EmPQUNloGFRxJC2q0BCY0oTFMTTcqqInVbZ1E
	EVGSv5MbYzltK86pO8F9rOr8sC0iH/dA55U0xwCw7gRO9F0b8Sw84svv
X-Gm-Gg: ASbGncvJH00HKTa1bMFiX5hH83j8n1UhJl8cydX3wbbHr+vWnxAlwLhrurte8hyoeAr
	Z4ND3qgHgAWriAI1mxU3CzNAGrYY7J2hYJrc2Xh9ECCcm0T8GAp6t+uBAPVB3cpSPHZYdlyYTwJ
	N/tZIedVB+4/P9FpuPuklVGLTSMR3U7/IvromePQAL+bfDQQDuFi6I056QQ4YGM1+vJazR2ke3o
	jm2qltq4v6yPihBMLP+H97w59koszRqlRjluw+8vCpfCxRAVBNlpSYv4IqvHMkT6ae/L08+0M9q
	uFA03aQKiAyzlRG1rXAXziXxE/u7nZ0ACdUZg7jKN3lVmnbSRrMFM2TCV/at
X-Google-Smtp-Source: AGHT+IHcPF0epYh2bEm/K740kTshZZxOutEcCiBSHjKyRJe4e++z7TJFlmqECQ+Kf/wg6K+2S4I8ww==
X-Received: by 2002:a05:622a:304:b0:4a8:182f:3518 with SMTP id d75a77b69052e-4a99671a092mr49834771cf.45.1751656103140;
        Fri, 04 Jul 2025 12:08:23 -0700 (PDT)
Received: from hiagonb ([2804:1b3:a7c0:b293:bc62:f957:108d:1060])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a994a8cdc4sm18670251cf.60.2025.07.04.12.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 12:08:22 -0700 (PDT)
Date: Fri, 4 Jul 2025 16:08:16 -0300
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
Message-ID: <20250704190816.kth7bdf34ufc2ht6@hiagonb>
References: <20250703130831.18830-1-hiagofranco@gmail.com>
 <aGgAbwToGhsc5VV9@p14s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGgAbwToGhsc5VV9@p14s>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_120824_816206_D0052EF8 
X-CRM114-Status: GOOD (  27.72  )
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

Hi Mathieu,

On Fri, Jul 04, 2025 at 10:25:19AM -0600, Mathieu Poirier wrote:
> Good morning,
> 
> On Thu, Jul 03, 2025 at 10:08:31AM -0300, Hiago De Franco wrote:
> > From: Hiago De Franco <hiago.franco@toradex.com>
> > 
> > Merge the contiguous ITCM and DTCM regions into a single region to
> > prevent failures when loading ELF files with large sections:
> > 
> > remoteproc remoteproc0: powering up imx-rproc
> > remoteproc remoteproc0: Booting fw image rproc-imx-rproc-fw, size 151824
> > imx-rproc imx8mp-cm7: Translation failed: da = 0x1f48 len = 0x1fcb0
> > remoteproc remoteproc0: bad phdr da 0x1f48 mem 0x1fcb0
> > remoteproc remoteproc0: Failed to load program segments: -22
> > remoteproc remoteproc0: Boot failed: -22
> > 
> > This approach is the same as commit 8749919defb8 ("remoteproc:
> > imx_rproc: Merge TCML/U").
> > 
> > Suggested-by: Ritesh Kumar <ritesh.kumar@toradex.com>
> > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > ---
> > Hi,
> > 
> > The ELF I tested had the following data section:
> > 
> > Memory region         Used Size  Region Size  %age Used
> >     m_interrupts:         680 B         1 KB     66.41%
> >           m_text:        6984 B       127 KB      5.37%
> >           m_data:      130224 B       128 KB     99.35%
> >          m_data2:          0 GB        16 MB      0.00%
> > [100%] Built target hello_world_cm7.elf
> > 
> > Which triggered the error. After this patch, remoteproc was able to boot
> > and work fine. Thanks!
> > ---
> >  drivers/remoteproc/imx_rproc.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > index 74299af1d7f1..bbf089ef48ee 100644
> > --- a/drivers/remoteproc/imx_rproc.c
> > +++ b/drivers/remoteproc/imx_rproc.c
> > @@ -166,8 +166,8 @@ static const struct imx_rproc_att imx_rproc_att_imx8qxp[] = {
> >  
> >  static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
> >  	/* dev addr , sys addr  , size	    , flags */
> > -	/* ITCM   */
> > -	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
> > +	/* D/ITCM */
> > +	{ 0x00000000, 0x007E0000, 0x00040000, ATT_OWN | ATT_IOMEM },
> >  	/* OCRAM_S */
> >  	{ 0x00180000, 0x00180000, 0x00009000, 0 },
> >  	/* OCRAM */
> > @@ -180,8 +180,6 @@ static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
> >  	{ 0x08000000, 0x08000000, 0x08000000, 0 },
> >  	/* DDR (Code) - alias */
> >  	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
> > -	/* DTCM */
> > -	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN | ATT_IOMEM },
> 
> In commit 8749919defb8 "dev addr" and "sys addr" were both contiguous, but in
> this patch "dev addr" is not.  How will this work with new kernel that use old
> FW images?  Am I missing something?

No, you are correct, I think the use case I tested was not good enough.

If I understand correctly, this will break older firmware expecting
.data at 0x20000000 because dev_addr is no longer mapped for DTCM entry.

Do you think it is possible (or reccomend) another approach to fix this
issue? In this case to keep using the TCM, instead of going to OCRAM or
DDR.

Thanks,
Hiago.

> 
> Thanks,
> Mathieu
> 
> >  	/* OCRAM_S - alias */
> >  	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
> >  	/* OCRAM */
> > -- 
> > 2.39.5
> > 

