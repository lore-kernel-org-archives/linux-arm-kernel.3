Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28831C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 19:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=LL3RY/V1J0xcsuEJkdFMp5QtdK1gttswPIe/WMAkbfk=; b=XGznIkrds5zej5
	RSRTbmO1OIm+gi7o6pfRQhbiNJiGfNN4+Megx9HkjYQ11QW2U1GqsrLlup9sE68YenXLh/3dDnkO+
	Yf+GvT+h2MM1Kv+HtumtOuhmXSqEv+mgi5H0tYYYEZotKtuusyyULVmwovZSGaCafYwpPyLeRZetF
	tIOl7eSovlOm1UKqrNs1bSux5ahbj2vwEe25iwGa6eJ8NTfdZ49B7HpQk7xeg6EUbdP+hS8Ypoeir
	uLCkSqC7tSnN71coN4HnNmzgZnk3MLHh3yvyQ3HDU/lQMVpB9DlO6602gcqapihDsBar+6xXqs4bE
	Z++vw7zmCc0TxkKnUjRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQAET-0000000HTZq-11BU;
	Fri, 13 Jun 2025 19:38:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQACI-0000000HTN5-46Dr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 19:36:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BFC605C1347;
	Fri, 13 Jun 2025 19:34:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E18E1C4CEE3;
	Fri, 13 Jun 2025 19:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749843378;
	bh=dBkT5f8fAKtHK7jzxmh9DkTqqqZtM261/i4B9cEg6ys=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=GA+bbtTVzgFpKvTQA8xE4YPDSmLjvHrRh92eFCHuw+8KEv+6kNkssCfAR+yH2CpW5
	 B2nn3xhnMp4hMJl7LRvwn9XlU86L9kms7W9Aodxz5+NWWx4KoD6ybrNiVsD3OkeZIv
	 QjHko6pEccjQDw/uHA6mi+sCtdYH9GW02H6xmp5vPxBXvTONa2p91Iv/9Su+ubxHyI
	 4pn5ptTmp5AbleEqHOUxMZ6uHp7Oj56YFjhog4DtSvTIZDqCkGDQ1LXXNcWLjXHQ9p
	 2JFvEPQ6Ank3b236mVNRQlQsZyHGDPkZhmHyKwd37SkziGt1ZRB5ZGb+zu3OJnRy1O
	 L7ZqQkBzIbFIg==
Date: Fri, 13 Jun 2025 14:36:16 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: linux-hyperv@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	mhklinux@outlook.com, decui@microsoft.com, catalin.marinas@arm.com,
	will@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, lpieralisi@kernel.org,
	kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org,
	bhelgaas@google.com, jinankjain@linux.microsoft.com,
	skinsburskii@linux.microsoft.com, mrathor@linux.microsoft.com,
	x86@kernel.org
Subject: Re: [PATCH 4/4] PCI: hv: Use the correct hypercall for unmasking
 interrupts on nested
Message-ID: <20250613193616.GA971782@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1749599526-19963-5-git-send-email-nunodasneves@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_123619_061023_A7FD6E52 
X-CRM114-Status: GOOD (  10.34  )
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

On Tue, Jun 10, 2025 at 04:52:06PM -0700, Nuno Das Neves wrote:
> From: Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>
> 
> Running as nested root on MSHV imposes a different requirement
> for the pci-hyperv controller.
> 
> In this setup, the interrupt will first come to the L1 (nested) hypervisor,
> which will deliver it to the appropriate root CPU. Instead of issuing the
> RETARGET hypercall, we should issue the MAP_DEVICE_INTERRUPT
> hypercall to L1 to complete the setup.

Maybe strengthen this to say that this issues MAP_DEVICE_INTERRUPT
instead of RETARGET in this case?  (Not just that we "should".) 

> Rename hv_arch_irq_unmask() to hv_irq_retarget_interrupt().

