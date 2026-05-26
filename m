Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0793DCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 15:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ItPd3iMhIb7X3YkSIy7+Cw4n/7vOFcAzSgB6r5JqsAg=; b=NYrHMca9WbydEwFG5ITAZ0UuE6
	2vLbECui1cWMTem/tbyoKMmWhQTXz7ezqvTwzqrrCbmYUEO0Uv11wdAFjFBzf+6udrz5FsJ02eHD+
	3JRhmPlxHAi2qIAa9EnabPZx4BSZya/NS2KqBvkcQoMGnos+3Yjjy1/yhgdLd6XbDhxM4qd/74g+h
	FpcRH6NrJRVhxfQa/yn929iXmgHoRlM+GCFMW4uiRPiRoLK/Sbp0uwYhN6IdFC0tPZUIGTiXZ0OyD
	44Ih8/19FEsqfs9RsdJiujaNYvugPqkOhwVHSbnxY3+ipHlK5mXPExQVZXM7+g/CADrxluR/iU4We
	W9VWLWDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtsn-00000002P2k-20eQ;
	Tue, 26 May 2026 15:39:53 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtsl-00000002P1H-1col
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 15:39:52 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-50fb8e9a4edso129199011cf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 08:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1779809990; x=1780414790; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ItPd3iMhIb7X3YkSIy7+Cw4n/7vOFcAzSgB6r5JqsAg=;
        b=fCGd0I/u3mV+dBke1MFfPRFL9vsV0YlB7MMf8w8HdeOUmn/PqrsRZJ5SE0zhkghk/C
         HtpD9jnYhcOgwkDMIQtXvKJK5cD+B1lKqjUzvJ6CpWO0RqcPY0eUJJMlC4SufIV7tBGV
         OrrSVlZ9UgmelXpvEfbDRM3Q5VvNbU9BlesOqYjzQ0mVqKDpcHT6yZcKa6E2ZZZm2CAh
         /L+F45Hu6aS/RdozivhrZNGvSKjc0XnTSlo0l7muz9z61m9xSqg+A6JKWzuPoMi6LCbB
         FUtsnYCTKnimrRyFVSo5pXMcAhUmeb/LydFPl22CLb3LwxgEPV1CyA+ny9tLK0Pxq4QJ
         PI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779809990; x=1780414790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ItPd3iMhIb7X3YkSIy7+Cw4n/7vOFcAzSgB6r5JqsAg=;
        b=debj0QsHormrlud+/55mG/p7KY17A24c23mg5qLE/CvFguJ/R6zo0oISOQjfUPHFGt
         wdQvPJDMHUUBNVOJ18+segzgAA8nBU4ZedDUnuHHUDSoDmu6AgYGmemVoQ7dojHxMvQB
         iwZ0XEjosPBslOooTXJaNrMIgtQMNw3Zva48rBPWa/oXOWws5B2rU9yqZowESfaI6gsk
         fth4yI+FUZCVUYP3Fwp+QB5ptxv2TWnvrxCbRH4pzlWudfCLvzL0eic5Ab0aKeaqC/af
         xrmQFNe2PTe88HRjl30uocA/biPMCBb7rDHB/cHM5UFwthI2zZe1cMPdBfMYyAlq236c
         lTJQ==
X-Forwarded-Encrypted: i=1; AFNElJ+8QfDgQdNZDDDO7qRCjwr5v4fIWGEvZTJsAN7Oub2c5+FB8k6l4EMfSKCiUS5kuLrDlFrJ69IPCd+2QO36Pi8l@lists.infradead.org
X-Gm-Message-State: AOJu0YzGptRHi7FXOBQEme7f5fOXXAmzJNv8CsB3HsMQTKnIGn1h+Z7S
	aaxAyWzLZHH68dpaPW42NenX+LHY6YGafuZ7ziRMhStHNYEKk5h7v5z3PNNq/aIVDas=
X-Gm-Gg: Acq92OG5ylX90leY+KMFsGCnI3FJ/YlKMomc5IwW5eugFu4mLyO4p9STyV2zDj/0Do8
	ZKUQpgMASa6KUwK08rKXbJ9b3f2PtrNLxStLwo4+04ItfMhpkGmOVN465UHqIDoqui5HebQyUTt
	+KJsQkn67VlacNDnLRkqCDQd+v/j1veM/ub+JK9pUQVvf9OZd0NFzoWoxJ1MQJe5FopFVLcOVH2
	uR+hiGfMLQVKafd2oi4ueJr/h2m/kzauUvKajbXjGqLbdbN2zIZAVVusItspJTe1VpQQnw7p4XJ
	mfSyYvgxkIWTPJ6C0E9tOAu/Pm1JnonnrYlHp4fP/FX6g4icNJZzNJpo85PdW7AcY5hYpfsMhBF
	y45PJxRTUB2D6eYM0upLrLcLLyeEIAr/mr0xC8rKN34P/Oh+WPs1+A6Na9JA38EGa+gim9tnHVn
	J+AtdW6FGnl7L9a4oQF1yolrPmsCXPqJIJ/5nN5JdF1y9T0jgmsyMW+8JDA2H8yYrMy14HqoIde
	L/IXw==
X-Received: by 2002:a05:622a:1452:b0:50e:5cc3:6f3a with SMTP id d75a77b69052e-516d45eaf62mr265877421cf.26.1779809990039;
        Tue, 26 May 2026 08:39:50 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5170c403529sm7414661cf.10.2026.05.26.08.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 08:39:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wRtsi-0000000DiUf-2t1G;
	Tue, 26 May 2026 12:39:48 -0300
Date: Tue, 26 May 2026 12:39:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Michael Kelley <mhklinux@outlook.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"x86@kernel.org" <x86@kernel.org>, Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH v5 10/20] dma-direct: make dma_direct_map_phys() honor
 DMA_ATTR_CC_SHARED
Message-ID: <20260526153948.GH2487554@ziepe.ca>
References: <20260522042815.370873-1-aneesh.kumar@kernel.org>
 <20260522042815.370873-11-aneesh.kumar@kernel.org>
 <SN6PR02MB41574064D14D4A2734222C51D40B2@SN6PR02MB4157.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR02MB41574064D14D4A2734222C51D40B2@SN6PR02MB4157.namprd02.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_083951_432890_143D04C6 
X-CRM114-Status: GOOD (  11.40  )
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

On Tue, May 26, 2026 at 02:56:57AM +0000, Michael Kelley wrote:

> With this patch removing SWIOTLB_FORCE from four places in
> kernel code, there are no remaining places where it is set.
> The test of SWIOTLB_FORCE could be removed from
> swiotlb_init_remap(), and its definition could be deleted
> from include/linux/swiotlb.h.

That's great! I think it shows this is the right approach!

Jason

