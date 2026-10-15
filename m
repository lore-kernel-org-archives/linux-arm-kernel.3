Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FDFCC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 10:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUFZIAlXrN+SUeHJd+l2YyIxO1PHasWkKZPT1D9Ys/c=; b=CTv5eNSOnMv7/9EolWNMwj0xym
	1GeSSqpwpnYMaxNNvjd/eRPqWKhcIKSpLQQRq1TiP/+HAT7NKXvQJtXZFxndw8JnSXPi6/NQmZa6s
	nYnrspI+AtE7G7D2M8hmyVUSZ2Tqla0Xz2lP1RF99eVLy+kj0N2T/G9R/8k821u0I5VfDLk+6Q294
	aS/2HZz+LFvA+MuSeyYR0901hhx3OAp2J3mCkMdcyipzs4LWfdgC8XuUJBkfpw0a8GQ7aAHClVeBl
	i4J7dP+kc18WfxwYCx4+tusqqlTikOppqNU2Vw0+wlcW+aGnimXccGD2pQlsdJfLXjNptBNE0VsV7
	lA05CV1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIbz-0000000HQEt-1xSQ;
	Thu, 15 Oct 2026 10:22:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIby-0000000HQEb-1PJw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 10:22:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C3DEE601F0;
	Thu, 15 Oct 2026 10:22:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 200D21F000C4;
	Thu, 15 Oct 2026 10:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792059777;
	bh=mUFZIAlXrN+SUeHJd+l2YyIxO1PHasWkKZPT1D9Ys/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g3xEnhKCMfgKw5bj7WPhmE8EAeiRldfY95HOojFjhttUpqB45btxUGPI0khzVqqtM
	 7Q+2DWjWmdQH36z60qgZQZjFAuP3ktvnZo06tdor1CTMB0+BqYBb0b+jS/xJXVD7f7
	 2G/7+RrCsGcWGslMQhOfXPR4ntK0/MLsEIY1bCFzBbCs6ah7ccwqlZog7pIYXSD80s
	 uU1rEokqL9q7jN/DikwMWfBpmeFRGPWz8TqX1pD+mWe8s0IN95YkVyJXvv4/zTx+Nq
	 /Hg00GWhobwdXfPw6lseQY1zl7/Cz+Dt7xwovVsKtHvxqgNxhKrnbuFKdr3CvsdCrL
	 ek25CkwJP3aeA==
Date: Thu, 15 Oct 2026 12:22:51 +0200
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
Subject: Re: [PATCH v2 06/10] dt-bindings: pwm: apple,s5l-fpwm: Add t6041
 compatible
Message-ID: <20261015-remarkable-foxhound-of-finesse-d2dee2@quoll>
References: <20261014-apple-m4-pro-max-initial-devicetrees-v2-0-961edd8d661b@cyberchaos.dev>
 <20261014-apple-m4-pro-max-initial-devicetrees-v2-6-961edd8d661b@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261014-apple-m4-pro-max-initial-devicetrees-v2-6-961edd8d661b@cyberchaos.dev>
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

On Wed, Oct 14, 2026 at 08:56:13AM +0200, Yureka Lilian wrote:
> The PWM controller on Apple Silicon M4 Pro/Max SoCs is compatible with
> the t8103 (M1) one. Add "apple,t6041-fpwm"as per-SoC compatibles for M4
> Pro/Max.
> 
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
> ---
>  Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


