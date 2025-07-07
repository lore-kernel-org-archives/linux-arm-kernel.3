Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909C2C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 17:01:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTB9AhUzbXze0SvlJXhNv6ywJb1Le3/qXDwCwOY7m50=; b=vUghYLwD73Z5Fy2iXjc3drl4rp
	rEDpcNkuS+9WoAFFfzTxDOkTxJ8hPZ4BqgU9K+6GFF47PbyC8t2+IRjSRxR7sabfGI0N4an8bBFC9
	nTL4uqnbAWxIIZOQXEd0L80mUsja+r6DuVvsetg/pfBC3u8fN5Q08dDiVBKhZgtBWGXGsndQlh/Cr
	HK2YnI7jG5Op7uRfc7vafXl/tShsWCJvS4A08R8OBTy1hEuquQKHbqC1gnwTvIf58H9JaTC9d8+5A
	i23wKIehHCALV5sc43Dns4+66RQzO2/CCeqyH6hmAGKzEs+kIZ/VMEbAxD0dxRe3EacLbJ/c+qOO1
	ee0n8zbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYpDl-000000036eP-2jvS;
	Mon, 07 Jul 2025 17:01:37 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoSp-00000002zTZ-0M0Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 16:13:08 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-234fcadde3eso48865615ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 09:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751904786; x=1752509586; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rTB9AhUzbXze0SvlJXhNv6ywJb1Le3/qXDwCwOY7m50=;
        b=CTofjaEWF8gUrjCgqNiU08HfEj4q55d7fst5dx1NJmMgyIKIUedyYn7DdwCMLV4InH
         7omc36diQ63ZpHv9RsONjOfm1JWoCjmcfgH6KdS3BGmPmx3n1zOBfiax3Hv9ENtNrjum
         6mxfpuw5b690ZFAp9h/hhb06RzaxjvE8FcVUINsu8Oxh/mvxcNpl5IoW3tMBwtWptRf5
         j9kfnf4LWcr5UuWs9pBvCxjBcAoMKW9Qoo0m2FvjcR4Y11HUnffxRYQwzdxQB2dH6AyB
         lu6lBWFrqVm7jUqU6D6zz3YyIzcaGqKFgdk81vxQhjL5NS7Z8ZkifFCPawe91s/mfoT9
         hidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751904786; x=1752509586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTB9AhUzbXze0SvlJXhNv6ywJb1Le3/qXDwCwOY7m50=;
        b=ID/Fqr4lh70BK6LuXzJNdV3U9vcDhtZGvPITI1kP/UNE+iH0lxshtT6Dpq5Ixpk7i7
         1jIbmiN2B2zuIj0N75LWdGch7rApgSf1azG+87T7HzZE0Xvq7333ZKq4QUOwXtt+yuSq
         IIBrMNLHh2lzkGvqYwKhMQUoTL/Zr9laxw9o+Qn6dWeZPK4JKgRt6LXUugZHy6b+hRQt
         XTOagpukg5MdE3VgPoNNQYEjakjlV5FJnx+6Ik6rbm1YT1rcWztakQm2wx7y6PEEP5kg
         crXgYDn+sGMzETp4KQD1yv/cXfXeyQk9GVmb/Z2lJKesQHbjZ5BIo+wOE+2uV319mGXz
         cf3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXClSZR5Cf997cIv8dxTM+XYu7f1WkV2Z/ZToRv8Hn0ClxV1MVBMhsy5RxDOB3Tq2LUIIH3ntDhO46/9g8AOj8M@lists.infradead.org
X-Gm-Message-State: AOJu0YzBT8QdoknAlkOl4p9RrtB4uXHCLrcaiUVbDIb08wXwsFNhyQc8
	SWwj3px+UUScaFV4gP54fJFn7QNZM2CgU33bGp251bU+ZsFGstT7fPLPayfbLxTKGPs=
X-Gm-Gg: ASbGncvbYud+0Q/vWRwYgqnlmcAhSQMyHjUD6bhQxljJUZRBHWtnLDB81wtkFpAdpFK
	BiiKbYNbmqvOeXh4dN/OHFW3O015IykfbXt3ktrZ+Dth8SyfssIgZuiOadh9bOD9zWZB0qdYgA8
	MC+gQvmijsIJmwTPu5fOeEUtfqqwBnvmNcsaHWgGX3XqRpbvp59QlyIpwznunUzZHIGUju8DEqf
	hepXSxPOVTJqpGipXlmxgUq4bNvA6pbjK5iQVNIBeZMg8UakjBUAgJ5sTK+w4+huaF0E9/a+2M0
	ApJWofb27rv36j94ojMwqlOzmOPsvrKdurlkVitL1wxuOzfxpvCxanHzb8XmBwFpUQ==
X-Google-Smtp-Source: AGHT+IEQezXaHRglxK6u+wE7BwHS5SdjM0yKB0UdNJiBREdoJn93Iqgm0TzBfL2Hm1mR3xJxK3359A==
X-Received: by 2002:a17:903:41c1:b0:235:c781:c305 with SMTP id d9443c01a7336-23c8755c92amr199352805ad.24.1751904785665;
        Mon, 07 Jul 2025 09:13:05 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:1746:c463:9d35:6eed])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee475a3asm9236671a12.17.2025.07.07.09.13.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 09:13:05 -0700 (PDT)
