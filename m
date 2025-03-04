Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95943C282D2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 15:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vdhvna9uxBeu4mYpj5OPBxZhuzN87zcLw+LVQRQ7m7s=; b=vJUXm2amAmeleGfpeYzeCyN8Zf
	mCHrqhMshwXDh2ryaS0vuiXsGWtR3lUk98MzH3WDJQpBauZHNkHwm63r+4C/tV48nfUqYhKUSRa8c
	nMXf0iT2+T8loJkdPhn07wlQ+LPj6Ys6EcJTm9w6hhzWJ/JBLjylRFpZXttPlz5otZFjeiw77k7m1
	idbj9k+Lxb8AIOovJ6rhuTN6rAP00PzRvFU5zU6SBqG4NBUtdGGT3h9KXPBvAaDLMUF9Uv2PLUW4g
	G8dOwv86zLTWKaDxaD77hlj1Je1WBxuN605cLmonTxU0koh7TLKqlAeZmQhip9ZiBYel3sOQVxCHV
	VXZCNabA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUSQ-00000005H1O-0Gga;
	Tue, 04 Mar 2025 15:45:22 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTuz-000000058oq-3dBC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:10:51 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2feb1d7a68fso10230004a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 07:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741101049; x=1741705849; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vdhvna9uxBeu4mYpj5OPBxZhuzN87zcLw+LVQRQ7m7s=;
        b=MfznCalx7sJJAdHbx9BXQK5vIbnkides2xNF56wUKRpRsPb2PT+oBs2RJRYf65uMR3
         9B2YFpe65Yp/+aZOw8p0HbnYviaGEQYCDCw9VA6Ar4PA1bpvbrZFF8ZvAN+eDF7ZEiTs
         SWmYoQFVSY+HG9J8JeFLvtNd0EMBW9Y+6dlMSKd5BX8qCNv9uqTB4y9ZERi8OBiNZBBp
         UFaQyUahoWqWCb3gke5Vg8Vi0kiKxqbA+SrdC6bfGgKAnAXFLVQcID4foSPUNBHeAGkf
         trL7qdq/EUTS7AE/CMkdA4FAezfJ7egiq5KVn8zA3pyUwiTyFfbtXtrJbqLhAdSWesdt
         94Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741101049; x=1741705849;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vdhvna9uxBeu4mYpj5OPBxZhuzN87zcLw+LVQRQ7m7s=;
        b=c4E/tQw+lIosHdE230U5C9Y2XOFIEtsN+q7vDmdKiQL2hBo3etSrDfBWvOjOmaNd7S
         D3+CbnbUChEAQL233CNF2HRsLMmNWLelDPR1PDNb6Vmd5VXKN8fnDxxDSLpP7t8Hlkxv
         Rseqre1ejFc6cujSRdb0knllRxvKY02R41uRo3JcWd178b/4tyhf3G/njvKx8qMtZp96
         YVffXC7mLt1+08FODemYvtt10uW/BkTUiMRSds94LPEcS97/szB9XUeqInSuu3n3rpZc
         ATHe31AtmzoPMSeNxnHCD9RvWqX6Ozj81h2dgSzl5wLErjb3fVeAmGXPWSbNZ0LQpH6F
         xuHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVguZJMuGrKzTsngLqv7/H2O/EIQQTXoOSJaS+HVBC0hr3IRFEDDrcbVNc0ATY8Dq7CH+E/xjOfQNNHwDjz7Y9W@lists.infradead.org
X-Gm-Message-State: AOJu0Yzub0HZwh4HItsFR44L3/OHI0h2CZB1hQRbt80TQY3rkvv8zJ/e
	6XrohNPLpeXliPCdtTUW5QKbSJreZ61/ps12LfuoMCIEVYiwT8Xe5jAYUHAHyQ==
X-Gm-Gg: ASbGnct6mHZOgyaivD4vEFNkRrnWsQI6jxwftdDW/lXSJNLdEqKi04F2SdwZq9jWWbZ
	bu4uDQNp/FastPBzL2H3NMfl5ZNo/5LGGLAP+vCezmFK0h1WzEdcI3+ezaMZca7q6A/YUbxYSgM
	EDz/HVzFQZ7Me1rs/lIXGpxsimxN1w6RfjUWXeGMQWuES5IjoYqz401h96YGeS2rykA+a6x2Bye
	UvJnZzvkOyMs30LAqLeCaYzL8eV6rN/2EI3gRCGmjKarDH7JEc1/sJMOW5HWeUq8s7ACwf89+vC
	VJxJl50yPO04Nth5Gh0kow6dHaHhevg2hPnmRjkAKSHm8MSXyHCQU0o=
X-Google-Smtp-Source: AGHT+IGfTEua5Nua/thzn0LAom+PoolH5xRKN+uIh0BTTsH6+TMAMWAEwJ3FTRgLK3drwMf2I3fVUQ==
X-Received: by 2002:a17:90b:4ac6:b0:2fe:b8ba:62de with SMTP id 98e67ed59e1d1-2febabd9d13mr26339791a91.25.1741101049205;
        Tue, 04 Mar 2025 07:10:49 -0800 (PST)
Received: from thinkpad ([120.60.51.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223852162bcsm59170965ad.8.2025.03.04.07.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 07:10:48 -0800 (PST)
Date: Tue, 4 Mar 2025 20:40:40 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jim Quinlan <james.quinlan@broadcom.com>
Cc: linux-pci@vger.kernel.org, Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	Stanimir Varbanov <svarbanov@suse.de>,
	bcm-kernel-feedback-list@broadcom.com, jim2101024@gmail.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>,
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 8/8] PCI: brcmstb: Clarify conversion of
 irq_domain_set_info() param
Message-ID: <20250304151022.qgp253hv5sxvxzdc@thinkpad>
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
 <20250214173944.47506-9-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250214173944.47506-9-james.quinlan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_071049_914209_C609304E 
X-CRM114-Status: GOOD (  19.60  )
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

On Fri, Feb 14, 2025 at 12:39:36PM -0500, Jim Quinlan wrote:
> Just make it clear to the reader that there is a conversion happening, in
> this case from an int type to an irq_hw_number_t, an unsigned long int.
> 
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-brcmstb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index cb897d4b2579..f790d5252e9f 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -559,7 +559,7 @@ static int brcm_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
>  		return hwirq;
>  
>  	for (i = 0; i < nr_irqs; i++)
> -		irq_domain_set_info(domain, virq + i, hwirq + i,
> +		irq_domain_set_info(domain, virq + i, (irq_hw_number_t)hwirq + i,
>  				    &brcm_msi_bottom_irq_chip, domain->host_data,
>  				    handle_edge_irq, NULL, NULL);
>  	return 0;
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

