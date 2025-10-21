Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A535CCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 02:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNzc+bvZs3sRdIL+AA61mIkqDJONWoplDpxlP/4tg/w=; b=jWQcts0bKegmaMRUSm7hCRFhH5
	vRuEUyCv/sBa5kGeR29YFSnf576Y1jO5VnUA5JNTbP33o+7cIXjycsiUAG56GCZmadoyKEPd/dSE1
	c30vQ2a70zRTZggrStIb4/vHeKW+0y/gpm4D68H9CBaOqq2arH1qAxrDWLlIFsFM4eJBkXx2PxW2/
	iddZ6JdXe+21+qJvHSnfWBYsooqPjqFEObMcrpBik96bpoqh8V2obLI7395wJVWRG7ypdj8tOPMAq
	x32NYr33Z53y9Kzm5vpO2M2AFJTDigXlwVTnbAdCOGBURSV9QMB4B84k2PHgkFV56RxcfD4SeVMs0
	5wEFctCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB2Dt-0000000Faob-1s22;
	Tue, 21 Oct 2025 02:35:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB2Dp-0000000Fanr-0TOl;
	Tue, 21 Oct 2025 02:35:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 991A545721;
	Tue, 21 Oct 2025 02:35:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691F2C4CEFB;
	Tue, 21 Oct 2025 02:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761014122;
	bh=fcgYpZ04ddq603NytX9c8WGJNEs2JUuEfL+syo1Wfkw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=toPnH5Bh/mJooxw8Zd4IHJQTKNx85c+y4kWxyErwQ8ab3hBK524Q3Zpm7pHeGA2Ay
	 sg6r+9K0OI2Uqp8pl8wXtB95OmdCY2kg4jRvjeOYEo0ZUdBhPFhuzT9RA/fa6fbZg8
	 6snyZsBUyJbmIHnvP2JECE5OwjKrukliYoEV/AlbZDmSudzsY8YrpNyA95Y6Xsi2Pm
	 HMd8w9AbKRHC2gcJ420CRjPRfgH7D2PR6UDUceC0wJYRwXsNMala0cnUsheMLDLGJO
	 ifxY5RWfqWaOS7L1mTkkz1EBfpmtInGtT8kznuH/eTxzeimTeT7y2ZtGs/6P/LWHrs
	 OR1xI9Jp5UD9w==
From: Manivannan Sadhasivam <mani@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Heiko Stuebner <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>, 
 Kever Yang <kever.yang@rock-chips.com>, Simon Xue <xxm@rock-chips.com>, 
 Niklas Cassel <cassel@kernel.org>
Cc: Damien Le Moal <dlemoal@kernel.org>, Dragan Simic <dsimic@manjaro.org>, 
 FUKAUMI Naoki <naoki@radxa.com>, Diederik de Haas <diederik@cknow-tech.com>, 
 stable@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
In-Reply-To: <20251017163252.598812-2-cassel@kernel.org>
References: <20251017163252.598812-2-cassel@kernel.org>
Subject: Re: [PATCH v3] PCI: dw-rockchip: Prevent advertising L1 Substates
 support
Message-Id: <176101411705.9573.17573145190800888773.b4-ty@kernel.org>
Date: Tue, 21 Oct 2025 08:05:17 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_193537_186306_7C826E30 
X-CRM114-Status: UNSURE (   8.29  )
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


On Fri, 17 Oct 2025 18:32:53 +0200, Niklas Cassel wrote:
> The L1 substates support requires additional steps to work, namely:
> -Proper handling of the CLKREQ# sideband signal. (It is mostly handled by
>  hardware, but software still needs to set the clkreq fields in the
>  PCIE_CLIENT_POWER_CON register to match the hardware implementation.)
> -Program the frequency of the aux clock into the
>  DSP_PCIE_PL_AUX_CLK_FREQ_OFF register. (During L1 substates the core_clk
>  is turned off and the aux_clk is used instead.)
> 
> [...]

Applied, thanks!

[1/1] PCI: dw-rockchip: Prevent advertising L1 Substates support
      commit: 40331c63e7901a2cc75ce6b5d24d50601efb833d

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


