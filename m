Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DDBCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 12:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vh4D3lz4qinchk1hC/kj6LCnkyHCrjcf/nEQajAoip8=; b=HJB/2KemBHLQQuOJpflUAdnT2g
	9aLtjcdLVLRu602kn3y66y+JLcNw9XupqU+2z8nrNTE+tEHSWFaT1Wsv9U7vuWWFTkR0M8bK9cq4c
	rmdTdqWt8TtOttEZOsW/q3DJlODiGqiRDxGZel50axe29bCz0be1sdczED1wDdNZIlzEJ83adsfzH
	sgIXMKT438OSCWCO4zGbWvJx+Qx4DA3InB6R5pqpJ3wYNerGD+i7DH+FPg7V+po/pAoZlFNQKu2jH
	p3wTaxQOCTAsL01Aawuok4H+1VC1PsouEhHs2guADEkROWohLA299iSeYA2m7bwGAXu9n1RpL0CpL
	gpWUZuhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrOK-0000000BLtT-2C4j;
	Wed, 17 Sep 2025 12:36:08 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrOH-0000000BLsl-1P96
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 12:36:07 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4b38d4de61aso65179851cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 05:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1758112564; x=1758717364; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vh4D3lz4qinchk1hC/kj6LCnkyHCrjcf/nEQajAoip8=;
        b=pJMZ+DzfO1NtVKx6FIp2z4ywsOCHOtt4VC1V1xsvZxJafiganxvwU/lu0iYfocd5dG
         TG+au7A6n9xjbqvcrB/2p94IqFSLo3hCMu5d6LGh+4MwnCJvy64uxas8/NCHR+gMsWgs
         T8GQ/zyKyXMZM7zR8plFLHuqrqhLpvkmCAuVioW6sYaIJC+eGxyMsjm+ozqKcx9E6pgl
         HdTN+28cs+EolKZVMFWbf3InTkFGONoE858Y4Hq3hGGPSOEUKg3de5YhytlHPKClVB5o
         NMXU1IKUY1uObLT3yxwYFz/DPtsstvJeaMbUuFjunMlP7GOsG2iUS8iG279L5jOOrtAj
         0i1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758112564; x=1758717364;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vh4D3lz4qinchk1hC/kj6LCnkyHCrjcf/nEQajAoip8=;
        b=ikD8n3YJ5f93f/PXdghQeNmk6SOoNSe2y6Z7mmP51bzAOfzZx5DO4dYZAzTgs8bbxw
         zH8TVCGvQPH9g7IEciTS7mSffVsq6VGxIqkw65Pr+nW0d/vypsrMwxcayFsy5ig4O70q
         rcuNigFJvGrO21lMbT9pmR207f+1rveLXRyeI59tU7XWXfGsyq/PAbYzRwsuiofMZTSC
         P4AbG4O6CORO0jYS2Q8Qadv5VDGErLES/RCaZw5HJpG6exK61zJrenNH8hk65x2Oxfea
         +WSw1M0b4czA/FX0Pj2dE2cMFJByQHV5VeiM2lp74zJ2ViAHKPrqc86Qrlmzb8pFR3Dl
         58gg==
X-Forwarded-Encrypted: i=1; AJvYcCXVDP4FMF7DMe45KgdRQuyb/J9C5AvRpFity/JGimSUXWChdJVBaDkginhztUeto/HMX/VLdZdw8XqQ+fhqmkvk@lists.infradead.org
X-Gm-Message-State: AOJu0Yxofk76sAVrUeEewOubJIOPLaFBF3yT+JGqtM6a40loyDu9IzIo
	uKFnQEv8JxOhij7UIJnzFJ60wNKEP0bXjDdM2405m+IlVFbl7s3fwonRZsDXr8MhlqA=
X-Gm-Gg: ASbGncv0O6ecEOWv6M4vPxMWfPtlXcNB8gu3G0OaCWoOMlgqlWLgW1sd+wlEmEbcliK
	6iBko8KzYU4PmaDypwEhq8eOpCmmUnK/VLHHcd8y73BGIUA7rrq9/32WdAopNXGAZGtmulYpsvA
	JC7pgyE3asTzixR4FcKk8sdb6jfMucwgPE1pa6CW7+KEgpRk0IJH4irINgVWhRCTtUjlcfmvBDL
	zMydZ0ErsYzabmrvKD5POUrHbuebtWtocFUOiRMB4WbWd+p/PrBckBExysUVMJkBZrBA61youjx
	91kGAS5Imm0QnhAphDLQuN9i9T96VrER7KC/dUshciLkCgW+nkZbh5Pc1v+1FjwqVBneG3SV
X-Google-Smtp-Source: AGHT+IEGvkvScyo54tTHL6/SrnC/aHIWG/EkopD8ichGedBCY62w/oSm7uSdoqmasg8xw4ohjLSyZw==
X-Received: by 2002:a05:622a:4:b0:4b6:2ca5:2035 with SMTP id d75a77b69052e-4ba6c6b4280mr24104781cf.81.1758112563531;
        Wed, 17 Sep 2025 05:36:03 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b7af2426a3sm34649061cf.37.2025.09.17.05.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 05:36:02 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uyrOD-00000005jqq-480E;
	Wed, 17 Sep 2025 09:36:01 -0300
Date: Wed, 17 Sep 2025 09:36:01 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev,
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, robin.murphy@arm.com,
	jean-philippe@linaro.org, qperret@google.com, tabba@google.com,
	mark.rutland@arm.com, praan@google.com
Subject: Re: [PATCH v4 22/28] iommu/arm-smmu-v3-kvm: Emulate CMDQ for host
Message-ID: <20250917123601.GA1326709@ziepe.ca>
References: <20250819215156.2494305-1-smostafa@google.com>
 <20250819215156.2494305-23-smostafa@google.com>
 <aMQroI4NDu74PDGT@willie-the-truck>
 <20250915163858.GK882933@ziepe.ca>
 <aMl_5j8G3IGulAC6@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMl_5j8G3IGulAC6@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_053605_510272_E3357F6A 
X-CRM114-Status: GOOD (  12.80  )
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

On Tue, Sep 16, 2025 at 03:19:02PM +0000, Mostafa Saleh wrote:

> I think the fix for the problem Will mentioned is to just use CMOs
> before accessing the host structures, so that should be simple.
> If it turns to be more complicated, I am happy to drop the support
> for non-coherent devices from this series and we can add it later.

I feel like it is easier/better to fix the driver to use cachable
memory than to add CMOs to the pkvm side..

This way it will help qemu/etc as well.

Jason

