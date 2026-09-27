Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEE6C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 17:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XN3adG8n48aXlFD1oGyPwbYbvAFkDP/CnzFiAMWmyQ4=; b=0MSKnCN/YQguEGTP60yatjXymc
	dTMzCDk8EM63A833a8WEykeHzUkGa2ujvBMggec1zYuoGSWDETSa2BEn7nJOy9tqbd4f9AsEL8Hk+
	RLtIHMnVosNi2GcizonR9DlIL+nxf7dVz4F7UGeFUE71/0u+PIViqKSY6322ngkMbawcT/Em1YMZt
	3BlrBvEvx34qpki1yp2Wo6zoKveTGk69NAmzpaUx6Coso8oI+3xdOk7iKqLtV/ZtiiHsmoZHqmpg7
	kWrPVnhSmIh0Scd2tdI1wHCHmtJd87CCGydKyuuOyoSHzTtRDCv+8bEGVQE97XpPtG5fag8h59/m6
	1ILp0gnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAt6I-0000000Gg4w-2Nf0;
	Sun, 27 Sep 2026 17:55:46 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAt69-0000000Gg3U-04g0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 17:55:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=XN3adG8n48aXlFD1oGyPwbYbvAFkDP/CnzFiAMWmyQ4=; b=hEp60/fnREcY6JQT7sBraSKoyp
	FrNRR2k2n55oXex+eD3KgkOyCycM0kBHzK4jAnF0ybvsKFaZVCrFN20fsfaMcUllSvx8k3zUzZ6La
	DRVU8leSB/IKcQq4+c5FAtfDDK7tKiZAaB5Woc8H1uOWNSzGqdEUEWZP5P1BpVeX00mE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xAt5z-007Y7E-CH; Sun, 27 Sep 2026 19:55:27 +0200
Date: Sun, 27 Sep 2026 19:55:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sagi Maimon <maimon.sagi@gmail.com>
Cc: netdev@vger.kernel.org, radhey.shyam.pandey@amd.com,
	michal.simek@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux@armlinux.org.uk, vadim.fedorenko@linux.dev
Subject: Re: [PATCH net-next 1/2] net: axienet: use device_property and
 fwnode APIs for probe-time config
Message-ID: <6ab4896c-c4d0-499b-befe-045cafa8e470@lunn.ch>
References: <20260927073843.346910-1-maimon.sagi@gmail.com>
 <20260927073843.346910-2-maimon.sagi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927073843.346910-2-maimon.sagi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_105537_062701_D316BB61 
X-CRM114-Status: GOOD (  10.63  )
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

> -	lp->switch_x_sgmii = of_property_read_bool(pdev->dev.of_node,
> -						   "xlnx,switch-x-sgmii");
> +	lp->switch_x_sgmii = device_property_read_bool(&pdev->dev,
> +						       "xlnx,switch-x-sgmii");

What version of the core is being used:

6c8f06bb2e5147b2c25bdd726365df8416c13987
Author: Robert Hancock <robert.hancock@calian.com>
Date:   Fri Feb 12 18:23:56 2021 -0600

    net: axienet: Support dynamic switching between 1000BaseX and SGMII
    
    Newer versions of the Xilinx AXI Ethernet core (specifically version 7.2 or
    later) allow the core to be configured with a PHY interface mode of "Both",
    allowing either 1000BaseX or SGMII modes to be selected at runtime. Add
    support for this in the driver to allow better support for applications
    which can use both fiber and copper SFP modules.

If this property is not needed, please leave it as OF only.

>  
>  	/* Start with the proprietary, and broken phy_type */
> -	ret = of_property_read_u32(pdev->dev.of_node, "xlnx,phy-type", &value);
> +	ret = device_property_read_u32(&pdev->dev, "xlnx,phy-type", &value);

  xlnx,phy-type:
    description:
      Do not use, but still accepted in preference to phy-mode.
    deprecated: true

This property is deprecated. So it should remain an OF property and
not get expanded in scope.

	Andrew

