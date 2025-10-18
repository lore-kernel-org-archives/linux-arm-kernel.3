Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B33CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 09:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nhWVuNwxLp4oDhy9Y7Je0Sd3r/8yjdmEN4SRPPZ/YRc=; b=oLQ16SkvEastOhdEOXr+f6SMRv
	Z1vJZELYYE0P/RA4HEo2Mq1arH3iNOJxwCoZk4lC69bakyGgMIEtk5I5/IC+t8jq0wMXIw4Q8n7Tn
	55B14uxTZV/dcw6E1EoGzdzvNIBYFSH1LnkRlmQBs7MI20pHzJ7LfcXBR6BzHwzwofQrpMOX1NygJ
	qSB07CHeBofAZWkUdHozwu9VJfhLJAJPtd5H93F0UrzNvwVTBaGOznbuDloskv7EcJp9vnDLnV359
	JnYYtHjg8oF8DvVGWYGMrO0J4KrOzdijZrWqfAeuHYOwm0IO1P9yOtvwyDMb2RZWrVUcal30siFUb
	bupNnuHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA3Xv-00000009lE9-2qwk;
	Sat, 18 Oct 2025 09:48:19 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA3Xt-00000009lDf-2er0
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 09:48:19 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-471131d6121so21505055e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Oct 2025 02:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760780896; x=1761385696; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nhWVuNwxLp4oDhy9Y7Je0Sd3r/8yjdmEN4SRPPZ/YRc=;
        b=TeuiFXhH917OHHLFBX+mEssC4LNVVQE1c9lDpgH5NaUw0iE23aGp7Fi/70wtUjjUQG
         J4j9Mt0TsAbdm6fuGUmX9AYPZAyvywAlKJ86Hrqxz/BF1gN1dOkrAdx82br04Tjr+0by
         dLloOybsi2LOWSeGqYrf67FNZcxBSj67tGaH5fyDGVAYnHTVbhD5hEvD9KPFzZePOzaX
         80DeLilvqEXiofVD68BqH1xb9Hfb1c/zG2Z8W+lxMEEnRMLblzt8J4uq3v4FVA969UbK
         xDCJso4Yl+BC97O9/nwqj+BGSIbevE36Pfkg9/0d2cAIbfUV+RKsZG3S1fTpUJ0Ix28e
         NYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760780896; x=1761385696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhWVuNwxLp4oDhy9Y7Je0Sd3r/8yjdmEN4SRPPZ/YRc=;
        b=NRKJnqPm9fSiMGwJFaKZCi3QJL8fUw3yp1SdopMwWoaMcC76+XnbOBaU67ByEpLZ2s
         ZKvvHucfAQorI4O5GoKO24lg/nNTmI8hMKu92td3kJnQGbafeN6rnq0+hjHV1n22V4ra
         k2RfZoIakjXU0FESPna3842Iyqn7LU7EooHMp5AsSOAN2Vvf3Ti1Ekgs0ktvRtHKpQuz
         w5azW2BsWJQlipr8YqZNAFQULFuKJVI2JelW5oS069/myiQrNZmpDAJrCP4xXe4KksNb
         Xj0GmQnKHVEWRAsqOvSKPGEDz6RLNY+ygZJKVYmSunU8bS0ogk22QgwQ6H2lD+SIiXFs
         3+Cw==
X-Forwarded-Encrypted: i=1; AJvYcCURQKxRGPJXa6iD9EGZExNR3Q6df/J/qgM8sM2BMaoTQdMGX/+W50TkqQf2SoFK8zqqr3Zg7jGX2IWU2Y59/G79@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr5jw4PVeUfxXnwWdH5uKgybfiTJLI7We3WI/70FkNXdW/WZKC
	nyaUHC7UwuDNWfwrdy5GCwovl5fuCZJrBXmEwFGVrEY7huEc8PvxmHLaDx/7aa1glLw=
X-Gm-Gg: ASbGnctY6YpEeIiKTcYWnQq6ICzR4jmYUKDUe8TbvQJaIWzkDFgB6DRUODYqX9d7tBC
	teinRt7lkpfrF6qNE3GL76t3o7POyQ+bUBudVh6OIOhI9HP7GQbukNHx4yzagjH8x248vYs0sAY
	Sa0UB/fsGRRj9ACTZMeO/+4g+mwst+WvoPgKFsYcUfh9Vrz+0b+cra3v6Dn87LogXXrYFE2QSEM
	X1QMeFq/BBFcQ/TqKuu7NyRO+51Y+GhuaWL7cSq/dtWHQhtbV359zh2rwjmS2exCrc4VU+1wxm3
	6esFvNUlN9UN2XftBFLAWWuwQrknMktxVeJGjTDjX2npC9EdV9IXQWgDY34yGcVd718b8LGx7rE
	r/kj18/CYUtugEpFxEbjh6FRGKtPxp4e02vpEnbMReh+ZRC1JQLnNX8SBfREJYtt6Ev99a5+FIY
	nZiUiHnzlLTr21Qeuj
X-Google-Smtp-Source: AGHT+IG+kX1i7eggIHxYAK08ThcqnvRyiNfTqtAevzOHW/nGlWwTN/Eu/9VszT8osDHnwWAvHzqdHA==
X-Received: by 2002:a05:600c:3e8f:b0:46f:a95d:e9e7 with SMTP id 5b1f17b1804b1-471177ab11dmr52244015e9.0.1760780895638;
        Sat, 18 Oct 2025 02:48:15 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4715257d916sm37111235e9.4.2025.10.18.02.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 02:48:15 -0700 (PDT)
Date: Sat, 18 Oct 2025 12:48:11 +0300
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
Subject: Re: [PATCH v1 1/3] PCI: j721e: Propagate dev_err_probe return value
Message-ID: <aPNiW8QzsLv4R0E6@stanley.mountain>
References: <20251014113234.44418-1-linux.amoon@gmail.com>
 <20251014113234.44418-2-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251014113234.44418-2-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_024817_869285_5287A7C7 
X-CRM114-Status: GOOD (  18.30  )
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

On Tue, Oct 14, 2025 at 05:02:27PM +0530, Anand Moon wrote:
> Ensure that the return value from dev_err_probe() is consistently assigned
> back to ret in all error paths within j721e_pcie_probe(). This ensures
> the original error code are propagation for debugging.
> 
> Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v1: new patch in this series
> ---
>  drivers/pci/controller/cadence/pci-j721e.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/pci/controller/cadence/pci-j721e.c b/drivers/pci/controller/cadence/pci-j721e.c
> index 5bc5ab20aa6d..9c7bfa77a66e 100644
> --- a/drivers/pci/controller/cadence/pci-j721e.c
> +++ b/drivers/pci/controller/cadence/pci-j721e.c
> @@ -569,20 +569,20 @@ static int j721e_pcie_probe(struct platform_device *pdev)
>  	pm_runtime_enable(dev);
>  	ret = pm_runtime_get_sync(dev);
>  	if (ret < 0) {
> -		dev_err_probe(dev, ret, "pm_runtime_get_sync failed\n");
> +		ret = dev_err_probe(dev, ret, "pm_runtime_get_sync failed\n");
>  		goto err_get_sync;

Wait, no, this doesn't make sense.  It's just assigning ret to itself.
That's just confusing and pointless.

regards,
dan carpenter


