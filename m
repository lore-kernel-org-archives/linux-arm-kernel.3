Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA40C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 17:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HZEbKpA1frJBrkSoz9cnFIH7frubQfuf2pOMnH5himQ=; b=RQ8487u54yAWFx30gMlty3MUfW
	2VYJt56yUoOS2qPysPe8ngj5q4bk4lIjMQW9/V0QM6UuEJUWe84QwiJLRd4/1+mkTwFvKFr5ZAzTJ
	yXmZ+Q+B9q4besRPa2YvbG64Z9aDdQHWSAXYOWLTWqYKAU5b2zwGdTNN9fpvWLNM/CX/PSRnnERxd
	6JKZOtgCUZbKnPOWN6qFcon/Pnxt33ZtMy4P31nLx1GKGZ1nqZFZDsdw/Rl/EzaVYa8JePy7VajnG
	PyJyIHNxzgfmoVqNvafS+eJescycfUpYX4q94SUS5m6yPniYqu3aZasaxGitliKkbAl4pDJ1ZCPN3
	nltnaSXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twlTG-00000003mDu-2sJE;
	Mon, 24 Mar 2025 17:20:18 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twlRX-00000003m1C-2tls
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 17:18:33 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2264aefc45dso77089795ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Mar 2025 10:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742836711; x=1743441511; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HZEbKpA1frJBrkSoz9cnFIH7frubQfuf2pOMnH5himQ=;
        b=Ld9g5KFN3Ief36yAMIj56Ftl5xm9JijJ92zcyOSiIrOQdBPsJjtfN8e5twyLKJoWs0
         hHlADMm2RMgtcScK2JJUG7lqqrCKbTjQ+jaIENgfVyIlWMyWQL2FqFbJ8B77/LvpyIme
         re6FdoL9G1jduUjg3dRHGMab7i+zqZX6re2Op6bjc17wmBXQsJi5Dy/eCEhoPYADDtgU
         QIxW1W19TXjvcD0rae+9FdxwObOhJ2+Q3k90/onPkqHsgkbNTBE6gG568VBN5cumjrmc
         S4K+4SR4gcXbtBrbJD0VYTJhDImTznKfsMM0hamaRkiXlx9jSAU7dBzcMxNTvQzO5vV2
         nGLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742836711; x=1743441511;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HZEbKpA1frJBrkSoz9cnFIH7frubQfuf2pOMnH5himQ=;
        b=S0foY8EH/AoxbVGwVt7juGoQzRMa6LjYoqvNxyw9u6cAr0uthVPV9FjYgql/0tvNxY
         93fn1UzQw4Lxct0eXV95S0MvgtBU2g0NOYSdrdx5OzdyyUv3r6C5OPWyFZtuG3t7LOnK
         XNQVk5m+sXpSUqxCgdAxqzBmv4uJ11youRs0BVhqtCjXJd3DqhBNsDQ+lKjxQARjA9qL
         HYP1FSA08Lrahd4QfhvA/v2kjh3TRNw0Fd4SMSjZED4rckqm2WQRpgWo6UUKTYQIHw6j
         cC6NGB4rR2oopQLtnNznXgqOYZio9MCdg37H6PdoqcV9HvXx9si61UkZeb1rh+Q4SfZp
         lQtA==
X-Forwarded-Encrypted: i=1; AJvYcCVrzw1le03C7j/8uwLwSibEs0PP5kULCTJOy57vVH1tHQnFlC6w+5oOC89U4QZEKC7vlOaO1QSFgxEs0kFZv8yg@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu6S6RLeIUafpcfsIUwbEadoYv2EVK7CSA8NuIE3nUglEpQ7JP
	iQagrjtH3d0q1WsP2Vaq4o7TuxYdm8rF2xCSXD9IsZVsZfGvxwv8naaUSryebQ==
