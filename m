Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF73C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 19:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HJBZzHdO6P6nJOdbBqlWJWT1PzSbfwvCowjEuATTwM=; b=2VZkYoTRwPm+avWriL0uS9rN/9
	n0FsEh8NdWkceMqheFRmeNc7rsJ3JOxlPxzA4bW6k/MKC3GNoLTUw/KPqfWDOhkdUDTTF4LgDCppQ
	tnfgUFeDcdkprtGyFqDjB1sj1yGlP4yi0lCk+15V6EA9199PS0Qt3IRhS9Kop9uwl4IByPH2t72xi
	M9ERpqA2HX76zNstmmATdsnkNbx++7dVVkI9pUP9o4L9X5rfIoLWBk8KlWWRpZS0U8vtlhNNdw9Y0
	ill5z76LOEVdDV0dgAD882ykpwzJS9OUO7OXENg0FsSZAUBgMJcfA1SXK6pzPrJZdTP4l5Q8uhtQo
	1v7//OIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ZKf-000000038k9-1lNr;
	Fri, 04 Sep 2026 19:12:13 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ZKc-000000038iw-0bKl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 19:12:12 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8568e3ed034so955677b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 12:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788549126; x=1789153926; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4HJBZzHdO6P6nJOdbBqlWJWT1PzSbfwvCowjEuATTwM=;
        b=xNQqlqf9Kd9s9DXIdz9RCRl+y5Otx7bQkNeCepVXzehP8z4urlNfmdDT4S13OLiYW/
         LHud8Ax9R5usr1i8LHzj3421FD/wVlojsv8k9yuMWMpORYC8nlEpqV+q9Rd/VES8RprV
         36HtUDARlUhnh+rio3gs+NF+cRnL1tYP3IJYS9yKo3/77362L5CH1Ck4BnOQdAYmDcpY
         IHP/OgvKHSGLIZf6KYczDKmkBdUheGl4X5yjr0jtzUN37oCZIWZUqvqKsevmS33lphg3
         rF6WQKG9jsRIdJHSlOqm99MLO1TVLfVv9X2AIz7507+MEgtlZqvYrby6TPUNbMSTikUg
         rbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788549126; x=1789153926;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4HJBZzHdO6P6nJOdbBqlWJWT1PzSbfwvCowjEuATTwM=;
        b=aAr8hDs0RBvr447BxzISOpkMvYePkq2LW371UH7Z05pain8pnv9Ycbg5+GrQqBZXEw
         0iP6cJYBEpBVvlefU8aaFwOa9B2Jlm3Xy//tpjUn6ZE0N6U6m4H3DsYmNoBdXVaJcke5
         gEun00C8RihSoZLqPrk+byGvCaieV9aW1/f/xZc1kL6rMsPqJaeWWXosYcZTqv9cJsix
         l6y4Ll28cW9OzgUs4JsRUtXNqEOxGCm1wFIWucnpFXdAC1OgKh4mL1tfNkIdDwNEo5wi
         u3ZpwIBNBDhQqR8r/ifleDeNHN9/Mi3EfNnIwRAahuuleMD4C+W/yrpAAEPM11ovS7Sm
         0xSg==
X-Forwarded-Encrypted: i=1; AKwUvBz0Av/F+Gd4gcAQQ6EqFnKVytUv1ZlieUDFIqireYSNeekkAo+UNyXHkYBzG00UA9JxDs4iJaut9yElkSHUPedj@lists.infradead.org
X-Gm-Message-State: AFuF++m8YP/jIcWHWv3SspCvNP7G1I1Haivfa3nA+KDMPio0TFkGQgww
	udXg5HgpFvhR3qVrNRoTDKbNapgq9be+UfN1ZbT3Isn/FhpseukrkK9i0W44Ih+Qqws=
