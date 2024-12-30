Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9E5E7718F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Dec 2024 14:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7QQyHyXJ9MqspcrKIFmnLf7/FQDlN/0+3saPBQDgwLM=; b=ePBzypLAsTEBhNAe/eyHVfWLzs
	rnXUramBIcwlnKzrH8ekxDY4aG6h1F5CL5Cw8ZKy052UI1ifuIGTL4tdGx2EWCc/7g8sTlpQCMm6a
	3n7voLAcOAyerIbnYHyQ92nUuhu0w3An2b2VC5VD7DlJykAogfGKYSAt7CvxUiGCic5hMmZ5YIAZX
	5zNbAonSDeOxQplWkmEWHgJW165/Du5DcwGOWL3b04CQLFaPC5PoV1Igs4sjwDA0HhA4Wuck7uKpc
	F/2llX/ZAF40aIIstGcoyL4N6xBFL7UD44EEh+HhQH8G1T05HClAXgHktf5YlY6I2r1/rblPyju3l
	v8ZFZkNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSGU6-00000005KDE-0Tee;
	Mon, 30 Dec 2024 14:11:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tSGSs-00000005K5s-3gxf;
	Mon, 30 Dec 2024 14:09:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0317E143D;
	Mon, 30 Dec 2024 06:10:18 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAE383F59E;
	Mon, 30 Dec 2024 06:09:44 -0800 (PST)
Date: Mon, 30 Dec 2024 14:09:41 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Parthiban Nallathambi <parthiban@linumiz.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin
 Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Linus
 Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH RESEND 16/22] clk: sunxi-ng: sun8i-de2: Add support for
 a100/a133
Message-ID: <20241230140941.00aaed1f@donnerap.manchester.arm.com>
In-Reply-To: <20241227-a133-display-support-v1-16-abad35b3579c@linumiz.com>
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
	<20241227-a133-display-support-v1-16-abad35b3579c@linumiz.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241230_060950_976019_0C2A81A7 
X-CRM114-Status: GOOD (  17.62  )
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

On Fri, 27 Dec 2024 18:31:05 +0530
Parthiban Nallathambi <parthiban@linumiz.com> wrote:

Hi,

> Display clock uses 1 mixer without rotation support is same
> as v3s. There is also a hidden independent display engine
> with independent tcon_top available in A100/A133 bin (based
> on vendor BSP).
> 
> Add new compatible for A100/A133 to accommodate the future changes
> for the independent DE.
> 
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> index 3e28c32050e0..067820ab704d 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> @@ -342,6 +342,10 @@ static const struct of_device_id sunxi_de2_clk_ids[] = {
>  		.compatible = "allwinner,sun50i-a64-de2-clk",
>  		.data = &sun50i_a64_de2_clk_desc,
>  	},
> +	{
> +		.compatible = "allwinner,sun50i-a100-de2-clk",
> +		.data = &sun8i_v3s_de2_clk_desc,

That wouldn't be needed then. *If* we find some incompatibility, we can
add this line later, pointing to a different _desc block, but for now you
can rely on the fallback compatible to match.

Cheers,
Andre

> +	},
>  	{
>  		.compatible = "allwinner,sun50i-h5-de2-clk",
>  		.data = &sun50i_h5_de2_clk_desc,
> 


