Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91166C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 19:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GkDmVE1oQubncGA13yoyJE0TwJhGavatFFU357EXcEc=; b=Exl+c2IKXS8eXodOgTIaxLGmMj
	JmArYLJB8vE5ZdWzp5A2XGHUYbTNwEm43oc6hvx9EDFjy0XCZRy+8vYwuXlvvpJl4Va6S68TqcqJF
	YoedyJlYtElRDI4cGfoLGRB9hVWQGx8vX5G8woXQjyL0Bgx5miWJUz58ocoxzsmVgjA8/DWCkPgVu
	7z7k57/e3gPcQIEyO4ALPOn4qRMQwuX9xnzODNIDwR2H55NnRjha7SDv2c/sJH1AukUbhqZsKAfP5
	LQ3GSRXgtTka/nNMKXV0ccDX3Qrexf3KWZTBrf76y52IUlIjRev5C5Pc6Eysr5DbIPTCnjx0CugJ+
	w11szhOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ffg-0000000BjBc-3ZUu;
	Wed, 23 Apr 2025 19:22:12 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7dwP-0000000BHC5-3UKn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 17:31:22 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-225df540edcso14055445ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 10:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745429481; x=1746034281; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GkDmVE1oQubncGA13yoyJE0TwJhGavatFFU357EXcEc=;
        b=NV8ymkH30uOj0yV/u17ESafdpsOdK3AligkgJHbko+XCch6Vtb5YVSPrxOsXwWNTq+
         4aqAzbrrCNhkihYc2oCxYL9kcQvDsvx06C708FmGLizf7d3QHwB8AUZ4kSjzUnDm+kL4
         Cwh/jdnQw0jY8JFhxH+nakv/PTaDKsy/BqDVR/8qN099vUORXaj7RSrFJ42yG6WPmbqG
         jS59MV4PszDpDcdCEOTeZDreN1KgnPdHf+UAZ51ubE52xli7luPkcKE32DU7N2Z17tN1
         utXHvNoSsMEX5T+azpMw21mX1Y61HYS8tUWzFqzVcM4EUtyXgZfDTqr0UOhm/+Yd3Xd9
         1KWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745429481; x=1746034281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GkDmVE1oQubncGA13yoyJE0TwJhGavatFFU357EXcEc=;
        b=YooURtoyjmU1jXBXTejau+zCV0e+0wErBMJfHMAPDkt1fnXZ3oxfHKQFKHVP3VT+sR
         OL4/BNFpOx2+lFrhvOttNTjEQPrpnHmMldgdVH1VvTDBGie/JJ7LMiIrgxkAh7TicbTl
         LjL5jdsUNWowzqfrJwXQzIRDkmFxPl2WyidCKzi2SAxSefm3rHfZTL8xUsJHrkq/yOHe
         moGjgQ0ug9XIFJ8crXSEcbcICQz+5uVpimT4JIcScO21Hw8i6uyZHlY8pYx2j2PoAhwf
         2KjLVpaA4U3ImXqbRjA9BsFlUIGzWmlDn76ZPzEXDcLc+IWyE7FC4SLKFJ6XPXVD4dRj
         n9kw==
X-Forwarded-Encrypted: i=1; AJvYcCUTOHQOlYnqBK/AiiSiulsgadSpNvMzrxFXEj1104p1e9wPHWaO6DhVbSBmy+YY1PAQr/4YOwP4sqgjCetSraGn@lists.infradead.org
X-Gm-Message-State: AOJu0YxXcb1eJzMe4eiBfp2iYeaVWzT/U8j50krhhdDlcD/Y7O104Ep4
	S/HSwq1fRKGRrsYKcCxqr8rUGQaAtivtaQI+xVbIuWlCcdRq3l9mNCyO/CewGw==
X-Gm-Gg: ASbGncuslXMP5Wc+/qj+CenHma0UJSrqowXz0NvUuAxLyPaADsGJemt8N3QQPgTS34y
	sfPM6eOORJOOWigbYWcD6Z3oR2okbzXeEA4EPldf40O8lOgLY65JDkghACN2Ilr1qEtCTWykrsD
	vfOsFLcAr6IWa9fcUVdQoxuJ9L4H3aBBl+vUoMtDARs/50Tniyuzw/RN9VlY6BRZA7wA65OrZou
	kTt7CnHLQ5hZjZmwT7P2WPv8tRPlJcorrS6RWH4VlAEjnJnBiiERofHFqICr3HR4HduGZDulnWX
	zqtsG8EFY7OKSz19wgyJ5Rsf3FVvt8uNo17KGym+oknnuTk3a6t3tzcCziNyRWTqtUXR20zryeg
	ioGJnKA==
X-Google-Smtp-Source: AGHT+IHJNQTbOTf5T97irPUNv+QmXLRPjJqv5JLklJLGHSWfRRkbgYAKpGomh75s0qhLStfcG3G05g==
X-Received: by 2002:a17:903:3bce:b0:223:3394:3a2e with SMTP id d9443c01a7336-22db2189d23mr394125ad.18.1745429480637;
        Wed, 23 Apr 2025 10:31:20 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50eb4292sm107648765ad.150.2025.04.23.10.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:31:20 -0700 (PDT)
Date: Wed, 23 Apr 2025 10:31:16 -0700
From: William McVicker <willmcvicker@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Charan Teja Kalla <quic_charante@quicinc.com>
Subject: Re: [PATCH v2 4/4] iommu: Get DT/ACPI parsing into the proper probe
 path
Message-ID: <aAkj5P1I-e9lylIU@google.com>
References: <cover.1740753261.git.robin.murphy@arm.com>
 <e3b191e6fd6ca9a1e84c5e5e40044faf97abb874.1740753261.git.robin.murphy@arm.com>
 <aAa2Zx86yUfayPSG@google.com>
 <20250422190036.GA1213339@ziepe.ca>
 <aAgQUMbsf0ADRRNc@google.com>
 <20250422234153.GD1213339@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422234153.GD1213339@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_103121_870845_7C31D192 
X-CRM114-Status: GOOD (  23.07  )
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

On 04/22/2025, Jason Gunthorpe wrote:
> On Tue, Apr 22, 2025 at 02:55:28PM -0700, William McVicker wrote:
> 
> > On this note, I was looking through `of_dma_configure_id()` and am also
> > wondering if we may hit other race conditions if the device is still being
> > probed and the dma properties (like the coherent dma mask) haven't been fully
> > populated? Just checking if the driver is bound, doesn't seem like enough to
> > start configuring the DMA when async probing can happen.
> 
> I think the reasoning at work here is that the plugin path for a
> struct device should synchronously setup the iommu.
> 
> There is enough locking there that the iommu code won't allow the
> device plugin to continue until the iommu is fully setup under the
> global lock.
> 
> The trick of using dev->driver is only a way to tell if this function
> is being called from the driver plugin path just before starting the
> driver, or from the iommu code just before configuring the iommu.
> 
> Given that explanation can you see issues with of_dma_configure_id() ?
> 
> Jason

I think the only concern is when a driver calls dma_set_mask_and_coherent() in
it's probe function. If we can handle that case in an asynchrounous manner,
then I think we are good.

Thanks,
Will

