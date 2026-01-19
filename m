Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E75D29C2F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 13:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SiLkNegzwVOS8KFzTjVbFGARwmNVM8mZyLGGXaoRFFg=; b=H7ks6D6Lwpcl1wc09zdEDkdyqy
	O1VfGanwu5msYUlVzDenASuJDMt5Ckmt1b8j63RvedW85fZwv/PBypXtFBsepsUNWMZKWZPUTO1wr
	lNsbbc5WzxB4hSQD1pTYIyrTjy9vjpmznDwYHT/XrEm6fHHZbDRFU2iVInQ7nk4QuXVCqr6zJEK21
	b/nKy/KpsyfmHICZ4CMLQeiHBHR2NvXg5DW6yFDy7duJkUKt1Y9yClLK5b3+JYbcl9QErKHfHcjwX
	jP8JK6j12iXubjC3qlQk0AiqHuN0AKZucqV1n/FDIpBRdeqQoHo7l/UO1r+LQLIRNDuO/pjYiQ4fO
	fEKbn5mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpi2-00000002Bs8-0pqQ;
	Mon, 19 Jan 2026 13:54:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhphz-00000002BrS-21ot
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 13:54:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 74A4A43E30;
	Mon, 19 Jan 2026 13:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8632C116C6;
	Mon, 19 Jan 2026 13:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768830858;
	bh=SiLkNegzwVOS8KFzTjVbFGARwmNVM8mZyLGGXaoRFFg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PUysENTJaUbMeVPtwCKTuqd3PhnLrtsfQKopFTDYHiq0dSLxeJx8FjhicT9s97h0+
	 bpgqkAZKN8WeyirGgFR8stccMhmeOMjZTsE8VHmZ3pIlXwc9oaIk9Y8XC6RBIRJQ/0
	 pIUHUU+FQoVLoKvXlKhH2O+kw3MIrqaxrxq0yhRTzHM3Y2EBzyDhKzwRuaD1bH6CXv
	 yHko3ZjFLIFxEOHBdn/IfBtiwLSPUAeG1aXdEq7l2nKpnWDIx0Z4bjoaqFzAoU+Gb5
	 U03/1exMrICy/sSVnZnZ7BWmVCDxqomCs1g6uS6CH1jrnxktOBhxQQndF4Cmsgyvoh
	 TsLXZQVfTKXdA==
From: Thomas Gleixner <tglx@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>, Robert Moore <robert.moore@intel.com>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Marc Zyngier <maz@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH v3 0/6] irqchip/gic-v5: Code first ACPI boot support
In-Reply-To: <aW3pALPxn4i9fiDO@lpieralisi>
References: <20260115-gicv5-host-acpi-v3-0-c13a9a150388@kernel.org>
 <aWy9T3VDyXpVG41z@lpieralisi> <87sec30yhk.ffs@tglx>
 <aW3pALPxn4i9fiDO@lpieralisi>
Date: Mon, 19 Jan 2026 14:54:14 +0100
Message-ID: <87pl751zeh.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_055419_537345_7849E19C 
X-CRM114-Status: UNSURE (   9.67  )
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

On Mon, Jan 19 2026 at 09:19, Lorenzo Pieralisi wrote:
> On Sun, Jan 18, 2026 at 03:47:03PM +0100, Thomas Gleixner wrote:
> I think the simplest way to sort this out is for this series to go via
> the ACPI tree if that's OK for Thomas, given that the ACPICA code will
> go via the ACPI tree anyway and there are other dependencies on it there
> I assume (this series is fairly self-contained).

I'm fine with that

Acked-by: Thomas Gleixner <tglx@kernel.org>

