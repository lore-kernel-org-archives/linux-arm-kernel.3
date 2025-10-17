Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7F5CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 14:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OCa1krvPa6thrRIUKnGByTp8gWYsBMbtC33XqRP3axo=; b=Xxrj8c5tb6SmN7dSO6S2sVcn43
	tl0SU4JG4tNEkzBmZPGv8+AWDeGylDqEFFa07y6sgHnticBMzRjqQV/DpexWMXyk4xqfmsOjHsHbU
	rwEejGU3lJxdq40Rx9WNaSiwxsWXmtBZtgSMznJlEmpXiGD+vWeMK736wI/2873KHoqQrjnJPRHQC
	uk9bIhCEgPd1yZm781GVPqNNzT89ctxVne0TailgUcn9xYiBqTOVDD0rSoebJe4xjY+fRJySSfBQC
	LlNCgfWAuZzsN9iTiTkcJtKRQktlYbttLFVkGeM/Djob9Vv0rDA7/e7c+FZQ0dCvIRTrt3Oyd6Cxv
	f8Vin3lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9lCo-0000000824J-2PIT;
	Fri, 17 Oct 2025 14:13:18 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9lCl-0000000822p-1WGU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 14:13:16 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7c281c649ccso388350a34.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Oct 2025 07:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1760710394; x=1761315194; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OCa1krvPa6thrRIUKnGByTp8gWYsBMbtC33XqRP3axo=;
        b=DuQhawJoiAN+EoGkvucowH3Y6wLYNyq0QFYjXCrKo9TKHP4Vb1lDeCCJHu/tg74EYf
         fkmVHqdRN+yM17gmgCXJBKVQurd1LndrC5133UUSVMY34RYPOlqHyNJH9nN6ey+FYmXK
         Kao+kf7c0l37CuJhzMzMbQvnLbH2ovpRp1eQ1vxp0HDY0Vi9D3fZwPMZc41bNAWq8kTX
         Ypu4POYpd1t4Ni6u9ooaE5qbjWWyEK1ZSj4/uqOoQacMGZmOewA9zqUwkfZfiQuxUSqk
         dhp6VJ+a8/nwuMPM9+9Ktd33ucW9dOF2O2wnzBT7XdgPY2buKQJjz4yn/icpf+7bL63s
         YvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760710394; x=1761315194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OCa1krvPa6thrRIUKnGByTp8gWYsBMbtC33XqRP3axo=;
        b=P/56aIuD4yU25Ff5f3Q9D+AS20Nrc1mP2K4ZIr1qoZSYMzTwHe+K2qMWP1a5vxxpaN
         rajk8JA5f4FRuty28Yc9NI0reGJzTSTSbwSoD2qsnIw2WDebvLkwL3OeD20ybnkJGaM8
         G0wde+6643i7ycCAJMqS41kK5mBDin+nlX/VzZW0R8St7K+qkkPzohA15NU2WPTWDYBT
         0iEHIMHFDNmiDfgJyeUACVoW++m7Z9d/HPp33kB9yxIUScqqROZDX5Pp45ZX50USdM38
         065PG6+Du2rqaJuEBDg/n5p7cozw2gyHYhTKMgPijMenijJ0IG4lO+Gf720dfHjOWmzz
         kNow==
X-Forwarded-Encrypted: i=1; AJvYcCXACDLRyrgpR2XeFZPcjWNXIbV3kFVZxQBKdsp3XXG9h7YZyw0BTT9En7Mz2pa5IbQFVxwDwDZR7gZDO8WBXvzf@lists.infradead.org
X-Gm-Message-State: AOJu0Ywey+fIRbT5zwXPiPrfYHt7wnjdG5Odh7JimlycewocxX+X5Bbs
	f3eBC+du2uBp8mSZCH/OW7gFhQZJRr9bZu+PTeYXPCe/xgYRvr+jNc4nI/RWmnTS9Lo=
X-Gm-Gg: ASbGncutKENKPOjh29Mvi9adWhroritDmNUUDZcqRdu6RqbC6d8qPQyBmiDEoghU+Vi
	R/Mqlj17JOjAp3BIQd9L+ec/3w+3sM1S9tdAo9GEu9fxWSllDVMyNSqvh3HP9NvyAuKFmqObYLH
	rGSaEpKqhzKU0d5sv1Nk7mEGqJOij6NHoKMfXuBFqR6tBiMHdV+uvD+dlQBYoRIccxx4sTtcn0C
	1FealzUSlSF6bVKb1kp/OhSP1D5pnxBr4B4ReyndsPgFWvlMLMrfh8padr0NbH5q1Z+pGMUcOzY
	QhtyX3dBRXphZ1WVey/tOELcwZh4auBuv1N0wQ9lSFs9vbuHkjI9xqpXKw+mDPmFSnkxxa6UN/1
	Ul15fhkSi57opJyQbJxJTMjCfByuXU8o5zj1vNnt0SqKJW2XEcbGF7hTEZJVq
X-Google-Smtp-Source: AGHT+IFpxOdk6Ni6feiUl7Z+NLPVA5NFJEIRLr3ye6HX+wgeHy3UR1Agbev9kB5TSYS6S/8PSXPR5Q==
X-Received: by 2002:a05:6830:610b:b0:79e:5341:392c with SMTP id 46e09a7af769-7c27ca2832amr1811887a34.7.1760710393815;
        Fri, 17 Oct 2025 07:13:13 -0700 (PDT)
Received: from ziepe.ca ([130.41.10.202])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c0f90687e8sm7323680a34.15.2025.10.17.07.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 07:13:13 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1v9lCi-00000001JNh-0d7r;
	Fri, 17 Oct 2025 11:13:12 -0300
Date: Fri, 17 Oct 2025 11:13:12 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	will@kernel.org, joro@8bytes.org, praan@google.com
Subject: Re: [PATCH v5 4/4] iommu/io-pgtable-arm-selftests: Use KUnit
Message-ID: <20251017141312.GP3938986@ziepe.ca>
References: <20250929155001.3287719-1-smostafa@google.com>
 <20250929155001.3287719-5-smostafa@google.com>
 <86ca3918-4992-41a2-894f-f1fd8ce4121f@arm.com>
 <aO9vI1aEhnyZx1PL@google.com>
 <b48193a4-a37b-41ba-b4ba-8b5c67d812bd@arm.com>
 <20251015151002.GH3938986@ziepe.ca>
 <73a1d5d0-8077-450c-a38f-c1b027088258@arm.com>
 <20251016172524.GN3938986@ziepe.ca>
 <aPI-8YfqC83QlltH@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aPI-8YfqC83QlltH@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_071315_506892_90E2C7D7 
X-CRM114-Status: GOOD (  11.30  )
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

On Fri, Oct 17, 2025 at 01:04:49PM +0000, Mostafa Saleh wrote:

> Is simple enough and verbose and can distinguished from test failures,
> it will look like:
> [    2.095812]     ok 1 arm_lpae_do_selftests # SKIP Failed to allocated device!
                   ^^^^^

The test "passed" though, and since we never expect this failure it
seems wrong to make it pass.

I think there is no point in distinguishing "infrastructure" from
anything else. Either the test runs to completion and does everything,
or it fails.

The use of skip is for things where we probe something and detect we
can't run the test. Like maybe you have a test that relies on
PAGE_SIZE=4096, or CONFIG_XX so skip other systems.

While, "I hit an OOM so I skip the test" seems wrong to me. Maybe the
OOM was caused by the "unit under test" leaking memory??

Jason

