Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49F0D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 10:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VrcJCXHYCPOOAEwMhNE/T330SorGtLZsApg7Uj2H2Lc=; b=LtqYclxOkXU3yjYqCnc7sm2rCZ
	UJKAGhazIp1y06o1rYsguXf5fmtI+QCxDTgoNmOzB9HsDh8ZEZux+8HsvMbHN/QjVkynl52jxpKP4
	NnlO+Ink5ucXYrKZIcUvfrp8Bh+FCfAZ+VD1TqKbstdRznkJpqT6jFP67BsOiT3B9kewm6dcyA1yc
	y6Q3LPpTmk9qRFTlCXUHlVqmNdxB7JtqO6XLUk3hl7ayA9kHwe//mKsGl3OunVQ2LHRknoV7Av4ui
	AUL/vIIS/1DgBnJwXDOhj9+CplGa23eVN3hIaA31H/n2FfeqmOQB393M6kXjRZvtOwtt4tRNtqTsD
	azTX7znA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8mQ-00000003awN-2Y9o;
	Tue, 20 Jan 2026 10:16:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi8mP-00000003avs-10h8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 10:16:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 65E5960008;
	Tue, 20 Jan 2026 10:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE761C16AAE;
	Tue, 20 Jan 2026 10:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768904168;
	bh=iXDM9sQqzNpRwm3a7W6kTb784YafZHJUjqkBDX1rr50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XyYqUelIpqO9hvVWaQPDGsDObTc/l14pEqaWMEXqDTRvmkULuUgQJ+YbgBO1bJdUd
	 jXF4TUvmeARvig6cC07SCREg4B3IPvGRkgGabtgV6Djhl0QxP0gpLwQntNGnaEODgW
	 JbdUllLe5Ea1O6tvBFVkJjSzYZCplcF1UrODrwwCuWUYECDqV2Ch6x2goeVGuxnTYJ
	 m+0AHx5qR+Ya4GrqsHdfmqxNcIvNQM4l8mW2iRkNif4HWUdCUoSeH68cpklAkP/6Rd
	 1OKfzWm24rQioRqs8Mp7+J4fxktJeUdZ5tLuHciJin1PFgSIub34glcfIWaBe5Mlzk
	 JuAbtZaKbqq/A==
Date: Tue, 20 Jan 2026 11:16:00 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>, Robert Moore <robert.moore@intel.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Marc Zyngier <maz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org
Subject: Re: [PATCH v3 0/6] irqchip/gic-v5: Code first ACPI boot support
Message-ID: <aW9V4A7lTGZWTO9e@lpieralisi>
References: <20260115-gicv5-host-acpi-v3-0-c13a9a150388@kernel.org>
 <aWy9T3VDyXpVG41z@lpieralisi>
 <87sec30yhk.ffs@tglx>
 <aW3pALPxn4i9fiDO@lpieralisi>
 <87pl751zeh.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pl751zeh.ffs@tglx>
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

On Mon, Jan 19, 2026 at 02:54:14PM +0100, Thomas Gleixner wrote:
> On Mon, Jan 19 2026 at 09:19, Lorenzo Pieralisi wrote:
> > On Sun, Jan 18, 2026 at 03:47:03PM +0100, Thomas Gleixner wrote:
> > I think the simplest way to sort this out is for this series to go via
> > the ACPI tree if that's OK for Thomas, given that the ACPICA code will
> > go via the ACPI tree anyway and there are other dependencies on it there
> > I assume (this series is fairly self-contained).
> 
> I'm fine with that
> 
> Acked-by: Thomas Gleixner <tglx@kernel.org>

Thank you Thomas, Rafael I hope that works for you too, please let me know
if there is anything I can/should do.

Thanks,
Lorenzo

