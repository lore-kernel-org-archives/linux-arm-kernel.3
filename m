Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD29CA5FAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 00:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCH2PLXbYkrNsME+2zyrKMJYI/Q00cD/tf6UVMp0Gq8=; b=4j1E/ZAjSBxhTfmzhYnbqwXkDf
	o9jXdAUfDQRgikM/jY0lhVleEOWIlwLNJ3nyoB7ee6YyNmDv1TyLRLq206jZsNP2HgWxzwgEu2vg0
	5MbKRNv5j1unzBehwwtlFUZ3Xwejvb/rbBzicnJ7W/m0GPj8ZJ/jQz7ts/sSuRb8XS05GcL52gp/O
	T7IeloAd+XDKcWNryCPJA5GhSqSzk6+fuOHbct1rl5yiLQAtvzHJZfddxsw/nGZZwNTQQFXUxiLvn
	aUVdh6AJp0+dLrG0laEYK5EguBVvAVd8LkLgzhHyzS0A3tc5wBMbsjNGkBSYzraoBnZ8PA0xBEmzN
	nZys0ufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBLIz-00000001vwY-1q9h;
	Tue, 29 Sep 2026 00:02:45 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBLIw-00000001vw4-3Pw3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 00:02:43 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2d8facae850so18575ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 17:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790640162; x=1791244962; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DCH2PLXbYkrNsME+2zyrKMJYI/Q00cD/tf6UVMp0Gq8=;
        b=eTcCM1Xs6jUHBAmaNGPdxHK2Q1gOgj5PNGJmIpky9FkyFBr8liO5A7MRJpO2VdWfzv
         VtCZRCOXAr/GmcnKScMh6I2qq78h+N2NRJqX911NhlxC9vzhXbWbheyg3N0FpKFKLe4d
         uid0L9Yf9MhyNPgDAd4Bk058u6nZUlyj5GtG0dmh6jiDyXlIjUc6YXXpXKJYoij5CsN2
         yADApAqGR4Ak2kKU7/SziM6FX4aTxK/7xxmN0jMM0mY7r+5e3fb4y548hfYeOwy7arya
         TEzruYQcUmNIGGxSH4JLoZg34u6EoAu4iVZDqacEIukjscetSsQC7y6eQaDVpvwgC0zZ
         C3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790640162; x=1791244962;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DCH2PLXbYkrNsME+2zyrKMJYI/Q00cD/tf6UVMp0Gq8=;
        b=jdMwszpVOU0lMzJ4N26sG0j3Jc+9175X/9W32gyJQ+G/aGXszXanJvYw75vidZKJXv
         iyDSyBvkzux0N1j0a1pCfPo9xEpd9YjKRllZtUXmeSLP8098FJs8tfdz0kYWiXb5nxDr
         LGjqNY4hE3kfnQMvA8l7jWsXrXqiO+n3OIPF2XCLSFG8TymzVG9lW3GNNdAzelGEAOZ5
         j1tds4ek95MPJjsLHtsBaD2FdhyQ3z1qlLhYyA5aXk8OTcuqNUFfxbIHCB2iR6QELBjR
         nDDAT4AdxE2t/w2PnXXgXubw8DGxmqMKTZq09apPROl5aTzX1JBqikSw1HCG4HPU25aK
         jgWQ==
X-Forwarded-Encrypted: i=1; AKwUvByslUX5QnQpXhmaXpON89cSIFT6sQOillJ/xBy9D8LYvdypGt3PW1/FkhCgQOD4464gIqN85h7IN8t2SFrOMXAq@lists.infradead.org
X-Gm-Message-State: AFq9FYJ1aLVX7qw53RLHocqrrLlszKMF5+2hVG7D1Tk8/J3gZPPS5/hl
	3qESnEAgtu2giu91XI+tukMpxxB29ocWonk4g2vuytEhCd6Mjt6IHMiFNB6GHCSAQg==
X-Gm-Gg: AYBFou3QPIdbipbp94tNY6pIHiD5ye2+OdeSqToCb5ZJIYdbwMb74fA0OpkRDUaZCY0
	dqbTs9eFQmvBP8Ql8GE2sW1UZVgwF9oDus3xeyzCske+n+oSjAKWCZJVrNYhFyRhA6xPlKhlq8H
	9kLE0ogX1WwGskOJJdm5j5t61vYkwBTL1UREqw8CbLJh/cJWIF47rdVA2y1l06pkQJb5Y5AyMQo
	o2ehGixq2/4Ibu9e5Fmz793VFA94VqjIBKaskRuggwE3SDLgaOT4VjQZwPOtSG0whVF6x8/ntbL
	4YbMv/lDXqbgpte8HP4xWTVARGF7yT7awmKNI2cuq8Exjd+HdQ8GTZDDDrhdOo6QGGe+6TzIlSD
	AfM7s68RDxtnIFe8yJCPtAAlnqhOYcc7J5v3WbCgfxFAbK4mtBGfWX0KsgJbl6B5fE9sWGkF43G
	N9MX1p7G+rGVBVEHkxqt9PaqnQgvR9w24EQImWoQbyY50u82Eb9mIRBwt1MY/HEC9ihrs5zAEGl
	pDLUnXiClfTVK6OwwiHwitLOvDqe3/ucD32OmSYR3aGTYU=
X-Received: by 2002:a17:902:ce10:b0:2b9:e831:5e5c with SMTP id d9443c01a7336-2e2c6307fbdmr1665605ad.4.1790640161333;
        Mon, 28 Sep 2026 17:02:41 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fea18ff85sm4796244b3a.19.2026.09.28.17.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 17:02:40 -0700 (PDT)
Date: Tue, 29 Sep 2026 00:02:35 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, jgg@ziepe.ca,
	nicolinc@nvidia.com, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 4/5] iommu/arm-smmu-v3-test: Fix OOB in
 arm_smmu_v3_invs_test_verify()
Message-ID: <arsAGwY09NywKcqK@google.com>
References: <20260924085616.300650-1-smostafa@google.com>
 <20260924085616.300650-5-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924085616.300650-5-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_170242_858256_DCEFDFFA 
X-CRM114-Status: GOOD (  18.69  )
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

On Thu, Sep 24, 2026 at 08:56:15AM +0000, Mostafa Saleh wrote:
> arm_smmu_v3_invs_test_verify() validates the array bounds using
> KUNIT_EXPECT_EQ(), which triggers a failure and continues execution.
> If invs->num_invs was smaller than expected, the next loop over
> num_invs would blindly read past the end of the invs->inv[] array.
> Switch to KUNIT_ASSERT_EQ() to fail and stop the test on bound errors.
> 
> Fixes: 15a2a5645ad7 ("iommu/arm-smmu-v3: Introduce a per-domain arm_smmu_invs array")
> Reported-by: Sashiko <>
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> index 366dcb2b5554..244cf34e5a0b 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c
> @@ -643,7 +643,7 @@ static void arm_smmu_v3_invs_test_verify(struct kunit *test,
>  					 const int *ids, const int *users,
>  					 const int *ssids)
>  {
> -	KUNIT_EXPECT_EQ(test, invs->num_invs, num_invs);
> +	KUNIT_ASSERT_EQ(test, invs->num_invs, num_invs);
>  	KUNIT_EXPECT_EQ(test, invs->num_trashes, num_trashes);
>  	while (num_invs--) {
>  		KUNIT_EXPECT_EQ(test, invs->inv[num_invs].id, ids[num_invs]);
> -- 
> 2.56.0.rc1.315.gc6ed9934b7-goog
> 

