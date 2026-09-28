Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A91CA5FAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 00:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kp5ei0/iKnj9mU7W/OT7FmtL2iwT8AA400ktoI4ALho=; b=LaquhKDHU1inVmzlIjFDFWmUe2
	DacbFMR44+raGnTgFi1OxFBOcd7NYXOe/LcrGIIZ/OS6KQMSGGu3bjq7sqk/GZRqcnWVN35KqALtv
	55rbSLyPJ20PezcFaFQBsWA1efodXGwKRsooT5a6Y++pN8OD6Ps15M0SAJL5PL6n/EeByWxGOkVjb
	uk0v8W95Nz6jsEhNW31G2UGtEl76sG5hzXogb+4YpTu2smgpHEk+UgvBL0EM1S2OoroiR/7Tj2kM3
	dL1ifZmlc+iWSlFdcUq9v5fqmxVb2Miy2QeXBlNVYx5I+3azO4ArnWwhB49FRiA4WsWuYWmi8UtGY
	Q4Xggq0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBLGO-00000001v8w-10l5;
	Tue, 29 Sep 2026 00:00:04 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBLGL-00000001v8O-3x4U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 00:00:03 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so9615ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 17:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790640001; x=1791244801; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kp5ei0/iKnj9mU7W/OT7FmtL2iwT8AA400ktoI4ALho=;
        b=iA97vbyp9IP085FFxu7C5tOI66+pKqQx+WR+L0CQFjweUiURfGNOGbahRSHRBrtzvG
         pJGHsY2ZdDAoO4i5YuafJW/feNCtoj4PzBJVc03wImc6v28ZED84hEpDUwx/2CMhm2It
         dF7HfBqhuXWTkH3K189O4z43MDOUvhdslb+bIQr/qCSJuzCkT8FB2P4Wg9Zt6i5D0ik4
         mPCm43ZEf1085G5CRLlRHKDidQvL5oDa6J21NonxfXl6TmakKFEjw0k/8oa9nkNImzDq
         +ICyZ9Sy58TU7TwfIO41n4PZ4nEsbGUa0i3AdQqbgAq9gk+Q5+T6w4SRQeowZQp0opII
         FXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790640001; x=1791244801;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kp5ei0/iKnj9mU7W/OT7FmtL2iwT8AA400ktoI4ALho=;
        b=DCvUkYyfud5L1IeaPLdF95mfbusH2csA/hgaaCKVAdwdNZhLxBGjccuw2BE2nH6Pjd
         bHh0wMz6NpysXC23s3bFZWBORQ/GZX0EqlR15bzgQbB4lC/nOL7ETdHZihrxi2l45E7q
         r477Gt072OC9XtyRDy+2W4+XtX2xxgsR2ZuPK1YvuqwwY4Vl5nusIc+QNhNOvjLOYfjz
         eRAB3EJfgMpYHmfgIBqxHpwDtJ3aEqIpypVzJWki4enLtpArjsT/XtZ5ObsiOXnMQWlD
         fUWJglZlQzGj+2EwtSij1Bc7HCq1lWBfwmPbPqi1coKYSqfc6/yClhU+goy5BI4sZeXy
         wjyQ==
X-Forwarded-Encrypted: i=1; AKwUvBwVWamBz1YH6L6dnHmfzEcgU7LdIv+bEyqoJUmwDUNyr/EYOpnlOcQcKCPiH8Kkow+FvchLBNkNAmjEohcsUqBU@lists.infradead.org
X-Gm-Message-State: AFq9FYLMRrBIS851Ys4Bw7RvmXVtdK5VX5dRR/CA8i9i3H2jKquBvx/2
	LidGtP9XERGAqjrQ5sngwFmckYFHGRbE+eGb8qaQikcq2YESVsa4MtI0NH5FLmIlOA==
X-Gm-Gg: AYBFou3luulXCurigzWJLOHc4YPG68cOmzuckZmKxiRjUU9hpbaro+mQwTrEgIkL27q
	5qaFWIyLBXlizpXbml74rJXYWhhTcr3nd0diWBysGoqj6+amN+YucuJfFbIlSgN4UohmmxCitL5
	P4ZHw7IGL75SfPrnKbNTXEBml1N8jVPp0y6zgpvtVSQKmRg6JE7S6rWTjHz+fo1g447MceCv1ID
	ouG2nyhe9CPyIlxNMpNRV1Kwr25+jejuDBKAqCOjyXLSohtLrVYByknj6QuW3+5JeW9a+pJFhGc
	U9ec9/OAhebZiZjYbco5tmDb4MFyQEE2iA/hcwQ9YKpnuyPjfYQq5aTPlprFcAK/7f8jcVUoRMg
	qdXy2tdcOeUDOwsPoIbnjDYYM3V0pi2CQ5decD7FdXF6MtkcwFeD/EbNyIs1udTqP24JAtfSO8J
	IEU/KNMtWk9xVp9I8Iy/nNaMIdMg52NWDvCVQBJtJ4/hio+6v7HlEkoIyDdoUQrAcW3DVu0afdJ
	u/Ocx+ygn1yg3CbdPgqNvOY+z1SedzdLhJ4
X-Received: by 2002:a17:903:2b0d:b0:2c9:d89f:fd98 with SMTP id d9443c01a7336-2e2c608146fmr1652085ad.1.1790640000240;
        Mon, 28 Sep 2026 17:00:00 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df91444797sm47124675ad.58.2026.09.28.16.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 16:59:59 -0700 (PDT)
Date: Mon, 28 Sep 2026 23:59:54 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
	nicolinc@nvidia.com, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 1/5] iommu/arm-smmu-v3: Ensure L2 tables are visible
 before L1 ptrs
Message-ID: <arr_eqQJtOAIT4Pd@google.com>
References: <20260924085616.300650-1-smostafa@google.com>
 <20260924085616.300650-2-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924085616.300650-2-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_170002_003088_0D0F81EA 
X-CRM114-Status: GOOD (  12.70  )
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

On Thu, Sep 24, 2026 at 08:56:12AM +0000, Mostafa Saleh wrote:
> Commit 6fabce53f6b9 ("iommu/arm-smmu-v3: Add a missing dma_wmb() for hitless STE update")
> adds a dma_wmb() to arm_smmu_write_entry() to make sure stream tables
> and context descriptors are observed first.
> 
> However, STE L1 table descriptors are configured directly
> via WRITE_ONCE(), where before that they were zeroed with memset()
> inside dma_direct_alloc() then written to abort in via memset() also
> in arm_smmu_init_initial_stes() without a barrier in both cases which
> means that the SMMUv3 can observe the allocated table before the
> written descriptors causing it to fetch random data.
> 
> Similarly in arm_smmu_write_cd_l1_desc() where the L1 CD is written
> after dma_alloc_coherent() with no barriers.
> 
> Add dma_wmb() in both cases.
> 
> Fixes: 48ec83bcbcf5 ("iommu/arm-smmu: Add initial driver support for ARM SMMUv3 devices")
> Reported-by: Sashiko <>
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

