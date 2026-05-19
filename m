Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E24A8CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 13:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y2jBYQyB5cOJsBc04yDDPLVV700aJQU8UB+xEqw7DWQ=; b=ZunNKXIwRzUzinSRtjZs3xZ91j
	Jc4fHlcQL0gweWkR3TkiN7Lcw5me+In6sonomsQT8fGZF07Co/yLOgCRHD8Q309xCP0hqMrpqLbeG
	cnwWEUh5vZDsqPiCygOxOCmPumO33+yXr+Dlmoc9WulbmJTGPSInl59D6Byq60YlFERrLaIThUT1+
	RnWiQGqlz/hD91slFcXDawA3L5y9nlqOtzGoLL4hnrshDxdhdRGFNob/cTLQCZdTaescUavigcJLl
	kyuBNszOD7CaDqKefJnW8AvBqIbEmY4GII0+VdkG6uke6AQf7iYlNV/KnPKTxoc+ZO4cP+FJT0m3o
	T3QCHMQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKfH-00000001gqc-0G9X;
	Tue, 19 May 2026 13:39:19 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKfE-00000001gpu-0iez
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 13:39:17 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-50faeb8317bso33617911cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 06:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1779197955; x=1779802755; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2jBYQyB5cOJsBc04yDDPLVV700aJQU8UB+xEqw7DWQ=;
        b=XvU+rxoy84dgjsUACnxTS9g1kjtO6c19IQ6O0vlfRt06aDWPhC2bvfY5UmnpXGnfqD
         7qGrYcK7Y1bnGJ8lcfrrBu99QLbPg8utUwW2rk9mNbclKm9hWf95UzsxRjTy7uufiLSE
         NYiGGwB9gVveT8kG9sL2w1cjhB0B5Pttip9M2LdEYt9k2BICNaoZmNcfa3dVO1yhJFm5
         qDKEVSNehijb/F8be3pXBbJedIqIjkOPEjbMzlvYtfgOl9jfnpaQQNYy+pqriWJupzmr
         H9N0wIZFqLm1yWmJKlyUR1jZYckMlx2p9kJIkFzhF7xku0Gykk9R1zk0r1YmSahsFouh
         OI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779197955; x=1779802755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2jBYQyB5cOJsBc04yDDPLVV700aJQU8UB+xEqw7DWQ=;
        b=TfuUMaq2GGMaHOhB/iqHPlsyO78LvaTC2GEEWPAVL3GKQKJEDVNcXHqqm7mNjPILkN
         +3QRj6N3JKXRvl/740cDlcHKzcxHW6ZFxdaHPq5EtzUYnFrBgLYekeTd6mYi0uvGx9BY
         8+RDrPZNlwoL1fy7lpmfqsZEzhSTG5eRsyhHpxxsoCJWX/33oexRmRTXIM1EYJftszJd
         2Kj0Cp1bTz19PPguu8wD7hjTpnJRX4efYMvKAdfb9LoYndIN3oKaXnJoqNwaM3ozjD6P
         CPQ35Hu7UjH3NpvV71b8FW9y5ZUxcqUWNxAfVdnAVMACFB7EJQugAdxYIsEGbtFDmN2z
         WrLQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ReOLuzTm5vqFsqso0p7D/kMjL+v91McF38ehQ3QP93wl91w8QW5mdfqMWwAfnMBMxBpXKyMqyrm3oKGb3KLuf@lists.infradead.org
X-Gm-Message-State: AOJu0YxjjQFn5Rj/yNpem1qEyyBirOAt8IGKD3D+GBhz02Aa0G/R2UsR
	QnkBQgMjeij1sUrrcCwjeV8vcqkUEOlS61cufdzTgtc2gQ4/yTri/4dKxH5QaoJ5j3A=
X-Gm-Gg: Acq92OGovEjDDSU0x7Uy2UeOOd5P5XWzyAjIecc+Xch3cx+CrVwTHI3xFoHK9kCqE1y
	yGlg5U7lUR1t1IMwQ74yyaD/SA0Z63gC+IzHihhRkFl5GSr49HQ3R4RnrBQF5IizVZjDKlE5Iwh
	kYZjKIkGyvDvyZfvpkOeU6iVOuhSfNkLtn/adr4F9a9q/ELORfdQHPbBB//XeWLL5tFpciwCW4+
	HlxuSxxDwQ8RQfFU0I9Qg7aD2uYwnSsUOJSh3QG7CY1VaTi/Vs73rwl7ol5PdhYMizf4Z/x91eK
	OPAiLrcLpow8patngURdYIDzXKMSk+ni95l+olbWfHX2LwPRKtu8gTuY/tdqNLTt7K68itF0gKs
	2PYeHmVToJtG5kmGjxRC8goNNHCNPlB7Pdd3uMdiVSFRo+WcditnD6oEXiRRFX6f/Y1r2maL0tK
	+sfmkwd7FapXfJsVkiDeeN8pcz1eXSkYPein+8lx/Y0G0/JxSD5gYPgMepYHXD6QE1+Tnl3HnpH
	wtIFQ==
X-Received: by 2002:a05:622a:50f:b0:50d:a6e3:ae1 with SMTP id d75a77b69052e-5165a03ee67mr270655651cf.17.1779197954757;
        Tue, 19 May 2026 06:39:14 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516514e0b91sm152289551cf.15.2026.05.19.06.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:39:14 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wPKfB-0000000Evg5-382Z;
	Tue, 19 May 2026 10:39:13 -0300
Date: Tue, 19 May 2026 10:39:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH v4 04/13] dma: swiotlb: track pool encryption state and
 honor DMA_ATTR_CC_SHARED
Message-ID: <20260519133913.GB7702@ziepe.ca>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <20260512090408.794195-5-aneesh.kumar@kernel.org>
 <agSKQrSIhizCXKwx@google.com>
 <20260513172450.GR7702@ziepe.ca>
 <agW2lzJI-20DyJVe@google.com>
 <20260514123529.GZ7702@ziepe.ca>
 <agXfm3mS_M3fvRrN@google.com>
 <20260515225113.GN7702@ziepe.ca>
 <agxETC1rXBUSkWYg@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agxETC1rXBUSkWYg@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_063916_227756_50FD97C0 
X-CRM114-Status: GOOD (  14.85  )
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

On Tue, May 19, 2026 at 11:06:52AM +0000, Mostafa Saleh wrote:

> > > One other interesting case for device-passthrough is non-coherent
> > > devices which then require private pools for bouncing.
> > 
> > Why does shared/private matter for bouncing? Why do you need to bounce
> > at all? Do cmo's not work in pkvm guests?
> 
> At the moment, in iommu_dma_map_phys(), if a non coherent device
> tries to map an unaligned address or size it will be bounced.

Sure, that's fine.

> In pKVM, dma-iommu is used for assigned devices which operate on
> private memory, so bouncing that through the SWIOTLB would leak
> information from the guest as the SWIOTLB is decrypted.

Yes, a device that can do private access should not be using a shared
SWIOTLB, that should be part of the selection logic inside the SWIOTLB
stuff..

Jason

