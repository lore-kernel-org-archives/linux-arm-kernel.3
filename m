Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC8CCA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 23:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMftjJLAh8xtsCYYhvQzmmzmnj+Oz+ZcLlSPeG/s0X0=; b=Izh7IJDcoLNdOhVrcWsRQ7tg/4
	UuA/sZNbgVvZ9+RBrSiAIv9ObxJtbqYVV3KwU2WojIiOTMucNuNhLvCl88gVeyfstjPvVjF+cutMY
	VpQM2sX4Fd6WuYi8wEM+0NFwQFnOMM5tVAkFVLVuuzwAxwVAgPo+AFWotpNz5tasjaXkzPcFTwCW4
	3e8YUKcXfNqj9qKocHn6SzO22urnJZRJLVRERGKQllHqkkTM7GCj3NPquLAZUfIeJ+oJEJC6w/TOb
	A4lmvTunaUeBLWJ07v8wJmGyTWrZ6yMoiBZCND7ClPauUVM8WfuikAAlK2V76UrpwNI5cPwIT6smZ
	mdrKatCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBKO3-00000001ojK-1tCA;
	Mon, 28 Sep 2026 23:03:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBKO2-00000001oit-184S
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 28 Sep 2026 23:03:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OMftjJLAh8xtsCYYhvQzmmzmnj+Oz+ZcLlSPeG/s0X0=; b=AprgYixLrmjoJ+bRYKeg22eMdm
	VD5mKwpTc108bbdFtKlid0xx2q52QxEYw/9XtLc+RZ+P4qsYQTcK9dwrS6caX+7QIVnKc14zEhxQa
	5Xn0Z2sQFhXsogfxreNuLnHFKKyF0Yc04gCUH58MnEv5mMX93OKql+ICrM6BAF/tPdi2a4ccTm6r0
	YFcevBdpEjXPv+LLDudN2ZOWkqGy5ntWgQp2eC6mQyKHcr4q8qGLYM6NR5LdAlikBN+hRUfZU/c0n
	H3V4LPhxFvOhLJoAGPR5L0YpXPij11xQj1KgF4zT8bgyBKirxIqV8sg4LM5k/3sJfPDM2ixtv/7CO
	8aEDB4Ag==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBKNz-00000001zCT-0A80
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 23:03:52 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2d3b445a84fso14885ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 16:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790636629; x=1791241429; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OMftjJLAh8xtsCYYhvQzmmzmnj+Oz+ZcLlSPeG/s0X0=;
        b=iCoab/07Da1nMA3psjbldO0yzzQq1tiY+BK2Vo15XivwCb+sJbDlMkahL8H7qKa10W
         7HFXOHgBRvxhfXEP75v8AvNfPqrIax2/YxqOtT22UmeCIAly35uEGIPNBgc0VF8qNu4P
         Nqoj3LFXPao0ZldNzxjAhOCIyJmEkfFFkJ1ISEiZ/TuV6cXYYVd66kJy8yiUeBODNJB2
         1SMn38JJmQqtwkLReOvS1LYxd/w6sCBtoJSRONm3p0PA71S8EG8fPa2HQr8OyplAnP1j
         qXFLaZmILpXPEwduHxtUSmFbWXp/uiiY8/3G0/ZPCehdWdkZoKT9jGEfWVTv/VWTtc7v
         poig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790636629; x=1791241429;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OMftjJLAh8xtsCYYhvQzmmzmnj+Oz+ZcLlSPeG/s0X0=;
        b=FTb70F1/GOV3iKze8Js7EoF7cKXt+AtmtztYcT+DypkAK4khvPu0AflOzUF9XRsZKS
         MEJWnTIVmkPCZ2EuSFfWhHKWz9Kgn52uFKjWLoddXu/gLjxaZmb1kTl+R7z/v9Uon925
         orjQd+jWKsOfESAhNMD91MHsgIeWPTzBimEqmeUactWw8sjTBlyTN4NBdjC24umMpYQq
         waTID4fR3KIrY9i5nNhx2d4A7XshQ/aBUdYJi9lIpu2WoNbvvEXwhzJAWq8nDiAAfMgF
         pXlKYdQkIAkzyv0RcGtitjRqsEl6qa1k640YkyNSA5uKWXSton8yN0cKSW+2pnQSsOXR
         +KbA==
