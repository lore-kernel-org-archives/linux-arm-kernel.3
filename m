Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8F4CD6E75
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 18:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZk6YMYYl+ylqDKIH+EcQ0Ik0ycwrFRfvhKkDvlO978=; b=OVu70lUxIpe7abBtr/Pnf3cNIu
	CyVRMPYrEdCBShiAZkmU5ljhBkLbLBjdhFWOOTpZSeVNTtupYYKMwUy/sBD2DyxfcGrgWZi5xqn4I
	0ot9U2AVCCkwX6B9xRZ5Xaa7OCYCYjzzf2cnbPoUyUnsRKIvU0Z9rfQlULhZfpZa4bP7z6Yu8ThUe
	TbB+KYmQtE1L9eJsvGozJGAQRyL2EO0CC7Lvo4m/Zgyxgd5o512XoFb8Kcrm8ZUdywFMRpuLuEo+F
	RD9P1FYkjfsqxvUaPsSgxZ9CjuGB/Vek3w6Hr8mniU1zYBh7esJkxoNFZDZkp2cdpTnRP82VkcV7w
	PQO+7sLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVCjv-0000000HASw-36vn;
	Thu, 04 Jun 2026 18:24:23 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVCju-0000000HASa-0SY3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 18:24:23 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-51784eb2ba0so8038901cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 11:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780597461; x=1781202261; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nZk6YMYYl+ylqDKIH+EcQ0Ik0ycwrFRfvhKkDvlO978=;
        b=hencHhiw9+M3sob1C5Aq5b8AGgV25NnZYSW2eygEeiLPnQ6SzgOz9RfBV0xXwgUx60
         3hkZwV6Aa7ZatghcZ2v2kPVuBEZBZTPSzBOecMQ0kVdFV/7x4ncjqYwcBLI9ELYtWtKK
         ke2WBH2edIlJZTG4YGxAKfz+W2HXLoIGRfFpvoAVIuwd651TzTQsf3gUOu/YkAmNbfNo
         ujtSdU94rtOG6W8chjRzKVYaEJMkg3MEPvsYwkA6wT5m5l500DGTlOQUMw2njP0gWHkr
         SZiN3kew2kHm8tY6oZKFw8DKF3O/WrZ3V5lqt8aqwEZHOO5t8zMR9YlxiAUlRL4WgjRq
         3S0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780597461; x=1781202261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZk6YMYYl+ylqDKIH+EcQ0Ik0ycwrFRfvhKkDvlO978=;
        b=fj6vqBlmdt20FDsGdeHzHfCAGoeDR5ouiVfaAYNLbxHvq+RPWmFg6mAXU7v4JErcV+
         fw9uY8vOMXfBMbdamELfNTZb0h62HgAdVHDM0zRo6hKJpCZPChf4+EJc8SvW4IS0BB9f
         cj/sz3CkI173fUgCbOEyNGCcZslJth6pzqhXx32ewvv3WirEpkQ8ENlO2j67bPHleUk4
         bAc+ENLTCbupbBe49820AdyBIKgs5ZfEip00WERjCsFELqSDj7b+bMC+zExHdWDxeCbF
         eLogeuri2xhwskdEWA+zTNA5gDTkOtnGomn/wG0ru+i9KfzBQNCrP5/ncCu3S1KqAuJG
         UzRg==
X-Forwarded-Encrypted: i=1; AFNElJ80IrxNSwRSdywdjcSYU466Vw5Asq+mUzKiwXGsftSK/jRf/KqgCJEhTBE0JmMaYDMYQ9m73QIYfISTdHh8NZTV@lists.infradead.org
X-Gm-Message-State: AOJu0Yxfo+ScqfAPY9qEXS8FJpgGyzLdhGtQTe43+kxYyPMyz2xLSiQP
	eXCxIqEGtzIe+BW0rYcgfmVBfAGDZAOfwefZHU4qJ8/6sZO73AqE1c8B/3cYZ893oVk=
X-Gm-Gg: Acq92OFNVejiE0bMwJmWuH8nCxIuJzLYGMMM8qUYehwpZ+o5dceuP5w/LzoN3MgOE6t
	Qe8OpwDpoCOTQ6B+g+LggJ9uJ4zemPZLDR9THovdZRlOwJGRI7PjfaetRQ770CqMcS7YdRxcDla
	03oNQCfn05aOAiYIhiTHmaNPrKA2HAOCZ5hR9dW9pT25PxT+Ox3Lj1/ljETIhPIqyPt+14GyrC+
	79SeYX7TcV3I7+RAKImTyzqQtjZFppBOMDiy3biobVQ/eE1zltdj+HPH21d5qYJKfTR5ibWWOIg
	2AS4jFGzzpS0rB9Rrvkj/hMDVhRRSeNEV1wvkkcw8HvM78+4VSEBtqRmPjt/4OAC3uXCJWb3SJQ
	AnilGymP3N02stjytMiCzQwY2hvdOhEQ8XCOcOo5lAweaYMr7lDe5o5ivjVvJ2oP2LuqHnZ/0zB
	GvMDEQWUm1TDETu0STYVte9HujmYcRg+d6iCyhqzWDrOut5l6JKMGLkJd76+MK00Mg02SLI0CMN
	7bjETkP+N4WHHEz
X-Received: by 2002:ac8:598a:0:b0:517:7277:9362 with SMTP id d75a77b69052e-51778751a59mr126094041cf.48.1780597460764;
        Thu, 04 Jun 2026 11:24:20 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775dd2e53sm57509021cf.24.2026.06.04.11.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 11:24:20 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wVCjr-00000008f4K-2dN0;
	Thu, 04 Jun 2026 15:24:19 -0300
Date: Thu, 4 Jun 2026 15:24:19 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Michael Kelley <mhklinux@outlook.com>,
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
Subject: Re: [PATCH v5 05/20] dma-pool: track decrypted atomic pools and
 select them via attrs
Message-ID: <20260604182419.GC2487554@ziepe.ca>
References: <20260522042815.370873-1-aneesh.kumar@kernel.org>
 <20260522042815.370873-6-aneesh.kumar@kernel.org>
 <SN6PR02MB415754E94A9505C2B9739E4DD4092@SN6PR02MB4157.namprd02.prod.outlook.com>
 <yq5afr35sciu.fsf@kernel.org>
 <SN6PR02MB4157D9955A93244014AB7978D4122@SN6PR02MB4157.namprd02.prod.outlook.com>
 <20260603005454.GM2487554@ziepe.ca>
 <SN6PR02MB4157F94C902B78E55E99372DD4102@SN6PR02MB4157.namprd02.prod.outlook.com>
 <yq5apl26qrof.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5apl26qrof.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_112422_159218_D75A3B9C 
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

On Thu, Jun 04, 2026 at 08:27:36PM +0530, Aneesh Kumar K.V wrote:
> I already sent a v6 in the hope of getting this merged for the next
> merge window. Should I send a v7, or would you prefer that I do the
> rename on top of v6?

I think it is too late for such a major change, but this should be
imaginged to be for rc2ish next cycle. You also have to spell out how
the pkvm patch will get sequenced as well, it would be best to push
that it gets picked up right away.

Jason

