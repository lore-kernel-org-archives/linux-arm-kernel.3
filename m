Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0322ACD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 14:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=leYnnf5Pg/xQRLvt6GMDQfv6g59yyMdkhV1lUPQrWAM=; b=0Cs39Di5XmqrqFP1E4yQT4ygsi
	miITiQGqMl+8txMVh3miDQnFdxsyP6ayDTQ9WwTHfpbKAgmDJp3a/Mb0rNvgYHR4TZfosg1w9zNFB
	yHZfiKWa+8yu97et71aSxbl2CAqZaMv1aDjonQ3SazHDIw+yfBOQapNlJ2AdKqqZZ09hTdijTL847
	Xcz5aBi4WILLPMkRdzm+u/QOJmbmhIHjlxv4pKTuu/ovxveD5dANHj+7hYBax01kz9Mubk+ssVS/+
	3ggHkCjnwslR8vLx5b4OPDC8XBaeKjXzYR0kIARd+L0OQx4G6PWbeiXh8Jc3VcvARngDzoKrRFqw8
	uum8w+Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV95D-0000000GtxA-1R6r;
	Thu, 04 Jun 2026 14:30:07 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV95A-0000000Gtwi-2UZi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 14:30:05 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-91550c6ea8eso123657985a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Jun 2026 07:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780583403; x=1781188203; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=leYnnf5Pg/xQRLvt6GMDQfv6g59yyMdkhV1lUPQrWAM=;
        b=a68xyUvbjGqnYfPzD/sESE6gfzoLSGKHE+p+JwP546AHjXevrssr8uniOAIyzKzMpx
         AKyAM5A+D0juiHeWPYO9Jt9CGv/IVyQuKBGtTf6TYzST1OCwBqgPwjrDGXHJo01tFutv
         FEtxpN/jmfHRrfOvQwIIPbFTMBgGZKRqjRO0PW+r8CarUlrnsScJBy04oazwG+2qDMj9
         MFOS4jotSUjN36Qc/0tHKRuX+9Tadq708FbSjg379KS+T46AnOMux+vBUVDRlT4IfhvM
         ll6Hw1yitzTPg6h4+kcMrw6regrJqMzQvnN2BWN2grmC9vtB4qwnG7NwA4UwDJlrpTYL
         I/JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780583403; x=1781188203;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=leYnnf5Pg/xQRLvt6GMDQfv6g59yyMdkhV1lUPQrWAM=;
        b=tUFfXof8ZRR4FvOlxzouoIDKxKtAyiDfjoHYofr+GHQg2WFACezcKd/xVfuLXZYGyR
         KVFJok3OhNTbbMlXso86odPbOYKRWdhAGkbAbjH9kpcftLeQ8iM/kAocC1T+fXLllUvw
         U7RM9dYXz+eCTSnBmEqcOC85IQCmCvwuOxcsMlCdu78uyjCDUJRIhCvY6T26iY2LHJOY
         LKie8qX4FHZJarAei6VY6dYdAemMuqCFa3qoLmJuY8Z1ghJyh8S14ADbx8TFnKfkU7oR
         y/y+R2qmBChkHjJLLSHz7G3Z5BEgxUFkR4t7aSNzNZX343PQ3d3zTFRmmc1AUPLRn0TF
         +nOg==
X-Forwarded-Encrypted: i=1; AFNElJ+jU922b6tXjbrz9kKClMKW1jM5qf02WJlVyj1n8wwMf3BnBL1o69AVkv3b+21x4/O6xb0/AjCYba7LWpBwEY3q@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2zQYbIO19UGXEQHbfBlL5uJ5iEo3RV8Dyx8F8hWZipflD3ydk
	8VU72vGdhzuzD/I3+vwdO1VP9kHPB7/MQZ6qzR/i0jotKdrWaEaZ5i4kLtk1AebpzTY=
