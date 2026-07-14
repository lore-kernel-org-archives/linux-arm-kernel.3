Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900C3C44508
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 14:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BpkIYNo1faFNCU58NJjShAtAOUdNhmJ/D9oFfMNTb+E=; b=2jqilE9rxqHu6JHoYZDp8EHCCL
	oDgyq0HU8bPaUZIOntIFmZr9fVONK/RlwhSwlL8veimtnDSgbUwHO8VG+1NXe+xsoy3SM5GmWcWNU
	mc0goLQQJ4t3CODhq5S/ocgPF36ra2On4iHgC8VB8id0y3uRGNaXSTjAC+MLcuyCk0A+97pSL4Lln
	apPxpW+mFX8svVhVRnIGT9pCjVghx1/OGxK4ou56zaEaYBhAY8vM3dLXJLFtMAeQEAttvqyZu5Y1Z
	bDYNDdwzEQ/mfdd4j99/DGifBOAA88YzpQDNhxDZN5ZLm7VrwG4E0UcHeIpuB3t/b7tnXJjz1B3Vf
	0Jg70TBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdh6-0000000CGxC-1CUY;
	Tue, 14 Jul 2026 14:01:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjdh4-0000000CGwY-1dNK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 14:01:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 12CA62F;
	Tue, 14 Jul 2026 07:01:01 -0700 (PDT)
Received: from localhost (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 987C83F915;
	Tue, 14 Jul 2026 07:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784037665; bh=9Sq26LWHI8r58EN8DYRUbljc1HREA/LJnj9Grw6C71A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=REpG6w4RRhMpa2frJH6lKCpfMm5hBL1jNODY14Ih3xa6nFlixOZOgxITV028keuHd
	 ihvdKTp171/10HMHfFAPIOqzguzYYMuv04354I1RUVpDd3SazCk9jBj3IwWv1n+tUl
	 zPWlsbiC+gjqqvdff4sH/HJWcz0nToFWnlikqDVU=
Date: Tue, 14 Jul 2026 19:31:01 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] arm64: cpufeature: Detect BBML3 based on MMFR2 ID
Message-ID: <alZBHSLOLIelWM-d@a079125.arm.com>
References: <20260708144331.679816-1-linu.cherian@arm.com>
 <20260708144331.679816-7-linu.cherian@arm.com>
 <11d99a7c-50f9-4a4d-a75b-ef11cf3371af@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11d99a7c-50f9-4a4d-a75b-ef11cf3371af@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_070106_473790_79FEFA36 
X-CRM114-Status: GOOD (  24.23  )
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

Hi,

On Fri, Jul 10, 2026 at 12:41:57PM +0530, Anshuman Khandual wrote:
> Please do mention full register field here
> 
> arm64: cpufeature: Detect BBML3 based on ID_AA64MMFR2_EL1.BBM
> 
> On 08/07/26 8:13 PM, Linu Cherian wrote:
> > Add MMFR2 ID based BBML3 feature detection, so
> 
> Ditto ^^^^^^^^^^^^
> 
> > that compliant cpus doesn't need to be added to the
> > midr list.
> 
> Could be reworded as :
> 
> Add ID_AA64MMFR2_EL1.BBM based BBML3 feature detection in
> cpu_supports_bbml3() so that cpus with the feature would
> not have to be added into MIDR based supports_bbml3_list.
> 

Okay, will change.


> > 
> > Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> > ---
> >  arch/arm64/kernel/cpufeature.c | 17 +++++++++--------
> >  1 file changed, 9 insertions(+), 8 deletions(-)
> > 
> > diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> > index e9ecaa036479..3f4a36f152d0 100644
> > --- a/arch/arm64/kernel/cpufeature.c
> > +++ b/arch/arm64/kernel/cpufeature.c
> > @@ -2133,6 +2133,12 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
> >  
> >  bool cpu_supports_bbml3(void)
> >  {
> > +	u64 mmfr2;
> > +
> > +	mmfr2 = __read_sysreg_by_encoding(SYS_ID_AA64MMFR2_EL1);
> > +	if (SYS_FIELD_GET(ID_AA64MMFR2_EL1, BBM, mmfr2) >= ID_AA64MMFR2_EL1_BBM_3)
> > +		return true;
> > +
> >  	/* CPUs that support BBML3 but dont advertise through MMFR2 ID */
> >  	static const struct midr_range supports_bbml3_list[] = {
> >  		MIDR_REV_RANGE(MIDR_CORTEX_X4, 0, 3, 0xf),
> > @@ -2153,15 +2159,10 @@ bool cpu_supports_bbml3(void)
> >  		{}
> >  	};
> >  
> > -	if (!is_midr_in_range_list(supports_bbml3_list))
> > -		return false;
> > -
> > -	/*
> > -	 * We currently ignore the ID_AA64MMFR2_EL1 register, and only care
> > -	 * about whether the MIDR check passes.
> > -	 */
> > +	if (is_midr_in_range_list(supports_bbml3_list))
> > +		return true;
> >  
> > -	return true;
> > +	return false;
> >  }
> >  
> >  static bool has_bbml3(const struct arm64_cpu_capabilities *caps, int scope)
> 
> With the minor changes to the commit message above.
> 
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

