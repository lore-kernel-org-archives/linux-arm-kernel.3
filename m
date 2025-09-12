Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BA37CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 18:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i6r5BnwccM40MN1CW61UawFe6hxRBJLKBNylPutF2lE=; b=xj57+Knt9I8bBkycvUfre5PFrq
	57PIAb8Q7tD5hwbgSVjH1eqgHkZWR+HSmVkRuz4vOy8VTNRdDxQGI9+QoCRo2I6CV7kNuW0IgIqe9
	ERQXlsWYSu9AdBLyLqBuoXkaWc8IKA0qUkuKkaFzvyF8/4vy9J5bQpeaYhUukjH0WmTkfwTJegNaW
	zwPRY6mcU+BMV/VVQhCGjHtbnVWLyjK4s2gm0fxn+HRV//+y6leaanIHvPGC0MXpU2ZnN8Xm5/7xD
	vwysEqHL5FrSOBSSuUZRHvaDIPFofmbuNOQ/32osWTLEdX6U1hTJKiJnYlIXUFzre6b2LAPbEhFk4
	P0uEfrAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8Z8-0000000B0VB-3YOS;
	Fri, 12 Sep 2025 18:32:10 +0000
Received: from mail-qt1-f179.google.com ([209.85.160.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux8Z7-0000000B0UT-10B8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 18:32:10 +0000
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4b33f71bb1dso30513521cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 11:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1757701927; x=1758306727; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i6r5BnwccM40MN1CW61UawFe6hxRBJLKBNylPutF2lE=;
        b=XFITn3/ondxs5g7OpXxPN5px/Pt5AFv71jvfi2NVQ0nNy0QEAbd/XaM1LXPJGE6WMm
         Tkqr4gEF2mZs8zlnOp3YLSNClTp/6lYY0nz07wvehRHZZb71nLiyacfFkZzoOKGB96WZ
         EkAhlKDuGo6uEYsNSfNR/38hq4Czp1ar4t9Cl3r+4VDXqtG/oyQ+duio8Sqk9R9n6oaV
         48fyRoYnJl1GaS35J4NFhIN1pszb4yYxvQf7odfEKNIryV84eHfQdfNhX93eYEGS818q
         xypPjScW65jdqaRvGd8oLRzXSGqg92fbFTUqOHERbrJt6DXD99tZO3+J+LkB5fCYPBji
         8IBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757701927; x=1758306727;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6r5BnwccM40MN1CW61UawFe6hxRBJLKBNylPutF2lE=;
        b=T+wDB/0BOfmTnIPPnvWXTnx63QOWMKEL/M6N+V476wnWFWeKzZPlrSX471Wq4eRnnm
         mnP2wzFpogQ7p5e8nbfyyLFwI9PDn5jyTuJUj6uW9ZeQkbqEb3fv60/OFKSrV18N0f0k
         YYSJs42yVOWRQWg3xqTMyBRxfjVAuVPFyEJ5U5z48gU/RAk6kt27oh5QICRgHSqxW5hZ
         iB0124A1l09YHNL2etzCJerWmxdS/mg6Xpd6GxuwKIzd7Ih2Y10+csO0PWHvekgCokp/
         iqgDGOnDkemdXzqRUe4e2OOoUzRf36yhC64W/dlBN7tGT93X66OkLmkoZxnb0KZ7ZpIZ
         GbgA==
X-Forwarded-Encrypted: i=1; AJvYcCV1cM28/Ph4XE8nSmQWHBLDJ59zgR+pA7hhjhQegr8N2MWR0z23utQj/Le3+1ohDkfzLEVu0zHnOxrx/W5/cVNj@lists.infradead.org
X-Gm-Message-State: AOJu0YydEf+FAplV3PKju0aF4PiHp5pE6jeY7d1Pd86NQcYRuSkUEwLW
	lmiIvvxfifGwId4mYUCch7xIzM1nccwH47aqxYIZ5N9yC7in5brzDMi7nZEWoyKvNuM=
X-Gm-Gg: ASbGncumFZIE06Sqy0gAgJrnjtWfiLK+4n2QybqlIy+iUOwy2ptbQH4C2ptdidWy5Og
	U5pQk5e+EzgUR9uMt31f/faAQ+EROnv4wzD1Qgb1Soj/OUxB9y66mxLw+f+oM/363BS7XhKvpmT
	9nT5MPSRR9xMPUFsJ2I5vsOQyloorjmYtj1D0k4StpKRPk+DHIHo12KtD2FpxOhQECrc0SOl1/D
	IVUqeqnVjSbXi5+CYvZyM27lIUCZGMH4ulAWVZvuukC/wEbTbntKCYnwzhLOQpHf9UbxQII4n/j
	xLMoqFWAKEpLg5vSGa5Betxi/BUsKyTJIDOGZF9goPQcQeKBXPl2fV9WpoFb5cDJAMksoD0A7U1
	Dj4W1qdyIlpKe3NHmSiznF8KPZJ3hafYQegKVFRNlZfpoycwH0WIUpkx+k0wL4/ka16ZzZUInrd
	OkiBw=
X-Google-Smtp-Source: AGHT+IHZhwwJ1GAAakUbDyWBchcEmOdwvmn5VpYqCpYR267goBUbd6qsiAamIt0D50PzjBgabwMTEA==
X-Received: by 2002:a05:622a:2c7:b0:4b5:d6db:eea1 with SMTP id d75a77b69052e-4b6348bd37dmr127954271cf.39.1757701927559;
        Fri, 12 Sep 2025 11:32:07 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-820c8ac45a3sm313988985a.5.2025.09.12.11.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 11:32:06 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1ux8Z4-000000047N0-0oCq;
	Fri, 12 Sep 2025 15:32:06 -0300
Date: Fri, 12 Sep 2025 15:32:06 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	robin.murphy@arm.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, heiko@sntech.de, p.zabel@pengutronix.de,
	mchehab@kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v9 3/7] iommu: Add verisilicon IOMMU driver
Message-ID: <20250912183206.GH882933@ziepe.ca>
References: <20250911155720.180465-1-benjamin.gaignard@collabora.com>
 <20250911155720.180465-4-benjamin.gaignard@collabora.com>
 <vrngq76nnms3jyl5hnxqnkimjc6kil66o6fdyqn5vm3fpovmja@cfynipjw7ktp>
 <694b9ba15cd67f41a38f4a65a3811f035cf8e99d.camel@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <694b9ba15cd67f41a38f4a65a3811f035cf8e99d.camel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_113209_295289_48589B44 
X-CRM114-Status: GOOD (  12.11  )
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

On Fri, Sep 12, 2025 at 01:37:11PM -0400, Nicolas Dufresne wrote:

> To me this rejection isn't about Benjamin's driver, all iommu seems to look
> alike, so anyone else that would have sent new driver would have face the same
> issue.

Yes, many drivers looks approximately alike.. To the extent possible
we should be making more helpers and tools to lift common patterns out
of the drivers. I don't know how much of that applies to rockchip vs
verisilicon though. Obviously I'm tackling the page table stuff.

Much of the other common code is tracking attachments and invalidation
requirements. I'm hopeful the general method Nicolin is working on can
be lifted and shared. Certainly it is better than what is in any of
the three server focused drivers. But I don't know how much this
brings to these simpler drivers.

It seems strange to be talking about merging drivers that don't share
a common IP supplier or register programming model.

Jason

