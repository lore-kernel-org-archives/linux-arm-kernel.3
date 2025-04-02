Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9637AC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 07:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uNRTveRWVnz/0Xab+/KRVxCYrU4EE4wnJe0gfE8ybMI=; b=1CfYRU3p/8TeQ1o6MPWTLdPkgc
	TPuZKHJiQhB2j3ES2/+Xsy99kFbkpPBAQTIRW0+asW1ol4gulGrI0bJZg7f7XedR3oIa91/gYBbLA
	2zu/amTgi6PqpnAEl/pCFyoT6eW5kDPoQ8S52/lL4rInFMVC8YUTEiAwP27hcE0OXtlXCjWtZ2IeW
	F6qyKEhLzxsVLoa0dpaw8w9LHkeDJXU8xaxaRz9gzjwW5QZjw2TQDB3zLzFiujhYWeQdJ895oj/dD
	SnEDG0R7m1UadalrxY0zsuhm6yzlmo2zNMe0ODhm8JECbzYu/IRklZA3hwDGP5gb/GL0YUp6p4IqK
	bcKaCM0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsw6-00000005Rpj-0PgS;
	Wed, 02 Apr 2025 07:54:58 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzsrp-00000005R7l-3pVo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 07:50:35 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2295d78b45cso38314555ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Apr 2025 00:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743580233; x=1744185033; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uNRTveRWVnz/0Xab+/KRVxCYrU4EE4wnJe0gfE8ybMI=;
        b=rkV3/Px9JpWsVnISZOjxx7bwZo4X7F1q/yq294DsczT1N78XB4xsdHPRwszlhHj56K
         fg+8cIMbq5xSBNjO4Odar67+tW2nGCoAcR+tjyfEbmLYiGXughwLvjw6LvcmPXsLOW7s
         WLu7fHUykcu9GCG9R4K91cF31MjgMpS7MqDMZA0AWHU7JnSzJLnJC0hgCnBq2ck699I9
         B/thepUhStC0HGVxbeyNeow7LA9FqbEbnMG+szt3RTS15iyj31ZajXZ2orRPub7+OxbR
         zZnc9Z9/MT6ycrK141NfhrCj+09rb9KS/+Wx/J2OQJ9iTXGGQPP0/Ku4VUQ4+VpE6yF4
         g1Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743580233; x=1744185033;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uNRTveRWVnz/0Xab+/KRVxCYrU4EE4wnJe0gfE8ybMI=;
        b=VfDVoOwfA68xQ+4U3BWa6uw0uvtbLReQBc4HpiFwHboAqeVnyIdPP3RyGoXHgTQ5FX
         mSqMxCyTa1vaIG4dmHB+LdYMcXl9QM5ZWTdwBAhvCXS9K8KSSGgubnVduyOzQWwAfnW1
         73K82uFLcfYKVU9FdG+52yoBBnakHQmqonkaFhTJQsv53q6WlrmeNJIJo/amlV3s3VLY
         oevjp+/Bj5VOAXGf/kIZ52JqFiwPKFQ79TiRFnMkLTrOCrYydvD5oIWvnifALxO7K8rT
         76YX3A/fMreySdwbgLEjqGj9sEij8zzZWzMZfW4tM+n3XNWUJ+uBkxxbSa00Kot5bzvh
         sm1g==
X-Forwarded-Encrypted: i=1; AJvYcCVbmOhc/kPhwciKhnOrKMdm9VqkChI/R2nVT/dCz6HcDA2gpbuLiA9uFnFqZGRQ/B9T3EOEBqS6B5yqWMswanZV@lists.infradead.org
X-Gm-Message-State: AOJu0YwIjJKuxjlRp9ZhT7zb+k96gpu0wPgFg2IPPv8lNRJgwQPITahM
	mXXH7rT0pZ3a9NWrMSbedoVc34I0hXqDKMAvso4tTH+gChinectrgz8xQ53MRg==
X-Gm-Gg: ASbGncsCaeI7Dv6t4SnVFFzgKQy9///ePUDd0upYXWeETvsopHEyQintGKeCX4yheqb
	08t2K02uyqUr9xWibSKCoAyvLrn0yKBpskz3G/Yy4t7Czx4Gba4qNMqzD/VD0wfUZaXd2Oy25XV
	jlSbzRxxeXPZyK2jfT2MvUN4qs70hgYoZNqExuM6mWZh7CS5Y5AuOdQNHzqySuARpVFUy10uVXR
	HVXsMNe9d4moUccU4Dkk90uz92cm8QTsqcVY3VVYR22yMKv/mQ382LtaT3EjNZ6m5oxgGU2PfzC
	615LFzAdtsIyq/gFPqbj+VdvAHhAIqPMXy96SsFqeatqtZJmEEWFIgvM
X-Google-Smtp-Source: AGHT+IFbubLAcjIJmVW9Uzpo+2aLIIImOvMRGz22sNIc9vozaKUYwfB1hQ+2S1SCz/Ds6z7MJbmaXA==
X-Received: by 2002:a17:903:2405:b0:220:efc8:60b1 with SMTP id d9443c01a7336-2292f9e5226mr246523465ad.39.1743580233121;
        Wed, 02 Apr 2025 00:50:33 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eec71b2sm102550355ad.18.2025.04.02.00.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:50:32 -0700 (PDT)
Date: Wed, 2 Apr 2025 13:20:27 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] PCI: rockchip-ep: Mark RK3399 as intx_capable
Message-ID: <io3meoai7vhaxipgcxx3bjfmnwuudwxgwj55z4dh3m4zn5tf3l@w76fcj2mevlq>
References: <20250326200115.3804380-2-cassel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250326200115.3804380-2-cassel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_005033_950408_71B6CFD0 
X-CRM114-Status: GOOD (  18.45  )
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

On Wed, Mar 26, 2025 at 09:01:16PM +0100, Niklas Cassel wrote:
> RK3399 can raise INTx interrupts, as can be seen by
> rockchip_pcie_ep_send_intx_irq().
> 
> This is also in line with the register description of
> PCIE_CLIENT_LEGACY_INT_CTRL, section "17.6.3 PCIe Client Detail Register
> Description" of the RK3399 TRM.
> 
> Thus, mark RK3399 as intx_capable.
> 
> Signed-off-by: Niklas Cassel <cassel@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-rockchip-ep.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/pcie-rockchip-ep.c b/drivers/pci/controller/pcie-rockchip-ep.c
> index 85ea36df2f59a..626f6b31b0f66 100644
> --- a/drivers/pci/controller/pcie-rockchip-ep.c
> +++ b/drivers/pci/controller/pcie-rockchip-ep.c
> @@ -694,6 +694,7 @@ static const struct pci_epc_features rockchip_pcie_epc_features = {
>  	.linkup_notifier = true,
>  	.msi_capable = true,
>  	.msix_capable = false,
> +	.intx_capable = true,
>  	.align = ROCKCHIP_PCIE_AT_SIZE_ALIGN,
>  };
>  
> -- 
> 2.49.0
> 

-- 
மணிவண்ணன் சதாசிவம்

