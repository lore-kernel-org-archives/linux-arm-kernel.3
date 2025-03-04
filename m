Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A744CC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 15:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wLAYT8VOg5n+EhJivIskvTTTLfV5w4lbqOOhOs3qFM=; b=F742ZTUGlFZHvGFSjWmmMhg4Bv
	wejs7iXx02H4qlT7BmDmn9O1DG4u4DFWvdA/j2Dj28PGG2ehbRkTyX9ZvT0IFXQLRU9ybAexAUKd8
	kVlcbsJo8t3KB3LUp5t9lh6eDVRUva+OCjGQ6FEn1iIy7j04A2DgwllWGIO0FAdUYliBnt8u3O+ju
	jasxaZAY5jnpmHODAKjbQsl3yuorlv5/z4UnPTj73TeFHgk1g1XdmZjElev4xpHzJjZvHc1Jbtayq
	xBWuSYmKoOZxpMdN9xxNmcQ4HlFieKR5r+107NwbGOWwhFArZEi6hZAzsRtLBV8w/CWcujGo0ictb
	CJ2WT6uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpU9E-00000005Ccr-2Kv0;
	Tue, 04 Mar 2025 15:25:32 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpTpJ-000000057Mu-3aow
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:05:00 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2fea795bafeso8992194a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 07:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741100697; x=1741705497; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7wLAYT8VOg5n+EhJivIskvTTTLfV5w4lbqOOhOs3qFM=;
        b=airyBBDeZSkIbZsGtxRQiRVNiCmOFS037/tlOi4Vgx2uxphFvBZKIwZFI7CS2s5kW5
         ufCSZhlIHSxHYMnwGv8SX4r2rjAoO8IAL/hm45v1zcD2VNE3OKCAFqJBEE1ENFzp9gA7
         n7iPfpt1SEkob9Kiv8k1wQMpb+pzvhFg/340rD/EnkzifEet0xb6LbDTJ3NiCyu3sW+R
         HTKr1PSkji7392xpP1J/+I92JJWt0EFE9uYYvmw4EZQ5zPdGVsTyMM0l1AoB0koi1LkW
         lsWY7bdEiApHJRWAPZ4m+XDpWZu5kcIZ530yW904AGWxA2GB1PhMCY1yBWlpAHPU+hlG
         BIug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741100697; x=1741705497;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7wLAYT8VOg5n+EhJivIskvTTTLfV5w4lbqOOhOs3qFM=;
        b=rG6cobU/+4c6z6lJpUR92+DnhzENq/i+rHnr67urlS945yAxqFrEJ6r53674dxVkWB
         5UKXm6vpGpShBefYhVHla673YufDpm4+A/c0RqE9UtL+InFWXYke7ZLTYup0tGuS+KSs
         bq+yWHdel1QSIpzmGWYWh+ZzoE8WsrnO/7hJMoWAFnMHkoGSp1+OX6e27BJIm79Z9D9w
         6F1hKLJaVdqsnV+fuClaNMQLWWhV45pGiiSXh7O52dtm9JtJEt4h6KBwaeap4z9uy9pC
         c2/0PrtVkTFprhnoa2HV+eJOXOKtuw6WiB33w7ZzDdBRcQzEVjrWtv0fx2xxQxHGN0t6
         Mx8w==
X-Forwarded-Encrypted: i=1; AJvYcCX2UmerLWfARKTh4Wu4d5HIsNSOLB7oJFglcz3ht9DmAGHrtVfiNYRBSsDeFrs8CAIjwqeDDam4MhpJlPOp0T8X@lists.infradead.org
X-Gm-Message-State: AOJu0YwvXR3nxuCN+mxL5u3b6M7wIaqM3mJTYHG4A95dEoMQALk2hNIQ
	JifXKTvXj2kADd9xiAhgQtC6qG3qnVP6lLJQNe7NHcBbpwL5fNXqwSqiE5c0cQ==
X-Gm-Gg: ASbGncsm5WxCyXadWnLmocHL7RQ08Uvnzchq3S8kNxM0Sx8UMaX83Us/pO0LqJU24by
	OiaQ61G4kaTiibQKKufAA+2qjLyZO/kOfb8CH8gxIV6fvQiFqCyH93Xh5vLFSE6zLvg1THbpM3V
	U80edynEtGGolkggKGUAMGBSMrG0ozgd0EXV7hN2FfhoEH9e8N0uivKcCJiH83PN5o0H47gyj08
	sRwRB7sBYuv5OC4iBPdm4WKJ8hSL5hRxqmb1H9QiBHKZnrxt+ISnjky4iaVoI8iLSdZc4OHMb2H
	qNfI7gv4h2NqFL58eBDPxT4gpNIsrPnI4RMhyJk2ki+y2Y6oFDZN/vw=
X-Google-Smtp-Source: AGHT+IF2IqujVL9FAIrlKbmlEjSg+DENq4yc4FJP79iYPxBvL+hS29J2rkPg6a94cXi9du0du7pQgA==
X-Received: by 2002:a17:90b:5684:b0:2fb:fe21:4841 with SMTP id 98e67ed59e1d1-2ff33b937f1mr6451097a91.8.1741100696841;
        Tue, 04 Mar 2025 07:04:56 -0800 (PST)
Received: from thinkpad ([120.60.51.199])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe8284f076sm13270159a91.42.2025.03.04.07.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 07:04:56 -0800 (PST)
Date: Tue, 4 Mar 2025 20:34:48 +0530
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
Subject: Re: [PATCH v2 5/8] PCI: brcmstb: Fix potential premature regulator
 disabling
Message-ID: <20250304150448.r42maovz4xggbqdx@thinkpad>
References: <20250214173944.47506-1-james.quinlan@broadcom.com>
 <20250214173944.47506-6-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250214173944.47506-6-james.quinlan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_070457_926446_2DE18150 
X-CRM114-Status: GOOD (  22.38  )
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

On Fri, Feb 14, 2025 at 12:39:33PM -0500, Jim Quinlan wrote:
> Our system for enabling and disabling regulators is designed to work only

'system'? Perhaps 'logic'?

> on the port driver below the root complex.  The conditions to discriminate
> for this case should be the same when we are adding or removing the bus.
> Without this change the regulators may be disabled prematurely when a bus
> further down the tree is removed.
> 
> Fixes: 9e6be018b263 ("PCI: brcmstb: Enable child bus device regulators from DT")
> Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/pcie-brcmstb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/pcie-brcmstb.c b/drivers/pci/controller/pcie-brcmstb.c
> index 56b49d3cae19..e1059e3365bd 100644
> --- a/drivers/pci/controller/pcie-brcmstb.c
> +++ b/drivers/pci/controller/pcie-brcmstb.c
> @@ -1440,7 +1440,7 @@ static void brcm_pcie_remove_bus(struct pci_bus *bus)
>  	struct subdev_regulators *sr = pcie->sr;
>  	struct device *dev = &bus->dev;
>  
> -	if (!sr)
> +	if (!sr || !bus->parent || !pci_is_root_bus(bus->parent))
>  		return;
>  
>  	if (regulator_bulk_disable(sr->num_supplies, sr->supplies))
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்

