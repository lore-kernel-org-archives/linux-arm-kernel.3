Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74EEC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 19:26:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WcYJlt5p9Qz8AXWYIObijachKEBwhFuSBSepR8dnD2g=; b=xfkolg0u2g8MZjyXDgNGK6tYUl
	+kNqHDNKV4xvHGuiN0rLnW+Ems7ntszAM+V93SKbdZd4SKS0Q31a5XrkUZFSeCESFa9xgynUXVEFk
	oOTbWkUaIjxwj1lST3tdoqqcxEodYyl98fCEwQ5/5dKjDPNUCXHsEdkP6VTtNlAHUG3bdwwDPG6iA
	mU/WEOCo4IwDP+47DlY6UGt3ANQpzoQvX3OtOm1ZdVHv83+Upt8+SiWkNojamfwExcMDuVv2SUIsE
	/4ilKZRwyeaygcSON1PgJxyZknfIBhXxFiejBaqYftVsoamwq+6fgEglXI5dtqzAFuNkfR7iGKpZ0
	Xljao+hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMIX-0000000AHqC-2qf3;
	Mon, 13 Jul 2026 19:26:37 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjMIT-0000000AHpI-2E3y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 19:26:36 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-51c2808dbc3so21172161cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 12:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783970792; x=1784575592; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WcYJlt5p9Qz8AXWYIObijachKEBwhFuSBSepR8dnD2g=;
        b=XJc5laxRDmoTyRVkeHglzcudlgnLI+he+MKMztmQczxpjGfxM888Km5JxOp2aqUJ7x
         mwT4V2nlPNRmpKqL/kxsL24/UeCHzt07UBaXmuS44x08+wmAlbkcXpbqN8jfWFMsvdJs
         YFbbWUXodeZZ6kFPMsqZH2LCOU9R3KW6ebXaG/UPoD35YWmp232wrGwAw44AAV33PL73
         xF9DjZtwv0diX6cZ1sB4MBXhrKA41Oww/HT8MQN3VZkgNK5rS75SO+/RjjW6W2/SIGY6
         59S7Xj56XEDLxCaeNgHaD2+yJoBhYWzLt1P5SJ3g0lzNIxM+KORFjtuK5tC9CmKGQvn3
         SIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783970792; x=1784575592;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WcYJlt5p9Qz8AXWYIObijachKEBwhFuSBSepR8dnD2g=;
        b=I8x7Lf8YeCaAAPJTtwbWHPyo00nfjypKPXvTnCGPNEtZ/Hw1t8J6BCSRueglpTXAlb
         S2k3s+7mdRBPnSINJilHA6SVV2DqVymBAp+vngpADkvXlQr8fPFjTWoRvhVi4ncKrfzD
         3gopnF8NwFJihp+/1+a4swmpA5PUBnG3SznbIpzhVOAxOCOwAuiMXBB/sq5ISMG21/4a
         91+aEk2aPpRZAz6ljaY/oNy85mz5fznAjg3WIrNY9j0Fv1IyEwSILCENKW3NixVAw2AI
         xvvebNc4jVcimDPB1/eomviETlg4+KdJaDShjyDiEi5S/ap9l43oUnMfYqeXv3Ogoe66
         LWIg==
X-Forwarded-Encrypted: i=1; AHgh+RrZPVWQ9WhZKyL8PTIkaxXCPj/fLpHnX3vmNQxcNJ8wXhh4xfw2J542RIdv+ezYuMsGBMLz5/1H8SiJocTnOFMd@lists.infradead.org
X-Gm-Message-State: AOJu0YzYUPyNO0q11PR8WH7s03YmTPi4pfZkzGHzS//OSfJbK82wAewh
	rmjVRVhNMci4/WAtorF4bwOtGJqfQoRbsXplLrf7FXx41zNmbNJJvR6kiyeUMpMaNQs=
X-Gm-Gg: AfdE7ckVA5krM4FZilJfOOekT5Fg3s30sAKyefhE1zwH/nwmYHDdLFRHSmvsVu4Ez1+
	5Czw4TI3NQkWbPj6pRWcRacgysxLgZYHeReOx2uLR4a4j0/fcUNWnXreG3XxQs/ItJFY8TdZ+S0
	fqfWVpLeuu1IM6myxJucJtxWwa0gPAxr5+LSLoaRW7Li2FCa2ODVGKFtBSoEwY96O7Lq+Mukc9D
	Uo03+voUhWBYm1UADRxP6peslWgXABd+ghQJ3LT7UyDO0m82pv75XPhLlWKQBnYejDS4wRTSHmf
	lTVLrhFcq+dQI7o6g9IGLVOA1/ScIUu67PWiocswP/WN+vzIjjLy+IJX8mpx+CLlrOUP2pJK/Hk
	95qyC6IpK/eriMwUZK+StciXdrAeKOf0ov0aPiR7KDGeOspiqxh//GxtAOvoejwRSq8V0eLQ=
X-Received: by 2002:ac8:5906:0:b0:51c:83ee:e430 with SMTP id d75a77b69052e-51cbf27d077mr95594101cf.75.1783970792197;
        Mon, 13 Jul 2026 12:26:32 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51cbd8efab4sm70831241cf.1.2026.07.13.12.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 12:26:31 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjMIR-0000000E5Pw-0MTy;
	Mon, 13 Jul 2026 16:26:31 -0300
Date: Mon, 13 Jul 2026 16:26:31 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev,
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
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org,
	Jiri Pirko <jiri@nvidia.com>, Michael Kelley <mhklinux@outlook.com>
Subject: Re: [PATCH v7 14/22] dma-mapping: make dma_pgprot() honor
 __DMA_ATTR_ALLOC_CC_SHARED
Message-ID: <20260713192631.GT3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-15-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701054926.825925-15-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_122635_929118_BFEEAD1F 
X-CRM114-Status: GOOD (  10.07  )
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

On Wed, Jul 01, 2026 at 11:19:18AM +0530, Aneesh Kumar K.V (Arm) wrote:
> Fold encrypted/decrypted pgprot selection into dma_pgprot() so callers
> do not need to adjust the page protection separately.
> 
> Update dma_pgprot() to apply pgprot_decrypted() when DMA_ATTR_CC_SHARED or
> __DMA_ATTR_ALLOC_CC_SHARED is set and pgprot_encrypted() otherwise Convert
> the dma-direct mmap paths to pass DMA_ATTR_CC_SHARED instead of open-coding
> force_dma_unencrypted() handling around dma_pgprot().
> 
> Tested-by: Jiri Pirko <jiri@nvidia.com>
> Tested-by: Michael Kelley <mhklinux@outlook.com>
> Tested-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  kernel/dma/direct.c  |  8 +++-----
>  kernel/dma/mapping.c | 16 ++++++++++++----
>  2 files changed, 15 insertions(+), 9 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

