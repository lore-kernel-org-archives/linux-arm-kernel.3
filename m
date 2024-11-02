Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C6E2E677EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 08:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sT9qxq7J8xYvqvzssDdz7jsH33/t4b31aSbr7WMXRiQ=; b=SV94SlUaYzTqCCxkzHOgArERSE
	ULFj5T9lZAhs6gutwObIk/sICrjnW9niMggg+fu0qK/VP1yvuWl+GSZI92p9oj9kffiKgr2UTxVPX
	W3vCgkF1ADXfSkFZXdQX4UCAlsnOc3kFExdxSFfoJUf1ZV9ucBgusFrG8yBgfwUVJrAptSQhBxCuN
	yOuPVdpuRi5amkT/Uxlu7R0nyztF3s3Sl5aJEywWmwr92mtjkyUZKu0S7rgqB73G5ygJoKOr8AQjh
	31gZskecsdep7bTJtHp09aYz48B+r3d9IdcP5R9MEloOPMdp35GKC2e6lSvKimVDHSXgksKr4mujM
	y/ufNAVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t79qR-00000009KZe-2iBk;
	Sat, 02 Nov 2024 08:50:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t79ok-00000009KQC-44cs
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 08:49:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F08935C02A2;
	Sat,  2 Nov 2024 08:48:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12214C4CEC3;
	Sat,  2 Nov 2024 08:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730537349;
	bh=ohhxWzZ1zwvYOUMLeaWV1CJbrqCDqjWUe6fdh6HWYns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PTCJt3dgQqDpl7NlwA1OQTkv/6Qa6X7vj8XbaMyhlKA0LGw32HC3u+RmbtWOYFn8x
	 rgR/WduMjvOHdtv+SeMckXYNFsb+FcWpr4UxGji8gNfGNQioWlc9M93/hAzYB6pHpg
	 Fnt/P4PGStrfA08dr7FttUqY/aywKEtlZo/paLINFUkyd7rukA6DcNAOMG39vRrOoO
	 efr57WsMKxeFD6YdPVy6xFc5KwNo0BQK95rjD3eHSIa3BrX0D5gulks6ZPtF4QG9ep
	 KCe1OBpOWZe4XbGFXly8EoRA0HuWb0UZgjrjBZexF+s2V7jEwUlUikMlugP1TcnoYy
	 Xx0qei7NGOT5Q==
Date: Sat, 2 Nov 2024 09:49:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Enric Balletbo <eballetb@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	imx@lists.linux.dev
Subject: Re: [PATCH v5 3/7] arm64: dts: s32g: make pinctrl part of mfd node
Message-ID: <cmisbftf7kep5ztc3sttiv22iypkaizvziy3q7l3xstqvltjpw@h24boozxaydc>
References: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
 <20241101080614.1070819-4-andrei.stefanescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241101080614.1070819-4-andrei.stefanescu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_014911_120587_72E553EB 
X-CRM114-Status: GOOD (  16.35  )
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

On Fri, Nov 01, 2024 at 10:06:09AM +0200, Andrei Stefanescu wrote:
> SIUL2 is now represented as an mfd device. Therefore, the old
> pinctrl node is deprecated. Move the pinctrl related properties
> inside the new "nxp-siul2" node. The latter one is now used
> to represent the mfd device.
> 
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/s32g2.dtsi | 26 +++++++++++-------------
>  arch/arm64/boot/dts/freescale/s32g3.dtsi | 26 +++++++++++-------------
>  2 files changed, 24 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> index fa054bfe7d5c..e14ce5503e1f 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -114,20 +114,18 @@ soc@0 {
>  		#size-cells = <1>;
>  		ranges = <0 0 0 0x80000000>;
>  
> -		pinctrl: pinctrl@4009c240 {
> -			compatible = "nxp,s32g2-siul2-pinctrl";
> -				/* MSCR0-MSCR101 registers on siul2_0 */
> -			reg = <0x4009c240 0x198>,
> -				/* MSCR112-MSCR122 registers on siul2_1 */
> -			      <0x44010400 0x2c>,
> -				/* MSCR144-MSCR190 registers on siul2_1 */
> -			      <0x44010480 0xbc>,
> -				/* IMCR0-IMCR83 registers on siul2_0 */
> -			      <0x4009ca40 0x150>,
> -				/* IMCR119-IMCR397 registers on siul2_1 */
> -			      <0x44010c1c 0x45c>,
> -				/* IMCR430-IMCR495 registers on siul2_1 */
> -			      <0x440110f8 0x108>;
> +		siul2: siul2@4009c000 {

This will affect users of this DTS. Your commit lacks rationale for
doing this, considering its impact. Re-describing devices is really
unexpected so should come with strong arguments.

Best regards,
Krzysztof


