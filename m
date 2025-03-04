Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1C3C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 06:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wdiYB6hv/Q3Efvv78nZapqYNYn3PY60w2vwZzb6NEH4=; b=s8mNog+bNmEtIXZk98OapcaqBK
	OHmLlDe3AVhzLQXOILehES57b8lufe1yL8bt2gIp1iy+but0J+uoyoyN+LDPVrmxq9mpJEJYOQHn/
	y9n5sRPO0Pir0aiR6BStsEgk/ZD4MJAsv8pJD6C6uvJrFATHgV5B4uAyML4juJUX8XgbqnHFDIrIj
	nke09YjZXO1Fri4bsh9AAmwhd7ZUPziFBbBal0Ux2PoxkQ6W96X13pBx3bsHnB21cC/WJZ/IH66fG
	gKXFv5+kIWfPtX8BV/zFN/0wooXrSnS92rC7aNsRyrP7k8EqSKWr+QrtJLwu4IpCE6IrnkmIRBr2K
	1l2krQVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpM7y-00000003MAF-3hV5;
	Tue, 04 Mar 2025 06:51:42 +0000
Received: from mail-pl1-f172.google.com ([209.85.214.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpM6O-00000003Lpf-3CMY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 06:50:05 +0000
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22339936bbfso76868215ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 22:50:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741071004; x=1741675804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wdiYB6hv/Q3Efvv78nZapqYNYn3PY60w2vwZzb6NEH4=;
        b=sLsimJLPwovHX2uBCDHZUYRLdGm7kevkTVixqvvK3uHQX7m+JoHTEwcPN7utWpRqcR
         0qsuhkNLiDl3dmSHKUmbQjx4NxmtA+d/zpb769NJGUccv7DLeG+S/Iz2PkYbdSXTHzDd
         2905KegehKBRq5lyEHbTF1phsbssWhyKu/AhPS13g5SlMmUqY7oC3m5dlV83V1AZ+ZeU
         gPxPbIkqdKMwjivGGUrMuW8nS36saS5+8XlrxvPCI2iBWa1Zz4e+i1WQzi4qx7OKlZ4z
         eqzdxZWV1zCIF2Zg70dgOyXp5Q24kN3V2K3MAjc26XbfYA6QmT2Pbpx3Cn/6TPWakhSN
         1lQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC2+GzRC8zmzHMFOxs0LiALdxKaWx8u5UERfsXiQPMz35hoeTSSuWgfV16fWvfRcnzS9OhwikK/auU4p2bUNuP@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc3wAF+xfOxMctnxCO+SAdgtSU4FC1u6wiWjnJL3A4W4V7SOHP
	tdmklPY3UYEkYue6dGG9OxJWOfOmcvSeyNPtFZtjpGNjHA99g5NO
X-Gm-Gg: ASbGnctxAF+ytBYzsDJMdJH1gjdaR2oIy/0h2nXZMm6HAlD506Wos6kTyfTWZ8ws+2W
	3KtPmMSNWUrCKcF3AH/cQ9dOW7ZBNjuKUNqakGBKaD3cdIG3HO0Tv06RNHPiWLHzmfH0yR15v/U
	PNF13MUSrrkwOb/gtnlgX4jYo16mJkXEB38+xVdUXJzvbQ5bKvfWmZjtu9cxv4sRjvCW7TR6/q/
	oh8dolC1wFBUQ2+4eEhTJws/1jN+ACN+CjwupSS8nK5wvGmqFoT8FYvHkIxGu/pxLgpuU6A66Vd
	aH4+XqgFIZ2H1ditruTf341t8D788ymjgfLRXRiv1Shvolc4hlaMB3yqEE/1dew70ZdvMj/6PBb
	gnJc=
X-Google-Smtp-Source: AGHT+IGcV4aYk/OpEVH73Ug+c1C0USAo6FdZmKpOcH30W1Dx1DXHv8XdmGwDQ56GkfHpVhuZmtZPUA==
X-Received: by 2002:a17:902:ea0c:b0:21f:136a:a374 with SMTP id d9443c01a7336-22369268794mr260988655ad.43.1741071003728;
        Mon, 03 Mar 2025 22:50:03 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-223501f9dc2sm87929895ad.61.2025.03.03.22.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 22:50:03 -0800 (PST)
Date: Tue, 4 Mar 2025 15:50:00 +0900
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
Message-ID: <20250304065000.GB2615015@rocinante>
References: <20250221131548.59616-1-shradha.t@samsung.com>
 <CGME20250221132039epcas5p31913eab0acec1eb5e7874897a084c725@epcas5p3.samsung.com>
 <20250221131548.59616-5-shradha.t@samsung.com>
 <20250303095200.GB1065658@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303095200.GB1065658@rocinante>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_225004_801838_3C8943E0 
X-CRM114-Status: GOOD (  10.76  )
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
> > +		29) Generates duplicate TLPs - duplicate_dllp
> > +		30) Generates Nullified TLPs - nullified_tlp
> 
> Would the above field called "duplicate_dllp" for duplicate TLPs be
> a potential typo?  Perhaps this should be called "duplicate_tlp"?
> 
> I wanted to make sure we have the correct field name.

Fan or Shradha, any thoughts on this?

Would the problem be with the name of the property of the description?

Thank you!

	Krzysztof