X-Gm-Gg: Acq92OEEIB2PGONpL99cFuulU86b3sxU5aeMHFvxbgqYrkYnwkyPwOob8FVP0VUNKX1
	z1yFeBEO0zouNrA0vh15c45RGG3rQS12Ro3nMY4OzYQr4da55XxbAdgwambOqt/N+Ja980Hq/kk
	cI1Xeg5MyRM0dcvTagmLSzx3RjQPrjqdD9nIQFvGeTBeqBL/fYMQHnJcA+1eBKbH2y9aQIZ1TJ+
	bjjwmzSumb8e+cVAP/HYADcyQSVj6tPbWi6hFMe1QCKEDwunuHHkwGQlQXayMsclKZtFYoV6+Em
	MypON4G4X3r+NYInORFaThZ0+J7beUVQXlDC3ybk31CVR8CmBXydEkyCWUUcUNH8yr1sQvM/Fnv
	/P2oJYkNavwCXTeB/9pVrp/LK+KymwdGHREgRjgAuWegluxeXWgaagVPI/LuMSuuHgb6/JcPx9v
	ZQNr9kAFPMyRsOnPFbArEDEWYaP1PImXJyvm7YwFquG+7Mv5014tkk86nnpeAGUNXeN+cv2rpiW
	IdWNaUWPTtA+z+c
X-Received: by 2002:a05:620a:2544:b0:915:3e46:c44a with SMTP id af79cd13be357-9158a80c3f3mr1387419585a.46.1780583403463;
        Thu, 04 Jun 2026 07:30:03 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a21d2c1sm657350885a.11.2026.06.04.07.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 07:30:02 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wV958-00000008IZw-1Hzl;
	Thu, 04 Jun 2026 11:30:02 -0300
Date: Thu, 4 Jun 2026 11:30:02 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Michael Kelley <mhklinux@outlook.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
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
Message-ID: <20260604143002.GA2487554@ziepe.ca>
References: <20260522042815.370873-1-aneesh.kumar@kernel.org>
 <20260522042815.370873-6-aneesh.kumar@kernel.org>
 <SN6PR02MB415754E94A9505C2B9739E4DD4092@SN6PR02MB4157.namprd02.prod.outlook.com>
 <yq5afr35sciu.fsf@kernel.org>
 <SN6PR02MB4157D9955A93244014AB7978D4122@SN6PR02MB4157.namprd02.prod.outlook.com>
 <20260603005454.GM2487554@ziepe.ca>
 <SN6PR02MB4157F94C902B78E55E99372DD4102@SN6PR02MB4157.namprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR02MB4157F94C902B78E55E99372DD4102@SN6PR02MB4157.namprd02.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_073004_642832_2E54673D 
X-CRM114-Status: GOOD (  21.06  )
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

On Thu, Jun 04, 2026 at 02:05:35PM +0000, Michael Kelley wrote:
> From: Jason Gunthorpe <jgg@ziepe.ca> Sent: Tuesday, June 2, 2026 5:55 PM
> > 
> > On Tue, Jun 02, 2026 at 02:24:40PM +0000, Michael Kelley wrote:
> > 
> > > Except that in a normal VM, the "unencrypted" pool attribute does *not*
> > > describe the state of the memory itself.  In a normal VM, the memory is
> > > unencrypted, but the "unencrypted" pool attribute is false. That
> > > contradiction is the essence of my concern.
> > 
> > I would argue no..
> > 
> > When CC is enabled the default state of memory in a Linux environment
> > is "encrypted". You have to take a special action to "decrypt" it.
> > 
> > Thus the default state of memory in a non-CC environment is also
> > paradoxically "encrypted" too. 
> 
> The need to have such an unnatural premise is usually an indication
> of a conceptual problem with the overall model, or perhaps just a
> terminology problem. 

Oh yes I do think the AMD derived terminogy is aweful :(

> Here's a proposal. The new DMA attribute is DMA_ATTR_CC_SHARED.
> Name the pool attribute "cc_shared" instead of "unencrypted". 

Yeah maybe. I sometimes imagine replacing the encrypted/decrypted
names with cc_shared too just to make it sane.

> "cc_shared" set to false in a normal VM doesn't lead to the non-sensical
> situation of claiming that a normal VM is encrypted.

It seems like a good idea to me

Jason

