Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C7CD116E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 16:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cpzk7bcGRWcSKZ2pCJVSu0NktIw2AZpfODjcTJoI7zU=; b=BmeaYttrDHYRscpkqD5z/x96yZ
	N5shd8g71vm6xqpggatnu40OFeE5f3aw7E6Tv+SGlzY8QpKFA5W6DT/HqsIazVhk+wCScLYAyCgFt
	YK7w3uo9Hj3taqA+Uz7CxKasjMXylpdsVQHnV8IAcqkyfY4ymWZ5fyioPbeqK2J9F7sGvKlZWjtvf
	pl5uDGs23hnsmWjM6D77KTbI39EhGw0MF1a/awKza/QQMIV8bByGK6wHknGxKhHBIX4WuFF6/gjHR
	vaoKZ9At8ZMtEFXCTyC8qRQHgMt2hBIRdrr2AWGqMjkhQef/DaOTRD0OCLhBhA8ypJNY1fPd/txft
	wPoarC7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1bP-00000000dzY-1fsJ;
	Fri, 28 Nov 2025 16:45:47 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP1bM-00000000dyk-2BIp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 16:45:45 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-882399d60baso16138156d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 08:45:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1764348343; x=1764953143; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cpzk7bcGRWcSKZ2pCJVSu0NktIw2AZpfODjcTJoI7zU=;
        b=WiL/t9QViF0+Prqf33AvT3X2KNQc2+zOZT0PPG+1bc39I65ezCDJE5HbITSEME1tE7
         evrce+VDblAqL+LAruEj+VCfVkOXUr/4+waVk2LwQjBeqyr1mmsW3f3ZDGzGHNQd44mi
         Rj6bYAHUhSEQmHugxvKNZHXvsmPi7S/s0bO74ifl+b7BFmc7nbj10ayNdaDE8iWlX1L/
         TCmpT8ICDwbyy/VX0pygr4XO1LZSzuyfqWsQRLXznDmUqRK7cz8krcDDwCdbXX/cgVZ2
         OgJS1Nm4nq5GMJgALH25UQ8oLWI5u//cBGKkRLriyXvsn1Mo5t5O+NWdU81qrSayiK9I
         B1Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764348343; x=1764953143;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cpzk7bcGRWcSKZ2pCJVSu0NktIw2AZpfODjcTJoI7zU=;
        b=k+qmryl8KjQMFJL2gM7TfmUutQ0/zZ9tab/pBm4ARzorJ8LhqojCBrOoQYo+5rnfpz
         ovr+tHiLY5/Mng+tFrPnhm+c/T0+LGegnJHDpIJobEDwNkfs+90tcq4cfYVFcIFg3PJU
         LssJnQf/y1YmsNNQYUSKlMrifdACOLsKU9DaebTUAi50uL37jQPjA93wRgfAjegGga4V
         IRBP2vF+4FCH8rXmjDJuCJozZoCymdgaI1NxLfvef+WDdA32s3MlgODaRlKnpin/suz7
         FdKnDLR9lqpV0dsFtM3ItpI312bfrUDlFFYYjd/OpoJxIOXsKDwvlUU/Fcobb4jzH22S
         NQIw==
X-Gm-Message-State: AOJu0YxC3dHjFrdw+ppkvAIXzW1EoDj2WfA3Ts4Cs/kDekUrH6YUvxsP
	44gaX3qahn1QYF6fuJoXK0Ny1+X7Nhy8yyVc3nCp3m2sPsvMwCEr8kzInhjC5rMHB/s=
X-Gm-Gg: ASbGncvrJSQxJybeaXhlWoS00/IGzk6J4abMx/9zxvG56cRGc+cy8ww3Q3QQe4mmG6E
	3XmElfK78blylOh6oJDWW6YcgiDf/Zu2wiYFGSKxHg/Yh6+SLFlC0LpxRANr4+3ccI5AvVPK4kN
	6aJhecGVUWvmY7Posa3uvfOHrFax6db7S3oKfhDZERDXrHzbS9gbHLGnPndpQ0p6n8Ffz5zESrc
	EeNl03bVkA8nNww1nnzxBj9P5UsCR4z97fGgh4/pxwH/iTpsqpoxL/61dnZGd7YL8tLByIyK2kP
	g/xv0wn8Uq3KpjY7WXDziZDxYIeISNj+nHR9isADfT6i71c4cqgqTpB6NhPOoahafUUne4n6u8D
	BTzpjqpAfOYpvWPU49XMx3qb/WNEzS1wCEPB0A47amF0znvQ7AZkMTFQEEJsZu56O1x2qDn8j8h
	ppLt0FMuDtAQf8LTnJS5jdU/a1gXezo7U6og5pzAzAa8wXDsh0v02ErVgx
X-Google-Smtp-Source: AGHT+IEQdKc+IcKw3qnpBrSVmQlkpj+jbCLM52rDH21kCOY0Js9AqiEVYv/dkHvCwjTpPv/UNBoquA==
X-Received: by 2002:ad4:5be2:0:b0:880:53e3:3a2 with SMTP id 6a1803df08f44-8863ae61a58mr231831966d6.11.1764348342896;
        Fri, 28 Nov 2025 08:45:42 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88652b6851dsm31384526d6.42.2025.11.28.08.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 08:45:42 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vP1bJ-00000003Puv-2JnU;
	Fri, 28 Nov 2025 12:45:41 -0400
Date: Fri, 28 Nov 2025 12:45:41 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	praan@google.com, danielmentz@google.com, mark.rutland@arm.com,
	qperret@google.com, tabba@google.com
Subject: Re: [PATCH v5 04/27] iommu/io-pgtable-arm: Factor kernel specific
 code out
Message-ID: <20251128164541.GA812105@ziepe.ca>
References: <20251117184815.1027271-1-smostafa@google.com>
 <20251117184815.1027271-5-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251117184815.1027271-5-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_084544_715765_2E95A85E 
X-CRM114-Status: GOOD (  11.07  )
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

On Mon, Nov 17, 2025 at 06:47:51PM +0000, Mostafa Saleh wrote:
> Some of the used APIs are only part of the kernel and are not
> available in the hypervisor, factor those out:
> - alloc/free memory

Why not provide the iommu-pages API for the hypervisor environment?

Same for virt_to_phys, that could be moved into an iommu-pages wrapper
too..

I want to change other parts of the driver to use iommu-pages in the
long run as well, so putting the abstraction there is probably more
valuable than this.

Also the genericpt stuff is merged, should you (eventually?) be making
a pKVM hypervisor specific set of page table functions? Eg if all you
are doing is mirroring the host stage 2 I think you can build
something much more efficient...

Jason


