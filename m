Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15A49E6F063
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 15:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=b6UJYXV9+k4ACdSuwQwR+p+e80s+hiAJs+JIBhod+Tk=; b=nmEEAiHyPCxpyO
	9GPbAhvmznVObAELvQ3oev2YyUBI/gg1I/Ov06kqX2iuBex1Hdwy0+5hpZaI62Auhj4+4rEnUdoDi
	z3YtHaYqfysZwqhS6fp2F7A1o8hUr6wmPsWGNNf90elc8eB13Ts0pW7NirR4IEsCPK6BQD1G1k1m5
	yAYsUjjHbtGP+Y5XCliPKMIa547Ygzv63wSctQ/h43S2qqouSUKZTgMNn/6+JGcpF1JcqJG4oQ+3B
	lRRPMprGkMqyi4oMlkURTG10EU1udXv3+6MB6fwVERzacWWldFORP//skKkXMgaOgUbGUlYsw+1yj
	a+CT0j+SgBvKfNk1VtRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6t9H-00000007QwH-2Sh5;
	Fri, 01 Nov 2024 15:01:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s4Y-00000007Elp-2o1u;
	Fri, 01 Nov 2024 13:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:References;
	bh=b6UJYXV9+k4ACdSuwQwR+p+e80s+hiAJs+JIBhod+Tk=; b=pgKWv9Cf81vRcMg1GRniFUZQAk
	pt1BlErw/VKWnm/wvXLGw98p57UF2lX1RHt5xInQMmwkIJjcaUiPFT91O0Do7V+MTlZm1r/ln+710
	7ZkNpNV6VcOE7oM0DY6ne9jXyK0do85NIfcvv8bVsEvntahaxNJecwvMSdMLhV22ap2+1emPIW9Lg
	DLebLEZ0Znq9DzDSBm+WX2stfzl5LNtq6JD3yXFsJHlJ/Wj8cm6qeKSqXUMoKQp7tI8pd+Jdj1Ea9
	2XYsged/CUogs+nO1/nNMSdXP8x2QEq/NfsixmIJ/ZVvNKRWT/GrJTvu9c2X/YkRhIEasFGs99RnH
	8+37H1TQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s4V-0000000AhD3-00X5;
	Fri, 01 Nov 2024 13:52:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 45B865C6114;
	Thu, 31 Oct 2024 17:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A22B9C4CED0;
	Thu, 31 Oct 2024 17:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730394269;
	bh=76iIYi9r6xA6vX/KYVnYOqiJXABJE4PH5Kls9Mk0HhA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=U9Jh5sKjWEqDOVKayvj3wQwuDJJY8KF5B2A8ixi/Ps8E1ZDGak7rpwREw0Hb+frDS
	 9ErlaLmaNxrHr0/EEVzIcXx+jV/DePCv4pSxHHTKytCy15uxP7wX6XVwpxeqopCrUj
	 ngkwfhz44fe+2al5EplKqBqC++32wAzrr+McXt0gYqKkuJv92uZQ4tC2wQGEhGagb+
	 k8xASwiFxc4orbWOIuuOsS1wUwIziv7rSnBABK67Bm0GXmsnTSKCNJksCj708EctuW
	 +oWIBZSgtuMB1lraiAXVnN1COw6Uu3+fTDf4LEgJ37/HI5v1BVelKl25dR7iF6yaF/
	 vG940zFG7emDA==
Date: Thu, 31 Oct 2024 12:04:28 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jinjian Song <jinjian.song@fibocom.com>
Cc: ryazanov.s.a@gmail.com, chandrashekar.devegowda@intel.com,
	chiranjeevi.rapolu@linux.intel.com, haijun.liu@mediatek.com,
	m.chetan.kumar@linux.intel.com, ricardo.martinez@linux.intel.com,
	loic.poulain@linaro.org, johannes@sipsolutions.net,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, angelogioacchino.delregno@collabora.com,
	bhelgaas@google.com, corbet@lwn.net, danielwinkler@google.com,
	korneld@google.com, linasvepstas@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com, netdev@vger.kernel.org
Subject: Re: [net-next v2] net: wwan: t7xx: reset device if suspend fails
Message-ID: <20241031170428.GA1249507@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241031130930.5583-1-jinjian.song@fibocom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_135215_487509_8082812D 
X-CRM114-Status: GOOD (  43.76  )
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

