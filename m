Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D848C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 08:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1hnZVgYfBzvkhChs8w8bKF6Sm0JJLDaprfGCBy0gYcY=; b=XF+4WEZHIbI9+9gxi6ucsI8nw2
	olFScXZe7tYVzBOEOOOQrAJzjq4OlPoGsRMqOCNh9dJ8+tEMFVJ+y9SkTMp17bNYxji3ai+rZ8CJu
	LOoWczqHrLawaH+DUgqYHRd2bXJZ6f4aWWQsbJB29XVU3pq1Hd9/Foc2WmdPcUs8OyDESR2YnA8eH
	qeiHk3mpgIYN4VtNFxd2Xn9s+yhdu5M/Wom8W830ur2HyLxHhYVIVfPEQx1hq/RLqauO8y+Q7tFI3
	HibAHyLLnYniGmt2wayhVTp/oNx53Kdv+y93othSlHaMcrJh6x00L0vTRma4xMpQBpaS2iWH1G2aP
	zVwD1onw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trY7M-00000001qKB-0X6c;
	Mon, 10 Mar 2025 08:04:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trY51-00000001prL-1FzL;
	Mon, 10 Mar 2025 08:01:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 315F7A44DBD;
	Mon, 10 Mar 2025 07:56:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46415C4CEE5;
	Mon, 10 Mar 2025 08:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741593702;
	bh=SgbV9vkf5gWdeet1ixM7l/2JY/O0uXS4dGet0e+/f8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OtWd4NZPf+ZQCKHgSKtdnYwA9r6lQF/EG0VXxntkjUKRXlqji0VpZ295K8bBUYAc9
	 HJaHYQE5SI9Xv2mGnM/z6WgOzhMydd7bKUkSBMtXBHc7xji6ZPMDAuLgLd6TQSlsD8
	 d9Lk6PJCHaSIXC9wKosIeE3v5ejpPqa7gZmm38Dv7+pszKhyus6HIgsIQ3QaB/if8a
	 c35uXlM60THUXS2738WqQdsnyEr5YYpkvfmQIScGsJRmystjNVnh4bFhX/2p+cbfnO
	 c4s+vzP4x2Ibc++SrxvoPNZTuDJJsi1ndEFVF6Vw8S3/r4MncBB4yqi9YxhCz3GmmY
	 CT4AzO2dOi9Jw==
Date: Mon, 10 Mar 2025 09:01:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Daniel Danzberger <dd@embedd.com>, Arnd Bergmann <arnd@arndb.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Nikita Shubin <nikita.shubin@maquefel.me>, 
	Guo Ren <guoren@kernel.org>, Yangyu Chen <cyy@cyyself.name>, 
	Ben Hutchings <ben@decadent.org.uk>, Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org, upstream@airoha.com
Subject: Re: [PATCH 05/13] dt-bindings: mfd: add Documentation for Airoha
 EN7581 SCU
Message-ID: <20250310-excellent-quokka-of-abracadabra-15ad69@krzk-bin>
References: <20250309132959.19045-1-ansuelsmth@gmail.com>
 <20250309132959.19045-6-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250309132959.19045-6-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_010143_409996_C45CE0E1 
X-CRM114-Status: UNSURE (   9.35  )
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

On Sun, Mar 09, 2025 at 02:29:36PM +0100, Christian Marangi wrote:
> +
> +examples:
> +  - |
> +    #include <dt-bindings/soc/airoha,scu-ssr.h>
> +
> +    system-controller@1fb00000 {
> +        compatible = "airoha,en7581-scu-sysctl", "syscon", "simple-mfd";
> +        reg = <0x1fb00000 0x970>;
> +
> +        clock-controller {
> +            compatible = "airoha,en7581-scu";
> +

No resources here, so this is part of the parent.

> +            #clock-cells = <1>;
> +            #reset-cells = <1>;
> +        };
> +
> +        system-controller {
> +            compatible = "airoha,an7581-scu-ssr";

No, this was told many times - you do not have resources here, so no
chhild.

Best regards,
Krzysztof


