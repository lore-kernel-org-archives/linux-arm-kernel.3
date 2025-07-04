Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8EDC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 11:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whgOqLmsZlyYsui2Tii63XLA7fL8uKb4vAFnvsHCb7o=; b=1ANUNTeFrC4eR8NTROEBI7mJc4
	2JVobbyS/F3arISnGyInboXZcZLX9XfJsIWMbqE3FR3oCOe5GJf1zBIdkA5x7OXYgggT15w0v8Pqs
	GgfvqIUucXlXcRWb+Noi4T0pka8o4b4Pkts9NQ+xrABIh2BzDWzLnLMmYi1UdRFd8kozmHC5qhBlY
	b/6pxY8rBzwF0SMNrAZ6geOozjGDnISdcKy/7K4j4qyMjGiwlxSFdQoDoHrU4tUspLk5aTkQD8AeV
	tw4KJt5UfsDZG8Sc5I1iOy+ONrdGV+gkDGinCp742kuxk/LS3KvP5aloekCbo1FsxcmjJ+Wey1/iU
	BNpZ/QHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeDa-0000000E9Ou-0OG1;
	Fri, 04 Jul 2025 11:04:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXdEF-0000000DzY3-1XxC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 10:01:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 771206145A;
	Fri,  4 Jul 2025 10:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6080BC4CEF0;
	Fri,  4 Jul 2025 10:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751623270;
	bh=Cjcwlr07oXFOeUDkk0S4U3uYMwLzNl+Ks+4KvR9bZSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ON3aeeq0xJcW4IWX1NUx5rgTfwRr31J1wY4T2+o8Z5Dc0jzzojoTNr16Iedf2wPJd
	 5Fn8sUjJ7We9Twz1fDKPbVfPSHWCFaOId9SKVtzIS+8WdMONWg1r3da8USzBPi8aWX
	 4SeUKBhZT0X6dOuRc9jXRw8zZ1ppD3zRt/qKqoXR0sqJdzqoFPq44/FLSlnFKKfd/F
	 wJu6C6h08fKwKBWyE3h/kPUO6bM8WIiaSCGjefThb8CFjjJfCXdbIcc0T1Z8YIOmCS
	 q7RYflnZPGBQomUFkGSlVfIjcXIp35zu44gMz6XLLJHHBI+e0NVxhHbpAmKSZQSi18
	 p6EiKjaZ0bR5w==
Date: Fri, 4 Jul 2025 12:01:02 +0200
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Timothy Hayes <timothy.hayes@arm.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v7 00/31] Arm GICv5: Host driver implementation
Message-ID: <aGemXoMHE2Y7msSk@lpieralisi>
References: <20250703-gicv5-host-v7-0-12e71f1b3528@kernel.org>
 <20250703164743.00004f3e@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703164743.00004f3e@huawei.com>
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

On Thu, Jul 03, 2025 at 04:47:43PM +0100, Jonathan Cameron wrote:
> 
> > ---
> > Changes in v7:
> > - Added CDDI/CDDIS/CDEN FIELD_PREP(hwirqid) for instruction preparation
> > - Fixed IST/DT/ITT L2 size selection logic for 64K PAGE_SIZE
> 
> Hi Lorenzo,
> 
> I took another look, particularly focused on this aspect and it all looks good to
> me.  Thanks for making these last minute changes.

Thank you for pointing them out - it is good we managed to make them.

> No more RBs from me but that is just down to my lack of confidence that I know my way
> around the spec well enough. It's not anything to do with the content of your series!

I am grateful you took some time to go through the series - you helped
me fix some issues, that's was very useful !

Thanks,
Lorenzo

> Thanks
> 
> Jonathan
> 
> 
> > - Reordered some ITS error paths according to review
> > - Link to v6: https://lore.kernel.org/r/20250626-gicv5-host-v6-0-48e046af4642@kernel.org

