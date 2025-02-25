Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E6EC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 16:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wfjw1HKQVvRq0BsR7wxCvBaXgth/Ba/pzPz08eLvgdM=; b=cu5X9H0IW4hothFtomtBfwyiXu
	7PfpCo9tE31Yryo63F0zC1dbVKzH6t5Z3rjKETA/61IJW+1pfH/F0uXFKXs+lMoXTz8DCkbQN9F0j
	p+/2dtPynMvEmu+nQulCZ8IcJSmw8xQrdZRbnidWFVoAVGUgpkpelCEANrpaSq6h+w3CBjcQqCPAU
	VZa2KBS9d03kWjvDDKrR0sek9DtvwrK6QPsxB11yHaO0eaikzGPolgqTlTWmgdlbqKbp7kqTZwpaq
	M0JF8GWVypQSLTWFv8Oszgi7AddN6eKEI+tb2xXqy1002eUCDp3QXAhfPKuhUi5vjmMBj7/Er7fLe
	neshh4Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmxzC-00000000Iyc-1gsD;
	Tue, 25 Feb 2025 16:40:46 +0000
Received: from mail-pl1-f180.google.com ([209.85.214.180])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmw00-0000000HXZL-3cqW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 14:33:29 +0000
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-220d601886fso86867365ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 06:33:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740494008; x=1741098808;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wfjw1HKQVvRq0BsR7wxCvBaXgth/Ba/pzPz08eLvgdM=;
        b=H4AA8AYmx3acTJVrxXJRnH2C/PH0SMmFNhVRVKJ7dkdhSXrVGZ+j6BUlC5Bd4MtWVW
         0rIjpprRBvlXRFPPhc15L+9WgqMf4M2TDostGys0z3FDiZHbzUDNxl9zxTG+dhKdg9aD
         +lEWf/tjifu8JAwIQdnfiiJ+LhRqgobfKtQetMfgaxbY2dUvDvUKeodvJAwoB0/srPjL
         P4WApZcAVyzDgnqggrfMoCwpmdZehriPSS2/4eP38o/8lRbZzBdID6kDleM1KxSAyuku
         73Dq3EyTx6YQmB+Za8nEgdMaKNBaJSfRlNQxGsTsD5C4Q4TO/MTgLpW9XS8CRsw7Vgne
         YHjw==
X-Forwarded-Encrypted: i=1; AJvYcCWPVmqITor+uDzJSIezcRAfWTC5YnBsuNN/Nsob2H0wNhPtKTcGK7qUDbSNTkZO8sptFlkFCwGpG7egB/fZkeye@lists.infradead.org
X-Gm-Message-State: AOJu0YxEoob76n5AM8hEwYjgSS060vBMxi3D1kC6DaDy6901f9HO43jK
	i2d0XWqAUxSXhnNFQDNpSjB9VsksRhTTV+69N+TH3t/cXbknuq+J
X-Gm-Gg: ASbGnctaWMFXLDo5khNDG+YHCkRr1NnIQ2Sv4KPkcAWJ+0kobrkb4m79C0Q88wjnz3z
	5d80n+6xnnHkWmDSkY3dw5EQ+SVWzlD2fk5mdIpmPc8QpWRq2BCtf7eC59qiK0bgZsG7daNaqz/
	l8x48RHolTYFgYrSPZtd1p8httvz31otOuvjMkA50h1X94sISke97kJEprQ3BI4HGxexzPehw40
	zycwBbTQ9Yhr4fXh+NpyVp1EF4DWldT8sMG5ddUb+XNDDBdX9Hulo1OV3YYFZu2imsvz79WB9VC
	oGE2lm2ixBLrB29esu2bBYXFG3mbI0HjPSeTZtwPqMAjVLFzdFdgi1Ubw49x
X-Google-Smtp-Source: AGHT+IFiIC1p2JsvGz1HBLa46/0n3Ly+kaAqBACASxC9/r77WzUjMbOSLV/Jfp7om7mV9KcQCdz2UQ==
X-Received: by 2002:a05:6a20:d492:b0:1f1:458:fe80 with SMTP id adf61e73a8af0-1f10458fe98mr2109104637.25.1740494007946;
        Tue, 25 Feb 2025 06:33:27 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-aeda75a224esm1420946a12.15.2025.02.25.06.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 06:33:27 -0800 (PST)
Date: Tue, 25 Feb 2025 23:33:25 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Niklas Cassel <cassel@kernel.org>, Shradha Todi <shradha.t@samsung.com>,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, lpieralisi@kernel.org,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	Jonathan.Cameron@huawei.com, fan.ni@samsung.com,
	nifan.cxl@gmail.com, a.manzanares@samsung.com,
	pankaj.dubey@samsung.com, 18255117159@163.com,
	xueshuai@linux.alibaba.com, renyu.zj@linux.alibaba.com,
	will@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v7 0/5] Add support for debugfs based RAS DES feature in
 PCIe DW
Message-ID: <20250225143325.GB1556729@rocinante>
References: <CGME20250221132011epcas5p4dea1e9ae5c09afaabcd1822f3a7d15c5@epcas5p4.samsung.com>
 <20250221131548.59616-1-shradha.t@samsung.com>
 <Z7yniizCTdBvUBI0@ryzen>
 <20250225082835.dl4yleybs3emyboq@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225082835.dl4yleybs3emyboq@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_063328_903189_7DF35D5E 
X-CRM114-Status: GOOD (  10.36  )
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

[...]
> Yes, it would be appropriate to return -EOPNOTSUPP in that case. But I'd like to
> merge this series asap. So this patch can come on top of this series.

I pulled the series so that we can get some mileage out of the 0-day bot,
so to speak, and also get some testing via the linux-next tree.

That said, while looking at the code, there have been bits where I wanted
to get some clarification.  Nothing will be a blocker.

	Krzysztof

