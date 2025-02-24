Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D954C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 13:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/zBjsZQTLhBnhqIaIhHUuRmEg89TnatJo/+jGRcKh4=; b=Ozn6ZzAlZPFwbHfHU9fVvRk80H
	ZCLVT/H9FNqAKvURW8qMXICOloE4Isdt5n2FB4vLNWQ4JBc8eMzx8aSO97X6tG3Z66lfE/HjW0ySN
	vq2LJhnyfV8tD2x4awWJsROJlXmokPy8e1oG9udpvol6fwFuKEZqLWdmlPc+VaKhp4Y2Absf0YH64
	cBykYb96AuKmAb3XT91sjIV78COrqzoj9KHQ/ochOdZ/8ptb+oxwauc4ycKROukwdRakHtaPkALQS
	xLYamAGxhSq6aTt2cq1T0cy6X+yim0CA6Xeub7ET2gM1o0lc4Ov/TTyXQJvrxvu8e/+D9imgHQUrO
	s35U+NEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYNV-0000000Drh7-1VKS;
	Mon, 24 Feb 2025 13:20:09 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYM1-0000000DraO-3G2K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 13:18:38 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-220c665ef4cso73732255ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 05:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740403117; x=1741007917; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k/zBjsZQTLhBnhqIaIhHUuRmEg89TnatJo/+jGRcKh4=;
        b=JuSIrC1RlovKo6CsoYOOw9A9AWUuK54q+RcsgtRfF8kWskiLUmRraUouFJykRaHVod
         yyc66j5JmpZM8pFpJQmC7XRR5ov1cBj9OmDjwZveJXOcm3s9BKDPA8DdGJrq/h60x3ff
         HZ4DfinIoFSQ6YsOFej/8ZR0AurxZJgufeHLkafOgQMyqZqfbA68uSZ9F56xwvq8aGZg
         9I8fneoz2yIf4BO3KCie911hUrSEWeQes5LMFE0Vi1Ga7541FT8lMwheQctOuj6Lbdgo
         GcZcQkPZtQRJuTtUGh7VfohTAb4zN0vMK0n6JOgDE5thI5oUaXRu/O3Hwtd5MdMhasIr
         yFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740403117; x=1741007917;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k/zBjsZQTLhBnhqIaIhHUuRmEg89TnatJo/+jGRcKh4=;
        b=fqRc4zz6hRnr564qZk7Cbw6nYt6JkbJjxbpeD0G1OZL1BBWK/F3LL1ztdb5BSco7Ot
         ecjgi5hvd2xk3MIftKGE4P0Thwz56VCYjI0lEyz1G6z17qabXUv5hselZhkQjsKm6D5m
         fY7tu6p5pf2jzIzxFK07W6xorPLDfPZ3Knk7U1PYk9xwG4l7v5c6K1VOC/UbV9dcnBKP
         YJYVDk0lC/2kddZDEPiRO/AiRMe9qFUMpm65arRpTMsAPiinNqQWtZKJS2hlMe8l9aL4
         gcAVN56SGSzf4BuUgocTsXqvdYKjkNFeGpE2PuwCaeAE6cu7li+alfthN5ju8oG3+jai
         jLOw==
X-Forwarded-Encrypted: i=1; AJvYcCWuGPkDKmmpbowyvG+47KxcubdPsZ9gr0Kbh4NgklBFLgHdP9muDBxkRRZA/edY+n9rwAfERXXB9s7KCCPC0VvV@lists.infradead.org
X-Gm-Message-State: AOJu0YwcLQpjBCuGBWqexnMlSxtyUWSFa6QiB7mbOt95DcQr6mV0cgrj
	L+Zilw8VJXT2kQ9O6HCli7A8JVa52nh2ZGc6UnGN98vdzkkcY2+XQOA5KNaXtg==
X-Gm-Gg: ASbGncsI3G1T30wLCM2j2b08Nrj4a0V92K4K+hEPtGQShpR8MMVa/sCYnegOtPjPqFr
	+bXFo3Pzm7niPyqN0yz84fk8mOROeP5aQmaTPZw4uSdHGNCbt5WGRmBLjiSj0HxuZr13ZyQkeGL
	X+a7PUYxVmDsBk1WAAZx4mOgKzt8C7aiNcTIRH9T3PqemRY9AGsaOm4kd00uTC9HE9uBb5DCIeo
	q/ChzkvNl5rNTwCdxiyC34ezb4yBj6zl5oqECdXHvCj9Vi3aeDFAf3OokzYuzati5+3D+GmgzBI
	cPo1QuIqvNoegKWHDU3/+l0dq3p9Oc/eAo5b
X-Google-Smtp-Source: AGHT+IGabpVbV+NHEQQXp8goqoKQe7jD7WPvleiiGHZZp7DZfPzcQ3EsMcTqWh3vQp+USwIPD1O+RA==
X-Received: by 2002:a05:6a21:7882:b0:1ee:cd18:d400 with SMTP id adf61e73a8af0-1eef3c883ecmr24664532637.11.1740403116989;
        Mon, 24 Feb 2025 05:18:36 -0800 (PST)
Received: from thinkpad ([36.255.17.202])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7325b03f169sm18621755b3a.63.2025.02.24.05.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 05:18:36 -0800 (PST)
Date: Mon, 24 Feb 2025 18:48:31 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [PATCH v3 2/2] PCI: mediatek-gen3: Configure PBUS_CSR registers
 for EN7581 SoC
Message-ID: <20250224131831.jqut4hpvv7tf7vzy@thinkpad>
References: <20250222-en7581-pcie-pbus-csr-v3-0-e0cca1f4d394@kernel.org>
 <20250222-en7581-pcie-pbus-csr-v3-2-e0cca1f4d394@kernel.org>
 <20250224055216.o23dzwimrghbr2ow@thinkpad>
 <Z7xEZPpWLQjTMnIz@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z7xEZPpWLQjTMnIz@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_051837_823298_89B0FC54 
X-CRM114-Status: GOOD (  17.67  )
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

On Mon, Feb 24, 2025 at 11:05:24AM +0100, Lorenzo Bianconi wrote:
> > On Sat, Feb 22, 2025 at 11:43:45AM +0100, Lorenzo Bianconi wrote:
> 
> [...]
> 
> > > +
> > > +	entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
> > > +	if (!entry)
> > > +		return -EINVAL;
> > 
> > -ENODEV or -ENOMEM
> 
> ack, I will fix it in v4
> 
> > 
> > > +
> > > +	addr = entry->res->start - entry->offset;
> > > +	err = regmap_write(pbus_regmap, args[0], lower_32_bits(addr));
> > > +	if (err)
> > 
> > MMIO write is not supposed to fail.
> 
> ack, I will fix it in v4
> 
> > 
> > > +		return err;
> > > +
> > > +	size = lower_32_bits(resource_size(entry->res));
> > > +	mask = size ? GENMASK(31, __fls(size)) : 0;
> > 
> > Size of MEM region could be 0?
> 
> I added this check since we consider just lower_32_bits().
> Do you think we should remove it?
> 

Yes please.

> > 
> > > +	err = regmap_write(pbus_regmap, args[1], mask);
> > > +	if (err)
> > 
> > MMIO write is not supposed to fail.
> 
> ack, I will fix it in v4
> 
> BTW I will remove your Reviwed-by tag since the patch has changed
> with respect to the one you added it. Please let me know if you
> prepfer to keep it.
> 

Sure, fine with me.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

