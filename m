Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFBCCC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 10:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjrOPyKV4mebHhduJ8R6cbiM973RHWBbs2BanP1w2ZA=; b=401fOOJBMDv2oLWE/O9TAjbDVy
	Qi6oitx6cVfPXi/1+cNetVhGIFOffOHc9n6CroebDBnlKztRHEmCbCJu+EfEBZQ43Jm4cioHgRFQB
	0mQI7oZThlUImOsxNECTvFoLYBTB7COr9eMCysQMt+Jjue0ZAxDgw1QjOWTmedXMnIDmEjTf8vPw5
	4JvzF66vdMf8/xbngt5oQyTs0NdSN+EWxy+i7RTzL3yRVmHV/i0NnHc8tcZ0SXR9+TT52w9QkhRsQ
	pd30KX8vLpOyzNPVwdTYi1O8UErAbt4QoPmeOfhRetCLgip2hcy6t+zAFTmQ/HDlaf9n0K8xFr3dD
	O/EkLmsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIcG-0000000HQKq-2Seb;
	Thu, 15 Oct 2026 10:23:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIcF-0000000HQKX-2u0n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 10:23:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2744560120;
	Thu, 15 Oct 2026 10:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC5C1F000C4;
	Thu, 15 Oct 2026 10:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792059794;
	bh=QjrOPyKV4mebHhduJ8R6cbiM973RHWBbs2BanP1w2ZA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HpKJuhE2b9umF+oGHGTB+eNRm1wFEcsah3WvhBG959MH+8KeBKVEWBX5D6Sf0zNZ/
	 ixzFqlpxeEr7+AwI8Uzd3NPwCNFwcWEUtfk0NxEYFFWdfwu3W11+eh8+JSpVba2yNK
	 +ZWQC5lmuvka1Mf59DK5dvOcy+KdOA3RbKE4OH8qoKAezBK+PEmSqKiflaexl+h8PQ
	 3klsKvWLz6gZqy3LzEcIXpTJvE8DjqBa/gn3ck44rJRLGMLoRHDhXBGOlvhZ1YS+nQ
	 P2zrWVB22SecGQ4qzBNWAO7PJq9/oRAICgcdWj0J6OtfrkdoTPaCxfFHaC4oA7pCNt
	 b9EfE0uwIh/Nw==
Date: Thu, 15 Oct 2026 12:23:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Hector Martin <marcan@marcan.st>, 
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Sasha Finkelstein <k@chaosmail.tech>, 
	Linus Walleij <linusw@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, 
	Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2 07/10] dt-bindings: pinctrl: apple,pinctrl: Add t6041
 compatible
Message-ID: <20261015-gracious-copper-cheetah-1b4deb@quoll>
References: <20261014-apple-m4-pro-max-initial-devicetrees-v2-0-961edd8d661b@cyberchaos.dev>
 <20261014-apple-m4-pro-max-initial-devicetrees-v2-7-961edd8d661b@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014-apple-m4-pro-max-initial-devicetrees-v2-7-961edd8d661b@cyberchaos.dev>
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

On Wed, Oct 14, 2026 at 08:56:14AM +0200, Yureka Lilian wrote:
> The pin controller on the Apple Silicon T604x (M4 Pro/Max) SoCs is
> compatible with t8103. Add "apple,t6041-pinctrl" as SoC specific
> compatible under "apple,t8103-pinctrl".
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


