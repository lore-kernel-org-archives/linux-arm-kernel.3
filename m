Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FF9C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 18:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pirFz880PHbl7Wsu56VW30PJh1UmmzZuboMbJFV0f10=; b=LOhIqq/hlH2MDgvUhERI8+jkMf
	4vOYIYVlCb0TCn+qz8wqJA15HsADUJ4wpyB67w89+rw3L6EprGyB31+SFfuByLomMUBxQpfpFgMSx
	QCmyJ1+a6QeU2CuFNScEyFO4Z3EB54zTqg7ZK99as/DS68gDm1wpiyj1k+0E1qjeHz87stqSsWlxQ
	KrUtk4CWFZFRHplaH67d0A0QltCvp15GUE2Qxfq/RvDbGX8kgWIPC/ukhZC34QY2QWbu5voeoIbVc
	hcqzeI/dQnG1UKaEeelOf5GrjupAxa1lLLEfHX0ci89ch0w+H8IShEOLcWpmY673a34OeipijizKd
	mSQXUn3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcTbF-0000000313e-44rK;
	Mon, 27 Jan 2025 18:12:41 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcTZC-000000030O8-3JsN;
	Mon, 27 Jan 2025 18:10:36 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738001431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pirFz880PHbl7Wsu56VW30PJh1UmmzZuboMbJFV0f10=;
	b=AfTBVeNH/KTFCBWBIDIdyxrcqzkaCjvXFQD717inHpxdKq7RWRRkd/0Q/TOWz7tXL1L+3c
	DTfIewtewEJNl57fRNWLpn1RljU+Q17YGytKeSw/2Ww5SvRHkQNgrbUE1NK8JzcWnaLPM+
	bSYHEC4AEUKKfCQ4flblBbrONfwH0xFHD2wFgoB7jQNegBJr4PdeYsBAgtLyiyZORa7rz/
	aubZCmQAmyYKXX/Y82j+kQafqoeWzD1KjbWi9FCz0QZ4pQuKz5NQaTe/Vr0iTp9c7pHgRH
	PtwGtS98oYJSeBf9WFYg8456k0OclH18bGAKXs4TCIeyzbhLDuIp8oa3LH/z+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738001431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pirFz880PHbl7Wsu56VW30PJh1UmmzZuboMbJFV0f10=;
	b=9d+a+D1oiQsTecowN1fpws3+HVT50yXPpNcciisFoaJvwhgEVDXVSwc7zfvsbfA2d18HAz
	4MT/ITjMeLI9jhAg==
To: Stanimir Varbanov <svarbanov@suse.de>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-pci@vger.kernel.org, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 kw@linux.com, Philipp Zabel <p.zabel@pengutronix.de>, Andrea della Porta
 <andrea.porta@suse.com>, Phil Elwell <phil@raspberrypi.com>, Jonathan Bell
 <jonathan@raspberrypi.com>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Stanimir Varbanov <svarbanov@suse.de>
Subject: Re: [PATCH v5 -next 03/11] irqchip: Add Broadcom bcm2712 MSI-X
 interrupt controller
In-Reply-To: <20250120130119.671119-4-svarbanov@suse.de>
References: <20250120130119.671119-1-svarbanov@suse.de>
 <20250120130119.671119-4-svarbanov@suse.de>
Date: Mon, 27 Jan 2025 19:10:31 +0100
Message-ID: <87bjvs86w8.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_101034_971711_FB02D7F2 
X-CRM114-Status: GOOD (  10.95  )
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

On Mon, Jan 20 2025 at 15:01, Stanimir Varbanov wrote:

> Add an interrupt controller driver for MSI-X Interrupt Peripheral (MIP)
> hardware block found in bcm2712. The interrupt controller is used to
> handle MSI-X interrupts from peripherials behind PCIe endpoints like
> RP1 south bridge found in RPi5.
>
> There are two MIPs on bcm2712, the first has 64 consecutive SPIs
> assigned to 64 output vectors, and the second has 17 SPIs, but only
> 8 of them are consecutive starting at the 8th output vector.
>
> Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

As this is a new controller and required for the actual PCI muck, I
think the best way is to take it through the PCI tree, unless someone
wants me to pick the whole lot up.

Thanks,

        tglx

