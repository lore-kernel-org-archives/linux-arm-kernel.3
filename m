Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E35CC2A062
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 07:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWPAionUGYVqkBpz5QQVAcYUIfxJMKwBFtRZhqGCqzM=; b=NmNXWIF7//GWT4NDjiOl+JZjK3
	2rOiEcGzJE6x1EsGefsVWbhVfArPk6IUQV1p9o2ek70JnwX2l72XzDr8BqWuhMaPCCZUbuOXIDCE3
	PBHr+hWjpQFVbvinue+xUkSINP7kI369hGTba43qS5qUCaNN/pHJZ6+/QakKmXBTsPN62UVr8DvWt
	zKLd1fbZiMJ4fM5piMa0tfhcJXuHSetm3blbFPHCGYS1Cp31xGaKnZmITvRIZGvas2W4GLzVGgCo8
	oj2TOrYR56iOZohAgAY2HHTpCKLV0fOrTwkukn28JX0C+I+CaBDadwAfiogFZ5wXR/jflAurcXauv
	EolhjW8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfRB-0000000AwCj-2ZOR;
	Mon, 05 Jan 2026 07:55:37 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfR8-0000000AwC4-2eyJ;
	Mon, 05 Jan 2026 07:55:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1767599726; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ApyVmbqvyvvb8na3d/melHLpY2DTPtJeJzJ9aWMiXiAmqnz89jYsWoPJ0vVj5aTgXvgnWPOwPPfqDU/LNUOkE6MQEZu2okpX1MjtLqGfcVTyg1Py7MQgJSE8Gk4P07RiQyKrTCte+OCs4BgDYf3sey5i+mVfz6hngJY8gmK3UYk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767599726; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aWPAionUGYVqkBpz5QQVAcYUIfxJMKwBFtRZhqGCqzM=; 
	b=RuiFb+t17z7NWutMYXVwxR3XZl8vkhaNc+HPwldTvIxBW6iyroeFZlOxk4gQPyZXwMi0q/fFm32VS+2LnzuALx0/ZKwHfOe9HNXwL90TgwrZWwMkyhSkYRdbeL6qDnv6SPMU1W/6wcWNx61Y9DdZXz68YT2tF0eO1hrTkhFQfAc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767599726;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=aWPAionUGYVqkBpz5QQVAcYUIfxJMKwBFtRZhqGCqzM=;
	b=dejfNqMo6xmOUjexvSDcHRAdx7eGKVoKzOgsSAouO/QpFOaFtb/2l++R+0lz/IIE
	GA1s1tqndtY+CqwFmV4yoqxwS+YAzplmyPeZ88imwA/+zgkAwGVoPqWSMcSAHKcC4t9
	g3QSRCI3m5/DeUkzc8rpw6Q/Z4h7E5iLJDvEHf7w=
Received: by mx.zohomail.com with SMTPS id 1767599722778915.547246258709;
	Sun, 4 Jan 2026 23:55:22 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Kever Yang <kever.yang@rock-chips.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Frank Wang <frank.wang@rock-chips.com>, Alexey Charkov <alchark@gmail.com>,
 Liang Chen <cl@rock-chips.com>, Finley Xiao <finley.xiao@rock-chips.com>,
 Elaine Zhang <zhangqing@rock-chips.com>,
 Yifeng Zhao <yifeng.zhao@rock-chips.com>, Chaoyi Chen <kernel@airkyi.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix wrong register range of rk3576 gpu
Date: Mon, 05 Jan 2026 08:55:17 +0100
Message-ID: <5954009.DvuYhMxLoT@workhorse>
In-Reply-To: <20251230090246.46-1-kernel@airkyi.com>
References: <20251230090246.46-1-kernel@airkyi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_235534_739917_7C5A8B15 
X-CRM114-Status: GOOD (  17.11  )
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

On Tuesday, 30 December 2025 10:02:46 Central European Standard Time Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> According to RK3576 TRM part1 page13, the size of the GPU registers
> is 128 KB.
> 
> Fixes: 57b1ce903966 ("arm64: dts: rockchip: Add rk3576 SoC base DT")
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> index 6284e7bdc442..b375015f0662 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -1271,7 +1271,7 @@ power-domain@RK3576_PD_VO1 {
>  
>  		gpu: gpu@27800000 {
>  			compatible = "rockchip,rk3576-mali", "arm,mali-bifrost";
> -			reg = <0x0 0x27800000 0x0 0x200000>;
> +			reg = <0x0 0x27800000 0x0 0x20000>;
>  			assigned-clocks = <&scmi_clk SCMI_CLK_GPU>;
>  			assigned-clock-rates = <198000000>;
>  			clocks = <&cru CLK_GPU>;
> 

This is only true if you only consider the GPU_CONTROL and
JOB_CONTROL register ranges, and leave out the MMU_STAGE1
and MMU_STAGE2 ranges. I don't know if those need to be
mapped, since the MMU control registers are < 0x2000.

What do other bifrost devices do?

Kind regards,
Nicolas Frattaroli



