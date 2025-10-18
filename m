Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BFCCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 09:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJ1k9LDoSOqmBSAsuY78K6WJBTUTLHwdE0LZYjE4bkk=; b=v6XKk/dSbSkPXWojSMA+e4CBtQ
	vZAWJjd4miiqWjK6ZEfxFG2k+DxzhVJMiy4vndkMysohqdlJ15B5T/x5lCEiH2qgJhYV1FDqvMKm8
	RyhpLRJktuuibHQMg7JvlcDjPqB8daOftdvOvjlhKKVc46RuXhYKPsqGqD78tpyziJbsFmxcFU1ea
	OnjmnY6FIxbM7Lef4s/UDTMGCkmglH1rYbAZkESVLUQVcTFb195TU0inHJOM2FFkfFPucrmh4chJJ
	rbHMz4oCSxeoPJ86RaSdwcqivutDX+yGfHlFd5jPmcCwIGpERnrcObhEv9MWqsXghL1xJRG7eqsZx
	Nesd94ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA3Z0-00000009lMr-0BOp;
	Sat, 18 Oct 2025 09:49:26 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA3Yw-00000009lMD-2vr6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 09:49:24 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4711f3c386eso9172745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Oct 2025 02:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760780961; x=1761385761; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LJ1k9LDoSOqmBSAsuY78K6WJBTUTLHwdE0LZYjE4bkk=;
        b=jYk/K1lZA47DTSjC9NMPik/fxXFJOgCJWHhPBoWn7Jdy0NmTdMxA6XpL5BTGlRqTYS
         64YTSXVxO/0R0+2iAVoPebgYdTmu7Ogh7liHMC/2dvs+nUH01XSnWHuYrtMR8QFrROwN
         2Uvbp9VPDfABDGXQrmN+HPCbB448ydrSfnm7OUbQG9bX0RctdQ+D8mrJaoeP80Zeo/uy
         BB5V+cIU7OH//ywbNg+oFXtVUDFWVhzeORbBuORcYosdl6Bx89Q1aeqWgFhl5Fmsu5Lf
         GwdUKOFqXCt7fY6VLDLJNSuPTU7Ye/2bAB4KBXbe230/u9z7duQ8uZVB4xmSW/U19VWZ
         JQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760780961; x=1761385761;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LJ1k9LDoSOqmBSAsuY78K6WJBTUTLHwdE0LZYjE4bkk=;
        b=C5VrJMxlIMFHu0qZfjQz7GNsCdsCVA2hRN4U+8J65VrvRxGU96H+eJ9oyjYQXv0AMZ
         pY3obl8ap9wRA0akxMF3ZIjyxIJ92bEgvmjYEk1KHzqnDHRMvSveIDQXfPyuYetHe2VH
         y/BfMeRS7lLjl33bhFyVa5ozldevRoNm4AgMUnrCipAPSBbukwogI28leWYeQNpCacw6
         8loGghDpSJqAwWIOb4EYxXqVZ1qXWrMOy+E0mV2quVYC463bARAQraDYwtpmXPMZeYza
         +qXcihGlnIIbFFS7jGtl29iq1OYY5a9XU+3XGGO+FKO/iUh32YXwOsQtuez2HX51+W3+
         Q9WA==
X-Forwarded-Encrypted: i=1; AJvYcCWyjlsqWdEDWalhsLZo4sSfvTuF145WcMpTcDQC372oFsVbiE3gmt2k1ONTUe12tTaBfvFnbHD+QLCZR/6fNZH6@lists.infradead.org
X-Gm-Message-State: AOJu0YxntbxYFRVtDgkY6ZupsJif0HLpW5Vgu+p1KLrKWk1yoCjlPI49
	lXA8uesgeZd9Gz9q6D9CtL43/A30d9uK33+kvR4I93OTYcSZRcpyrXr6TTvp+hrHBtg=
