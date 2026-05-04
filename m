Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47467FF886F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 12:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NU4R8Qu0lIhzaFVACH0M7ebEyvf+bx2epSGVPFsYcB0=; b=Nxut/DSwiyIeAjgTV5bLX6k9jk
	Ll+tXKMBnhQeHDGXen6apfi8kZHhcCtnrrPh4laiy8HaR/TZdv+c4IavpF7N88HbUzk7hlBiDR33S
	5NvWlA+coZXcjmiVfkGwVoVl0IhcfWPGuWX7j2RP50l/0VXJz7L/wdPa679PGCuGUu7R1LYMZq0CX
	r20b/bTKNWL91br1DOoVjnxpmk/xyLW7GqjCcnn/TfMc17jEbiyVRJGb7BeCzX4dx0v8I2GZEBuzN
	nTzjnZSQBQW4WBdWarQnCREfHqj5voOeNuYxN1yaWTy2AFbOmgAYQFSu2ySUCehiKvH9+imecl2cT
	KzcU8y0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJsDn-0000000D8OU-0MzS;
	Mon, 04 May 2026 12:16:23 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJsDk-0000000D8Nf-273R
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 12:16:21 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-488940ccfa6so170765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 05:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777896979; x=1778501779; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NU4R8Qu0lIhzaFVACH0M7ebEyvf+bx2epSGVPFsYcB0=;
        b=BuhG1gEEO+LsAov/1FO8SJOVriQlAJ1ysaZ4fx9bOzNMqfctuzcrcHbfQ5nzyo/rqY
         RhC4zYmYgfvPW20P6EczKZHBChACLU490m6C0JD5n2VszaVXp0k8tqZTQVp3oBJt/ns9
         swySe4TmpOX+yQ50EKOhbZ8ptkGdYay/54gP/FeQGvJDzp/N7rIcgxBdFV1BVO5YP332
         k7Nd9Jp0+l4z3rZI28OYiFKofwLNHsNz/9Sr3/Zv+O5OkguGit6wwydo74AVv8W5zSft
         8gDgDgkAJ6VYqsYJv9Lx7g/+IxWT2yETURaLvM2jIAnRp/YmcDzLSGWlHpKQ3G8kl6AW
         7vuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777896979; x=1778501779;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NU4R8Qu0lIhzaFVACH0M7ebEyvf+bx2epSGVPFsYcB0=;
        b=QeUH6Wec3sccghaNmuUARk7hvGsq/bD68RTOYCBpHQ89ETHGPy76huyAW+0vJjHaNz
         s9yGF4lHgaBAoHWhvC3ToOr/OpTrdtLigCd61CZeoK5kKz7ZLeQsTCKouGbT3ZHAdJmp
         K3TU9/28zObG7JNfSOq00PvGefMEhWimd/CWXhgI6Ab2DZcT44xdz3EtX9A4I3pd4p5k
         4qtyWcplwKkuPbRl6J/YJVEosXFBliVCmiNwxSxQjx+CfwAFza3Im82F/uyC06qDGxLr
         qid3FWbXdIK9WdruP3SnYr925ZTapbOAMhXLb3/3Z8J6bnvXL9k6hcaFHQs7ccvZi0WZ
         MtVw==
X-Gm-Message-State: AOJu0YztiF0zIWvgrv7KYl4VD26975cnXrgeSLLLBEDm3mzOxY9+b5G+
	kT8x0dWhek1tSnJ3pME93CIzyfrPnpMOE1sQ2kleadAPcEK6vbPARWH9qQSLPl+2nQ==
X-Gm-Gg: AeBDiesE0/g+jT6D0N7RspZVJat8dL3ZIfZqDJA1qu8czWtcS+YTSTgeV+ZH1x1h5e9
	WgI8xwIJ8rqVmVFkWP4XvAH2q3YXP2KbMEdaUXIY/LbcfRiADQ8rsIsCrlLIEEzWHFwX5MBxAN0
	BDMerxoQXSTuCVT29EwLSgUgMLdwl5quANkgXm8NmZkI1z6G2DEwZyu/eKVLo37Lrs0Z+h2cZWb
	azI4vZ+MV8FA+0Lu8ZUmGpvlFAd5qCBm8H4XpYPSQiCL/VdzhrDf9v2b0cNaA0O/kELlvr0ILJa
	i+HTgsUYaquIYek14Boqq1UDNP74Eqlj8TmHNxnsxB8T3QZJRaSp5kfdoUrK3XSrdj2Vy3NnEte
	3Bdrvx/f4Kw3x3pxcQ0RRyG3pI8tnyUz8Wuw+VKrQSO4cwa2D6Zan6XqgL9HGLk/LEpffFhPpXo
	shZ7z4xjiBtVnhunMvslINKxXUME69Sv+ASMmeptUR3gIbgnny1z4HZFr+KCpGawje16rV0do30
	I8GJQ==
X-Received: by 2002:a05:600c:4e8d:b0:489:1ace:d0d3 with SMTP id 5b1f17b1804b1-48ac3159bbcmr153605e9.3.1777896977198;
        Mon, 04 May 2026 05:16:17 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a8ea7cf97sm29764334f8f.6.2026.05.04.05.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 05:16:16 -0700 (PDT)
Date: Mon, 4 May 2026 12:16:13 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 05/25] iommu/arm-smmu-v3: Move IDR parsing to common
 functions
Message-ID: <afiODW2sVMeOj3Ag@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-6-smostafa@google.com>
 <20260501124716.GD6912@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260501124716.GD6912@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_051620_593513_91F5B2AF 
X-CRM114-Status: GOOD (  19.04  )
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

On Fri, May 01, 2026 at 09:47:16AM -0300, Jason Gunthorpe wrote:
> On Fri, May 01, 2026 at 11:19:07AM +0000, Mostafa Saleh wrote:
> > Move parsing of IDRs to functions so that it can be re-used
> > +unsigned long smmu_idr5_to_pgsize(u32 reg)
> > +{
> > +	unsigned long pgsize_bitmap = 0;
> > +
> > +	if (reg & IDR5_GRAN64K)
> > +		pgsize_bitmap |= SZ_64K | SZ_512M;
> > +	if (reg & IDR5_GRAN16K)
> > +		pgsize_bitmap |= SZ_16K | SZ_32M;
> > +	if (reg & IDR5_GRAN4K)
> > +		pgsize_bitmap |= SZ_4K | SZ_2M | SZ_1G;
> > +	return pgsize_bitmap;
> > +}
> 
> I think this should include:
> 
> > +	smmu->oas = smmu_idr5_to_oas(reg);
> > +	if (smmu->oas == 52)
> >  		smmu->pgsize_bitmap |= 1ULL << 42; /* 4TB */
> > -		break;
> 
> ie it should return the supported page sizes by inspecting all the
> idrs and don't leave this tricky bit to be open coded..

This way was easier as each function only returns one thing, otherwise
we have to pass stuff by address as we can’t pass the smmu struct as it
is not shared between the drivers.
But no strong opinion, I can change that.

Thanks,
Mostafa

> 
> Jason

