Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9CFD11187
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Nov 2024 18:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TEDfJQj5mI10kN+wwdoFMrm2dhK/uEbxmEe+uWSOm58=; b=w0GQ4ftoYSb0n15SLH9fOxRyX1
	vJVxkHZG3jVHsADoXQgV5T91q/TLryRpYa7kTK7nJ2gAaXbcaVhsk2xiuYqpEs1nbVzF4SGmGtcNi
	4/Z4KDR4eSbAst2P0AzJ9u+Iq2ruZUmiPPUi2t33dRw3ORPQRmXeYwyy24YnUUpGY3Rwy1BWqofKS
	OFrarmqpS4K5FtqpWpCVmTSICMGUuk2krWyv1WpwOGo+IoVhI2dRmvIA4Lzeq+WqLt5jJ1Gn2bPuy
	YOBtl2Jlwkzcem+Kcy5nXPMr8ozWC0tCuyncJJ5vv11nq2zqgCNzyvl4TBEE7MeQsXgyoivXVd+XP
	TuVSQoog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7f7U-0000000BpYa-22W9;
	Sun, 03 Nov 2024 18:14:36 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7f5o-0000000BpRJ-3iiq;
	Sun, 03 Nov 2024 18:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=TEDfJQj5mI10kN+wwdoFMrm2dhK/uEbxmEe+uWSOm58=; b=XAVMEtgHPm/CP5wWXga647XAud
	6XcRKMh9aHdy/WSXMnyv0lcsVsP31xBUkB6gt42dk51LOeK3mP3vGzZuDO+BynAXr8RbffNaPwisr
	b2A1/qOYDLd8KJEtKXHJyUx7QCvA+t1cet2cGFBMPtnX33cs9f23+P0TUkemsaAqOD3c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t7f5M-00C1y2-MF; Sun, 03 Nov 2024 19:12:24 +0100
Date: Sun, 3 Nov 2024 19:12:24 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Drew Fustini <dfustini@tenstorrent.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Drew Fustini <drew@pdp7.com>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH net-next v7 0/2] Add the dwmac driver support for T-HEAD
 TH1520 SoC
Message-ID: <662a8258-291d-4cfc-b21a-f3c92f9588f2@lunn.ch>
References: <20241103-th1520-gmac-v7-0-ef094a30169c@tenstorrent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241103-th1520-gmac-v7-0-ef094a30169c@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_101252_946133_AF8DBF7D 
X-CRM114-Status: GOOD (  11.97  )
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

On Sun, Nov 03, 2024 at 08:57:58AM -0800, Drew Fustini wrote:
> This series adds support for dwmac gigabit ethernet in the T-Head TH1520
> RISC-V SoC used on boards like BeagleV Ahead and the LicheePi 4A.
> 
> The gigabit ethernet on these boards does need pinctrl support to mux
> the necessary pads. The pinctrl-th1520 driver, pinctrl binding, and
> related dts patches are in linux-next. However, they are not yet in
> net-next/main.
> 
> Therefore, I am dropping the dts patch for v5 as it will not build on
> net-next/main due to the lack of the padctrl0_apsys pin controller node
> in next-next/main version th1520.dtsi.

You should send the .dts patch to the Maintainer responsible for
merging all the RISC-V DT patches, maybe via a sub Maintainer. All the
different parts will then meet up in linux-next.

	Andrew

