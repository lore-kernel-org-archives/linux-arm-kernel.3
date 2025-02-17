Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EB0C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 11:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5hukvAAb6aGt/E/+47euvBHY8ovcVLIEK2EysLh1Jc=; b=wKE5LA0Yx625HUfdWPmxyaza0w
	zJOwUWCDUUZb7DW9ICOg5k7xbVk/bClkXs80V8K4NrsP1+iIaaqTcR3wHXchvmpKG+2LtDjgtP6pz
	azDjmriYElxRfGpZ+94HeYPrg9dyMsNTa9eKzt3TDNe3v2mGi7gG/DhPUdKot4ZnmpiSt1ipbEoEp
	S0YzqtXKN/ZL66Cg9EY8M+Dm2j5i2PBa/hPNfL7h7AxrKFA1qKO9WTvVFpDS+p+MDTfm0zxwjtHZW
	Bt76wZ1VPKixaL/UIX6kZjGZO8eoZ1toBwWUADqpi+QO+xDTpe/UAfZvljgoM2HWANlwEXpsUYz3T
	bUvnNHCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjz8m-00000004HNi-1zGo;
	Mon, 17 Feb 2025 11:18:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjz7J-00000004HER-3ymI;
	Mon, 17 Feb 2025 11:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=d5hukvAAb6aGt/E/+47euvBHY8ovcVLIEK2EysLh1Jc=; b=i0uWO3mTzvObesWiGUN8ekyHph
	iOTFuu8G81FZecazrvJ59j/z3Z6NEjtU9yfIMA7vYbhYNkDZD2UWd0H+E2Okc38oN06tsxO5oxxPJ
	ngpJ1qga+duUXgLnDSaCKPDuomuGhaA3zzQ0pi/Gv7K7A9N8YI9JHGN5nKl6LuLT65PNizjvqEJ+m
	zvCAV7b0Ad7v+lMLJlcQBcMp0Uxju8Dh57BTSmfw830Ty4oPhsBiqSArOyzDg9wQ2olMScquWhP2d
	P/43xsGPpyloiYHPmL8KXXCDrvDDh8ojPw4POfjviuGvnM9vy3UJOUgCNfaqLG1RVxMQ+TLIzEo+A
	PP7qMdQg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjz7G-00000001nNd-47Zn;
	Mon, 17 Feb 2025 11:16:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 409ED5C41BA;
	Mon, 17 Feb 2025 11:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 796B8C4CED1;
	Mon, 17 Feb 2025 11:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739791003;
	bh=CL9XSY6r7Zy0wqJ75RbqlmMGJNMYhkebdRP30ma/Mzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QZXNW6axDfcUBEU2xJrwuhEi0fe+GSnoRgyeXmKzdqiZ324URoo9FFHAo1qg2wYty
	 0h/g24/H4qrFulhCvhmrq6w/0e+zcOeXdaCUIB6lobdBeFXuY+lTzrUhjGhk+zVh7Y
	 o4xFLlCXSaQQmRUI4Z22vRDqxFXFlowZAGWQGEvBSCzEJdvu/PhMdF4fD+1U4ZbFlD
	 D8u1mdi62vwxJzpRRB+sPNVAtq1kiqPcuXWJ90yxN5tc9TxXMial3DYb9kUe/pmjcd
	 so453RpVFmYe1B/FfoRzB7Ieuo+5yvzGDeZP9SLRUk6z5XnJFu1zhBlTFL7CKC2PkR
	 0witQxfiOIQHA==
Date: Mon, 17 Feb 2025 12:16:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: clock: Document clock and reset unit
 of RK3528
Message-ID: <20250217-cyan-toad-of-focus-0cfc2b@krzk-bin>
References: <20250217061142.38480-5-ziyao@disroot.org>
 <20250217061142.38480-6-ziyao@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250217061142.38480-6-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_111647_242097_ACF29271 
X-CRM114-Status: GOOD (  11.82  )
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

On Mon, Feb 17, 2025 at 06:11:42AM +0000, Yao Zi wrote:
> There are two types of clocks in RK3528 SoC, CRU-managed and
> SCMI-managed. Independent IDs are assigned to them.
> 
> For the reset part, differing from previous Rockchip SoCs and
> downstream bindings which embeds register offsets into the IDs, gapless
> numbers starting from zero are used.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  .../bindings/clock/rockchip,rk3528-cru.yaml   |  64 +++
>  .../dt-bindings/clock/rockchip,rk3528-cru.h   | 453 ++++++++++++++++++
>  .../dt-bindings/reset/rockchip,rk3528-cru.h   | 241 ++++++++++
>  3 files changed, 758 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3528-cru.yaml
>  create mode 100644 include/dt-bindings/clock/rockchip,rk3528-cru.h
>  create mode 100644 include/dt-bindings/reset/rockchip,rk3528-cru.h

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


