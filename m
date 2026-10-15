Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BC3CC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 10:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9tSjy5btu0nKEVD9uEjSPa7hI+lCWSjDGkfK4yaJpY=; b=b76pQ0dg8db8VJOHlSli8D/aOo
	V9wgVST1Apug1F5O5mNzBWEblqcLVukBogc80FQBN/45Dnwj2rQ/kNxPsKtlS1kU4PQwyshlXz8kD
	k5ro4VcR9KQxIY3b2ex3t8clUi+CWV6qyf9H7N0E0rV4tCJPioayfXQTG96v/8hoL2lCLH4xxs4UX
	Nj4BSCi89Z9CCY5jETuuDirKcKd+gXNuhEw9SPkh5ASTeEoWadTwTqnpk5qgC74585mOWcMgrCs72
	zQFM2jTEHrxf1100eSe3FKlyv1nZIbAH0o2Ox4iTRlT1MfeD3xrXE+LoBUunrMCY6v2MbwA+mDIXp
	r8BnPweQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIOu-0000000HOsl-02wJ;
	Thu, 15 Oct 2026 10:09:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIOs-0000000HOrT-1hUx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 10:09:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CDE67601F0;
	Thu, 15 Oct 2026 10:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5489A1F000C4;
	Thu, 15 Oct 2026 10:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792058965;
	bh=h9tSjy5btu0nKEVD9uEjSPa7hI+lCWSjDGkfK4yaJpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ajhoMSsRskdZnQj0c0oTEflDaXe1SWo77F2/5Lhxe2oXFVQ4wcXvcj+Xwij5FmbmA
	 A7bAALzGMN8k8MSGD22je2/Qo6KPugVXSSvtD2DEQAgb69dkBQs3cm4BlnXN53xHO3
	 S0qa//6dYPDAczscOVb8RUTIhrRIrqC7fDpIGYIC8A5gDzvfvAMSqakHNt+4fKEaI2
	 mPV/LzrFDxSwPFWeRc66+0PXUDqBxiXZfZGD/kQx7Yaom1wW/gX/BSPewgFJB7vWsZ
	 OmhOOUO4TRnDzv4FtpL/TgdxvYTty6FF3XYiSjF2HHkWUG0U7tgarIv0QPDiO0o9lE
	 NeEJFuHoyzT9g==
Date: Thu, 15 Oct 2026 12:09:20 +0200
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
Subject: Re: [PATCH v2 04/10] dt-bindings: arm: power: apple,pmgr-pwrstate:
 Add t6041 compatible
Message-ID: <20261015-rampant-imported-wildebeest-8a3b0a@quoll>
References: <20261014-apple-m4-pro-max-initial-devicetrees-v2-0-961edd8d661b@cyberchaos.dev>
 <20261014-apple-m4-pro-max-initial-devicetrees-v2-4-961edd8d661b@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014-apple-m4-pro-max-initial-devicetrees-v2-4-961edd8d661b@cyberchaos.dev>
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

On Wed, Oct 14, 2026 at 08:56:11AM +0200, Yureka Lilian wrote:
> The device power state management of the PMGR blocks on the Apple
> silicon M4 Pro/Max SoCs (t604x) is compatible with the M1-M4 SoCs.
> Add "apple,t6041-pmgr-pwrstate" as M4 Pro/Max specific compatible.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/power/apple,pmgr-pwrstate.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


