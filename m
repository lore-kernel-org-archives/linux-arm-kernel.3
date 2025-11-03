Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED3BCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 18:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RavVh6olla4McoXXi2X8yD/jyQDHX1gpRSbdbNfBQtI=; b=qBo5/v3nVxrX9aBjf8MoAriRUA
	qg1dvrqLxpy4HRQ0ZQJGHZJth/LUz2kAz82/9deOK8XStiP/7Uijpmphs3W/IenKpj8odi2862ecZ
	Fr/kd5lcWKzoIPgiBlXs+1rwv0TlQPswMbwgtiMUeqP3Topny1+7nOP5LgsOYO5yEZxMRfCDt6+Zm
	KQL34FIEKQg+hJ07ANrYI312+sop5S604zEK3awv5CSravMzj1puKYrQ+D79Ige+YiDQJQN0EJHUp
	eyHV4rsciXoGGAxdswbSlz+ruTFx5POMviadrk9YTNGBJsBD9NB3oC6gWiYKDFOawx6yvn7a7i67A
	I+ww1fYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyuK-0000000AS9o-1Bfn;
	Mon, 03 Nov 2025 18:03:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFyuI-0000000AS8d-02BM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 18:03:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B98B62A6B;
	Mon,  3 Nov 2025 10:03:44 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 129933F694;
	Mon,  3 Nov 2025 10:03:51 -0800 (PST)
Date: Mon, 3 Nov 2025 18:03:50 +0000
From: Leo Yan <leo.yan@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Namhyung Kim <namhyung@kernel.org>
Subject: Re: [PATCH V6 1/3] tools: header: arm64: Replace TCR_NFD[0|1] with
 TCR_EL1_NFD[0|1]
Message-ID: <20251103180350.GZ281971@e132581.arm.com>
References: <20251013052945.2197190-1-anshuman.khandual@arm.com>
 <20251013052945.2197190-2-anshuman.khandual@arm.com>
 <aQjm7wmvHa79hkyi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQjm7wmvHa79hkyi@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_100354_110012_AD188A14 
X-CRM114-Status: GOOD (  19.08  )
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

On Mon, Nov 03, 2025 at 05:31:27PM +0000, Catalin Marinas wrote:
> On Mon, Oct 13, 2025 at 10:59:43AM +0530, Anshuman Khandual wrote:
> > Replace TCR_NFD[0|1] (used in TCR_CLEAR_FUJITSU_ERRATUM_010001) with field
> > definitions which are available in tool sysreg format. Helps in completely
> > dropping off the adhoc TCR_NFD[0|1] macros later.
> > 
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Arnaldo Carvalho de Melo <acme@redhat.com>
> > Cc: Namhyung Kim <namhyung@kernel.org>
> > Cc: Leo Yan <leo.yan@arm.com>
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > ---
> >  tools/arch/arm64/include/asm/cputype.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/tools/arch/arm64/include/asm/cputype.h b/tools/arch/arm64/include/asm/cputype.h
> > index 139d5e87dc95..dfa12df5e290 100644
> > --- a/tools/arch/arm64/include/asm/cputype.h
> > +++ b/tools/arch/arm64/include/asm/cputype.h
> > @@ -243,7 +243,7 @@
> >  /* Fujitsu Erratum 010001 affects A64FX 1.0 and 1.1, (v0r0 and v1r0) */
> >  #define MIDR_FUJITSU_ERRATUM_010001		MIDR_FUJITSU_A64FX
> >  #define MIDR_FUJITSU_ERRATUM_010001_MASK	(~MIDR_CPU_VAR_REV(1, 0))
> > -#define TCR_CLEAR_FUJITSU_ERRATUM_010001	(TCR_NFD1 | TCR_NFD0)
> > +#define TCR_CLEAR_FUJITSU_ERRATUM_010001	(TCR_EL1_NFD1 | TCR_EL1_NFD0)
> 
> Isn't this file usually updated automatically (well, someone running a
> script to sync) from the corresponding arch/arm64/ one?

Yes, usually perf tools maintainers (Arnaldo or Namhyung) will sync
headers in tools.

Seems to me, it is also fine to send this patch.  Please kindly remind
perf maintainers after the kernel changes have been merged, so it is
safe for picking up the change in tools.

BTW, I built the perf with this series and did not see any issue.

Thanks,
Leo

