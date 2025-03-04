Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8235AC282D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 17:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aPksOpIsWmD4LD84U/zyiEQF/6uAhUOVlj8rScJ6yGY=; b=MiX4+e6ugmaw6rdinTzLvMZL60
	u99m0tvTt7XtcZv+IrFN5Y2dr7KwGonhhG2KYHE+eWO801jVeX/6lvqLIs9/48TIxQtrJZEjDflE0
	xaEvKyPut7GI8nh2aXzR9FQk+IOgtmKxY5WOOAWBl7rxl044F8WfUssNKPDwyzKrdaazoZBKHGcY2
	LAVOrm22O36gXq7prTP0wyqUeOyUB2gq+TFedpXPh0rcuYft1aswkHF4kCzmcytgS6iSClq6jDv7M
	8yG76Rma4Pv1qfU2kg5Jd8pQbGRzhNdYYtvw/DfeN316Twc5x5dy+DFIdwGs1ehd/4MF1O8G509tB
	8FYU6sQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWJx-00000005gsj-16tG;
	Tue, 04 Mar 2025 17:44:45 +0000
Received: from mail-pl1-f173.google.com ([209.85.214.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUId-00000005EjV-1IUe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:35:17 +0000
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22349bb8605so112732915ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 07:35:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741102513; x=1741707313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aPksOpIsWmD4LD84U/zyiEQF/6uAhUOVlj8rScJ6yGY=;
        b=gFRc5cqD+s/U3bgHL9kE7avLOXf9P+BUR+Naiz7fwIS0SJbBrSXy8jMlmOlmyI2Q2w
         +m1fbeJelFrnOz04DSMToDaHDDTz1GE7bm0iSihfry0++njxFQkth1qI4GPQSc343EWN
         58E2+D8b3CMFPJpmwptuWpTBQYuUZSr5GMeKUkbSDkXEU5VrvA199qgonvFxYSCIeZfb
         DgvhXPPzps8mUyRgtbn7T7JVc/LCpWTqX2v3Tx3GcEgjweUrxlOPvp4iutuF12tfuTuZ
         Rv/jHLRnz+Q4UDkYloyyMHLiOL+HzqKMMoRZ2c7cPk42o/sAK8Ke1RHfde5T7wRnsHxh
         a0WA==
X-Forwarded-Encrypted: i=1; AJvYcCXUvygy0DK5oYtjUKDfjxDzbwJ28N6d+PH7ow5zkqWT4ygsZs4F0nB/m6trhUBw7s40N1c70RhkyVNdGRP9OOoM@lists.infradead.org
X-Gm-Message-State: AOJu0Yybpboa6mIP7arhBX6XAMVyqnbAeZd3lwHnAQQFDJfDojo5kGuS
	FzqUPNX8t/Wn141X6FtoFvAU4KO89tG3POovY6BDCYaeCIEk3AQWlXhJiguWANQ=
X-Gm-Gg: ASbGncsMQyBlfFr8eRT8iovlux1sjGxMqLFAYeAodvKHtb1O42+o4XqiWc7FOIMy3OL
	T1/aE6QsMj6Au5SS4KWvpnb7nb8A7S4c2xk+LBu3DQJYSvuA9FirvJ3cAUt7FBHtRxbVfo9RlGG
	fTVlccc5ZxCFBv9HnvwhbNem7UmY0q2Z5JGZgNaUxCpPkXULzCypXi/ppKdQXEWdNNy9PkQ8npV
	dmIaBfIIR8XktfYNQxmH9+IxGAfSb+yNyN6iUotNtakTfiJn2rXVbWrgXDyzqG2XY/GjpXJk3pa
	YP8P6a/nSib3K1PZf0vCIGg+NqDCUDv4qLYXt+ZCFig/0cee2eBfp6xMU13BT+eFY/hDs+wugMk
	/JGA=
X-Google-Smtp-Source: AGHT+IHqM19CmKxrc3+/5zghLWm7z3K7HlW9tJVgM1xGFI0z5/AxnNorz6ln5aNsioCk4N/uTqY9lA==
X-Received: by 2002:a17:902:eccc:b0:215:6489:cfb8 with SMTP id d9443c01a7336-22368f6365emr341829405ad.10.1741102512747;
        Tue, 04 Mar 2025 07:35:12 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2235053e41asm96451805ad.255.2025.03.04.07.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 07:35:12 -0800 (PST)
Date: Wed, 5 Mar 2025 00:35:09 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Shradha Todi <shradha.t@samsung.com>, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, lpieralisi@kernel.org,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	Jonathan.Cameron@huawei.com, fan.ni@samsung.com,
	nifan.cxl@gmail.com, a.manzanares@samsung.com,
	pankaj.dubey@samsung.com, cassel@kernel.org, 18255117159@163.com,
	xueshuai@linux.alibaba.com, renyu.zj@linux.alibaba.com,
	will@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v7 4/5] Add debugfs based error injection support in DWC
Message-ID: <20250304153509.GA2310180@rocinante>
References: <20250221131548.59616-1-shradha.t@samsung.com>
 <CGME20250221132039epcas5p31913eab0acec1eb5e7874897a084c725@epcas5p3.samsung.com>
 <20250221131548.59616-5-shradha.t@samsung.com>
 <20250303095200.GB1065658@rocinante>
 <20250304152952.pal66goo2dwegevh@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304152952.pal66goo2dwegevh@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_073515_343452_D4F427C1 
X-CRM114-Status: GOOD (  10.15  )
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

Hello,

[....]
> > > +		29) Generates duplicate TLPs - duplicate_dllp
> > > +		30) Generates Nullified TLPs - nullified_tlp
> > 
> > Would the above field called "duplicate_dllp" for duplicate TLPs be
> > a potential typo?  Perhaps this should be called "duplicate_tlp"?
> > 
> 
> Looks like a typo. As per Synopsys documentation, there is only 'duplicate TLP'
> field.
> 
> Good catch!

Updated.  Thank you!

	Krzysztof