On Thu, Oct 31, 2024 at 09:09:30PM +0800, Jinjian Song wrote:
> From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
> > On 29.10.2024 05:46, Jinjian Song wrote:
> > > From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
> > > > On 22.10.2024 11:43, Jinjian Song wrote:
> > > > > If driver fails to set the device to suspend, it means that the
> > > > > device is abnormal. In this case, reset the device to recover
> > > > > when PCIe device is offline.
> > > > 
> > > > Is it a reproducible or a speculative issue? Does the fix
> > > > recover modem from a problematic state?
> > > > 
> > > > Anyway we need someone more familiar with this hardware (Intel
> > > > or MediaTek engineer) to Ack the change to make sure we are not
> > > > going to put a system in a more complicated state.
> > > 
> > > This is a very difficult issue to replicate onece occured and fixed.
> > > 
> > > The issue occured when driver and device lost the connection. I have
> > > encountered this problem twice so far:
> > > 1. During suspend/resume stress test, there was a probabilistic D3L2
> > > time sequence issue with the BIOS, result in PCIe link down, driver
> > > read and write the register of device invalid, so suspend failed.
> > > This issue was eventually fixed in the BIOS and I was able to restore
> > > it through the reset module after reproducing the problem.
> > > 
> > > 2. During idle test, the modem probabilistic hang up, result in PCIe
> > > link down, driver read and write the register of device invalid, so
> > > suspend failed. This issue was eventually fiex in device modem firmware
> > > by adjust a certain power supply voltage, and reset modem as a workround
> > > to restore when the MBIM port command timeout in userspace applycations.
> > > 
> > > Hardware reset modem to recover was discussed with MTK, and they said
> > > that if we don't want to keep the on-site problem location in case of
> > > suspend failure, we can use the recover solution.
> > > Both the ocurred issues result in the PCIe link issue, driver can't
> > > read and writer the register of WWAN device, so I want to add this
> > > path
> > > to restore, hardware reset modem can recover modem, but using the
> > > pci_channle_offline() as the judgment is my inference.
> > 
> > Thank you for the clarification. Let me summarize what I've understood
> > from the explanation:
> > a) there were hardware (firmware) issues,
> > b) issues already were solved,
> > c) issues were not directly related to the device suspension procedure,
> > d) you want to implement a backup plan to make the modem support robust.
> > 
> > If got it right, then I would like to recommend to implement a generic
> > error handling solution for the PCIe interface. You can check this
> > document: Documentation/PCI/pci-error-recovery.rst
> 
> Yes, got it right.
> I want to identify the scenario and then recover by reset device,
> otherwise suspend failure will aways prevent the system from suspending
> if it occurs.

If a PCIe link goes down here's my understanding of what happens:

  - Writes to the device are silently dropped.

  - Reads from the device return ~0 (PCI_POSSIBLE_ERROR()).

  - If the device is in a slot and pciehp is enabled, a Data Link
    Layer State Changed interrupt will cause pciehp_unconfigure_device()
    to detach the driver and remove the pci_dev.

  - If AER is enabled, a failed access to the device will cause an AER
    interrupt.  If the driver has registered pci_error_handlers, the
    driver callbacks will be called, and based on what the driver
    returns, the PCI core may reset the device.

The pciehp and AER interrupts are *asynchronous* to link down events
and to any driver access to the device, so they may be delayed an
arbitrary amount of time.

Both interrupt paths may lead to the device being marked as "offline".
Obviously this is asynchronous with respect to the driver.

> > > > > +++ b/drivers/net/wwan/t7xx/t7xx_pci.c
> > > > > @@ -427,6 +427,10 @@ static int __t7xx_pci_pm_suspend(struct
> > > > > pci_dev *pdev)
> > > > >       iowrite32(T7XX_L1_BIT(0), IREG_BASE(t7xx_dev) +
> > > > > ENABLE_ASPM_LOWPWR);
> > > > >       atomic_set(&t7xx_dev->md_pm_state, MTK_PM_RESUMED);
> > > > >       t7xx_pcie_mac_set_int(t7xx_dev, SAP_RGU_INT);
> > > > > +    if (pci_channel_offline(pdev)) {
> > > > > +        dev_err(&pdev->dev, "Device offline, reset to recover\n");
> > > > > +        t7xx_reset_device(t7xx_dev, PLDR);
> > > > > +    }

This looks like an unreliable way to detect issues.  It only works if
AER is enabled, and the device is only marked "offline" some arbitrary
length of time *after* a driver access to the device has failed.

You can't reliably detect errors on writes to the device.

You can only reliably detect errors on reads from the device by
looking for PCI_POSSIBLE_ERROR().  Obviously ~0 might be a valid value
to read from some registers, so you need device-specific knowledge to
know whether ~0 is valid or indicates an error.

If AER or DPC are enabled, the driver can be *notified* about read
errors and some write errors via pci_error_handlers, but the
notification is long after the error.

Bjorn

