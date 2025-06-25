Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D37BC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 20:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ksnwKvAhMKkje3eUwYJa8SwYqzK7zP55c8bmIaX4SOE=; b=ubtoXWvcnZJToABObjB2vACdKX
	2MNIBFDrJAoOyZYkzYF5dlbxoipVBWu2DoP964avoYjROGb/yZE/1RRucZ3V3tf6CSOTSC12K6ZOQ
	u2FDcuBygJnHIHROTZOL8Ahwq3q0e53OEAVC7Dh3cxGR0Bk8AWdgrLjPO9PPmhQMrtRLYlXybErW5
	aFLL/LySjsbfXnAlCkRCntCuDJ4ylRQMdn9AQHDe42njBEkQ5n53t9z+Jkv0h1unuaVVJqivnUs21
	HHw6mjjW1okyva0iTQI0x4ies/tAHb1SrGjZHWy5ypdr68PWQI48mKWceKx4LPkRittxA/aSC2tXJ
	x8+OR2qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUWyd-00000009uIl-3bSc;
	Wed, 25 Jun 2025 20:44:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUTVU-00000009PZL-1OSa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 17:01:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 31A255C5A6A;
	Wed, 25 Jun 2025 16:59:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE9E0C4CEEA;
	Wed, 25 Jun 2025 17:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750870915;
	bh=eALn9anayFEUy5QoMrVPaobWyJA2W/W/5mmJqhg2eeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YHYkKZdjYC4HV3b95BXhVaBQ9s+cmAywC5izCrtUMIZf1ZosFbgoewL5l91JXINjg
	 kcTtTEengp7ZpcB2mvHxoxfnoFydbYlTyyqTZLw/5s6S4ubK6LzxE3iYXMO+NTHNG+
	 /YGOlzi/g08ShWET1btNYKDuYi9ebTXY6JK/xv50U1gniwk8CJyf1oygZqsZT16Wzn
	 IaIiT0lbJ3N++5bn1j0w2X0tm/jD1/ot8BF7sfzvKrxbXyQJYjI4S9IO+cj1AXB8Qm
	 gA44VwxNEKcUDsnRheIO9FL06KloUdflmdcIo7SI+VVvg5M97UcycFzKKmjNqAr4aK
	 BRu3t/NkbfREg==
Date: Wed, 25 Jun 2025 20:01:51 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: sudeep.holla@arm.com, peterhuewe@gmx.de, jgg@ziepe.ca,
	stuart.yoder@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v4 0/2] generate boot_aggregate log in IMA with TPM using
 CRB over FF-A
Message-ID: <aFwrf1HnsilrASzX@kernel.org>
References: <20250618102302.2379029-1-yeoreum.yun@arm.com>
 <aFs0of3uZdoMEJXc@kernel.org>
 <aFvRI5OwSLLKz300@e129823.arm.com>
 <aFwrBU4H0w9AXyQM@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFwrBU4H0w9AXyQM@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_100156_452094_D515189E 
X-CRM114-Status: GOOD (  29.50  )
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

On Wed, Jun 25, 2025 at 07:59:53PM +0300, Jarkko Sakkinen wrote:
> On Wed, Jun 25, 2025 at 11:36:19AM +0100, Yeoreum Yun wrote:
> > Hi Jarkko,
> > 
> > > On Wed, Jun 18, 2025 at 11:23:00AM +0100, Yeoreum Yun wrote:
> > > > To ensure the TPM device operating over the FF-A protocol with
> > > > the CRB interface is probed before IMA initialization,
> > > > the following conditions must be met:
> > > >
> > > >    1. The corresponding ffa_device must be registered,
> > > >       which is done via ffa_init().
> > > >
> > > >    2. The tpm_crb_driver must successfully probe this device via
> > > >       tpm_crb_ffa_init().
> > > >
> > > >    3. The tpm_crb driver using CRB over FF-A can then
> > > >       be probed successfully. (See crb_acpi_add() and
> > > >       tpm_crb_ffa_init() for reference.)
> > > >
> > > > Unfortunately, ffa_init(), tpm_crb_ffa_init(), and crb_acpi_driver_init() are
> > > > all registered with device_initcall, which means crb_acpi_driver_init() may
> > > > be invoked before ffa_init() and tpm_crb_ffa_init() are completed.
> > >
> > > I get the ffa_init() part i.e, moving it earlier. However for
> > > tpm_crb_ffa_init() and crb_acpi_driver_init(), modules.dep
> > > takes care that they are loaded in order.
> > > For IMA you will need the driver as built-in but that should
> > > be handled via kernel config, not via code changes.
> > 
> > In the case of "module" built, it's true.
> > However what I tell here is when "tpm_crb" and "tpm_crb_ffa" is built
> > as "built-in" in this case, it couldn't make a "dependency" between
> > the same initcall level: here is the case of this.
> > 
> > 0000000000000888 l       .initcall6.init>-------0000000000000000 crb_acpi_driver_init
> > 000000000000088c l       .initcall6.init>-------0000000000000000 tpm_crb_ffa_driver_init
> > 
> > in this case, wihtout code change, the crb_acpi_driver_init()
> > is failed since tpm_crb_ffa_driver_init() is called later.
> > 
> > and this couldn't be solved with kconfig --
> > ARM_FFA_TRANSPORT=y && CONFIG_TCG_CRB=y && CONFIG_TCG_CRB_FFA=y.
> > 
> > The Patch #2 is to proing the tpm_crb_ffa as part of
> > crb_acpi_driver_init() when TPM uses method ARM-FFA.
> > 
> > If there's another suggestion, let me know please.
> 
> Hmm.. I actually got what you mean now. I was looking this from
> wrong angle. I think we can pick these patches!
> 
> Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> 
> > 
> > Thanks
> > 
> > --
> > Sincerely,
> > Yeoreum Yun
> 
> BR, Jarkko

Applied.

BR, Jarkko

