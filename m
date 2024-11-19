Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F1CED6C287
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 19:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2X4+40w6EI+JnEcsSnqxwoW536xienx35hbqOEEbSFU=; b=JMMONM9tGmXJUlYI87iyjEZ14z
	8RmHUYFPWZhj35jTO63fYfqYXCVknpdycrvjKEUmlbjNsAZCbgVnVcS/Sfdx3iv6V8dNRU4wAz5E1
	yX1driNDjeDBeVSk3Su35YNanjuIK0QzF7YX+NOIuJYZDWhPPCIA2rcbEVSeDY+6EjTcuafaqbBzu
	LwNwYeqOy0HRyghErBoE8qaEPjYA1t+02eMegiMok5aC4zoQ7Y8ZylBZBN+DrHn+mBfdAYEjFnNTW
	/LZY8wtwcLHfXe26Bqjawt6KaSDBXZOBJa0Q8AbKth0Q9yVUECON/OIh4n/hzgf60lARcS85lApEx
	zIZ58Nmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDTkv-0000000DVLG-3Wyw;
	Tue, 19 Nov 2024 19:19:21 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDTk0-0000000DVCv-1eIr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 19:18:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2X4+40w6EI+JnEcsSnqxwoW536xienx35hbqOEEbSFU=; b=NhQRvIb4fNLj4T14/RjuJxrS8k
	LpRulsEWgF3DuGI8R/XphFLccOJK1Rhpde/15j3e1vabb4f3UFcMVJxpxWstW0HaWSGcRQqEE4jn9
	XKGzlquHd6CzJvI9bO2L/hpOTdDj2hj6Mpc4MBxdDg2gHocUKqliC/PlSe8LoteBJTMA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tDTjc-00Ds82-9R; Tue, 19 Nov 2024 20:18:00 +0100
Date: Tue, 19 Nov 2024 20:18:00 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Parker Newman <parker@finest.io>
Cc: Paolo Abeni <pabeni@redhat.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Parker Newman <pnewman@connecttech.com>
Subject: Re: [PATCH v1 1/1] net: stmmac: dwmac-tegra: Read iommu stream id
 from device tree
Message-ID: <f00bccd3-62d5-46a9-b448-051894267c7a@lunn.ch>
References: <cover.1731685185.git.pnewman@connecttech.com>
 <f2a14edb5761d372ec939ccbea4fb8dfd1fdab91.1731685185.git.pnewman@connecttech.com>
 <ed2ec1c2-65c7-4768-99f1-987e5fa39a54@redhat.com>
 <20241115135940.5f898781.parker@finest.io>
 <bb52bdc1-df2e-493d-a58f-df3143715150@lunn.ch>
 <20241118084400.35f4697a.parker@finest.io>
 <984a8471-7e49-4549-9d8a-48e1a29950f6@lunn.ch>
 <20241119131336.371af397.parker@finest.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119131336.371af397.parker@finest.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_111824_429202_7271A8BB 
X-CRM114-Status: GOOD (  17.01  )
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

> I think there is some confusion here. I will try to summarize:
> - Ihe iommu is supported by the Tegra SOC.
> - The way the mgbe driver is written the iommu DT property is REQUIRED.

If it is required, please also include a patch to
nvidia,tegra234-mgbe.yaml and make iommus required.

> - "iommus" is a SOC DT property and is defined in tegra234.dtsi.
> - The mgbe device tree nodes in tegra234.dtsi DO have the iommus property.
> - There are no device tree changes required to to make this patch work.
> - This patch works fine with existing device trees.
> 
> I will add the fallback however in case there is changes made to the iommu
> subsystem in the future.

I would suggest you make iommus a required property and run the tests
over the existing .dts files.

I looked at the history of tegra234.dtsi. The ethernet nodes were
added in:

610cdf3186bc604961bf04851e300deefd318038
Author: Thierry Reding <treding@nvidia.com>
Date:   Thu Jul 7 09:48:15 2022 +0200

    arm64: tegra: Add MGBE nodes on Tegra234

and the iommus property is present. So the requires is safe.

Please expand the commit message. It is clear from all the questions
and backwards and forwards, it does not provide enough details.

I just have one open issue. The code has been like this for over 2
years. Why has it only now started crashing?

	Andrew

