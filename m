Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A24AE77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 18:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BglboHQ7tVu4BxDK/EuzRuAGpk+spIRm/9NWQyWzxwk=; b=b5jqMISvm0SkoM7WJ/krI4Lkvd
	1U2AJ9EzL4551SXKVHJlBnbnZFr5JLij3d5/3LcQK+G9YUbGYbrwDRnA95UkMKHmxRusUx8J5D5jd
	Yf8aerdQ4vuMzMPIFHFZMt7w9b8K3DRwWQLgkCOaKIoLmBt6CXasN2d6apooMxFZCz8bqDxLMTtbL
	UNgVwt9IHzcPuau+nJhaPfDx5MfJ22DSIaLzTRKx0oIfsBeqdXmcCjMRSnEgZfzbx5zuEhVIHy9Wy
	BLUjwlXH/njiyCuW2dgmoSh868TUAihJdNlz9IJ0TUGSPfhd5xwNnVj+09X/UdhzhrxKm8jcTp35F
	O87hbFOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGJt-0000000H4fQ-0DCN;
	Thu, 05 Dec 2024 18:11:21 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJGE0-0000000H3iB-2BQf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 18:05:17 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733421913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BglboHQ7tVu4BxDK/EuzRuAGpk+spIRm/9NWQyWzxwk=;
	b=nzpIl9YBICnzKJI2Pjvf7pkScFiSL9S5X4wczpmO39asv6i5Z5SF3UYOzOO2mqZVUE41dd
	2zHRSj2qsel3OpEJ2kfDqI56RWlxU2MY40FwlxpwWSyXJ3ajQEFqK76st0cebIzRndq9pA
	2K7XMPdBI6WOD0qjt5Y5K/ajyDIWjWtfx2/48zBYcsP8jwZBtIzK1dN2E82xpHAFca52/K
	W7+oLVtuMAXCAUa7hz/zKRr885/ye+gH8lK5Zi/qu6MMMqRgoSP6YT7UQO6KJ2wrrqqE5T
	CUxPyDxk6gq/DiLPQEUej3k429WBRKnuYABK/KMSPr9Nag6vvKCtUvuF6SSXpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733421913;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BglboHQ7tVu4BxDK/EuzRuAGpk+spIRm/9NWQyWzxwk=;
	b=+4Rsy8fTbbnjB6wPATM5TxkjCHnu+iZXm4JyQV8eFr1jCKHhPGsKvDTyDr8BPvspeOadXi
	R164aOSReCT8w6Dg==
To: Frank Li <Frank.li@nxp.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Krzysztof
 =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Anup Patel <apatel@ventanamicro.com>, Marc Zyngier
 <maz@kernel.org>, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 imx@lists.linux.dev, Niklas Cassel <cassel@kernel.org>,
 dlemoal@kernel.org, jdmason@kudzu.us, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 3/7] PCI: endpoint: pci-ep-msi: Add MSI address/data
 pair mutable check
In-Reply-To: <Z1G/CwFvO/aBLBe8@lizhi-Precision-Tower-5810>
References: <20241204-ep-msi-v10-0-87c378dbcd6d@nxp.com>
 <20241204-ep-msi-v10-3-87c378dbcd6d@nxp.com> <87ttbiqnq8.ffs@tglx>
 <Z1G/CwFvO/aBLBe8@lizhi-Precision-Tower-5810>
Date: Thu, 05 Dec 2024 19:05:13 +0100
Message-ID: <87ldwuqa3q.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_100516_698471_8516B804 
X-CRM114-Status: GOOD (  10.55  )
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

On Thu, Dec 05 2024 at 09:56, Frank Li wrote:
> On Thu, Dec 05, 2024 at 02:10:55PM +0100, Thomas Gleixner wrote:
>> You want a MSI_FLAG_MSG_IMMUTABLE and set that on the domains which
>> provide it. That way you ensure that someone looked at the domain to
>> validate it.
>
> Okay, at beginning I think most MSI controller is immutable. So I use
> MSI_FLAG_MSG_MUTABLE.

If you want to do that then _you_ have to go through every single
interrupt controllers, validate and opt-out in case it does change the
message. Otherwise that flag is completely pointless.

Instead of adding the IMMUTABLE flag for one controller you know and
then let others who want to utilize this amend their controllers.

Opt-in is less work and more safe than opt-out. See?

Thanks,

        tglx

