Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7E1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 19:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hKPpU41kPhzJrO0I4v1JFTcP1rq+uvMCyjdGLEJkQ9c=; b=sEHgG95uFNMwnS2aPKSnvME2sU
	qXAEco0uV1ql/Q3+fwHBjqIdzQrd3EelvY3TwzBkeT2KIM/yonFcV+npQ15iduRYXZ7G6K2xXRdbO
	GdPcmr9QjjfNF+ngFlNz6saB3WxXC1IbKIoB+2gS0mNJX7EAsihEvklGYwAXaRTbLnavyBxAqaS7x
	/wVu8n+NQuWZB6AJhDiO5rBoFH3PBh43Ceh9paaYquuz4qxWkuBf5QhQXOBi7QHNA3IWx+iTakrTw
	kFV37VaF8YEFZ1G5VOhrLT2rRWJUUK93xnN6Y6kbnInYfNuFiw8aePn0mbJcrcNLqtaR8rAupEMql
	D6KjpmJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpMU-0000000DUOi-0crI;
	Mon, 06 Jul 2026 19:52:14 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgpMR-0000000DUOI-1ED9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 19:52:12 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-92e7632b193so216623485a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 12:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783367529; x=1783972329; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hKPpU41kPhzJrO0I4v1JFTcP1rq+uvMCyjdGLEJkQ9c=;
        b=NOzJtp1PxdVjB8jg7N14TrUPoYNcUyTn2fsMe+mh3FKAGBRLQMd4HxSJWK8JzxMPmf
         zuiJPzJ3zRBhxcQhGqy1S5nJpwELBioY8JVsBy42XdRz4L+hFPyRte6FhQ5oGZbYWcfl
         wbDXjhr2W9r3JfqNSPEb9VzK2AnZ0nnM4NCDvI2HJVE1N1/n4GjKr6+IsPBRSLHUnCqg
         VSjIkkVrsAuOx9EXTbdEjeKge8E8Y4q7QF/LpO81noxM1hSj3etBuwO5TdPESj8ib0Ik
         8WykGWvCbc3xvAyckhEeFDyL7ob8lfSIIbBJnGhiL1z5yWVbd1fNnoloC4c0ATm2OgKd
         P53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783367529; x=1783972329;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hKPpU41kPhzJrO0I4v1JFTcP1rq+uvMCyjdGLEJkQ9c=;
        b=sw2luqxiwZvsTqHWCahS+XphqByTHAFlmBslCyvaIlos+lN29zzQhCzgHaDnONkXt5
         MLIpBO2AVzuXHN3USLBTzmHX5ACrsQkStoXlBJxFDDIXYM/RFwNwtXLbCUSVeBuwdc1q
         V9AQtJwnymNjErcrTzugr8Fx/3Gg0Kq5g8m0LD/rjPF3loqaM1+iHiFACwtsI6Qi5Npz
         BMr89RPqmcq7rdhr2RO1RdHYTZM/EGfyHkx0DxX7mgMzVd3xJi7sk6rc9VO6cQbDZ1Jl
         l03aA1zFm78016icczwEtPqKWpz1E28oCwIls7jiAVW3ErnbEitz17gq0WTxrTPn0fst
         eTPA==
X-Forwarded-Encrypted: i=1; AHgh+RqFzWMQU5uz5nqXxqACNEas3376JtzziXWE9lPKqPc5fOPpAmbfypsM6DzIwcu7sRXS2UcVzAldzK4iwmUtdKxV@lists.infradead.org
X-Gm-Message-State: AOJu0Yxmg5+gmDLR/q8RDh4cKgda6W2ScNj4STRFSaAXFbQygd8eXRit
	QBAkVsIX86wmLVdwxkzFFGchvY8siLskVLUvKfdqjFRcYYQOy2yh3I7t+dTg4xyV8lI=
X-Gm-Gg: AfdE7cn4cDdhFcicA7vlW2zAOK6yP7vTcRr7i5GcTWmeDGAesmcGzRejNImgPd6G167
	yxMNxW/5MoiyNUGJRNDWWO2+kS7rlLTGGK5CrsssRmmYPPk2/m/EhIO9H2CIkHMYvUBBHS2s2DY
	1qfSvszRrW3Upwn8tK4bq8u+5oiYuA08a2jAe2zhdlGwAhk2FN0+ds9aeovGY6buZlO4cVl03XM
	HP77sn92YrWtV6SFuv3JC2aXk4BJomy6Mf6bPf1I+p/csWA7PzIvGavZ4sMC9nAkMr2PI5Uvcn4
	3b/OA5WGxf7O794PIVuDPTMUY19bskDiabVYtF3rb3WVXw3iUeIc+0ioVbyPtc/eB2vfUfpvL+N
	Qy9sQljkSbSCaqwe8L70iJKBJ/ovUZyc+udTuwbrIp0MfPoXt5PJ2ivlxe2tK
X-Received: by 2002:a05:620a:2911:b0:92e:70e9:6865 with SMTP id af79cd13be357-92ebb585521mr281465085a.59.1783367529434;
        Mon, 06 Jul 2026 12:52:09 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90b800efsm972606685a.4.2026.07.06.12.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:52:08 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wgpMO-00000000etJ-0DJM;
	Mon, 06 Jul 2026 16:52:08 -0300
Date: Mon, 6 Jul 2026 16:52:08 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Alexey Kardashevskiy <aik@amd.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Jiri Pirko <jiri@resnulli.us>, Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
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
Subject: Re: [PATCH v6 00/20] dma-mapping: Use DMA_ATTR_CC_SHARED through
 direct, pool and swiotlb paths
Message-ID: <20260706195208.GD118978@ziepe.ca>
References: <yq5aqzm4dz25.fsf@kernel.org>
 <20260618153705.GH231643@ziepe.ca>
 <yq5ao6h6enhm.fsf@kernel.org>
 <20260619122148.GL231643@ziepe.ca>
 <yq5aldcaejos.fsf@kernel.org>
 <20260619140616.GB1068655@ziepe.ca>
 <yq5ao6gtoncp.fsf@kernel.org>
 <20260630174216.GK7525@ziepe.ca>
 <fd135adc-a8a4-48e5-b649-2a29789b22d8@amd.com>
 <d7afa22d-5a41-491f-b945-289ab78080e7@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7afa22d-5a41-491f-b945-289ab78080e7@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_125211_356043_86330FB3 
X-CRM114-Status: GOOD (  12.37  )
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

On Mon, Jul 06, 2026 at 01:45:33PM -0500, Tom Lendacky wrote:

> In that situation, with SME enabled on the host, the SWIOTLB must be
> mapped by the kernel without the encryption bit set and DMA addresses
> must be provided to devices without the encryption bit set. This is
> because if SWIOTLB is mapped encrypted, requiring the encryption bit be
> part of the DMA address, any device that cannot perform DMA at the
> address width where the encryption bit exists will fail to DMA properly.

Ideally there would be two SWIOTLBs and "decrypted" aka low address,
one is only used if the device requires it.

Alternatively we don't support this questionable security choice and
using swiotlb with an incapable device just fails. Use the iommu, or
don't force swiotlb.

Jason

