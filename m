Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AFDC35FF4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 16:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=ObM8Gbqhymuxr6GGOdatMfMDVcY/fJMjEAU6EYYQUdA=; b=NTzccDjq+UwRSc
	iFisLwzQZ6C+1NOPg52FY/qBPYx23wvP5cRszRYuYMjmjHnrnwUjCMTLmf/hRO4Vud7avhHAGx14g
	IG0pUnkXlFu1D2JQbhOtpJR79dDBS/LRjX7Mjw1IXdf2YUV8vRdXOIbkPo3PYnNbNc6CvRELOC6Xg
	kHb93WfP+FYs67TA1ISwXmMbgiKlY1Omv4uOx6U98s/I/TIzLjMv2hBMFhsWfK9m14pKrA0conzVH
	z3R8BKY8oRQkr12fc/9OnNrzxBV01bAVps4BBRSwG9bkYPLvIR9g19X/Wf9ayN6LTMZtq2CdFUOza
	rlyhJza9XuPbKUtZ09rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tslB3-0000000Bm7k-3eI2;
	Thu, 13 Mar 2025 16:12:57 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsl0k-0000000BjsN-1xQq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 16:02:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C3406A44DBC;
	Thu, 13 Mar 2025 15:56:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ACE5C4CEEA;
	Thu, 13 Mar 2025 16:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741881737;
	bh=yeXHcZgjUGF7P1GdENNOH+WMNLvGwDA1Vl+O4Y03fFM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=m5w9qBkuDQVNB4YeKXrBEztJzAJGHkUy75sZhJ+lyGei4s3zeKWOv0SZtQO31Gsa9
	 9zA5dwPqruTyKckVPVI3Sc2CPa9gE2fbKxs/DYBZvmfvZmjuHwYebhNnapwDXYjgiV
	 +Ru2nP7dQP72CsjCRT8/D0/0G9JAKdUV1QsxuEZEfiAJ85SAHNurCgF+sSUsWpdVo3
	 zhPn+Jxbv3jJ+xe+TaIpsptYh5bWhvbEA+03S0nIV0ZGEoNybkj3kpr3aGaPNTBxsR
	 kLyPJeq8zLyfGsv/w3L4UI8oyVPmLWleh4wEsuh06Ft+FLVf9nk7CsKy1c7lySb3X+
	 2njSxjG5yuz0Q==
Date: Thu, 13 Mar 2025 11:02:15 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: lpieralisi@kernel.org, kw@linux.com, vigneshr@ti.com,
	manivannan.sadhasivam@linaro.org, robh@kernel.org,
	bhelgaas@google.com, rogerq@kernel.org, linux-omap@vger.kernel.org,
	linux-pci@vger.kernel.org, stable@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH] PCI: j721e: Fix the value of linkdown_irq_regfield for
 J784S4
Message-ID: <20250313160215.GA736346@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250313055519.j3bpvsm6govd5ytk@uda0492258>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_090218_629319_51593ADC 
X-CRM114-Status: GOOD (  25.50  )
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

On Thu, Mar 13, 2025 at 11:25:19AM +0530, Siddharth Vadapalli wrote:
> On Wed, Mar 12, 2025 at 11:16:00AM -0500, Bjorn Helgaas wrote:
> > On Wed, Mar 05, 2025 at 06:50:18PM +0530, Siddharth Vadapalli wrote:
> > > Commit under Fixes assigned the value of 'linkdown_irq_regfield' for the
> > > J784S4 SoC as 'LINK_DOWN' which corresponds to BIT(1). However, according
> > > to the Technical Reference Manual and Register Documentation for the J784S4
> > > SoC [0], BIT(1) corresponds to "ENABLE_SYS_EN_PCIE_DPA_1" which is __NOT__
> > > the field for the link-state interrupt. Instead, it is BIT(10) of the
> > > "PCIE_INTD_ENABLE_REG_SYS_2" register that corresponds to the link-state
> > > field named as "ENABLE_SYS_EN_PCIE_LINK_STATE".
> > 
> > I guess the reason we want this is that on J784S4, we ignore actual
> > link-down interrupts (and we don't write STATUS_CLR_REG_SYS_2 to clear
> > the interrupt indication, so maybe there's an interrupt storm), and we
> > think some other interrupt (DPA_1, whatever that is) is actually a
> > link-down interrupt?
> 
> While it is true that actual link-down interrupts are ignored, it is not
> the case that there's an interrupt storm because the same incorrect macro
> is used to enable the interrupt line. Since the enables an interrupt for
> DPA_1 which never fires, we don't run into the situation where we are not
> clearing the interrupt (the interrupt handler will look for the same
> incorrect field to clear the interrupt if it does fire for DPA_1, but that
> doesn't happen). The 'linkdown_irq_regfield' corresponds to the
> "link-state" field not just in the J784S4 SoC, but in all SoCs supported by
> the pci-j721e.c driver. It is only in J721E that it is BIT(1)
> [LINK_DOWN macro], while in all other SoCs (J784S4 included), it is BIT(10)
> [J7200_LINK_DOWN macro since it was first added for J7200 SoC]. Matt
> probably referred to J721E's Technical Reference Manual and ended up
> incorrectly assigning "LINK_DOWN", due to which the driver is enabling
> the DPA_1 interrupt and the interrupt handler is also going to look for
> the field corresponding to receiving an interrupt for DPA_1.

So I guess without this patch, we incorrectly ignore link-down
interrupts on J784S4.  It's good to have a one-sentence motivation
like that somewhere in the commit log that we can pull out and include
in the merge commit log and the pull request.

> I can only hope that the URL will redirect to the latest version of
> the User Guide if at all it becomes invalid.

OK, thanks, I guess there's nothing more to do ;)  I guess that manual
is not really designed for collaborative development.

Thanks for the patient hand holding!

Bjorn

