Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20CB3C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 09:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40J+Ql5K6IK0gLn8z0lNt2yYrMqV11O1QyGkgGVKClI=; b=zocEqP/FpF7kDUGJJIqVvtcuy1
	Km1WPlaDfVQkuZ/T+1xP5CB1ooUuTHVhARh2UnaAB/aLf+U6k8suY1AqsexkuEHzD4V2KMXnysXqD
	TX3QhfoC1NW/U9cQ/iRZVsWcOA7Szfa/Izdeok2e7kFw3gEb+N2pbLCJ3ObaDegnCvWpwhYujqf1e
	bxTHLXtL3Dfz92EewF808sS3liUO++SMbpXbRot248omeRLqbEe8Gh1AmETBdHqWRLseSqFgJsmsC
	Fj2jSWiSQSh3jJmqKOqHVhx68PzkkWeUtAQMaznctjuTbqQ3XsO/FP5IzbUkurtX2RgljkazSBEs+
	KGa/k3oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp2V7-00000000DGC-31A1;
	Mon, 03 Mar 2025 09:54:17 +0000
Received: from mail-pl1-f180.google.com ([209.85.214.180])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp2Sy-00000000Cws-1VaQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 09:52:05 +0000
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-223959039f4so23409975ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 01:52:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740995523; x=1741600323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40J+Ql5K6IK0gLn8z0lNt2yYrMqV11O1QyGkgGVKClI=;
        b=WmSbDD957iHQTDBrd32fHksrCr3dWYZOs7o/qmKwtgcIYJXzeH5ge5SzIVLPjSEWio
         sgu6Ne2kd9xnHNDzL+1e8lEH0qa6NhMfkeyU6h/AbxoJeN37pPBVQqNCvX3rg4bpql/h
         MAAf5zpy81rsrepOAREjHQo56gxbaISxqZQZj40/FbQa8zRIb1LN9kiAyY/akfQx1aRl
         0gHV0nIOLSqpmObpMAg3xZTiowxHkjALzaktO5nughKkAloqig0uMVK/okBdKyEnpua9
         SnSjU981SxzVCBxU7TnwLZeT0GS1Yxrr3WEOlO4dyqoewxZjtLlbA0Jog3OQ4MAufHeP
         ot/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVP9YTDQV9lQ76lKCJhaDzLxEN4F/krX+o1WHyd9tD38NoxeKGSlRZRaYqBIttblpIq4/y8aGuCAmqhUiE8lQP6@lists.infradead.org
X-Gm-Message-State: AOJu0YyQhDweVijhNbELsslBD3wp0BmhPCUXNZVAQorzogKYkvjLxVsA
	YmgBS6vrRMihtli5ySGfPeoyk90Y6pDhM4jKZRaHuospQ573nwpm
X-Gm-Gg: ASbGncsBb5b0GOmqc2/XiOeU+keA8SQM93iFCyHC1gLgr1NjVTofabcHbVKGDt4YqtA
	JEYCyHQVDM4BzUoYate102HOMFqA9cwOtodcadXyk/Ev8mNASBsOgHm/DFHRdSjQ7KZVUVAo5N6
	LislteXW7Nmfm63FRbN+17Yln4rMFxgLiEzx7lUminXvXQe5Pv2Ri0Q+fvVT+XfzvzgrywTIplT
	Gqs//b/OcJtjiNY3f7DAHhyXrqKooNbF+ZW7BHMQWVXtS61ed9IZNacTqRjdAFCJ7dV/tNz9CRt
	YxJK+1OlyV8aGjaeT7hCscH2buVGsSI0FCegMoN5Kmq2NzLJqgXFXKJGyb9HQ4m4l5rxcP1/VnO
	/+gc=
X-Google-Smtp-Source: AGHT+IEWAfT5Z97RfY9VXKqz6TqnQKfcazGhBUq366+ebKsHwhmWqH4G2doQhibh2hZGJVaVQ0CoDQ==
X-Received: by 2002:a17:902:fc48:b0:223:66bb:8993 with SMTP id d9443c01a7336-22369207c1fmr208309815ad.43.1740995522806;
        Mon, 03 Mar 2025 01:52:02 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-2fea67532a2sm8540087a91.9.2025.03.03.01.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 01:52:02 -0800 (PST)
Date: Mon, 3 Mar 2025 18:52:00 +0900
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
Subject: Re: [PATCH v7 4/5] Add debugfs based error injection support in DWC
Message-ID: <20250303095200.GB1065658@rocinante>
References: <20250221131548.59616-1-shradha.t@samsung.com>
 <CGME20250221132039epcas5p31913eab0acec1eb5e7874897a084c725@epcas5p3.samsung.com>
 <20250221131548.59616-5-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221131548.59616-5-shradha.t@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_015204_396378_5E1A8029 
X-CRM114-Status: UNSURE (   7.62  )
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
> +		29) Generates duplicate TLPs - duplicate_dllp
> +		30) Generates Nullified TLPs - nullified_tlp

Would the above field called "duplicate_dllp" for duplicate TLPs be
a potential typo?  Perhaps this should be called "duplicate_tlp"?

I wanted to make sure we have the correct field name.

Thank you!

	Krzysztof

