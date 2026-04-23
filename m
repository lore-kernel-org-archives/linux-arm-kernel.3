Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68114FDEE4D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 22:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Os93XZ5HK9zO/mWUsxanxIiJC+1bt4BZQrH2i+zDIdk=; b=DsyS9fQrv3LylM5oxZO2XyYyVK
	wIcqZZE5btwhXhu6nm2pOxaLuBkrt7pIjJXgvEtyIrMSe2itTuBptiO3sIJaHLrpqPgu3D1Ysip2U
	Ld303dfDIUDJC6ioIMUHlDALwihpKaVhtumutGb41YyApfJZZ4mGO7V+dFzlWo/ypw08h3t/zZwBe
	/cFO1tVNMwQDG2CbiG93dZOuRNcd/A+Y0XkNN7fW0+GZGARvXv7K30G45/+DhT/rqNy0arMGohcyK
	Z1qPELkEoKpMRDcdk0BQaD2cF3/72IQPV7NlRuxrlL1cpg8gee+C9Ht3Q+1pjjyjJSiWFf8/pzHV9
	Y5FGw8DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG2fh-0000000CNhF-3Vit;
	Thu, 23 Apr 2026 22:37:21 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG2ff-0000000CNgh-1PsL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 22:37:20 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-50fc496c8baso23784681cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 15:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1776983837; x=1777588637; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Os93XZ5HK9zO/mWUsxanxIiJC+1bt4BZQrH2i+zDIdk=;
        b=oNxRD+bNrY3baAZ1mIy98trhxo2jik7gE6JjUl/F2Kk40EuAR1wt6pCZQxTLcn2Ar1
         2wIVcYvTN/DJ9mFibjyWm9WMDXLCcbkxr8zCYg6Ph5TqDSqUFJNF1sZyOQrrUy+lRwQt
         6Q4M8uuVbPJfYJ4HUjsWNmazIBJ7Qe/unL3G3OnoPeHxGTscNW9BWqPdxHctePzPDrzR
         D/+Q+9cGJ4aVeiYNT4MAoBEgwdtAQr0HLoBR5gf41WWp82Mzq63gznm1Sa2p4y8PaWiG
         qrXrRXGVmOWL05rdEtdTT2klDm3ZdXvnqI54kMcHK9C7w59aJIrSNtvpZqbMci7fnMei
         y5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776983837; x=1777588637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Os93XZ5HK9zO/mWUsxanxIiJC+1bt4BZQrH2i+zDIdk=;
        b=mdIiYJeg25AiIxOjSHrWaoiuZEWO5u4uEUFBH52KmufRgifEsLhDI59Ep8VnCjolSc
         9gTOSPKQegni9R+ITe0T6oeZO9XrCKb0sffoLvsf262c1roe+q0WhlF0DIs8bK98+KAc
         BKFaoxNu7DYA/FcAwJhGDuaNhTE7pqL66ez3/goyRbZEfMa3ArN+jVEcvvmALFuFWKR6
         ZijEx3HGMZ43Lg1VVsrlt0FxRTLkGQOiSPw2Glcz9yj+nGlTrD/at1JbySJOiTTqFym0
         IZSnz2cPt5+4jLfyujSYv22O3Zwfu7k2ynrGpEVKHeifTa2pNpNd1biVHvvp0jbC8oJF
         4fNA==
X-Forwarded-Encrypted: i=1; AFNElJ/4LmWbkUyfv8A3eDlc3HnFYrL5qpUEwp8nRVirCy7ptuCPvMlhFfllqoqnG1gptb5dyEvOcNADbi6R00XEoKzk@lists.infradead.org
X-Gm-Message-State: AOJu0YzPdGGJr1yZ8AUMZniyAiKf/83QQZ7Z2C6Lz/E3KZTJ9daoIUq3
	2LUnD/pfwwyiErU4dtkiSGyJrIAGShy+OnNfKr7+pW1j1mUgOWfH4NTOCvOyUzxPllc=
