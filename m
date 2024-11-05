Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D95AD12660
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 07:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CE1Ann0N54YMVcubl0bdIuhoD0dbS3Lrp2O1zrujtXA=; b=KNRb/5411ii8gtm2zocTiWAier
	xdGq3Cg3OwAUW9RYxha5Bg007oBqlxGQK/9ovx2Qsb5of1z7IhKxOE7w+4roDf/t8Aof7/EOVzPTP
	fZARkKlhbIBK7cNQ/Y5n0FtIZXp8Urm1v6h9cACeB0glfUV18Xw2yJ4En4kis9ywRwEVsNl20NaMg
	EFubPm+wUO1aPUP4MbpGC8ahzhqHJi9/KHTYyP1UQvycBC2JWDH4ELwtqglfU0J3yko9RSQhwn+My
	AdJYy75aIgFEw7uAsbkK6Vls9163H/uAxC2YzBGwoKMLE6BPLAiYdvsBWt27BnZO9R69+Qyd4lG0X
	EeodnIFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ENf-0000000GFER-3pLv;
	Tue, 05 Nov 2024 07:53:39 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8EIX-0000000GEFv-2B18
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 07:48:23 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A5504Ar010867;
	Tue, 5 Nov 2024 08:48:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=selector1; bh=CE1Ann0N54YMVcubl0bdIuho
	D0dbS3Lrp2O1zrujtXA=; b=a2TrC+MkfgqcIksGa6RUg20sxh1OXUUwRo+zdmMw
	o1QMeG0MKNbEu3blOmlFzxX40Fzw0f69u+QlaLa3n7W7/iCsvjNFVcDgMQl8j1E6
	hApY+vKZt1Ud8fO4mN7hIJCC1M3iuYjwdUPHXEohRuL9PBUwYeUxOn58PWhEh7+2
	gsMMGg1SlNxuU7koI6OTq0Hy6sJt2r5M9sW2f1u+/wsS0J+jfMUO7KIIAH3An5uR
	tblBbxA4qqZcl3z1Az+EoewQq+vdlI+F1re/nSqMdqbBeL+YFkPO7/xZ2hEPv0fW
	shza+F96TN+/h+PkAC9V/mXuLh8v/9awt+dTen/lWPa7iw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 42nywn88cs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 08:48:08 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6230E40046;
	Tue,  5 Nov 2024 08:46:53 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 21D3124A466;
	Tue,  5 Nov 2024 08:45:55 +0100 (CET)
Received: from gnbcxd0016.gnb.st.com (10.129.178.213) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 5 Nov
 2024 08:45:54 +0100
Date: Tue, 5 Nov 2024 08:45:53 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Hans Verkuil
	<hverkuil-cisco@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>, <linux-media@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH 15/15] arm64: dts: st: enable imx335/csi/dcmipp pipeline
 on stm32mp257f-ev1
Message-ID: <20241105074553.GC1413559@gnbcxd0016.gnb.st.com>
References: <20241008-csi_dcmipp_mp25-v1-0-e3fd0ed54b31@foss.st.com>
 <20241008-csi_dcmipp_mp25-v1-15-e3fd0ed54b31@foss.st.com>
 <fgxjk5tikvd5vihlzslovhlpy5xbbgnr3kywkvkd62ppx6ttm7@2rbaqvllyb25>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <fgxjk5tikvd5vihlzslovhlpy5xbbgnr3kywkvkd62ppx6ttm7@2rbaqvllyb25>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.129.178.213]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_234821_852156_E1EA47AB 
X-CRM114-Status: GOOD (  20.08  )
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

Hi Krzysztof,

