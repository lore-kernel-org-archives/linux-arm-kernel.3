Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24842D37E59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 16:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CvSobjH77Q9GEAjWyqemD7/74Kg/Yj+9ZW2qiuIARXI=; b=EufVnR9xhzNZqRzmp4DsJfk5fd
	cuHWl9vEFeF7NHopTMo8kjHXUEEjCMWD46yb5jCVS/Lfg81eKLhVAt4UdTvXjX0qioCjQ/PslNohv
	FgbTBS4q7iT+46Seuf2KuKXOYybz0M+gG7Xo9PrYFwirV36QJEVLofiBEH3OOnAirOrvCtwzsLNSi
	tRxBk9aOKRocKJafnWag51Hcc5+yGgxC8hS/xGtSskgJihBTsZizG+Yrrgjysm4tMlJGB0rDmFwBX
	bDSPt99p6bXgQh7FP3TcIxBpPUhF9kcqPZSES1f0BPzxBUTPpuymEY6SRLku3M1R+lR7g+27NGLFT
	K9/nruWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3RO-00000009s9d-3hVR;
	Wed, 14 Jan 2026 16:09:50 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg3RM-00000009s8a-0BEa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 16:09:49 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-8c24f867b75so901248085a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 08:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768406987; x=1769011787; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CvSobjH77Q9GEAjWyqemD7/74Kg/Yj+9ZW2qiuIARXI=;
        b=A7Q9/wtzBumBmIjI+xApUwlrGuyoJ2PlG3adv61Sxxe8remUeNjLFEtZkRMJw4HNZy
         oMilsrgELWXp7f0vjVddDoAWXcrDIFwCZg0Or4sOjehntHlFgDx9KI2dSTA5ROO/IL+W
         1e6XBeDfib5GLmG21aAntH+Z/qv7hvm3PSr0jIKrPaDeE17LnwXj3p5JafH2KZFJBIUt
         J/Wa0A8SG3VUvqoI0b9KSTQGvUR15uyQ7aywmncK6G8JwW/p6p6Ft/hGgb2j13NbAjlz
         //GmUnJ3XB+XCZwy7xR795nMV8xkyqSGd4/Jg17/jI51Iqj0bXYTC0NGgsTlD+hti4T2
         WoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768406987; x=1769011787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CvSobjH77Q9GEAjWyqemD7/74Kg/Yj+9ZW2qiuIARXI=;
        b=Hh+9iTPr6w5NmJAfhFSEaB9h1NHUw8Ik9kpftPV5EO472/35TVRZhvTWnkEakXGVyc
         sxaPJrp/CG7ysKPbTulcYgmgXHK6VBIW2LeSHGL6FmnTY0HKKQTz79FL3QSX0ibHaUI3
         1RkyiI024EipEN9jUO2DEh69IzMU+dmN7A9MiBkYSKOAUV1WgiQVz5/N5zjBJyUSGHcn
         T79Sof4M7LT7+yjTjMt5BErV2RiBBfYwVuCEnyWAZoEvGBkcBZclIeUwBARckRXI1FZi
         3Yf2pFUUGNOngrK6QnturqTcmdTtssO2BAFkQwxsuZ8K1mu+0wzk4WPtJ6Yr5XfI5GFP
         kiWw==
X-Forwarded-Encrypted: i=1; AJvYcCUImwYNwD+4qh0/8ESK9t07ASXy1WjJ0MVjj38EARgiqJCYPereJrVu1EOSsic5+7lfVsaFICkMgwlsZ15A2Re/@lists.infradead.org
X-Gm-Message-State: AOJu0YzxJFUZPPRHJw0tH7E/NV7wEcew7DFnBk7Hiw2FD8e7URcXGjPR
	Jrpz3zdYMJop20NHu895m3HcXEFZXEIKuV49uv/6+MhfUNWPb6bzl6Nj
