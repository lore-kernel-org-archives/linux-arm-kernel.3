Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0266C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 19:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TMh0izLSzqmAU5ORZxGehcX6J35ZOvbIe3zUy9tlNbQ=; b=TRkUIlregdaludo1W3m51h6nKY
	ypnGh9xlYoMtcd2xehrzkg2eeZA6AhXc43MFK7iTl28P/5CdVmekOhNm6Li5F9b399uF0mkpaHqns
	6mSYcusJdIPUaxUL6XSLzmgTZQdPh5ml/T7uz4jyuwc+vi9+/fzF7oU8LFxE+rzN/0fywfTG2zwPJ
	VmQT+ZBgqKLdEAmb6zINfS797n3oj2RMRmHvnsFaJNIF6vLDU5CRyZLz0+ldS0jA3HApDdus/dBCT
	cLta78DFXqAN1n0eB/OpDCyMC3earxm5e+NAWDwqwGeTduhrxWILkdxdppXa7+Fxal0J33pBIga4B
	eF9TyU9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7JbG-00000008Mun-3B19;
	Tue, 22 Apr 2025 19:48:10 +0000
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7IrH-00000008FdY-1WDh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 19:00:40 +0000
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-6e8f6970326so52113246d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Apr 2025 12:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1745348437; x=1745953237; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TMh0izLSzqmAU5ORZxGehcX6J35ZOvbIe3zUy9tlNbQ=;
        b=Dz7Qwi45OAqAvjK3BLzQkVviXeIZxRSxqnv9SpeWkPR98mwfR0VhlHsZMp4PrZkla4
         EClcgTPDhp0SxjqNRykUcngKmR/hzVwLBg3Ya2FHtnod4bLbh17oGwXhfA1u5sKU4cBF
         ZvH8/e49bo5KQfOqOTcjdRNWlHKK20GGzBXzYPS/QTIapcL1Udz//n5PvnB1HNyk0ohH
         qSscCWKOgb0wiM+YzltOle1K0ZIJ3ZRdltzuECekfA5BEhq+N/R+S2gBUitkLU0IVYOI
         X3Q0gKkFSwL0jQgfREgZyaxYjXZ5WTOdQeJWGiLxRkaiVacEb75jpV8quv7oLnPp8SPa
         QjMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745348437; x=1745953237;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TMh0izLSzqmAU5ORZxGehcX6J35ZOvbIe3zUy9tlNbQ=;
        b=Mm0wMzYtRMXSUHQ87EQUOMtF+fVNEnw21hE/OBc9DkMm5l1c/bba614qZqAXNEqe0+
         TcsRtKU5XpjeTPiCaCpqBgjPKoZjLpi2k9b4GQEfqj2zUhBbgNC4uNWN5wczEx8oL25Q
         VBLD+k9vzfT2e6l3Ivpa9Qj0qp9yZ6aY/3p6707dlpieq4yzgXjZlLDCf2VCq6kS6Fdw
         YeKucRONfZnzlUmjr4o1nkP9nFf3hi+vn3Zj9mfkK6I+bNPOx30z1+fNVykD7jPt8U2I
         LxwUPOQ13PcDr1q96ge6+vbkaWjAZA57i5a4e64Vi85ZHGbi33isN+Cq4dC7FaF3M6az
         jHXw==
X-Forwarded-Encrypted: i=1; AJvYcCXbdDZKJMzRbbiralN092YXTyuNTu3zTfr9KGCrsmhMN62QJmiCFdwTmhtUb2tX7EXgdHAaelFrhEHVsiCKcdEU@lists.infradead.org
X-Gm-Message-State: AOJu0YzzCFXdDS6jMRvl/Z3BTbFPyjUUqF/Jgv7fmM+0cAFV7YvK8rfI
	4rDRuI7jNxgVSwTyqPvUQm9LgStUh3Cus7WGfbnilH5lBdLWOlqpQwbPwltL+mc=
