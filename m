Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72325E7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 15:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2r5ZSOC+jMK+Pn41a+KdPBf5Tp8LhGYfDQCBVqyptSw=; b=Z9oYjcVxbxHJjcKYRgtS4bBbln
	YrMlgxvRNobtIWgHN4RmbzabL6GrBfpd86fUJFm13YfbLmTxzrQb2Icv8xyfLWS2ufYmoatoZGK0B
	jr4DBjh+RpTw3DMZDCgXWQlETqgFvftYOgOFFoMHXZpPP8q8co48Mqn++3sOTIrq1kdoKMuuCrBgN
	iWFY0fWMFhUilzaP349GPvZ93vbV4lFWlCN9eStvVXXqhJoyHXErELFe7RQK2evKhOYb2WLspJTmo
	MMu0xhBRctae06cf0dPmJSdayLNoJ6ZINB1mfVZybVgu6bZwcjSio3MPC+0C1VzAlY2Cv2BC+w3Y1
	JdGGLgWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJDYS-0000000GUMX-3ZPk;
	Thu, 05 Dec 2024 15:14:12 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJBdE-0000000G4bb-1vAJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 13:11:01 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733404256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2r5ZSOC+jMK+Pn41a+KdPBf5Tp8LhGYfDQCBVqyptSw=;
	b=SSecgSoJaTW4GK3OxeSbVglrdiNuLnmzjVRYetQUMbKN9YgTDPUJKRPT2xBYIFSFUPXkU9
	iL545q3NwhxiwKrJ9Kj14INBRUO3VqNClhU2zZ7NkgeiWmFzxONN7HnrxI8c5hJdXJ4qsS
	EZ5Kb+Tx4a42G8/+/wmvIG3g3GiTJ/oXZvc3QOeJM/NWD0pEgedh1c8gM5zAXiuEBREd5a
	m4rTBF3EQiWMdBj7XAhjSNnZe4fHph/13dd/m6Rhxo2TOUn4pr1Kl8kydS2Z8e1UpewYv5
	gnNbECNnBH37KBm9FozVwUygpXr3DcjAZbAuEDlMXhEnaac/6tfV3p8OISq0jQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733404256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2r5ZSOC+jMK+Pn41a+KdPBf5Tp8LhGYfDQCBVqyptSw=;
	b=TF6tbNwZIKHNI5y92mqJbv4JxvZqe0fERVOSlkTSDhw6+5AqZuIK7VX1meXEl6Q8c1huFY
	zk4IFSFIUV+rekBQ==
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
Subject: Re: [PATCH v10 3/7] PCI: endpoint: pci-ep-msi: Add MSI address/data
 pair mutable check
In-Reply-To: <20241204-ep-msi-v10-3-87c378dbcd6d@nxp.com>
References: <20241204-ep-msi-v10-0-87c378dbcd6d@nxp.com>
 <20241204-ep-msi-v10-3-87c378dbcd6d@nxp.com>
Date: Thu, 05 Dec 2024 14:10:55 +0100
Message-ID: <87ttbiqnq8.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_051100_651651_BA4615F0 
X-CRM114-Status: UNSURE (   7.64  )
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

On Wed, Dec 04 2024 at 18:25, Frank Li wrote:
> Some MSI controller change address/data pair when irq_set_affinity().
> Current PCI endpoint can't support this type MSI controller. So add flag
> MSI_FLAG_MUTABLE in include/linux/msi.h and check it when allocate
> doorbell.

Q: Who is going to annotate the affected domains with that flag?

A: Nobody.

Q: What's the value of the flag?

A: Zero, as as it prevents exactly nothing.

You want a MSI_FLAG_MSG_IMMUTABLE and set that on the domains which
provide it. That way you ensure that someone looked at the domain to
validate it.

Thanks,

        tglx

