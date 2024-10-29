Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A26CD2AB3A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 12:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KupOqAzsYXukwswboaiOBlWFrDT6DI3qWoTJMJpC5Gg=; b=SvsaPxDKQerzEX0D2T07PoAE00
	4gdw22Vl+gdOlGsfTFTEXLkpfkwhW7kMn+p+gMUq+LwFqtzPol0MPhghmtmyfeT4iUlpNfyWiwol5
	tHtjFfTsBIqdque80h5gURgSgFo/IF6TMCukh/tJBWHx5inOUY5CURIJYM+hRa9caiZSdOLBddKC0
	Lzfdubd7KZQUmtPflbpKtl/A1gQTkRHxVHqJGsRAt6ROEcQFMbJgQNSP+XHYxSdjb7uoVePedh+ha
	Exa914Lqjfx+qiLycXmofhkpAC9SaneEnbpgB5FhyTqy8mPJH83+EBJPM+///wHt/0eYRI95sldKJ
	xm5Ts78w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5laZ-0000000ES14-2xRv;
	Tue, 29 Oct 2024 12:44:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kwl-0000000EKZ5-466t
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Oct 2024 12:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KupOqAzsYXukwswboaiOBlWFrDT6DI3qWoTJMJpC5Gg=; b=aD0gdPR4vI/qtYKprYWWLEoKyp
	RszIZfr2dTZtZu1Gh83e4G/A+RTnInEBRnYTfMVDfL/xFMrFbgTN1FLRIMM9QuS0hb3NVs3fGpI5t
	pbD646/sRW2DEpBOWhzGgkDja8CUngxyovHBab1DUTpC5+NjPfKJQXyTrduyX89L22xowOQZ0xxsv
	E/vPbqGJIYOsnrtg0zNVUfICvnV8+prykghBR0jVy7g6W6b6Ho2ulFjuToWt72ggSZMQbXLkEaBZn
	odFeHwdf6Rf9SwTm3YUrXB9W97wYk+9exuc4HNG0u/vd6Z/Vr5k/4c3adB8UBAS9VUZH4PEFTyZcw
	KWFo+Btg==;
Received: from vps0.lunn.ch ([156.67.10.101])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5kwj-00000009tH6-00Ec
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 12:03:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=KupOqAzsYXukwswboaiOBlWFrDT6DI3qWoTJMJpC5Gg=; b=h8nRttEBchVKm3tvCx6PUVkmyo
	JLfVJ4SfjG+AEwvsi26SScysE0BQ9sDI0Lh5zp2mgRWPAI8uhOv9Kwr6Cf3XYajAXVk7qhzU11Ioc
	bUTJrn/SVOpzJcNXI8hzBNqJQzGD3tnttbTbbtg1PepxFUWx/R8Nvp5WKampSxeuJi0I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t5kwQ-00BZCi-06; Tue, 29 Oct 2024 13:03:18 +0100
Date: Tue, 29 Oct 2024 13:03:17 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: jan.petrous@oss.nxp.com
Subject: Re: [PATCH v4 07/16] net: dwmac-intel-plat: Use helper rgmii_clock
Message-ID: <15b4da3e-9456-46e1-9f49-0aac979925d8@lunn.ch>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
 <20241028-upstream_s32cc_gmac-v4-7-03618f10e3e2@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028-upstream_s32cc_gmac-v4-7-03618f10e3e2@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_120337_347940_A9C3BA56 
X-CRM114-Status: UNSURE (   7.78  )
X-CRM114-Notice: Please train this message.
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
Cc: imx@lists.linux.dev, NXP S32 Linux Team <s32@nxp.com>, Emil Renner Berthing <kernel@esmil.dk>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Eric Dumazet <edumazet@google.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Quan Nguyen <quan@os.amperecomputing.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>, Jose Abreu <joabreu@synopsys.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, Keyur Chudgar <keyur@os.amperecomputing.com>, Minda Chen <minda.chen@starfivetech.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Oct 28, 2024 at 09:24:49PM +0100, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> Utilize a new helper function rgmii_clock().
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

