Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298E6C02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 12:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nn2m3YvPKxsHqucofUHRKBClV54hrr7dyawjs31YpmM=; b=25ydygnQNBfTeCx9GhIZORbkfh
	5EsEW4JFCkY0VR0kXJqMtrCAY42bJHoOpRCFH83qD6X3FmGk1Os5TRgFpr4nnlWR1Wbiy6t3iDTxX
	u0YbfV6n6HuZqvwZE3KUr5yXum/tJ0UABkjy4Mf+vmwAkH3XvG2U5JYJropVhRJ2WNX2VSrnpVzdm
	vjeJOi/+8KHkfwocBcEGPkA2ai5UeGHTOWl5pWIEdrBiiPAbuIas6oTafZPybMdB/HYbtX+rdEwZd
	k0LNdXkoF6Gt0R5JqHPG4FwfRmTdOWfkMxHsv7M7aOUlFYSVzPm5fjXax9i5MFo/5hVYM7Vsj36WE
	0hOBz3fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY292-0000000BnEi-3uaA;
	Wed, 15 Jan 2025 12:05:12 +0000
Received: from mail-pl1-f171.google.com ([209.85.214.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY27n-0000000Bn1Q-0691
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 12:03:56 +0000
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2166f1e589cso142873875ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 04:03:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736942634; x=1737547434;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nn2m3YvPKxsHqucofUHRKBClV54hrr7dyawjs31YpmM=;
        b=tuOHQABJyWpbdPFsHnsiFZRmd7N9BZbQr6RbSmkfdl4zYT1kn8yRrcfoOyG0yjNo7O
         s9x8dHecwp9hcV1HUMXqawYgMF92SStCVwQSIyN3qML0iz5NPm+Qa6GWhbALt/JcL5w1
         4o9CrkVJsfCl+qs2US3XaBLGkuUzoNBnMzUmr+5bZ7zclFSNcZ//L217myuObg1zI8oe
         GfRapSUoto0bUBxLwfWsNxxdJ/zLiVgHYtKiiBFurWu9URNTuvYQz88PAfkW+bOTiA2K
         gLQbeAo2w8XHIhXTQA92hgSEYHIMCShGbfULlNyEcOi8WePXkGwwswGIC0lgg3zXWhUc
         mu+Q==
X-Forwarded-Encrypted: i=1; AJvYcCW4BbFOwNUd5zYVI18jALmQm+EQOF99SXimD2zx3uS09KGurhf3Obk5DB7Nna5qDOEJEd8G1Es+ijlDZiXyOnNT@lists.infradead.org
X-Gm-Message-State: AOJu0YzaEjS9WbON6dmUxkdXJagiAO283QmlowQ6KKFzk7GWvw2uEMUg
	KfE9Xux58Y4tuD9kHKpjLSfGC03suRASULt4i6uSRlfNpGmwlGOt
X-Gm-Gg: ASbGncsDO4rwNNT7wYIaZlYmxQH7OgTSVaQfqhbctpYU0NaKbLT06uvyLp+gbazNatl
	PjAoPyNQ5kPW7ZDtCjIDOMz5HHKgI4QZB9Ql8WQAy0TyElDGY6xav0Xc2bR/pdHu93r36v5k1o1
	D3yD3mS3frI5zwPJ5B84fXD699F6rRXL3IfBPsjpg/1VUhi4P9qGDIjaEwQM4cmrKGKkdvzqyWJ
	qb5UzRT40x9gT7qvAJJ9Gks77uPt5OHhOy9CFLg2Q1EBaTRSyaxqR/bKqNE9AzCRrYx5lITUKga
	jjhZWhCQKqop7aw=
X-Google-Smtp-Source: AGHT+IEYVToacHIhaLiuPZMNMw8ey/7WGb5On7+yKJ58yY4usQG65tLlT774MHHUh//xwlxvNtx6eA==
X-Received: by 2002:a17:902:e888:b0:215:94eb:adb6 with SMTP id d9443c01a7336-21a83fc3886mr482072125ad.40.1736942634229;
        Wed, 15 Jan 2025 04:03:54 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10f520sm81190325ad.7.2025.01.15.04.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 04:03:53 -0800 (PST)
Date: Wed, 15 Jan 2025 21:03:52 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev
Subject: Re: [PATCH 0/2] PCI: Simplify few things
Message-ID: <20250115120352.GR4176564@rocinante>
References: <20250112-syscon-phandle-args-pci-v1-0-fcb6ebcc0afc@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250112-syscon-phandle-args-pci-v1-0-fcb6ebcc0afc@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_040355_061271_CCD64027 
X-CRM114-Status: UNSURE (   7.60  )
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

> Few code simplifications without functional impact.  Not tested on
> hardware.

Applied to controller/dwc for v6.14, thank you!

	Krzysztof

