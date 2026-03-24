Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233ABF54AB8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 14:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ww+ZGhI/Uqc0K2/aA38XderreD2JnahJtlmb0Hc4YIk=; b=c3gEnHCPkKDo9s9L0wfhGzYMm/
	HcdTOBdqKaVJ/qDZHCCz1PvJOExFY2TMd5JzBQPSEtdaKCKr4SsYRR4DCJUNqNlRYeZgTsY0LkQCc
	y5ERzOG7KDc7n/SAWbWmINBjI6CTHDj8ZSFAhWaamWSctwTfK9EdaZPCCwG9JbQOIvSELXlNqfOVt
	0fJpzykbf1z2GFYw60325N6S5kb3rYpQSCK7aduOmvhP+YNJWPgN0M58Tmz99XxkTYUs+ItKJBEd0
	B3ikQ/zowIRJGnYcpAtjvPmcJGoMNLYJNMzluTpD6q2SVP9q4saaU0Cr4nYzPnsVVYBTqpBCPeneB
	GHwZbOaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52JD-00000001bMO-2Riq;
	Tue, 24 Mar 2026 14:00:39 +0000
Received: from mail-m3274.qiye.163.com ([220.197.32.74])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w52J9-00000001bLt-3Bb8;
	Tue, 24 Mar 2026 14:00:38 +0000
Received: from [172.16.12.17] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 381f00f43;
	Tue, 24 Mar 2026 22:00:29 +0800 (GMT+08:00)
Message-ID: <d07bf937-a8ad-ab89-77b2-c7d36e7952c9@rock-chips.com>
Date: Tue, 24 Mar 2026 22:00:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Cc: shawn.lin@rock-chips.com, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v5 0/8] PCI: dw-rockchip: add system suspend support
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jingoo Han <jingoohan1@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20260316-rockchip-pcie-system-suspend-v5-0-5bb5ad37d643@collabora.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260316-rockchip-pcie-system-suspend-v5-0-5bb5ad37d643@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9d20259e8509cckunm0506812da07ed8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx5LHlYYTh5MSx0ZHk5KGh5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=A7jow+OcXPe6+3lVdI75AnVPX8bYWhd/Ml/hAp9K5JVbBep9ABaOaA+p4RzMcGlnjltuy+SRQGlS1EmtnIetkLMvfbtPvNS/9WaPjCpAadWHsuNrHUke1H4z0hunjp1ARKF6PHFswR5r7TcoPcKRd/XO4UNIsBzOyjHiDvbhz4E=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=Ww+ZGhI/Uqc0K2/aA38XderreD2JnahJtlmb0Hc4YIk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_070036_365625_1B9F46E5 
X-CRM114-Status: GOOD (  24.66  )
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

Hi Sebastian

在 2026/03/17 星期二 3:10, Sebastian Reichel 写道:
> I've recently been working on fixing up at least basic system suspend
> support on the Rockchip RK3576 platform. The last open issue is missing
> support in the PCIe driver. This series is a follow-up for Shawn Lin's
> series with feedback from Niklas Cassel and Manivannan Sadhasivam being
> handled as well as some of my own changes fixing up things I noticed.
> 
> In opposite to Shawn Lin I did not test with different peripherals as my
> main goal is getting basic suspend to ram working in the first place. I
> did notice issues with the Broadcom WLAN card on the RK3576 EVB.
> Suspending that platform without a driver being probed works, but after
> probing brcmfmac suspend is aborted because brcmf_pcie_pm_enter_D3()
> does not work. As far as I can tell the problem is unrelated to the
> Rockchip PCIe driver.

Thanks for the patchset. It doesn't cleanly apply to new -rc now so I
assume it need a rebase. Anyway, I amended this series to apply them
to -rc5 and tested them on several platforms, it works fine.

However, I think patch 7 actually put the host and device into D3cold
unconditionly, with reset the controller，power-off 3v3 and deassert
perst# which doesn't follow NVMe's requirement at least.

Krishna is working on it [1], it would be better to follow the same
patten.

[1] 
https://lore.kernel.org/all/20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com/

> 
> Changes since PATCHv4:
>   * https://lore.kernel.org/r/20251029-rockchip-pcie-system-suspend-v4-0-ce2e1b0692d2@collabora.com
>   * rebase to v7.0-rc1
>   * Add an RFC patch at the end with some bits I found in the Rockchip vendor kernel;
>   * Made some tests on Rock 5B+ (RK3588); with this patch series suspending works
>     when setting pm_test to devices. A full system suspend fails in a later step,
>     but that is independent of PCIe.
> 
> Changes since PATCHv3:
>   * https://lore.kernel.org/linux-pci/1744940759-23823-1-git-send-email-shawn.lin@rock-chips.com/
>   * rename rockchip_pcie_get_ltssm to rockchip_pcie_get_ltssm_status_reg
>     in a separate patch (Niklas Cassel)
>   * rename rockchip_pcie_get_pure_ltssm to rockchip_pcie_get_ltssm_state
>     in a separate patch (Niklas Cassel)
>   * Move devm_phy_get out of phy_init to probe in a separate patch
>     (Manivannan Sadhasivam)
>   * Add helper function for enhanced LTSSM control mode in a separate patch
>     (Niklas Cassel)
>   * Add helper function for controller mode in a separate patch
>     (Niklas Cassel)
>   * Add helper function for DDL indicator in a separate patch
>     (Niklas Cassel)
>   * Move rockchip_pcie_pme_turn_off implementation in a separate patch
>   * Rebase to v6.18-rc3 using new FIELD_PREP_WM16()
>   * Improve readability of PME_TURN_OFF/PME_TO_ACK defines (Manivannan Sadhasivam)
>   * Fix usage of reverse Xmas (Manivannan Sadhasivam)
>   * Assert PERST# before turning off other resources (Manivannan Sadhasivam)
>   * Improve some error messages (Manivannan Sadhasivam)
>   * Rename goto labels as per their purpose (Manivannan Sadhasivam)
>   * Add extra patch for dw_pcie_resume_noirq, since I've seen errors
>     during resume on boards not having anything plugged into their PCIe
>     port
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
> Sebastian Reichel (8):
>        PCI: dw-rockchip: Restore vpcie3v3 regulator handle
>        PCI: dw-rockchip: Move devm_phy_get out of phy_init
>        PCI: dw-rockchip: Add helper function for enhanced LTSSM control mode
>        PCI: dw-rockchip: Add helper function for controller mode
>        PCI: dw-rockchip: Add helper function for DDL indicator
>        PCI: dw-rockchip: Add pme_turn_off support
>        PCI: dw-rockchip: Add system PM support
>        [RFC] PCI: dw-rockchip: port some suspend code from vendor kernel
> 
>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 242 ++++++++++++++++++++++----
>   1 file changed, 206 insertions(+), 36 deletions(-)
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20251028-rockchip-pcie-system-suspend-86cf08a7b229
> 
> Best regards,

