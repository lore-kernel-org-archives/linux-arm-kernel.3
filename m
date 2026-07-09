Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C22BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 16:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6zfm76fEAbtqbPgr8gSWD50RFqbsGXOG5Wy3pfyM+U=; b=DLYNUuYebrCXwR/FbM8qAyBlVM
	Y7NATGyB8VKYlJUrEspIhmtM644ANIVYkCvFWv+565glPPEX4Ybh1oSBn3pM0hF2bJqQhT4mzP1ZJ
	ba8ROs00C23Hxe7/v/TaI+cTdu+P7OU2V/1R1UdcgtdfUtWwB+AmPzG3Rf1oFlUXfalEogzDZE7Y3
	eUm6jyBOYc0Gq3kZtAusw50DaDOREvKcvFxg+QfnJtBDjyipU2BHeM/awVMhiyvBukktW0oHgi1rk
	H2114AGK06q9OHCnW2dKHWvsvIhQczSD41fBmR+Oe3tW0vI8teIPPrzDgnhxZeLT+bfwuPXm1Lu/b
	yfl8CCfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whru5-000000033yX-3Pms;
	Thu, 09 Jul 2026 16:47:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whru5-000000033yM-0ZOE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 16:47:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 730C4404C3;
	Thu,  9 Jul 2026 16:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82A1F1F000E9;
	Thu,  9 Jul 2026 16:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783615632;
	bh=f6zfm76fEAbtqbPgr8gSWD50RFqbsGXOG5Wy3pfyM+U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=b4moN+SscOMvp/fQApGNRYxiRUl57GNzScV0hh8gIEFcgYPJxGAVowYd5GiQSYpkK
	 1qAFqokbo1YQ3RjBWoDdJM/p5x3QuSRp3HVpcra58EYEiCo5Jp5aqhOZ9qOzfUCaSi
	 XXSiRnGo2rWNynWHTnmIcs1yBa9YaiB7WRf/8CgxgzOLbiCJLMJFNjRLMfMtmhQSjg
	 mgAUE4cUofFTzJgnNCe5hleRlYX0mqrXRSCLRMLAoiZfs6+AA38tlOjeGPFj5L7kXm
	 opPHgG0T5fi8n2S7eofIokNYK74VAct58PK8eE7Ps8xW6XBwpZ4RuLmHUjnZ0b+/ec
	 c9yaTDBg+Ms9g==
Message-ID: <40c82e88-2f3e-4651-b063-08754af73cf4@kernel.org>
Date: Thu, 9 Jul 2026 18:47:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/10] soc: fsl: qe: QE PIC improvement and add support
 of IRQs to QUICC ENGINE GPIOs
To: Paul Louvel <paul.louvel@bootlin.com>, Qiang Zhao <qiang.zhao@nxp.com>,
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>,
 stable@kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260708-qe-pic-gpios-v2-0-1972044cfbd1@bootlin.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260708-qe-pic-gpios-v2-0-1972044cfbd1@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Le 08/07/2026 à 12:15, Paul Louvel a écrit :
> This series modernizes the QUICC Engine Port Interrupt Controller (QE
> PIC) driver and adds the ability for QE GPIO pins to generate interrupts
> through the QE PIC, completing Christophe Leroy's prior work [1].
> 
> Christophe's series was partially merged; patches 4, 6 and 7 did not
> make it to mainline.
> 
> The series is organized in three parts:
> 
> 1) Add missing chained_irq_{enter,exit}() calls
> 
>     - In a chained handler, the parent controller need to mask and ack
>       the interrupt source.
> 
> 2) DT binding updates
> 
>     - Update #interrupt-cells from 1 to 2 in the QE PIC binding so
>       consumers can encode the interrupt type (falling-edge or
>       both-edges).
> 
>     - Convert the QE GPIO binding from freeform text to DT schema.
> 
>     - Extend the QE GPIO binding with an interrupt-map (nexus node) that
>       maps GPIO lines to parent QE PIC interrupts.  This approach was
>       suggested by Rob Herring [2] as an alternative to using compatible
>       strings and driver data to specify which pins support interrupts in
>       a given bank.
> 
> 3) QE PIC driver refactoring
> 
>     - The QE PIC is a perfect fit to use the generic irq framework
>       instead. Perform the necessary changes to the driver to convert it.
> 
>     - Minor cleanups.
> 
> 4) QE GPIO interrupt support
> 
>     - Add a to_irq() method to the QE GPIO driver that perform the
>       mapping of the GPIO pin to the parent interrupt domain, allowing
>       GPIO pins to be used as interrupt sources through the QE PIC via
>       gpio_to_irq().
> 
> [1] https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2Fcover.1758212309.git.christophe.leroy%40csgroup.eu%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C1e59449bc6904ae4c2a808dedcd9e3e4%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639191025561275310%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=SgmsHETiol22Fip%2FU04XAAKihuQ4UtGfIqUU8t%2FMTpI%3D&reserved=0
> [2] https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20250919152414.GB852815-robh%40kernel.org%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C1e59449bc6904ae4c2a808dedcd9e3e4%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639191025561303589%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=t%2B83hXaaY147CW1fvLA7ATUHJXDkfq6jLv5OWRr9ABI%3D&reserved=0
> 
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>


Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>


