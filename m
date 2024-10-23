Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAADD2E03A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 09:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QOMtZn1haEdj92uGKGGGfBNyeaN/DZSzsxSXrdKmJYY=; b=cz1H9y0GBIN2kuwknkHyoVMISk
	Rwk2pXLa66WnXBO3yNWuXiIsROMn6+zJ6l3bEk9cSCkP9O3R/MSNRrux3pdbyypD8ptrIZ+4aKO/r
	KZ8S0mC71zCZKFN6xk305V/Ss+7hRI4V0jUU9fwuEm4EB2Cq7nuoZ42H6T/0ceIbZoDYYlQ7ILaXQ
	+bt+5S/aT7Fl3XIDG5nc9m01evNLxNFkbRrodkZIUldiGH5QHSJagBz0XXgZvk7pH10WOvAwG5uCk
	mxd+egC8E9bJuGb6fhVHGMHvwW6Q57q1YUXF9xujgOacAdrW1c2oww7R/+l6OyV/9TqM8QgBa4VZ5
	PWpXQg9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Xw4-0000000Dqst-4AQc;
	Wed, 23 Oct 2024 09:45:49 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Wlw-0000000DZmo-3ueQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 08:31:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 02F0FA44BEA;
	Wed, 23 Oct 2024 08:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44041C4CEC6;
	Wed, 23 Oct 2024 08:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729672275;
	bh=kR3bWf4Z2Vz3d9n0rFtndHo2V/O3bz7NHTRRCDQ3cGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=THOYipYqdos5j/KiJyBtT91zwu7o6vBpkad2ZBVKCDIMwUK7tZWNl8G/C+SaC/FD5
	 NbHO1BhMlu2kYcwQ7EBecEIVgd8RiMVvAMvnYU3V8hMUBssAe5AFJy9r5zEpvHmlRJ
	 OUtmd0dQW41+utx2W1o9Vc3/VMh7ZRHcTyp5cb+UCaiJFsklv1DIww2qRb0GQcImvI
	 lzR2el6Q7IzzwgpMYmkhs2l/92+PNZ3mQifzMVu5oOaKQDZxUvwMZ3oJWAFq4MrE/p
	 STY1GeRhL1aJ6o3dLcuWszRWu8/zGinlJwE1Y/tU2VUpvibun89xaTDT82aElr2B2r
	 /MA1HTSBZSX9g==
Date: Wed, 23 Oct 2024 10:31:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, 
	=?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>, Stephen Boyd <sboyd@kernel.org>, 
	Trilok Soni <quic_tsoni@quicinc.com>, Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
Subject: Re: [PATCH 5/5] arm64: defconfig: Enable SM8750 SoC base configs
Message-ID: <wr37evy46vcwm5c5ab6bxppuwzk7dqp5gh447dzsuzvq4s3oju@igltn7wkhjxl>
References: <20241021232114.2636083-1-quic_molvera@quicinc.com>
 <20241021232114.2636083-6-quic_molvera@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241021232114.2636083-6-quic_molvera@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_013117_083165_968851F2 
X-CRM114-Status: GOOD (  11.21  )
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

On Mon, Oct 21, 2024 at 04:21:14PM -0700, Melody Olvera wrote:
> Enable GCC, TCSRCC, Pinctrl and Interconnect configs for Qualcomm's
> SM8750 SoC which is required to boot SM8750 MTP/QRD boards to a
> console shell. The configs are required to be marked as builtin
> and not modules due to the console driver dependencies.
> 
> Co-developed-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


