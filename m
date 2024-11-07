Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CACD43370
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 15:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N9NhJb+I4bTmcgAw+kIq6z6voIYV2ULWb+V9qVrjjB0=; b=oLBTk6rbwPP3rXE5TNZN08DvN0
	anXiCu/u3RmGgJXFLzQcPKlYFVSoXzsDiOYAMe/nfZTxTqU/iSreTL6S3fla0JcFt/VOdxczM2cPJ
	WruOz2IpEnJv2+kP3yRXI2OLw1CBrlAsCEBP2DWG3CQvJVZFVn3xBkvHpgqLF6joubr63+CehjR+D
	D1tSKaf61yi5jUOCVH7YMI0AAW/gh/5hrcn33GEHizmofUGTKX4i2tpUIW7SIg0FRX99RQd7eIQrX
	WZf0xzTHGJpvjlbT5v8DNb1aSeJrvumy0BWzIACpaS6YjCMKVUWO7abL8F+7eiKGKn15tyeLJICRs
	k4EWfsTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t94pD-00000007V7n-1QM8;
	Thu, 07 Nov 2024 15:53:35 +0000
Received: from mail-pl1-f172.google.com ([209.85.214.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t94nS-00000007UkD-3cUi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 15:51:48 +0000
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20c6f492d2dso13124285ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 Nov 2024 07:51:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730994706; x=1731599506;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9NhJb+I4bTmcgAw+kIq6z6voIYV2ULWb+V9qVrjjB0=;
        b=Msx92yWCvtYcn0G/2EvLbNZJHjukA6BLAAjz5xqPFqbQjNhbK3MAf1CewaeVb5e5IP
         AZn4F/ZJvZXkuk01BCahM4fXJZZpgVOrEqW4nJHd6Fy5UVivK38KRlFrIexS+izMH4aX
         Ll5u5QSVYyPTQWRfcuCqf2qTMSqrBOsuEuZLicuoVhkATapYpxcCWCDlfRPfUXF3At3l
         n1b471ItKlASdVix5OsGjETUXhp+ZqEQh79LZLZnbDGZtxJY8BtYmg+9iGv6hFkFuq74
         IdT8Uu8+ZbqdeM2uc/PxlFd3RlgNmBgSv0vrVjNLvIL5zmKXY+2RMuFMaA0aqy3reo8M
         lC5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWWmW8JiOI4kLZxreD4GzRCq99m6zoyNs6YVMKfHSGU3b6larEm8OxfAm6e7bjaozAwZUamKrqSpt13qxlLPNUD@lists.infradead.org
X-Gm-Message-State: AOJu0Yw94LaUR4WyUxBOgnF9YHH3b7rviVtK1mOwA5ccxT25atpxOgTe
	Lwl8hBugOHOqZfkwNXcFTvGOkw2hgkv2CddbfrGsEDRosGBimuot
X-Google-Smtp-Source: AGHT+IHnweMolaV2847a3ZQj9C/f/36UY00gUp5/lxxYk1TyR7otOR6IyNHX0MWvdqNR0mQnnK+moQ==
X-Received: by 2002:a17:902:7786:b0:20c:79bf:6793 with SMTP id d9443c01a7336-2111aec8486mr239229975ad.3.1730994705711;
        Thu, 07 Nov 2024 07:51:45 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21177e5c5d6sm13570965ad.217.2024.11.07.07.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 07:51:45 -0800 (PST)
Date: Fri, 8 Nov 2024 00:51:44 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, lpieralisi@kernel.org,
	robh@kernel.org, bhelgaas@google.com,
	manivannan.sadhasivam@linaro.org, kishon@kernel.org,
	u.kleine-koenig@pengutronix.de, cassel@kernel.org,
	dlemoal@kernel.org, yoshihiro.shimoda.uh@renesas.com,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, srk@ti.com
Subject: Re: [PATCH v2 1/2] PCI: keystone: Set mode as RootComplex for
 "ti,keystone-pcie" compatible
Message-ID: <20241107155144.GB1297107@rocinante>
References: <5983ad5e-729d-4cdc-bdb4-d60333410675@ti.com>
 <20241106154945.GA1526156@bhelgaas>
 <20241106160520.GD2745640@rocinante>
 <4fc87e39-ae2f-4ac9-ace3-26b2b79e2297@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fc87e39-ae2f-4ac9-ace3-26b2b79e2297@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_075146_921503_9D68B3CB 
X-CRM114-Status: GOOD (  15.33  )
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

> > Added Cc for stable releases.  Siddharth, let me know how to update the
> > commit log per Bjorn feedback, so I can do it directly on the branch.
> 
> The existing commit message could be replaced by the following:
> 
> ------------------------------------------------------------------------
> commit 23284ad677a9 ("PCI: keystone: Add support for PCIe EP in AM654x
> Platforms") introduced configuring "enum dw_pcie_device_mode" as part of
> device data ("struct ks_pcie_of_data"). However it failed to set the mode
> for "ti,keystone-pcie" compatible.
> 
> Since the mode defaults to "DW_PCIE_UNKNOWN_TYPE", the following error
> message is displayed:
> 	"INVALID device type 0"
> for the v3.65a controller. Despite the driver probing successfully, the
> controller may not be functional in the Root Complex mode of operation.
> 
> So, set the mode as Root Complex for "ti,keystone-pcie" compatible to fix
> this.
> ------------------------------------------------------------------------

Done.  See the following:

  - https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/keystone&id=5a938ed9481b0c06cb97aec45e722a80568256fd

Thank you!

	Krzysztof

