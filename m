Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC33CCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 22:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kB/Wi+cRe7K/Xl4jkmaNXOwfB7KCAKUI6vYOHIxWVl4=; b=EDSfmRyy+74EgJ8XZcR4GVK4bM
	9WMJUZAimCozkl1y34bVD3lc/3yOmL1StHbnqXZMluROvXYf141MHIFP2rOGt94+hR+DpFkq+Y5+t
	BFUdqrBzAb/pl0IFGfV7dSBGnyxvEQLPr9ZGnHLNwJYHwZuY0PLMieLwji6kjEZ1ONuEOcGXFV+1C
	B1lyRQtQGR5eK+VuQ5byM7s5iqqGttKOkZpl0LEfdQ2c6szwaRSV+3T+l3q1f0QcPry4+ceNuS10G
	fFbaQaz//6SF2K2BJ2127iB22sLqbzLKkYVnxNoPw6v3kURw67hS1037N7k0hEr0QqckRUSAAsImF
	5xa1UePw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyI9E-00000005pz0-1j9h;
	Mon, 15 Sep 2025 22:58:12 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyI9B-00000005py7-3xzx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 22:58:11 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-74595f3852cso3367922a34.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 15:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1757977088; x=1758581888; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kB/Wi+cRe7K/Xl4jkmaNXOwfB7KCAKUI6vYOHIxWVl4=;
        b=HuwF5/lBvsR2STvcDa6zA4x+lRJpBkgNBLWlQ1BJNvXn0IVelYD7EhiEQJxHRTIsz6
         xBZ49hJAOauvmK9jOJxAhXpy+hhwPwK0kQfH5xqFgTOax6nrInhbJsvJe5suBUXMrOcV
         GNovFXf5ZNhu89iqcEcvPmZshrmxBwT6BFDV3ex5aHXnwNmk5cjjbfEmzZKbq2eTjXe6
         lUO29msazMMoEPerkonBy1pOl9Q/Czarzd4ohfdaAGEXAdYhP4M+yEVRmqfnUV1pacpA
         lZoat2zvsAFos6RGQj5DgW6fwzoy49ZJNMuT3gZxW8L6SFpyCxC2lc92CmVJ4zDtVPB8
         zjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757977088; x=1758581888;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kB/Wi+cRe7K/Xl4jkmaNXOwfB7KCAKUI6vYOHIxWVl4=;
        b=uM+EuxmxvN0KoMnpKLaMj+U+ko6/dHTGFQ37biY5J6Qk26+toXqhHSbOnFj2Z6qq3S
         RQKsCWvteYH/YSxwb0Qsjvy26PXBNp8/3vInkJV7Eaf/bKdgDlbzUaFIOhsd/hOYPNFV
         ByqVs5hN17M3onRvn0Aw9Vlkv8PUb7mno/aQIst6mOrdGNNUa891ZHNbF43dqe6wubAA
         hPx1ork1nuWVzQk2HN+gX3TD2up0wpt+wRshS6rT5c4kQlzAskvHTgU/+KKvK9DS1+xD
         aSzGJc8DY/XEsnBl5PeNxuYfGH4MwmpH7UlcLCIeeB8tD/b1iAHfjN+cpqh8fL+z82il
         OPxw==
X-Forwarded-Encrypted: i=1; AJvYcCUzrPclHhrMUy6u6Wq0j0rs/bpRePRk+aGtLfYLe9U5ByFCBoWhHGOj9BC8Bm0/u7vwWZM3h2xJ5rUgoS6hbSYw@lists.infradead.org
X-Gm-Message-State: AOJu0YwLpjOAZ0GBqYawyqHsHV5wzHEAzk8YZ+YA2zy6PJRnFzMwOwIs
	XgPJrcyzGZPsHlCABH8TuuwgolH8LIX9T2Fqkd1tK6EghkrCfC4+6LYd/iC9IIBBqxo=
