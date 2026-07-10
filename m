Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DC0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 10:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BdmbeR+nXP2QOTmJSL448JaWOhpFdJafXIzincBL+Qk=; b=YtZGWTHYAtWEBCjIaRG+MiafTY
	XV5DhEFloTUkI3rgf2JEul1NNFm7+q69sgGTFHZdeorjVlHrAPxzvD1GUlZrllE7tr5pSRAyIyQe/
	rUZOVdr60Xw1e38BBaXNvmYyOI/T/xuzJbnN8FQF0xUEAfkYiu6uvp7X3kBRqzJRXH0VbbEGbJRpw
	6Mh00B0F01jrV4rorJDziwIGhk79IrRne92opY8wmCElYCLfo1Iv567YzNF1vhc19TfaKnDUo1/59
	rz3Xg4nLBxsubGYO/CywDpIJI8AhxunmOwmT0ijs02JB6w5zaqlCzSeWzj2sAHUHs4j+Jc+dPGNyU
	1b64qmcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8Sx-00000004hwG-0AaT;
	Fri, 10 Jul 2026 10:28:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8Sv-00000004hvm-1xdG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 10:28:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1AC58601D9;
	Fri, 10 Jul 2026 10:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD9C41F000E9;
	Fri, 10 Jul 2026 10:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783679295;
	bh=BdmbeR+nXP2QOTmJSL448JaWOhpFdJafXIzincBL+Qk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E59VEGjD2WXB4bUGmJBQC7A1D/xBU5RjYM4hv1oGNHf73wKSUSUgQhTy1N4nDaoBX
	 BddUzBpETIjpA6lNNhR1qJN1AEWf2QBTyl4kyFEFrT9EO3NW7H+0TM2dTgp93U13nO
	 DNkMYFMJPkLBG1ezmd+ZFJ38c8HW/ylby25KSP9sMsmyc55zW8REh5t09dmnX3nDYU
	 2Giy5jGDIYrcBOCVI60C8CwuEttGo5D3aYIQiDgezd2qe9AygAwPJILlBaCVklIz90
	 23DTG35DsRTwPBotQQv5ENuLuq5JAN5jfOpdcdWGos9UMrdQIEcVm1w3D5y+nAEf1m
	 /CD0IiuhXfvEw==
Date: Fri, 10 Jul 2026 12:28:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v2 03/10] dt-bindings: soc: fsl: qe: Convert QE GPIO to
 DT schema
Message-ID: <20260710-portable-thoughtful-uakari-4db7be@quoll>
References: <20260708-qe-pic-gpios-v2-0-1972044cfbd1@bootlin.com>
 <20260708-qe-pic-gpios-v2-3-1972044cfbd1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260708-qe-pic-gpios-v2-3-1972044cfbd1@bootlin.com>
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

On Wed, Jul 08, 2026 at 12:15:16PM +0200, Paul Louvel wrote:
> From: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> Convert QE GPIO devicetree binding to DT schema. The old binding uses
> fsl,<chip>-qe-pario-bank because multiple MCP83XX SoC has support for
> these GPIO banks. The best practice is to list out every <chip> instead.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
> ---
>  .../bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml   | 45 ++++++++++++++++++++++
>  .../bindings/soc/fsl/cpm_qe/qe/par_io.txt          | 26 +------------
>  2 files changed, 46 insertions(+), 25 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


