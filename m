Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53790CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 13:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U7XVbefYP1T9aC1YC53q5bs8AZBmUU9WkTWwN/oYv1o=; b=aDYxAq0Bb7R4X2xo2itmYSgFfE
	Hk+X6r6+Wz8V0eKfJnXG0sC1Z7+ZGyhTRfSk/uNNvNwyFjq+Q6b42A6sPmyDAEFBc/aJ6MFBx1B0J
	boruJcaHhOTBCNdXqkJm9h0AFnPbQlOaE+AAWmkt0s1m5CyOdwqJgkeUWmtZehvTjFzJIQGY+e9xC
	4gP9zRZeZdgfQd+naGfuqoBXp7MQcC343iHT6ao++BdErXH88a2LkEHDE7eXRKPN+wvDvxH9rOkU6
	ka5mwO6252V+Xc1bhiRPBfo9N+Wvb8mAdr6pkEb0puNdyYtzPCsWBiqZDgyGQH82lBifvVBD7PGVB
	lT9Z5OCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVKY-00000007rJ0-2wkr;
	Tue, 16 Sep 2025 13:02:46 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVKW-00000007rHs-0lei
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 13:02:45 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-8275237837fso321459285a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 06:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1758027763; x=1758632563; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U7XVbefYP1T9aC1YC53q5bs8AZBmUU9WkTWwN/oYv1o=;
        b=Q/SqRE5TjnUhWmqwjrfwYKy9tYRLsCqIOCkH3MwmZWVNEUHjy7EBQ5pgE4BymWlxQh
         EqI5oaXph/NIVmtSLe3+fnJUjj2AjWqEiTaRYdyiJ2HSkvO78BvpA+OdehgAkK42odW/
         hxrICGV6mUyaRMafh8RZcrMcDMYTQlNXhKM6Fj/kNqyOgN72vHDkXBXhW3OxLfT1LWTn
         gNqgAUmLV8CamvTJIL2PjH1PMYa5aBNHUUComUWzyVXdCGQoP1sXcjjMXH30YXgb5Yyw
         XFLTsO197VwtOVCB5Q5g75SLCoA9H1711WowD7quEtE7yS2jR4ZuO26KZzmU3hh0leNo
         xHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758027763; x=1758632563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7XVbefYP1T9aC1YC53q5bs8AZBmUU9WkTWwN/oYv1o=;
        b=rBN43bI3x8eNdTvV/xTvZVwUfmnt6HeO0jdm+ohzWwI3TZNF0O8BFZulRKPtRRfqQ6
         mE2ohZCA/91Q8GmPPE1vXSiLZ7t6jyXUwGzLyu2hq776PQkG5xHqZzso1D3Ej3P1yN9N
         PvwlKIQHWpPLb9hisQT2Hiy5ON/z+93VJftCfUqGHB+NMQqgJk1DPdyyV5XT5T00tJ2x
         2tX5jngogfk9IQi2NJm8uvGdgB2LbDhEIUJycgTQNu/hJd8//f+PZ5PykGeWJ9elu3hr
         mwldBwxlwIOfRnotrw8duY7W82llA+HoCirQ54+CQ9tHL0wXeEy7xXkqEziKs5jFyshQ
         xnug==
X-Forwarded-Encrypted: i=1; AJvYcCXB62niozlrjK6IHXMLoi0LHV+lsq7JMdp6/cd/l0eEf3Nq3I+oJ9hSAA7BZzgNBy/pgeTfzqLJrNqAKSu7UUmy@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8ivZyHfWYGIpKiaIRv/sfEO+DZydjXhH+79o/sjNXX1OjFeUi
	WP07fWIceUUL7IFtAKFxkDrOQP0zrzCzddnPHcX/lrippCDNqH5mWe0ONbxcVqi8Nyo=
