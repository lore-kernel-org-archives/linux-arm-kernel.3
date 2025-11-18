Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01D72CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 00:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FeV+cp/B6o4d554Dl89hs7gOjhWAAS0EpuPZa0xZZIE=; b=i/itFEuOnk25rmQrRcLObHhDAH
	C2Hfvh1eQenTaaJf1vLf/CV0/NEEUjwpJac4A2RTpOT9Dv+/hpDyif52Fnl/Yekqma207SNheXu7+
	Yhym6RWwOOlonqW6keS1bopeSRn8ULA5aWfLGOEvTKD7QK7FDAcXPbEqyr0bsSs4IK8BqsxqDMtcm
	hNBTWCmPmvJJTjqknOyGdY5Mt36NnWM4kqFJQB7xZw6v+oDjldca051lRzbV7RoZyx3Tj0Cb+lvVg
	mKn2n311bFRNXSmnHzL6W7PImw+TpB0Pi2dXO5Zm6U2t3XXTVECWra5tEbQ+oXj9Yf3h5hvEamP+f
	9JqoHS2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9p6-0000000H3Ow-2BiY;
	Tue, 18 Nov 2025 00:43:56 +0000
Received: from mail-m49220.qiye.163.com ([45.254.49.220])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9p2-0000000H3OM-2iDn;
	Tue, 18 Nov 2025 00:43:54 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 29e80519c;
	Tue, 18 Nov 2025 08:43:45 +0800 (GMT+08:00)
Message-ID: <7e050003-f4ea-4e89-8140-2159c670182f@rock-chips.com>
Date: Tue, 18 Nov 2025 08:43:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, linux-rockchip@lists.infradead.org,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Johan Jonker <jbx6244@gmail.com>,
 Dragan Simic <dsimic@manjaro.org>
Subject: Re: [PATCH v2 0/4] PCI: rockchip: 5.0 GT/s speed may be dangerous
To: Geraldo Nascimento <geraldogabriel@gmail.com>
References: <cover.1763415705.git.geraldogabriel@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <cover.1763415705.git.geraldogabriel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a946ae62e09cckunm57c232373f288
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkoZTlYYSB9CQ09PSBpLQk1WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=XlUMvPhbm3JQYF08zp7VfmtLoI5CPW40rJWIiWOOwW22Ofn4z9LH7QdQi8T8myJpAPlIZIntJgPnt1spqSnFcr6eoDbDWvCwxPzUOrQ3kJaJ034g0Zf/jWLilCXnSDKY0tJHyBdOPp2o9qilFekScxRVIefPavvgVb3hbrAi/lI=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=FeV+cp/B6o4d554Dl89hs7gOjhWAAS0EpuPZa0xZZIE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_164353_172640_C251AE76 
X-CRM114-Status: GOOD (  13.21  )
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

在 2025/11/18 星期二 5:46, Geraldo Nascimento 写道:
> Dragan Simic already had warned me of potential issues with 5.0 GT/s
> speed operation in Rockchip PCIe. However, in recent interactions
> with Shawn Lin from Rockchip it came to my attention there's grave
> danger in the unknown errata regarding 5.0 GT/s operational speed
> of their PCIe core. Even if the odds are low, to contain any damage,
> let's cover the remaining corner-cases where the default would lead
> to 5.0 GT/s operation as well as add a comment to Root Complex driver
> core, documenting this danger. Furthermore, remove redundant
> declaration of max-link-speed from rk3399-nanopi-r4s.dtsi
> 
> Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> 

Thanks for fixing these.

Acked-by: Shawn Lin <shawn.lin@rock-chips.com>

> ---
> 
> Changes in v2:
> - hard limit to 2.5 GT/s, not just warn
> - add Reported-by: and Reviewed-by: Dragan Simic
> - remove redundant declaration of max-link-speed from helios64 dts
> - fix Link: of helios64 patch
> - simplify RC mode comment
> - Link to v1: https://lore.kernel.org/all/aRhR79u5BPtRRFw3@geday/
> 
> Geraldo Nascimento (4):
>    PCI: rockchip: limit RK3399 to 2.5 GT/s to prevent damage
>    PCI: rockchip-host: comment danger of 5.0 GT/s speed
>    arm64: dts: rockchip: remove dangerous max-link-speed from helios64
>    arm64: dts: rockchip: remove redundant max-link-speed from nanopi-r4s
> 
>   arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts |  1 -
>   arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi    |  1 -
>   drivers/pci/controller/pcie-rockchip-host.c            |  3 +++
>   drivers/pci/controller/pcie-rockchip.c                 | 10 ++++++++--
>   4 files changed, 11 insertions(+), 4 deletions(-)
> 


