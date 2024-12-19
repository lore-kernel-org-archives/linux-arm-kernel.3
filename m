Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C38EE7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 15:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/5DTEdm+bnq+js5HUlZs8v8UeaMYXVrbMQW336MjI3E=; b=ZdcHqyMAe/voKY+MeuCb57aV9J
	rEa+9E6IjCZtnojqNJ9yYlm8iq1BFXiezsTXv/4Z92tax0jmdWcYhvkyCLwtcggzhgExDtoKKAdP6
	oiYnLKFafjDV6bYcpM5qDG8/JbUA+N/seeu/HE7hSRbevtwJMwXeSDZwOS6E/4YeGcD0wLorcZWml
	jdJVcQgYDxsiFxckfHwRv1wus9+IJfaYskcHnLcAHN8BqypBGMo06QUfUnxM1jOVqizOsXyBZYmL9
	YULs6aZPgXYI4ckxYJ/arvqGksOpgFi12XA9A9HhcVLmo0I3wew9AFYh1CT2crtS0/qK9A8by2Opx
	ANLgQZFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOIn8-00000002Cv3-0PZ9;
	Thu, 19 Dec 2024 15:50:22 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOIm1-00000002CmD-1whj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 15:49:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BCCC3A426B4;
	Thu, 19 Dec 2024 15:47:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6EDAC4CECE;
	Thu, 19 Dec 2024 15:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734623352;
	bh=Em6tjA4shpu07NzsF3bttoRoasi6FATll0gF+/u1AaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mpTedCyGbS2Qz6Hu3kWxKi9equYBguWZ8nsXhXkkF9vjOE7G0/e3kwCDoThhdoc1V
	 tXIU4rRqrwITm27Lk1S6G0g0xRedDuunpL5sADY1cpaMeM4Kp2pve6dq0nsbNPt+yA
	 GvAW3jUtcYHQN49d7iI8Bk5ec1APOqgnjXOEokCQkp9ef7JJBcXk9itbrGtu6che9r
	 ZjyvAbChGmr7jgbyYcoPRS/+SpO0DbvV62aSqalS2DRU3f+lG6D3ewlIp/3k0puGHZ
	 KF43plamGupTNbwUkdB4H/e9nlOXsZWPUmyRy5uu6TvC1xWHo4CtKhfJtyDRHXB5NA
	 T53TpmkaVB6uQ==
Date: Thu, 19 Dec 2024 15:49:06 +0000
From: Will Deacon <will@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, kvmarm@lists.linux.dev
Subject: Re: [PATCH V2 5/7] arm64/cpufeature: Add field details for
 ID_AA64DFR1_EL1 register
Message-ID: <20241219154905.GA24724@willie-the-truck>
References: <20241028053426.2486633-1-anshuman.khandual@arm.com>
 <20241028053426.2486633-6-anshuman.khandual@arm.com>
 <20241210164144.GA16039@willie-the-truck>
 <a382200e-00c4-405a-a417-f4c09bd91fb7@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a382200e-00c4-405a-a417-f4c09bd91fb7@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_074913_626121_223FCDE4 
X-CRM114-Status: GOOD (  30.41  )
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

On Wed, Dec 11, 2024 at 10:02:42AM +0530, Anshuman Khandual wrote:
> 
> 
> On 12/10/24 22:11, Will Deacon wrote:
> > On Mon, Oct 28, 2024 at 11:04:24AM +0530, Anshuman Khandual wrote:
> >> This adds required field details for ID_AA64DFR1_EL1, and also drops dummy
> >> ftr_raz[] array which is now redundant. These register fields will be used
> >> to enable increased breakpoint and watchpoint registers via FEAT_Debugv8p9
> >> later.
> >>
> >> Cc: Catalin Marinas <catalin.marinas@arm.com>
> >> Cc: Will Deacon <will@kernel.org>
> >> cc: Mark Brown <broonie@kernel.org>
> >> Cc: Mark Rutland <mark.rutland@arm.com>
> >> Cc: Marc Zyngier <maz@kernel.org>
> >> Cc: linux-arm-kernel@lists.infradead.org
> >> Cc: linux-kernel@vger.kernel.org
> >> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> >> ---
> >>  arch/arm64/kernel/cpufeature.c | 21 ++++++++++++++++-----
> >>  1 file changed, 16 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
> >> index 718728a85430..bd4d85f5dd92 100644
> >> --- a/arch/arm64/kernel/cpufeature.c
> >> +++ b/arch/arm64/kernel/cpufeature.c
> >> @@ -530,6 +530,21 @@ static const struct arm64_ftr_bits ftr_id_aa64dfr0[] = {
> >>  	ARM64_FTR_END,
> >>  };
> >>  
> >> +static const struct arm64_ftr_bits ftr_id_aa64dfr1[] = {
> >> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_ABL_CMPs_SHIFT, 8, 0),
> >> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_DPFZS_SHIFT, 4, 0),
> >> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_EBEP_SHIFT, 4, 0),
> >> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_ITE_SHIFT, 4, 0),
> >> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_ABLE_SHIFT, 4, 0),
> >> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_PMICNTR_SHIFT, 4, 0),
> >> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_SPMU_SHIFT, 4, 0),
> >> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_CTX_CMPs_SHIFT, 8, 0),
> >> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_WRPs_SHIFT, 8, 0),
> >> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_NONSTRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_BRPs_SHIFT, 8, 0),
> >> +	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64DFR1_EL1_SYSPMUID_SHIFT, 8, 0),
> >> +	ARM64_FTR_END,
> >> +};
> > 
> > I think I mentioned this on an earlier series, but it would be useful to
> > see some justification in the commit message as to why some of these
> > features are considered STRICT vs NONSTRICT and why LOWER_SAFE is
> > preferred over EXACT.
> 
> I have updated the commit message regarding STRICT vs NONSTRICT as Mark had
> mentioned earlier (see below). But just wondering about FTR_LOWER_SAFE. All
> similar fields have been marked as FTR_LOWER_SAFE.
> 
> > 
> > For example, why is EBEP strict whereas other PMU-related fields aren't?
> 
> IIUC there are two types of fields here.
> 
> - Feature presence     (EBEP, ITE, ABLE etc)		---> FTR_STRICT
> - Debug resource count (WRPs, BRPs, CTX_CMPs etc)	---> FTR_NONSTRICT
> 
> > Why is the CTX_CMPs field treated differently to the same field in DFR0?
> 
> There is mismatch not only for CTX_CMPs but for WRPs and BRPs as well. As
> mentioned earlier, being resource count type, I believe these should be
> marked as FTR_NONSTRICT in existing DFR0 as well. I could send a patch
> fixing DFR0 first.
> 
> > 
> > I'm not saying the above table is wrong, it just looks arbitrary without
> > the justification.
> 
> Please find the updated version (v3) for this patch here for reference.

Please send new versions as new threads otherwise it's too easy to lose
track. Also, please give the rationale for the handling of each new field
in the commit message.

Will

