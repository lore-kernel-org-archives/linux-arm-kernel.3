Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B7DD4A5F4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Jan 2026 14:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oeiB4U7ue3xMlN0KbWfvpDWhIqfoLWa0WbFEB18CxYk=; b=NWkybC5Ild0To0z7qQJEfeO2o4
	cu6zKyzeNmlkxGL5JdAATEjevKsztuVP6Dok9SlzfIFDNyluorbeFX7YJgt8/kxbQm/3q6TwxRXcO
	NMDk9bCdYYg8K2ym/DNKD2KD5lc3My04gt3+gYOMXJT04u/RRhgGphQmKX66J0b1ludopTkthal64
	tWwsJo/AyFa41xwv/LL9hwgOjxeefr/vEObS3AkoBJSA+IdUjJdpDDWuvAHPrGSUQ7NzSErTaq3Yi
	RPt2zuuVU1XSGbOBXEuvqYIYLpxbFQjwJEh4Vh/tSOZRP09E5NFy0Jl0grHxG7D8UpfB6hnnce53C
	3wBWw3JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhU3a-00000000HZJ-155P;
	Sun, 18 Jan 2026 14:47:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhU3Y-00000000HYz-3J3T
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Jan 2026 14:47:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D578E60010;
	Sun, 18 Jan 2026 14:47:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1E75C116D0;
	Sun, 18 Jan 2026 14:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768747627;
	bh=+u4ZywIxm13pYgPgV73WmGC0axm5In10Llu2B9AHUPU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=opIhMi+ziLUGWUvz516R7fsTDj24WsFDmqjMk+GmC3YIVtY0sGQm//bxdq8IJRjBl
	 0SQr4aS8Nq2QKhAEPjAlBE1umXKC5UnQS+VVBrTEHlBNXn9KYrcj5KL9dcyca0e85P
	 7Rz1AugxyWjmZUmkFmhDFqQIGujxreWu6RcB7VV/AKjfdmHXSBsdf5puILzKwiUT/H
	 4kgrI5uqrjmzrNRBf/LZqX1cr5b1FaGqAxOKEVPEOL18mGiHQE1Jcu8RIaqBCdoIsI
	 YyHDVCfJ5JcP6rSs6G0XluMDNDDOAzpiM/HM6rpcviELAjTiIhkjZAEmFhQKXRg1Yl
	 jF3BBP/MlxNxw==
From: Thomas Gleixner <tglx@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Robert Moore
 <robert.moore@intel.com>, Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla
 <sudeep.holla@arm.com>, Marc Zyngier <maz@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH v3 0/6] irqchip/gic-v5: Code first ACPI boot support
In-Reply-To: <aWy9T3VDyXpVG41z@lpieralisi>
References: <20260115-gicv5-host-acpi-v3-0-c13a9a150388@kernel.org>
 <aWy9T3VDyXpVG41z@lpieralisi>
Date: Sun, 18 Jan 2026 15:47:03 +0100
Message-ID: <87sec30yhk.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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

On Sun, Jan 18 2026 at 12:00, Lorenzo Pieralisi wrote:
> I have noticed you pulled this seris into tip (thanks !) - there
> is a strict dependency on ACPICA patches in [6] though as I tried
> to convey with the paragraph above and dependencies below:
>
> prerequisite-message-id: <12822121.O9o76ZdvQC@rafael.j.wysocki>

Duh. I completely missed that.

> I don't know what's best/easier to handle this dependency but it is there,
> I don't want it to cause you any trouble so I reported it as soon
> as I noticed.

I zap it from my tree for now until that's sorted.

Thanks,

        tglx

