Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D3DCA0EC1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 08:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysn3zwyuU6s13DDWolDXQKifp8kTjv/aucfDhO4qCuA=; b=2q3E8kre95fxAa3SMT9eRO9RPO
	xyYczoQs28JXvEaiqt+eRmEVQbl0QBEdAcsBWjh+Iuo1L+7+5rHZ5SUxTiILiQzrVsl6bKyR3NoDD
	ITceNMSGWsIdOB5lJGTINjIoxMQ1+OZ2atbDnyCG07QlvXSofy5CRZIWpCEEzTmkmvrww5fkp/a7Y
	6mEFy1R6B7ihuy2+h1/BFaR3LhM7sS60Suzn8ulUwWJwZbdLWQm4BhIjL0vJp5zHndeTn/tjCH6YU
	Dbcc9mn7fqIg/0MGdABGc4neT1FmiiSaiSMl3isl8BdiN2conjg24tK98isn6L45P1wdvBp9iZx1D
	mnMB/Dig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNk0-00000006pQu-0p1P;
	Mon, 11 Aug 2025 08:18:48 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNKY-00000006lM1-02uV;
	Mon, 11 Aug 2025 07:52:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ysn3zwyuU6s13DDWolDXQKifp8kTjv/aucfDhO4qCuA=; b=ZQ+7Xu1NFO4Np0TMbQJLOBZv4Y
	xnCQjOvhFHnFhfa0KQfzC5s9SOJCfnBBro+U+jBNVDqmWly2Ff/eDJBX4yG5Dx4wPkW03boI8ly5/
	4fZd2GVvNflKNoM75smMHiC1SwZsuehTN4jJLPEnn8gXb4ilemsJ89nYKDpAQzD85/57u+gmIuOXi
	c54puADCM7vCHqGPDmMGrDCSqfQm0mmY7j5A6NRYjazIGSxq7fbNIbcZHJFQgJe9H7FLSObyqeR+X
	VovaMjFOpBuTg6dYw0c+ibniv2jq41ldoI1ON9Ujhh3GaghFNq1S4YKPMYKJEviJB0HAOF4fJPjX2
	3qb0z0MQ==;
Received: from i53875a0c.versanet.de ([83.135.90.12] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ulNKM-0007Ro-Cb; Mon, 11 Aug 2025 09:52:18 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Alexey Charkov <alchark@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	kernel@collabora.com,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ye Zhang <ye.zhang@rock-chips.com>
Subject: Re: (subset) [PATCH v6 0/7] RK3576 thermal sensor support, including OTP trim adjustments
Date: Mon, 11 Aug 2025 09:52:04 +0200
Message-ID: <175489870466.808197.13531794692476437932.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250610-rk3576-tsadc-upstream-v6-0-b6e9efbf1015@collabora.com>
References: <20250610-rk3576-tsadc-upstream-v6-0-b6e9efbf1015@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_005230_048617_5DDF4377 
X-CRM114-Status: GOOD (  18.21  )
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


On Tue, 10 Jun 2025 14:32:36 +0200, Nicolas Frattaroli wrote:
> This series adds support for the RK3576's thermal sensor.
> 
> The sensor has six channels, providing measurements for the package
> temperature, the temperature of the big cores, the temperature of the
> little cores, and the GPU, NPU and DDR controller.
> 
> In addition to adding support for the sensor itself, the series also
> adds support for reading thermal trim values out of the device tree.
> Most of this functionality is not specific to this SoC, but needed to be
> implemented to make the sensors a little more accurate in order to
> investigate whether the TRM swapped GPU and DDR or downstream swapped
> GPU and DDR in terms of channel IDs, as downstream disagrees with what's
> in the TRM, and the difference is so small and hard to pin down with
> testing that the constant offset between the two sensors was a little
> annoying for me to deal with.
> 
> [...]

Applied, thanks!

[6/7] arm64: dts: rockchip: Add thermal nodes to RK3576
      commit: 15e8ba9d8b14ae6de415186622379f5f4dcfd141
[7/7] arm64: dts: rockchip: Add thermal trim OTP and tsadc nodes
      commit: a4053badacf3699023527392c947314b074f5e0e

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

