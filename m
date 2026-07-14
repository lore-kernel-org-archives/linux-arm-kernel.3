Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E28C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 12:25:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NW2Ta6E1fh/Eyc2M2Ag3HwLKZzUCdETSNuP1MsMtNOc=; b=FzZ3Dzm0P9d6VAjCPvD285Tpoc
	0+B6NOFWNw2DRP3+8E8eDcA9kbD6Ff0VrWYWnjTaZ5UqYToMvL6uhXqzXrS0VLz1OkDTufc6nwp04
	Oav2OLHYQ+Cr1zYsIvxbyAsbB2DNGEeBVy7qZ6yCg/zM6oTju1sQhQuebVye8Kd8uzl422hDIfoZl
	KH2gLRr3JwgceCZFCST2VRbcZUmVOsbpK5SRbo6nfUhL/UOGgtgnb+t74U00pGgPNSJYn33eL32t2
	tnGehAZyMc/U42fJKQQjSVIaa0t0V/85Qkt8IphFAxK9/wg7Fn5AuvijMJ6OWs07cKw3uiqLg5gxI
	Y+m5dohQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcCD-0000000BuuE-1a9R;
	Tue, 14 Jul 2026 12:25:09 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcCB-0000000Busw-2Bl6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 12:25:08 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-9217d13c276so269195485a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 05:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784031906; x=1784636706; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NW2Ta6E1fh/Eyc2M2Ag3HwLKZzUCdETSNuP1MsMtNOc=;
        b=nZ5gt/hKAli74y8WKhl2cXcDUYOnimxfwcJKXzpKFmanH19GZ+d75PbhcvGZlR5bA8
         klOqK0jglUrERjiQXC76gNYZE5N+Gaz7Uqob9FQp/G4N+5hcSBUSrWwUUmJOp5YJ30R7
         kv+yFT2Hx/ltOTb1gJyGVNhaMl5RDVNi1ERjm1UqK2ZaEj+8F3Q93gwEA8bpIetPFpri
         sP5rBPMnyYPRYDDz1D02LarZ1hdhDc7goP5gL6ZJAldixtncck5/ymtnsvPpGGGuSjcP
         09WLRdxxTpQGctxepDaSekQTvOZhfhgamYzC+UXOSILhFsfvzRYWkNggQ9rFPBDLlcjW
         XvEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031906; x=1784636706;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NW2Ta6E1fh/Eyc2M2Ag3HwLKZzUCdETSNuP1MsMtNOc=;
        b=QYOVcie6H06GMnLpuznOtEQ9sI/LxlA393NlSuobhjAoO8Fp11hcwUwYeqPE4YJ0/B
         3BXWyaskDCmqHN/IS1iz3HcaX889ziE/oIXfsXyogvth/UvSihQjzzobGw4y4WDXwxsj
         1HFpuo4qRZfzb6cV0Z27ud1eVAiGWUoty5O4NSh3jeeM2s0PF/ydX53MpEvatYWdGF/e
         r9WprsziSn/OeR9fGBWkcufvcs9V0tRyTltdSasNC4pf+UNNVrS9ZJtxf0luaHk0+mkc
         Ofp3s5YDwE6cHIm8mIrEDnfwIMiMmB1H3RRfmkB9XxcQiUD+P+aPvrOsUUfZEr+w+gOm
         zQ4A==
X-Forwarded-Encrypted: i=1; AHgh+RrBOMR4gFcUfCcMOf0aAEjXroPmFJSAT67vMbd1GTw4YUOWNLcT8bYbOmL3UHAyfKYjbOst3iYdLd4a1VwDdVbS@lists.infradead.org
X-Gm-Message-State: AOJu0YyjRIqraUSC2/8S5JrUg2fdemsLYrpvdt4vk4BU1fnOjM00AOOU
	SG/6iMutFeXvIJ4WdfgAR7Cf+5gVq6kan3ex2hqApfMy35Gh91HYQyWmzEjvKbh1bfg=
X-Gm-Gg: AfdE7ckhh+1AG2dpsvpkxkClRAQE11R7UyQElkVaR5hDZN2sI0lxAhV5vbjfjrj9GAp
	IUjZDOz/g+snoowp13beaj1eD1AJfoSgrQHgCBdhEfhfNZj8SHLEmy7cRQdbSnggy0LTOLeTBjO
	GMKHa0HToDRWP/hsVdvTshv1amfZpXT/36kIcukmLs0wJSctB1V5lT5IAEfbglkF1WbEZyEe0Sa
	iNfvtMn8QSvqyzUMaDgdsjj8ejz+pA+afuRV82dZ9LqBApVqcD0Mdd2Pa66ikDpEuU4z0MD+tQq
	D96U2hkLLuo4PKtmMpmIjttSJmzNEhrcPj5GrZnyVYafU/FakCbaTcghnPAMpYGBgwokq8H4O6+
	HM4Vqd8aaNKaQaOJ1l5gfsaPWGtS6kkTxFjjRsGIbKayGeGTXmdwV8IxIe4ShKa0wgwIvSUg=
X-Received: by 2002:a05:620a:261b:b0:92e:c118:18d9 with SMTP id af79cd13be357-93083dc8f4fmr281429185a.80.1784031906057;
        Tue, 14 Jul 2026 05:25:06 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5b4a0a6sm1474337885a.8.2026.07.14.05.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:25:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjcC8-0000000FRl8-3aT6;
	Tue, 14 Jul 2026 09:25:04 -0300
Date: Tue, 14 Jul 2026 09:25:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
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
Subject: Re: [PATCH v7 11/22] dma-pool: track decrypted atomic pools and
 select them via attrs
Message-ID: <20260714122504.GG3133966@ziepe.ca>
References: <20260701054926.825925-1-aneesh.kumar@kernel.org>
 <20260701054926.825925-12-aneesh.kumar@kernel.org>
 <20260713175616.GJ3133966@ziepe.ca>
 <yq5atsq2md64.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5atsq2md64.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_052507_572076_D36DC734 
X-CRM114-Status: GOOD (  10.64  )
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

On Tue, Jul 14, 2026 at 09:32:27AM +0530, Aneesh Kumar K.V wrote:

> If we want to warn about such failures, we should add the warning
> consistently across the code. We may also want to handle decrypt
> failures by encrypting the page again to avoid leaking it.
> 
> I will work on that as a tree-wide change in a separate patch.

IMHO the WARN should be inside set_memory_encrypted(), and maybe it
should be a BUG_ON...

"free" functions shouldn't fail, and returning the memory back to
normal is a "free" operation.

Jason