X-Gm-Gg: AY/fxX74zyWJZvChOxLS7NdcAtDNsxHnGA1tst7aMkSU9fQYv3fDlwjYgB7ba4+zX27
	C5uDnYYCwu2YNv0utTa5gGev6UHtQOBeg7AX2+X7LBzwbkufO0Q8ua4FkBEGKDkeNNOcqWZ+GQM
	uTQnA2f5RLfA/s5bp3VWKat0yKijqeGIvZXE92ziOeXU6QcL4tF2LhZe8c5/HoYW3VqDtvdz2QN
	9mIkoDBtAqgYHTmrNbtvvHPV48lfGG2v9te9Z4CUKjlk0zw+w6CmQtDxHd6racpWu1i6DrW2hOP
	2F2vkntSS9HzuPGkVqWGFG8N2i+sklZ3QefC0C8bszMNG4vmlRdwc77J0yQ3DxcHb0Gcn1fV/0G
	KUyVO3Lz+V8SfXAmwcGTEHgl0wcNgoezsnk21wublpqiGAT32/8Px1dfZ1p6FzPhHOdAbVd2jiP
	a44jYrnYihrW3cN7Jv3TK6Si2UNZOPzjysZFGHhtPRogUH/GkYkrN9E5dnPlB7PuKqrA/COhxW7
	IBpn6ONqikebT4=
X-Received: by 2002:a05:620a:4804:b0:8c5:1fb5:1631 with SMTP id af79cd13be357-8c52fbcf18fmr451977085a.76.1768406986626;
        Wed, 14 Jan 2026 08:09:46 -0800 (PST)
Received: from RDEALENC-L01.ad.analog.com ([24.206.116.131])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c5319a3b59sm155280685a.22.2026.01.14.08.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 08:09:45 -0800 (PST)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Wed, 14 Jan 2026 16:09:39 +0000
To: Mark Brown <broonie@kernel.org>, 
	Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: Jun Guo <jun.guo@cixtech.com>, peter.chen@cixtech.com, 
	fugang.duan@cixtech.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-spi@vger.kernel.org, michal.simek@amd.com, cix-kernel-upstream@cixtech.com, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] spi: spi-cadence: supports transmission with
 bits_per_word of 16 and 32
Message-ID: <lbijvnnwsnddonmm5pveqzap6iibxhl4maneq43x4j6w64dev6@u75qhm5cwiob>
References: <20251031073003.3289573-1-jun.guo@cixtech.com>
 <20251031073003.3289573-3-jun.guo@cixtech.com>
 <fu4ujdxwlhyhuwjtsiebje5pyc32rfs52vo2gyy7nay2krkxeh@wpls44xdfgy4>
 <0dbf3a5b-6a60-46d8-a358-61b8d527a8da@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0dbf3a5b-6a60-46d8-a358-61b8d527a8da@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_080948_112372_BBDB2AE4 
X-CRM114-Status: GOOD (  15.95  )
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

On 26/01/14 02:16PM, Mark Brown wrote:
> On Wed, Jan 14, 2026 at 02:14:35PM +0000, Rodrigo Alencar wrote:
> > On 25/10/31 03:30PM, Jun Guo wrote:
> 
> > > +	if (xspi->txbuf) {
> > > +		switch (xspi->n_bytes) {
> > > +		case CDNS_SPI_N_BYTES_U8:
> > > +			txw = *(u8 *)xspi->txbuf;
> > > +			break;
> 
> > > +		cdns_spi_write(xspi, CDNS_SPI_TXD, txw);
> > > +		xspi->txbuf = (u8 *)xspi->txbuf + xspi->n_bytes;
> > > +	}
> 
> > cdns_spi_write(xspi, CDNS_SPI_TXD, txw) needs to be called regardless of xspi->txbuf.
> > Otherwise, there will be no clock for the read operation to work.
> > This is a bug I am seeing on a Zedboard running on 6.19
> 
> So the device needs to be flagged as SPI_CONTROLLER_MUST_TX?

yes, It works if

ctlr->flags = SPI_CONTROLLER_MUST_TX;

is added to the probe function. At least for my case handling with "xlnx,zynq-spi-r1p6"

kind regards,

Rodrigo Alencar


