Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E4B3C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 12:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1HnWB9RWsVBWnpOBg5WEW3ASvl2XaM92u6YTY3vFQTs=; b=lah3wPoO93znq7JdgGC42Z1EBX
	Xbd7GlZpziIyyC36b3mI/4A9G08/YgI2hZdCMp75bP1e7J0wh2SqySFJCnGzQsQBYHd7TuMsufxzo
	7UwhotLjENfR1yGNUY6ZHFPrbyg3C+9nSNpp2EzZPgmCw5mgPHAfzv1BeRD1P2W5B5rnyGIIyXdRw
	XKIfB63e/aLIoJjaG+Ur1uiS6l2SpQ5t8vb7YWzbeIGTWW2aQZ/1yHiV7uXnvqBDxgneUIBNhP/Op
	F2ZuNigvDdk6SLLdL2Bgf843XvoBQ+coTBb4Ekh3I9dTp8GVcXstSSZH98zZkHOvo+IHhs6HqLYV3
	qjj2mLPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twKcJ-00000001Bvu-3ftq;
	Sun, 23 Mar 2025 12:39:51 +0000
Received: from mail-pj1-f45.google.com ([209.85.216.45])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twKac-00000001BjQ-45lw;
	Sun, 23 Mar 2025 12:38:08 +0000
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2ff64550991so4632330a91.0;
        Sun, 23 Mar 2025 05:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742733486; x=1743338286;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HnWB9RWsVBWnpOBg5WEW3ASvl2XaM92u6YTY3vFQTs=;
        b=e9SJ8orPwLrJPTTQ8VF+enVg5bU7BKwnNfCZbej8TcgrjL8F9sBNuyQm0moCo1Tlr0
         BO8QzM7g2B936QTrQTmsd+kZwZcd9OLWy5yEzemaKVa0+/myvbSxXboEGumPDSrvCi7P
         bsQIFTS8A/wydnHeathuS/fUqO6nasvxxkd8iP46DJCBWgZowhyupnkhW1X9R6q12m4w
         QrcqCXmJ8Flc1kql5UO2m5cx68VLKFHUjsjJ0UYeI/NPVpx6BFnQf0F+nIBPVBtZZVqS
         lU+wFvkS4R2VOH/mvQNAS8Q1lS86SruOKkYWmdyFiCqzXLNv45rWHVpi1DXyjbQ/tiSb
         zlqw==
X-Forwarded-Encrypted: i=1; AJvYcCW+HaLW2JHQxWGsaJuTZcF3eiIMUfGQizTgTtZ0VIoqjtH05mf0nxN9hb8gR4RGIDlvlqWStBrq21HGLBll9Gql1w==@lists.infradead.org, AJvYcCWYp8v30vJEedsqhHLlCj4QH0VrSV8839/jxU4YSF8F7KC3obNU3mQcHq52Lw0z659DeaeC1msNzOD1xhbl9BdG@lists.infradead.org
X-Gm-Message-State: AOJu0YxXFTWVhBasCVjLLOY47QyMfNnaZGVvMeqmIoSZegS85X5yOnIT
	KfPPJGXlTlkMKMYHeua9gd0RUdkJOcz5nYLNGOiq8t6lLpmZgRag
X-Gm-Gg: ASbGncus9d3aA6Za8kX/KRLjUJDz6P0TfP0/gZFb9IfoM/LDrwl48vEE66I+cqEH/Nr
	SkyMQlfJh2jIRza6xo1POIdqiTEEOjWvlAYaYPEPgYdVFvpNDIkmRJPjofcUxyv8//OhazMFoNY
	lJ6n9oZNbxv1tVf6w3hZm3Ox6hgW8ZtUS+jjrWMKLVNsHEgECPNVA9yp5e4dfFycHU6I6Gyfmqr
	tJNfLRuUSQcP7o9e+eNs3K0zJkofGizaMql/Ft1vUZOKMLQJKCTLnV/10Jr5iFx6aDOotVBso92
	id3yAcOWV0SfamLPRD63M7DlvLZle6v4rQRQFDwiyfzsM1vlTKtJDJlS+nY9pp39WNvM30JpE9l
	j6PM=
X-Google-Smtp-Source: AGHT+IHrLv6luYgfmwyuvu1tJl/93WMsciSS4yr4NNbis4gxiGP2i8SnSlB7c290PtylAh3xnlTSFA==
X-Received: by 2002:a17:90b:3d8e:b0:2ff:5ec1:6c6a with SMTP id 98e67ed59e1d1-3030feaadb4mr17480277a91.18.1742733485859;
        Sun, 23 Mar 2025 05:38:05 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3030f7e9d86sm5844767a91.37.2025.03.23.05.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 05:38:05 -0700 (PDT)
Date: Sun, 23 Mar 2025 21:38:03 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] PCI: brcmstb: make const read-only arrays static
Message-ID: <20250323123803.GG1902347@rocinante>
References: <20250317143456.477901-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317143456.477901-1-colin.i.king@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_053807_010948_BAD841FE 
X-CRM114-Status: UNSURE (   4.98  )
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

> Don't populate the const read-only arrays data and regs on the stack at
> run time, instead make them static.

Applied to controller/brcmstb, thank you!

	Krzysztof

