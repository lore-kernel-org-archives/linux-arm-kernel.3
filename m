Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D57C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 05:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nf8/3/DreRNzXlFHg2AgTTtfjDRLaudroEyy156u0qE=; b=HiPUSEHcH7UvCztvUbrFSmR7he
	VYZHLwGBBRXVhNILAqzaX5Os2G03jOWQpGfhpIG7cwZbMCS326IazKmTwp2+D8pwceW2ADpOH3hlV
	4juI1ODlXlA/pdPxQYZiiLmH4i8MH4v7DnoLpILi0QN3gFPJb1954oLSEUHI0yApiqtQhQTjCJ77S
	vENK9aMqp2tfE3TCdwIa7FAspxXaPDiW8+5ily3mMtrN9/CF8M+d+xTp0VXEmAUZm9xfpQWS+HeFh
	j2d28Xf6Q1MbIsUw+eplu1J9AFD353Yc8yA1bHZsQvDtzORHrdli2X/OLrVKMyun6aQ/ku0j1F9g1
	GCRQTa/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkczP-0000000AxKJ-2Yv9;
	Wed, 19 Feb 2025 05:51:19 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkcxv-0000000Ax7Q-3xRn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 05:49:49 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-220ca204d04so86548055ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 21:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739944187; x=1740548987; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nf8/3/DreRNzXlFHg2AgTTtfjDRLaudroEyy156u0qE=;
        b=Z0ZH5GCBfb0iSixroAL8TZotC5Mqq4rG07SZf8Sy2PRFTpXKun+Ft8AxgoUTpTOiz5
         /EQB9YKENDHp7icH1VquW2mToBvXc8AZDI++jO1nnYDWRXBdcpMbh4fW4J4zq1qcE1L/
         xdf672FmX6/ZMqfM8rOubrdEn/scfLsRw+gRQxuh90agRAgWxBjTKlCPsyYZlqcX7eR8
         PGJXw7NwAggWQzFRfqEdjCRkvBKs6Bt+JQmmpgsRs5QUQxDgPjgOclfxTADc3OcaW/UE
         gSaPzdhkXTBvJ+N9QPOmR/aA7S6M7Df6siulfM/iwg0ixvnmdZMjJxNFAymlXbIe7pxb
         YnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739944187; x=1740548987;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nf8/3/DreRNzXlFHg2AgTTtfjDRLaudroEyy156u0qE=;
        b=L/FCGNEwqiTtsj2XfKhLxTJbRGuHJBzgjXZbP6r6/F+wVbpy6R089eopWX81P8VGrM
         f1gpudlGZnjIyoSazrD/K4TRJbzjIlS8XTddF4SNXNsydPKQOVAZWqKBXOaNP8K6QMOQ
         ajBUASVXnhpkgESMY6PePNWFGbU6F31KH9sC3TWoDVw7MFlXTWOUNJ5epAaajdScp7DW
         hO7O941bXYnlg0DxJwYN5KsqmtztgsKT9E4e6pis1PuW1I5uDqM5bYl1tB7X0fC3XCY0
         BIUOF3TmvVVYzURy6NvTt5f2vhRX1I3KKAerzE9QIw4oolP2aKi2ho2VNiYE46q/3bFn
         6Nzg==
X-Forwarded-Encrypted: i=1; AJvYcCX7Zm3R5pbCdNNcYHTheFm0zkI50jpqj1wQexi4+XLWmlJmdA94lzo3HVwswy85ahOC+CJ5PnEVTvEC5b77nlaL@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi+PXJVSCZeY64CZpsue+eWz/G1uOjWe7ph9bPWSfPcLY1lS1i
	LRMUSpaNAxv64Q/7MHphG9dDTNtPsjfBhUnDPRK7S1P1xAL2zTAf46UKPaiRYHw=
X-Gm-Gg: ASbGncvxS9pjezKC7VlnuTYSYaNeRDvtklUjxLecf4FsmQJyXxjIyEUiVXQP5yZ1l/0
	BqZO/YTVm8jPN8Jn6ArKJeLtbOYCMw3CfTKLWW6qk9keWuTJBHDM7nVYWa+AtjJTnO/6R65UWzT
	cRZgh8meoBDCCI7cFsfymoC79w0U7LoguvpxVn54lIMccZC/UqYvJTeVST36UaMUodCTTo1UzuQ
	FggXCbBGFdSZ/kfm1DLtqInj5h1wMrbmMI5ckckYtPxVmovMNeAvdUQxujL7wq4qvv8/evi/nNA
	Rpx7brarOSNtM/ZPFw==
X-Google-Smtp-Source: AGHT+IGTrwUiHai/F6Gc6jLbRLvEYwLeRI5NCdNzX1yb+2FEyc1a3QDq5aXdiTbSDtTZsAlf5lbhwQ==
X-Received: by 2002:a05:6a20:b58b:b0:1ee:8bd5:81c4 with SMTP id adf61e73a8af0-1eed4fb2d4bmr3091062637.28.1739944187132;
        Tue, 18 Feb 2025 21:49:47 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73274399467sm5972331b3a.140.2025.02.18.21.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 21:49:46 -0800 (PST)
Date: Wed, 19 Feb 2025 11:19:44 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Mark Tseng <chun-jen.tseng@mediatek.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 3/3] cpufreq: mediatek: data safety protect
Message-ID: <20250219054944.4kztb6rtumdt3x7h@vireshk-i7>
References: <20250214074353.1169864-1-chun-jen.tseng@mediatek.com>
 <20250214074353.1169864-4-chun-jen.tseng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214074353.1169864-4-chun-jen.tseng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_214947_981009_F1774F35 
X-CRM114-Status: GOOD (  13.32  )
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

On 14-02-25, 15:43, Mark Tseng wrote:
> get policy data in global lock session avoid get wrong data.
> 
> Signed-off-by: Mark Tseng <chun-jen.tseng@mediatek.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)

I think there is some confusion on why exactly locking is required and where
exactly you need it. This patch is incorrect.

If you really think some locking issue is present here, please explain in
detail how a race can happen between different threads.

-- 
viresh

