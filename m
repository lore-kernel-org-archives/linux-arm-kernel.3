Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98385C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 21:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aNRH1g12Ne3BwA8FmDNO10ARExu6uL6cJ1LMrZ27OI4=; b=1ZmYhk3mcTzvkVLDm3J1I/pc+X
	j3Sko4DnqbPzTnR8nJDULKjARcYyuzm8uAbMEp2OO8hYnL6epGO2JRdnNnjrmRn/suhjVBWpq0MYg
	2mSHCnvkfr+PfDfa+9vkurcs1/fZTq5KMnM8GzxrDDMre/7DsmvTLFLWH+P3agzm4lfDQVZiZktc8
	36dVRaEO6Y5qU2pTs7WbMCusS5ULRuchib/9eWMDuB+JNgBlSGOKoXmykX9n8b+5zkGiUE/mEdTCs
	/VgXyMyK8cFMwtDDCHTnwXFHtdevUebpnoow8yo8zm5BeSDyKVSUGU7caZ0mfnWTZJxrSPRMPpRTt
	hXAeEvJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR2F-0000000CXN1-0i9i;
	Thu, 03 Jul 2025 20:59:59 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXMo9-0000000BzrT-04Ba
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 16:29:11 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751560147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aNRH1g12Ne3BwA8FmDNO10ARExu6uL6cJ1LMrZ27OI4=;
	b=PBBXZF4kI/WbElBKU/Utuj8jjVt/2dVrbejvGTcXKIQRU2uYoTKAqpHmGsySadjRy0LdQM
	ZZdkKSeeI9H/B4hejFC0zufMbUcLT6n6EzmboNb5TgH9LtltqIvv77ExiIQjU4+YTNRlPB
	LDs7slQQ0aoI7BHwHRw89RbfHV4RI4PqFuSJLMGQA8PKk1aej5pZ/qIFh2a3BzGOklukU9
	TDsBx3nmgSUaK6+/vtL2crKw+rhIgR+lZ6bwu3ns+AJkZosFZR7wACzljwIgp2xwLFz+ET
	BwKxONiv/rg1ioO8PGKJ6NSRgSjbXvV2PT1jH93SiBabI1RRJ1iPXq9Oj328VA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751560147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aNRH1g12Ne3BwA8FmDNO10ARExu6uL6cJ1LMrZ27OI4=;
	b=/Uirmdc/9olnKo8974l+b36bgV4+yNj/U1X0RSMH6B5yU9vJJBmZpDUYSoy2WLPu8k3+9e
	sRyPNBcdYArNPACg==
To: Marc Zyngier <maz@kernel.org>, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Toan Le <toan@os.amperecomputing.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH 01/12] genirq: Teach handle_simple_irq() to resend an
 in-progress interrupt
In-Reply-To: <20250628173005.445013-2-maz@kernel.org>
References: <20250628173005.445013-1-maz@kernel.org>
 <20250628173005.445013-2-maz@kernel.org>
Date: Thu, 03 Jul 2025 18:29:06 +0200
Message-ID: <87y0t5tezx.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_092909_205064_388822C9 
X-CRM114-Status: UNSURE (   9.83  )
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

On Sat, Jun 28 2025 at 18:29, Marc Zyngier wrote:

> It appears that the defect outlined in 9c15eeb5362c4 ("genirq: Allow
> fasteoi handler to resend interrupts on concurrent handling") also
> affects some other less stellar MSI controllers, this time using
> the handle_simple_irq() flow.
>
> Teach this flow about irqd_needs_resend_when_in_progress(). Given
> the invasive nature of this workaround, only this flow is updated.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

As I have no conflicting changes pending in this area, this can go
through the PCI tree along with the rest of this lot. Therefore:

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

Thanks,

        tglx

