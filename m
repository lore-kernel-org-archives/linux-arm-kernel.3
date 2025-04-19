Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAC6C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Apr 2025 09:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gft5NuX6qVKgd8gTmf59OKqmKGXTRiwgf8HWTh+DF7E=; b=h/qayGH4b9xZp3oLyVR/WvtQ4Q
	fWj2xbRMZC+wvJSygehIEbk8zem07LI5KU/6pSNvaUwI44ENQuONDExwFrkSalKzi1xwOOvL2L4Pu
	2mRp33ymrM8114EDDRId6kHTbUH77nK+laPapY2m18wLuasdgYczDLvyA6sgDKp7zMpddzQL5a5fi
	bXEDzAlqjC/FfkWWwMx9B9BqtZTDVAdYMVv5uYI6j0ppQ7Qko+k9Asiv5M9xciZffi0mSQiXW9kqa
	gOTtrDQbt3GNunb1wbfFXvmSikPW6S/DAyHRic4bO6E8dFzHh8rpma3A4mzK4eT8sw9AJJ8QgOYbp
	RmyWpu0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u64d9-0000000168A-1Tkr;
	Sat, 19 Apr 2025 09:36:59 +0000
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u64bF-000000015zf-2p79
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Apr 2025 09:35:02 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53J9Yw8m474476
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 19 Apr 2025 04:34:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745055298;
	bh=gft5NuX6qVKgd8gTmf59OKqmKGXTRiwgf8HWTh+DF7E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=WU8mhadhngmBa/ah+C0F72oEmz78Ms2gn+eanhVvPcR7ZOEnNWmG4iR28aVcX2dXV
	 2AX40nlSeWZpui7cVZjUDOeTu3NeMtupeU+WwgKhVyGIRRvXnRYCqKtxcgs6WlJPpq
	 Fdm5arMpuSnKko7k63wAfw0f0MihaK2U6ViXMW7k=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53J9YwXf087851
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 19 Apr 2025 04:34:58 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 19
 Apr 2025 04:34:58 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 19 Apr 2025 04:34:57 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53J9Ys4F081127;
	Sat, 19 Apr 2025 04:34:55 -0500
Message-ID: <4144abf5-82aa-49db-82d7-c1429c12292e@ti.com>
Date: Sat, 19 Apr 2025 15:04:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: ti: k3-am68-sk: Enable DSI on
 DisplayPort-0
To: Jayesh Choudhary <j-choudhary@ti.com>, <nm@ti.com>, <vigneshr@ti.com>,
        <devarsht@ti.com>, <linux-kernel@vger.kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <kristo@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <u-kumar1@ti.com>
References: <20250411105155.303657-1-j-choudhary@ti.com>
 <20250411105155.303657-8-j-choudhary@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250411105155.303657-8-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250419_023501_811235_CEF5AEFB 
X-CRM114-Status: GOOD (  15.31  )
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


On 4/11/2025 4:21 PM, Jayesh Choudhary wrote:
> Enable DSI support for AM68-SK platform.
>
> Add DT node for DSI2eDP bridge. The DSI to eDP bridge is sn65dsi86
> on the board.
>
> Add the endpoint nodes to describe connection from:
> DSS => DSI => SN65DSI86 bridge => DisplayPort-0
>
> Set status for all required nodes for DisplayPort-0 as 'okay'.
>
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>   .../boot/dts/ti/k3-am68-sk-base-board.dts     | 96 +++++++++++++++++++
>   1 file changed, 96 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
> index 11522b36e0ce..df54de2d8236 100644
> --- a/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am68-sk-base-board.dts
> @@ -124,6 +124,35 @@ transceiver4: can-phy3 {
>   		max-bitrate = <5000000>;
>   	};
>   
> +	edp0_refclk: clock-edp0-refclk {
> +		#clock-cells = <0>;
> +		compatible = "fixed-clock";
> +		clock-frequency = <19200000>;
> +	};

I assume on this board and through out series, display is DP not eDP.

do you see possibility to change wording from eDP to DP


> +
> +	dp0_pwr_3v3: fixedregulator-dp0-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "dp0-pwr";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&exp2 2 GPIO_ACTIVE_HIGH>;     /*P0 - DP0_3V3 _EN */
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> [..]

