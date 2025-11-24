Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EAACFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 14:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rkldt8yubz0CfrEBJ1uUQiZThzZT22pA7Z+LhK1VuO8=; b=yzErHQclWITvKEOo4IMtU/BYPq
	ygDdaIE/BKWddcdSwPjQh/pKilzeRSuvP+3rdCSeHYkegezHSomTBVf6jy8xg3BcZbts7HZjIrlbo
	DHgwNjYpNZ5uBahfwsBv1UqkedILZZa0V7cnAYmG3rJ87UqkV1wsCgMSIN5dsLny4Ei/UScYkdesP
	y8ZnRGUQih30sLygk+cTzmnkOc7Pb4UL3zHPb1kQVPEAxmcW3K36kQBeF+roP6ssY92P/Q/9uxwSJ
	I/C2Yhmf8hzUAnRQr6srMol/2pYA5Sx7OATtmxPS77nDWmduRbqF+is6qZuB+E9k3rdR6XrE151No
	DLeiw9lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNX9e-0000000Bo1F-25E3;
	Mon, 24 Nov 2025 14:02:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNX9d-0000000Bo16-3khG;
	Mon, 24 Nov 2025 14:02:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0EE2760167;
	Mon, 24 Nov 2025 14:02:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF81CC116C6;
	Mon, 24 Nov 2025 14:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763992976;
	bh=a33jXfKWV+tqd3DAXr4TASNxV2asp4jDlbK8KxdNQOQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e/hgYIy5IZoVv36JC+jRAqpdwANOi0RBMs4xIVOj7TdREitlfpOcNyp1ih6Wu+6o+
	 2Q/Cq8TiwmjUPhTdVruO8tJx7Oo4SKI30Ev7qqnSXz8tGpSumZU/E8QiYk+RFrOpyd
	 oXf/14nxkqp/kLTv4peMcyYcOdSH4bLmJnmbtspZdvLnO1CzdgnDG63+PeWfdDbjY6
	 D1/h34qRh0R4eVmBZwB8iY/7rCk/m2b48OA04YV2AnVQ4Y8fo4lxElUQnKQOfmgBS9
	 ORMBPLITDD4RodCl94oRW4fD5Syw1ax/SOHg7e2RHCr+EJJU6C3QMhogwIJ9kfYsdS
	 eyryjhyrdkoOw==
Date: Mon, 24 Nov 2025 15:02:51 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/6] PCI: dwc: Revert Link Up IRQ support
Message-ID: <aSRli_Mb6qoQ9TZO@ryzen>
References: <20251111105100.869997-8-cassel@kernel.org>
 <mt7miqkipr4dvxemftq6octxqzauueln252ncrcwy6i2t7wfhi@jtwokeilhwsi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mt7miqkipr4dvxemftq6octxqzauueln252ncrcwy6i2t7wfhi@jtwokeilhwsi>
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

On Mon, Nov 24, 2025 at 06:07:44PM +0530, Manivannan Sadhasivam wrote:
> While I suggested to revert the link up IRQ patch for rockchip earlier, I didn't
> expect to drop the support for Qcom. The reason is, on Qcom SoCs, we have not
> seen a case where people connect a random PCIe switch and saw failures. Most of
> the Qcom usecases were around the M.2 and other proprietary connectors. There is
> only one in-house PCIe switch that is being actively used in our products, but
> so far, none of the bootloaders have turned them ON before kernel booting. So
> kernel relies on the newly merged pwrctrl driver to do the job. Even though it
> also suffers from the same resource allocation issue, this series won't help in
> any way as pwrctrl core performs rescan after the switch power ON, and by that
> time, it will be very late anyway.
> 
> So I'm happy to take the rockhip patches from this series as they fix the real
> issue that people have reported. But once the pwrctrl rework series gets merged,
> and the rockchip drivers support them, we can bring back the reverted changes.

FUKAUMI Naoki, just to confirm:

Neither my suggested approach:
https://lore.kernel.org/linux-pci/aRHdeVCY3rRmxe80@ryzen/

nor Shawn's suggested approach:
https://lore.kernel.org/linux-pci/dc932773-af5b-4af7-a0d0-8cc72dfbd3c7@rock-chips.com/

worked for you?


If so, I don't see many alternative but for Mani to apply patch 1 and
patch 2 from this series.


Kind regards,
Niklas