On Tue, Oct 08, 2024 at 03:42:42PM +0200, Krzysztof Kozlowski wrote:
> On Tue, Oct 08, 2024 at 01:18:17PM +0200, Alain Volmat wrote:
> > Enable the camera pipeline with a imx335 sensor connected to the
> > dcmipp via the csi interface.
> > 
> > Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> > ---
> >  arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 87 ++++++++++++++++++++++++++++++
> >  1 file changed, 87 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> > index 214191a8322b..599af4801d82 100644
> > --- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> > +++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
> > @@ -27,6 +27,38 @@ chosen {
> >  		stdout-path = "serial0:115200n8";
> >  	};
> >  
> > +	clocks {
> > +		clk_ext_camera: clk-ext-camera {
> > +			#clock-cells = <0>;
> > +			compatible = "fixed-clock";
> > +			clock-frequency = <24000000>;
> > +		};
> > +	};
> > +
> > +	imx335_2v9: imx335-2v9 {
> 
> Please use name for all fixed regulators which matches current format
> recommendation: 'regulator-[0-9]v[0-9]'
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml?h=v6.11-rc1#n46

Done in v2 for all 3 fixed-regulators.

> 
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "imx335-avdd";
> > +		regulator-min-microvolt = <2900000>;
> > +		regulator-max-microvolt = <2900000>;
> > +		regulator-always-on;
> > +	};
> > +
> > +	imx335_1v8: imx335-1v8 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "imx335-ovdd";
> > +		regulator-min-microvolt = <1800000>;
> > +		regulator-max-microvolt = <1800000>;
> > +		regulator-always-on;
> > +	};
> > +
> > +	imx335_1v2: imx335-1v2 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "imx335-dvdd";
> > +		regulator-min-microvolt = <1200000>;
> > +		regulator-max-microvolt = <1200000>;
> > +		regulator-always-on;
> > +	};
> > +
> >  	memory@80000000 {
> >  		device_type = "memory";
> >  		reg = <0x0 0x80000000 0x1 0x0>;
> > @@ -50,6 +82,40 @@ &arm_wdt {
> >  	status = "okay";
> >  };
> >  
> > +&csi {
> > +	vdd-supply =  <&scmi_vddcore>;
> > +	vdda18-supply = <&scmi_v1v8>;
> > +	status = "okay";
> > +	ports {
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		port@0 {
> > +			reg = <0>;
> > +			csi_sink: endpoint {
> > +				remote-endpoint = <&imx335_ep>;
> > +				data-lanes = <0 1>;
> > +				bus-type = <4>;
> > +			};
> > +		};
> > +		port@1 {
> > +			reg = <1>;
> > +			csi_source: endpoint {
> > +				remote-endpoint = <&dcmipp_0>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&dcmipp {
> > +	status = "okay";
> > +	port {
> > +		dcmipp_0: endpoint {
> > +			remote-endpoint = <&csi_source>;
> > +			bus-type = <4>;
> > +		};
> > +	};
> > +};
> > +
> >  &ethernet2 {
> >  	pinctrl-names = "default", "sleep";
> >  	pinctrl-0 = <&eth2_rgmii_pins_a>;
> > @@ -81,6 +147,27 @@ &i2c2 {
> >  	i2c-scl-falling-time-ns = <13>;
> >  	clock-frequency = <400000>;
> >  	status = "okay";
> > +
> > +	imx335: imx335@1a {
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

Changed to camera@1a.

> 
> > +		compatible = "sony,imx335";
> > +		reg = <0x1a>;
> > +		clocks = <&clk_ext_camera>;
> > +		avdd-supply = <&imx335_2v9>;
> > +		ovdd-supply = <&imx335_1v8>;
> > +		dvdd-supply = <&imx335_1v2>;
> > +		reset-gpios = <&gpioi 7 (GPIO_ACTIVE_HIGH | GPIO_PUSH_PULL)>;
> > +		powerdown-gpios = <&gpioi 0 (GPIO_ACTIVE_HIGH | GPIO_PUSH_PULL)>;
> > +		status = "okay";
> 
> Why? Didi you disable it anywhere?

status property dropped in v2.  powerdown-gpios property dropped as
well since not necessary nor described in the sensor yaml.
reset-gpios polarity is as well corrected in v2, following an change
within the imx335 sensor.

> 
> Best regards,
> Krzysztof
> 

Regards,
Alain

