Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F1AC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 13:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IaOqkqi4ZsckMMcVlfVzFatudJFOKDndawaygsJAlnk=; b=HhynwnB1aaYRWhh9c28qcsXcpP
	YASQ9RHs9Kb+KLR9VICuvgoNsE+93U4L3uTf0yhEHGKbYajJifytPVcZmNrQWLhdSu9XeANPAIyWA
	mzblhPN/g2tSTHJr6hQwZX4toEB4Khg+jHY/YElbj9MjoE0182H4vILwRd2Wc8kTFvDQUAyAGsSne
	iD8ceojwZbRmEFYHihIjTOqdHvUfhDg8YdVJqcx1RnD2EsS750mA6uncNSIuwkgtafqshUF9u2bI2
	UpxZgdO5ADngTkuzhuhQnTpfd/SXqUMsXVVscA8cRGWN7UKgjnRP54MhFOBte1Vvgvpve++ELEwYE
	aeOw0ugQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdUlU-00000008tCe-1pWu;
	Thu, 30 Jan 2025 13:39:28 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdUkB-00000008t6Z-2A00
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 13:38:08 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3ebb2d8dac4so506340b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 05:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738244286; x=1738849086; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IaOqkqi4ZsckMMcVlfVzFatudJFOKDndawaygsJAlnk=;
        b=JFyF/FM+6FU/k3mE0yMbfFChEOFay5TUsBusxl7u00TuzLKSS3Nwp9b9osKRmXzaxY
         xpgCLa4a6nXl/DmHoTd4tnLMi58ybK4+m31b/LrkE4tAaToacJB0eCOmXLfRWMOfYCB0
         RMseX9DHwoqqCo9+CZuAMrR4nhzqICYj5Z/kYIBmCTKU4oJi08XU5JeUEDjfT6SqnYT9
         tGKw1ddRq3dAn0apn/tshW/NsLwR1PvqQHkrJgaFMr5OrtL+babZ4vlesEYUwH9dabzV
         ATGKIcUFSMzo2nADIBeEOe4Q1P6SphdhWlr+N4qR02wckN0IyHaRcjFChbT/Srh0Ipe0
         TikA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738244286; x=1738849086;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IaOqkqi4ZsckMMcVlfVzFatudJFOKDndawaygsJAlnk=;
        b=e6m0RlQGVCXzRQ8MgqurGE3maMmzzMR5GBGEdyw92Idr63Cs6ZABMa47KWvWrDWAdX
         QNfzUjM3pc7B6KWn7ydzKleBh6Q9kpvdVjCEC2Beenu5j2ItlZtFpqnOG28dPOmJUU6A
         17Z5REtJkxO3i1A1dCrrrf74THFDi1nARvowFfT43YK35CteWuBqDa/6eIYG1y9ZRlcK
         HQBbCAf9j8YwIbOut5zHvpVU4PcxRIdpi2FELrDaP2sRq2Wgw3V+rNlHbeUPLLq/COyA
         5FLh7DqcrgtGiIH8btW1zc4RCE2tasASLSxuI24k8zqQ4dh0FrL5FMon1KMD+aKbDv2C
         KNGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoF0dV+6loyPwV7Q1Zg3M7cDRTPB55MPvEg3yOxn/kbROqNi7ZETp3rEu0xJIoWKYGy9nmmX1BrKXVgqXJwEIm@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0RZmowKC9rAc6ve1HjnPkubUpYdEWDOagrq5RKZ3cNkCXcvZs
	YEue0e+g26EWEedDi/DqlLg1n/VzdXkZETEG/+ZUS9dK/T2Nk/Nw
X-Gm-Gg: ASbGnctcsjyQP1X3x6PU8jQPVyJu0rUPXbYMCsO5S5SbiTY0wIIVjpX9kt3U4vCHqQw
	7V6v80ATOqGEu/LPr1UWum/2YJzXcDHJflzPGae2t35teUeFdw5wxfIBjF00UJ4LpXfbhowXTy6
	uXv7k4RHIvQ/KTOyjx9YAX9EfXCt0T9LxkubtD3e/RICc2epBOLCEBKZ8a43rNZ6NOUY0wKtCoh
	v1pZtSpbtJtStGbs8gWLCPpUlAxEf5L5dAtAPUhnoXwB284lKF/aWzaoMd/S0O3efwDDGZ7h+45
	q9iG