Date: Mon, 7 Jul 2025 10:13:02 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>,
	Ritesh Kumar <ritesh.kumar@toradex.com>
Subject: Re: [PATCH] remoteproc: imx_rproc: merge ITCM and DTCM regions
Message-ID: <aGvyDp36iWv5UQ19@p14s>
References: <20250703130831.18830-1-hiagofranco@gmail.com>
 <aGgAbwToGhsc5VV9@p14s>
 <20250704190816.kth7bdf34ufc2ht6@hiagonb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704190816.kth7bdf34ufc2ht6@hiagonb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_091307_127492_502E7BB9 
X-CRM114-Status: GOOD (  33.97  )
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

On Fri, Jul 04, 2025 at 04:08:16PM -0300, Hiago De Franco wrote:
> Hi Mathieu,
> 
> On Fri, Jul 04, 2025 at 10:25:19AM -0600, Mathieu Poirier wrote:
> > Good morning,
> > 
> > On Thu, Jul 03, 2025 at 10:08:31AM -0300, Hiago De Franco wrote:
> > > From: Hiago De Franco <hiago.franco@toradex.com>
> > > 
> > > Merge the contiguous ITCM and DTCM regions into a single region to
> > > prevent failures when loading ELF files with large sections:
> > > 
> > > remoteproc remoteproc0: powering up imx-rproc
> > > remoteproc remoteproc0: Booting fw image rproc-imx-rproc-fw, size 151824
> > > imx-rproc imx8mp-cm7: Translation failed: da = 0x1f48 len = 0x1fcb0
> > > remoteproc remoteproc0: bad phdr da 0x1f48 mem 0x1fcb0
> > > remoteproc remoteproc0: Failed to load program segments: -22
> > > remoteproc remoteproc0: Boot failed: -22
> > > 
> > > This approach is the same as commit 8749919defb8 ("remoteproc:
> > > imx_rproc: Merge TCML/U").
> > > 
> > > Suggested-by: Ritesh Kumar <ritesh.kumar@toradex.com>
> > > Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>
> > > ---
> > > Hi,
> > > 
> > > The ELF I tested had the following data section:
> > > 
> > > Memory region         Used Size  Region Size  %age Used
> > >     m_interrupts:         680 B         1 KB     66.41%
> > >           m_text:        6984 B       127 KB      5.37%
> > >           m_data:      130224 B       128 KB     99.35%
> > >          m_data2:          0 GB        16 MB      0.00%
> > > [100%] Built target hello_world_cm7.elf
> > > 
> > > Which triggered the error. After this patch, remoteproc was able to boot
> > > and work fine. Thanks!
> > > ---
> > >  drivers/remoteproc/imx_rproc.c | 6 ++----
> > >  1 file changed, 2 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> > > index 74299af1d7f1..bbf089ef48ee 100644
> > > --- a/drivers/remoteproc/imx_rproc.c
> > > +++ b/drivers/remoteproc/imx_rproc.c
> > > @@ -166,8 +166,8 @@ static const struct imx_rproc_att imx_rproc_att_imx8qxp[] = {
> > >  
> > >  static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
> > >  	/* dev addr , sys addr  , size	    , flags */
> > > -	/* ITCM   */
> > > -	{ 0x00000000, 0x007E0000, 0x00020000, ATT_OWN | ATT_IOMEM },
> > > +	/* D/ITCM */
> > > +	{ 0x00000000, 0x007E0000, 0x00040000, ATT_OWN | ATT_IOMEM },
> > >  	/* OCRAM_S */
> > >  	{ 0x00180000, 0x00180000, 0x00009000, 0 },
> > >  	/* OCRAM */
> > > @@ -180,8 +180,6 @@ static const struct imx_rproc_att imx_rproc_att_imx8mn[] = {
> > >  	{ 0x08000000, 0x08000000, 0x08000000, 0 },
> > >  	/* DDR (Code) - alias */
> > >  	{ 0x10000000, 0x40000000, 0x0FFE0000, 0 },
> > > -	/* DTCM */
> > > -	{ 0x20000000, 0x00800000, 0x00020000, ATT_OWN | ATT_IOMEM },
> > 
> > In commit 8749919defb8 "dev addr" and "sys addr" were both contiguous, but in
> > this patch "dev addr" is not.  How will this work with new kernel that use old
> > FW images?  Am I missing something?
> 
> No, you are correct, I think the use case I tested was not good enough.
> 
> If I understand correctly, this will break older firmware expecting
> .data at 0x20000000 because dev_addr is no longer mapped for DTCM entry.
> 

Correct.  Older firmware would still expect DTCM at 0x20000000.


> Do you think it is possible (or reccomend) another approach to fix this
> issue? In this case to keep using the TCM, instead of going to OCRAM or
> DDR.
>

To me the best way to proceed is understand why using the current mapping is a
problem.  The changelog describes a failure condition when dealing with large
sections but does not indicate _why_ that is happening.  I think that's what
needs to be fixed rather than trying to move mappings around.
 
> Thanks,
> Hiago.
> 
> > 
> > Thanks,
> > Mathieu
> > 
> > >  	/* OCRAM_S - alias */
> > >  	{ 0x20180000, 0x00180000, 0x00008000, ATT_OWN },
> > >  	/* OCRAM */
> > > -- 
> > > 2.39.5
> > > 

