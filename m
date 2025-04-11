Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2144C369AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 14:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ly4sAdvREdoeT6FdpHciAxEOe1I/bSFK5HTfRmqCxAk=; b=YxzVhIWjxOt1TPD6/78u4zI97x
	2DHhMWlEJetEyiL7HE55pD9VYSb9eQc+UfMjXrPORBoR2Dz60GsntFfHCzXjK2bZSLnis+d0w6+mn
	40JhFbolvf1qKqQ34/himTI8zBB5ZsU/lkp+CSIIp/a3DawAUkY0TdMSp6Kh4C14VThWGgl3VGZPY
	zV2ysGvwh5S52KgEUAgGVLHdBEZ35X6okGE5n62KFg5+De1cqEfXCdgB+HMvIml1NpUUvE+GbeLMp
	wxVeuVJznm6q35Q+AaMHjVOtx9eO64dU2LyjXcH69A9JqRr1wzsibdCHYVcohnZ8pYBFxX+NNmrrF
	Ty0cX5CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Ez8-0000000E1If-16Ot;
	Fri, 11 Apr 2025 14:03:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Eck-0000000DxiM-2Dxk
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Apr 2025 13:40:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Ly4sAdvREdoeT6FdpHciAxEOe1I/bSFK5HTfRmqCxAk=; b=Wim8QOov2auxJ6lA6/EXdcm9Ra
	gt3kVq7eJjagPnRZ0zgoeKdUfnPDeepcJFhTWIzQUAQHlcLnQSpudvVcDdjpCgiZROtpkNyQhshXe
	ltN4fQCsrMSDoSVgVnnzvTNi4WKnhWocjkJS4xBrfNThqixl09hTfn2VYiD4dAr6yGIS3PcF5RBEy
	1vXd9Z1qs2ZDFaPjdz+EmJ9m+1KsDMYnrrH7SVWQ4BmnrpuFFKRRdaMYMtPYa2XICTUzN03x4zePk
	84UoUprLF06I9isk99d191tgUARgZKfoE0WFaadOYfFDCYtWY29En4xIjt9B5b4g/hlCNgHCjrb5f
	Nhqv5p0Q==;
Received: from fllvem-ot03.ext.ti.com ([198.47.19.245])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u3Ech-00000009204-1pOT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 13:40:49 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53BDeQjW1454143
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 08:40:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744378826;
	bh=Ly4sAdvREdoeT6FdpHciAxEOe1I/bSFK5HTfRmqCxAk=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=fY9Bt250mxXP2FKP4n4NrmjxvJ7iG4groI8qUZL8ZPsUNKJMmHKo+hKzz7DC0lilV
	 YsZSq5gwgqU6+y6Dyxxaovp/XKdqD8A9SvOrdBDQvk04v1c1I7YLvtSEvuluIVt4Yx
	 wNRkaHh3NB2pkfW/oskE1q8KR2vPwm32csaptXUE=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53BDeQ55083477
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Apr 2025 08:40:26 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Apr 2025 08:40:26 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Apr 2025 08:40:26 -0500
Received: from [10.249.136.157] ([10.249.136.157])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53BDeKbT117700;
	Fri, 11 Apr 2025 08:40:21 -0500
Message-ID: <6da9d41b-5d9a-495d-9f52-4b2cf4cfd25a@ti.com>
Date: Fri, 11 Apr 2025 19:10:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: ti: k3-am62x: Rename I2C switch to I2C
 mux in IMX219 overlay
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>
CC: <kristo@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <vaishnav.a@ti.com>, <jai.luthra@linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
        <u-kumar1@ti.com>, <stable@vger.kernel.org>
References: <20250409134128.2098195-1-y-abhilashchandra@ti.com>
 <20250409134128.2098195-7-y-abhilashchandra@ti.com>
Content-Language: en-US
From: "Francis, Neha" <n-francis@ti.com>
In-Reply-To: <20250409134128.2098195-7-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_144047_852624_DA7C6BAA 
X-CRM114-Status: GOOD (  14.31  )
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

On 4/9/2025 7:11 PM, Yemike Abhilash Chandra wrote:
> The IMX219 device tree overlay incorrectly defined an I2C switch instead
> of an I2C mux. According to the DT bindings, the correct terminology and
> node definition should use "i2c-mux" instead of "i2c-switch". Hence,
> update the same to avoid dtbs_check warnings.
> 
> Fixes: 4111db03dc05 ("arm64: dts: ti: k3-am62x: Add overlay for IMX219")
> Cc: stable@vger.kernel.org
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>  arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
> index 7a0d35eb04d3..dd090813a32d 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
> +++ b/arch/arm64/boot/dts/ti/k3-am62x-sk-csi2-imx219.dtso
> @@ -22,7 +22,7 @@ &main_i2c2 {
>  	#size-cells = <0>;
>  	status = "okay";
>  
> -	i2c-switch@71 {
> +	i2c-mux@71 {
>  		compatible = "nxp,pca9543";
>  		#address-cells = <1>;
>  		#size-cells = <0>;

Reviewed-by: Neha Malcom Francis <n-francis@ti.com>

-- 
Thanking You
Neha Malcom Francis


