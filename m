Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 583CFC7115D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=82PBFjzJxadblYHMtO/5DNUVab4uZMm9S980qpWl8yE=; b=zcpFvfId82xoULDWOTmWqHA5Rm
	G885ajnEwyH8CSPQLoGwF36pvciv3Hdt8vhdWK0kLh15vhs/0KjjET1WtywQz83fUnZncqKZYld9c
	chOYw5eOAMuOY2jNNo4AN6gqxsH9XfWTDuGtZqMxeP78gnQIXrC1nmFeEdTjnP2SttVXBJO7JnfaT
	GGeD3LsJskXPXb0y6183JYPLPjbXOn6p/4E7Q0myEdyrk6e+6M1fM10/MZvaOjQ618FP8jDFVNnzQ
	cwql9DdfybM50BGH4ijgqe2zgzFZ8DLgpH+oOgwCP38TxijWa4IA64ZtjGNfkP2gXZUmIRkmn4gOc
	/VqptJWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHUw-0000000DWmF-11Pw;
	Thu, 19 Jun 2025 15:48:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEeB-0000000D5gF-0XRq;
	Thu, 19 Jun 2025 12:45:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4E8736115D;
	Thu, 19 Jun 2025 12:45:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7822AC4CEEA;
	Thu, 19 Jun 2025 12:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750337138;
	bh=KNqb7eHKDRfrbzB+nYR6iggc29bY0RRO9LiF69GOYI8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iwYq1A2fmSqsQaRBsaydPOG21gcTZCtQd7cYOYCEGO+WYBLtTuJT/9uNfzsZ+9Vps
	 uRYjx7+K7cWyyYCYOX7eUU4RfG2XNfDlCo6xWjQ7PYuRl/PzOJXe6nvvBDtX/uim+B
	 S++kc8EQVH9INpuVvcdjMfHmT4svUZZczCZtatRH2PfF9UihMu6fU14qbAlXLb1Mpv
	 +dGKfzMHYSWmGMR49wGjHkrOzbB14t3DjHD8EsCMEcJlsBD4d23TFosFIDV/Tlv4pf
	 VUf6hio6bIfjEW3X23Gwmg3ePGgwhy3m5ko6QI5XDep/RFn6Qpjf0pzXz0kY1PaAl4
	 8Snes676Vd6wg==
Date: Thu, 19 Jun 2025 18:15:20 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: Niklas Cassel <cassel@kernel.org>, lpieralisi@kernel.org, kw@linux.com, 
	bhelgaas@google.com, heiko@sntech.de, manivannan.sadhasivam@linaro.org, 
	yue.wang@amlogic.com, pali@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, 
	jingoohan1@gmail.com, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 1/2] PCI: Configure root port MPS during host probing
Message-ID: <rjgmkdk33h64plssiw2euna3wo4ejw4t3gisqkt3ibco62vjin@w2yu6wnzwled>
References: <20250510155607.390687-1-18255117159@163.com>
 <20250510155607.390687-2-18255117159@163.com>
 <co2q55j4mk2ux7af4sj6snnfomditwizg5jevg6oilo3luby5z@6beqtbn3l432>
 <aEwRAZgLJUECbGz6@ryzen>
 <1e3ba7e1-dad3-4728-85d2-276945119ab0@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e3ba7e1-dad3-4728-85d2-276945119ab0@163.com>
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

On Fri, Jun 13, 2025 at 11:31:01PM +0800, Hans Zhang wrote:
> 
> 
> On 2025/6/13 19:52, Niklas Cassel wrote:
> > On Fri, Jun 13, 2025 at 12:08:31PM +0530, Manivannan Sadhasivam wrote:
> > > On Sat, May 10, 2025 at 11:56:06PM +0800, Hans Zhang wrote:
> > > > Current PCIe initialization logic may leave root ports operating with
> > > > non-optimal Maximum Payload Size (MPS) settings. While downstream device
> > > > configuration is handled during bus enumeration, root port MPS values
> > > > inherited from firmware or hardware defaults might not utilize the full
> > > > capabilities supported by the controller hardware. This can result is
> > > > uboptimal data transfer efficiency across the PCIe hierarchy.
> > > > 
> > > > During host controller probing phase, when PCIe bus tuning is enabled,
> > > > the implementation now configures root port MPS settings to their
> > > > hardware-supported maximum values. By iterating through bridge devices
> > > > under the root bus and identifying PCIe root ports, each port's MPS is
> > > > set to 128 << pcie_mpss to match the device's maximum supported payload
> > > > size.
> > > 
> > > I don't think the above statement is accurate. This patch is not iterating
> > > through the bridges and you cannot identify root ports using that. What this
> > > patch does is, it checks whether the device is root port or not and if it is,
> > > then it sets the MPS to MPSS (hw maximum) if PCIE_BUS_TUNE_OFF is not set.
> > 
> > Correct.
> > Later, when the bus is walked, if any downstream device does not support
> > the MPS value currently configured in the root port, pci_configure_mps()
> > will reduce the MPS in the root port to the max supported by the downstream
> > device.
> > 
> > So even we start off by setting MPS in the root port to the max supported
> > by the root port, it might get reduced later on.
> > 
> > 
> 
> Dear Mani and Niklas,
> 
> Is it okay to modify the commit message as follows? The last paragraph
> remains unchanged.
> 
> 
> 
> Current PCIe initialization logic may leave root ports operating with
> non-optimal Maximum Payload Size (MPS) settings. While downstream device
> configuration is handled during bus enumeration, root port MPS values
> inherited from firmware or hardware defaults might not utilize the full
> capabilities supported by the controller hardware. This can result in
> suboptimal data transfer efficiency across the PCIe hierarchy.
> 
> During host controller probing phase, when PCIe bus tuning is enabled,
> the implementation now configures root port MPS settings to their
> hardware-supported maximum values. Specifically, when configuring the MPS
> for a PCIe device, if the device is a root port and the bus tuning is not
> disabled (PCIE_BUS_TUNE_OFF), the MPS is set to 128 << dev->pcie_mpss to
> match the device's maximum supported payload size. The Max Read Request

s/device/Root Port

> Size (MRRS) is subsequently adjusted through existing companion logic to
> maintain compatibility with PCIe specifications.
> 
> Note that this initial setting of the root port MPS to the maximum might
> be reduced later during the enumeration of downstream devices if any of
> those devices do not support the maximum MPS of the root port.
> 

Rest LGTM!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

