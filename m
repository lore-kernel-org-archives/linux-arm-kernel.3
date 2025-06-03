Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E89DC5B555
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 13:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o9eD6fBv50JvJ7Gx4KUjwD3EkSFG+lO7duRzw9dtFZs=; b=ipltxaQmYYdd+tclf+S2ze8QH8
	tPlUH12Ab9/G+mOKLyRcleF3GYZUoAYbX/p5MAP0GrqW3ol4ZJnDkP3r0sEGk6j/xpSXyiMQCU1cY
	dTuzn+45XPgix33gdHtJ2X+o12M9TZ3x4HsJRUfcbixgQyz3cIHOV7gz30E3q+LxazuWimLk2jofk
	+E1tlwHvXN+GKLVcJi7UoLTrLGYjzS5DJjOOzFeOb5s9Ir1McG7l4Wozb8fJgZEZCdNtfvNa7Y3lk
	Gh5+OSAe4VDZvNySnbirp+2I5UGuHSWtjvfki47GB3V2jqRO6mLauBXsmU5xPsMB0AIbMnMPXOXSN
	qzz/ftmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRox-0000000B3Rl-0r3U;
	Tue, 03 Jun 2025 13:36:51 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMRmj-0000000B2zK-0ohx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Jun 2025 13:34:34 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-6fad4e6d949so22723256d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Jun 2025 06:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748957672; x=1749562472; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o9eD6fBv50JvJ7Gx4KUjwD3EkSFG+lO7duRzw9dtFZs=;
        b=IX4D1GUymZrO2GJIkXhSyMEbKiNM6kDs5ySMdh6K046TN/1e0Lf/jiXviEqJodrEI3
         1j+tv28e41WMd2zMaHMr1mf45S9e27MVfh3ldp+rz30MVMMnvS699qrlv89kuIvGtPKi
         kwFcsbB+vRbPENYnEzTPQo2lUatPgHsdZWjI06YOUmTC1Sgl+jrl3+GBjD6oxV5XnvWS
         pUxSuaHXzXPFcmangfc2btyrNt7zTcLZOwYRxFYKlIQs5D59e2K/6x6BA3AV39G82sP/
         sM1v19+JMZdi96QyMJuujK1Bc+Pz3ChgZ7MxaWajFrY7Uoa1RM6kwciZDp7d4/U4HiZp
         K3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957672; x=1749562472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9eD6fBv50JvJ7Gx4KUjwD3EkSFG+lO7duRzw9dtFZs=;
        b=cXcnGU3E4haswshjqzZezrmDiR2cxghgFxQ56KIrs6ykOusnmIcCJYBUGjdYXwiefm
         YLi/itrtzsI1BlDpDHtNztDDbSpLBWaGLcuZ5nR73O+NzM1muLjps6WzGJsq5IlEEVrq
         EJQavkPwCQ1kHm+hriT7lGeraOAfmLl65NPmqVdaJAllpz1De54QK4uSbAJ7fwePLFra
         rNmEq9ovOhQlF+2PSNpBw6ElIjFtTnWCNanHrM7RjeWZgtV/BBM0oP0vdFE24bQtXJIC
         U2gdf2zsdfUvDRdnhs2fmUw8a580jsJ2l4bSo8NPKXBZJ5LckqVsR4apWHdK/SirS96A
         C60Q==
X-Forwarded-Encrypted: i=1; AJvYcCWjWRMzGiLnLduVEFzURwH1xS2X88lxNiqY4puto8eAXQ283EJ/ptzkCCMfSqCGRUnSTxEuycMsaBDxQ/MRflin@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6qze8ke+XY3TMz7WVQwMY1psRY2sv6OI257VjS8XZdH9l8fOW
	sKxwAxcRxrMAkaXpIatTKDdiCq0xMtJxpHT7ximTlWcO4IGS0Zty/poo5CRfjcGKsNQ=
X-Gm-Gg: ASbGncv8IvPOyfPeLXnYh9ZTDGBZMl4SZOw/yayxmUPWwQP6E9O4cUJ7zwAjwY7fP5E
	9sbCN8szZDgJxqC8nK7a+U9jHuFpnMNm443LoJGw2VEtAD5odM8T7Xuo/8KtyWtwPKcTdD4yztF
	Ct3CywDFWOagDwYJQ16dRTfsyUZjgeSY4GTk/QoxO0Km77TuJ3z5VAcrq+oP9gFXXjhp2qF30fN
	dNTwqZK6rfb4MsstLop1IoidiLYiZVhmJBsYbPYlGumOjVku4ohyY1N4VL5f0J1ZYTMxhIK8GaJ
	VVNY59MIORwDY69d6In7B/5x1CpuGj5kKnXELpWNjK09yCki5oocSk/5I3Pny4iYiz+Txyh0JVu
	jmVR+enUaozsh3xqbndwqHFgb0XI=
X-Google-Smtp-Source: AGHT+IH3/hKllTZ0eEK/dcuWTgO5QsHZ5LZ3JNRLIXTEioRhdRSPfL4GWfnU3eDieGqXq6aFnuzp+A==
X-Received: by 2002:a05:6214:5096:b0:6ed:1651:e8c1 with SMTP id 6a1803df08f44-6fad90aa622mr189063246d6.13.1748957671754;
        Tue, 03 Jun 2025 06:34:31 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6e00b78sm80064216d6.75.2025.06.03.06.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:34:31 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMRmg-00000001h3q-2scY;
	Tue, 03 Jun 2025 10:34:30 -0300
Date: Tue, 3 Jun 2025 10:34:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
	dan.j.williams@intel.com, willy@infradead.org, david@redhat.com,
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
	balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
	John@groves.net
Subject: Re: [PATCH 01/12] mm: Remove PFN_MAP, PFN_SG_CHAIN and PFN_SG_LAST
Message-ID: <20250603133430.GB386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <cb45fa705b2eefa1228e262778e784e9b3646827.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb45fa705b2eefa1228e262778e784e9b3646827.1748500293.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_063433_235193_771F689D 
X-CRM114-Status: GOOD (  13.01  )
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

On Thu, May 29, 2025 at 04:32:02PM +1000, Alistair Popple wrote:
> The PFN_MAP flag is no longer used for anything, so remove it. The
> PFN_SG_CHAIN and PFN_SG_LAST flags never appear to have been used so
> also remove them.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/linux/pfn_t.h             | 31 +++----------------------------
>  mm/memory.c                       |  2 --
>  tools/testing/nvdimm/test/iomap.c |  4 ----
>  3 files changed, 3 insertions(+), 34 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

