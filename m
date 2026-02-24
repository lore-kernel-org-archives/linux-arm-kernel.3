Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72756EFB810
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 07:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zW2dJOkd1vGfzDoNgbUtiRwQN6LV8dlDoYn9WlPwW3g=; b=tEWjK16uta6KYio5SFtoNwkD8Q
	2m3biZi3LFAw6nN2YHTq1TEpe8ifUyP4dcINENk6pMxcbujMQyLokJO4UUQchWjUkREI7zpLKMmRp
	ogXKHePWVfUKrwkzx+ByEXwjWcCuGE8WgjKlevdbLUXr6wWHb2U/8YihXUDmFzppYaXiuhd0BtaQT
	AoaSrM7t5dMy56mF7RJoowdcoWPMfOPxxBJwsYOQRXnFH6ZJ/ePGNkynFVTJKSYHW3JDdR2sRZbao
	6N9mgumsdMN+zqfpqhuYXemUn7MZhkgHbUNJJsSgFX4OUb5X2eyhCTpyQh3IwVicsrlo3U7oQoHQV
	iDxMgTlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vumh7-00000001ZmB-0nkK;
	Tue, 24 Feb 2026 07:18:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vumh5-00000001ZkN-3Xhk;
	Tue, 24 Feb 2026 07:18:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 13ABA600C4;
	Tue, 24 Feb 2026 07:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36135C116D0;
	Tue, 24 Feb 2026 07:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771917533;
	bh=sFluk2eGI1W3PJqITBVgNfyYqxuSd712xdTbU3mm0ao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uPcCf2iLfv2sxBENzOpEkV2r/3y5OqlFS27BZZVNYSsEwu9H6INImRvEfLs6gMfSM
	 ODp4+SX77RDBGtqUa8uhbEhaxg1Enr0P8rqGgbqdZwI+psYwtOxHzibg34WRKtEH7c
	 a6ClA/CpMHCUs8C59So3PsEZXBT98nO9VDJuVv50Ihd+RJMAaQFzeFxOysubC5Ut1M
	 qTwyr68eD5oi052iu54QedFz+j2UResYOobkzMCDL5YihJeNCzk4hiwYPmQkv6OQTm
	 vBmXjLUKEMO4nclSNvo+Aiir2QOkf0xV7LX/2gnvU0HLnqwUFsO66hjcKXDgs1Q/Be
	 9sEX5p7ugJGAA==
Date: Tue, 24 Feb 2026 08:18:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Detlev Casanova <detlev.casanova@collabora.com>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil@kernel.org>, kernel@collabora.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: rockchip: Fix vdec register blocks
 order on RK3588
Message-ID: <20260224-enchanted-scallop-of-art-f442c2@quoll>
References: <20260223-vdec-reg-order-rk3576-v2-0-daf4942dfc02@collabora.com>
 <20260223-vdec-reg-order-rk3576-v2-3-daf4942dfc02@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260223-vdec-reg-order-rk3576-v2-3-daf4942dfc02@collabora.com>
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

On Mon, Feb 23, 2026 at 09:49:51PM +0200, Cristian Ciocaltea wrote:
> Provide the register blocks in the expected address-based order for

No, there is NO such convention. Don't make up rules.

> vdec0 & vdec1 nodes.  This aligns with a similar fix for RK3576 where
> DTC complained about the bus address format.
> 
> Fixes: f61731bd6062 ("arm64: dts: rockchip: Add the vdpu381 Video Decoders on RK3588")

Not true, otherwise explain user-visible bug.

> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> index 7fe9593d8c19..b95129f85aba 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
> @@ -1355,10 +1355,10 @@ vepu121_3_mmu: iommu@fdbac800 {
>  
>  	vdec0: video-codec@fdc38000 {
>  		compatible = "rockchip,rk3588-vdec";
> -		reg = <0x0 0xfdc38100 0x0 0x500>,
> -		      <0x0 0xfdc38000 0x0 0x100>,
> +		reg = <0x0 0xfdc38000 0x0 0x100>,
> +		      <0x0 0xfdc38100 0x0 0x500>,
>  		      <0x0 0xfdc38600 0x0 0x100>;

NAK, impacts DTS users without any reason.

Best regards,
Krzysztof


