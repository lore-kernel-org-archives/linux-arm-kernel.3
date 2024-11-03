Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BABE67806
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 06:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Qhm+LitePBXQsySKsmg7fuQgH8MGcEsYsJ0eyWGhL0=; b=fDUBM5rdXs1z2zTxYSDAmYT2kb
	rAKjZf0+lhyZKiYJ17Ttj39MloyV4pgr57rarXsHHtCEHHF0ycWdh4CJ3DEffP6ts9EGM/Mwqm/AY
	0lI9uPD2uJhjYzdoDLv0HzzKKhU79KCFbRbXRCNt+5GEi8ZxO0YckQHU7+eae1CBaY4v6ChyaZx/e
	vK+Ajklg5L/29ik4c9fPR1Ooc/cdt4HCAEsgxzi0h9zDCRxLoecbHSItzptyl1VFO9G2AEFx1uOXR
	nsM9X6KkopgHui7hMYoM7grgYflE5706J71URcQHG6hXk6MIizOTmHlMdNRmAmzN/oWBuSb1nTIoL
	9d62Yd/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7U2n-0000000B2Kq-2WVh;
	Sun, 03 Nov 2024 06:25:01 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7U16-0000000B2Cg-3Ho3
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 06:23:18 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-71e52582cf8so2769188b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 23:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730614996; x=1731219796; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Qhm+LitePBXQsySKsmg7fuQgH8MGcEsYsJ0eyWGhL0=;
        b=B/+7rcegQAMmxe/RPVdsfqlD6gDsuR7fIQDZnEY/4vyibGkNMvwUFT6fi6tVJKIbPP
         RLI/sfWp88PFDkPxIrNVcEk7TPpzjPwnjaRhbW2DwMwoGGAoZ0KBxkIYxdP4F3E6e1Zf
         wbL5ubaW1deIuhqthqMuhSsY8jhWnS1bt06ODO9+WTN83RFzry/Jwws5R2b9RfsO6mrk
         Y7KCk3V2BcMog8mfNUVl/dYKNB26jZ0l9BdKGKiZRAYDvjc3wbCMHASKCRJ8Hh+6tASv
         agBPBKg5IB996yi41carEojNKgu+lyMJUGebkQZNK0JZmssTVtrlAVWqgpdHqrYCzxkh
         I3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730614996; x=1731219796;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Qhm+LitePBXQsySKsmg7fuQgH8MGcEsYsJ0eyWGhL0=;
        b=twPQ5abfRON28xWONm0+EYPjBFHuSrhQm5WXb1cDehkAsa0AdLIqeZOM7QakIxgr6S
         LdeMMf6XFIk0SZPavgjWJZWwCKsnX7GSDLBw3TxlD1DHwRTpYnIjbHtJ57dZHtnbiQ4A
         gueLK6FFGz0tKObK+1N5/MmzH+mMo75W69T/ymeFCbMgUmpEWgiuVGOVkCk/MVJk10vb
         dMvaZ9hfvDkCUp3+Vc6c0/ZURaXKploxbZJZ9E1NZ2ajg5IstRpIV79m6HxhrLED07QQ
         jGNRY3+ouLmnWgxJxdhIHlwDIGzqwcVvowFlUOGR896VBuDe0NsVf4weJFhiPhQLWUAd
         gBWA==
X-Forwarded-Encrypted: i=1; AJvYcCWnza0nKDabw1yTClKEw+9QVsAj7eer2mbAI8ohB+/oJlTMH9heJQ8z+xVkMiwzmpxW3hQDcObl0N1DTVQB6MMb@lists.infradead.org
X-Gm-Message-State: AOJu0YwT9HMQH9jp0K+vqrJ317SpudUQMYXBkMGk8tSpoDmXq6AuQNg7
	zPlYg0ZSCVyK3GcmA0ZXqHJFKYuODaeZeP5S3sFg3N2WPdjR+lIxHXqasXQxNA==