X-Gm-Gg: ASbGncsrNcPCb90YqS9JCa6RC5/lHrRzl60FdodY2+ebnIwmz/lJY84BgFd7dw+iILX
	GVTpJ4YJr/RIpKE7oX8Tehp8DbhSH0fqiR+50yDxxxFMS+NayoZluSgXWspUqGPi92Gpe0xikhF
	xMFAXLvGWC0fI4+eoyiFLPe5R8uAS6Rx7vuPEjCMBnAjFrbtIxhbeLPDuz4yDQNAYtwzOrOSz5C
	OnYYnLBjWFE6Y3O/0jn8DJd2f8zT8d6F+QPvYScOfu3GMdLWLGXNL+K9v5HriQHQlLXFAgUwE2n
	3vaHN3R3zTXeLW8XbYnCwFKN+hG3gQNKaLa8GDCTuI5WFG0i/BqJAKh3jA6uWrRgemR8+6gHfwA
	uzRl8nFM/qznGv21juiA=
X-Google-Smtp-Source: AGHT+IHbq+pHzTQuxxdUufVp0+5UWeEWnmEdvfzQVGDaZiAVyxBLUWwXVLbiir8zvtHTZQ/owxmlMQ==
X-Received: by 2002:a05:6214:3008:b0:6ea:d361:a4ca with SMTP id 6a1803df08f44-6f2c46557e7mr318335806d6.32.1745348437625;
        Tue, 22 Apr 2025 12:00:37 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-219-86.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.219.86])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2c21da6sm60863536d6.98.2025.04.22.12.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 12:00:36 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1u7IrE-00000006vVF-1Cvg;
	Tue, 22 Apr 2025 16:00:36 -0300
Date: Tue, 22 Apr 2025 16:00:36 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: William McVicker <willmcvicker@google.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	Charan Teja Kalla <quic_charante@quicinc.com>
Subject: Re: [PATCH v2 4/4] iommu: Get DT/ACPI parsing into the proper probe
 path
Message-ID: <20250422190036.GA1213339@ziepe.ca>
References: <cover.1740753261.git.robin.murphy@arm.com>
 <e3b191e6fd6ca9a1e84c5e5e40044faf97abb874.1740753261.git.robin.murphy@arm.com>
 <aAa2Zx86yUfayPSG@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAa2Zx86yUfayPSG@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_120039_559160_52C65789 
X-CRM114-Status: GOOD (  18.55  )
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

On Mon, Apr 21, 2025 at 02:19:35PM -0700, William McVicker wrote:
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 1813cfd0c4bd..6d124447545c 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -1440,8 +1440,8 @@ static void platform_shutdown(struct device *_dev)
>  
>  static int platform_dma_configure(struct device *dev)
>  {
> -       struct platform_driver *drv = to_platform_driver(dev->driver);
>         struct fwnode_handle *fwnode = dev_fwnode(dev);
> +       struct platform_driver *drv;
>         enum dev_dma_attr attr;
>         int ret = 0;
>  
> @@ -1451,8 +1451,12 @@ static int platform_dma_configure(struct device *dev)
>                 attr = acpi_get_dma_attr(to_acpi_device_node(fwnode));
>                 ret = acpi_dma_configure(dev, attr);
>         }
> -       /* @drv may not be valid when we're called from the IOMMU layer */
> -       if (ret || !dev->driver || drv->driver_managed_dma)
> +       /* @dev->driver may not be valid when we're called from the IOMMU layer */
> +       if (ret || !dev->driver)
> +               return ret;
> +
> +       drv = to_platform_driver(dev->driver);
> +       if (drv->driver_managed_dma)
>                 return ret;
>  
>         ret = iommu_device_use_default_domain(dev);

The diagnosis looks right to me, but pedantically I think it should
have a READ_ONCE():

struct driver *drv = READ_ONCE(dev->driver);

And then never touch dev->driver again in the function.

Send a proper patch?

Jason

