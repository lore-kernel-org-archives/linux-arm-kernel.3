Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAE3C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 19:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kMdhomqR4u6eFz7EL0HdhdFWnLeoGWNJPxOHYDhbRLs=; b=N57KJyCZKww9UOFeu8WToOXvCI
	bjgd53R11mEm4LYDuL/e7hLZoO9quLsTxUUFWPy5I55/MhRF3TpIzjtDMLJG38rPPmQC4t+ZHRgeS
	CozXJX6zkrsyTrlVSe2S+pOw3NDCHSE165D5U75cBtLLjufmSd8A2LGu3zstERMNdMLralJjlJQvE
	PZQQIXlLgkgdhXrYyku3l1y9sGohBhCm2OuI0399Izlj4xzTkGPF3k4beFDgqPnXxNsaU5Y5iJgjQ
	+ySO+IyWmVxavzzFCirNPzhwKW2YoxCFwhUZphXYVB/CO8MfwWqHQfRQHD8RLDyAq5ypSHKNJFyJ9
	CTBIWC5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpBFf-000000022Mt-3oCh;
	Mon, 03 Mar 2025 19:14:55 +0000
Received: from mail-pl1-f174.google.com ([209.85.214.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpBE5-000000021wN-312T;
	Mon, 03 Mar 2025 19:13:19 +0000
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-223cc017ef5so14649555ad.0;
        Mon, 03 Mar 2025 11:13:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741029196; x=1741633996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMdhomqR4u6eFz7EL0HdhdFWnLeoGWNJPxOHYDhbRLs=;
        b=jAl7Bsmd7hPG52rWcNdnIZSmESIorVdXFomOWISOc0wf8B+sVDdnf251aWVpH5GiOo
         NFZ72x0+TvJUks+e1wA9Je/6q28McyishdY+xW6F4XH4i1aKWkukBvcWbSVetF7rRa62
         +/vbHBJhwoJ7fssqT06C32TenRzgmyat/QQgTa6uWHi/RncnlLLRjyE3RatKr1F6cefN
         wDx3v1x73cTqi4VhKcd3siBwjtgpjIVEteSf9z8fE78Dupi3Si+ISnU2qIrZSnCIeLUk
         CAmDXqLbaUH2e1cBJM7IeVpwzPcNVcm2u3gQtryLKPJ4M0QqjYfF1ALjCnQHEvQgj3rL
         Y0BA==
X-Forwarded-Encrypted: i=1; AJvYcCV8btncNEtI+tcjszqRjtLXy36G/yGa+lwzDpLBrA7LN4O3eYW1ELL439ixPrjRuFD+L0uXCFSjf22mZkx6GjI=@lists.infradead.org, AJvYcCX/jiRoGxJKG5o6/TxM2qhraVwhN9XvWTpypAxBf4oy3pn8Cikvv/LcA3JYZaSn+++8XWrIXRH1GMxIgdYJeHlI@lists.infradead.org
X-Gm-Message-State: AOJu0YxizN3lPOQiJgprA99J1pJOyBSBOt+fz46SUBpsyyxg+dL+WEqP
	RZhnvQzHT8V3Qv06CoyO+QdWexdc1ppEDOD+MbvdFcNP+hGJb9Bh
X-Gm-Gg: ASbGncuswVid3qiSEo5mafNyQ3gkofEegUiQqYZiLOdM7tTWtEUegp3XxMsnEQ5aQHA
	jVsYlHkCMC699exxRsAQJeVF6qtpHL+bKxmLTW6kFtfKaazpXaujeN/xIibjCu3hX1wxLVrBMJl
	PJSABRZJYf4Bxh5mBo60aSW0eM89G5tGlnVHBu3lpHdymAVKsX7Do8Nt1ttIGgSVRRBStRfiLaA
	YvqcgnJ5Vg/4K4uplfV5ZELul8P0rF2yhRhEGJtBtyYGEJgJZ8WlvqQnLCT7y9iZhsE+keBN4wl
	aW8fqTH9hX7bT3v3TTX9AyDkKUEHFz5hJhfmqY/r/Zkvu4SO5/z6S5Kk0PJ222KPgkmyomFxQvG
	wA90=
X-Google-Smtp-Source: AGHT+IFWuOdDCIbzb+NPKXQr/vDDylShl9+ZLJtMDPzgxZSjAC8yWUsr6ofw3AFRZJpI4pkui7tCgw==
X-Received: by 2002:a17:903:1c3:b0:223:33cb:335f with SMTP id d9443c01a7336-22368fa17fbmr210787435ad.3.1741029196546;
        Mon, 03 Mar 2025 11:13:16 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-223504c7efcsm81587665ad.154.2025.03.03.11.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 11:13:16 -0800 (PST)
Date: Tue, 4 Mar 2025 04:13:14 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 0/2] PCI: mediatek-gen3: Set PBUS_CSR regs for Airoha
 EN7581 SoC.
Message-ID: <20250303191314.GA1552306@rocinante>
References: <20250225-en7581-pcie-pbus-csr-v4-0-24324382424a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225-en7581-pcie-pbus-csr-v4-0-24324382424a@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_111317_752906_DA17F3C3 
X-CRM114-Status: UNSURE (   8.37  )
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

> Configure PBus base address and base address mask to allow the hw
> to detect if a given address is accessible on the PCIe controller.
> Introduce mediatek,pbus-csr phandle array property.

Applied to controller/mediatek, thank you!

	Krzysztof

