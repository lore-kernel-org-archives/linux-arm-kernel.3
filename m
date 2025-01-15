Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A9ADC02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 13:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cU3e/n6KhYgwGmV111UKdccXNVZHL0iNnBKvqCJS5vk=; b=FY/m+hXcxZkmzyBKpiqi1QlpsP
	jbV3muXL4M9RpqZBVNGZZFTraabioJ6KyT4REAPx5/XGA5j5bvORukhSxY/sTfqErNL+wLjN6wRqA
	FXvvEDsxQXdJGedKDWpWYCOKini34QxUqv5U0WJY+JXb34JBBKgoYS7jxYexwoZvLSqUKD+4edYlz
	Kpj+LsS6KsHe5SS3GlREKMy6ETlqocLXlW8iKG7grieCKZwhlmGNPeSgxmYzOYXv51RQvYm0VAxU7
	AhSq/RDB8m2NB42A1hkARV2aLwGNvb1xZk1e5smllVZMBLB3asoVMB1ntuMJe6DI9HCxwWmpoozsY
	odpsbyag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY35M-0000000BvU9-2jlM;
	Wed, 15 Jan 2025 13:05:28 +0000
Received: from mail-pl1-f175.google.com ([209.85.214.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY346-0000000BvGp-1BHX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 13:04:11 +0000
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-21a7ed0155cso114971335ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 05:04:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736946249; x=1737551049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cU3e/n6KhYgwGmV111UKdccXNVZHL0iNnBKvqCJS5vk=;
        b=lnMesmqbP3j+3BzDK+DE7RXrHdfI7bt3y3wWqV78RaUp35tDmiH5Q+lcS6uKiWKmx0
         bI2qsYl6jI3vUSDRYeClkD/HRroqSEsiPG1XHwzZnUJFXAxliawzjmNtrGnK8L0C89Jb
         SDOA/Ufisg8KIy6gVpUr9pkqyngtp3eE532uJ2LcblCP0gHns2aiW9oFaw7rhoqgX7T1
         yRFfAt3/tXSuTxRnoOn2sjijwNcwXEWKPqSP60Nrbiclqajeo89vTckwxNXzuLkHH6Yc
         26CMBqwv4iHEStCpodpO9FKRNQl/7l65M0rFTE+uA1Fv5g7j97vH0XgFM2pO/LaSviFB
         MpWw==
X-Forwarded-Encrypted: i=1; AJvYcCUBlnormq+IndL92aZV84zWMzgEqgLvR5JolA/l9C96B+Jf3/ZDqqhSORlNoesCSqajdEOhT1XgbOHSBk+wRai2@lists.infradead.org
X-Gm-Message-State: AOJu0YwT6haIU9uew7i+5ZHiEEq697SI0hWW6G4tBp0/bLS5HGzO2XdE
	TdIttEn11YRXnwA9MQIb3+BjFDyjFooulJB1LaI2ksTzqeUgcUWe
X-Gm-Gg: ASbGncvqGKV/Ay/HVSmUUDFEo23bw9Yto9fwwzPZLqllIkWQ49f2YQvVMjuTGKBwGia
	E2nOUpx4Ac43DWYyQFk5J5pVv+dYNJOjhc/VgGg+56u9WjPGCi/hgXa6VLOZLGku03VmAWi2bfu
	2HRkkrxk2jL+GJ2X+O87h5V1CjRIzrxoGEHATRTmQE32pSybIVph94nFEg7NpCLtTwWK+WrMzz0
	i9K+FtBOvowT/SThqUTLIlDIl+ua7FGsSdEgG/qbYoMbLgIp2LDZY+ve+7YfStyrHa2oeB21V5f
	Rzfaf5Jf6wZ/uQM=
X-Google-Smtp-Source: AGHT+IGJ0xkBFQDRoR8kdZYAlnl/B+msy18AyfBuH1HwSbOm/KPPtntHdjqM9javko0XPog/mwl9og==
X-Received: by 2002:a17:902:da84:b0:216:501e:e314 with SMTP id d9443c01a7336-21a83f54b4bmr429475315ad.20.1736946249035;
        Wed, 15 Jan 2025 05:04:09 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219f0dsm81875515ad.139.2025.01.15.05.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 05:04:08 -0800 (PST)
Date: Wed, 15 Jan 2025 22:04:06 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: l.stach@pengutronix.de, bhelgaas@google.com, lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
	frank.li@nxp.com, s.hauer@pengutronix.de, festevam@gmail.com,
	imx@lists.linux.dev, kernel@pengutronix.de,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 0/10] A bunch of changes to refine i.MX PCIe driver
Message-ID: <20250115130406.GS4176564@rocinante>
References: <20241126075702.4099164-1-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241126075702.4099164-1-hongxing.zhu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_050410_316282_76BC386F 
X-CRM114-Status: UNSURE (   9.97  )
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

> A bunch of changes to refine i.MX PCIe driver.
> - Add ref clock gate for i.MX95 PCIe.
>   The changes of clock part are here [1], and had been applied by Abel.
>   [1] https://lkml.org/lkml/2024/10/15/390
> - Clean i.MX PCIe driver by removing useless codes.
>   Patch #3 depends on dts changes. And the dts changes had been applied
>   by Shawn, there is no dependecy now.
> - Make core reset and enable_ref_clk symmetric for i.MX PCIe driver.
> - Use dwc common suspend resume method, and enable i.MX8MQ, i.MX8Q and
>   i.MX95 PCIe PM supports.

Applied to controller/imx6 for v6.14, thank you!

	Krzysztof

