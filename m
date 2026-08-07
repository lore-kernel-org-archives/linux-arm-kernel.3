Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A52C2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 18:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQJoR9F+JTLHFeALKkUq+Q0MNEImv4dProP3GHVEWS0=; b=y8orbmYh9HIzulFt9aJexKgiKl
	hjy23zB/zXKrthHv3G7UCn4SY7Xk2YTIJKchdeRtoygX5BCXUOjcXpvssPH7VlpQxtLjuogYth5Yq
	Pn0lOx2C4LGXYgyxfrz96oVEoz97DOng/YseZM0Wg3Hxaql5YcW+Nb4p75kBcVisOYYkHwqZM1z/f
	sj6xWr4G+IzT1a9RIJZAa048d8g3c4zcoyXgl9OAGvFoEdh5UUswDIE2KHMAoI0W7SJffw53T6cYs
	ahMFljeAZqoHzpokNNYEwyURUwuKPrzAU+WBh1enpcI/22AhONtweFNu+k9nN6UleNSqihGQ9EMMV
	odZAZWkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsPB8-00000008at0-443n;
	Fri, 07 Aug 2026 18:20:22 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsPB6-00000008asM-0fcH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 18:20:21 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-92e533aacf2so207604285a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 11:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1786126819; x=1786731619; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uQJoR9F+JTLHFeALKkUq+Q0MNEImv4dProP3GHVEWS0=;
        b=eAratrTELS3xj8DktHkd22i3X4Su6zY1kOOetWkERi3o+X/wainqpxRNg+ETcVEWH1
         l+rphiLer5QZiTbaPh7pUPJkdUns0ztLuHp5W1BoHLQIiDk6xDofML0IFGr6AScZdUng
         zd4wfmVI4rRwLE7ooeeN09zXMzbiph69qa0Eks6Xmtl02qL24i69/dTxpSSY3pJr/rhF
         Nxiw/X7hzzxmbHCJQ9dg4YpBjH918BGJYjQQ1DM8MQU4UvyVuzAZz289kZWoL2rVcYnr
         AvkgSdBV88B0QUZ8QRLIywkUzb7Qyg6Kq4+YRlWTFoSXEQy74aRgPY6wSagEocCWX79X
         nqvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786126819; x=1786731619;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQJoR9F+JTLHFeALKkUq+Q0MNEImv4dProP3GHVEWS0=;
        b=tXF4YM1bCCE2+0JPr2dmYBHotsJ8gpO7a7SI6p+id6O5cab4OqW7I4kXUzJCAYPNui
         cXVi5KdY3pVW0loWoZioOMfqnuZwG+n3skMXNnJUdPA2SWBphIC4aawxPGixu1CxE2qc
         HjVEQxug+hI39qsC9MlV1E4lnvpZ2qTnSSn//Hn+Nhc0BbmMxECVkn0C7opSe3FqoFSS
         nPxNNMsv1AN74C3HrwZrlVlVSnSTn/Vld6bF63AawSgT6bPCokPMhL/idk613H8nZUXC
         JtJ+bZNnrLy/9zv+U3ahDbK3UxpXjEInYqEgmjGekw4s6kySufA21yJB75AWygh1+/BT
         bU0g==
X-Forwarded-Encrypted: i=1; AHgh+RrlN9M457EbqEjhoKaPM6AZq1Cfw2q6idgtPEhOYXney0/OAu/BhSxTQHgk5knhdUN+K7iJO+26Tm4pGBqCe/7k@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk/erY/cOFRTRCEWRWkXbvrNghTdwxQ/0uZYLPk7MbODboovxE
	kPRabqV36o/mA/npUfUTdYtd5QhyTPfNWOs6OkB0/iiYrHJ2M2MKSIjrV5CpLjRLuFQ=
X-Gm-Gg: AR+sD10/CtATRbT8aL9pHWGDBd0QijXjBKzjPa8YDCFpMG69y8nnl8kW8D3iVowEsg5
	s3vfCi8lzWKYxqJCrZxTgIAEXknh4NItEkxp6sVB21S0PFK5E6kxAjZeMXIEDSN+xPISnG8N1Ho
	S/7n27duMktUkrEAi2c60LRgD29JXgL9oCF1XDkwBHutwAtq9X0UZzSnPcCEwxhhfzUJkcuKx4B
	N/cbI9e9RNYUblWqNTN9AumcWFvXE2wTmKFwfuPM7KgiUWUR/NdK8iyBeXlvohdXn/KD4I+cve5
	IvbJYHD4oc4PU83b+NaNOmjp45TyR+zVWmZT/65CuY14O0x+CbvYZimmY4qH2wtYtgPCzBXA6ir
	EZXa4n23KFkwU0fR8th2+I6R3midwB93euY15oxcs5fLp1wdiLYmDMFZEcTZiOSpuqlzw9iIvLC
	aAEBlQMpYTsA1ZU22Xi6W3VtkHeo3FZaSUHu/CIGv51trArG4AwEIOQzpV9yr+
X-Received: by 2002:a05:620a:628e:b0:930:a38d:4030 with SMTP id af79cd13be357-93671eae149mr628522585a.29.1786126818655;
        Fri, 07 Aug 2026 11:20:18 -0700 (PDT)
Received: from ziepe.ca ([142.166.156.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9366e02d54esm204051085a.6.2026.08.07.11.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:20:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wsPB3-00000001Bmx-1xNi;
	Fri, 07 Aug 2026 15:20:17 -0300
Date: Fri, 7 Aug 2026 15:20:17 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Marc Zyngier <maz@kernel.org>, Steven Price <steven.price@arm.com>,
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
	Christophe Leroy <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, x86@kernel.org
Subject: Re: [PATCH] arm64: swiotlb: Keep the default size for protected
 guests
Message-ID: <20260807182017.GH200537@ziepe.ca>
References: <20260717180442.110954-18-aneesh.kumar@kernel.org>
 <20260807092612.2202005-1-aneesh.kumar@kernel.org>
 <anXIZSh9lq99VG9X@willie-the-truck>
 <yq5acxvu2ict.fsf@kernel.org>
 <anXbJ2O4DWgPxCeg@willie-the-truck>
 <20260807135810.GA200537@ziepe.ca>
 <anX7F7dnKOtAOIIe@google.com>
 <20260807164734.GE200537@ziepe.ca>
 <anYgXSR4VAi3TpOj@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anYgXSR4VAi3TpOj@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_112020_275762_1E0B19ED 
X-CRM114-Status: GOOD (  13.10  )
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

On Fri, Aug 07, 2026 at 06:13:49PM +0000, Mostafa Saleh wrote:

> But the whole thing is best effort anyway, the kernel picks
> IO_TLB_DEFAULT_SIZE which does not depend on the system topology or
> how many devices or how much DMA they do.
> SWIOTLB memory is wasted if unused so we should be careful around
> that as it would be the other way around and users would have to
> decrease it manually.

Yeah, it is why the arch code shouldn't really be sizing it directly,
it should be done in common code and, yes, we are probably going to
have to do something alot smarter to have the common code better
auto-tune this for the CC case..

Jason

