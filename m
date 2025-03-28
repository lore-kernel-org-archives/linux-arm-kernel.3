Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D444AC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 12:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s91gS3ZTf8YeYYH5MnclAC4ck1ph3hH5lBLldv1VsOA=; b=yFw+SXVU0WLu+5jNZhVlDWx2IJ
	4IbMZMRKWH6wGCaKbc7GxTAkybh6B+IQRbwILFan17Xydnw10Nok5lLVg9MDNqlIOq4QPNYUFVhjP
	ImutVrF53XeQKz3LkSvgLZfP1Xb7bSuOCZ1LnGWM1xpokjnqLzMfmQP5mtxGIX1Rj8+OFwK2vidSW
	MQVTjANS5jiHHGyezePJnXS4snns5Hs47Fb6EmajtZNv+cvapQ5O4Dxsl/Q0eNB5KCh/qa+fmc78z
	MsjbS7x1A8uaYH7SsImkvFVJzF0x11Z4YqzzKkFnOgpsu53QeP6oQeSlHNTLhRdC3O9MUQbmdE1M7
	LAaWRf+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty8yS-0000000DKKA-35Sk;
	Fri, 28 Mar 2025 12:38:12 +0000
Received: from mail-pj1-f44.google.com ([209.85.216.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty8wc-0000000DK7P-0751;
	Fri, 28 Mar 2025 12:36:19 +0000
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-30362ee1312so3668187a91.0;
        Fri, 28 Mar 2025 05:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743165377; x=1743770177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s91gS3ZTf8YeYYH5MnclAC4ck1ph3hH5lBLldv1VsOA=;
        b=LIl1YPUwyE8L+eJiu6rI9sXW0Zrx/Yax2Cw2uLYPpv/bnNimVvbfJpGuDs2TmYJEE+
         9yv7UhScOMpZFJQ3I5q4XJz9Tn7eDCpCeQ200ZoZNbzw4nUs1hYEm9NsIYgL+pnf/8nS
         Z8xmRnqTVLjrtPz81pydU4SwB78R8HLhzug1Mk2cCzBaViF6+7cVNM9VIQoPT29KHBc7
         fjIncHM+riCeIyLEfwMjrcBUY6BFNjOPe7iT2F+SzjJwSOsbWp4AOoifzs0zk+gkfvHm
         maR2BgOxxDsh9HcScje7vqFM7q09FQ1LvM3YhRRGyWKvifX3+LvdTBB/Dg3ggiypb5BF
         hVlQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaU/O1SWhAr9GUfcxq+j5+urTne4VuGXNFUgrTLBtpAlEjFMza1x51r4qj/se4w2ME1UsWx8wsLd8HwAT4t7Q=@lists.infradead.org, AJvYcCX90gM4wj3ZnQNA1qf0PloFH1SaxUo95mwrO3PDhFxFu0Sm9ZdrgvHbN9aUy0OLs5NKSyFN8NsN2E9d4EdlIas+@lists.infradead.org
X-Gm-Message-State: AOJu0Ywshqqte7YL5xyStjVLbk7GS8CWNVBM9iD9XdBOAiLnuNns624u
	h0bm5x9YQUbqjA2JDuGZmyctJRFN20w/mr4MgkwLCHF28vZQJj+j
X-Gm-Gg: ASbGnctzihOy+xIulMrv4fF3gL56ILTC84r3R3XKkVgQD6ZB0aKzXyFOx8Mpk4h0ZVT
	pH94qFClnF4PDmd52qVx5+K5msD7znsP3WLNXPSSU1maElPLLae+NhDKVRhFbO1kK5IE1+o6EJE
	r6kC/bqPovAWC8cIZK0Bgv0mqiL+NEIJYIHtzj3m+HGPjlLZqMYmMI4lF8dJ2e0BwvJX8RUSpW3
	xCGvsKolLGGx96emo7Agk3492OZm5limrnnPGD1KcQkLVsip4uNrxHlCIQ8UZuw0R0tXVVIJBVx
	2nhmyBAri686ip/Z8vcQoAQlI8JAmGnNw05lTZkWQ9c8LjUVa8ZulMbyhf8m4jqXCQ3uRJlQDu5
	m6A0SF5r9C4+3OA==
X-Google-Smtp-Source: AGHT+IGlAd66FNmavdbS7CR1qNFbwkljXHkJb48mCAC2R7hMVIyBsmG47UAORbPRGzD6ZvlyCmfhIQ==
X-Received: by 2002:a17:90a:c2cb:b0:2ee:d024:e4fc with SMTP id 98e67ed59e1d1-303a8e78b3emr12478191a91.33.1743165376962;
        Fri, 28 Mar 2025 05:36:16 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-30516d61686sm1690708a91.22.2025.03.28.05.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 05:36:16 -0700 (PDT)
Date: Fri, 28 Mar 2025 21:36:14 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Niklas Cassel <cassel@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] PCI: rockchip-ep: Mark RK3399 as intx_capable
Message-ID: <20250328123614.GA1188225@rocinante>
References: <20250326200115.3804380-2-cassel@kernel.org>
 <20250328122123.GA1187318@rocinante>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328122123.GA1187318@rocinante>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_053618_062956_FC271154 
X-CRM114-Status: GOOD (  12.23  )
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

> > RK3399 can raise INTx interrupts, as can be seen by
> > rockchip_pcie_ep_send_intx_irq().
> > 
> > This is also in line with the register description of
> > PCIE_CLIENT_LEGACY_INT_CTRL, section "17.6.3 PCIe Client Detail Register
> > Description" of the RK3399 TRM.
> > 
> > Thus, mark RK3399 as intx_capable.
> 
> Replaced the following commit:
> 
>   e55c67837a8c ("PCI: dw-rockchip: Endpoint mode cannot raise INTx interrupts")
> 
> With this one directly on the "endpoint-test" branch.  This is per the
> conversation at:
> 
>   https://lore.kernel.org/linux-pci/20250318103330.1840678-6-cassel@kernel.org
> 
> Thank you!

That said, Bjorn is preparing this Pull Request, this might not make the
cut at this time.

	Krzysztof

