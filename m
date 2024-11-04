Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EB9D1BDD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 17:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GUaqYPQBom3i3u/a7qeeh7UaJt4FVAg2tfUFfji99rs=; b=Ezrj9NO5+v8kM6avOuvSrnmwnb
	xEvw+RL/CiTrpTrk/dcjKRjHSiCFpki0UQmeR1xqeugva0d6YLdIZMHEunYWH7A/0iGAcLn0CWqUx
	rHBbvJsNXvzQAIrnM/OGiIujFB6qPvBARF1sdnXmUHN+z7fGnprupCoxZ1IP8T803m6chtQoYbLMh
	G5ZhzoNsAXAWYrPGnkW+te9NCCDMaNHKHl7QqHOiP+Kq4onikrPnq1oerKBn9IAt6TW+P4iYLigUh
	SK3lP6d2qDq4xFscIls1Z42YVpSITFtFhrHs3nL3V8KYa3MNtAKLJDrIP5iiEsCvjXUmShUPj8rDX
	FXcjeB1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t80pM-0000000EWcO-1iF1;
	Mon, 04 Nov 2024 17:25:20 +0000
Received: from mail-pl1-f173.google.com ([209.85.214.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t80TI-0000000ERrd-1s9T;
	Mon, 04 Nov 2024 17:02:34 +0000
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20c77459558so37712985ad.0;
        Mon, 04 Nov 2024 09:02:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730739751; x=1731344551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUaqYPQBom3i3u/a7qeeh7UaJt4FVAg2tfUFfji99rs=;
        b=X/nNxNEbw3d4wpJwTIIUF2W1vgpryEWd0pErSveJDwv1zz0RS5EBcJCD8WN0m0B38w
         9COBDQQjPXy1h3fFSIMNj9wlln7k3oM2vC/TRLi3ajD1wv6ofhFepIm0hotDwGWwpNhG
         steLAyrgRjR+bs/5RcGNSx7ZnvYx6xaGLqEGXiVnZnko0ZPZkqsMAipCVocQrYWdbx4M
         2VdXVQKSNjtpJ2BUcyvuKdezWDw54KYhPXwvypVKKBCTxPtu6Y/KrYAtXzPbrcxzUJPG
         0YN2yGit/1eAy0vg+oDb1QfwbG2noDBLsgK/ievtu33uzQADbQ3zXKmSUQN2i0NIKoa7
         fktg==
X-Forwarded-Encrypted: i=1; AJvYcCUFuNphu2eiieKs4VfwsUUPLcTiiVNWs89nfBkrLL+/4Et+OKY+Kma1SynnJVVCz1n287Lpz87AOTO7doqqPi23@lists.infradead.org, AJvYcCUYoMjca23p/GG2wU3e4fRO3Q6f6jm8xtuJGZpDYC4CoLYAKWzqcQsHsmODn+vagzuAD0T5q6u/4msxCLMgcQY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzGBb7InCEdwuTYyGFckbVCbQ+ogTjIQ90oVx8hnnCLAFyap4c1
	Qm49CSP/lx1FOs3IRoQlykUf6xoNlqrBNtRkc6EwuoJ0lW2eKxerVm/LeYXW
X-Google-Smtp-Source: AGHT+IFb59G7c0c6LtAW+eFwRHDEioTFdbtbcVJx/y76Cx5c5DKoXHLI8G5B+DhlD1xdKyYaLYMoBA==
X-Received: by 2002:a17:902:db05:b0:20b:8a93:eeff with SMTP id d9443c01a7336-210f76d6845mr260100015ad.37.1730739750977;
        Mon, 04 Nov 2024 09:02:30 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057d3bb8sm63610785ad.246.2024.11.04.09.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 09:02:29 -0800 (PST)
Date: Tue, 5 Nov 2024 02:02:28 +0900
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
Message-ID: <20241104170228.GB4055778@rocinante>
References: <20241104114935.172908-1-angelogioacchino.delregno@collabora.com>
 <20241104170005.GA4055778@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104170005.GA4055778@rocinante>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_090232_507637_CE040385 
X-CRM114-Status: GOOD (  17.71  )
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

> > Changes in v4:
> >  - Addressed comments from Jianjun Wang's review on v3
> > 
> > Changes in v3:
> >  - Addressed comments from Fei Shao's review on v2
> > 
> > Changes in v2:
> >  - Rebased on next-20240917
> > 
> > This series adds support for limiting the PCI-Express link speed
> > (or PCIe gen restriction) and link width (number of lanes) in the
> > pcie-mediatek-gen3 driver.
> > 
> > The maximum supported pcie gen is read from the controller itself,
> > so defining a max gen through platform data for each SoC is avoided.
> > 
> > Both are done by adding support for the standard devicetree properties
> > `max-link-speed` and `num-lanes`.
> > 
> > Please note that changing the bindings is not required, as those do
> > already allow specifying those properties for this controller.
> 
> Applied to controller/mediatek, thank you!
> 
> [01/02] PCI: mediatek-gen3: Add support for setting max-link-speed limit
>         https://git.kernel.org/pci/pci/c/ade7da14954a
> 
> [02/02] PCI: mediatek-gen3: Add support for restricting link width
>         https://git.kernel.org/pci/pci/c/6e73c5898973

Angelo,

I made some small changes to the code, per the suggestions.  Let me know if
you are fine with these, or not.  Thank you!

	Krzysztof

