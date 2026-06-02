Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF72DCD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 21:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jdudOJL+raYR/P30MGb9StMfBGEfajIKmHJbLO4Ebr8=; b=CQjis+YTOkgDpwjGTCqOdynxZV
	8bMZ2esVOWslA1nw+UZhFWuO8Pnr769NfL2HsTEnUoLlFVjYSrvTy1u1WJARteLoSg2ZQV3BdAk6w
	p9VUSSGVgGbOpXc+S6Xq9rrGziCgfy4DpwrAiLAyeGG6O2bi7yCMkPvgHFi7W5/tGYxoovWD7yI83
	+mw3rQ8NAPELKp7jB25vIDKJQOsumaiUBSNcZwmHGxYEeDga5VeDz05mSrmc8YLwLSNJeEDvqVDbV
	AOtshhWyT7sbtOx+PuqDkCMTsll6IvNdxvIxT86c+eg5S4muwtXPcGTilZEMSPMuRP7UUJWkfaIwf
	eY96RfYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUWjZ-0000000Dpkm-3gBh;
	Tue, 02 Jun 2026 21:33:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUWjX-0000000Dpk7-2klX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 21:33:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 89EA34026E;
	Tue,  2 Jun 2026 21:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18EA21F00893;
	Tue,  2 Jun 2026 21:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780435990;
	bh=jdudOJL+raYR/P30MGb9StMfBGEfajIKmHJbLO4Ebr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V9SFy076bGKjitzQm68Krm+0Rj2oH6tD8ejVPMJ5I/uiNj2eELLvem5TBfWJhWS4Y
	 TNxkpj0r0EocaKdfV56ca0uDZSuziD13GMeufrm1EkQYXl0dCfsFY9YyiesUFWhGHl
	 UOin2nIqMxPo5V8Rma6DTTuqNFut73Fbsj1WZ4Fu1ANDORSyKssdikJ5woI/BNsu9l
	 v2mM4MTf9qRrePcAHv2EQ+vCuYaejc3jfUE4bEVGTXMm0pKZaSeNx64p/NZBkyjPI+
	 qEcYTk0FOzw47y+XX7bp2LjYzzjiZ7m6ac/+kx2hpwt6249m/LIFyHVdITnIiP7Fe8
	 7BqzG0nolC9Cg==
Date: Tue, 2 Jun 2026 14:33:08 -0700
From: Oliver Upton <oupton@kernel.org>
To: Andreas Grapentin <gra@linux.ibm.com>
Cc: Steffen Eiden <seiden@linux.ibm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@kernel.org>,
	Friedrich Welter <fritz@linux.ibm.com>,
	Gautam Gala <ggala@linux.ibm.com>,
	Hariharan Mari <hari55@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Hendrik Brueckner <brueckner@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>,
	Nico Boehr <nrb@linux.ibm.com>,
	Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v1 15/26] s390: Add functions to query arm guest time
Message-ID: <ah9MFEq09ISAu9cb@kernel.org>
References: <20260529155601.2927240-1-seiden@linux.ibm.com>
 <20260529155601.2927240-16-seiden@linux.ibm.com>
 <ah4G847iT_pPRuQm@kernel.org>
 <ah7Ul7YwJOFuSMaD@li-d8547bcc-2d90-11b2-a85c-a70f2a37009a.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah7Ul7YwJOFuSMaD@li-d8547bcc-2d90-11b2-a85c-a70f2a37009a.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_143311_731718_8D148202 
X-CRM114-Status: GOOD (  19.00  )
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

Hi Andreas,

On Tue, Jun 02, 2026 at 03:25:13PM +0200, Andreas Grapentin wrote:
> On Jun 01 26, Oliver Upton wrote:
> > > Add functions to convert between ARM guest time (LSB0) and s390 host
> > > time (MSB0) using new ptff function codes.
> > > 
> > > Co-developed-by: Nico Boehr <nrb@linux.ibm.com>
> > > Signed-off-by: Nico Boehr <nrb@linux.ibm.com>
> > > Signed-off-by: Steffen Eiden <seiden@linux.ibm.com>
> > > ---
> > >  arch/s390/include/asm/timex.h | 49 +++++++++++++++++++++++++++++++++++
> > >  arch/s390/kernel/time.c       |  1 +
> > >  arch/s390/kvm/arm64/arm.c     |  9 ++++++-
> > >  3 files changed, 58 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/s390/include/asm/timex.h b/arch/s390/include/asm/timex.h
> > > index 49447b40f038..9ec22a28bbda 100644
> > > --- a/arch/s390/include/asm/timex.h
> > > +++ b/arch/s390/include/asm/timex.h
> > > @@ -99,6 +99,8 @@ extern unsigned char ptff_function_mask[16];
> > >  #define PTFF_QSI	0x02	/* query steering information */
> > >  #define PTFF_QPT	0x03	/* query physical clock */
> > >  #define PTFF_QUI	0x04	/* query UTC information */
> > > +#define PTFF_QAGTO	0x10	/* query arm guest time offset */
> > > +#define PTFF_QAGPT	0x11	/* query arm guest physical time offset */
> > 
> > Are these analogous to CNTVOFF_EL2 and CNTPOFF_EL2?
> 
> They are somewhat related -- we don't have the EL2 counter offset
> registers, but we still need to virtualize the guest counters, so
> instead we have to maintain the guest counter offset separately.
> 
> However, to determine the correct guest counter offset, we are using
> these new PTFF function codes to translate between the s390 and arm64
> architected counter domains.

Thanks for clarifying, I was trying to figure out how these functions
apply to the virtual and "physical" views of the counter inside the VM.

--
Best,
Oliver

