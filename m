Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7ADBCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 22:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HbVmBTAdh9kW2ThMT64QyOB1B4v8smPiZkMMv2zMV4=; b=E6HMnhfYCPa8tht0+OLQTwHDmz
	8S8JaM87838T+9EHXIDO/e1tuPGjNF+bLVkRWcZ5HdTSTMUNQ6zm4JxumjCXu7Jgyyq/Ix1zMFtfb
	djA07RISIbQH+SSzpe39sfDgxIj37YSKvZwEsFUPPD6iwE1b5rJxFs8uU9kYJ2FUVlwoRjYuKVnum
	YUceO6KKmMRU1npQEf4BFR8APk40pHmBudnnc3lAIPeDvAbBZfk0JH5X9aUlrBXntdmvd4moU1MCf
	CZkDyULjy8wQGonIB+XQAfkGoULeHRm25A2RFc5VEgJdhZb6e1CkYws977cccnTjpj3k6q4+naehZ
	eRNfYooQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUB8i-0000000Bwe4-41yq;
	Mon, 01 Jun 2026 22:29:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUB8g-0000000Bwdb-31SA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 22:29:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 22DBD43F42;
	Mon,  1 Jun 2026 22:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C40D51F00893;
	Mon,  1 Jun 2026 22:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780352982;
	bh=/HbVmBTAdh9kW2ThMT64QyOB1B4v8smPiZkMMv2zMV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SaJTlJhK4GvqFkgTBNDp05nUL2BcF06+muHqRcAFraDY7DFcvF8V+em6dKteyDyMx
	 D0mPJtMB6tKI5OyuOCY1Hpsyd7cqU4umFKDDvZBeeOaLtQWCfoLDKwGuOlFpx8uvAa
	 JN8HUn0m6m80f8Y03Zwzqu44Jaznb6C+ia7azbw2QWAg7YWl/29hPW0CHDkJe1vqwr
	 IHHcl6Rhdzm4kan7/oVBVS2gu/z/9uamfzlKJYFFeKjnoi9r9lZS2zZ2aRpk5cv1kL
	 pF4v4JLsLRIqITS+bXntFsy33kqv2/rcg/VWgno7u9lI+b51wtx0smrHivLXeSNBS7
	 HKb1bPhJwjU0g==
Date: Mon, 1 Jun 2026 17:29:41 -0500
From: Rob Herring <robh@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, laurentiu.palcu@oss.nxp.com,
	victor.liu@nxp.com, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] Revert "dt-bindings: display: bridge: ldb: Fill in
 reg property"
Message-ID: <20260601222941.GA101404-robh@kernel.org>
References: <20260504-v7-1-topic-ldb-fixes-v1-0-0125d937ff7f@pengutronix.de>
 <20260504-v7-1-topic-ldb-fixes-v1-2-0125d937ff7f@pengutronix.de>
 <20260505141538.GA2547282-robh@kernel.org>
 <2bl2mwpk57xgkuye2gydliymjkzikiovnb7ovnb73olwtfkjwn@byn3732grvnh>
 <CAL_JsqLYS1sgU680KNR60+OvtNwEVKWovht7K2APO3sqeJe6Nw@mail.gmail.com>
 <zbbez4lpme7szgnsd7fqufbuhmvcftw4sqrmwwwzyxu64i2ppb@fh2fgdkc6tat>
 <CAL_JsqJWyRPh_hmJW8p7+VvtcqpS0a_azjMO-PyQgkqQUfLAGA@mail.gmail.com>
 <uyh5s6g7bvuufnhfjrmungp5dbyllxfrgfzaxno22knpxxojmj@qqvh75ezblpp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <uyh5s6g7bvuufnhfjrmungp5dbyllxfrgfzaxno22knpxxojmj@qqvh75ezblpp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_152942_800363_FFDE95B2 
X-CRM114-Status: GOOD (  22.38  )
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

On Wed, May 13, 2026 at 12:26:40PM +0200, Marco Felsch wrote:
> On 26-05-07, Rob Herring wrote:
> > On Thu, May 7, 2026 at 6:55 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> 
> ...
> 
> > > > But nowhere have you said the LDB registers are mixed with other
> > > > functions. If they aren't, then there is absolutely nothing to change
> > > > in the binding. If they are, then yes, we shouldn't have 'reg'.
> > >
> > > No they aren't mixed with other functions (for now).
> > 
> > For now? Is the h/w going to change or is the binding *still* incomplete.
> 
> Sorry for the confusion. By for now I mean that NXP tend to reuse IPs
> but with minor changes. So no, the binding is not incomplete with our
> current HW knowledge.

If such changes occur, then we can deal with it at that time.


> > > Can you please
> > > confirm that mixing 'reg' based sub-device nodes with non 'reg' based
> > > sub-device nodes  is allowed? E.g. if the below example is allowed?
> > >
> > >         system-controller@4ac10000 {
> > >                 compatible = "fsl,imx93-media-blk-ctrl", "syscon";
> > >                 reg = <0x4ac10000 0x10000>;
> > >                 #address-cells = <1>;
> > >                 #size-cells = <1>;
> > >
> > >                 ...
> > >
> > >                 bridge@5c {
> > >                         compatible = "fsl,imx8mp-ldb";
> > >                         reg = <0x5c 0x4>, <0x128 0x4>;
> > >                         reg-names = "ldb", "lvds";
> > >
> > >                         ...
> > >                 };
> > >
> > >                 dpi-bridge {
> > >                         compatible = "nxp,imx93-pdfc";
> > >
> > >                         ...
> > 
> > Depends what is in "...". If only a compatible, then no. If there are
> > actual resources defined, then yes.
> 
> Please see the below full example, is this allowed?
> 
> system-controller@4ac10000 {
> 	compatible = "fsl,imx93-media-blk-ctrl", "syscon";
> 	reg = <0x4ac10000 0x10000>;
> 	#address-cells = <1>;
> 	#size-cells = <1>;
> 
> 	...
> 
> 	bridge@5c {
> 		compatible = "fsl,imx8mp-ldb";
> 		reg = <0x5c 0x4>, <0x128 0x4>;
> 		reg-names = "ldb", "lvds";
> 		clocks = <&clk IMX8MP_CLK_MEDIA_LDB_ROOT>;
> 		clock-names = "ldb";
> 		assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>;
> 		assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
> 		status = "disabled";
> 
> 		ports {
> 			#address-cells = <1>;
> 			#size-cells = <0>;
> 
> 			port@0 {
> 				reg = <0>;
> 
> 				ldb_from_lcdif2: endpoint {
> 					remote-endpoint = <&lcdif2_to_ldb>;
> 				};
> 			};
> 
> 			port@1 {
> 				reg = <1>;
> 
> 				ldb_lvds_ch0: endpoint {
> 				};
> 			};
> 
> 			port@2 {
> 				reg = <2>;
> 
> 				ldb_lvds_ch1: endpoint {
> 				};
> 			};
> 		};
> 	};
> 
> 	dpi-bridge {
> 		compatible = "nxp,imx93-pdfc";
> 		status = "disabled";
> 
> 		ports {
> 			#address-cells = <1>;
> 			#size-cells = <0>;
> 
> 			port@0 {
> 				reg = <0>;
> 
> 				dpi_from_lcdif: endpoint {
> 					remote-endpoint = <&lcdif_to_dpi>;
> 				};
> 			};
> 
> 			port@1 {
> 				reg = <1>;
> 
> 				dpi_to_panel: endpoint {
> 				};
> 			};
> 		};
> 	};
> };

Yes, this seems fine.

Rob

