Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07482CA5FA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 17:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yoXJoVOtDfXx/sqpL2IRQPeObZGir2PgtmCCcHbuopM=; b=qm93svOYDZpezysYC5M3+065LO
	7t1UPdnHMIaP6eDOFggpi3njjeJODeGytLnWEpXJi6chVRKlL8PPpEmtOgwZbpkS3m0T93dxadsdr
	m+Yg2Ho3HdggLJx90KGUrvU9CnAk7E5RYO7VLdNAD0zFOKmgWGNRzbOXuRE0/oFnn8cEG4DlN0I2s
	N7FTjDTSPrOvgpvGXTahtCyZNBmI2oR2TqMBLnXMXhx4EQOb7h4pUh2fPA0ZDHOqz7oLJsi1LWrde
	rvJmCA0ylEohYEBRDQtdAxfUVyn0Ou8/VadrLeuqU1w8wkLHQ0/MBxfjqd6xDMcjzsI4wkiJvG9XM
	cz0hUBBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbBu-000000047b8-45jr;
	Tue, 29 Sep 2026 17:00:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBbBs-000000047ag-3mRP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 17:00:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F3EF1655;
	Tue, 29 Sep 2026 10:00:23 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55F753F85F;
	Tue, 29 Sep 2026 10:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790701227; bh=JOH3/jvzoj8I30I9E7kqxaEsc2Cplh2etaLYcI+/ZEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nzbmtfKi8hy7Cc/yT4F+PGL6tW6kIHItKwVzh05TXYNazNIP2VPxFmRX+iByTzJci
	 vkpKv707Z8drHTA6cAUBWSs41lcGj8D84X8Ul4eZUyi05Lu5EFRpj5sH9ciUXEZV9J
	 JuiircUcRlGb+buJ2IlH/gTkk8HxtKdcSyyrp3Zo=
Date: Tue, 29 Sep 2026 18:00:12 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Andreas Grapentin <gra@linux.ibm.com>
Cc: Steffen Eiden <seiden@linux.ibm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@kernel.org>,
	Friedrich Welter <fritz@linux.ibm.com>,
	Fuad Tabba <tabba@google.com>, Gautam Gala <ggala@linux.ibm.com>,
	Hariharan Mari <hari55@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Hendrik Brueckner <brueckner@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>, Marc Zyngier <maz@kernel.org>,
	Nico Boehr <nrb@linux.ibm.com>,
	Nina Schoetterl-Glausch <oss@nina.schoetterlglausch.eu>,
	Oliver Upton <oupton@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Ulrich Weigand <Ulrich.Weigand@de.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH v8 16/29] arm64: Share arm64 headers with s390
Message-ID: <arvunF8epgpWh1YT@arm.com>
References: <20260918133107.1042730-1-seiden@linux.ibm.com>
 <20260918133107.1042730-17-seiden@linux.ibm.com>
 <arqQ2Eat4VUBbl49@arm.com>
 <20260928162345.428362-C-seiden@linux.ibm.com>
 <ars6Jh5DiendDT7G@li-d8547bcc-2d90-11b2-a85c-a70f2a37009a.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ars6Jh5DiendDT7G@li-d8547bcc-2d90-11b2-a85c-a70f2a37009a.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_100029_033343_C870C6E7 
X-CRM114-Status: GOOD (  23.78  )
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

On Tue, Sep 29, 2026 at 06:19:20AM +0200, Andreas Grapentin wrote:
> On Sep 28 26, Steffen Eiden wrote:
> > On Mon, Sep 28, 2026 at 05:07:52PM +0100, Catalin Marinas wrote:
> > > On Fri, Sep 18, 2026 at 03:30:53PM +0200, Steffen Eiden wrote:
> > > > +# Enable all code shared to s390
> > > > +KBUILD_CFLAGS	+= -DARM64_S390_COMMON
> > > > +KBUILD_AFLAGS	+= -DARM64_S390_COMMON
> > > > +KBUILD_CPPFLAGS	+= -DARM64_S390_COMMON
> > > 
> > > Do we actually need these defines? They seem only to be used as markers
> > > for the awk scripts to extract the definitions. Why do we need the C
> > > preprocessor involved at all? Could we not just have comment markers:
> > > 
> > > /* ARM64_S390_COMMON_BEGIN */
> > > ...
> > > /* ARM64_S390_COMMON_END */
> > >
> > No technically we do not need those. They could be useful if we find out
> > that AWK is the wrong tool and move to a C Preprocessor + diff based
> > approach. 
> > 
> > if the ifdev is not closed the compiler will complain, but an 'arm did
> > not destroy us' verifiaction tool ( I will send one soonish) could do
> > the same.
> 
> iirc the last time we discussed this we didn't think that load-bearing
> comments were the right tool here. We also briefly floated the idea of
> using a #pragma region based approach, but in the end we went with the
> #ifdef preprocessor directives instead, as the least invasive
> non-comment marker that was available.

The downside is that the macro affects the preprocessed code. We need to
ensure they don't leak in uapi headers for example. Not a fan of this
approach but I don't have a better suggestion either. At least we could
write them as:

#if ARM64_S390_COMMON == 1

so we get an error if someone misspells the macro name (or they leak in
uapi headers, vDSO).

It would also be useful for the awk scripts look for the paired #endif
rather than relying on the comment at the end of the line. Otherwise
it's not really different from just sticking to comments.

-- 
Catalin

