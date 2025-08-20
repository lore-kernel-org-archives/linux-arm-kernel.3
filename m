Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ECB5CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 15:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GL9sAeRKOASA+eAc8v67yQLe5ezdU+IrDN1Fs5amqjc=; b=c8+SM+Y6pMeKdHYLxv5PxQjTaq
	0aXt7lPq5bH60cu3lfi7knX91IQWcw3clnyhXHbx5mcgdX3HMbkXVuf3rSZpsq6ooLNCNS9f82qyH
	LGcSLzwJoly41CvirT8/24CmArgxchwHeGQRlTyJdIcfRpyjzS/M0dm3tIjpvHIfDeSK5PMkgxEFL
	+aGZRYhrJVyHafs3pIoPpNHdEGJL3lpFBO/y9xEuTbq2JtHZBcKolTuFw0bKwiUw/cZQov0wLsoj+
	5IilYhxYwC7WQ877N9D0Th1oFQfttX9ObAUEajAcVksaaQaIVWoIa9dVv9Ge/ZXPt7KOfVHsJ8c3g
	nJo/bA5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uokPi-0000000EBy9-2CNF;
	Wed, 20 Aug 2025 15:07:46 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojEr-0000000DuG2-3vmw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 13:52:31 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57KDqJ2e261463;
	Wed, 20 Aug 2025 08:52:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755697939;
	bh=GL9sAeRKOASA+eAc8v67yQLe5ezdU+IrDN1Fs5amqjc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=UFGFeipw+uQJHat4UONB2RUWeM6loMedMBLjso0MpqRCE3IgGqPYxnTxPOoS9W1hD
	 WyfYAbu1bac8ShGI28m8/xVwdQhH+hzo9wJDyZwu7e3rC4TaneV5rdAvkzLLFvZPkO
	 ViAAOPixF+DGi3dIlHBCcvmJ+wk19mHvo0VOIvzA=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57KDqJSe1828734
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 20 Aug 2025 08:52:19 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 20
 Aug 2025 08:52:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 20 Aug 2025 08:52:19 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.231.84])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57KDqIHg597953;
	Wed, 20 Aug 2025 08:52:18 -0500
Date: Wed, 20 Aug 2025 19:22:17 +0530
From: s-vadapalli <s-vadapalli@ti.com>
To: Michael Walle <mwalle@kernel.org>
CC: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
        Tero
 Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <s-vadapalli@ti.com>
Subject: Re: [PATCH] arm64: dts: ti: k3-j722s-main: add legacy PCIe interrupts
Message-ID: <ae898bf0-705f-4e36-9664-37c401f5fee7@ti.com>
References: <20250819111317.1082515-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250819111317.1082515-1-mwalle@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_065230_016668_E1DF77F3 
X-CRM114-Status: GOOD (  15.77  )
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

On Tue, Aug 19, 2025 at 01:13:17PM +0200, Michael Walle wrote:

Hello Michael,

> The kernel will try to map the legacy interrupt pins, but the
> interrupt mapping is missing from the device tree and thus that
> fails with:
> 
>    pcieport 0000:00:00.0: of_irq_parse_pci: failed with rc=-22
> 
> Add the node for the legacy PCIe interrupts to fix that. This is just
> compile-time tested.

INTx is not supported by the driver as explained at:
https://lore.kernel.org/r/be3e3c5f-0d48-41b0-87f4-2210f13b9460@ti.com/

The patch to fix the error displayed in the logs was posted at:
https://lore.kernel.org/r/20240726135903.1255825-1-s-vadapalli@ti.com/
but wasn't accepted as-is. A different approach will be required to fix
of_irq_parse_pci() instead as pointed out at:
https://lore.kernel.org/r/20240729080006.GA8698@thinkpad/

[Trimmed]

Regards,
Siddharth.