X-Gm-Gg: ASbGncs2cG1zM1MK38lUHAUtX0EMldPMEs3IL02T6vXMMo9HWIhRE7EWIpB0+Amx2c9
	3uGegg415/4dNxp6kBD8AZ2zphOTn2p1A4ByDaQ0dkHkL7FJY+a5PSd3lN0Fmcl5bdgzxI6+k20
	4bdC4lx33bJ96aEUzQzcLBefC8T4FS7sUeDxVjVwB5rAFqfKrURIOQguUHcxOi7so0wifqJrCAx
	wVJ75VRDE56lZvB/i2WMViJ5ZTawZAsjXIlG9SWZeR1NtbDSDU+5FLUmdP2ZJweX6xdk1q1bwbe
	ay4zW0bkLGtfmCSWa2BdD7g60Q625jzPiAbdZZ4pT3KAHzXUf192F1QdSqUyoMQXXYEAIC5t+j7
	RncZjZE+3O4A+RXdX+DZy4ZcoeWoOcvAQfCPs9HQvc3+lU00bgvV1TQinkTRzRgvHLb/L3h6y1i
	6Ra8AFBg==
X-Google-Smtp-Source: AGHT+IF4PmKFPPexasdAngpm6lCQGA4zlUjMCH/pf+rmfZzvnzRywedipAIMxVKthaY73oX1yJKtZQ==
X-Received: by 2002:a05:600c:190f:b0:470:feb2:e968 with SMTP id 5b1f17b1804b1-471178b125amr50060315e9.15.1760780960846;
        Sat, 18 Oct 2025 02:49:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-427ea5b3d4csm3936689f8f.19.2025.10.18.02.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 02:49:20 -0700 (PDT)
Date: Sat, 18 Oct 2025 12:49:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-omap@vger.kernel.org>,
	"open list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-pci@vger.kernel.org>,
	"moderated list:PCI DRIVER FOR TI DRA7XX/J721E" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1 2/3] PCI: j721e: Use devm_clk_get_optional_enabled()
 to get the clock
Message-ID: <aPNineCsVgUyD6xW@stanley.mountain>
References: <20251014113234.44418-1-linux.amoon@gmail.com>
 <20251014113234.44418-3-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251014113234.44418-3-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_024922_754869_E496DC58 
X-CRM114-Status: GOOD (  21.88  )
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

On Tue, Oct 14, 2025 at 05:02:28PM +0530, Anand Moon wrote:
> Use devm_clk_get_optional_enabled() helper instead of calling
> devm_clk_get_optional() and then clk_prepare_enable(). It simplifies
> the error handling and makes the code more compact. This changes removes
> the unnecessary clk variable and assigns the result of the
> devm_clk_get_optional_enabled() call directly to pcie->refclk.
> This makes the code more concise and readable without changing the
> behavior.
> 
> Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v1: Drop explicit clk_disable_unprepare — handled by devm_clk_get_optional_enabled
>     Since devm_clk_get_optional_enabled internally manages clk_prepare_enable and
>     clk_disable_unprepare as part of its lifecycle, the explicit call to
>     clk_disable_unprepare is redundant and can be safely removed.
> ---
>  drivers/pci/controller/cadence/pci-j721e.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
> index 9c7bfa77a66e..ed8e182f0772 100644
> --- a/drivers/pci/controller/cadence/pci-j721e.c
> +++ b/drivers/pci/controller/cadence/pci-j721e.c
> @@ -479,7 +479,6 @@ static int j721e_pcie_probe(struct platform_device *pdev)
>  	struct cdns_pcie_ep *ep = NULL;
>  	struct gpio_desc *gpiod;
>  	void __iomem *base;
> -	struct clk *clk;
>  	u32 num_lanes;
>  	u32 mode;
>  	int ret;
> @@ -603,18 +602,11 @@ static int j721e_pcie_probe(struct platform_device *pdev)
>  			goto err_get_sync;
>  		}
>  
> -		clk = devm_clk_get_optional(dev, "pcie_refclk");
> -		if (IS_ERR(clk)) {
> -			ret = dev_err_probe(dev, PTR_ERR(clk), "failed to get pcie_refclk\n");
> -			goto err_pcie_setup;
> -		}
> -
> -		ret = clk_prepare_enable(clk);
> -		if (ret) {
> +		pcie->refclk = devm_clk_get_optional_enabled(dev, "pcie_refclk");
> +		if (IS_ERR(pcie->refclk)) {
>  			ret = dev_err_probe(dev, ret, "failed to enable pcie_refclk\n");

This isn't correct.  It's assigning ret to itself when it should be
assigning PTR_ERR(pcie->refclk) to ret.

regards,
dan carpenter


