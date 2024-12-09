Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8E5E77181
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 19:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eXb9Qlvpqf8UvXDokFX4BzJKnQj1O029xwrLhZM3PY4=; b=zv8P+/pi94mTGLPHWHv/ZILF51
	vlIYeTxDwKLRHRMG43ZDZPKd05xN8QmouprlUy4+0tg/CMrmiwfkBY+LaAtDqK9Tiv4tUoZjCQ/MJ
	tzqgO1eO7ap82UoHeJeXmWDpwuOvYkRChQd6C7OZAVhbwVhD79MSw92RnLH9h5NUU8Ldj1xtVS7M9
	ARJ6SRC4M48crB8LsYqac4JTKukukkCr9ZDzl1fWM0gyHq0GaIHmU5B0ftHc1WySe9caHrv8tFNiq
	cikj+8i3NuQRlbIyrWyTrEBuWXdUdIoyvyRayIc+4S0qMlf+7oa/wn689F0zgGAYTRnNOraF543ah
	xmCMD9XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKjoS-0000000960U-3YMm;
	Mon, 09 Dec 2024 19:53:00 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKjnQ-000000095rE-2xLG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 19:51:57 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733773913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eXb9Qlvpqf8UvXDokFX4BzJKnQj1O029xwrLhZM3PY4=;
	b=QGqLICAWiFEGv1iAiUxnwN5MX5gFQ4eujqYD2p6hki0dgNaV9CGWmIqKBw4yv8DhklBNzx
	pNL1aNghvs8S797J9vMctMalLNpkRF0kBs4liT52l5Nj3AvafHhH4DVVK2kNG7ijzKARnP
	rJfgtGymN24m6vLSasEfaVZm5Phcc2olqkQJ0ci9yvHwoejqvbD1A4jIcONEjMMxihYUvZ
	frdgQgqWWXbhTsyoc9qP4vp4QUhHC7e/Uy14h42KWgJD9uJUC7w+tKjFDgUzmYuAptX2U4
	b8FywB/zf+4KyehgNqiK68jjK8IWyf3Wlg61WQHyaEqvEPkHruF2tKy5ewkWhA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733773913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eXb9Qlvpqf8UvXDokFX4BzJKnQj1O029xwrLhZM3PY4=;
	b=PYFXlDr7DTnByaFHHuqwY4MCTGNP7Zqnly7+IhtKetDJzgwQHFlQ/FlwpauJFWmubiKxHO
	cIZRO7e5htu0CICQ==
To: Frank Li <Frank.Li@nxp.com>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 imx@lists.linux.dev, Niklas Cassel <cassel@kernel.org>,
 dlemoal@kernel.org, jdmason@kudzu.us,
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v11 3/7] PCI: endpoint: pci-ep-msi: Add MSI address/data
 pair mutable check
In-Reply-To: <20241209-ep-msi-v11-3-7434fa8397bd@nxp.com>
References: <20241209-ep-msi-v11-0-7434fa8397bd@nxp.com>
 <20241209-ep-msi-v11-3-7434fa8397bd@nxp.com>
Date: Mon, 09 Dec 2024 20:51:52 +0100
Message-ID: <87h67cprc7.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_115156_889027_66DEA4FD 
X-CRM114-Status: GOOD (  13.98  )
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

Frank!

On Mon, Dec 09 2024 at 12:48, Frank Li wrote:

> Some MSI controller change address/data pair when irq_set_affinity().
> Current PCI endpoint can't support this type MSI controller. So add flag
> MSI_FLAG_MSG_IMMUTABLE in include/linux/msi.h, set this flags in ARM GIC
> ITS MSI controller and check it when allocate doorbell.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v9 to v11
> - new patch
> ---
>  drivers/irqchip/irq-gic-v3-its-msi-parent.c | 1 +
>  drivers/pci/endpoint/pci-ep-msi.c           | 8 ++++++++
>  include/linux/msi.h                         | 2 ++

This is not how it works and I explained that you to more than once in
the past.

The change to the interrupt code is standalone and has nothing to do
with PCI endpoint. The latter is just a user of this.

So this want's to be split into several patches:

   1) add the new flag and a helper function which checks for the flag.

   2) add the flag to GICv3 ITS with a proper explanation

   3) Check for it in the PCI endpoint code

>  
> +	if (!dom->msi_parent_ops)
> +		return -EINVAL;

irq_domain_is_msi_parent()

> +	if (!(dom->msi_parent_ops->supported_flags & MSI_FLAG_MSG_IMMUTABLE)) {

Want's a helper.

Thanks,

        tglx

