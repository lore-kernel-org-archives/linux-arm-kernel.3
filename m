Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A75C0CC6B1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 07:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4HPQ7/QMA3vnMLq2figDVKCINSZpEuN5oVAhqwc1Zng=; b=VffYB4L2E+Bb8XNlethK10q6eP
	45nXPUODk1u3MLxbaZYk4WxjfzyFz82DnhO59NOr9bdmpcoE64qpelkEkDJ105nrCEDUikb07pUNR
	KnD89KokK2WR0KxbKseU7MlAXZfYqnKEV1wLJtdssJsysgyuPF3Mckq1i5vw0tBwUA4g0OTzJeRNc
	LIooq3ZP0lHP0/edAA2hYbuAcgrde2VijacshvVIEnIESm0yNVYVwswGz2VEI7mRUjfCQ749TS8H8
	0d198VUUPDen6vaKK0rltvE7g8ae8AHMJOpdT2Qh9U+OG6/Cs7B88kcVRUy4ZrltXLpHieteKCe0a
	dk1AFl7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtP7-0000000ElKJ-3iD9;
	Wed, 14 Oct 2026 07:28:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtP7-0000000ElJZ-0FiT;
	Wed, 14 Oct 2026 07:28:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A80D43868;
	Wed, 14 Oct 2026 07:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0AA1F000FF;
	Wed, 14 Oct 2026 07:27:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2] PCI: rockchip: Skip the Tpvperl wait when power is
 already valid
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: =?utf-8?q?Enrique_Hern=C3=A1ndez_Bello?= <ehbello@gmail.com>
Cc: shawn.lin@rock-chips.com, lpieralisi@kernel.org, kwilczynski@kernel.org, 
 mani@kernel.org, bhelgaas@google.com, robh@kernel.org, heiko@sntech.de, 
 dlemoal@kernel.org, linux-pci@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260911211559.207990-1-ehbello@gmail.com>
References: <20260911211559.207990-1-ehbello@gmail.com>
Date: Wed, 14 Oct 2026 12:57:47 +0530
Message-Id: <179196286749.38040.5597453767131590054.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2102;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=n3FTo4mK9R/lIGl5C3jeelRqRYzuENdY8tuLlXHAZOc=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBqzy72A6EYqXUa8oem4GQlieL7BdAjqrbq/LHus
 95HXXNGgXqJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCas8u9gAKCRBVnxHm/pHO
 9VzpB/9GLv7F5DEMWwQ3WZjJLu4Q7SDngruevsqLwGdrOGO7UOVSUAgVdr7yQ57EUHYIaeZF5jp
 Pl/kg+HBvpSxkjLex1X5MQSkf2u1VGWSk0SZT/0DsNYYQzNE/9oBlSZLEzdCZJeu/+/OyRl6Xyk
 LCuLsMqwOy+cVpFLHNsNLqxRjcnKBlDyVo+76vBGsF/woWmS9WeFOWS/I9RYFhJ5M2Qjrx0zJEu
 4UGxgjsyHy9OhBypKbC/c+0i59rAqfwMZn4NxjTHpwQEkQW1zgafnsKHcXnSdc2zrYqzVA3jBv5
 CkBZWRKvHxzrhppg5Wu6eG3LH4WUTlgxkkBZoiHvsH+0v0CG
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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

On 2026-09-11 22:15 +0100, Enrique Hernández Bello wrote:
> Since commit c47f90be4c89 ("PCI: rockchip-host: Fix
> rockchip_pcie_host_init_port() PERST# handling"), a JMicron JMB585
> behind an rk3399 root port almost never becomes usable: the link trains
> normally, but the endpoint's configuration space never answers, so the
> device is not enumerated. On this controller a configuration read that
> gets no usable completion is reported as an external abort rather than
> as an all-ones response, which on arm64 brings the machine down.
> 
> The change added an unconditional 100 ms sleep so that PERST# stays
> asserted for at least Tpvperl after power becomes valid. The wait is
> performed while PERST# is asserted, so it also extends the reset by
> 100 ms, and this endpoint does not tolerate the longer assertion.
> 

This is hard to believe. First of all, Tpvperl is the min time specified by the
CEM spec to allow the power to be stable, not the max. Even if the bootloader
has already enabled the power supply during boot, it would've taken several
seconds for the kernel driver to probe and execute this delay of 100ms. But
claiming that the Endpoint doesn't tolerate this 100ms delay, but still several
seconds of the boot delay is quite hard to believe.

Maybe the issue is with the delay between PERST# assert and deassert? Is the
PERST# signal polarity on the board DTS correct? We used to see Endpoint
firmware crashes when the polarity was incorrect and the Endpoint got confused
with incorrect PERST# sequence.

> Tpvperl is counted from the supplies becoming valid (PCIe CEM r5.1,
> sec 2.9.2). On boards whose PCIe supplies are always-on -- vcc3v3_pcie
> on ROCK Pi 4 is regulator-always-on and regulator-boot-on -- power has
> been valid since boot, seconds before the driver probes, so the
> requirement is already met and the sleep only lengthens the reset.
> 

I do agree that the Tpvperl delay is *redundant* if the supplies are already
enabled by the bootloader. But I do not agree that it causes the Endpoint to not
respond.

- Mani


