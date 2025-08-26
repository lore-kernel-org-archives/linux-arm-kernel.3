Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068BECA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 12:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T84fHSOjtH7H+COR+2RAmmEuuAs5zWdfFcbzGcITMW0=; b=Oowb7KZaKEv5hSn4FrvRoCF4Vh
	hzIxMJNDF0KvvHGIzHAhcPxfVnFHClDsadIETDbQlD/GMV8CE2XZrLIVr6DwYdFQoyp92JGBvsk9g
	U8FWBsz/TZTDfePz6rmzTCFIxkL3L8iH78wvhJuSqxi3YQL3OfnBCv7rXrHzjA+zvwRNtfbSB7BOT
	JFA8NMqRZQzhS2RLVJJuP7aN/Q4Ogl+fxzVWIHv8y+2wbiChU1wsLSvTCR93GQ23kVK+WdADjc9PD
	09e3HcOOUTtR3E83J75N0n8aVL5IFFgNI0sL8Zb17dvWdnE67raXdKX1AW2ocPvMscu5Ed3SFgzJ/
	wpezDqjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqt2w-0000000ByzF-0LLk;
	Tue, 26 Aug 2025 12:45:06 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqszt-0000000ByTj-34hg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 12:41:59 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-24664469fd9so31777925ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 05:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1756212117; x=1756816917; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T84fHSOjtH7H+COR+2RAmmEuuAs5zWdfFcbzGcITMW0=;
        b=eMm9XPTfPH4Q687ncXBlzvAm4eRVL9gh2vaOvIgz6i1vDdeg5g28gzA5DjlmJ4Eibf
         3YQwCXooMISDh9d7gJOOz/pLARVWBb/9Y0MQigVPMEdLy2tKOUThb/d5gO86yMRmsxUU
         kqTb6vbmpHzoSPxzMrAcllpkI5ane+4nNggVQ/nu3DC7MdjJvBauwq97hYNOff+L0lLm
         g/Ex6elv9LKaloYuGO1COEvmTkrypHEUnFlWrxDIMyMwPOGLBNpdDagSICp0xoGTYp6d
         YccFSdkbge4+EKdyRkYWXBZqKgq4+WG1pAz40/BjqT+7HVvDQ3ljnD+iU81Llgnkg0Ty
         gT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756212117; x=1756816917;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T84fHSOjtH7H+COR+2RAmmEuuAs5zWdfFcbzGcITMW0=;
        b=OmXjDIO1LGWORMVcolI74LE4XIshfxzkyuLjhc6/5xczxosxi3Qbe0K9R0EKyZojsW
         A1AL+sz+Ia6qBNKz4diFeRRWXiW48LyiiVjZRkl7GzdITDqg7b+zTKzs13rwmdapW5ju
         +TC3e6cc/VSiCu0bv75saxGDyRgasBsx0qSqlIuTms9yf1xfwek6b21K9KAyyFAlWBQV
         ijHARy6lHOdWphEIzQSJkybFzeA1uN2XF3lNDy2YcbsRte3HiFHMgHIoTW+wLBA7nxI8
         Q2VFxtCofKVQouQzZ1J/9u3OkREL5nHFT0DSLl2VTqGs4UnMxlaEUitEeMJ0i1H17+h8
         ygyw==
X-Forwarded-Encrypted: i=1; AJvYcCV1zcdliScYFzXklYWt2vAAlGvM/1aO8yIwKuo8ViRKsei0U2+DtoQjK/MtfC67UbpnqkvkY0SnJAi8NsnL1pJr@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy8/8RzJfGos7fVRTb2er95axXN7NZSYbGA2mDkRfWflW5iqAM
	KI/9ZHBs0f43We8aHRmu5/TyIdvB1rcA/V9kQMaKQvJbAfXg+ITysQEs1TmkAsvjqpI=
