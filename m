Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2F3CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 14:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWwXPdPfSBWciZ519k8Kzh/yd3yfNNPJylYXUTyNxLI=; b=YWTeoIYDtlfVN0RbSS4Z0dCAmP
	XNNsRHWcSr45Rsli6UvKOpxn3DHci+DcvsD65+a9pa/Qj6e7ztpJH8j7sCDTLzZN1+PMUKY/0Bas1
	qsXmOdOx6YztoFUZsGHRPYBqUy097QH60zanbzlnGETW7MDa+MbTJedVB9LHkuoDk/RsK6DDFjSRp
	p/CXLjVr1rTRWqJa7JydgyFTSj2shU2c+QVcPszVgPgE9+4kxrSOYkMLG4gzq5RrFEV8CJAaMtfef
	rJY2Uc4uN2ZTQlHeD/51v82KrTfe3NpXt05Et3sHCOHsEn7PKgd+nnxFKLmcOUWrrao3MUVEchtNn
	pMmeFtVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCebh-0000000Boge-02jC;
	Fri, 02 Oct 2026 14:51:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCebd-0000000Bog7-0w2I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 14:51:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA56D497;
	Fri,  2 Oct 2026 07:51:16 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0930F3F86F;
	Fri,  2 Oct 2026 07:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790952680; bh=kKDcaBFOI0ps7qhL8AjeG9mxP4MHTajTSk/ANpKPOIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rEXHYs1rFHGFpp+zEAWKtWRV6Fm1ec6oxZj3tIRFwIVWez6ZbMp0WRYDWGnNyXB0O
	 s17B7C9WbonpVlkUtGk1SDJyLGctAw46E6MMb7+906QYuO+mwfRtEI5X2lDJrTyHhw
	 eopLqbNJ648HBOpUjIXBTh82SqsR1HMYCjpOIftA=
Date: Fri, 2 Oct 2026 15:51:16 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/boot: Don't set PMUv3p9 FGT2 bits without PMUv3
Message-ID: <ar_E5HUSTxMSRZhL@arm.com>
References: <20260930121212.3101361-1-fuad.tabba@linux.dev>
 <ar-xtsSOqwWK9jWQ@willie-the-truck>
 <CA+EHjTzT+2M40GfyxHp6p6OugjoA2BRSkbFK-PMeLGz+qCUM9w@mail.gmail.com>
 <ar-5CnttybD-1ojM@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar-5CnttybD-1ojM@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_075125_448194_05945D63 
X-CRM114-Status: GOOD (  20.86  )
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

On Fri, Oct 02, 2026 at 03:00:42PM +0100, Will Deacon wrote:
> On Fri, Oct 02, 2026 at 02:54:47PM +0100, Fuad Tabba wrote:
> > On Fri, Oct 02, 2026 at 02:29:26PM +0100, Will Deacon wrote:
> > > Are you sure #8 is the correct immediate for the ccmp? My reading of the
> > > pseudocode is that it should be #9, but this instruction has always confused
> > > me and I hate the fact that it doesn't take another condition code mnemonic
> > > instead of a raw immediate value.
> > 
> > My read is that #8 is right. From the CCMP (immediate) pseudocode in the
> > Arm ARM (DDI 0487 M.d, C6.2.81), flags start out as the nzcv immediate
> > and are only overwritten by the compare when the condition holds:
> > 
> >       var flags : bits(4) = nzcv;
> >       ...
> >       if ConditionHolds(condition) then
> >           ...
> >           (-, flags) = AddWithCarry{datasize}(operand1, NOT operand2, '1');
> >       end;
> >       PSTATE.[N,Z,C,V] = flags;
> > 
> > So when PMUVer == IMP_DEF the ne fails and NZCV = 0b1000, i.e. N=1, V=0.
> > LT is N != V (Table C1-1), so b.lt is taken and we skip. #9 would give
> > N=1, V=1, so we'd fall through and set the bits on an IMP_DEF PMU.
> 
> Aha, that table is pretty helpful, thanks.
> 
> I think you're right -- I missed the inversion at the end of
> ConditionHolds().
> 
> I'll pick this up next week.

I couldn't figure out the #8 either. I wonder whether it's more readable
as (untested):

	sub	x1, x1, #ID_AA64DFR0_EL1_PMUVer_V3P9
	cmp	x1, #(ID_AA64DFR0_EL1_PMUVer_IMP_DEF - ID_AA64DFR0_EL1_PMUVer_V3P9)
	b.hs	.Lskip_pmuv3p9_\@	// Skip unless V3P9 <= PMUVer < IMP_DEF

The first sub either gives us a large number (negative but we do the
unsigned comparison with b.hs) or something between 0 and (15-9). The
cmp and the 'same' part of b.hs skip the (15-9) case.

-- 
Catalin

