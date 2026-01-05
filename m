Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F0EC2A062
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 08:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLisPGbELcHPPEG+rKVCKDHWdvS62k1e+Z4DLqfCveA=; b=3kyisRuFZ/AblEKLv6VHlTa4dZ
	TeJi+591xs2/YKJBIvNQoggg3gJyD2DUt/fqsHFx3SmQqMHW9B5/kggnnwxdgrNjzIqJ13Kem4NOS
	Dpkih4gkZUzrKDThWYtzoYp4YxklC+O7LQTVQIRfgH6V4Uf3o6VGkzHqXTs4GIJ+IcBo3vKc8sidE
	gPp3qt6Myey4PwhQemoduAnWUBeP6mZsWciU+nJBcbUsG0jcP0938G8QGZCJrsZgB5oxCQXyb3/U7
	9Ord3PmBs9qx7b0t3p1KdkDLYsyqG+9dIsvCkdetjwBs7d+jTJazuGzpA8y5j0nGnNRtuGbV8G4U2
	LcJxf7pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfiP-0000000AxvE-0xt0;
	Mon, 05 Jan 2026 08:13:25 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcfiN-0000000AxuT-0YrV;
	Mon, 05 Jan 2026 08:13:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1767600797; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QdXw+QBWdhHBaWDiWFCWRqp8L+hYjX48wt7hN0jhvuqlM+QjKbEydSKgepGKrysb0g02n/qjNMtj7W38+H7Bm63L8kgu8e74YVxpEB6hBRRsHloZNlB1u+/mxigvOVnEBJnxV4odBvWY5W+Erq0n6NhFddo8zKOywom5tjNeXd8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1767600797; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=bLisPGbELcHPPEG+rKVCKDHWdvS62k1e+Z4DLqfCveA=; 
	b=lGWzhNoUQidxBINUgLQUoiRL0vUBXDEBsXrl9UsceHxsgqjU36LoQZ1cBKPWryukec7duDtsWsUAbqrkbUbPJIRrmEWnqzX7DN5WCIzUSXsy/INykBYbolCUSsRHYkw3edSO0ylTo+ZgOAkezTKK9At759BwzK5DmENZRR6mRgo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1767600797;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=bLisPGbELcHPPEG+rKVCKDHWdvS62k1e+Z4DLqfCveA=;
	b=WUprz+W2XfKk41Wqqox8kwJn9wpR2m1ClYf8aopBTRnCIuE6iyBt2fSZw9UcYpGW
	IuLMILv/GPmYgXzm3hruPc8BueLicwR5BvwuzzUHSxN6nz6GporC3T/grAfTKVZw1d1
	pMbrr0WBKn8fiE25aaMB2BITBFWP5q1/pbB6rxas=
Received: by mx.zohomail.com with SMTPS id 176760079557383.79032239597313;
	Mon, 5 Jan 2026 00:13:15 -0800 (PST)
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
 Yifeng Zhao <yifeng.zhao@rock-chips.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Fix wrong register range of rk3576 gpu
Date: Mon, 05 Jan 2026 09:13:11 +0100
Message-ID: <3395202.44csPzL39Z@workhorse>
In-Reply-To: <010a23e0-4f55-431f-ba34-7b28ff5df43a@rock-chips.com>
References: <20251230090246.46-1-kernel@airkyi.com> <5954009.DvuYhMxLoT@workhorse>
 <010a23e0-4f55-431f-ba34-7b28ff5df43a@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_001323_223278_A3C745D8 
X-CRM114-Status: GOOD (  23.91  )
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

On Monday, 5 January 2026 09:12:00 Central European Standard Time Chaoyi Chen wrote:
> Hello Nicolas,
> 
> On 1/5/2026 3:55 PM, Nicolas Frattaroli wrote:
> > On Tuesday, 30 December 2025 10:02:46 Central European Standard Time Chaoyi Chen wrote:
> >> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> >>
> >> According to RK3576 TRM part1 page13, the size of the GPU registers
> >> is 128 KB.
> >>
> >> Fixes: 57b1ce903966 ("arm64: dts: rockchip: Add rk3576 SoC base DT")
> >> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> >> ---
> >>  arch/arm64/boot/dts/rockchip/rk3576.dtsi | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> >> index 6284e7bdc442..b375015f0662 100644
> >> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> >> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> >> @@ -1271,7 +1271,7 @@ power-domain@RK3576_PD_VO1 {
> >>  
> >>  		gpu: gpu@27800000 {
> >>  			compatible = "rockchip,rk3576-mali", "arm,mali-bifrost";
> >> -			reg = <0x0 0x27800000 0x0 0x200000>;
> >> +			reg = <0x0 0x27800000 0x0 0x20000>;
> >>  			assigned-clocks = <&scmi_clk SCMI_CLK_GPU>;
> >>  			assigned-clock-rates = <198000000>;
> >>  			clocks = <&cru CLK_GPU>;
> >>
> > 
> > This is only true if you only consider the GPU_CONTROL and
> > JOB_CONTROL register ranges, and leave out the MMU_STAGE1
> > and MMU_STAGE2 ranges. I don't know if those need to be
> > mapped, since the MMU control registers are < 0x2000.
> > 
> > What do other bifrost devices do?
> > 
> 
> I don't quite understand your point. And this size is 0x20000,
> not 0x2000. Before the change it was 0x200000, which overlaps the
> address space of some hardware that comes after it like JPEG. 
> 
> Could you explain it again? Thank you.

Oops, I misread. You are correct, there's one too many zeroes,
and I thought you removed one too many. :)

Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

> 
> > Kind regards,
> > Nicolas Frattaroli
> > 
> > 
> > 
> 
> 





