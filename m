Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A2AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 15:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MaJ8SLFG93FwYkFp7sfKg4X+KPodbWjwHYeXqqA9L2w=; b=Xgz7qKwpSOyg+lHcdhUeEei4lg
	ydCDexpMLOSxy+XtVahPpiB2QxUNCve5zvJpOl6R0tNGHMcNMQO7u0U25QZJUTyxgCxHgdbbAE+NO
	2Ahd/NZ8BdrjdIU4LM07ldGEamTtvYlVccwfskJ22ejv9OPpindR8F+3P+N9Uxz/ItXh/99biSAdf
	xHIfNc3YBtIIrAc0FHaDZnkhvY2LSePFsmiDxjoVyI25Mz5BPnyVpTWL5fCq4F2MuPNKe2dEYetux
	JuJ5asB25Nb0GXBPnAPSMLS+QLkA+e2pBGZIEuN0oX6NURB+vfQIyjUzdbxh95II+Ld928Pcse1Kr
	nHxPdDhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1AF-000000064b9-02Wp;
	Tue, 11 Mar 2025 15:05:03 +0000
Received: from mail-pl1-f182.google.com ([209.85.214.182])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts15Q-000000063YS-24PH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 15:00:06 +0000
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-224341bbc1dso73025635ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 08:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741705203; x=1742310003;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MaJ8SLFG93FwYkFp7sfKg4X+KPodbWjwHYeXqqA9L2w=;
        b=C0iq0luaPz0XR3OjLubEFsDmFeB9s5ETeO2XuRp63fJcbEiSgcjFfBRLQKmyei4L+/
         b7pNULDmgd6IciTAMb8aYXVGFkqrhHCRU5e+oQBBOOuCR4B8tVYQHGsiGn9Xm23Ws+Nf
         qwBgUwOV5ZqyOfXLmZVyN5+ZrMTwf37cTNazlvmLp0YE9N9Ax+Nu1lrnwFY5Ax6Bbjp7
         bsI0fQnJQDcrcF89HvNif8HB82I4UoerSEuQQQ85wFq3pC1AixWUkpiUJi/pkzNaS0BM
         6EWgu/5tNDBNjkJzAk/6Q63RuD4NRCWuGWevH7nGMm1P87NZYmmIvbfKRb16WMnmqpRP
         TzKw==
X-Forwarded-Encrypted: i=1; AJvYcCVCLwdfjcoHAb/Ze4T/xfgbbpL0dRIvBfV1R7MXGkSEUEAlvTtzRQLl2KcXX7evYqWTTQ42DTwkCd8fXFfv2uWB@lists.infradead.org
X-Gm-Message-State: AOJu0YyO+fKwhwpQ74oaEZWpUcnVH/J+vuAO+krEpPgPaD9IdQHQCWTy
	zrZuZ4fCDegKKZXLfXE8bFWLrl5topFfyfrrxcP9JkAwg3+xyGKP
X-Gm-Gg: ASbGnctkK8PbZvbEqeVOle2NOgdzI0PhrmMwBSfYlpbuygzT5JEMlpJgISmw+1MRL8a
	8UjxLP9ltqG7enho+8mLF1drZGp/KGDErQRX0oWzS+7/GWiMc6t0VEAuSN5Oi3yJ7aNNc5jXMnr
	1YPzVJCdGSa2DUxspuy5bH+LfdTnKihJgnhXxeSGypqMoFJNgfFhmsi7siVgRfFWUzXR3aNqIBA
	lhGPVNJIOmczbq4amOZp8YkLGE1G4oEaKb2HoqbrfZRWiWimFfy3MXkkZSfqTnlDeSizZd08Itb
	+1quq/9QlyNATormtddvLeGn+nMN2Df/WstlFChCJx+QPS77i7iF1LIiBV6oMXs6nHwy3CooHPu
	CpQebB77H5AzXlA==
X-Google-Smtp-Source: AGHT+IGDF17bVy+X8PD1CLxyryITaYKCJ8HP+TmrU6K1QilfB9RwZjOgz3kvEQi1n6fSoKOwqa28aQ==
X-Received: by 2002:a05:6a00:cc4:b0:736:5544:7ad7 with SMTP id d2e1a72fcca58-736eb7ffa52mr5264312b3a.14.1741705201877;
        Tue, 11 Mar 2025 08:00:01 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-736e3f9d4f0sm3313957b3a.145.2025.03.11.08.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 08:00:01 -0700 (PDT)
Date: Wed, 12 Mar 2025 00:00:00 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, vigneshr@ti.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	bhelgaas@google.com, rogerq@kernel.org, linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org, stable@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH] PCI: j721e: Fix the value of linkdown_irq_regfield for
 J784S4
Message-ID: <20250311150000.GB1381004@rocinante>
References: <20250305132018.2260771-1-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305132018.2260771-1-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_080004_541522_4FD10082 
X-CRM114-Status: GOOD (  11.11  )
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

> Commit under Fixes assigned the value of 'linkdown_irq_regfield' for the
> J784S4 SoC as 'LINK_DOWN' which corresponds to BIT(1). However, according
> to the Technical Reference Manual and Register Documentation for the J784S4
> SoC [0], BIT(1) corresponds to "ENABLE_SYS_EN_PCIE_DPA_1" which is __NOT__
> the field for the link-state interrupt. Instead, it is BIT(10) of the
> "PCIE_INTD_ENABLE_REG_SYS_2" register that corresponds to the link-state
> field named as "ENABLE_SYS_EN_PCIE_LINK_STATE".
> 
> Hence, set 'linkdown_irq_regfield' to the macro 'J7200_LINK_DOWN' which
> expands to BIT(10) and was first defined for the J7200 SoC. Other SoCs
> already reuse this macro since it accurately represents the link-state
> field in their respective "PCIE_INTD_ENABLE_REG_SYS_2" register.
> 
> [0]: https://www.ti.com/lit/zip/spruj52

Applied to controller/j721e, thank you!

	Krzysztof

