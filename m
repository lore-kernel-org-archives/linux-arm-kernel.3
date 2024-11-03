Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375B8D11192
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 21:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNiETQqq1UCKEb0cYaC36KUXh3nW00A/xcFef3/fb8U=; b=FGFrQ054NhwC3JeuJx+ZlElxTp
	j+BFXSB7VkqXbhuMDq2hdpSQc85s2kv1oCSm2lh/PMYxxfsocrJwXaILaBASELF5KuJU4s6vINAIg
	M5s+6ALBjfHJnVJrtRiZB+ioOozsDNcYk6Qtiutrncjtw5RAA84RS+XmvKHwlo6P1Jn1+YOlZBfJ9
	b3GiXFA/mrCbPdSF6/RNPfiiGEKRWlROxx9qDOCRMmjgdCdhk9x+orZ27nMES+pAorlBos+Fpdwo4
	3ysCoLK+eEFp71keoLDyBiaHHtjiGbJJ6RBL759KzAOwqe/JXBaN/C2ffZ4e428wDCJmRxGzcvNJI
	tOdlt2pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7hpe-0000000C2rm-0rS9;
	Sun, 03 Nov 2024 21:08:22 +0000
Received: from mail-pl1-f176.google.com ([209.85.214.176])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7hml-0000000C2ZG-32Yg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Nov 2024 21:05:25 +0000
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-20e576dbc42so36208535ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 Nov 2024 13:05:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730667923; x=1731272723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HNiETQqq1UCKEb0cYaC36KUXh3nW00A/xcFef3/fb8U=;
        b=BXJGbUarHpcnowCxRy91EC69lzCd2ooebdMsv0s2eP6RZy6+La2AUJ22/V53hrZiZw
         mM8ao0t/3DU/vDkYRFqh5v8Ao6RxnxBbSzN2zlbl8SxjQUb4RVCrjfLQeK7au+VbMCVs
         jFAO6aCazJ5nI9gnmpzOLv7OQmWH63Ynhv/HzwJ1J+IsojXXXCMkKjN9ycoV5Z92whL/
         nk2KCVJiTOprzyTW4npz7yJvdnZOIKjCbABqFqSjirfr+i1XpDoqyR4ui7Qh7gn6XmXy
         LyBUKHtT8q0WY8OT/52325/zT8pqM1Y/xb8vbziMZjYg1eAEjj/4LnYlUihliTFI72AU
         qf/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMjToY4C80rdoSttemLvDUwo9QpcEdScV3K7grxHEML0EbjRACFbQHud6fnH6HvV11ymwtcNWayix5ARUON8RZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxNimZrYpC3ydSSMtqiwAu/hLgLp3f1WYodnARKVP//NABm4qr9
	RXI8uKcXxkSTJ29Ioh5DAtgZm3/1elE7N3po48Jj2Q+/0siP5suN
X-Google-Smtp-Source: AGHT+IEsYeFE1lJc2aiVA3A0z+UJcWlxmRRyHQYQ/KK9DhmdwXc4RIW44CfdrpG0c7bSj17NZa01Og==
X-Received: by 2002:a17:902:ce07:b0:20b:7ed8:3978 with SMTP id d9443c01a7336-21103b1c60dmr204824515ad.26.1730667922717;
        Sun, 03 Nov 2024 13:05:22 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056f14a9sm49955455ad.62.2024.11.03.13.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 13:05:22 -0800 (PST)
Date: Mon, 4 Nov 2024 06:05:20 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, robh@kernel.org, bhelgaas@google.com,
	manivannan.sadhasivam@linaro.org, kishon@kernel.org,
	u.kleine-koenig@pengutronix.de, cassel@kernel.org,
	dlemoal@kernel.org, yoshihiro.shimoda.uh@renesas.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH v2 0/2] Fixes for PCI Keystone driver
Message-ID: <20241103210520.GL237624@rocinante>
References: <20240524105714.191642-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240524105714.191642-1-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_130523_788795_CC672843 
X-CRM114-Status: GOOD (  16.38  )
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

> This series adds fixes for the PCI Keystone driver.
> The v1 of this series was posted on the 24th of March 2021:
> https://lore.kernel.org/r/20210324121901.1856-1-kishon@ti.com/
> There are no changes since v1 except for rebasing the series on the
> latest linux-next.
> 
> There were no open comments on the v1 series so it appears to me that
> the series got missed when merging patches to the PCI tree. I am
> reposting the series after rebasing it on linux-next tagged next-20240523.
> 
> I don't have the device corresponding to the older "ti,keystone-pcie"
> compatible so I wasn't able to test this series (specifically patch 2
> of this series). I have only compile-tested this series and logically
> verified it for correctness to the best of my knowledge.

Applied to controller/keystone, thank you!

[01/02] PCI: keystone: Set mode as Root Complex for "ti,keystone-pcie" compatible
        https://git.kernel.org/pci/pci/c/7a941315dd2a

[02/02] PCI: keystone: Add link up check in ks_pcie_other_map_bus()
        https://git.kernel.org/pci/pci/c/76a496ad8536

	Krzysztof

