Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAD6C282D9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 19:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OdTMORqBJYLjJhRhGFzMiRnquj3qLzmSjVu6QO5a5kk=; b=CKRByA7gmOXqpdm7WLi5hGzH3O
	q8Dbm9XXJN1bxjGeZz8A3u2oTPRm6alPK9Ux5ahhblRP9pN6PdM3egw3jmXMkUy7vc8o2wlYNs4Fd
	vXD4ZkbGuVMWvkyyyziwFJV4h/59yI6Nwoa+R73we9YEnQJ5y1svOwkYsU5rdDuW52awMfM5P96k+
	u4EpK5dyijlsU693UnaTgOKu49dqB05L+MBSy0HMsp2vuAn/vnnceRv1MSBfkX2M/b3OK+SECSxC3
	LDP6/uuW4duX7wsBb8kdO5qso7cxdx9v0rj3B34bgctcgddP1CAlXBD3YnayRqAuOTwFENfagTJJa
	R0zR4kbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpXVy-00000005wPR-41yR;
	Tue, 04 Mar 2025 19:01:14 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVs4-00000005aTe-0szi;
	Tue, 04 Mar 2025 17:15:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1741108545; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lctTwBqJFIARNjlmaiBoqnWTDuFL6WUoet0a2YxlKbWgWdDYPMn95/BTjQToLDf/abIelZwvV1uj3d89LIS1i1ltiEI+UKlRp3/8SyMyJ7SdOWzBsiLfXzXCHVJOtE+umfRg9KEpTKlsWiy4hamAxV09fugUxsO884hC4/nSmDE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741108545; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=OdTMORqBJYLjJhRhGFzMiRnquj3qLzmSjVu6QO5a5kk=; 
	b=FylPp3MBGmDQMN/pBeGvf/nlfitPWrxtJuNFW1hElVBSKa9gwj9hvgXnC7n3hkYVsrXdJ9tOOOS6e7I9tH0jmq3LJnioHnPOOTHy5Eap+FaXnP6evnYXp7koRxcfjCdwhNnv0LmmqvOeFxqr1Z+xElwHIEHfdTiOXsx8jw5q2os=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741108545;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=OdTMORqBJYLjJhRhGFzMiRnquj3qLzmSjVu6QO5a5kk=;
	b=iZ92R1bmhXCY3JwYVZzfbnH2LfLmo7z7gtnUl330xU5kEcvEPqsbfFbIZJBzSwL/
	TBPwwQK7BbTzEaNVpMyAgSYew4KU6JsfnNOHeBgs9Z8xZuymFdPapP8aic0NcqaVz2e
	gySBtZSmtRTQa/8DJX0urb3IO4lphjRepIKzcVl8=
Received: by mx.zohomail.com with SMTPS id 174110854289189.58519837207825;
	Tue, 4 Mar 2025 09:15:42 -0800 (PST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: heiko@sntech.de, Andy Yan <andyshrk@163.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v3 1/3] arm64: dts: rockchip: Add vop for rk3576
Date: Tue, 04 Mar 2025 12:15:41 -0500
Message-ID: <12619358.O9o76ZdvQC@earth>
In-Reply-To: <20241231095728.253943-2-andyshrk@163.com>
References: <20241231095728.253943-1-andyshrk@163.com>
 <20241231095728.253943-2-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_091556_319334_B9A18AB6 
X-CRM114-Status: GOOD (  14.60  )
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

Hi andy,

On Tuesday, 31 December 2024 04:57:18 EST Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Add VOP and VOP_MMU found on rk3576.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> Changes in v3:
> - Split from
> https://lore.kernel.org/linux-rockchip/3330586.aeNJFYEL58@diego/T/#t
> 
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi | 68 ++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3576.dtsi index 436232ffe4d1..130d11a2cc89
> 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -393,6 +393,11 @@ opp-950000000 {
>  		};
>  	};
> 
> +	display_subsystem: display-subsystem {
> +		compatible = "rockchip,display-subsystem";
> +		ports = <&vop_out>;
> +	};
> +
>  	firmware {
>  		scmi: scmi {
>  			compatible = "arm,scmi-smc";
> @@ -826,6 +831,69 @@ gpu: gpu@27800000 {
>  			status = "disabled";
>  		};
> 
> +		vop: vop@27d00000 {
> +			compatible = "rockchip,rk3576-vop";
> +			reg = <0x0 0x27d00000 0x0 0x3000>, <0x0 0x27d05000 
0x0 0x1000>;
> +			reg-names = "vop", "gamma-lut";
> +			interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "vop-sys",
> +					  "vop-vp0",
> +					  "vop-vp1",
> +					  "vop-vp2";

These need to be renamed without the 'vop-' prefix.

> +			clocks = <&cru ACLK_VOP>,
> +				 <&cru HCLK_VOP>,
> +				 <&cru DCLK_VP0>,
> +				 <&cru DCLK_VP1>,
> +				 <&cru DCLK_VP2>;
> +			clock-names = "aclk",
> +				      "hclk",
> +				      "dclk_vp0",
> +				      "dclk_vp1",
> +				      "dclk_vp2";
> +			iommus = <&vop_mmu>;
> +			power-domains = <&power RK3576_PD_VOP>;
> +			rockchip,grf = <&sys_grf>;
> +			rockchip,pmu = <&pmu>;
> +			status = "disabled";
> +
> +			vop_out: ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				vp0: port@0 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <0>;
> +				};
> +
> +				vp1: port@1 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <1>;
> +				};
> +
> +				vp2: port@2 {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +					reg = <2>;
> +				};
> +			};
> +		};
> +
> +		vop_mmu: iommu@27d07e00 {
> +			compatible = "rockchip,rk3576-iommu", 
"rockchip,rk3568-iommu";
> +			reg = <0x0 0x27d07e00 0x0 0x100>, <0x0 0x27d07f00 
0x0 0x100>;
> +			interrupts = <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru ACLK_VOP>, <&cru HCLK_VOP>;
> +			clock-names = "aclk", "iface";
> +			#iommu-cells = <0>;
> +			power-domains = <&power RK3576_PD_VOP>;
> +			status = "disabled";
> +		};
> +
>  		qos_hdcp1: qos@27f02000 {
>  			compatible = "rockchip,rk3576-qos", "syscon";
>  			reg = <0x0 0x27f02000 0x0 0x20>;

Regards,
Detlev