X-Gm-Gg: AeBDiethv4eO+EDoRmRaST2k/3Z/ZKdzK0WQ1HqW3MFvc6TynUhR4c04megZs60f/MD
	8OVruwGdwZ2X0AGWCNo1NQvrkw88JzeVPGiEpYd+gz9u7hzb2a4/Fp0Ksgz7PuqKfIjNgTs8yIK
	0SUx2MBkYsjT8STu3nE/xJ1ubr+NRN4gNxjKgWnbpY7qf3VVIz+Cgfw/1f28t+ptNSerzyImxgz
	jAIwpndxs8njNUBe0+OtSeI6XES+RmeLAUt0YJAZ7pJ5WubcCGF77+S3N4cb4pV3MCx49YpcWJm
	7VOgy5EjlwchHmYUksEbJyA9EUq8/7T56n8NCoSfCV/8sbYre6VDBb9v5hr7w46SeCMHrF/+svK
	cI0uqSwBcPdpa6y9ESwu2B0GtOMroUoDYGUk0bCP4kLPr+jorYwsjO/+O8xuJFFd/GPtQgKC+KG
	Feeb+y1o/rVyMtX/vmjTDmX4xkFyreZdGxmynFdx2Wr5JHo1OpWjzD2wyt2g3ejf0jst0oupdnU
	yh3Dxs4a36MqCIM+XzHHBgW3wA=
X-Received: by 2002:ac8:7f90:0:b0:50d:5a11:1b5 with SMTP id d75a77b69052e-50e3694a5a4mr448735281cf.17.1776983837535;
        Thu, 23 Apr 2026 15:37:17 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac72915sm172200376d6.15.2026.04.23.15.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 15:37:16 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wG2fc-0000000GJhm-1AI6;
	Thu, 23 Apr 2026 19:37:16 -0300
Date: Thu, 23 Apr 2026 19:37:16 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Will Deacon <will@kernel.org>
Cc: Evangelos Petrongonas <epetron@amazon.de>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Pranjal Shrivastava <praan@google.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, nh-open-source@amazon.com,
	Zeev Zilberman <zeev@amazon.com>
Subject: Re: [PATCH] iommu/arm-smmu-v3: Allow disabling Stage 1 translation
Message-ID: <20260423223716.GS3611611@ziepe.ca>
References: <20260420123221.20801-1-epetron@amazon.de>
 <20260420124032.GO2577880@ziepe.ca>
 <20260422064431.GA49867@dev-dsk-epetron-1c-1d4d9719.eu-west-1.amazon.com>
 <20260422162351.GK3611611@ziepe.ca>
 <aenp6FHzx9rtUQkZ@willie-the-truck>
 <aenqxasLJ8yKYqbT@willie-the-truck>
 <20260423142326.GP3611611@ziepe.ca>
 <aepRy7Gp7Ng85Zr7@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aepRy7Gp7Ng85Zr7@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_153719_533482_1C2E15C6 
X-CRM114-Status: GOOD (  27.40  )
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

On Thu, Apr 23, 2026 at 06:07:23PM +0100, Will Deacon wrote:

> I don't think it's that odd given that the STE/CD entries are bigger
> than PTEs and the SMMU permits a lot more relaxations about how they are
> accessed and cached compared to the PTW.

Well I'm not sure bigger really matters, but I wasn't aware there was
a spec relaxation here that would make the cachable path not viable
for STE but not PTW...

> Having said that, the page-table code looks broken to me even in the
> coherent case:
> 
> 	ptep[i] = pte | paddr_to_iopte(paddr + i * sz, data);
> 
> as the compiler can theoretically make a right mess of that.

Heh, great. The iommupt stuff does better.. It does a 64 bit cmpxchg
to store a table pointer and a 64 bit WRITE_ONCE to store the pte,
then a CMO through the DMA API.

DMA API has to guarentee the right ordering, so we only have the
question below:

> > STE/CD is pretty simple now, there is only one place to put the CMO
> > and the ordering is all handled with that shared code. We no longer
> > care about ordering beyond all the writes must be visible to HW before
> > issuing the CMDQ invalidation command - which is the same environment
> > as the pagetable.
> 
> You presumably rely on 64-bit single-copy atomicity for hitless updates,
> no?

Yes, just like the page table does..

I hope that's not a problem or we have a issue with the PTW :)

> > I also don't like this "lot of systems thing". I don't want these
> > powerful capabilities locked up in some giant CSP's proprietary
> > kernel.  I want all the companies in the cloud market to have access
> > to the same feature set. That's what open source is supposed to be
> > driving toward. I have several interesting use cases for this
> > functionality already.
> 
> Sorry, the point here was definitely _not_ about keeping this out of
> tree, nor was I trying to say that this stuff isn't important. But the
> mobile world doesn't give a hoot about KHO and _does_ tend to care about
> the impact of CMO, so we have to find a way to balance the two worlds.

Yes, that make sense.

My argument is that the CMO on STE/CD shouldn't bother mobile, you
could even view it as an micro-optimization because we do occasionally
read-back the STE/CD fields.

But if you say the SMM STE/CD fetch doesn't have to follow the single
copy rules and PTW does, then ok..

And if Samiullah can tackle dma_alloc_coherent then maybe the whole
question is moot.

Jason

