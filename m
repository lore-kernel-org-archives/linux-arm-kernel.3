Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69354C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 23:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iC2U8Wn7kGF2PEm+pmf5NLerIZgG0BIk56qtZD7q44Q=; b=lKc2adtsukkORreVIE8PDFl8eE
	JojqSpxlk46rSWiAjoerEqjcbyGC0kxctVCqQexBzYF5C5jxcOZKaWu806LUqcfJ2jhdwkAb201sV
	Vs8b5EYbco7hLC5wkm9kvOTK9w0xXfzvXFmBLZ4oo/zm1hgv+rjeXk/Zm48O2uXqK4Y71KBFkWPq9
	TDkJibHcIeB0DBlO8CjWy2iqtKqwa5cMySfs3BjutR3trFLikix7qVEui2GPnD6XJSgX7FyISeplr
	aU6LXyQJMY+bun94k7WvQV4xVPlXzd4arOKas8oSXsUhMAZZoPvVdsw86iGN/pOOZ/cjrwy1kjugA
	mOJo+GHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thd5N-00000001pCE-2R59;
	Mon, 10 Feb 2025 23:21:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thck2-00000001la0-37zE
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Feb 2025 22:59:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=iC2U8Wn7kGF2PEm+pmf5NLerIZgG0BIk56qtZD7q44Q=; b=EpGEoWCcNlgygbz28Pi/yDKSGC
	bpkfZkubt8xr4+QY394OX2Xwap5pTNQcdfX0GDyRavI1MEYrgaDELusZijzUR9pJrV6Tw3IFi2tcv
	QjMrGKQm1wrxROhTVilNA5JNyUSUM+eQsrBfLGv4hPXN3bXfOslcj5eyHMBbq1XFnURf+rqpXZs9O
	4/ghQqR0m7xnHQtLMnNeljWe3ENmOxHkm18VzNHSO0JWBMGGo8BfVyXhpofZHYjdB93bg98SOdLDL
	fAlLfq9ZxN0ApgXQlhNWsuwYWxOoxm/QuFgyWf7uLX9nSJIkXc4lvF+BLNqS/zW8I09YvtZrz/CVE
	blyVunWA==;
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcjz-00000000LdN-1d1a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 22:59:01 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51AMwugi3582852
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 16:58:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739228336;
	bh=iC2U8Wn7kGF2PEm+pmf5NLerIZgG0BIk56qtZD7q44Q=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=dqnejJ/X0ryB7ScIfgsJFcvSNN3cmwt973RK9/Tgwh8KgAoUYuLA58xQVl8Vc/WN5
	 S5+jivfP8OAQPWkjozy2v4OfymtO04aJPtD7q6Ytrzxy1ufts3i0MytshV4fQx0ODd
	 iu+DY2942lNE1m7aZB2etsX3PlcgcCQe3S+k4Zpo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51AMwuJ6008459
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Feb 2025 16:58:56 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Feb 2025 16:58:55 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Feb 2025 16:58:55 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51AMwtCc052847;
	Mon, 10 Feb 2025 16:58:55 -0600
Message-ID: <fa37b036-7ff0-46d4-b276-f97a7eab7dfb@ti.com>
Date: Mon, 10 Feb 2025 16:58:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/10] arm64: dts: ti: k3-am62a-main: Add C7xv device
 node
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra
	<vigneshr@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Hari Nagalla
	<hnagalla@ti.com>
References: <20250210221530.1234009-1-jm@ti.com>
 <20250210221530.1234009-5-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250210221530.1234009-5-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_225859_909847_40BF84BA 
X-CRM114-Status: GOOD (  13.62  )
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

On 2/10/25 4:15 PM, Judith Mendez wrote:
> From: Jai Luthra <j-luthra@ti.com>
> 
> AM62A SoCs have a C7xv DSP subsystem with Analytics engine capability.
> This subsystem is intended for deep learning purposes. Define the
> device node for C7xv DSP.
> 
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---

Acked-by: Andrew Davis <afd@ti.com>

> Changes since v4:
> - No change
> ---
>   arch/arm64/boot/dts/ti/k3-am62a-main.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> index a1daba7b1fad5..f6ebc4eabaf14 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-main.dtsi
> @@ -1123,6 +1123,18 @@ vpu: video-codec@30210000 {
>   		power-domains = <&k3_pds 204 TI_SCI_PD_EXCLUSIVE>;
>   	};
>   
> +	c7x_0: dsp@7e000000 {
> +		compatible = "ti,am62a-c7xv-dsp";
> +		reg = <0x00 0x7e000000 0x00 0x00100000>;
> +		reg-names = "l2sram";
> +		ti,sci = <&dmsc>;
> +		ti,sci-dev-id = <208>;
> +		ti,sci-proc-ids = <0x04 0xff>;
> +		resets = <&k3_reset 208 1>;
> +		firmware-name = "am62a-c71_0-fw";
> +		status = "disabled";
> +	};
> +
>   	e5010: jpeg-encoder@fd20000 {
>   		compatible = "ti,am62a-jpeg-enc", "img,e5010-jpeg-enc";
>   		reg = <0x00 0xfd20000 0x00 0x100>,

