Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E38C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 21:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IIMvCRPk4oQabUuNoTzd+hbJerQBs659OSj7AsZRTXU=; b=D/1tIhbXn4oEspf9VJOPEAUgNa
	fIu8vHfA2FvtIRt1IokfFAHV8+s5hVwCdQM2M5iRF1OowGO4JapaM8NFTePFSvOdLiD+rznYAxJn9
	6ccS8wpwQlxvDkeQt5z4BHguGkOmisNURxa1WcJAhf0D/pWbxkdXehLZ6dBZsssIldhVozp/uL8Yw
	ef4B9X34Bc98Pth8S9YTOsNCwyEMdJ1eGMtaepdtSQ9fCa1xuxJkm3MSBpKGpe5QFnfp+TIwXFoFX
	MWPETDZZElgfVWcCyjnDH1hKSwowpzD0UYcANF4u8RCxSynPh0zbg2mbycI2dDKTy4ENGwTbv2PF0
	Jk5YgMKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xADiN-0000000EWNl-3ghB;
	Fri, 25 Sep 2026 21:44:19 +0000
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xADiM-0000000EWNA-0eiF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 21:44:19 +0000
Received: by mail-pj2-x0f.google.com with SMTP id d9443c01a7336-2d747ee1f9bso6860485ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 14:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790372656; x=1790977456; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IIMvCRPk4oQabUuNoTzd+hbJerQBs659OSj7AsZRTXU=;
        b=V8cW6gW1rcpG1xCWhSfDcflxOs4p+vIyPcq9b0KF33RYZKVmK+FBbiap3yv1IvsdJy
         adp5ScrOlZUrS+H3RUAwsIT2zOT1py/WpsqezB0JumSMlR0aj7JiyyHLIdz7oz++B7MQ
         5Onyr6iPdwBbQtz4q0u5iKq6bWXr07k9Ur7L6MY7sN/q7pAjH1z7aII9bjUdPiImfX/o
         e2mbMZCXnRUlmFXvXn8QWHuO3GvvbUaMWMjDVaIVh3z6dKB3QOSZPo9zDE170BmniKtz
         7a+8fma7ce0lQQIvh6nlhjy/wTXwz71QqfVAz5Dkl42ZB0njIi9ivrc3Oua2jxviIWRB
         7SSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790372656; x=1790977456;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IIMvCRPk4oQabUuNoTzd+hbJerQBs659OSj7AsZRTXU=;
        b=GAG8UrVBsTW6uchcBcp4z1UxKSj5UJaZzPkG64i7D0OWP/0Qve1MWTQce+IUCsdBle
         F6Fv384ZVS5t5l4JbVXuhrRUAuUZfEsV8BKkYpqkf2EroaRjC9RpTUlOC/uEAKcefcjd
         X3i2mnfYNlg6iarZ2YZ6WCmJmXBJJkwk17u4RVL/1PEz2cVKo9fpwKhxUNUwSAMWqv3k
         m/HGx0RqFdzlHrBedDml/so2ZO5HBULNdVmbgoHxOar521GG3nQ9nVPFLKHYZUoSS/Cl
         KT0mR70jCUa6cs7rVLPx8sSO70ISnOsFLh4t+dg44PXpESUqBMdNr5iIXmIG+R7CQcmh
         PwhA==
X-Forwarded-Encrypted: i=1; AKwUvBxE7Zuz1ZOPy5/GB3hivuWumbg3lkmbrb9oE0/26uBBxbiATstJsbkfjMO39siasropQ7sQW7uL7PQu+3hHXcC1@lists.infradead.org
X-Gm-Message-State: AFuF++n6lBft7JtuNv4oJzpESodBTmVNbodx5SyuI22gXCK0lQY4dba+
	Ph2QD4zRUA9s71Ro/J2pPZPAXuco9fByxJ6jWGcb3H6tm770KW0UwdAJFt8CdvvUY7QNpBXGGyM
	sN6RyCSvG
