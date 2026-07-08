Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E35CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 08:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hoiMUfefIhO/22z4j/RgowkVzpgWaSO743dDSJkhiCg=; b=nn9lebQ22z1sH6L1H6Za1YjGho
	Mv6bCIGcva6DkX+2Fz+DHS6i3fsbkSLb3JuPGp0GQBDfg+2Z8SSqaPI4FqpNIfs+fUKAacjX3v6xz
	yQH77Bn4cslh4JoBA6xu1JFbGYMCbRy3zDRUSbX9wymX/YO/C8PJ68dNxUz+tf5TrxKvz2Zmfq1Lh
	0HRJdTy8jqrQtHCX+5N2Twkk2oUQm8ze+YwPZdUFyIA4QZFGUIMlqSD1MKIw1J5YqB6yqK6pd9dT5
	wP1XGrtB6hvahLaQsTI3MhTgLCdh3W3Bpjob+mEPuctRbnNqEekMLyRkJlmafdHBArRG2EV6Zy3Js
	UPXDmmwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNSG-0000000Gb2P-3kx8;
	Wed, 08 Jul 2026 08:16:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNSF-0000000Gb2B-22Lb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 08:16:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5E3DA60008;
	Wed,  8 Jul 2026 08:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5101B1F000E9;
	Wed,  8 Jul 2026 08:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783498586;
	bh=hoiMUfefIhO/22z4j/RgowkVzpgWaSO743dDSJkhiCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n0MFymXYZZ0jS7v+5t2t+hCR/lXLM4YqFOLdgP/saTZo6cFSxmGXL1WcMxAjYan1S
	 7CQH17anrzKsY0JUZ9rpJD2C4Tmel7FZQmxCDAFWmL2uOA3axxRRjDr6cnzt2r8jTR
	 8ghLgWPSXkztRp0Kk4ToF42x6QEUAkCSr46WYXE/woToUFsEdB4KCzJMuL3iU+R4OO
	 nJnRzOd8ZtTwTYpoZgWFa0dDYWfO3MX45OcACsOhqMAE4SsaSBlUfQKnxRlpC0YlcV
	 UId3uIo5PXmjAJ00OuFNzyuvJw/hk6Y7Tnl+VC0eXhA+rwMgArAis6nlVHpdNW7PKE
	 Rpu/Vcv8rsGzg==
Date: Wed, 8 Jul 2026 10:16:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 02/12] dt-bindings: soc: fsl: qe: Set #interrupt-cells to
 2 to support interrupt type encoding
Message-ID: <20260708-spider-of-hypothetical-refinement-f7fbc3@quoll>
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
 <20260703-qe-pic-gpios-v1-2-6c3e706e27dc@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260703-qe-pic-gpios-v1-2-6c3e706e27dc@bootlin.com>
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

On Fri, Jul 03, 2026 at 03:30:10PM +0200, Paul Louvel wrote:
> The QUICC Engine port interrupt controller can be configured to generate
> an interrupt on either a high-to-low transition or any change in the
> signal state on the related GPIOs.
> 
> Update the #interrupt-cells property to 2 so consumers can encode
> interrupt level information.
> 
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
> ---
>  .../devicetree/bindings/interrupt-controller/fsl,qe-ports-ic.yaml     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


