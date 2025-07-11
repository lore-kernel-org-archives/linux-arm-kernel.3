Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C65EC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 07:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1jefdio8tGYsknTVzQh6U96XwdfPTWnq4uBGNVmYT48=; b=qLL62OoHME6WoauJ6UQdIp6jA9
	BWhhl/Ml70h53lx7jsji09bHcd13DOa2q6A8TzgdinU2ZwIKlkhYzXzaweEx4ZNZiKdUgNxRtuJ6T
	QLllMg/zXSJ66MPrAF7mrepI4J+10uygs3rvlXwFRXx2dMcocwkHs8ZdnF7q6qwzPqjfV4mb4H998
	kF9jWC4k5rVoA823ZQWoAE0IapZ3WlXnYIDinbkpDNs0+xxbX1tom53VMciAjLQVLayD1bu+K5p/Z
	wrryGvOYE/AxnIjN/rR+sqF6F2c94uDq4yODvd61yVU1m/9R4UzmdASOJNShnGKksqucSQv+V0mwk
	834P8cCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8de-0000000E3Ao-2ZLT;
	Fri, 11 Jul 2025 07:57:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8JK-0000000Dzow-1SfR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 07:36:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2EC4D452B2;
	Fri, 11 Jul 2025 07:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A59FC4CEED;
	Fri, 11 Jul 2025 07:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752219404;
	bh=a0wdQROj3hyxjpHmI3TPp1B/1v9dnKkpod7Q3zxg27o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pDiyKLTj2+sXbOPoA09zNCj+YoGUJjOjlVrtsiy2CXqLzoOX57nGU7EqPOQre5vS5
	 SA9h4C+3e0Itmc0CPM/zi7oX76RjAbolfE8D1d8V6CHKfAbiXJnudy5TmDfu2QMuNP
	 y5L9Ese8GdUsfdKg9WekbMeczMdcyvsPUBBsN9boSbSzQovZVqAsCBRiWoINqgINJ7
	 vYFi2Pexu7Sl1acSNEPKZiYH/RUIQjzmcNmIxTcnDXIiZM28G/+QHuqjpiEmKSpvqR
	 QzR9ipvKvQR7nUJh2Sq2wINeUPQO3Y0XtsJGgt20qywberxIUO1y6y8sXM93YskG9H
	 2d+YQDEjcDTZg==
Date: Fri, 11 Jul 2025 09:36:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, chester62515@gmail.com, mbrugger@suse.com, 
	Ghennadi.Procopciuc@nxp.com, larisa.grigore@nxp.com, lee@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com, ping.bai@nxp.com, 
	gregkh@linuxfoundation.org, rafael@kernel.org, srini@kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, s32@nxp.com, clizzi@redhat.com, aruizrui@redhat.com, 
	eballetb@redhat.com, echanude@redhat.com, kernel@pengutronix.de, imx@lists.linux.dev, 
	vincent.guittot@linaro.org
Subject: Re: [PATCH v7 01/12] dt-bindings: mfd: add support for the NXP SIUL2
 module
Message-ID: <20250711-fluorescent-malamute-of-glory-b1c585@krzk-bin>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
 <20250710142038.1986052-2-andrei.stefanescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250710142038.1986052-2-andrei.stefanescu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_003646_412502_80351F1D 
X-CRM114-Status: GOOD (  11.04  )
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

On Thu, Jul 10, 2025 at 05:20:24PM +0300, Andrei Stefanescu wrote:
> Add the dt-bindings for the NXP SIUL2 module which is a multi
> function device. It can export information about the SoC, configure
> the pinmux&pinconf for pins and it is also a GPIO controller with
> interrupt capability.
> 
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  .../bindings/mfd/nxp,s32g2-siul2.yaml         | 163 ++++++++++++++++++
>  1 file changed, 163 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,s32g2-siul2.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


