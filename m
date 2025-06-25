Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D842C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 22:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u7KttJ/jn5AKwRGLKmA8xF614ylH0++/GeEzslR2B4k=; b=QqBTpqitwVzK8LkVWlTxLZaew9
	DeP/5lGgUQtnlZTz4vRHrnMvDnoR4zcm1pZU+/nLBpHzAY9XeZ7tcYMIMKl2swAPQCDqm6kCYbnYw
	OXzvp3bhGvqcyVXbj9uxRiWTZrhL/5S0fJ8MdyxkAxjzzaF9SgHVHsqna7+lVVTpJfUFi8UF4RCYm
	lJrcnEk6AW76JkCKoCB1TBU12+J4BIaMyXe67QtupDzAQTuGxHG0QkzCW3fu57/BCZ5A35NAQxF5X
	pAtl+BVA9v5wANRuR7CJtiBadPV7d8iHXgectR1S9qATgu9zgTb1cA73l7Zgv0SJ1m81DgOrWwNpr
	N5BdoC0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUYEV-0000000A23S-3Bta;
	Wed, 25 Jun 2025 22:04:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUXxi-00000009zri-1MSH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 21:47:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3A20AA52E8B;
	Wed, 25 Jun 2025 21:47:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83176C4CEEA;
	Wed, 25 Jun 2025 21:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750888040;
	bh=BmOzlOcWjjWYXOhk7oZaBIG/2AcVuM+tgXECnt/pDwI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pvtLsJPczkfTvI+ONrxnTt4krdlCwteKTmKK5QiCfn194xPML/Pmhl745tnqu4+7S
	 F5uBeZS+yBYhwIUfuB37Bt2Sbt44zh0fW41stK6LHLSG8/cyKZndigRP+L/iKuVzkx
	 7qvTfwhRWAwbFhHJIt4h38ZZ+ttARPymubS36qwgjEpBd5ZnypJt+NzsZ+Y3p+KHAW
	 jFWV2VPM0VthGTWSLrc/P3Z1nT+l02gzedl82jfg793epTw/JfsYdGmmAbj2KTB7tg
	 BP1Vpmmz8owtG/CPrhcymH3x9pnik+p79AiL/EDd9xIkOCQY71Jx2JdY+FyNaLBAqc
	 cNMImaOreT4kA==
Date: Thu, 26 Jun 2025 00:47:17 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, peterhuewe@gmx.de, jgg@ziepe.ca,
	stuart.yoder@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org
Subject: Re: [PATCH v4 0/2] generate boot_aggregate log in IMA with TPM using
 CRB over FF-A
Message-ID: <aFxuZV3lwd2Uc90g@kernel.org>
References: <20250618102302.2379029-1-yeoreum.yun@arm.com>
 <aFs0of3uZdoMEJXc@kernel.org>
 <aFvRI5OwSLLKz300@e129823.arm.com>
 <aFwrBU4H0w9AXyQM@kernel.org>
 <aFwrf1HnsilrASzX@kernel.org>
 <20250625-chital-of-infinite-proficiency-fee4dc@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-chital-of-infinite-proficiency-fee4dc@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_144722_489659_28A21B30 
X-CRM114-Status: GOOD (  33.18  )
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

On Wed, Jun 25, 2025 at 08:35:33PM +0100, Sudeep Holla wrote:
> On Wed, Jun 25, 2025 at 08:01:51PM +0300, Jarkko Sakkinen wrote:
> > On Wed, Jun 25, 2025 at 07:59:53PM +0300, Jarkko Sakkinen wrote:
> > > On Wed, Jun 25, 2025 at 11:36:19AM +0100, Yeoreum Yun wrote:
> > > > Hi Jarkko,
> > > > 
> > > > > On Wed, Jun 18, 2025 at 11:23:00AM +0100, Yeoreum Yun wrote:
> > > > > > To ensure the TPM device operating over the FF-A protocol with
> > > > > > the CRB interface is probed before IMA initialization,
> > > > > > the following conditions must be met:
> > > > > >
> > > > > >    1. The corresponding ffa_device must be registered,
> > > > > >       which is done via ffa_init().
> > > > > >
> > > > > >    2. The tpm_crb_driver must successfully probe this device via
> > > > > >       tpm_crb_ffa_init().
> > > > > >
> > > > > >    3. The tpm_crb driver using CRB over FF-A can then
> > > > > >       be probed successfully. (See crb_acpi_add() and
> > > > > >       tpm_crb_ffa_init() for reference.)
> > > > > >
> > > > > > Unfortunately, ffa_init(), tpm_crb_ffa_init(), and crb_acpi_driver_init() are
> > > > > > all registered with device_initcall, which means crb_acpi_driver_init() may
> > > > > > be invoked before ffa_init() and tpm_crb_ffa_init() are completed.
> > > > >
> > > > > I get the ffa_init() part i.e, moving it earlier. However for
> > > > > tpm_crb_ffa_init() and crb_acpi_driver_init(), modules.dep
> > > > > takes care that they are loaded in order.
> > > > > For IMA you will need the driver as built-in but that should
> > > > > be handled via kernel config, not via code changes.
> > > > 
> > > > In the case of "module" built, it's true.
> > > > However what I tell here is when "tpm_crb" and "tpm_crb_ffa" is built
> > > > as "built-in" in this case, it couldn't make a "dependency" between
> > > > the same initcall level: here is the case of this.
> > > > 
> > > > 0000000000000888 l       .initcall6.init>-------0000000000000000 crb_acpi_driver_init
> > > > 000000000000088c l       .initcall6.init>-------0000000000000000 tpm_crb_ffa_driver_init
> > > > 
> > > > in this case, wihtout code change, the crb_acpi_driver_init()
> > > > is failed since tpm_crb_ffa_driver_init() is called later.
> > > > 
> > > > and this couldn't be solved with kconfig --
> > > > ARM_FFA_TRANSPORT=y && CONFIG_TCG_CRB=y && CONFIG_TCG_CRB_FFA=y.
> > > > 
> > > > The Patch #2 is to proing the tpm_crb_ffa as part of
> > > > crb_acpi_driver_init() when TPM uses method ARM-FFA.
> > > > 
> > > > If there's another suggestion, let me know please.
> > > 
> > > Hmm.. I actually got what you mean now. I was looking this from
> > > wrong angle. I think we can pick these patches!
> > > 
> > > Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > 
> > > > 
> > > > Thanks
> > > > 
> > > > --
> > > > Sincerely,
> > > > Yeoreum Yun
> > > 
> > > BR, Jarkko
> > 
> > Applied.
> 
> If you are applying 1/2 too, feel free to add
> 
> Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> 
> I was initially thinking of taking it separately as there is no strict
> build dependency. But I am fine if you can take them together.

Hmm.. Yeah, if you insist to take them, that's fine for me too.

That said, I'm also happy to take care of them :-)

I'll append your review.

> 
> -- 
> Regards,
> Sudeep

BR, Jarkko