X-Forwarded-Encrypted: i=1; AKwUvBz9aJ6gKJJDH0qsMLvMdJ2Hv7es7s4jpirv/FnKywegRLcZR5+8c7/2A46K1F2lfkNPCtHZFQN6NGkoCSymoC++@lists.infradead.org
X-Gm-Message-State: AFq9FYLQSU1HeXRJCLqsb3yZwyZQ/tLW0VrSt0YCYTuRZhE2K6mb1zfV
	jL8T/VbRKTZaAWSSuIOpJ+LZig9LKijNv1ZQK0zTeehEzisvnoFgecF3XFgAJ/Z2HA==
X-Gm-Gg: AYBFou0/+wlQ9czdF5d6WHdFvUG7RQq2+2hZ0uUfRP4QdYLp0oWRZ/GXDYscYfSj88I
	nTfmjU5vEyfLTXCovjrf2iYkYNpj9Ti2D0LnVIusgDeT6cMnJq1IxHqtft8ZGNYRAm0qd4nqLlG
	gwKp8cqsT3fYlsB5Op+o5LQo0OABWodyFSgDVHpMcELupaLXuqXDOWPfgr+/lsyX3/Bje6KdX4J
	2vTVMd1+cbS/hXHIa7SE/Ig6qYy3KW9/8NlLYZBG1DJv5T2jZV8zsIn6+exdZRN7XXWKLmZIfM1
	Ksts0FnBdLe72byQlWM0W0beKCVKIL+qUIAUGr+CGO3oFabysgu9NIgWsHIjWE3B9EmIQx44ORg
	49I5K2a0BpdnBigX6/8mFfGVzGT6UIszpvoypLibhMAIaWNwOlbT8CNbEzgfMeR517eqnvNdxn9
	wcw1IG5pjb/oLJznm5/T3XepQ0ro5wtuLo5y1iRZYTGiZGwKWDlmolu/6geMFmoj7c0cb5pnY4e
	PgR87AbRhYNJQaeDOT5a2LFOcUEOcZMfybp
X-Received: by 2002:a17:902:f707:b0:2c7:f688:f22f with SMTP id d9443c01a7336-2e2c79fbdd5mr691405ad.13.1790636627971;
        Mon, 28 Sep 2026 16:03:47 -0700 (PDT)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feac93380sm4714358b3a.33.2026.09.28.16.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 16:03:47 -0700 (PDT)
Date: Mon, 28 Sep 2026 23:03:41 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH v2 1/9] iommupt: Remove the sanity check for
 pt_num_items_lg2() at the top level
Message-ID: <arryTf6sRapjC1uW@google.com>
References: <0-v2-563ee63886f0+1209-iommupt_armv8_jgg@nvidia.com>
 <1-v2-563ee63886f0+1209-iommupt_armv8_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1-v2-563ee63886f0+1209-iommupt_armv8_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_000351_270740_C630F7A7 
X-CRM114-Status: GOOD (  14.45  )
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

On Wed, Aug 12, 2026 at 05:09:17PM -0300, Jason Gunthorpe wrote:
> This was ill conceived, the existing formats work OK because they
> happen to support pt_num_items_lg2() at the top level. However the
> documentation is clear that is not permitted because ARMv8 has
> concatenated top levels and we do not want to calculate an exact
> pt_num_items_lg2() for the top level special case.
> 
> The logic to compute the number of items of the top level is shown in
> pt_top_memsize_lg2() which is:
> 
> 	num_items_lg2 = common->max_vasz_lg2 - pt_table_item_lg2sz(&pts);
> 
> Which is pointless to try and sanity check.
> 
> Reviewed-by: Mostafa Saleh <smostafa@google.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