X-Gm-Gg: ASbGncuI5TmB9ez4oLPT7vYs38NZw/rSJ6nw6IQxcmQL8i6U3UzgX0UbxYZWceUfNce
	39mZjJAPOSJi3MROaEzadEhA8Hxf8kbTAFwyYMFWJ/xzymPReuRyjz/Zzvc/1TYT+3dEqFBbno2
	INlRQDuytdWO54xc0tqUJciJzqjILWFsKrjzymNpyRT8Myf0bTQXkR9mV2P7zf6m3RGpZ6jAO7N
	v+tWPrssc+aGate/U48D/cjJ8NYGfeUO0cfSNRXI3Hs3FJd+tpNxpO2QbVtoGoe2bcecjYfFLlY
	dGVuXYniiNx5vu5y7euu8BugFeDKPlwGr00eq2ufQA511YhVaZd72VKf0jjnE6M8V3ZwidUw
X-Google-Smtp-Source: AGHT+IGgSNjoagg9mR50jyVvqVknWt7pO/h98DmCtfm4l0bnsXbM49f7ZWlU8/4EiRAMYAi5HACKDw==
X-Received: by 2002:a05:620a:a483:b0:813:4da8:8653 with SMTP id af79cd13be357-823fc1d4cb3mr1861079585a.25.1758027762539;
        Tue, 16 Sep 2025 06:02:42 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-820ce19d151sm932484485a.50.2025.09.16.06.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 06:02:41 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uyVKS-00000004ePY-3X0g;
	Tue, 16 Sep 2025 10:02:40 -0300
Date: Tue, 16 Sep 2025 10:02:40 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Will Deacon <will@kernel.org>
Cc: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	robin.murphy@arm.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, heiko@sntech.de, p.zabel@pengutronix.de,
	mchehab@kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v9 3/7] iommu: Add verisilicon IOMMU driver
Message-ID: <20250916130240.GO882933@ziepe.ca>
References: <20250911155720.180465-1-benjamin.gaignard@collabora.com>
 <20250911155720.180465-4-benjamin.gaignard@collabora.com>
 <vrngq76nnms3jyl5hnxqnkimjc6kil66o6fdyqn5vm3fpovmja@cfynipjw7ktp>
 <694b9ba15cd67f41a38f4a65a3811f035cf8e99d.camel@collabora.com>
 <rt6nvgazcl6mvyy4iuut3n7irf72t7rex2iwabbkuxp7cdvez5@2nanenqgxjdy>
 <20250915225806.GM882933@ziepe.ca>
 <aMkkYU-p2ouknnAc@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMkkYU-p2ouknnAc@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_060244_357540_84117EFC 
X-CRM114-Status: GOOD (  22.14  )
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

On Tue, Sep 16, 2025 at 09:48:33AM +0100, Will Deacon wrote:
> > I would strongly object to trying to share map_pages, unmap_pages,
> > iova_to_phys, free and other iommu pt related functions in some
> > limited way instead of helping on the much more complete iommu pt
> > work. Which is what I said to Will, but for some reason he suggested
> > it anyhow.
> 
> If the answer is to convert this to iommu pt, then so be it. My
> understanding was that was still premature at this stage but you know
> better than me.

We are waiting for reviews, hopefull when people return from
vacation. You know how hard it is to wrangle people to review it. But
the code is all done, it has all been tested by multiple vendors now,
many people have projects blocked on it.

If this duplication is really important to you then you are welcome to
help review it and merge it. As is Benjamin

> When I bothered to look at this driver side-by-side with the rockchip
> driver which, despite apparently being totally different IP (honest!),
> is *remarkably* similar, I summarised the similarity in the default
> domain ops:

Presumably there are more HW control bits in the PTE than just valid
that we don't know about..

> I don't think it needs to be one or the other. afaict, these drivers
> should share the default domain ops and if the page-table code is using
> iommu-pt then that's even better.

Refactoring rockchip into an iopgtbl, and making it work with this
driver is quite alot of throw away work in my view. I would not ask
Benjamin to do this.

This is why I offered the compromise that if he writes and tests the
iommu pt version I will carry it and he can merge the driver
as-is. Hopefully in a few months it can all be sorted.

We can then attempt to convert rockchip as part of the followup
activity to try to move drivers to iommupt.

Jason

