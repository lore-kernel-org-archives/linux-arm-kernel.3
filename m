Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D9CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 10:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7MUfl+qwpC1o7BVjkJfwBEdwVKVSN/Dl3tD+mqKLJFw=; b=ripQA7CIgrwKY9XPn/AnI+8+sK
	k8ZKB6/2CJoIa/K88bZvCDLh9pRIhNufZ1tLSTGT3z0jUQak9KvOsfzW5FsCLyIQk3zJJ9LQwFxGC
	FtDL/5uDzaE8D4w9RjGh5gKj+MUzTXJ+/m60Z4rBlZ3Gi4n/kahBkFiG/2Gw+RAAipnuANLN6Fik7
	qJhU4LKOmOMeeZrgkgk51wJppDixfXHwlls0nz8kEyYjb8IB7ceiUL1D+Gd9TvtG4n6CjKns4xP6p
	kHYMpOHm07LOivbfzonQnnx6BBh009sBHcj89n8SyTXG0fwOlcsTOgAXVUUrtB3wWFNs/Ju+53/ze
	jFtGXlGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8TM-00000004i4V-0eF0;
	Fri, 10 Jul 2026 10:28:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi8TK-00000004i3N-1AzD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 10:28:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 79403601D9;
	Fri, 10 Jul 2026 10:28:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 670D81F000E9;
	Fri, 10 Jul 2026 10:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783679321;
	bh=7MUfl+qwpC1o7BVjkJfwBEdwVKVSN/Dl3tD+mqKLJFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FPUq2UNYbkh7tvmcQ2svWUONIrBGEKCCzMCYNSDjhxFO0BtceBRYDuFQL/okwRfIn
	 7OdwRxfzEu/SweNWxSmYDocZDwNJzxgk50ivjVWoU6bgty6yqcJT6gY+kQMy9M60c0
	 ks9scJ+DDJtOvbDxW7r9s4kZpJr4+l6A2/50KPRJtac9VFcAoyYvuOESeR1uYNJIXN
	 HO6U1H6IMJ6jrgd7/Vd0XAPWgdjwKI4PIYFXZZA8833xGFlCKy4i78s8+ctYGAevHk
	 WVQ2tp6jMY9eKdBt96hZtQ5edJyOPjXw4l2yu6h6oFONU70wqRwI0uQqNv2nuBzI+v
	 jmQIGugLOB4VA==
Date: Fri, 10 Jul 2026 12:28:37 +0200
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
Subject: Re: [PATCH v2 04/10] dt-bindings: soc: fsl: qe: Add support of IRQ
 in QE GPIO
Message-ID: <20260710-accurate-cherry-toad-5d20c3@quoll>
References: <20260708-qe-pic-gpios-v2-0-1972044cfbd1@bootlin.com>
 <20260708-qe-pic-gpios-v2-4-1972044cfbd1@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260708-qe-pic-gpios-v2-4-1972044cfbd1@bootlin.com>
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

On Wed, Jul 08, 2026 at 12:15:17PM +0200, Paul Louvel wrote:
> Some QE GPIO pins have an associated interrupt line in the QE PIC to
> signal state changes on the pin.  Add the corresponding
> interrupt-controller / nexus properties to the QE GPIO binding.
> 
> Because the GPIO controller does not perform any interrupt handling
> itself, a nexus node (interrupt-map) is used to map each GPIO line
> supporting IRQ to the parent QE PIC interrupt domain.
> 
> As the QE PIC can be configured to generate an interrupt on either a
> high-to-low transition or any change in signal state, three
> interrupt-map entries are needed per GPIO pin that can yield an
> interrupt (falling, both, and the "none" case which defaults to both in
> QE PIC).  This overhead is necessary because the interrupt-map-pass-thru
> property is not part of the DT specification.
> 
> The interrupt-map property is optional: it is not required for GPIO
> banks that have no interrupt capable GPIO line (e.g. port D on MPC8323),
> or when interrupt functionality is not used.
> 
> Update the example to show a scenario where each bank supports a
> different numbers of IRQs, or no IRQs at all.
> 
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
> ---
>  .../bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml   | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


