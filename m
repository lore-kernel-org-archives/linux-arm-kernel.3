Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BDBC021B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 20:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RtHWekfr9PAPqze2jQ7chZG40e+mSXvS0nobf0sErKA=; b=Qs27/Vwlv1+ihxThSLL5iRBH49
	YlhjdQyf7/KNOGoD2RbTzMzWCvIMESvzsvq4cJByyYL4zvIflFaxf4L60lYmwEuVBfgq//rNPEy72
	xBkH+vFJ4l0ns2dfC3340Y92QwCEVdAQjkwHbUwrxG+9ZngkGRxAp3xuda1d1kAX4SxqVOmSO7VVx
	d8BjDxhCIxGJb2cHvbpydCd9OkCkirT7sah3lghiaq4tl6Ip1rFWRM2eU8zMa0l9gsXPgAYeP79CA
	B1xcCOAjIwxig0jtr7+yuE1YFM2zjRIWz2pVcAc255RZrSgxqAnwP7YFRgzxJojywpT8qLOK32H93
	2MfBzNcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlDPN-00000002prz-0lP5;
	Thu, 20 Feb 2025 20:44:33 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlDNs-00000002pdm-1f0v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 20:43:01 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1740084178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RtHWekfr9PAPqze2jQ7chZG40e+mSXvS0nobf0sErKA=;
	b=Jz7UUagNJTKbH56LgA1I1S2wceAMMcMLhEFTOQqAXc8zhpwat3W7Md4/GbVOSEl7Ja7f6t
	BV49/BFemaZOqEOVn4yRHDyY/W9L1s4vwD20lQDSJmg7pHswUgvc2diuh1ACjW3B3wCCiR
	nb9UU/+ChkaiD0TV7bOceMRn225UlaZst7NAec1BQ85bQBDgRNL+8nc8nkzBgAd2s0Ldh/
	vM/2IuIdN5fmR1Y2kPmAfRRmoQlQGfb7sMGtdDLelpP4Yq5ze2z5X585jfLSk03FJ82HKI
	RNpnzH9P6BEFX1OQE6VgcsfUgcxIC9y+u6chBR8e8pplO9v8gn2uX6V3HXw1dw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1740084178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RtHWekfr9PAPqze2jQ7chZG40e+mSXvS0nobf0sErKA=;
	b=JaGBK3GNvF9d/Xprp9sb0i3FtrYJ+tMeGHw68qv5QxzNEaV92P6GDoaIuTka6bxo7IX8wm
	7Kwx8ZWXVTO9O3CQ==
To: Frank Li <Frank.li@nxp.com>, Kishon Vijay Abraham I <kishon@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Anup Patel
 <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich
 <dakr@kernel.org>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, Shuah
 Khan <shuah@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach
 <l.stach@pengutronix.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Rob
 Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>, dlemoal@kernel.org, jdmason@kudzu.us,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org, linux-kselftest@vger.kernel.org,
 imx@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH v15 00/15] PCI: EP: Add RC-to-EP doorbell with platform
 MSI controller
In-Reply-To: <Z7eKBsxrmthtElpz@lizhi-Precision-Tower-5810>
References: <20250211-ep-msi-v15-0-bcacc1f2b1a9@nxp.com>
 <Z7eKBsxrmthtElpz@lizhi-Precision-Tower-5810>
Date: Thu, 20 Feb 2025 21:42:57 +0100
Message-ID: <87r03sgxf2.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_124300_573433_3B95E407 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
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

On Thu, Feb 20 2025 at 15:01, Frank Li wrote:
> On Tue, Feb 11, 2025 at 02:21:53PM -0500, Frank Li wrote:
>
> Thomas Gleixner and Marc Zyngier:
>
> 	Do you have any comments about irq/msi part?

I'm not having objections, but this needs to be acked by Marc as he had
pretty strong opinions on the overall approach.

Thanks,

        tglx

