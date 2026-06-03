Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26060CD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 00:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LHu0GHEmte9bNVYdHYkwG9CA4CfbBZuMIjXj0kPY41Q=; b=EWRGWq5ESnKlXpWBNtdf0gZY2Q
	awXpkDC2QLvb9v+P6O3wHBQ5OoSDmHW9Asc4q+4QJoRXXpy27nxhNYmrNITq9cC/PGMBnR9c5m/PY
	6n5nUQm1v+C5F+37yeNWJ330m7/DNX0TdRBT/vqDhN4CRTFx3jgJu1qUGVPTyY/V7NIYcGa92DQnE
	y2b9pcONRbI1q/6+qSe08aNsroJrwWnSKAClub3ZMm0nimyNluwxDYnR/R9HK6la0hnP01078qXCS
	ErJNbyYndZjInFlVhOKzPSeJMGWI3L/359nWIBU2tw99j8TZKIuug18Ow9C2OZe/Wye+M3+0cxiq3
	RKDBtkbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUZx1-0000000E100-2rcP;
	Wed, 03 Jun 2026 00:59:19 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUZwy-0000000E0zS-35u6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 00:59:17 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-8cce26ee1e9so80755226d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Jun 2026 17:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780448355; x=1781053155; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LHu0GHEmte9bNVYdHYkwG9CA4CfbBZuMIjXj0kPY41Q=;
        b=XJQhhPM/5yKD5m91LvLkDMd43vDMXUVAYS6FOfPh+8hVZNMxU6NFLYgpajB+iFU8wQ
         G3ilk6up6F7RXcd9U8QaNyWgvLB/siGgaPmR5RZvzGUIz2ZpVtnoa8lwPiEe61K8qvNJ
         KZT13CH7sea9k5nl2YsmVfBJ4BRbXRqyii1PzhxLbi1LMjrvCz91hZ9UoSs50fdyOdua
         d6TikpMImA00b0aQ3QuHDL14bzr7gi2chrGS975SD29FzO9hAWJDRJnU8Qe7+y/kHq6t
         nmJxVjjTTBWMJx7WZyfWJi3G/BddOGcuBm+j7xmpxst04UzijvmYqkFUrWi4LKMPpY/3
         xj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780448355; x=1781053155;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LHu0GHEmte9bNVYdHYkwG9CA4CfbBZuMIjXj0kPY41Q=;
        b=SgGBRYSaQ/DSawf+t4buZzGoRroQJxwQw2TqwGeMHvCaa97e6nbKW+JMfd6gBngb9X
         9xZjylxqCSdVEntiO2Hr9FZQ8g12mDO/jJYjmqYf5kf+KwET3lqBgTzykBBaykQ22Dgj
         dwFMaycxH+q6RUQnrMtw255/fvn912eaKqsm6qrWL5ow00i5yXpGeD9Od24C0QcG2mQi
         61Ko1AciGpS5gJImJ1YTSDMi1WXMHvNrAXZVdevEbmvR9yg6XinsoJ+UJgTq8ZXiL1Fq
         p1EdxbA+83ckLf6KS8r90zsI0inqdVYbKh6ZKgu9+KUAcJdlV+yD4axx19ZeUENDQLWX
         XmSg==
X-Forwarded-Encrypted: i=1; AFNElJ8D8iwb6mtl0LLMorQSgocV1xblE5P7+2N2yqx6TqxFGoXmcYeBwWf5nAEzyy+mOQqusZL/EuKBVVd7jKYri5ES@lists.infradead.org
X-Gm-Message-State: AOJu0YzptpdFAq+d7ANM8ZalwYFFgbQKNWsz+9qptYlI4u4XRaRq52/l
	Y2E5tGWgTglpbdr6wRQ81/vX52gdwMghIr+dCLdw2I6BCSDSxEzFsbWxdtEuw990aq0=
X-Gm-Gg: Acq92OHcK+tKPei2juvj4kRJSPDf++s0qJT1NkMlczJy3ruERKTGNT5FP8hbbStPgPY
	WvvnPrlBoGwWHg1/jH7Wb6fJByRnbqfhfgVdaLt+3gxebVpR4/d+t97FHySFDRvph6E/ypRzluV
	qMlEmxsQqlQPqRnCXbHtKrCRNd/xm8T9xZfugzOnJVrcpC8unAlgiKACx2tbN6GmXaR8CvWud1/
	lAQ5EQhzy+8g0JtvXb5alOFcH4FEiSNtjJIE+POUarMYa4V4jQ+OaTOeyLXD23rKWk70CMfFHQq
	30o4aeL35xtccr9/hNdfDwTV7bVfOg9zPu5kM6R2YZ1E3DPdHbqW7/T/M37Z6SE7qG6wpnAOinU
	yPjNRlHDYYXx+EosgOJtReeiAQsPEpE2qtKoVGng4dL1J99An/6sB8HeT8NT6qCECat3OETR34R
	RwEHsKpR/vP/tjRIDKKo/rfoX9OVLTxMCvKT5QPIUj2sK6GsItJPPKBYzUiyR9mwSDi3NYIR+5x
	NIwl3mlxPgRmDiU
X-Received: by 2002:ad4:5d42:0:b0:8ce:cad9:479a with SMTP id 6a1803df08f44-8cecde9cef5mr16020226d6.15.1780448355181;
        Tue, 02 Jun 2026 17:59:15 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd0535b0sm6677916d6.28.2026.06.02.17.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 17:59:14 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wUZwv-00000004xMg-3Yl1;
	Tue, 02 Jun 2026 21:59:13 -0300
Date: Tue, 2 Jun 2026 21:59:13 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Will Deacon <will@kernel.org>
Cc: Ashish Mhetre <amhetre@nvidia.com>, robin.murphy@arm.com,
	joro@8bytes.org, nicolinc@nvidia.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 3/3] iommu/arm-smmu-v3: Issue CFGI/TLBI twice on
 Tegra264
Message-ID: <20260603005913.GN2487554@ziepe.ca>
References: <20260601104845.995005-1-amhetre@nvidia.com>
 <20260601104845.995005-4-amhetre@nvidia.com>
 <ah87dzHOOTNGBBmt@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah87dzHOOTNGBBmt@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_175916_781248_1D312A6C 
X-CRM114-Status: GOOD (  13.16  )
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

On Tue, Jun 02, 2026 at 09:22:15PM +0100, Will Deacon wrote:
> be inspecting the command array in that case. Generally, it's a pity
> that we can't handle this all a bit further up in the stack when we know
> exactly what operationg we're trying to perform, but I suppose with all
> the different users of the invalidation commands that's hard to catch in
> one place?

There was an earlier version trying to do this and it was pretty ugly,
there are alot of places because this errata touches the CD/STE
invalidation flows too.

If it was just invalidation it could have been solved by manipulating
the invs list and be almost free on the fast path..

Jason

