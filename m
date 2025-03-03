Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94981C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 19:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2CKI4zBybc+xDXiR4bNdoML7mcL6qio7NNqVOxcVnU=; b=FFqJ17VAE+ogfETXxr7RnJrOq3
	hBzzoQhVxZY2lXXpVvN/jw9ou78c24RUPsMrGjjs+ZzzpSJqrYS954XP8qO+EPaEnorOPWHrssja+
	BC5iCVo02v/eC1m6frdbgFdYb04DW7bjwlb6TfWzPkefi+S23k7n12DLrFQw1WGBwnMEEJD/NuwRR
	8BQVybi9w/TNB+Aifj+Ppn7DRqUiPARdTszUjF6Ngd08z5ZqxsrTQre/oLFCZud9Xp79OT2p86axa
	0DK09gN4x28iwYeIn7XiOlS8WgX8BU0iG1ImBa3hOWiXMiCYIjbeX8cOBCV5xJOC/9kgxF9RAwuNe
	al0+hu9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpBr2-000000026wJ-1izW;
	Mon, 03 Mar 2025 19:53:32 +0000
Received: from mail-pl1-f182.google.com ([209.85.214.182])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpBpQ-000000026bC-3XLw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 19:51:54 +0000
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22334203781so92984565ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 11:51:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741031512; x=1741636312;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2CKI4zBybc+xDXiR4bNdoML7mcL6qio7NNqVOxcVnU=;
        b=N2UyF0MJMSAsQIhGvBj0MkgTPmBYykdaP+ciVBAjL42d3OJAEKFo2MUm5Q5SNQQUdu
         9R2He7Z9lX0jLmgUExhnoBsNq2G7+Vm6a8rLmg/qbVVcutWkleE0vgO50oVptj1ZN7dj
         eiURgXP2+/vPfcVP6ua+8V+7kxQVBWvVDCGrYF/x7iKzNK0mtcDrkazvVGF+HdhwT7nm
         egI4IJ4UX321ToEQERXuJUW5OaG4eIi4n1WGuuvfzAJ2cZKGSAXZUaMZtybwSGy/+7QQ
         Fea+vLkV3RUgb3j9pxPiLvPlSCRSLkVvLGrnzCtMs8VXtdp73KwxWa9hMQ6d9zosahBN
         71gA==
X-Forwarded-Encrypted: i=1; AJvYcCW2OEVoXtYZZNl0d2NwmXBN/G+Ojpb58ByOOc3QGXxMgLSwNLbgqTWdg0TQW17eDt/NVvSXhe6A2XsstIF/G5ox@lists.infradead.org
X-Gm-Message-State: AOJu0YzUUKIgXeAGJUnMngAJSr6TLzqr5Q178Ljn7kFlUVEckGQJmbOL
	CRkoBg/q8ODqxBaawl2XPw97ANQ+y+f7z3wm6TZJ4TMeYziYNV99
X-Gm-Gg: ASbGncvXiPzUlTEhimnBEJLz6GUEV+T/5s8dV8NdMt8OHBwafJQgX4USWHEgdDoY4M7
	0i/sFo7tHXshnOnSaEz+DsAy8ixzJ926wUKXQtMv7xQURnxRd+TJGxdD2sMFEIRZLsiCEGClPx5
	d4uubyeJ0HkLotXCuPXCP2r7n+u0ViAK2OcC4BYvGL7wxJqjGzaeOIFOZT5CH+f0771Z3SZe6X9
	aonuWF8VXbUROGWhiTa4HWZVXX3jNeW3tOr1XYepbxaxFzqBUHKeubd3kj1kuYXS2dxQ54fhKLT
	i6exPp4APyWyXFZCEt8BGWMbTlvzEs7pYMSWkmuFBdF81ITjzJ+WQbNSahWph11ka9MnZ6Abf4r
	vFhY=
X-Google-Smtp-Source: AGHT+IH+EFbEps/Env/viwecJzf7dRRJVQvIfNTlMDSlf181d0a4uYVPYlR1DNAdfEAQSeUvTmrcqA==
X-Received: by 2002:a05:6a00:4b10:b0:736:47d3:b2f2 with SMTP id d2e1a72fcca58-7366e6414a5mr863083b3a.12.1741031511942;
        Mon, 03 Mar 2025 11:51:51 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-734a00255d8sm9272490b3a.88.2025.03.03.11.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 11:51:51 -0800 (PST)
Date: Tue, 4 Mar 2025 04:51:49 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Shradha Todi <shradha.t@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, manivannan.sadhasivam@linaro.org,
	lpieralisi@kernel.org, robh@kernel.org, bhelgaas@google.com,
	jingoohan1@gmail.com, Jonathan.Cameron@huawei.com,
	fan.ni@samsung.com, nifan.cxl@gmail.com, a.manzanares@samsung.com,
	pankaj.dubey@samsung.com, cassel@kernel.org, 18255117159@163.com,
	xueshuai@linux.alibaba.com, renyu.zj@linux.alibaba.com,
	will@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v7 0/5] Add support for debugfs based RAS DES feature in
 PCIe DW
Message-ID: <20250303195149.GA1814481@rocinante>
References: <CGME20250221132011epcas5p4dea1e9ae5c09afaabcd1822f3a7d15c5@epcas5p4.samsung.com>
 <20250221131548.59616-1-shradha.t@samsung.com>
 <20250225143001.GA1556729@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225143001.GA1556729@rocinante>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_115152_878837_DA9DAFDE 
X-CRM114-Status: UNSURE (   7.76  )
X-CRM114-Notice: Please train this message.
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
> Applied to controller/dwc, thank you!

Updated the current branch with a few missing "Reviewed-by" tags from Fan Ni.

Thank you!

	Krzysztof

