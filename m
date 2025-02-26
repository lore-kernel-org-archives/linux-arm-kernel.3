Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BE2C19776
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 06:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BFPHzWF9dvrF9nnBiTWLXmH6iPscf0ArvWzi8p1a6zg=; b=qW+1BsSoYVx6vsrPPgwQeme1uI
	z7Qn13uiuAxxInGm4HedmZHVtYP9rEvnsUwpma7V6HUZBnawrYtHP0hJKqafbdvPvK6Gc9KVs5zT0
	VB6/4wR3gyU9Jrvp3wWSO+mJePXP62irmfJmKv5TDzcYnd7yH02iyx7hMGOUn8Sj3vp2it4nHS6Zc
	fcQdyLH0djLLCjQbQF4WRxtZsdkK0rcD0tUrbEg25OGYewIAsKMjowQqb9A8P9xwWkAolEkvll6Ot
	G+Lxy6jsuB5UH/fkXAlUgTfwMcDABSyx6cxHnKp1o2QjW9MNzaRD3RNJRVJ5xutKnC+8ObQP6U1lX
	6HmfKqNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnBLG-00000002bsR-1QIC;
	Wed, 26 Feb 2025 06:56:26 +0000
Received: from mail-pl1-f174.google.com ([209.85.214.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnBDx-00000002aj0-0ATx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 06:48:54 +0000
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22334203781so1829225ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 22:48:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740552532; x=1741157332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFPHzWF9dvrF9nnBiTWLXmH6iPscf0ArvWzi8p1a6zg=;
        b=woG0bGF1IKq44/zC2lxesV413E54Q5b/Eap0F/UBaS0JkppUpK34JTDZstk98+hUyC
         lfU5toXBp2o1ytFEGhVlYMWxsb6V80PqEWbtlqUy+WS/6FLUjePT1l/OeZWC+P6vIs6U
         yRE1h2O66fwDZK3O4ZkFopCceCaovPzc23MiGdkNmV3LKFRFjDc7uOQpvy0hrmhzFGAa
         rOP5CHkiIY+hBiHTWQGnB+39DYCOm/AK5RhWI3NWdo5tO6P00SjxDTT07NtbclUWxaNG
         jKR42NIHR0twTWb+WmrequT9ZKl3dwI+zshQFftPwF/bBD21L0LGPaKbPnLQuhPgfFNy
         0HrA==
X-Forwarded-Encrypted: i=1; AJvYcCWaH1/k8txPfSNOErPaoAqe+Q98IxOCUscxpKOf5MFi22kx2fVPzleEDQ0YebypHTKFhDjLqOwTMqQ3fkN/RWlT@lists.infradead.org
X-Gm-Message-State: AOJu0YynANKan/DxPV6L+tLAebGAGdk71OkTqQstXhS2a+nzgs4dYkGU
	kAAZvYhhOx/Ya7FLE/suo6iBugXFxoh8/XscN8omc0Y2ZLOYOPiN
X-Gm-Gg: ASbGnctRiA1lfSxhP1P0XwKMo22+QDmyC+TBeVO1QLkz63TFwS2J3lu8DMzm6hzvfzm
	QLInTkwr/NfR+93vJm82mnfD4IrtN1WyEx9vq02/LbXCIPmN/2MY1IKX3PH2UcD+mRf0oQIUCrQ
	1VSx6vuBYVlEOdy1+L2GHG6ePl4gWQHY8SS2PUqz4Ik0EDQ9wb7QvVjlWnC8Ezb5Z7HMIaJn0Yt
	1+ctpqQoEoioDabsFs7vPDWYMpateACt+/k70It0Y6ErydWzXjDu2+3mjsfBPyxz+Hz3PEP+xam
	YeYe1j0BxlwHJt1sm4SnKI45LsG6Kb8w4YQSrvsedeNdwWFnuJurh3FotEQJH6uJ7opFhc5OvTw
	zmHU=
X-Google-Smtp-Source: AGHT+IGcE5VWjeLtYFuzMnR4StCCXIyHnVIwT6r2xYT1E3w/+YsuMDqsIDN1v9y0CaB1GqFIti/+Mw==
X-Received: by 2002:a62:b419:0:b0:725:4a1b:38ec with SMTP id d2e1a72fcca58-7341406be25mr35814240b3a.3.1740552532025;
        Tue, 25 Feb 2025 22:48:52 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-aedab119e3csm2394339a12.76.2025.02.25.22.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 22:48:51 -0800 (PST)
Date: Wed, 26 Feb 2025 15:48:49 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: Shradha Todi <shradha.t@samsung.com>, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, manivannan.sadhasivam@linaro.org,
	lpieralisi@kernel.org, robh@kernel.org, bhelgaas@google.com,
	jingoohan1@gmail.com, Jonathan.Cameron@huawei.com,
	fan.ni@samsung.com, nifan.cxl@gmail.com, a.manzanares@samsung.com,
	pankaj.dubey@samsung.com, cassel@kernel.org, 18255117159@163.com,
	renyu.zj@linux.alibaba.com, will@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v7 1/5] perf/dwc_pcie: Move common DWC struct definitions
 to 'pcie-dwc.h'
Message-ID: <20250226064849.GA951736@rocinante>
References: <20250221131548.59616-1-shradha.t@samsung.com>
 <CGME20250221132024epcas5p13d6e617805e4ef0c081227b08119871b@epcas5p1.samsung.com>
 <20250221131548.59616-2-shradha.t@samsung.com>
 <855b4178-cbd5-4d95-a2eb-32c5ee0e5894@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <855b4178-cbd5-4d95-a2eb-32c5ee0e5894@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_224853_078387_24D14356 
X-CRM114-Status: UNSURE (   9.77  )
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

> > Since these are common to all Desginware PCIe IPs, move them to a new
> > header 'pcie-dwc.h', so that other drivers like debugfs, perf and sysfs
> > could make use of them.
[...]
> LGTM. Thanks.
> 
> Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>

Thank you!

	Krzysztof

