Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0762FCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 13:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LrtAP8Eaa/f2vd8w85VzyR8xqf5rOlnG9+YArbfK2NQ=; b=4oyH+EBvz5L5sBCJ/WFQAz+/0+
	pZFH5FH2fErjZTl8CXneMAsCmKfEf2zoYqRGIRkiN/cTSCVQBuqMaq3xsLUJrMWZcLtBCNLE5/yDT
	4Ms8DSW2iHE8ZTbRTYb/kVlY4Iqr+do1qhZrekwMfTF5FzAeNRC9tI7SR/ACe3e2iFC4T3AO5mSqq
	J6czTGn0JdMSH+UQHnwVZmX12AqLy+nZ49WbsueD5hxSxAjCHbz+yteTngc9yK8pT6YDXy/TcFe+c
	nhpnp1s5lsXhc3JWed8byfK+ODANfWgDWS86LshlxvVf4hmj1paf+vfG4nGhfl6zaI34Va8OfYYZz
	EUwtVG1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKVY-00000001fH5-2r7e;
	Tue, 19 May 2026 13:29:16 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKVW-00000001fFr-0RYg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 13:29:15 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-90d1f03238bso437317885a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 06:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1779197353; x=1779802153; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LrtAP8Eaa/f2vd8w85VzyR8xqf5rOlnG9+YArbfK2NQ=;
        b=oIdz280xgjtzKSjmYMrSOQGoutvXBctUbVCHYYFZlWtZEG52pr6X5xd9kFsMCvvhqM
         c+0VzdN8PHoileokJ+tfNIkMz1begIJpSV1oMsEGgIIYAW8p0YCJQ4OmsK6kzr4OLpgb
         nC5lgERWk2qbg2nPqHKxYpw876lDfpujnkwMQG1aHHYKiX8nzU9hvssQI1JD8gN9P892
         owWKHLvowXVjqsJbKsenNYGuG707b33blXzK1oSCauWxbBIJlEYn5ijUam8jDRAH7Xyj
         1KijmGcRXyKg6YDPLo1TLcgIeP9dsN23Eep6QF6iLKra+9PE3TlzLw9iDNnxB/cXjSSV
         QyIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779197353; x=1779802153;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LrtAP8Eaa/f2vd8w85VzyR8xqf5rOlnG9+YArbfK2NQ=;
        b=JHVlET7XSk/w7w9jk1clHy6YSeccekxGPJqZniojEKrtqqdHTNmQyWJ3lz4v/bhbpF
         Vn4Ax6aMjCfcbOiMZQKBWrHXp1H/LuP+DU3vMP63DmIC7x2Y2qy5LnbiqjPOBT4AZLdQ
         U4JsLm/DqkQnKg4XslrdabDp5fmuZwk29j2AFBHdASIBBsk16eUx6Icl/FKekQrMJMGu
         hX0ICYc0q6U9rof3Li4mWkzYZCCj8TvaJcbqJeZvx2pyAOQRYQ7AMS4KB2i9gjsxsFcc
         c2fI8tSdpylbZXBPyJH1DSxOvtjnMx+EW2AYI6IPqwrhl71CM3wW+A/BnWYegcOJ9SEB
         eXaQ==
X-Forwarded-Encrypted: i=1; AFNElJ9yaZEimVBGaKsE1oR48WtCl4i9+437+x32bm20FYc2kRv4jVDgX2265NFkhDAz37WhgSlBKpJNclfl3+ODrhLp@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3VTIvtWeaQwIKZYvfHj+MZ6RWUfpqdTRi5BSkuxxGbGi5uvB1
	oif3Q4olQRgMPaoZGhldPWvVXEP19jsvqM2R8gpQUj1BtGDvl67uN3F9r0Krooupxe4=
X-Gm-Gg: Acq92OG2sWAODDp+TBk5sTuTNIdL9lZrRXi+3u0WzUXd2bc6/xIWpNfzDIXWuw1a7eh
	5mHzSLJOKwxb7w8F3HGYe4ahxuKAm4UJsRIUhVrpul5U76C8d0qdxSFgi4HRwwYQuCjThEfmM/l
	uMidOjneTHlPYf4IWTypTpOUjv91tjWKShW5vpR0l5dRApKKwpELucP6zSiBD7+KD2vg9WuxN0W
	YpCV2FPPc31PCw86Z0eoUnx3tqCYFZ5Vazc2C+AFUnMKpnyfNHV1xffU42NB3x9GE62/RozN7xL
	OeU33geDb7MBHT1uPB/RxQnZajrfX5WdeLxXGUoeg6PGkC0PU0zmfucQ9BiFqdmNiKj5xFyVNm4
	i6HfYywdm14rkCYW6qFOEysJpbCp56UngvtS6yhqy9kfNjK1HVjlTbzbVWhr+6/50riuxWNbPcX
	Ub92A3F5/PoQ7O2sLWV1T8cNAFv0AydvY7NtsLO7ii0sNgMHiboxnLW+BliFqFuu4+9ioD7PwNU
	VQ/hz1HfkbwyKn7
X-Received: by 2002:ad4:5ca9:0:b0:8c2:7cc5:b5d5 with SMTP id 6a1803df08f44-8c8fda1ccb0mr344078466d6.17.1779197352561;
        Tue, 19 May 2026 06:29:12 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ca360979c2sm90678436d6.18.2026.05.19.06.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:29:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wPKVT-0000000EubB-2Vp2;
	Tue, 19 May 2026 10:29:11 -0300
Date: Tue, 19 May 2026 10:29:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
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
Message-ID: <20260519132911.GA7702@ziepe.ca>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
 <20260512090408.794195-5-aneesh.kumar@kernel.org>
 <agSKQrSIhizCXKwx@google.com>
 <yq5ah5oaa63h.fsf@kernel.org>
 <agW5rhE9n2gDQ0w5@google.com>
 <yq5apl2y5f96.fsf@kernel.org>
 <agXaby-7L7yS3Vva@google.com>
 <yq5ah5oa59wy.fsf@kernel.org>
 <agxDxdxynp4KEovA@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agxDxdxynp4KEovA@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_062914_152637_1549507E 
X-CRM114-Status: GOOD (  19.55  )
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

On Tue, May 19, 2026 at 11:04:37AM +0000, Mostafa Saleh wrote:
> On Thu, May 14, 2026 at 08:13:25PM +0530, Aneesh Kumar K.V wrote:
> > >> 
> > >> What I meant was that we need a generic way to identify a pKVM guest, so
> > >> that we can use it in the conditional above.
> > >
> > > I have this patch, with that I can boot with your series unmodified,
> > > but I will need to do more testing.
> > >
> > 
> > Thanks, I can add this to the series once you complete the required testing.
> > 
> 
> I am still running more tests, but looking more into it. Setting
> force_dma_unencrypted() to true for pKVM guests is wrong, as the
> guest shouldn’t try to decrypt arbitrary memory as it can include
> sensitive information (for example in case of virtio sub-page
> allocation) and should strictly rely on the restricted-dma-pool
> for that.

??

Where does force_dma_unencrypted() cause arbitary memory passed into
the DMA API to be decrypted? That should never happen???

Jason

