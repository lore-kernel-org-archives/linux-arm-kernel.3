Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F9DC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 14:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yxPA23HdKeyxkAUYpeecStgTTV+hlIZsZuM1LzpeJmg=; b=2LJQVycTvEjfCPeubsrIirdnW2
	12m/oNMqvKPzIU8zr9BcuiU4FUk2w9TeXbhJfWl0zWm8NR2UubqRiKcgAVwqSvP6a6ujCPExrZJaD
	Jc1/U+zM4xTpj848c5txVAkn8hSqaj6wsmYWJJCmrSLAIhZG4148kfCsV8HsJpAOy4asEMe0aDjdI
	K+ZUtmJJVZTtzOzt3ndQD5jbwswlmFv+yMwpeuZU4wt0e8NyV2wK7K99kM0Bh9yvdSfeJdUF2lwH3
	II37ttX0NgzoalQH3wuiNipCztJ1X9/TA3IeZZdoeSKOvJcWFTCyhUTCSUh5Adl0RcPuVPBKTHvd0
	KbsJqDRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqJr-0000000CZnP-2Pmk;
	Tue, 13 May 2025 14:09:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqHk-0000000CZZX-2b5U;
	Tue, 13 May 2025 14:07:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 39DFC44E6B;
	Tue, 13 May 2025 14:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8CFAC4CEE4;
	Tue, 13 May 2025 14:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747145228;
	bh=14NlYj/WRG8Q0M9cGAjhUlbL7est4+1nXlxlO/Sw13M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jfyJWelTw2cvqNxTtFvNddGoQgPxSGnXDfgHyD7S1pRovdUiRF/RrEDtGkMMA9DqR
	 0pE2hIGsEcSog39LlatonEh8jFUsdkLIxu4cn3qQWN8jdpdH+481B3gyvxHJ2M/Xf6
	 XY2cAVg4GaVUqm6IJ9V7w+Sg0ZtJLI/1ftHViBLYDwssJ/39DCw04qoWn3jykvHra8
	 MzaSWCbobCvW2ZSYrVFLa53JUcsFuME2YlaZnGxvVNNYGY4EI2eounHeNcqtryUUOG
	 UniSDHJRyX0NXHUCd4pd5M56pd+FakfGKY+FviDSDrJAR4WiPWyMFcLqT+CBTYYkww
	 JzhK9J0WfRCPA==
Date: Tue, 13 May 2025 16:07:02 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Krishna chaitanya chundru <quic_krichai@quicinc.com>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Laszlo Fiat <laszlo.fiat@proton.me>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 0/4] PCI: dwc: Link Up IRQ fixes
Message-ID: <aCNSBqWM-HM2vX7K@ryzen>
References: <20250506073934.433176-6-cassel@kernel.org>
 <7zcrjlv5aobb22q5tyexca236gnly6aqhmidx6yri6j7wowteh@mylkqbwehak7>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7zcrjlv5aobb22q5tyexca236gnly6aqhmidx6yri6j7wowteh@mylkqbwehak7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_070708_715635_89A17DA5 
X-CRM114-Status: GOOD (  23.46  )
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

Hello Mani,

On Tue, May 13, 2025 at 11:53:29AM +0100, Manivannan Sadhasivam wrote:
> 
> This wait time is a grey area in the spec tbh. If the Readiness Notification
> (RN) is not supported, then the spec suggests waiting 1s for the device to
> become 'configuration ready'. That's why we have the 1s delay in dwc driver.
> 
> Also, it has the below in r6.0, sec 6.6.1:
> 
> ```
> * On the completion of Link Training (entering the DL_Active state, see §
> Section 3.2 ), a component must be able to receive and process TLPs and DLLPs.
> * Following exit from a Conventional Reset of a device, within 1.0 s the device
> must be able to receive a Configuration Request and return a Successful
> Completion if the Request is valid. This period is independent of how quickly
> Link training completes. If Readiness Notifications mechanisms are used (see
> § Section 6.22 .), this period may be shorter.
> ```
> 
> As per the first note, once link training is completed, the device should be
> ready to accept configuration requests from the host. So no delay should be
> required.
> 
> But the second note says that the 1s delay is independent of how quickly the
> link training completes. This essentially contradicts with the above point.
> 
> So I think it is not required to add delay after completing the LTSSM, unless
> someone sees any issue.

If you look at the commit message in patch 1/2, the whole reason for this
series is that someone has seen an issue :)

While I personally haven't seen any issue, the user reporting that commit
ec9fd499b9c6 ("PCI: dw-rockchip: Don't wait for link since we can detect
Link Up") regressed his system so that it can no longer mount rootfs
(which is on a PLEXTOR PX-256M8PeGN NVMe SSD) clearly has seen an issue.

It is possible that his device is not following the spec.
I simply compared the code before and after ec9fd499b9c6, to try to
figure out why it was actually working before, and came up with this,
which made his device functional again.

Perhaps we should add a comment above the sleep that says that this
should strictly not be needed as per the spec?
(And also add the same comment in the (single) controller driver in
mainline which already does an msleep(PCIE_T_RRS_READY_MS).)


Kind regards,
Niklas

