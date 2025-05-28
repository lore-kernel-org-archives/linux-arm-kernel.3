Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F949C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 22:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=2zUXSpzXYnPglbEzEWR7B7kzGmejoqeOnfrqssc5yQs=; b=AzsV3obPo1HdWL
	PI9Wvq7E19Li+3FJ+CT8g2OrD8gka8B/Ox8J0cPJECETeH3LxvUm7u11Z+3ebSon9r5mb6ivRYIW1
	AvCeE99IhKFd4GYq7NvCKrg/xb4B05WmCGtX2GY1KusCdsfvoSkrfwOe9hD17AWWU63RPV8+EU0Av
	M+DcXLFtaxpZKN14aFDspPxcxhpvfPudotA4SLzRO4Ze8GrtZuPb/n+h1IYNczX5F4ErdcLtudlVH
	5zlv75ocRFjKP5N7aNTFHligMBcpKYZ2iKgdVWP3dR1XWEwSryAA4P2BqjgWZWXQTXO2THQ/FI2po
	R2DVyzK+B0QGE7BUGG4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKPOf-0000000EHET-2nIv;
	Wed, 28 May 2025 22:37:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKPMV-0000000EH11-3FLP;
	Wed, 28 May 2025 22:35:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 846FCA4F381;
	Wed, 28 May 2025 22:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D324BC4CEE3;
	Wed, 28 May 2025 22:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748471702;
	bh=G/c8gLq1UOYM2sneyafsU62G5RMVALyJq3J1BkyGhfo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=UTS9s/t9dgzKMS69c26wtss9wbJFXwAdQVw0jYJpOf0PidV1XhhRUQYejNZvNZdlK
	 HeaIovN6Mcj2OQMfrCvy3nHZrJrKlYoKMHhozxBCRXO8C2PhsjzmArrHbPBRrQnubZ
	 rbVClPpcjpNZxQizn8W3Oj6piVhPORsVI/wlef5kpq/P8Pa3WG+04h5IpWKDjZoVwE
	 GZMsZWYRvz9BSd632glvDalgHlYLaT8RWlFn28UaTSo+X94gm1rnSbuZbCr35yZU1Z
	 ZIn0WY7wkryHte585r5iTZnOJtzoeUXqrXA8Uuh3K/axLPciB5TsR3Y2bqeFzN+WDx
	 SYwfxPGqcuwUA==
Date: Wed, 28 May 2025 17:35:00 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>,
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Marc Zyngier <maz@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>, dingwei@marvell.com,
	cassel@kernel.org, Lukas Wunner <lukas@wunner.de>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 4/5] PCI: host-common: Add link down handling for host
 bridges
Message-ID: <20250528223500.GA58129@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508-pcie-reset-slot-v4-4-7050093e2b50@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_153503_886660_8664FDF8 
X-CRM114-Status: GOOD (  12.74  )
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

On Thu, May 08, 2025 at 12:40:33PM +0530, Manivannan Sadhasivam wrote:
> The PCI link, when down, needs to be recovered to bring it back. But that
> cannot be done in a generic way as link recovery procedure is specific to
> host bridges. So add a new API pci_host_handle_link_down() that could be
> called by the host bridge drivers when the link goes down.
> 
> The API will iterate through all the slots and calls the pcie_do_recovery()
> function with 'pci_channel_io_frozen' as the state. This will result in the
> execution of the AER Fatal error handling code. Since the link down
> recovery is pretty much the same as AER Fatal error handling,
> pcie_do_recovery() helper is reused here. First the AER error_detected
> callback will be triggered for the bridge and the downstream devices. Then,
> pci_host_reset_slot() will be called for the slot, which will reset the
> slot using 'reset_slot' callback to recover the link. Once that's done,
> resume message will be broadcasted to the bridge and the downstream devices
> indicating successful link recovery.

Link down is an event for a single Root Port.  Why would we iterate
through all the Root Ports if the link went down for one of them?