> 
> ---
> Changes in v2:
> - Applied Christophe two patches before this series [3] [4].
> - Fix a miscalculation in patch 6 when iterating over bits set in
>    CEPIER. Old ffs() is 1-indexed, but for_each_set_bit() is 0-indexed.
> - Add in patch 3 commit message more info about the changes introduced
>    by the conversion to DT schema.
> - In patch 4, keep the existing example without any IRQ supports, and
>    add only one new example. Also fix the DTS coding style that was wrong.
> - Add raw spinlock guard to mask and unmasking hook since multiple CPUs
>    can modify different IRQs concurrently. Also add it to set_type hook.
> - Drop usage of register offset in irq_chip_type. It requires additional
>    load instruction with no real benefit since irq_gc_* functions are not
>    used.
> - A race condition can occurs if an interrupt fires immediately after
>    the domain is initialised, because gc is NULL.
>    Instead, do not carry gc in the struct qepic_data. Add the domain in
>    the handler data, and retrieve gc with irq_data_get_irq_chip_data() in
>    hook functions.
>    Because of this modification, patch 10 and 11 are dropped.
> - Link to v1: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatch.msgid.link%2F20260703-qe-pic-gpios-v1-0-6c3e706e27dc%40bootlin.com&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C1e59449bc6904ae4c2a808dedcd9e3e4%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639191025561327333%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=fSy9tyhbYvMFKNFQsqGikR3llkOgaLXFMv6sGt4UPXg%3D&reserved=0
> 
> [3] https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2Fb08f76c1d8ff864774246f1e2c2158c223c001be.1783435914.git.chleroy%40kernel.org%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C1e59449bc6904ae4c2a808dedcd9e3e4%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639191025561348477%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=JDjk7SvhF1cJGAI8xnVtECrKn1m6ZhmHeNO860rQhwo%3D&reserved=0
> [4] https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2Fcd46aec4b325745d38ac7992e4d3d5b4f4c4e95f.1783435914.git.chleroy%40kernel.org%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C1e59449bc6904ae4c2a808dedcd9e3e4%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639191025561367590%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=sYCT9QzjBWVowv%2BEgbvSiYe0qVdWGZV4vGwgIGAwQhg%3D&reserved=0
> 
> ---
> Christophe Leroy (1):
>        dt-bindings: soc: fsl: qe: Convert QE GPIO to DT schema
> 
> Paul Louvel (9):
>        soc: fsl: qe: Add chained_irq_{enter,exit}() calls in cascade handler
>        dt-bindings: soc: fsl: qe: Set #interrupt-cells to 2 to support interrupt type encoding
>        dt-bindings: soc: fsl: qe: Add support of IRQ in QE GPIO
>        soc: fsl: qe: Use generic_handle_domain_irq()
>        soc: fsl: qe: Iterate over all pending interrupts in cascade handler
>        soc: fsl: qe: Handle spurious interrupts
>        soc: fsl: qe: Convert to generic IRQ chip
>        soc: fsl: qe: Rename irq variable to parent_irq
>        soc: fsl: qe: Add support of IRQs in QE GPIO
> 
>   .../bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml   |  84 ++++++++++++
>   .../interrupt-controller/fsl,qe-ports-ic.yaml      |   4 +-
>   .../bindings/soc/fsl/cpm_qe/qe/par_io.txt          |  26 +---
>   drivers/soc/fsl/qe/Kconfig                         |   1 +
>   drivers/soc/fsl/qe/gpio.c                          |  28 +++-
>   drivers/soc/fsl/qe/qe_ports_ic.c                   | 145 +++++++++++++--------
>   6 files changed, 208 insertions(+), 80 deletions(-)
> ---
> base-commit: c34b47a17bc566c7113679e6ae095d5510b4f1c6
> change-id: 20260513-qe-pic-gpios-073e284615a3
> 
> Best regards,
> --
> Paul Louvel, Bootlin
> Embedded Linux and Kernel engineering
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fbootlin.com%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C1e59449bc6904ae4c2a808dedcd9e3e4%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639191025561386837%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=EMKgQXFWGtGS8OwHXgqIB7IH3cWQVA0ZJA%2B2emFlI1E%3D&reserved=0
> 


