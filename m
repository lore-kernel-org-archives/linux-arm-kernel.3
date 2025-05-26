Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503B4C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 18:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c86jKa309c3+QcTsQwLNlEeQh4J3Qa5o3Yi92C1rAmE=; b=fFBzLGOG86Q6shYwULC280iZD3
	cLecjo46KbfHjsDZjL16fgYsi+EXii15nBSiuErZKb/gwP4hnCnb3epIkze4JgFA61OaiVGFzKkqA
	v5mk36SdJhidRb9QH0YuTAeDGeu0KXxjy7vCkrnWeZaW1IeCu6S015qcqWT9AOKHjJswRA2bF3DsW
	Q2WyXYlhejWDUZPHm3oys0OMin7tIZl8HJAOqKIU8w+uHUx+Okv0bdqntwnv2Vj5BRWLZ1WPzGNUP
	n1Qqy0mvaCYp36XadC/lcAKYJbOqXQDXp8S0UCiWhoLmdeiYp9abALJXR3q8Xf8zwXHRbx+v1NUHW
	WOr3K1xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJclq-00000009O1o-0Q0p;
	Mon, 26 May 2025 18:41:58 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJcjf-00000009Nt7-3UDs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 18:39:47 +0000
Received: by mail-qk1-x735.google.com with SMTP id af79cd13be357-7cadd46eb07so242639185a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 11:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748284782; x=1748889582; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c86jKa309c3+QcTsQwLNlEeQh4J3Qa5o3Yi92C1rAmE=;
        b=a0xgg+bhY0N/S6UmkCRQjoMfSb+9VOTFyeizZWR+eRe6ojNCD0lzY2hd7nN0b4ruy2
         ZtOgT+laFflt4sli9TtYrKmIAUWTdZ4ws8xdJBmmI+bQe4yHy/DTC2RyQ4OaX/D2eSqH
         RZGek/PhEE6ESQkXzmYdgvIJIF2z915hKdVUoj4QemMfDeRe6GSUvVdxvlbtIDESEuD7
         ABR0bRMTYCKFwMZkRwJJFS+6WynOnsDyxrwzOQ5qKQWFiJK/ck63ADcJoGjjHEn7+RFS
         tsxmVcxPE4vDvFvZj1JSnmq97xJloRx96RSIP//AI6dBOcXCMeDGYH8yJeNoFzsnyexx
         mNkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748284782; x=1748889582;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c86jKa309c3+QcTsQwLNlEeQh4J3Qa5o3Yi92C1rAmE=;
        b=eMrsWgnGIsRK/3E4ifi1H+aSZHhnJZ6XBneLx2ZczrmZ8pOHL78LGOaPBjxT4VNdFd
         lRK/2fTqAfcq4c+SfiyKnFYTDpblteugPSj+PqmAIXUBH3FRdq1MwxbcuCzTWy2jYDOn
         PpfNIvPYwRV3Y0VtyniEKNtIyXRtFBygpVQ86GpdlmxHFcBLnj4fJ+5N5/1B064sDSdB
         qduTmhhH6s+MZRq6VKc4z1TRt6f7SgwCQh58S9PTugsQgb8i+ADCEp78K9UhdQZ0MhIp
         IvfNahyGJHNhBE+VkqAbOrkDcG5sLGy476lunuLqwhol/HoW2dHjAq3h0Vs5pUsY/16S
         f2RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhmrZhsakv6e2XQxsFWs9jhENXwp7aEBljNAi65BjgkuQH3hyNpZTgjB/CRgqLSqnFSXVuoGHggK4bB+ytYgC8@lists.infradead.org
X-Gm-Message-State: AOJu0YyJZ9fHzGKLO1CamXbrBIlFSEaktMin24E//YxloVD6dvnrG+12
	Q5VUx6fpXqf85BtOOxML1fYCcF7ruVNXgzh6xNI38uuVEE9Xuqn3pI7L4ekLBTu4pWA=
X-Gm-Gg: ASbGncu0/oatfLTSjpx07JWjxdFkX/DMfdnSXWBm++IlGjpBYK9Z41RjRWQBOXRmHvW
	umfWopaFhbPa/weMj4cCrBJXC1drk7nKNLxpukHotKQ7ZqLqnmmwj4o5j84/AIxwQjM6vHIpLZy
	jpnyURNBibppb9Nl9+jDVEwVQWrLYK2Zffyg56M4vaR4AuWkS7nsN6U94EzR2m200TEO20yBqmU
	sBhnJK2tYTqdSElX7qhlsbeBYjRi3WAy0PA7gxpNVPfoiOm0LSoa3UcNMGcP3gkhHEi1x8O4j4D
	TXdYCvlH8JwA/Vm79HVuhoDI38CuHONQYmHb5d6bzTKHM7nsuxiSi2JsrjXv476z3Iay8FiDr+o
	AJawKjQ2zh3+JKsmvs2NAhrcZmds=
X-Google-Smtp-Source: AGHT+IGL7te5fpMbZe9HXdt3D5MGVGH/Bdpvl2UHGaBVcVqu8HICiF43E0e5svsb0e6OdO9BbM2sDg==
X-Received: by 2002:a05:620a:269b:b0:7cd:4b5b:a202 with SMTP id af79cd13be357-7ceecbad0cbmr1427354485a.20.1748284782328;
        Mon, 26 May 2025 11:39:42 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd468b844bsm1592181385a.87.2025.05.26.11.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 11:39:41 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uJcjd-00000000Ts1-0aL8;
	Mon, 26 May 2025 15:39:41 -0300
Date: Mon, 26 May 2025 15:39:41 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Lu Baolu <baolu.lu@linux.intel.com>, Rolf Eike Beer <eb@emlix.com>,
	Arnd Bergmann <arnd@arndb.de>, Robin Murphy <robin.murphy@arm.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Nate Watterson <nwatterson@nvidia.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu: arm: fix building smmuv3 as loadable module
Message-ID: <20250526183941.GE12328@ziepe.ca>
References: <20250523121257.2340274-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523121257.2340274-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_113943_964199_45378E3B 
X-CRM114-Status: GOOD (  16.36  )
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

On Fri, May 23, 2025 at 02:12:53PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The smmu-v3 kunit test fail to link when the SMMU driver is configured
> as a loadable mdoule:
> 
> ERROR: modpost: "arm_smmu_make_cdtable_ste" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
> ERROR: modpost: "arm_smmu_make_s2_domain_ste" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
> ERROR: modpost: "arm_smmu_make_s1_cd" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
> ERROR: modpost: "arm_smmu_make_bypass_ste" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
> ERROR: modpost: "arm_smmu_make_abort_ste" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
> ERROR: modpost: "arm_smmu_make_sva_cd" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
> ERROR: modpost: "arm_smmu_get_ste_used" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
> ERROR: modpost: "arm_smmu_write_entry" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
> ERROR: modpost: "arm_smmu_get_cd_used" [drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.ko] undefined!
> 
> The problem is that the drivers/iommu/arm/arm-smmu-v3/Makefile only gets
> parsed while building modules, but the driver itself is accidentally marked
> as built-in unconditionally, so not only does the kunit test fail, but the
> entire driver is missing.
> 
> Change the driver configuration back to $(CONFIG_ARM_SMMU_V3) so it
> actually gets build here.
> 
> Fixes: e436576b0231 ("iommu: make inclusion of arm/arm-smmu-v3 directory conditional")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/iommu/arm/arm-smmu-v3/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