X-Google-Smtp-Source: AGHT+IGFWTM916CiHup+GvXXTaGukMyyxcRzxGKJc5oj7MHmJp2ub5HMhM/2b9dpAzf0/kTivKI5/A==
X-Received: by 2002:a05:6808:3a19:b0:3e7:b644:e4ec with SMTP id 5614622812f47-3f323b674acmr4766306b6e.26.1738244285909;
        Thu, 30 Jan 2025 05:38:05 -0800 (PST)
Received: from halaneyt14s.local ([2600:1700:1ff0:d0e0::e])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726618cb8aasm310109a34.64.2025.01.30.05.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 05:38:04 -0800 (PST)
Date: Thu, 30 Jan 2025 07:38:00 -0600
From: Andrew Halaney <ajhalaney@gmail.com>
To: Nishanth Menon <nm@ti.com>
Cc: Daniel Schultz <D.Schultz@phytec.de>, 
	Andrew Halaney <ahalaney@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	"vigneshr@ti.com" <vigneshr@ti.com>, "srk@ti.com" <srk@ti.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: defconfig: Enable PCI_J721E
Message-ID: <wqravmnyudex3wcwhkbcbanxsqrmplpq5fmyueyaniya2dkqec@axu7nmb2xbbp>
References: <20240807-pci-j721e-defconfig-v1-1-b97e5f4564f6@redhat.com>
 <8b700897-1653-49f2-8fba-e5fce13a5447@phytec.de>
 <20250122145822.4ewsmkk6ztbeejzf@slashing>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122145822.4ewsmkk6ztbeejzf@slashing>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_053807_554024_0B65E931 
X-CRM114-Status: GOOD (  20.93  )
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

On Wed, Jan 22, 2025 at 08:58:22AM -0600, Nishanth Menon wrote:
> On 14:53-20250122, Daniel Schultz wrote:
> > can someone please apply this patch? It's actually required by all TI 
> > AM6 devices with PCIe, e.g. AM64x.
> > 
> > - Daniel
> > 
> > On 07.08.24 22:15, Andrew Halaney wrote:
> > > Enable PCI_J721E for usage in both host and endpoint modes.
> > > This is used by boards such as Texas Instrument's SK-AM69 and
> > > J784S4XEVM.
> > >
> > > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > Tested-By: Daniel Schultz <d.schultz@phytec.de>
> > > ---
> > >   arch/arm64/configs/defconfig | 2 ++
> > >   1 file changed, 2 insertions(+)
> > >
> > > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > > index 01dd286ba7ef0..e5222dbedd387 100644
> > > --- a/arch/arm64/configs/defconfig
> > > +++ b/arch/arm64/configs/defconfig
> > > @@ -225,6 +225,8 @@ CONFIG_PCIE_RCAR_HOST=y
> > >   CONFIG_PCIE_RCAR_EP=y
> > >   CONFIG_PCIE_ROCKCHIP_HOST=m
> > >   CONFIG_PCI_XGENE=y
> > > +CONFIG_PCI_J721E_HOST=y
> > > +CONFIG_PCI_J721E_EP=y
> > >   CONFIG_PCI_IMX6_HOST=y
> > >   CONFIG_PCI_LAYERSCAPE=y
> > >   CONFIG_PCI_HISI=y
> 
> please make them as modules. no point in growing the default Image file.
> 

The PCI_J721E_HOST config only supports builtin, which I think has
something to do with [0] (but I only re-skimmed that this morning
briefly). I don't have the hardware any more, so I can't test what goes
on if you make it a module etc unfortunately.

[0] https://lore.kernel.org/all/86o73j3vea.wl-maz@kernel.org/

