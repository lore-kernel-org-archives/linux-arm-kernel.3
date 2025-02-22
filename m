Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CAAC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 07:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MIusnlIaDB7vYke+1e0zYGn7vFHQSaQaaWI2v/GjaBA=; b=JOoSRx5A3TNn4N2sk2Yze5hgDu
	cTpNnodGjUNjmRuwuCPd+J6zAa9m2jyp6QFIFYgFFXh3j1uOzJdDBI6PcKXPEN2EPbfRBgonkrryq
	Hmvce87R/60rzXRZ/+ieliOAMdr/mykqEQRq0/449vQH9F5ciUA72Nns9KuYd+P+WYz9B9Uxpf4B4
	qYD7s8kouXmbzZhvpRw6vo3QHnbSbbMhp9bVL8+v9JUdUDutvBJR6sMGHUymcH8WqSxxe0DmyTRxf
	u7MozyJiuKvvo0krQuUBmOCkOK5qKCiRE6QPqSdNVKElUISP4WNPnOcJELDcZTtiXHoWT9kOOmlOb
	LHkZ1DyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlk8r-00000007aTi-0x6O;
	Sat, 22 Feb 2025 07:41:41 +0000
Received: from mail-pl1-f170.google.com ([209.85.214.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlk7N-00000007aHs-2HmC;
	Sat, 22 Feb 2025 07:40:10 +0000
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-221050f3f00so64736845ad.2;
        Fri, 21 Feb 2025 23:40:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740210009; x=1740814809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIusnlIaDB7vYke+1e0zYGn7vFHQSaQaaWI2v/GjaBA=;
        b=Zo0/CwbjBvg6+lOol7pfES7yq62ywaqkhBurAvMKsBIu1vhu4/2AMDCkldvh1ZnNlg
         EbkyP0Ruk4hQP0yrOlsOTFSjCrp1tZWRIaD5MkLUvttT+WXpMqh/9kw69gNqSo5zB4Ak
         fggj5MFKFAZnT6N+D/qwNWIcJNWNsaocJeerR1W7VkvfmJCErbiBNxpvC3i9nkk8t+JP
         Ge/1B+kA53cjY5rGUMx/l8GiS0I9jf1GlDO1DLsYsZpIf5br/ltbPOH+BfIYaD6zTMl1
         SSLqMPoshmYKiO5+05SYrSolYe4oySCAkHoIT2MgBBD0SIh/rqqlrfCPDs3r49xbOy+S
         IW1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWr1pIT8M5+sBft+0Hb+7H5C6NP5Bz2Fgm/UxXPvBEBsIUZNQNc28jLjsX3LbCELWcu6NhPsdfCl0O1rElsdnM+@lists.infradead.org, AJvYcCXTk5YrlW+0P0IyudobKMUwav+G98aK+aA94dicUPB3VOYwmwJjUZAiVDOePRkoFqC4D9XmyogSCz2nHNXkVxw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx35Gll7Bda57aPD5Dzuoua1mkLK2PrYJZij3aNyVboyBGJq8h1
	x4r/3obTI4mAjUWdlZ1Qi0Q2Hn4TJFGZ0gYd96he90GB4grU57PA
X-Gm-Gg: ASbGnctbvvYZQJ9lkPWs94lA1lnSHJraDzWUs980xvcTogS/5p4FzE4NGRxl05ktmv2
	ID6yjKi3CXdJsu/zxAtpZTBx6wDFpUKCwbeY/XB0QjGx+jCXrEaSKpe2qxEj8m7M/WYzWkKgEPd
	aaVPPWGNTCK6bPemqdcaG7isP64xLilNSB2nng+/BYoD1qVCQguqtEdr8x1ACYcwDUB4La6dpl1
	m2lOBBnG+VVBFKtrj2L88ugckIujEAGniWBG9R+ctJLjvRTyKHF1W63bWQcTmyuC9Yc4UnWAOct
	jww/kimBxpXTqMS9W0UzXAkhKQeslSRXNdyBNmn6XE94EP/zO271kmW5BKC3
X-Google-Smtp-Source: AGHT+IFnWEQOVlYkIcAvpc+4gb6IcuOnH4l9CiuXOMRIhmSudHPiecnoG+O182vKhJcIbh+MxURY/A==
X-Received: by 2002:a17:902:f684:b0:21f:68ae:56e3 with SMTP id d9443c01a7336-2219ffa36a7mr101568035ad.39.1740210008634;
        Fri, 21 Feb 2025 23:40:08 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-220d53674b1sm148319425ad.98.2025.02.21.23.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 23:40:08 -0800 (PST)
Date: Sat, 22 Feb 2025 16:40:05 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 2/2] PCI: dw-rockchip: hide broken ATS capability
Message-ID: <20250222074005.GB1158377@rocinante>
References: <20250221202646.395252-4-cassel@kernel.org>
 <20250222000029.GA373377@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222000029.GA373377@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_234009_589664_59F9FEAF 
X-CRM114-Status: GOOD (  19.69  )
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

> > When running the rk3588 in endpoint mode, with an Intel host with IOMMU
> > enabled, the host side prints:
> > DMAR: VT-d detected Invalidation Time-out Error: SID 0
> > 
> > When running the rk3588 in endpoint mode, with an AMD host with IOMMU
> > enabled, the host side prints:
> > iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT device=63:00.0 address=0x42b5b01a0]
> 
> Maybe add a blank line and indent the message since it's quoted
> material?  E.g.,
> 
>   When running the rk3588 in endpoint mode, with an Intel IOMMU, the
>   host side prints:
> 
>     DMAR: VT-d detected Invalidation Time-out Error: SID 0
> 
>   When running the rk3588 in endpoint mode, with an AMD ...
> 
>     iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT device=63:00.0 address=0x42b5b01a0]
> 
> Too bad DMAR isn't smart enough to include a device ID in its message ;)
> 
> Can you include something here about what the issue is?  Based on the
> subject line and the patch, I assume something is wrong with the ATS
> Capability?  I guess this is some kind of rk3588 defect, right?
> 
> > Usually, to handle these issues, we add a quirk for the PCI vendor and
> > device ID in drivers/pci/quirks.c with quirk_no_ats(). That is because
> > we cannot usually modify the capabilities on the EP side.
> > 
> > In this case, we can modify the capabilties on the EP side. Thus, hide the
> > broken ATS capability on rk3588 when running in EP mode. That way,
> > we don't need any quirk on the host side, and we see no errors on the host
> > side, and we can run pci_endpoint_test successfully, with the IOMMU
> > enabled on the host side.
> 
> s/capabilties/capabilities/

If there are no code changes here, then I can update the commit log
directly on the branch itself once applied.

Thank you!

	Krzysztof