X-Gm-Gg: AYBFou3qisp/MriPbJkqNk5DEC3dlpRcZEoIJKMUHa9p51HpL4uAWCw322INXpid9s+
	5DNq7rLidnuFj9hULfhvT0CLfD4/FXv5qN8w8qErLsqiK43puK8kFLUN7hR265yMYQ251aX0I2g
	ZMd7Q7/934NGtsFJ7fR0AXCBCyidOGOhr6YC3PWLzNObLouKYhnuth8RfuKHljhyhrFpJhqX93G
	RICjRiakQWuJ0vlI82ngSEiVIlt4VEWPJeYTLreW1Swy7dnsIoyiug/kW3Ha4F0NoSMO0MEnBzt
	y2/pMU/DmdhLv18+21u+KbKatJSpY4L6KaLlOZM/ZanU3eBD9tEUvoWiSw0eXWTCFk2leyf/msZ
	5V4T4UxUFuXliWlL/5sw3pvVCnMuE2uGZSmkzAhJx5zjtyhLb+IFKBmIBT5OxstcURMcFeeBWsS
	+pa0c18b8po7QyN1BPC6OXtrgT/JN9amlKGMFdri1/iLexMQNGcFNLMWXxyHtgQAOe7jCojyx4a
	hxbCLZhDk5+ZfafDByUi5Rx/2wDxD1clrx3Nm24
X-Received: by 2002:a17:903:184c:b0:2df:3b0c:a6a5 with SMTP id d9443c01a7336-2df7da5d1bemr63157015ad.9.1790372655435;
        Fri, 25 Sep 2026 14:44:15 -0700 (PDT)
Received: from google.com (192.150.203.35.bc.googleusercontent.com. [35.203.150.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91476bb4sm16242765ad.83.2026.09.25.14.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 14:44:14 -0700 (PDT)
Date: Fri, 25 Sep 2026 21:44:05 +0000
From: David Matlack <dmatlack@google.com>
To: Samiullah Khawaja <skhawaja@google.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Pranjal Shrivastava <praan@google.com>
Subject: Re: [RFC PATCH 0/3] iommu/arm-smmu-v3: Add support for hitless
 replace of CD entries
Message-ID: <arbrJYsILS1IPpCK@google.com>
References: <20260925011308.3381953-1-skhawaja@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925011308.3381953-1-skhawaja@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_144418_197413_617996F8 
X-CRM114-Status: GOOD (  22.67  )
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

On 2026-09-25 01:13 AM, Samiullah Khawaja wrote:
> This patch series adds support for replacing IOMMU domains with S1 page
> tables hitlessly, that is without disrupting the ongoing DMAs. This is
> one of the dependencies of the Liveupdate IOMMU support for Arm SMMUv3.
> 
> S1 domains are programmed by CD entries in the CD table. During a new
> domain attach these are updated using arm_smmu_write_cd_entry(). Since
> ASID and TTB0 are in different 64-bit words, arm_smmu_write_cd_entry()
> considers it a non-hitless update and sets V=0. This means such an
> update is disruptive and would generate translation faults if there are
> ongoing DMAs.
> 
> Replace the CD entries by using an unused temporary ASID in the
> following sequence to allow hitless replacement of CD entry,
> 
> - Update the CD entry with temporary ASID.
> - Update the CD entry with the target TTB0.
> - Invalidate the temporary ASID.
> - Update the CD entry with target ASID.
> - Invalidate and release the temporary ASID.
> 
> The series adds a vfio selftest that triggers a continuous DMA and does
> the hwpt replace while the DMA is ongoing. Since domain replacement is a
> race with the translation requests, the test does it multiple times to
> capture the small window where IOMMU faults can occur.
> 
> Without this change we can observe the SMMU faults in the kernel logs
> and with it the SMMU faults do not occur.
> 
> This is only tested on qemu with the emulated SMMUv3 and an out of tree
> NVMe vfio selftest driver, not on real hardware. Following are not
> covered and can be done later,

Out of curiousity, does the in-tree VFIO selftests driver for IGB not
work for this testing scenario?