X-Gm-Gg: ASbGncu4WVDaMTe1PkRweNOhZN3g20A4nSbnFi2pPdsVdk+gvWlE56Jf6z0w/AHmecu
	wsoV+Nl+Tgg2Qm+qYd1jvpwZuISwzUIHp7oxaERBctCWuuWCtfhTRcn6Wrevopgj+TO5mUPpB1d
	har/Zd9Jq9RucZNaw1UuTqxtMyFb5h9waSdIYOkd53nFsNEYT6cpHgx+5mmAYsr3mn9M9c3RPTh
	981M1C48Tc2mCnBuMqgnQWwsA4WXP7kxUD4drUSaq6plmy+1Zk2L+rC8TqJPEcazDyb2TP0QDy8
	eCuNXXXyl2kf44vHGVs6ukZ20wzfFZSms/PCgYz5KFwVr5MZWleMxfPlziaOIkENb+94Xv6wiLv
	RKFC5DfA=
X-Google-Smtp-Source: AGHT+IGSUOqb+ed31/428rqH5N5OvGqFxlxhfX8elAayaMc3UDw7hqxF226u18IdPmrznlxbRNVzmA==
X-Received: by 2002:a05:6830:6adf:b0:745:9dc8:8dfd with SMTP id 46e09a7af769-7535638abb1mr9759182a34.35.1757977088588;
        Mon, 15 Sep 2025 15:58:08 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7524986c872sm3180269a34.15.2025.09.15.15.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 15:58:07 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uyI98-00000004Yk1-1O1R;
	Mon, 15 Sep 2025 19:58:06 -0300
Date: Mon, 15 Sep 2025 19:58:06 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: =?utf-8?B?SsO2cmcgUsO2ZGVs?= <joro@8bytes.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	robin.murphy@arm.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, heiko@sntech.de, p.zabel@pengutronix.de,
	mchehab@kernel.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, kernel@collabora.com,
	linux-media@vger.kernel.org, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v9 3/7] iommu: Add verisilicon IOMMU driver
Message-ID: <20250915225806.GM882933@ziepe.ca>
References: <20250911155720.180465-1-benjamin.gaignard@collabora.com>
 <20250911155720.180465-4-benjamin.gaignard@collabora.com>
 <vrngq76nnms3jyl5hnxqnkimjc6kil66o6fdyqn5vm3fpovmja@cfynipjw7ktp>
 <694b9ba15cd67f41a38f4a65a3811f035cf8e99d.camel@collabora.com>
 <rt6nvgazcl6mvyy4iuut3n7irf72t7rex2iwabbkuxp7cdvez5@2nanenqgxjdy>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <rt6nvgazcl6mvyy4iuut3n7irf72t7rex2iwabbkuxp7cdvez5@2nanenqgxjdy>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_155810_054159_FF97B2E2 
X-CRM114-Status: GOOD (  15.80  )
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

On Sat, Sep 13, 2025 at 07:58:04AM +0200, Jörg Rödel wrote:
> [Adding Will back to Cc]
> 
> On Fri, Sep 12, 2025 at 01:37:11PM -0400, Nicolas Dufresne wrote:
> > To me this rejection isn't about Benjamin's driver, all iommu seems to look
> > alike, so anyone else that would have sent new driver would have face the same
> > issue.
> 
> This is about ignoring comments from one of the IOMMU maintainers. I am not
> going to merge a driver with open comments/objections[1] from Will (and a few
> others), so resolve this with him and get his Ack.

I would strongly object to trying to share map_pages, unmap_pages,
iova_to_phys, free and other iommu pt related functions in some
limited way instead of helping on the much more complete iommu pt
work. Which is what I said to Will, but for some reason he suggested
it anyhow.

Sorry, but it doesn't make sense to complain about duplication in
drivers and then not help advance one of the biggest projects to
actually concretely and comprehensively address that duplication.

Jason

