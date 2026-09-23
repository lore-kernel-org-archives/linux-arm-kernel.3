Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB631C98304
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 18:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OrNV4RTSvEcp80MsSzY2H5C2CS5EoMlyA0T62CgMGog=; b=yG8RG5OA75zGI/2je6bJmDxpJJ
	Y4E+PiqTHQ9Qzf0JG9ul31744tI1Z+dQ1BznYHObpIOudFXAc3rr1h/WpB6wmzaJsPXeRbG6BkQal
	/OkTFoTUH+R/YCWuHsYKtW3C/7A+30Jb7B7YdKlYb8kDRstqkPQGsKe+aa//Mv/3LaT5oiZ326L/S
	VjCu9hlb/AApOZNLmQtd2uM8vhXbOOslbbFsd8u1zJvlDWWSbElDuGBgYK+zFB/sD+wSXSZZT49/b
	2dibqkkSLUdHYQ2+QxOqEa1fGl9WrKlvejykhEKwOpscH0RXyF51wmg6d9dM52GywZ22GP1Y7HWnX
	mw6s6Ayg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Rtj-00000009Eyh-1XoA;
	Wed, 23 Sep 2026 18:40:52 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9RtF-00000009Esg-0mSy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 18:40:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=OrNV4RTSvEcp80MsSzY2H5C2CS5EoMlyA0T62CgMGog=; b=yhjkIJHlzT5HZm76/wauJUvG4J
	zvNPInWrpiIamTIHq+/4DT1d/lXMf7A7/5b180690PBD8CnvhmtRRjrI+J2t3/Q6qsC+G/hjveV0P
	saXb3BlBn6A9yKrlsmASrZaFqihFvzMGphAF2yhbbsTCnmchHhcABiH2b7aSpmkGf56o=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x9Rt1-006rEE-GC; Wed, 23 Sep 2026 20:40:07 +0200
Date: Wed, 23 Sep 2026 20:40:07 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Coia Prant <coiaprant@gmail.com>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Richard Cochran <richardcochran@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	"Jose.Abreu@synopsys.com" <Jose.Abreu@synopsys.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Subject: Re: [PATCH RFC net-next 0/9] net: introduce Qualcomm XPCS support
 and add Nord Ethernet plumbing
Message-ID: <67d74ba3-e1f4-46df-b14e-9ccf06a72043@lunn.ch>
References: <20260923-qcom_xpcs_nord_emac-v1-0-4b1c682af70f@oss.qualcomm.com>
 <5135e15d-b6ac-476c-9a7d-b7d64e4eed5c@bootlin.com>
 <arOtU15iv5CWPUEu@oss.qualcomm.com>
 <CALj3r0gAaQ_CoS5_9Mmf5HY+Fu5_e74fbb+r0LstafMhagHx6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALj3r0gAaQ_CoS5_9Mmf5HY+Fu5_e74fbb+r0LstafMhagHx6A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_114021_223009_7AD41729 
X-CRM114-Status: UNSURE (   7.92  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

> Would it make sense to take that route here? My pcs-xpcs-rk does the
> MMD redirection through a custom MDIO bus; maybe the Qualcomm glue can
> reuse that idea directly instead of extending pcs-xpcs-plat. Happy to
> help with the generic parts if that's useful.

I would be happy with a custom MDIO bus as well.

  Andrew

