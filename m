Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6AABC021B6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 00:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=bBC7ol6BD2My4dTmLEOX0IGZHYDK0jtI74mzMD6FJdw=; b=IQZ0+EXWl8K2n2
	LtQ2nTvvnpsG3ZaWH+ignuoRR8RMUnLneWpz7JIK4rGmc4q9/TGLoYi4DhMD/XN/4Q8kcfTHZYhG3
	P41gsPFjlyfWylrXUIKVXwIiT1Mde/5JS8QSs2BppcK0sdoTs806YJhdw5AcZ9+sjbjyG0ufBO7eg
	XkJdOYLnQIqLRQdtK2y37+rJYQIqBChQfHmbNroYlNBxDeiv0fRojQehi09ZhllqngvMBX6NOQDig
	udosKQUs9ZwbdLw4+gqxz4bekQnSeYXN0aBed1pWg0+ZyXh2w3C8wZcTRZSJVh+ddMGfSW3oHrfJZ
	TujF6YAIoZOEawgLcV6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlcy5-00000007BIe-0qIy;
	Sat, 22 Feb 2025 00:02:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlcwb-00000007BF1-0Hgc;
	Sat, 22 Feb 2025 00:00:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A5E015C545D;
	Fri, 21 Feb 2025 23:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30A97C4CED6;
	Sat, 22 Feb 2025 00:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740182431;
	bh=IaOPCrH3kw57a9AP/P15cOXKdwI6oMqM5L5tl5C6SV0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=YdNT/KjSojaK2abE6rwyi+ctzkbBJ2TWp3tMtGCwMJH3FcdT4TgNwiMQ9SodstG8l
	 TgNed1ktruibdiLre7E481mfQsMmowjwPIgogVtq2rbWVCWB4B/cfYN/kYryIhSzjp
	 4cchOH+1fNZtfVDPVNs69hhUnolEbEW+Q1mxineVn5L2w44CNWyl1G61AOmyPG6q3Z
	 Sbt9z0I2Hihntk7vsbgdtFMzIPrvUYYckp0CJ9+A4ljinEOGOqh5wfk3G8/1DC1VMs
	 6YqH8QjgH7vuLxaNpVYgmb+ZdqC27cykI3MgJQvfNzb2lcrTSR8M8rx2PQWsiI2O8a
	 Bxkfe8BLpcRsw==
Date: Fri, 21 Feb 2025 18:00:29 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 2/2] PCI: dw-rockchip: hide broken ATS capability
Message-ID: <20250222000029.GA373377@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221202646.395252-4-cassel@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_160033_167015_323C06A4 
X-CRM114-Status: GOOD (  14.97  )
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

On Fri, Feb 21, 2025 at 09:26:48PM +0100, Niklas Cassel wrote:
> When running the rk3588 in endpoint mode, with an Intel host with IOMMU
> enabled, the host side prints:
> DMAR: VT-d detected Invalidation Time-out Error: SID 0
> 
> When running the rk3588 in endpoint mode, with an AMD host with IOMMU
> enabled, the host side prints:
> iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT device=63:00.0 address=0x42b5b01a0]

Maybe add a blank line and indent the message since it's quoted
material?  E.g.,

  When running the rk3588 in endpoint mode, with an Intel IOMMU, the
  host side prints:

    DMAR: VT-d detected Invalidation Time-out Error: SID 0

  When running the rk3588 in endpoint mode, with an AMD ...

    iommu ivhd0: AMD-Vi: Event logged [IOTLB_INV_TIMEOUT device=63:00.0 address=0x42b5b01a0]

Too bad DMAR isn't smart enough to include a device ID in its message ;)

Can you include something here about what the issue is?  Based on the
subject line and the patch, I assume something is wrong with the ATS
Capability?  I guess this is some kind of rk3588 defect, right?

> Usually, to handle these issues, we add a quirk for the PCI vendor and
> device ID in drivers/pci/quirks.c with quirk_no_ats(). That is because
> we cannot usually modify the capabilities on the EP side.
> 
> In this case, we can modify the capabilties on the EP side. Thus, hide the
> broken ATS capability on rk3588 when running in EP mode. That way,
> we don't need any quirk on the host side, and we see no errors on the host
> side, and we can run pci_endpoint_test successfully, with the IOMMU
> enabled on the host side.

s/capabilties/capabilities/

Bjorn

