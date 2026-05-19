Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402FFCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 14:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mf/OGUGuIRiuTTXYie0rUXZGqyUUzS6jn0J2l0v1FPs=; b=x32sel/AHlO9s4X5bukz8jBz89
	U1CCTEGxHVf9sCp8iXbheBzFo2hWoE0AVbM0YhPXK9egrcMgD2BPy0uiiOUZ9uZE9BKj3W0hi4dM4
	zZx89EyuPqy9G1JviiLZVQzylx9P/Gqd/gb3d8ENIh/loNMAPnf+ntObc0n1GLS7KLVkt1ZrXlur1
	S1Vp4ipbYAAToZbhci7sNQfLwrmx+ugHmk41Cm9a9H7pTH67IsG55a5qv1VgYHES3IOnFeq24tLcx
	iCevqiyRXckmnCEfd6DvaBWu/likKeZr3L0b2u3DPhiHQgsL68OOzWlCMXqjo+BCgngdeytZL9btv
	G1R7BqIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLlT-00000001tn7-14o9;
	Tue, 19 May 2026 14:49:47 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLlQ-00000001tmO-2nIX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 14:49:46 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-910bb291688so455560885a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 07:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1779202183; x=1779806983; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mf/OGUGuIRiuTTXYie0rUXZGqyUUzS6jn0J2l0v1FPs=;
        b=jqGtcVVOvpl/2aNukK2A4oS9drgtYkpNsYTDWM7uT2jVzcfOtjE4W6GWi6K1EynxhS
         16pE2uce6ptaQ8fKzdT4/+vSCmGl6KdzXLZn6HCx63EqLekpVNS71aYPFVr6Vt4v3vu4
         yGY/wlGOfw2OZMacYXA9fyxj06kPjDxxsVArgDS1zrCf/alEbV2QP96R2v/marVseFrx
         jxwhIHf/6j7IEl/pMIMMKN3t5VUFp+R+aDM4hOiOTJ+4TTz8qlLmTgmDDEz/6T+IoEGL
         Iu7R1NvAZ6ADlTv/wGYCe5vKSdsm6BQubHEJOO5FeOq1JxOub8IIDozKniNx2tuzWUJJ
         0Stg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779202183; x=1779806983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mf/OGUGuIRiuTTXYie0rUXZGqyUUzS6jn0J2l0v1FPs=;
        b=QyV0mTXEYfR0+/MJ42h8D7UA5DATBXVCNhNlKep5U3zjQiiwPfI3qItj5jy5+nhEUj
         p6g595BbN6mKuZvQX2MgTpF7eTFkwASqgLlLsTejpg4bqK0JRVjtOM07Y9SORjKM/C6z
         d3NlAdsuFlEOo7PGDkWsa9G1W8MBVmS4lEycXblLK5OUK9aAVn0BdXHouJYZ7QXAoSt4
         8rupp5yjX9xE5HhsJ2oZq/vrRKFEnHRrjNSXMYh/kOqj7JFcq3AK4xbtAxI7K+ibo4y9
         G7CCbZ8Unk0PTOMTv/QEKc/s3zTJSnFsw9cZjfLlvuNOWNcCm5D4AhJehCjd15xde1gJ
         k3ww==
X-Forwarded-Encrypted: i=1; AFNElJ/+Alg4bhK3H45iuBspXRJqkh6I8cbaFMYW3DpqRU915aJOhSeKXl0U06aIxHq2glR0B+1lOkHYtlveugCB8CJ0@lists.infradead.org
X-Gm-Message-State: AOJu0YweAYOUf6+luJjVRnfuRAyv0M/TizKQIF+/v/RuAN3+V9BQMtUl
	n25kk4mRhV/8rSQf8pq/RFfaDySUpPHd+VsIF4HzRhPj4zoe/wRdKI9Yp5oAuXLbWnY=
X-Gm-Gg: Acq92OFBl6FzSMdQHBQPPFZOllj8lYDHw1j8fCU64b/tuRQ0P583fOet7FRZOyNONpA
	KfnxbUIGlNAlNRrhQcH2yQHtqxGyJf2a24zY/XX/jIibogbv88zOwR/82FuPK2Idy0qZ6+96rrw
	1G5dqYs0z95YJT+eWdEEnuIDk+JdqISj8fbyGX27wRRUXrAONwnyHDELcVSzvqzRhv7FOnJqM+r
	YcR98cCg+3xxHfiuA8D6Q5LPdVxW9tItQMIzMgUKADMB5cTOnntPx+VK/dfqqHpEHM80anXtrKN
	hxzhzUGB0VyjMK6IAINxIaFaT3ySnhGxTmItF+Vk7KAKi7Xt0gpJulp6eResqNjAs1DlThlGeGW
	eARrghRpBTYPEFmri12o6Fc0UtpdLAPrsE1ov9tPEe8DTpWH2x/MpAkFKPpfUc0JVI7WmKaMFi3
	wHwtTcp2owYfoIvC8eR5I2IFCbDpcGkNuUFboJJBnnXXscUWDzOMk1GBZccFJISE4sEzGs3UJr+
	nRoYg==
X-Received: by 2002:a05:620a:1a14:b0:911:411e:2e4b with SMTP id af79cd13be357-911cd46df94mr3109274985a.23.1779202183344;
        Tue, 19 May 2026 07:49:43 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910ba36e68csm1851459085a.10.2026.05.19.07.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 07:49:42 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wPLlO-0000000F92G-1VL1;
	Tue, 19 May 2026 11:49:42 -0300
Date: Tue, 19 May 2026 11:49:42 -0300
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
Message-ID: <20260519144942.GJ7702@ziepe.ca>
References: <yq5ah5oaa63h.fsf@kernel.org>
 <agW5rhE9n2gDQ0w5@google.com>
 <yq5apl2y5f96.fsf@kernel.org>
 <agXaby-7L7yS3Vva@google.com>
 <yq5ah5oa59wy.fsf@kernel.org>
 <agxDxdxynp4KEovA@google.com>
 <20260519132911.GA7702@ziepe.ca>
 <agxolksC_1nfO34X@google.com>
 <20260519143529.GD7702@ziepe.ca>
 <agx3j6Oc8QivZ3RG@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agx3j6Oc8QivZ3RG@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_074944_711408_F297EF84 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
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

On Tue, May 19, 2026 at 02:45:35PM +0000, Mostafa Saleh wrote:
> However, it should not alway use SWIOTLB? It can trigger decryption for
> any memory returned from __dma_direct_alloc_pages() which can come
> from alloc_pages_node().

The alloc coherent flow is seperate and different, these are not pages
'passed into the DMA API' but pages fully allocated internally and
owned by it.

Yes, it should cause decrypted *allocation*.

Jason

