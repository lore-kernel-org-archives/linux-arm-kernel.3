Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D66C7CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 03:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Diic5IFOcgXcVWmgqDsz4OF2UmpW2reWxY9MFp8cl5Q=; b=cjLxPgCuSWGUmBj0sn08lcmZfH
	m7LfSbAcaZFtLyusHxNT05DejHqstX1rKOZLnTKPnixGvBb7dSKf0m3w/L5PIfxD/GGo7NGOyfYkm
	IcLn/zl2iBD8JuxRLPmc4oyUOM8OSYxZYmdggxkYZN+1LDYnbpSmZhplHBe4Bs+Z/Il4rngtFy1UU
	jzuwA/vmSGKWcCEb8xtXxaP8C5zRwO5iBMI56NtzEb0ufrbN4wqkL/RsiLH9AMP48ksKeqPtoOvSr
	IsK0SSg1KZL1lDL87/1MkR+oC0L5iPtsZu9gQ0HXKseLPV8zM50oejpTAjlYZwTnyzyqGMWTBQodP
	vc/kj4fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUFr4-0000000CEJW-1oZ1;
	Tue, 02 Jun 2026 03:31:50 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUFr1-0000000CEIP-0wOO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 03:31:48 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2bf2911f93cso435ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Jun 2026 20:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780371106; x=1780975906; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Diic5IFOcgXcVWmgqDsz4OF2UmpW2reWxY9MFp8cl5Q=;
        b=gCVrD7k2MQ7OlR8LOoq/XmiySpUgwRw9deTPNRwra/XzCQyfdeLwwpSmHkR6AagJJV
         /UWqNmUrreTzWzRqfO6NKdlKYO6sI5mFr2DECuvccAGr2WML2JGYcUOC7fEvKTjyxGRE
         KHH7/bHkhc4Cs3Yds8jmvKL5BlYGt/SaqY8m6GrlUhK7NA2dgYS0z/R7rWzb0uuMM8fi
         tBYBKbrQ/PeujRm1+DsHjMJKE9mOMYntGZUaiSgAXXa5Y8tdMKKzeOHZOlj/r9bZz02T
         51HaPgU9OQHSYmllS4DkT4gjtbP/oKLSMf2rN/Tw70Dch37ioVjmkBE8iZM7zTXtMhIw
         +fWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780371106; x=1780975906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Diic5IFOcgXcVWmgqDsz4OF2UmpW2reWxY9MFp8cl5Q=;
        b=h+ZHpmxfOxN/jT1Cw/PRfr5biABPLTdKoNCGtI8bRzrVCGjopEgMz/JHaetCEUS7Sn
         5DNUXpVmiTbUUFl6Q8HDpg5FwSuXaUVBQ7sBzX4vhcNK00E5hK6RODFXRq2Oa5eeECqA
         K5WB2+RV+MaaJe+tqqMQWjbGjvZuGunXvMpolAKmXhv28SGz1hisuK/OlZEvd0OOPNa9
         /RzujYnRAWJNhRj747NFSC3re8c0TwS/K1gl5rIqPm+/gJbEdkz7KHo+QXsEhFZCNz59
         nfmDCwA8XLr5VsxpnHkhRElsVf8sqTS8IiwBWADtFzWmFVPyXUl/ZJgfRAQRIB15Pkr3
         0K0g==
X-Forwarded-Encrypted: i=1; AFNElJ+spt9KCx7wHV1Ipx3c2iXgEbR+P1rM+K8fwHUFd8DAmevRpTU6EyW970jfA0wZ4C1C13+oxsE/d3Kj0Gb2JNEK@lists.infradead.org
X-Gm-Message-State: AOJu0YwG8VcaOllFbOrLNnwjroifmfuL9guy3/ncZEGR/SySNCoGbQco
	hSwDJboWDXJw6wbnwYIFuToBzKppLDOjkd3tDZp5Kq6DqZ+NhAdzYhhDOnoySHyPnAA1TUm5ZC5
	s845k+Q==
X-Gm-Gg: Acq92OHFZXJBilnfYZP88JX8FykisoH/obUDGdALDBs2YJp4M9JfVULMEC8lXPizSXC
	zHX+FlC9RvhwaARl0+iusHFM6+XX+JBDm4DSH3h2mDoKucCMUAakGUWNDWvgeU9eyFtHYMSZhH0
	bpjrhZThFEvKlxQd9u1h7vEkr+oAqKLIhBgbG2vmiTXBqg2tn4ciwiGPOlMfpWwrQxvtuynK1Ji
	ZmcKzYz3Z1x8NVAYJB3vZ+rPCp7U3WQMcHKUWisJerSyJcr6/CTGM7Echo/XOpNfROn0Lgyyxxm
	n5rMGjF4fw1gew3Cb6xpE5hXdovRsszLeXwjE+09TqoN9hssyV+T/TRpIay0OgrOlDfcColroeJ
	L2wYIn4U+gzPw6EZURSnWcHgKnRGJxducrt45APWsp8pjlqSP0Ntjl1gENHfgr1HgdQTNCTsLEI
	ZG/CG60CdQ5OUNXFCQyUl7ofhkhK+LKKHoFGf13bE2Gp0wUsda5whOLC1gsFs8SOULbnrYf6E=
X-Received: by 2002:a17:903:2c0f:b0:2c0:c14c:bf37 with SMTP id d9443c01a7336-2c10eb100femr2152345ad.16.1780371105574;
        Mon, 01 Jun 2026 20:31:45 -0700 (PDT)
Received: from google.com (199.255.142.34.bc.googleusercontent.com. [34.142.255.199])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85770b9e2esm11379046a12.0.2026.06.01.20.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 20:31:44 -0700 (PDT)
Date: Tue, 2 Jun 2026 03:31:38 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v8 06/12] iommu/arm-smmu-v3: Handle gerror during suspend
Message-ID: <ah5OmlcgW-oP9WDc@google.com>
References: <20260601215909.3958732-1-praan@google.com>
 <20260601215909.3958732-7-praan@google.com>
 <ah4gq5NzuW90OyoS@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah4gq5NzuW90OyoS@Asurada-Nvidia>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_203147_287176_4F442C63 
X-CRM114-Status: GOOD (  11.25  )
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

On Mon, Jun 01, 2026 at 05:15:39PM -0700, Nicolin Chen wrote:
> On Mon, Jun 01, 2026 at 09:59:03PM +0000, Pranjal Shrivastava wrote:
> > @@ -2300,9 +2300,17 @@ static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
> >  		arm_smmu_cmdq_skip_err(smmu);
> >  
> >  	writel(gerror, smmu->base + ARM_SMMU_GERRORN);
> > +
> >  	return IRQ_HANDLED;
> >  }
> 
> This seems unnecessary.

Will remove,

Thanks,
Praan