X-Gm-Gg: AYBFou2Z5+pDT6LPS3tAEu38kvfe7ZSdGfHhVjGNeT1SoiHgd4O15Jq9DywnACB5L0o
	XluWqj57jsQ5LlY9ffbSw+/ZmmA7N3+pXO5yylCm/UQeYU2YhczH15FT5h/Fmr3OsTF+WAdVGYj
	QX17YH9pGVgNE+FS59QQRfOMLjRFIKGSfjykhK5KqEgIUyGxhUsqMRLtWF5jwJ1bv0mXOS20vtC
	Vzp1uwAzqpPU7JuzrgA4Nt7iXZBhtwjZKwKuZiAauBEDATw2o5jxBIzjCfrhdrYZMgqQLKSazNU
	PpzZXuBjXB8/4ppxM6ysyQnn/RaiWd2u0Y+/mJ+0phHkPiJyE2Mk9Kv8hP2pdm3S+w6fTEK6U7k
	nmyr+i4kGweOq5EeB/hW8rooQXPMuDkx80e7xTrvWc7IX0+LFJOFpIGQVYe2TfjIXtGKjoIPyCL
	/6vWJL6eU0XwgTEQZnJHvf2eh6K91r5g6JVAWq5xTKdep6zgLixMEklW8IC7ds9I2Z
X-Received: by 2002:a05:6a21:1392:b0:3d7:dfbf:7435 with SMTP id adf61e73a8af0-3da3a13d20dmr12237083637.25.1788549125532;
        Fri, 04 Sep 2026 12:12:05 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:f95f:75de:b3f0:3bf5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc45542bd2asm1217812a12.12.2026.09.04.12.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:12:04 -0700 (PDT)
Date: Fri, 4 Sep 2026 13:12:02 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Marcel Hofmann <marcel@hofmania.de>,
	Bjorn Andersson <andersson@kernel.org>, Frank Li <frank.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	"linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Marcel Hofmann <marcel.hofmann@ingenics-digital.com>
Subject: Re: [PATCH v2] remoteproc: imx_rproc: allow mappings ending at
 region boundary
Message-ID: <apsYAsY31HEIezay@p14s>
References: <20260827123136.438798-1-marcel@hofmania.de>
 <ZR6PR04MB375776E2B1C61FAF1A7FA9719688B52@ZR6PR04MB375776.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZR6PR04MB375776E2B1C61FAF1A7FA9719688B52@ZR6PR04MB375776.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_121210_225038_1214A61D 
X-CRM114-Status: GOOD (  18.04  )
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

On Fri, Sep 04, 2026 at 03:32:08AM +0000, Peng Fan (OSS) wrote:
> > Subject: [PATCH v2] remoteproc: imx_rproc: allow mappings ending at
> > region boundary
> >
> > From: Marcel Hofmann <marcel.hofmann@ingenics-digital.com>
> >
> > The address range checks in imx_rproc_da_to_sys() and
> > imx_rproc_da_to_va() use a strict comparison for the exclusive end
> > address of the requested range.
> >
> > As a result, a valid request that ends exactly at the end of an address
> > translation or mapped memory region is rejected. For a region [start,
> > start + size), a request [addr, addr + len) is contained when:
> >
> >     addr >= start && addr + len <= start + size
> >
> > This occurs when a loadable ELF segment fills an entire mapped
> > memory region. This can be produced by a linker script that extends
> > the resource table section to the end of its designated region:
> >
> >     .resource_table :
> >     {
> >       . = ALIGN(8);
> >       KEEP(*(.resource_table)) /* Resource table */
> >       . = ALIGN(8);
> >       . = ORIGIN(m_rsc_tbl) + LENGTH(m_rsc_tbl);
> >     } > m_rsc_tbl =0x00
> >
> > This produces a ELF program header like:
> >
> >     LOAD  0x010000 0xa4220000 0xa4220000 0x01000 0x01000 R
> > 0x1000
> >
> > In this case, the segment size matches the mapped region size exactly,
> > causing the address translation to fail with:
> >
> >     bad phdr da 0xa4220000 mem 0x1000
> >
> > Rework the upper-bound checks to allow ranges ending exactly at the
> > region boundary while guarding against integer overflow.
> >
> > Fixes: a0ff4aa6f010 ("remoteproc: imx_rproc: add a NXP/Freescale
> > imx_rproc driver")
> > Signed-off-by: Marcel Hofmann <marcel.hofmann@ingenics-
> > digital.com>
> 
> Tested-by: Peng Fan <peng.fan@nxp.com>  #i.MX95-19x19-EVK
>

Applied.
 
> Thanks,
> Peng.
> 

