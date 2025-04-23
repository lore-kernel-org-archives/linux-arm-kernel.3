Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52618C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 13:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LS2O4ijWT/954gJ7Po+mrl2ivjfcfbbmblMAVvot+M4=; b=e7Dg5v7G+m68lPpspFIlOi+BFl
	IgOqff1kpiJBGck3SkhKqgiX0fL60Duh25gJK+hr4G5MffhVT5sDpgh1TiXu0zSFp6XjBZ8dVeF5F
	F+5NoPSEKdzWymvefYdvQERUvz2XhVKvnt2cnJks2ssDT1ew5IfTa0Tk36U0rYWZfaXB/z9FbMDbc
	iFol1zn3bpMhL+rDM376tPPPJ7KH5qhQ5EsIgBphx7pN3bs/wkFJ1K4yg2IjV5oZcIphN/lr7jzdT
	eERUbICaThwz/We9k4EGYxlWvY+JWF6cG+bBYbDfwEY28hIBY5/swU/6nY19HCAIt/a+xlvLmOLXK
	ac9Inz4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Zn0-0000000AX21-3cnG;
	Wed, 23 Apr 2025 13:05:22 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WaZ-0000000A0ug-3KJo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 09:40:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=LS2O4ijWT/954gJ7Po+mrl2ivjfcfbbmblMAVvot+M4=;
	b=BZ3uRgbp605ujwLLQBhqu5ElSw+xVo5n2y2B6jE+oPMPqM4aKIl7RHWKVjXPe1
	W8gQlbfD6MkOSG2Z3l6F858HMS2S/ZaPp35goiWk7G3AxjyuKpHIeJDwjVzuxKV1
	ghKBAcKzAnQtttY9ccm6lGt2iLY7YNZsdMGaG1vYGMW9E=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDn84o_tQhofGK5Aw--.10993S3;
	Wed, 23 Apr 2025 17:39:14 +0800 (CST)
Date: Wed, 23 Apr 2025 17:39:11 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
	Conor Dooley <conor@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 10/19] arm/arm64: dts: imx: Drop redundant CPU
 "clock-latency"
Message-ID: <aAi0tkNWlvwqIBxM@dragon>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-10-076be7171a85@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403-dt-cpu-schema-v1-10-076be7171a85@kernel.org>
X-CM-TRANSID: M88vCgDn84o_tQhofGK5Aw--.10993S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr1kXw4DWFy8WFWDCrW3KFg_yoW3Xrg_ZF
	n7K348Ja1rCry7J3Z8trs5XwnxKryUWwn3Cr17XrWkG34aqr9rAFWDGFZ5Cr13XFWagry3
	A3sxJFs2y3s0kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjQeOPUUUUU==
X-Originating-IP: [114.216.210.34]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiARM4ZWgIqUAwhgAAsw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_024020_195835_0E176AD7 
X-CRM114-Status: UNSURE (   9.97  )
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

On Thu, Apr 03, 2025 at 09:59:31PM -0500, Rob Herring (Arm) wrote:
> The "clock-latency" property is part of the deprecated opp-v1 binding
> and is redundant if the opp-v2 table has equal or larger values in any
> "clock-latency-ns". The OPP tables have values of 150000, so it can be
> removed.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm/boot/dts/nxp/imx/imx7s.dtsi      | 1 -
>  arch/arm64/boot/dts/freescale/imx8mm.dtsi | 4 ----
>  arch/arm64/boot/dts/freescale/imx8mn.dtsi | 4 ----
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 4 ----
>  arch/arm64/boot/dts/freescale/imx8mq.dtsi | 4 ----
>  5 files changed, 17 deletions(-)

Applied as two patches, one for imx/dt branch and the other for imx/dt64.

Shawn


