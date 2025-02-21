Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A26AC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 05:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1+VcTlrh2l11IgMDF+pMIycmCnoBAI/KGvY2QstYpd4=; b=cgvs+qtcBDgG+Rdb4qgSXynf+S
	T/XyIv+o8gB1a5Dc+OyffD1Tv+d+jFGt9qHIInLvvOLMDAfQ76Wx+158G0qHORAtnaPLRN/acNq4d
	++WtkpuposjEZbqJq/GqZzHDVL6XkNI6GrUly6BrEaWLzd230GTVlwIqbG8s+eLNambg+3zXhslvA
	FciAcEIYsdAKxjjUQ6iCSWseaN7ydAh53H5G9R5RH28gSVl4CqsUY8d45fh2w5K1B/MugJAopgYKo
	ehR38OK3tPqvvp5ZkV9z+ZGEHtR5S+TPW5+Gw2uwjcns4LPvYcXfy/pXZl2mGgTu9ZMg1UqqaH1Nx
	yeKv4FtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlLuh-00000004H1O-3ps6;
	Fri, 21 Feb 2025 05:49:27 +0000
Received: from mail-pl1-f177.google.com ([209.85.214.177])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlLtE-00000004Gpv-2TK3;
	Fri, 21 Feb 2025 05:47:57 +0000
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-220d601886fso26187045ad.1;
        Thu, 20 Feb 2025 21:47:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740116876; x=1740721676;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1+VcTlrh2l11IgMDF+pMIycmCnoBAI/KGvY2QstYpd4=;
        b=JdnKxDjDP2sbRGSU+DMdQyeXs3p/WRm7sKm9RW642x4BblJZ8uTJ5SnF5W/4vHfRBg
         RNm0y4o8ntsqoPXqZ1bV3/m730XnWYYdgnKYka0qtD837PFaF6scSL1m1EdaQV4tTaEp
         PTZPAGSVQoO/3HiBnY4t7XxjxJKKTBEEIt6p+yAFYUeBbeKezo/GEDT6W2suZsPhFTrN
         QAeoZLIRpq06IzyhCpD2b+Nu5fTrR6JaeekoV0gQcejT3kd8wapKinsLDmP5y8/TyJRD
         i4WXS6o5pW5QARZ4NHT05KoRxu1Mpl3Gl8iPxrQm/0w0r94bFzm1X0jkG/za+KlHZse0
         T6Og==
X-Forwarded-Encrypted: i=1; AJvYcCUZUKDjxh1+g5BayIDfML/LPCMSMnGSlyoIHefRCizQ1eCRCOcxJGftPpOPHJUlvN/J7h+lpe1fkVbH40gZdT9y@lists.infradead.org, AJvYcCXo/9tz+ls28uIhjUkUXqt62XBGmoz5O6hSl/6xWf9W/DrggAolXN6kVZa0jbUT9/UGVTIvtAen46bceK7HV3c=@lists.infradead.org
X-Gm-Message-State: AOJu0YyJcFYFS3LeKfxIBVcV2S1MCiuGvTrLQkz9Cp16Wfgqzi9kvKRB
	K4sa5fd3UK+z4/hUKRT9Jrg5/xHUkqVqUyIwlEVOnaijyymTHI/G
X-Gm-Gg: ASbGncunxFmNIUKnUMIKCB0+As6M6Qz5V/MDMUUNjQW7kEfYCsaIdjCrskJ/g9fZLT2
	RHpMiqNp6Bl9Gf9kklmDiH5+0fLeuMyD0XI5+y7pWfKjt4EwoxA3WIewBJSnRWY05NWF3uCG8JJ
	f0dTmJFH6OsHsHcV6sk2vwxJMsumdSBFvG42WKuIfr3M6HlKDPUXAa/mVW/TUehss4h931AhvFS
	rdRxdnKDu/1HQcT8DiwPs2SL25vLmNDkT6K1x+ZEAava5pNpQE2pWbpURwB7fbCCDQ7sx1YoLsC
	UXIOTq5+tvcMhF0X07GSS8yYpJ0115Wd/AlW7lz//kfBTMktAOxyYgYDeflX
X-Google-Smtp-Source: AGHT+IEdcf7MMT9L143/Y8zgePY0fQ0gqscRv0VoBJbbnWNbz1oWlX6sGsWy4WQoLC8z3Z4STYSKVA==
X-Received: by 2002:a17:902:c950:b0:220:e1e6:4457 with SMTP id d9443c01a7336-2219ff5e979mr28136435ad.26.1740116875566;
        Thu, 20 Feb 2025 21:47:55 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-220d5348f12sm130817935ad.46.2025.02.20.21.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 21:47:54 -0800 (PST)
Date: Fri, 21 Feb 2025 14:47:53 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] PCI: mediatek-gen3: Remove leftover mac_reset assert
 for Airoha EN7581 SoC.
Message-ID: <20250221054753.GA1376787@rocinante>
References: <20250201-pcie-en7581-remove-mac_reset-v2-1-a06786cdc683@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250201-pcie-en7581-remove-mac_reset-v2-1-a06786cdc683@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_214756_651727_04A56E5A 
X-CRM114-Status: UNSURE (   8.12  )
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

> Remove a leftover assert for mac_reset line in mtk_pcie_en7581_power_up().
> This is not harmful since EN7581 does not requires mac_reset and
> mac_reset is not defined in EN7581 device tree.

Applied to controller/mediatek, thank you!

	Krzysztof

