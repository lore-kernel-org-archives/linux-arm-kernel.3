Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32A9C9830B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 15:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SIwOLjI09a3UXj303jplkjBLREygxuyiG19PHUNbQ2o=; b=qXAXzsE7wW6oaPfh87MyFxotsA
	WFhctnmKLbwa/Q6xSbttbmAbCmY9g7fMeN4sHy0dOy5xCLFee2joijRFDp1xqiNiznbflicuqfRYL
	EV8T94XfuWLqbm4M9GVv4rsjZZi6zaLmdDgZ9EWRoQSznt0JN6Q48vRZNQTfvocn90RP8UIns7Tcv
	ot/uX91WKr+hFOZss6y5oaSS4Rynn16a79RGl4bJOUqfg4z2j/qU9e1pbyO/BHjUrJ3PtQweBaBxj
	pPHuXKXuM9ytszd72WsCeMTwYkXR8/4kKVpk0d+8cbbXiePE7F3df2e0KvTLbqMn3Uxtb593N/O9h
	FFT8EzDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Oms-00000008hZa-2GWK;
	Wed, 23 Sep 2026 15:21:34 +0000
Received: from mail-vs2-x0e.google.com ([2a00:1450:4864:3a::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Oml-00000008hWh-08cT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 15:21:28 +0000
Received: by mail-vs2-x0e.google.com with SMTP id 71dfb90a1353d-5c963d7503fso436419e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 08:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1790176885; x=1790781685; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SIwOLjI09a3UXj303jplkjBLREygxuyiG19PHUNbQ2o=;
        b=nYin2R0vfaK7HpxVEW37QmKU78D5KgQG8/jXJS0G2ZIthCcqDRjSid+fn9MmO7n0sV
         LtKZ1p7rPBqR41EooY2iRYXUPEN/Nr2wsEzpg1qZhYkgCyH9ZHzyVAqmO6TZ/nSH9bir
         tieRolisEbRMCESaVjq3rXpw8PVx4ECyVpFLCxcVu8Vj/5TeYwaD2lo62elKCLDcG7QI
         lJJbbuN7HBovD9zs3CQkfvpPnZVfIZXQ7PEbUGZK+3gzNIYiUl0Bihqin/+i5WWN6p+/
         H3mxtubopHqZx2zCOUtNFpFVLVFi96yvUkSkqP5Cwr+TNhuJBvigv0/vPk7RwQ6BFoMp
         3Wzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790176885; x=1790781685;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIwOLjI09a3UXj303jplkjBLREygxuyiG19PHUNbQ2o=;
        b=AMMHkRP9GD+tLYOQcaKuLDynjaTUp6/yP/BTR1tzIGRIXAO5wA3lyibBIMOSJskbNi
         N5MJbE5sm4ZqMkcipvgbbWeV3e/cPgd1utLYREL3MR6HL6jU72f8WjhL44hCZ13FFJ83
         C9bLXyiU/AdP0MwL/vGA4rZeD9p6cj2rHFbElSS/NilyZgzbxssOU4cV9VeRwG6Kumtt
         kLUCkDOBizr9XYIXBI5a9xDk4cZoOTiLDgSecDzTzrnYqpTBG7hu4W5Wcb3vsAXqfEpz
         9MM6aJLvlGhbM7WV+cpZS0M2PABL4w6yW4OQN+F3ntDGbC8a0jkrYs/7FQgsswitW2bI
         ex8w==
X-Forwarded-Encrypted: i=1; AKwUvBypifAVWRsDNZFiatxc1YKoT5deQEh+vkp0rPU6zy8yml3im0/b0Mk+mPgI6k0LtrShdHAOwk/H05MFzoAqAxHf@lists.infradead.org
X-Gm-Message-State: AFuF++lpMVGSnUky1/48MGbT+MYJgFsOTiPNXPR5fvv70SmZuaVYUw9e
	bh3d91JYNOfc53q1y/ZlmOpunizBhn3jslh9T14UFifLLOhd11uy0HWww7XxGs7YUss=
X-Gm-Gg: AYBFou2o3DUGUhwZtFDq8KfF98biQAhCLT6s1VHa3jk0J/LZS8vnlLQDo2frmDFLvUm
	PTGWq/jQ6b5jb9VanlxBLTNzzowivBzCaLK1OLukDGamqri8cWd3AGANEx20I/HXDRa6n2lNcXm
	FTWp85MuiFy7+AqNeIIVT2bnFs/et3NheaNuZhVYmC2f6oS1VGb1qeRocIhKrAwIRzEEc332xhK
	KY1GI1dvy0mAvk6AnNgIHZ2Uh7wGB3XV3LRr0OXSrxwPUFSh3jrWoN6dQSnmrKi16Z6TTfKqEmg
	mhcb8y4MNYMfB9U8ZDN7Hku0eqY8TRXHzEjh46SXYLLp/9h/WSRDvyd5x3WV5MuOMpl3aOu+dJ5
	rrtmXcFA4fAyK9BTw4tnSkkHKopoO45TqAKpoE5P+f60rALj1K+RawztVh6iSBYHSXUAudu3YzB
	F9bNe0zn1XCGgg0rckTq9hyR2Sc8xNIlWzf9eVaYzyyFMZ
X-Received: by 2002:a05:6122:4896:b0:5c9:a60d:22cc with SMTP id 71dfb90a1353d-5c9f16b9729mr3999503e0c.21.1790176885467;
        Wed, 23 Sep 2026 08:21:25 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c277636e4sm181224485a.41.2026.09.23.08.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 08:21:25 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x9Omi-0000000DrJM-1RIj;
	Wed, 23 Sep 2026 12:21:24 -0300
Date: Wed, 23 Sep 2026 12:21:24 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-coco@lists.linux.dev,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>, christian.koenig@amd.com,
	Joerg Roedel <joro@8bytes.org>, Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Will Deacon <will@kernel.org>,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	linux-media@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [RFC PATCH v7 02/13] mm: Add an allocator for CoCo shared memory
Message-ID: <20260923152124.GG1540250@ziepe.ca>
References: <20260921144847.501151-1-aneesh.kumar@kernel.org>
 <20260921144847.501151-3-aneesh.kumar@kernel.org>
 <arKsFofudnTYpXj1@arm.com>
 <yq5aik3w344o.fsf@kernel.org>
 <arOfD6syXOgQhZYA@arm.com>
 <yq5a5wzw2ree.fsf@kernel.org>
 <arOspFxWZ1DjgcAr@arm.com>
 <20260923130611.GF1540250@ziepe.ca>
 <yq5atsng10b2.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5atsng10b2.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_082127_083627_4617953C 
X-CRM114-Status: GOOD (  12.54  )
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

On Wed, Sep 23, 2026 at 08:28:57PM +0530, Aneesh Kumar K.V wrote:

> I'm also considering requiring the address passed to cc_make_shared() to
> be in the linear map. This is currently required by both TDX and CCA,
> while AMD SNP appears to support vmalloc addresses. The only user of
> that vmalloc support is Hyper-V VMBus GPADL setup
> (vmbus_establish_gpadl()). How should the generic CoCo shared-memory
> allocator handle this?

vmbus_establish_gpadl() is the the same wrong abstraction as the arch
code. Get rid of it and use vmbus_establish_gpadl_caller_decrypted():

		pdata->recv_buf = vzalloc(RECV_BUFFER_SIZE);
		if (!pdata->recv_buf) {
			ret = -ENOMEM;
			goto fail_free_ring;
		}

		ret = vmbus_establish_gpadl(channel, pdata->recv_buf,
					    RECV_BUFFER_SIZE, &pdata->recv_gpadl);


So you made an allocator that returns folios, now you just need to
use that allocator to implement a kvzalloc wrapper. ARM can call vmap
on decrypted memory with pgprot_decrypted(), right?

Or maybe this can use vmbus_alloc_buffer(), it already does it.

Jason