X-Google-Smtp-Source: AGHT+IG4AFUZuM3edwnngjVKBU1jcTHodIw4RW2EypyrkFK7ELfPVwTprbngwCPD9smyqFMmdBqcAQ==
X-Received: by 2002:a05:6a20:d70b:b0:1d9:77c0:61c6 with SMTP id adf61e73a8af0-1dba50bad20mr13962806637.0.1730614995661;
        Sat, 02 Nov 2024 23:23:15 -0700 (PDT)
Received: from thinkpad ([220.158.156.209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee455a4994sm4819369a12.43.2024.11.02.23.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 23:23:15 -0700 (PDT)
Date: Sun, 3 Nov 2024 11:53:05 +0530
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
Subject: Re: [PATCH v3 2/2] PCI: imx6: Add IOMMU and ITS MSI support for
 i.MX95
Message-ID: <20241103062305.6cqftpv4bwneg2mo@thinkpad>
References: <20241024-imx95_lut-v3-0-7509c9bbab86@nxp.com>
 <20241024-imx95_lut-v3-2-7509c9bbab86@nxp.com>
 <20241102114937.w7jt7n7zr3ext5jo@thinkpad>
 <ZyZg1nlSPf5rvm8q@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZyZg1nlSPf5rvm8q@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_232316_883777_E412DF2A 
X-CRM114-Status: GOOD (  19.67  )
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

On Sat, Nov 02, 2024 at 01:26:46PM -0400, Frank Li wrote:

[...]

> > > +
> > > +	target = NULL;
> > > +	err_i = of_map_id(dev->of_node, rid, "iommu-map", "iommu-map-mask", &target, &sid_i);
> > > +	target = NULL;
> >
> > What is the point in passing 'target' here?
> 
> See https://lore.kernel.org/imx/b479cad6-e0c5-48fb-bb8f-a70f7582cfd5@arm.com/
> Marc Zyngier's comments:
> 
> "Perhaps it is reasonable to assume that i.MX95 will never have SMMU/ITS
> mappings for low-numbered devices on bus 0, but in general this isn't
> very robust, and either way it's certainly not all that clear at first
> glance what assmuption is actually being made here. If it's significant
> whether a mapping actually exists or not for the given ID then you
> should really use the "target" argument of of_map_id() to determine that."
> 
> See v4 https://lore.kernel.org/imx/20241101-imx95_lut-v4-2-0fdf9a2fe754@nxp.com/
> 

Okay, thanks! I was confused by the fact that you never used 'target' in this
version. But v4 clears it up.

- Mani

> +	target = NULL;
> +	err_m = of_map_id(dev->of_node, rid, "msi-map", "msi-map-mask", &target, &sid_m);
> +
> +	/*
> +	 * Return failure if msi-map exist and no entry for rid because dwc common
> +	 * driver will skip setting up built-in MSI controller if msi-map existed.
> +	 *
> +	 *   err_m      target
> +	 *	0	NULL		Return failure, function not work.
> +	 *      !0      NULL		msi-map not exist, use built-in MSI.
> +	 *	0	!NULL		Find one entry.
> +	 *	!0	!NULL		Invalidate case.
> +	 */
> 
> 
> >
> > > +	err_m = of_map_id(dev->of_node, rid, "msi-map", "msi-map-mask", &target, &sid_m);
> > > +
> > > +
> > > +	/*
> > > +	 * msi-map        iommu-map
> > > +	 *   Y                Y            ITS + SMMU, require the same sid
> > > +	 *   Y                N            ITS
> > > +	 *   N                Y            DWC MSI Ctrl + SMMU
> > > +	 *   N                N            DWC MSI Ctrl
> > > +	 */
> > > +	if (!err_i && !err_m)
> > > +		if ((sid_i & IMX95_SID_MASK) != (sid_m & IMX95_SID_MASK)) {
> > > +			dev_err(dev, "its and iommu stream id miss match, please check dts file\n");
> >
> > "iommu-map and msi-map entries mismatch!"
> >
> > - Mani
> >
> > --
> > மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்

