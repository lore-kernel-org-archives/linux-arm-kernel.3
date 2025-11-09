Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3992DCD13D2
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 12:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lix5OQ2dL+UYyCURX/GsF7O2n8lCZHASkXV3hJRe4MQ=; b=yOXUQCsxEiAu/mFhazfsIl4yli
	kp/IUN7PZi9mR+883SVVFVcILK14D3+ovyz+y2XOytn1TafmZpJweRJAvuU1VQdwfpeuedFPV53Kb
	Q/Bc+KOwyAKgM7JA0Zt2eG9hYiUwunLEZtYzLdX3O1P5pkDMujQ895/F9NSyDf3H0hJU9CipJqcep
	JTUP9JMM/shht/hB3dqiRAlw8BLTo905qudo/LVamo+U7ZearmL62IAW1dGUlmhURgr41S/H1po+O
	GubMuF+85GoebMScNIThHruieArJ9pFwOHJM/nQy8qge57ugSHFn0QzcF+zJxa7GvTeSWqq5wQua9
	gH2IIh9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI4X2-00000003zv9-0gQ4;
	Sun, 09 Nov 2025 12:28:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI4Wy-00000003zud-38ca;
	Sun, 09 Nov 2025 12:28:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 125C64182B;
	Sun,  9 Nov 2025 12:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E41ABC4CEF8;
	Sun,  9 Nov 2025 12:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762691307;
	bh=9+deIiz/07lRUWttLH1XL6KToavdGNMSxgLPjvkZhJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hurIJbO4oHCGlhmRNAgt+fgtD84571YdTIU65SqQLikCy0YK6bGSG7HxhBNlSk9aS
	 PALZVZ02wZOtd9kZLJqpdvYHJZ/HSYktjSKv08/JU4tlGx8jIssFmNBzs4yu2IGtJU
	 0YxNi2u0zPftBTq/zVxWk45vug4/C5PHWgNZJRuErdgmGm9yisSh6mwc0bA40SRXas
	 FbTqSGCiqroy0yC+wm+BmvTih4g6V/tnUB0rYJShev3QE87VQusnlGoMuV7RlUvqbg
	 CkslesMC7ljHB7f7iAID75aBnIQP3T9N/4s6Ty0pftu6RB/9GGpUUvhN9L9fBqEL/h
	 wvgFouCpUPSUg==
Date: Sun, 9 Nov 2025 13:28:22 +0100
From: Niklas Cassel <cassel@kernel.org>
To: FUKAUMI Naoki <naoki@radxa.com>
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Anand Moon <linux.amoon@gmail.com>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Dragan Simic <dsimic@manjaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] PCI: dw-rockchip: Skip waiting for link up
Message-ID: <aRCI5kG16_1erMME@ryzen>
References: <20250113-rockchip-no-wait-v1-1-25417f37b92f@kernel.org>
 <1E8E4DB773970CB5+5a52c9e1-01b8-4872-99b7-021099f04031@radxa.com>
 <6e87b611-13ea-4d89-8dbf-85510dd86fa6@rock-chips.com>
 <aQ840q5BxNS1eIai@ryzen>
 <aQ9FWEuW47L8YOxC@ryzen>
 <55EB0E5F655F3AFC+136b89fd-98d4-42af-a99d-a0bb05cc93f3@radxa.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55EB0E5F655F3AFC+136b89fd-98d4-42af-a99d-a0bb05cc93f3@radxa.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_042828_828954_584AA7E5 
X-CRM114-Status: GOOD (  15.96  )
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

On Sun, Nov 09, 2025 at 01:42:23PM +0900, FUKAUMI Naoki wrote:
> Hi Niklas,
> 
> On 11/8/25 22:27, Niklas Cassel wrote:
> (snip)> (And btw. please test with the latest 6.18-rc, as, from experience,
> the
> > ASPM problems in earlier RCs can result in some weird problems that are
> > not immediately deduced to be caused by the ASPM enablement.)
> 
> Here is dmesg from v6.18-rc4:
>  https://gist.github.com/RadxaNaoki/40e1d049bff4f1d2d4773a5ba0ed9dff

