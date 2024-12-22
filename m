Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71EDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 21:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ySFOKP2T6SSvf2783MptIdxQD1iRTp1mDG8rIDy1B2I=; b=WMd3xl8fTSY+h8zWSd+PfCpvDV
	+mh76+zrLfSPomuOmySmOwkPjjgh0kIbyAMwHxe9xO44HCX+Viaiebr5MQjdxes3M8OIiMhIh7Hkm
	oCxTeg1eI+DYocLX45FU2j+S/M3Lj1XVLs2lDDv7r22fQd/C7g5v/8G1Cqijs3NWFzqTEYRpuMAl/
	/aUxtceapkZ+o3xtSXfq/PWMC/FBVEtOr51xZmU+p4voLXD1kBxdwEGDgJutd9d0jgkjgiRl1OFAT
	LoO3FFRhX4ZnEuALVZqfXHlbnqfK2kN5jruRsJJ2Lo26YnDhgEw9+bhtgh8KfvyoAw58J1tGad0qr
	WWFf8x1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPTM6-00000008qu8-0NQ9;
	Sun, 22 Dec 2024 21:19:18 +0000
Received: from mail-pf1-f180.google.com ([209.85.210.180])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPTKt-00000008qpQ-1ALu;
	Sun, 22 Dec 2024 21:18:04 +0000
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-72909c459c4so2797051b3a.1;
        Sun, 22 Dec 2024 13:18:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734902282; x=1735507082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ySFOKP2T6SSvf2783MptIdxQD1iRTp1mDG8rIDy1B2I=;
        b=H0xmyiQMfBiLdVnBfqapOIH5MWOiwBCX7JQ1wUiamiy2RE/qWs5TsNlDZ6KLSBFcr2
         ZNkaS2ce6gDO4n4y3ANTDxretbMnuMHYq0DD70Bzaw7YlyjgFx7QZBV3q77EwO4MB+fL
         z3YenzNy7cTZTtU3gn5hIpHnIoRK144oyKdRGIV4wyNjDnHbX/HnvYRCzbmv7/lkxPjD
         NojEj4mYciCIetReT+XEv1sRwEPDMrF3wRkWQYjkRGlOjzL730lwNBx4OHmWW97uENfp
         XTtnbeXn6RBVb+bxq3XrO7r8gHACepm829GZi42Cw1yPSXW9Pt3MMNj1pGGNJ5z8K3dh
         ObEA==
X-Forwarded-Encrypted: i=1; AJvYcCUIJKSwIlDFZrBsamL72WCdAB2pKwUu8dgJknl5LwDzxFTPHM7tyjnxw3ftMs5mI0N98XeCrgkz4Bs4jIFk8sw/@lists.infradead.org, AJvYcCWPa8F3xN5aVN9Y9MlUWHvVDAEpGeA2qn6x1EG4S3RyTXA3DBtrGzlcC3FARKdPCN9v8NifgxraPeFg6iwrgU0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzAPIuJHu8UoCWzd9H98Tys+FT7dVZRKszXs+FZpZNu7rG9EMi7
	df7P6v/xlIGphUy4tBqm/ASaux2e41OgBDJyIJhEq9CTAD/NqlcG
X-Gm-Gg: ASbGncs6xQZs14xOSpxFQRA+1qzMG3iWeTIb49hY/lLD8JkzT/baGxp5jU54B0WO3Oy
	3A8vGon+jzz31MG+IW4s+mSLeh0JjCYHT1EH553flnynKOOskQXrhJkWHT8d0MynVliN4YEf3AI
	UM88up7DlIa17eMmSRL6ovQRipsjVB1PgybwZr1pmgVGNQpwDXALzG4LNeB2CicfzeTjL+sq1Pd
	GJ1/KIZZuNkH7LMQw//KxRHCx9Nx3CwU0/wVx4JrjMCo3lQIEPWE5NWR4fx1pM/8PF2A57agb/J
	iRiPUvIys+22dOc=
X-Google-Smtp-Source: AGHT+IFThwQq8fk2Aa5r1r9/KyCTguIoXFq3omelBgI+dXM6jILXlipwMI/2/TJlCG5GvLarF8F9Hw==
X-Received: by 2002:a05:6a00:330b:b0:728:e382:5f14 with SMTP id d2e1a72fcca58-72abdd7bae3mr12566717b3a.9.1734902282291;
        Sun, 22 Dec 2024 13:18:02 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8fb957sm6746272b3a.140.2024.12.22.13.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 13:18:01 -0800 (PST)
Date: Mon, 23 Dec 2024 06:17:59 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Christian Marangi <ansuelsmth@gmail.com>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, upstream@airoha.com,
	Hui Ma <hui.ma@airoha.com>
Subject: Re: [PATCH v3] PCI: mediatek-gen3: Avoid PCIe resetting via
 PCIE_RSTB for Airoha EN7581 SoC
Message-ID: <20241222211759.GF3111282@rocinante>
References: <20241113-pcie-en7581-rst-fix-v3-1-23c5082335f7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113-pcie-en7581-rst-fix-v3-1-23c5082335f7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_131803_324367_7C26DABE 
X-CRM114-Status: UNSURE (   8.97  )
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

> Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
> causing occasional PCIe link down issues. In order to overcome the
> problem, PCIE_RSTB signals are not asserted/released during device probe or
> suspend/resume phase and the PCIe block is reset using REG_PCI_CONTROL
> (0x88) and REG_RESET_CONTROL (0x834) registers available in the clock
> module running clk_bulk_prepare_enable in mtk_pcie_en7581_power_up().
> 
> Introduce flags field in the mtk_gen3_pcie_pdata struct in order to
> specify per-SoC capabilities.

Applied to controller/mediatek, thank you!

[01/01] PCI: mediatek-gen3: Avoid PCIe resetting via PCIE_RSTB for Airoha EN7581 SoC
        https://git.kernel.org/pci/pci/c/0d0a2b74dc08

	Krzysztof

