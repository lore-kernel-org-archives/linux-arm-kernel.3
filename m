Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 909E9D1BDD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 17:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X40B+sMh1eGF1F0jxlLbQBcht+sGrnCIA4ApgNyX+v0=; b=V+PDBPrHUdXXi1ge2jpD9jMcIK
	/Ech1WnC5omKRZkjEKWMrPASOGwLmFKiyKva424bxa5sIBM/MtLJ6XdoQ++ec4IY/GITzs513q9Ms
	8hO/R/DfS9H/t6jiu856+6i33vyXCiwvoV1eXBwXn1ADDDLerjYYVf1QDnbJLSeKTXcB27+JqVPAj
	1EcdgqqQZfIR0HFVo1KQWNzbE/q5nOGTnPfp3/WXtl7snlxkvADo6ufflVLJyFj1ZGxE0//ui4awe
	Dk2GSZzdraruBhOFaV0GjeBtoqtJM8bPjRZfK76/7JYyh8RzlVSl70BGhmJVv1Qi4z32ljFtbJhnv
	0KNQG2hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t80nh-0000000EWTN-1hwP;
	Mon, 04 Nov 2024 17:23:37 +0000
Received: from mail-pf1-f173.google.com ([209.85.210.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t80Qz-0000000ERK0-2Dhy;
	Mon, 04 Nov 2024 17:00:10 +0000
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-720b2d8bcd3so3530908b3a.2;
        Mon, 04 Nov 2024 09:00:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730739608; x=1731344408;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X40B+sMh1eGF1F0jxlLbQBcht+sGrnCIA4ApgNyX+v0=;
        b=PmkI9Axw0+xAiajxyQlZFYDlniv9gIblavtY0+4kMRdotYo22Yjbfv38LSbXmqDmbm
         lhLRupWA1EaHQVmtIAPO1mt8KZk+of5hqyBY2mOWcEWBy8srVfZAivoCmD+U8XnrgNhr
         oYBq6sUcjCWnJLstUVQaTyUs9IIEtpvrk0QFddGsSYOAdTbMdh1ODaVdVXRlQcAplPq/
         9D9XngA0TCGXyS0ujTDBdkK9YiPlgwy7EJLZ6ik9fBM1NMDUSLcx87llRfcdpgX5Km4p
         9VYSPNbtnESd+kGUyzM4qQNzCCZPhl4kwIZWK8BZwFtT9mpaBwIOOu8ETMmwso+KUsdo
         COBA==
X-Forwarded-Encrypted: i=1; AJvYcCVvCPr5mGjIuF/ZMIYDAtqKlwWjqHICa5LxB0M4CjG4CBUKYlzWi9Wa707NcNaHaOn2nNTDxNJvx/31/HoBgrw=@lists.infradead.org, AJvYcCX2/c1K4XgfZNM3k3mJEcggZntQB1cYXMHviPeX4LMbNnzwsBE5GX8rzzLoxSlEAAKCA4SK3figQ66CeYMZuAHx@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4fI1pI6ZmkHhRm6lagFG7iVID76wQZx/MbQdtB4+Ubm4QIpmx
	5Un7dW3ScYVVTGY/DLwVu+7/yESLbiL+hsq0ys85DmEcrBh2jNbu
X-Google-Smtp-Source: AGHT+IFTmb9Csi7s44ZdeNILi3UIE6RcdAkVf+D6pNViSfkFFQF6wwO/W5zTeviYxlBEXREuuveNEA==
X-Received: by 2002:aa7:8f97:0:b0:720:aa27:2e55 with SMTP id d2e1a72fcca58-720aa2737f6mr20398086b3a.14.1730739608131;
        Mon, 04 Nov 2024 09:00:08 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2eb586sm7981636b3a.149.2024.11.04.09.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 09:00:07 -0800 (PST)
Date: Tue, 5 Nov 2024 02:00:05 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com, lpieralisi@kernel.org, robh@kernel.org,
	bhelgaas@google.com, matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	fshao@chromium.org
Subject: Re: [PATCH v4 0/2] PCI: mediatek-gen3: Support limiting link speed
 and width
Message-ID: <20241104170005.GA4055778@rocinante>
References: <20241104114935.172908-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104114935.172908-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_090009_600821_C988F445 
X-CRM114-Status: GOOD (  14.01  )
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

> Changes in v4:
>  - Addressed comments from Jianjun Wang's review on v3
> 
> Changes in v3:
>  - Addressed comments from Fei Shao's review on v2
> 
> Changes in v2:
>  - Rebased on next-20240917
> 
> This series adds support for limiting the PCI-Express link speed
> (or PCIe gen restriction) and link width (number of lanes) in the
> pcie-mediatek-gen3 driver.
> 
> The maximum supported pcie gen is read from the controller itself,
> so defining a max gen through platform data for each SoC is avoided.
> 
> Both are done by adding support for the standard devicetree properties
> `max-link-speed` and `num-lanes`.
> 
> Please note that changing the bindings is not required, as those do
> already allow specifying those properties for this controller.

Applied to controller/mediatek, thank you!

[01/02] PCI: mediatek-gen3: Add support for setting max-link-speed limit
        https://git.kernel.org/pci/pci/c/ade7da14954a

[02/02] PCI: mediatek-gen3: Add support for restricting link width
        https://git.kernel.org/pci/pci/c/6e73c5898973

	Krzysztof