X-Gm-Gg: ASbGncusvoyqy8m56my0m1w2sD9ROL+w5vbV21RNj9q2+slKJB5/w5KPoAeq4ywoFBv
	vRjetkQ/vonLYNo/+qxy0Vu3dNe2K/BmnvNrvoysI3GDtKf01O0go6lmPPYtLJRIuNQXM4jrPRn
	Y1w9tuUKWPRTN0+9YjlMIx6uKcFMuskAktJGQMZd8TFIoriAFZwmZNFA7y5/w2LF8D/yNzufbCm
	XL4AZdfRe+/GDIF1d9zOLUT77FlJJuN9cvUrQncGrrAIo2WbatAIpB6sHuhRbJYXwEcF9Da1cn1
	YUhEIqhLVPyXoBIv5olJG0n5hhHVO0FpXOEDhTkwyWAvW9stmodgbEAE+5hri1CDvQ==
X-Google-Smtp-Source: AGHT+IG/+IMOKh9mdPF7QL4qAJQoeDmcoGNXXl94gtnk4lfwQykOcdsW47jIFy2/Z8VlBPbmIKO/Sg==
X-Received: by 2002:a17:902:f648:b0:224:fa0:36da with SMTP id d9443c01a7336-22780c7c06fmr184562345ad.18.1742836710841;
        Mon, 24 Mar 2025 10:18:30 -0700 (PDT)
Received: from thinkpad ([120.60.67.138])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f3bbedsm73934205ad.3.2025.03.24.10.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 10:18:30 -0700 (PDT)
Date: Mon, 24 Mar 2025 22:48:23 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Niklas Cassel <cassel@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v12 05/13] PCI: dwc: Add dw_pcie_parent_bus_offset()
Message-ID: <j3qw4zmopulpn3iqq5wsjt6dbs4z3micoeoxkw3354txkx22ml@67ip5sfo6wwd>
References: <20250315201548.858189-1-helgaas@kernel.org>
 <20250315201548.858189-6-helgaas@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250315201548.858189-6-helgaas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_101831_752260_43AE0241 
X-CRM114-Status: GOOD (  19.06  )
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

On Sat, Mar 15, 2025 at 03:15:40PM -0500, Bjorn Helgaas wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Return the offset from CPU physical address to the parent bus address of
> the specified element of the devicetree 'reg' property.
> 
> [bhelgaas: return offset, split .cpu_addr_fixup() checking and debug to
> separate patch]
> Link: https://lore.kernel.org/r/20250313-pci_fixup_addr-v11-5-01d2313502ab@nxp.com
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware.c | 23 ++++++++++++++++++++
>  drivers/pci/controller/dwc/pcie-designware.h |  3 +++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index 9d0a5f75effc..0a35e36da703 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -16,6 +16,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/ioport.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <linux/platform_device.h>
>  #include <linux/sizes.h>
>  #include <linux/types.h>
> @@ -1105,3 +1106,25 @@ void dw_pcie_setup(struct dw_pcie *pci)
>  
>  	dw_pcie_link_set_max_link_width(pci, pci->num_lanes);
>  }
> +
> +resource_size_t dw_pcie_parent_bus_offset(struct dw_pcie *pci,
> +					  const char *reg_name,
> +					  resource_size_t cpu_phy_addr)
> +{

s/cpu_phy_addr/cpu_phys_addr/g

'phy' usually refers to the physical layer IP block. So 'cpu_phy_addr' sounds
like the address of the CPU PHY.

> +	struct device *dev = pci->dev;
> +	struct device_node *np = dev->of_node;
> +	int index;
> +	u64 reg_addr;
> +
> +	/* Look up reg_name address on parent bus */

'parent bus' is not accurate as the below code checks for the 'reg_name' in
current PCI controller node.

> +	index = of_property_match_string(np, "reg-names", reg_name);
> +
> +	if (index < 0) {
> +		dev_err(dev, "No %s in devicetree \"reg\" property\n", reg_name);

Both of these callers are checking for the existence of the 'reg_name' property
before calling this API. So this check seems to be redundant (for now).

- Mani

-- 
மணிவண்ணன் சதாசிவம்

