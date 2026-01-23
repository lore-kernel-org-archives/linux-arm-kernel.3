Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893CDD72367
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 09:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ezm4JjycmUxCtpfU+iSfc3PFKPDnM6onFM81HUDKjpI=; b=ujZ6UXFJ+ypb1p2duwelaO9MUs
	iheoumFUpgwGYw3a51sWzzn6Tx7EUM9NlBPpPWJKr+D8mOLxuQlz+ZnXnOyYqHnnIiAy3FBl112Wk
	LYFs986jkU/aqF2jSkxvEU50fJaALcPk5V1NJ8fAR7SflacW6WlwhwTO50MD9g53tPIuTrkHbNsM3
	8Tmuw1/YRK2iwdZJr0H/cgxSNwhrY4d96udBsXNzqFW7UI60bXbBITlF+IDVuHQR4Gsa2gjNGipdz
	RS4XB1gsfDraaQGvrgujBYtdNVsABDr3MyueWnQUdFJYyO0f8kNTGSjcsrnmz1HQu15QxXRO5HOFY
	hWo3QcWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDoO-00000008cMr-2ggE;
	Fri, 23 Jan 2026 09:50:40 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjDoM-00000008cMQ-2u9I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Jan 2026 09:50:39 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2a0d06cfa93so83065ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 23 Jan 2026 01:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769161838; x=1769766638; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ezm4JjycmUxCtpfU+iSfc3PFKPDnM6onFM81HUDKjpI=;
        b=Ugrz7w0+YKXcK5kuVFkROOzf9biVUqTugRgDWnf/2pQuRF08gJ4T2zrljWf/KtwCZg
         3KMDPA8RqbZLT1BSvaDpakMAStYsfnqNvNdJxzOwqxwCnAxGdmVhT3/5hPYBgm0cmsbB
         nJRfxW6glgiJrryhOtxxTkMx6Q0EvYJXMeKQfxSV7OC8JhyqelQCiFhVPTSUcrIvuFau
         yv2TYj2EPE9gxF7yo0G7GinDy41svbNIMojeE+5/OJWG/sIFJl0kWO4A5flXM4UtvQcx
         Vv1Vby7IayHezASOxJrDnq9+eWgw5J2t6atVPstMr9M1hzHVeyifxvPHVXjDaiLphjVg
         KuiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769161838; x=1769766638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ezm4JjycmUxCtpfU+iSfc3PFKPDnM6onFM81HUDKjpI=;
        b=U5OcINUCXkIlvcLkD3Ykz9tDnRmYKiRr54RfEdihjoQcZbfF2UVd58w51Q2u5DnBer
         VibVFInz5bUvVzBXe9LqL9+2OcqHhYWNaZe67eQUW0bRE9Gg1cCIXgGNxwyiRQTdsyln
         AA81fYk8iqhZrEF3Rg6SgHva90fjAGS8J0UQzi21/cRyIIUYHe1S7NWZbcJnz3w7EpDp
         8noPtoNTM14ulDHhzGYV/rBcSQklvkzVx5vzSh0pIEo/iLdaIIs/z7mJBH3D40oIs8pY
         plN4/lWtvl7c2/6hqQix9MMaLK3SVRRX2NW2fsoDvS0jEz0iBurIlOIUqzVfNLj1cVt2
         JLfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmnasFe7me9mNXuDgqe400jy3QX5rWS/VHwRmJVE4koKkklmO8/34b8XJ0jZHlBs18Q7Yn31/gPCVq3eKsYh7H@lists.infradead.org
X-Gm-Message-State: AOJu0Yzus7YIYWIojYziyZBEK4RemWfJTaGXICmUuIuEQGh6c/mzDirX
	zVGM2Z5qRfr0ugKhOtt0UbMLr2uPY664Fi4P8laflkrMLMW0A+yBLDieWPvS/5sBoA==
X-Gm-Gg: AZuq6aKXZV0tApJKnKlLUQIfLNzGdh86yaoxTkdec9c0yXlQodi41KckSH7dquLGKDJ
	+09QXsvoQ4hsigsdsqMj4Pa5XTkkqAA9JJ6cc3mlICbNw69hmXTCA+VmRFwxI379sReWKITioEu
	gU3Q+bleX7YbuRorIz49ZsdId3TqU0cytHIspeu7hza9nTwZJHWQNlo6jvVfI/Z0Be+LVtnJvWa
	ThTNjgLJ01Ic+lgPc0ctSiT/ICHrcCe5xAbUYTAl2L/8cFIxBZUy+qk8ZB+oDIRs97uNwiQwbas
	YQ9i+b3QxKQxnh9gGaNeMcr2E+3xyl5rTq5Qd1o9Qa5xprO3jDiTxylS/8Gc6XVqTWtTbiAbRzV
	hW6u1QAnbR4k9wpI4uF2gPikxqUroPMqEPyx7T5WQhYyz0pLWaAf/I7XZoMtxyOzar/XhXGO8Bo
	YtTTeqHZ3/CmsEsg896/tyHoYCYsj39e0lx8Vl52GkCcIxwq0V
X-Received: by 2002:a17:902:d50a:b0:29f:f71:a3b9 with SMTP id d9443c01a7336-2a805d137b4mr1553765ad.5.1769161837239;
        Fri, 23 Jan 2026 01:50:37 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802fdd70asm15746635ad.92.2026.01.23.01.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 01:50:36 -0800 (PST)
Date: Fri, 23 Jan 2026 09:50:31 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, jean-philippe@linaro.org, robin.murphy@arm.com,
	joro@8bytes.org, jgg@nvidia.com, balbirs@nvidia.com,
	miko.lenczewski@arm.com, peterz@infradead.org, kevin.tian@intel.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/7] iommu/arm-smmu-v3: Add an inline
 arm_smmu_domain_free()
Message-ID: <aXNEZ6ZV2i6IMpNW@google.com>
References: <cover.1766174731.git.nicolinc@nvidia.com>
 <b516338bdde0bc6f06e2719b9292ffa260085a67.1766174731.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b516338bdde0bc6f06e2719b9292ffa260085a67.1766174731.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_015038_729538_20CC08F5 
X-CRM114-Status: GOOD (  11.75  )
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

On Fri, Dec 19, 2025 at 12:11:24PM -0800, Nicolin Chen wrote:
> There will be a bit more things to free than smmu_domain itself. So keep a
> simple inline function in the header to share aross files.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Acked-by: Balbir Singh <balbirs@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h     | 5 +++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 5 +++--
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c     | 4 ++--
>  3 files changed, 10 insertions(+), 4 deletions(-)
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks
Praan

