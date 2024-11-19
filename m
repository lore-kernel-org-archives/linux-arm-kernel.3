Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4F3D6204E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 09:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mh9tKfQZDVb7Srbzricoyx+VzVp7BjyJVZmRNXjCsTY=; b=tXlbt2VWZPmxoVCAfwdoxEuX6s
	uxPZ/U2rnEGAzFg+M8RXtRargWJft02dwxOLCAga6OwyFnu/D4QYWJBTeS2/zXgUi14EtL4irPdn3
	TgzRhSli+F/ZGtlJ7NLS1jekYnh9kLyje8DFKjvlkyeUL18YDMy9L4aK0hvn1AHdHySRjDI7LTFm3
	arX8Bxlofablut8ITA5Gj0G6kwN59QWeMeYzn00H64PruMhCHGpKByKqAbhBw4XXeGraGoODo23pj
	8T/2BNTMGyjdG+UcR+EUdfh3PcLXMo5ruXKJwsIJhaDwedI00T7DCrzk50eizP+DtV3Yo9YN+Y30y
	wthW+TJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDKN9-0000000BrhF-3m3k;
	Tue, 19 Nov 2024 09:18:11 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDKMC-0000000BrZD-2NLy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 09:17:14 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-71a5ab612ceso294778a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 01:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732007831; x=1732612631; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mh9tKfQZDVb7Srbzricoyx+VzVp7BjyJVZmRNXjCsTY=;
        b=O2fZr9q4N5ifouu4t8wYbDHzFHYlZV2OqtHEl3+lHSsnhhdDQqUlOk5ENKma7hzPBN
         SEauOWJXl8pBg4TyDFA1lg7XLgrvx5dnU3EOUA+J3auHWHV7v/wZI200irhnC/Rd7ugF
         ukXmv6t5aRvXOlOcsLRr3H+eRgP+hdLiVw4YQn70KibNJ2zOiUDxCjpc8W69IZXSlowT
         /017stXHFmp3Bfdg9PhgqJGfc2pnjIhqZRf7gc9BI5pNlv2557lz69Nc0yIuDMfRuBha
         t6QLIklBXjJMwS6bVka6DgH4eNlPNhzovJkk1hpILJt+PyMEDRb+MH8M5YiUOwdvxjzz
         j/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732007831; x=1732612631;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mh9tKfQZDVb7Srbzricoyx+VzVp7BjyJVZmRNXjCsTY=;
        b=fzYdtomUr5OfoD1MMjTvlIEtM5/yHMnPGcX5OyDKTA8B7n8Lb2ulsFeuCsGyecfKQB
         wYPEj3oLQYu8G2rnmSCoWxg9UPYQYsLiKmSyAQe/CHwP84t+XR5744xRGEsDGVdsX1u3
         eTM2qMUlLBzNFg1LCwJpnRPRlY5CEiU4Zfh25j/yQHEtvMCf16M/hjkJ02IFlXozO8CU
         KBPv8pDkHv80SKvmqwjEaUHvTJQmlcCnq0quCR4RP6nUP87ffHHz1lLhwtuXicb2v6g6
         q1xdVZZ59VhImENIomtUAHASdTSvTkN8yDAH2ip1mym2xiQqObPEngAQfd+jFfFyKQVX
         SMsw==
X-Forwarded-Encrypted: i=1; AJvYcCWjCKKF+ZaNDAc9EomseEqMadjvBf9lGO/PKaoI5dDaDOHYDim84fuKA/C3Tl0KQluSapEg13z+uujQWhkuFUUW@lists.infradead.org
X-Gm-Message-State: AOJu0YzsSkDIUBYaBWy/Pe6S5BKNxxb77FMU4MTvDdAfVNVKTOVy6eCK
	sgwe+ziYEIE4NTpheKn5psVBMyALwKPqHK0MGRCp06DBwpE66YfO7sTqQmWHiA==
X-Google-Smtp-Source: AGHT+IF6oNS7zAaqiMj3qBtazoexGSI49TeW8s00tlEKm6P+2kEMfwF3rimz60UqsKAumxJWheQLUg==
X-Received: by 2002:a05:6830:2a8f:b0:718:a3e:29b7 with SMTP id 46e09a7af769-71a779213bamr15070132a34.7.1732007830619;
        Tue, 19 Nov 2024 01:17:10 -0800 (PST)
Received: from thinkpad ([117.213.96.14])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8c1dade0esm7241941a12.66.2024.11.19.01.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Nov 2024 01:17:10 -0800 (PST)
Date: Tue, 19 Nov 2024 14:46:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, alyssa@rosenzweig.io, bpf@vger.kernel.org,
	broonie@kernel.org, jgg@ziepe.ca, joro@8bytes.org,
	lgirdwood@gmail.com, maz@kernel.org, p.zabel@pengutronix.de,
	robin.murphy@arm.com, will@kernel.org
Subject: Re: [PATCH v5 2/2] PCI: imx6: Add IOMMU and ITS MSI support for
 i.MX95
Message-ID: <20241119091659.rmdufvdi6jkynvfe@thinkpad>
References: <20241104-imx95_lut-v5-0-feb972f3f13b@nxp.com>
 <20241104-imx95_lut-v5-2-feb972f3f13b@nxp.com>
 <20241113174841.olnyu5l6rbmr3tqh@thinkpad>
 <ZzTrdUX0NUsHQLvd@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZzTrdUX0NUsHQLvd@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_011712_607863_86EBF5AA 
X-CRM114-Status: GOOD (  21.56  )
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

On Wed, Nov 13, 2024 at 01:09:57PM -0500, Frank Li wrote:

[...]

> > > +	for (i = 0; i < IMX95_MAX_LUT; i++) {
> > > +		regmap_write(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_ACSCTRL, IMX95_PEO_LUT_RWA | i);
> > > +		regmap_read(imx_pcie->iomuxc_gpr, IMX95_PE0_LUT_DATA1, &data1);
> > > +
> > > +		if (!(data1 & IMX95_PE0_LUT_VLD)) {
> > > +			if (free < 0)
> > > +				free = i;
> >
> > So you don't increment 'free' once it becomes >=0? Why can't you use the loop
> > iterator 'i' itself instead of 'free'?
> 
> It is used to find first free slot. This loop check if there are duplicated
> entry. If no duplicated rid entry, then use first free slot.
> 

Ah, so you have combined both in one loop. A comment on top would've been
helpful to understand the logic.

[...]

> > > +	if (!err_i)
> > > +		return imx_pcie_add_lut(imx_pcie, rid, sid_i);
> > > +	else if (!err_m)
> > > +		/* Hardware auto add 2 bit controller id ahead of stream ID */
> >
> > What is this comment for? I don't find it relevant here.
> 
> The comment for why need mask 2bits before config lut. for example, dts
> set stream id is 0xC4, but lut only need 0x4.
> 

Ok. It was not super clear. Could you please reword it as below?

"LUT only needs the lower 6 bits of the SID as it will prepend the 2 bit
controller ID by default."

- Mani

-- 
மணிவண்ணன் சதாசிவம்