X-Gm-Gg: ASbGncssxd6RrgIDQtWCIa08OFXfMiDQiBo3Y6NJi4svP1r8K8a3PPXGqMBT3kBkIvd
	2DDHMZKsnhPE8mL09yPuQTWCtuG4X8cgnD4zm6ql9bA4PoulNAg8LvbHmqNV3UI3iz1tpThwrOh
	BYZ1wDXmuSii6pF+OJMPZOwF92ImOr0QprI+u+VPvJ6IfWpEUf7FRjPP3bSEFvqdyqb55L+Ya34
	PClofENY8aQ45gcNrzzphl1XbzMVHbYtrfd9QFo2mlXBK/XoZq4IH4yHbyfLrIRLWxZ5SpCJPBP
	s0rNi5uYKFdBlSSofP0nt2qaGdy/Lac/717cEyaK2u3Kcho2Lu+ecK2FQtnafGR9HGmgTM5G
X-Google-Smtp-Source: AGHT+IEf2ObCWqklpLUBYBGCp1bYhdjq0lZf9FXkeM3wbZQ3D6NSnsFJXJkCjceBlS7IcS93bfZjTg==
X-Received: by 2002:a17:902:d54e:b0:246:a8d7:5bc1 with SMTP id d9443c01a7336-246a8d75c90mr130116235ad.39.1756212116823;
        Tue, 26 Aug 2025 05:41:56 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246687b4577sm95940715ad.61.2025.08.26.05.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 05:41:56 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uqszr-00000008tSp-1M5u;
	Tue, 26 Aug 2025 09:41:55 -0300
Date: Tue, 26 Aug 2025 09:41:55 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	p.zabel@pengutronix.de, mchehab@kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v7 4/6] media: verisilicon: AV1: Restore IOMMU context
 before decoding a frame
Message-ID: <20250826124155.GD1899851@ziepe.ca>
References: <20250825153450.150071-1-benjamin.gaignard@collabora.com>
 <20250825153450.150071-5-benjamin.gaignard@collabora.com>
 <20250825170531.GA1899851@ziepe.ca>
 <01c327e8353bb5b986ef6fb1e7311437659aea4a.camel@collabora.com>
 <20250825183122.GB1899851@ziepe.ca>
 <441df5ff-8ed4-45ed-8a52-b542c6e7d38c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <441df5ff-8ed4-45ed-8a52-b542c6e7d38c@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_054157_772493_769A7B2D 
X-CRM114-Status: GOOD (  25.23  )
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

On Tue, Aug 26, 2025 at 11:52:37AM +0200, Benjamin Gaignard wrote:
> 
> Le 25/08/2025 à 20:31, Jason Gunthorpe a écrit :
> > On Mon, Aug 25, 2025 at 01:50:16PM -0400, Nicolas Dufresne wrote:
> > 
> > > Jason, the point is that the iommu and the VPU are not separate devices, which
> > > comes with side effects. On RKVDec side, the iommu configuration get resets
> > > whenever a decoding error leads to a VPU "self reset". I can't remember who from
> > > the iommu subsystem suggested that, but the empty domain method was agreed to be
> > IDK, that seems really goofy too me an defiantly needs to be
> > extensively documented this is restoring the default with some lore
> > link of the original suggestion.
> > 
> > > the least invasive way to workaround that issue. I believe Detlev tried multiple
> > > time to add APIs for that before the discussion lead to this path.
> > You mean this:
> > 
> > https://lore.kernel.org/linux-iommu/20250318152049.14781-1-detlev.casanova@collabora.com/
> > 
> > Which came back with the same remark I would give:
> > 
> >   Please have some kind of proper reset notifier mechanism - in fact
> >   with runtime PM could you not already invoke a suspend/resume cycle
> >   via the device links?
> 
> when doing parallel decode suspend/resume are not invoked.

It was a proposal for an error recovery path.

> > Or another reasonable option:
> > 
> >    Or at worst just export a public interface for the other driver to
> >    invoke rk_iommu_resume() directly.
> > 
> > Sigh.
> 
> An other solution which is working is to call iommu_flush_iotlb_all()
> before decoding each frame.

That was already proposed and shot down, it makes no sense at all use
to use flushing to reset the registers because the HW weirdly lost
them, and flushing should never happen outside mapping contexts.

If the HW is really resetting the iommu registers after every frame
that is really just painfully broken, and makes me wonder if it really
should be an iommu subsystem driver at all if it is so tightly coupled
to the computing HW. :\

Like we wouldn't try to put a GPU MMU into the iommu subsystem though
they do fairly similar things.

Jason

