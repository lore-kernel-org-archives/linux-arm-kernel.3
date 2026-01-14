Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F2DD38FEF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 17:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jHGJVATtAFo2voa3lOA4ga20tNFdaMhofWUR8pM0xUA=; b=EsvTelPPow8nQcP52r+mEVgQbe
	2ITxe8fyzkRiSqkWAci57P+X5w+mpqQZfLdU0h1UoJWQkgbUqG7ZFNXUzAKAOK1spI7K7Pb9/UcRP
	k9Tv3lKmlGCPb5BH0BLNdGuaULdFjjEgygtCUyJk511gZVY8sQWHduRxwV9W0C7Lp/lW00S/MEiJT
	K/48hOjVG9RlkhnbIHM4vVt0Sw9ZqxmFEG6AsMZHnXi+nemE+GcIJmcXZn5TBIwXdTpWZXnyxSMK5
	dUwd8jnIAPHZgdS7xgwh9d6+uQvA6k7F+WI2+urkD3lWnpHa4+ZuAVX8cFNlFjhSS8R0fUYy/BoVQ
	Nt3X64Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4H9-0000000A27G-0qBv;
	Wed, 14 Jan 2026 17:03:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg4H8-0000000A26y-01Ik
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 17:03:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1599F6001A;
	Wed, 14 Jan 2026 17:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 719FFC4CEF7;
	Wed, 14 Jan 2026 17:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768410196;
	bh=tbOQiaRsx985jHNtRaNVTBPCED2t5Ue5EhyntK5pH6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jyppVcgrGQZ1NBONlc4fpePseUDyJJ5N6Yy1rFPXWoRD9W2pnQjhQNzPNvWnOxBCb
	 G1t0jtfLWEDR6MbsfgstatxJPWC9XvqhLnH3fCLwNktUz9dwOxOCa7QpAfAuNQL5md
	 ygkbJjx3EBgBIXKPBS6lD39Fe9MZQhTUvRGTHu/CupCMqWIjAhmKbAJ+eB45ofOZlf
	 zWyX1a4qZcJeYuL5gy+CdLM4Vm1Zi/TdnPhErIEZb/DgQvi51QJD+IUS+8c9oIF4pD
	 kpAiVjPGipG1q6REbWLFgrzjvJqEfHi0+Ya+MvL5OSfEL3eMsw9DQ3jQ9FVVHrdRs0
	 8UY5o/VIqnWUg==
Date: Wed, 14 Jan 2026 18:03:10 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>, Robert Moore <robert.moore@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Marc Zyngier <maz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	Jose Marinho <jose.marinho@arm.com>
Subject: Re: [PATCH v2 0/7] irqchip/gic-v5: Code first ACPI boot support
Message-ID: <aWfMTjukKcIlQugi@lpieralisi>
References: <20251218-gicv5-host-acpi-v2-0-eec76cd1d40b@kernel.org>
 <CAJZ5v0gqso3q8gUZ3wPq1iG7zOBUu2cWMDZiHqCBU5dgdu_KTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0gqso3q8gUZ3wPq1iG7zOBUu2cWMDZiHqCBU5dgdu_KTQ@mail.gmail.com>
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

On Wed, Jan 14, 2026 at 04:56:53PM +0100, Rafael J. Wysocki wrote:
> On Thu, Dec 18, 2025 at 11:15 AM Lorenzo Pieralisi
> <lpieralisi@kernel.org> wrote:
> >
> > The ACPI and ACPI IORT specifications were updated to support bindings
> > required to describe GICv5 based systems.
> >
> > The ACPI specification GICv5 bindings ECR [1] were approved and the
> > required changes merged in the ACPICA upstream repository[5].
> >
> > The Arm IORT specification [2] has been updated to include GICv5 IWB
> > specific bindings in revision E.g.
> >
> > Implement kernel code that - based on the aforementioned bindings - adds
> > support for GICv5 ACPI probing.
> >
> > ACPICA changes supporting the bindings are posted with the series; they
> > were cherry-picked from the upcoming ACPICA Linuxised release patches
> > and they should _not_ be merged in any upstream branch because the
> > full set of Linuxised ACPICA changes will be subsequently posted in
> > order to be merged, I added the two ACPICA patches to make the series
> > self-contained.
> 
> The patches in question have been included in this series:
> 
> https://lore.kernel.org/linux-acpi/12822121.O9o76ZdvQC@rafael.j.wysocki/
> 
> and are going to be applied shortly.

Thanks Rafael, I will rebase the series and mark the dependency then.

Lorenzo