Same problem as before:
[    1.732538] pci_bus 0004:43: busn_res: can not insert [bus 43-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
[    1.732645] pci_bus 0004:43: busn_res: [bus 43-41] end is updated to 43
[    1.732651] pci_bus 0004:43: busn_res: can not insert [bus 43] under [bus 42-41] (conflicts with (null) [bus 42-41])
[    1.732661] pci 0004:42:00.0: devices behind bridge are unusable because [bus 43] cannot be assigned for them
[    1.732840] pci_bus 0004:44: busn_res: can not insert [bus 44-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
[    1.732947] pci_bus 0004:44: busn_res: [bus 44-41] end is updated to 44
[    1.732952] pci_bus 0004:44: busn_res: can not insert [bus 44] under [bus 42-41] (conflicts with (null) [bus 42-41])
[    1.732962] pci 0004:42:02.0: devices behind bridge are unusable because [bus 44] cannot be assigned for them
[    1.733134] pci_bus 0004:45: busn_res: can not insert [bus 45-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
[    1.733246] pci_bus 0004:45: busn_res: [bus 45-41] end is updated to 45
[    1.733255] pci_bus 0004:45: busn_res: can not insert [bus 45] under [bus 42-41] (conflicts with (null) [bus 42-41])
[    1.733266] pci 0004:42:06.0: devices behind bridge are unusable because [bus 45] cannot be assigned for them
[    1.733438] pci_bus 0004:46: busn_res: can not insert [bus 46-41] under [bus 42-41] (conflicts with (null) [bus 42-41])
[    1.733544] pci_bus 0004:46: busn_res: [bus 46-41] end is updated to 46
[    1.733550] pci_bus 0004:46: busn_res: can not insert [bus 46] under [bus 42-41] (conflicts with (null) [bus 42-41])
[    1.733560] pci 0004:42:0e.0: devices behind bridge are unusable because [bus 46] cannot be assigned for them
[    1.733571] pci_bus 0004:42: busn_res: [bus 42-41] end is updated to 46
[    1.733575] pci_bus 0004:42: busn_res: can not insert [bus 42-46] under [bus 41] (conflicts with (null) [bus 41])
[    1.733585] pci 0004:41:00.0: devices behind bridge are unusable because [bus 42-46] cannot be assigned for them
[    1.733596] pcieport 0004:40:00.0: bridge has subordinate 41 but max busn 46


Seems like the ASM2806 switch, for some reason, is not ready.

One change that Diederik pointed out is that in the "good" case,
the link is always in Gen1 speed.

Perhaps you could build with CONFIG_PCI_QUIRKS=y and try this patch:

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 214ed060ca1b..ac134d95a97f 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -96,6 +96,7 @@ int pcie_failed_link_retrain(struct pci_dev *dev)
 {
 	static const struct pci_device_id ids[] = {
 		{ PCI_VDEVICE(ASMEDIA, 0x2824) }, /* ASMedia ASM2824 */
+		{ PCI_VDEVICE(ASMEDIA, 0x2806) }, /* ASMedia ASM2806 */
 		{}
 	};
 	u16 lnksta, lnkctl2;





If that does not work, perhaps you could try this patch
(assuming that all Rock 5C:s have a ASM2806 on pcie2x1l2):

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
index dd7317bab613..26f8539d934a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts
@@ -452,6 +452,7 @@ &pcie2x1l2 {
 	pinctrl-0 = <&pcie20x1_2_perstn_m0>;
 	reset-gpios = <&gpio3 RK_PD1 GPIO_ACTIVE_HIGH>;
 	vpcie3v3-supply = <&pcie2x1l2_3v3>;
+	max-link-speed = <1>;
 	status = "okay";
 };



Kind regards,
Niklas

