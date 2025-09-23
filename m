Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B12CCAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 19:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVuSRD80cb05xRP8eCjDZvMC/JNrybFBLhN6uiPb/HE=; b=T6xlIjC1I44zpIMmZe88+8Qft3
	eM9jhQ3JFfK0tAXnMEXTPQIe+pN5wyu3iYrrHUDr3i1zDROqHujCwS2eC6RB04YWsF02qbCD5P0XY
	Gya/n0sjoB93S7MCr3UVhwlCtLChYMHG72qOifElB9LQt3X7aRynDc1Vyl0GQ6oRtosfgQpXYe/W0
	WoJWZQmwdI6BCymJvSN6y9wSmuIefvUMBjXz6jPe6QAxdVHRki/seEsXsZ0BTjL56x3ZgomKbvV+T
	sFKFonjpmCOj+W4JBX8Pye3O47sTGRJBaokG50cRb1psQ1mpERm0eDpThZfYsTrSBFMdpedAocjHw
	/Ovo9LRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18JI-0000000Ebu4-031h;
	Tue, 23 Sep 2025 19:04:20 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v18JG-0000000EbtM-1xVQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Sep 2025 19:04:19 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2731ff54949so34465ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Sep 2025 12:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758654258; x=1759259058; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BVuSRD80cb05xRP8eCjDZvMC/JNrybFBLhN6uiPb/HE=;
        b=kr/dg8WBsSmfjVz/+1hhLq2d7kUTX9uzmlKUTLKynKssnu5oaR2bWWigXAimMnguFt
         GRtwwH03jw6GLEjhBZ2wLuwEPTUUDda0hd17Pm6PSzsQrdAyQ8WVLqvUOtPd+gH+ERGG
         o5lv/DpSh8pmQvF+oTg2WF8ld05lRDOBtb8DnhHrPK6i1wrfgyMc2iJYNxKqqlCSM7dZ
         G8sSiAonClzAVXXbBR9NUQ0oWRfvI4qOdAA0sGohRkpru3C9XbNhT8ZryUMiYEAECsjo
         T9OL2zHJsJ1rbXek5klJ8b+/G+yw6UNPQkVAhVW7VZrDr6JwQo+t+D8kXMkwAtP2P9X6
         T9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758654258; x=1759259058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVuSRD80cb05xRP8eCjDZvMC/JNrybFBLhN6uiPb/HE=;
        b=LrR5b2BB2a/4BpAa6z+NaRQ6pEhK2Fpr9Wt/FalMc1VHII3vb/ukJT6e6lVR79wuCx
         +tvclNZRjUreDOcjDjrbBOkQg2kYlW3EBUcH976vbmvuec+67jiAo6S901qh4jMbCzf3
         BPC+vXny5P8KTb5QWqZgdVAjLHJZwXKpOv8NbEhicUsOczb0FCIC04kJti9M8mnqAxgo
         BzQA3hkWpaZailZBIu+DqJzKm0JYZ6xDASmKZrZekRmbWrHMab8NN3ATEBLiHJTpi8zq
         6bgkD6oOdzf+fHG8MNFHZDbQE/JeZlKOlcwCtXtwxNiCpCMYDlUtBlrTZRsBzjxX7U8r
         VKXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaXP8QOEwNEHfDz3vGHQi5L7IkjDMc3Mm7T7zF5Vbj3YesCNVGuBGqlgTpQZK6upziwv7oxC2Z2eM8LsJXZE/D@lists.infradead.org
X-Gm-Message-State: AOJu0Yzy3INt5R+ox1hvsqRhN+b/+c347AS9WRA9jI2cAleF2bvb2Bj5
	xJFt5amWq874KkJBRgs/rmjZ/FVGpGvtyQyRi0rFr+cIjH92zEv1JGfV9usl/VUy9Q==
X-Gm-Gg: ASbGncu6PNJ77G1LSs5cRxR85Dtmzhbugw53S8XcsRwHBG3t8ILGTBqQiikUz0HCaSD
	j1pxuHy1VihyvtcOI1tLpQsqpjHEYmQFvF9AL05w77RkZIdh5OBWdGZh14GUjyyyHr4jNDD6EX5
	x+0h+N7LXhdLlRywrrUpczle/CQtT9q38CR7JKVGgfXVueZ3ZzBM8QcoW7dalpEkLn1rPT4S3da
	n+hxX4qNtjl+fX/jAusFseW+TyKDvk4ejKcC49MQHxw7AR6u7hbzIUQO4qzRbgcM6m68Us+FBSM
	Q5MDsgtenVNHhjFAtA6NTfuKmclvMVJ+gxANLV7E39fV31le6OnkW8fviM3Gpx6MrqgXFRmJVj7
	63qTdF9UOhwB518fTAzHoK8JfKr61S0vOWLBrqGgJlhVYEmCoVRc2lWvHBaJoWUI=
X-Google-Smtp-Source: AGHT+IGlm3sxbw3MtGkL7PIjJGczzrrl/P0p5+02K7dTiPLCrVjzmQQzziPhIyR/5DAW3Upq3GMMIg==
X-Received: by 2002:a17:902:e809:b0:26e:ac44:3b44 with SMTP id d9443c01a7336-27ebe858bf7mr777395ad.10.1758654257284;
        Tue, 23 Sep 2025 12:04:17 -0700 (PDT)
Received: from google.com (23.178.142.34.bc.googleusercontent.com. [34.142.178.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3306085e6e7sm16766873a91.28.2025.09.23.12.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 12:04:16 -0700 (PDT)
Date: Tue, 23 Sep 2025 19:04:11 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, robin.murphy@arm.com, will@kernel.org,
	joro@8bytes.org, jgg@ziepe.ca
Subject: Re: [PATCH v4 2/4] iommu/io-pgtable-arm: Move selftests to a
 separate file
Message-ID: <aNLvK2xW7f5ZNYt0@google.com>
References: <20250922090003.686704-1-smostafa@google.com>
 <20250922090003.686704-3-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922090003.686704-3-smostafa@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_120418_510901_A70F7E5B 
X-CRM114-Status: GOOD (  13.85  )
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

On Mon, Sep 22, 2025 at 08:59:26AM +0000, Mostafa Saleh wrote:
> Clean up the io-pgtable-arm library by moving the selftests out.
> Next the tests will be registered with kunit.
> 
> This is useful also to factor out kernel specific code out, so
> it can compiled as part of the hypervisor object.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/Makefile                   |   1 +
>  drivers/iommu/io-pgtable-arm-selftests.c | 208 +++++++++++++++++++++++
>  drivers/iommu/io-pgtable-arm.c           | 200 ----------------------
>  3 files changed, 209 insertions(+), 200 deletions(-)

Reviewed-by: Pranjal Shrivastava <praan@google.com>

