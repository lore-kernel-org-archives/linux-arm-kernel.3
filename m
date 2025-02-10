Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E4BC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 23:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zxtPDpqoqeuY5nRHmT81+w+9GU1e8rTMSwqw9XhAX4w=; b=DpXFoTY7+gl8PbebOQDErH+CQQ
	AYJyMUS0hDJtPXXKASYcHz9ZP/RJSa+64HGFWCjda+aHWXY55FI0HrdOyp7dZzVZPyTSzB87zALx0
	S8VKyowZE707ndBu1rr0ZsR5E7HZmBv6L49iLfC0vZrKlt/tvSNFe4GNomWp50cpPTyw+jvG3om2t
	5JfST1hrAq9Ji9MA92JraUC9OMnVioC6HF6g1rlBuUhMXqFYw7DiYLprvMi8KuXiOqN9WpgMWx/4m
	0YKIOVYg6Qt8N5hqNqGg/mzO6b8UiRFIxvS4jRzchsiESc44Oo1ZsVnT1497lzmx8bbYq8EYazwd3
	sJHPsO4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thd40-00000001p2V-42sV;
	Mon, 10 Feb 2025 23:19:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcjm-00000001lWm-33jK
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Feb 2025 22:58:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zxtPDpqoqeuY5nRHmT81+w+9GU1e8rTMSwqw9XhAX4w=; b=oGqVqnWS0H4B5jJT7tXJbB8C2k
	OXayo1R6jx20Wxvj0NgZxarX1rmTwjJQIyoGxENASWnxob6bfWUZEkBsFRIMbzxbvXulEKn7to7u1
	y9h9kTO4Agu6FVZjc/dyLop4KQUeyEMzZfNlyi9L8dxzPVpy02hiX4dYrW7NG9OLF+45SLx80Lr73
	aQ4ZM9EkbdCt2RN65+7SdurJBkrzMLIDvrKYChtAKeNrZ/4BrkMh4DG7WBo90IReZ9WwuAQxB+wt2
	tAcpTHPSQJrW5zEcCCzT2Eiiwri9HI4rOB2eNwmEYk4tB/AsxqtXb+xvCACxwR3iqAeTeEhEUwYjd
	7agEEOrg==;
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thcjj-00000000LbD-2EeM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 22:58:45 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51AMwdS63493106
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 16:58:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739228319;
	bh=zxtPDpqoqeuY5nRHmT81+w+9GU1e8rTMSwqw9XhAX4w=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ZYG+HPAwH3zYVbX/cawpjelfK56dHydieatQcss9u8xqFtI6vzEYWLrRsQXQJymTU
	 zJL1hZxjDuo/CK/W4ea6u/3Wp4JnuaRbBLd2/MYRyHVQY8hIO7uGsAiwxFspH2w588
	 35yk7EjFSt0EocHzQGSDo5emabDr0kpCrJZIpamU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 51AMwdOL030141
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Feb 2025 16:58:39 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Feb 2025 16:58:38 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Feb 2025 16:58:38 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51AMwciM052713;
	Mon, 10 Feb 2025 16:58:38 -0600
Message-ID: <2dd88c8b-940a-4ca1-95b1-031ced6a1ae9@ti.com>
Date: Mon, 10 Feb 2025 16:58:38 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/10] arm64: dts: ti: k3-am62a-wakeup: Add R5F device
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
 <20250210221530.1234009-4-jm@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250210221530.1234009-4-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_225843_903276_95603A4F 
X-CRM114-Status: GOOD (  14.02  )
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
> From: Devarsh Thakkar <devarsht@ti.com>
> 
> AM62A SoCs have a single R5F core in wakeup domain. This core is
> also used as a device manager for the SoC.
> 
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>
> ---

Acked-by: Andrew Davis <afd@ti.com>

> Changes since v4:
> - No change
> ---
>   arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi | 25 +++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
> index b2c8f53517438..785b9f00033a4 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-wakeup.dtsi
> @@ -103,6 +103,31 @@ wkup_rti0: watchdog@2b000000 {
>   		status = "reserved";
>   	};
>   
> +	wkup_r5fss0: r5fss@78000000 {
> +		compatible = "ti,am62-r5fss";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x78000000 0x00 0x78000000 0x8000>,
> +			 <0x78100000 0x00 0x78100000 0x8000>;
> +		power-domains = <&k3_pds 119 TI_SCI_PD_EXCLUSIVE>;
> +		status = "disabled";
> +
> +		wkup_r5fss0_core0: r5f@78000000 {
> +			compatible = "ti,am62-r5f";
> +			reg = <0x78000000 0x00008000>,
> +			      <0x78100000 0x00008000>;
> +			reg-names = "atcm", "btcm";
> +			ti,sci = <&dmsc>;
> +			ti,sci-dev-id = <121>;
> +			ti,sci-proc-ids = <0x01 0xff>;
> +			resets = <&k3_reset 121 1>;
> +			firmware-name = "am62a-wkup-r5f0_0-fw";
> +			ti,atcm-enable = <1>;
> +			ti,btcm-enable = <1>;
> +			ti,loczrama = <1>;
> +		};
> +	};
> +
>   	wkup_vtm0: temperature-sensor@b00000 {
>   		compatible = "ti,j7200-vtm";
>   		reg = <0x00 0xb00000 0x00 0x400>,

