Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9466FE68958
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 07:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O+LZvxYDlJcpff7IM663mDEke7HPj2Agw159zzKo9Oo=; b=ruW5LVuC0nx6tzAJPZwiRppxNn
	+7u4zYYhF768/dNMxZWK9GGtxkunS2dCK7H7RnLqhBm1BdXd5FoiQHg5/wL76Q7nOM3OXxOMXbc+8
	7TCAQrFwp3BjXoqVUT1vSxclt3n/FbBBJyy+AeLkokiBoivC8biVsJVrX3H3pBYIwTc9/6hYbZ/O8
	lzC2zG/8kX1YupgfPOF81N6e9oGTiI9Hlnu5jDyxmre34C7VIxyNfXrBZTFq2t1ldplKKGdIOFDxW
	XQl1+SfyiRlEyq0iaPl7rO2AxmRUQycNb/iWqQt00neEUcPvGHw5cS233hIjTknnIyPMriEyjiWiA
	cyHVc+hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Psm-00000002q4N-48Uv;
	Thu, 31 Oct 2024 07:46:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Ppf-00000002pmh-3JOA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 07:43:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 65C28A43CC1;
	Thu, 31 Oct 2024 07:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC1B2C4CEC3;
	Thu, 31 Oct 2024 07:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730360582;
	bh=/fr/RCOTKkcjP8HRjhrvpenBY16uNK8okKks2lbsVx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JJiKM/1ZuU7wUrF0b140ekCe6P8inR6SEttAgNdjQ/Y2TdaGO8h+Vo+EPNMIZn0g/
	 3JZXPapVjfGRpXMmnyQ1Y6bemsf41w2Ke3Vblxdohycx+ezw9w5Aog6RPbIAT06VMF
	 0M/d3i1Vrf2GbqTpF3UX3zzpf2CaDpQZgguoUeI3EDfDYnmueQJYsxhotfdrr3Dh4n
	 gekaZEdpKvZ2tHXi44OBDPcguBygCIw/PtH03OdnicdnF1TYeaJ+cgfFKzuPcICWq8
	 L+fV0iF66Y25OnH5te0omnmQdCqKzMjpT5tiU3Y3vUP/j+fVDOZTSMT5EOS34mUycM
	 RjvhmMbca4uTw==
Date: Thu, 31 Oct 2024 08:42:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cody Eksal <masterr3c0rd@epochal.quest>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Nishanth Menon <nm@ti.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Yangtao Li <tiny.windzz@gmail.com>, Parthiban <parthiban@linumiz.com>, 
	Andre Przywara <andre.przywara@arm.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/13] dt-bindings: usb: sunxi-musb: Add A100
 compatible string
Message-ID: <a7dbx4ujgv2taovnycdy4sn2mggrwtkwhkxoyrilcns5qxepzh@szw4nv2y6tbk>
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest>
 <20241031070232.1793078-6-masterr3c0rd@epochal.quest>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241031070232.1793078-6-masterr3c0rd@epochal.quest>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_004303_910839_354599A2 
X-CRM114-Status: UNSURE (   8.25  )
X-CRM114-Notice: Please train this message.
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

On Thu, Oct 31, 2024 at 04:02:18AM -0300, Cody Eksal wrote:
> The A100 MUSB peripheral has 10 endpoints, and thus is compatible with
> the A33 version.
> 
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


