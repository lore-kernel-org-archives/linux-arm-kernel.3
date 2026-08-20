Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D681FC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 13:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1rpagWh/7qXR1I00A6AmDluN84TwJltkmTUIO9K/m/8=; b=JHhaet6LiFpOqhvIbLGYeL+vQX
	55PsJMV7OTs7zVOSY8Ib+Ss/ROCC9NhkEAsSPRBmBaawGhc98SDc5+dIgmAA8yERY8FiF6QFslvD2
	LiGjmigqiyLIf7igfBJRNf/BVErSAacK8Mnv0pvM1ePylAl77AyaD3i9k1Q23tqwE4k6FqAq8MChq
	Z5b17ZRD67D+ZH2dW2lpog4mo7Yozc88paAyY/E4RAM3eRQEQnEM5L1p9Fx8nhUzmVjQ+1AEhYOAa
	+xxF3VxK8vNe3z9KK4JaLXKfYY95WR08zbtNflD35lZFQDGU/i6yoSaXzs2LzGL1p+yecpICAAuYL
	STy0JtVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2nu-0000000BcBB-3aV6;
	Thu, 20 Aug 2026 13:27:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx2nt-0000000BcAu-3y2H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 13:27:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B097404F6;
	Thu, 20 Aug 2026 13:27:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5195F1F00A3D;
	Thu, 20 Aug 2026 13:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787232453;
	bh=1rpagWh/7qXR1I00A6AmDluN84TwJltkmTUIO9K/m/8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=kh5mAm9K50U1knj05J/XIpJMkRxlvl6HAU1nnq1e7phEN8bVZAZKaNGcwn5ZTQgqy
	 Jw3UhilX62NYNRgg1BZooN5DKDObxWGQfcmWd8wjTP6RmzkssbKuMYgxX0oaAjuEUk
	 9+Aq6tf4h2MUkLv4EoRq3mK6zsn4l8/oH0cP1V69XyD9HACVNTnJazb3KcIX10UzVq
	 8XOSgv6eD8lZfhOuYTI+dTKsbkHTevEpjAHx755bnmjLiiUDGlvDKmKVMlxoFKG82v
	 Id6PYGFSYwkkUdWIaLgtgDkKjb4PP0wdcXGB7XJ/e5NeymzpJ6cT3JmbkOmnENgfJr
	 kJlYBXZkQkljA==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id D711B1980058;
	Thu, 20 Aug 2026 09:27:30 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Thu, 20 Aug 2026 09:27:30 -0400
X-ME-Sender: <xms:vwCHauaJSCwT2J6Tq_Lfkgy6ejpmZQzzAhCrFNcRf-Y-MyN2NfgCIA>
    <xme:vwCHasMuXnZuQwprev4I-fqVyv3ac-Sx5CqlFi3V7qqy_vfH-1H4sgMs3Ed-S_dna
    F9s02fbzp6Fp86FMozzC2sd0t-Igxmh6aAc4VkKpHFPtj1ZVfNFD_o>
X-ME-Proxy-Cause: dmFkZTE66TlGgOXIQZU/MZ6I8mWhWNIeBsZV6bdW+M5m+1GdFyHEAwLWp3hrG8/+18hih/
    9wxPWt31Fr1hSOpBRxWxr3jpz6HAVUTu77HO4SpxJF0W52mJmT0hRxd2Zuz3KinjS5rfad
    Txdr+2BOkpN2b0QgxXVqxJ6PwaBOaKDgG2pq+Qm9f4Q7gI7bh3/j2Y7bWWAxTtwWT4m1EQ
    KCLIZIPh55lxz2I3YBmjQcSjz+oViOk8EuKp4C7ymGGQ4WeNPmCfUOImc1wc4hJ1V3Nfea
    6PdI5vvTuVlmmzbie3C9oGq7afkr0DZfcsU/LA7WHR1bpeMG1l6P6VcVJH6HLTiskvNPIK
    /V/AbRtPVcdxvaJi8kRE1bc30pr6OsyHrlm+uHOZaPc6Q4URtHuWNgUirqHTVVvwpTv+R+
    WMm+6A3sL84rp2qYnyP6LilIrNEsMDCEQIrN0uREYbNzzqhCwotUJVPBLszxQYb2QECooe
    4cfbrYceR9ybJV1EgJ8kYd6hASsUHYoCZaMxpP12PX6XGgOuyn2wb8OGK96z+kCzNID9Qy
    KJ5Ep+1hGwRqUwdLHHpJn93dEPGPPzC+Mcn6xwuWmyZGeKm//B6oaQUaP4rRoK4WqBueRS
    xDtrZOXJzuWRAKTdAfJo1BL/Y9x4YnsoosnhNaY69s717IG1npy/GMh1kKlw
X-ME-Proxy: <xmx:wgCHag-ojrN3EPNVAj0BeyYmA2U1-inrAO3NKH_TdnhZCoaFgi1EYQ>
    <xmx:wgCHaqRFPcE_QX8MLvW_W750tRrX5P03UjObq6YNuGPLBP30DamKyQ>
    <xmx:wgCHalSVYgW1xrkQaDrjhRt0TZ3XOBZf757YFEWVl3jcITw5-IetVw>
    <xmx:wgCHam7ekYkq4pRdFBmNl-c3G87eEOCfsqoIlkVreTk5vFOhUVZiBg>
    <xmx:wgCHaqWW89tbjM-H-UkIZs9gM-kznm5Pv2LgQW6nrgXpH8SIkA6SdswM>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id A7007F80070; Thu, 20 Aug 2026 09:27:27 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 20 Aug 2026 16:27:06 +0300
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Will Deacon" <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Arnd Bergmann" <arnd@arndb.de>, "Eric Biggers" <ebiggers@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Alexei Starovoitov" <ast@kernel.org>, "Oliver Upton" <oupton@kernel.org>,
 "Herbert Xu" <herbert@gondor.apana.org.au>, "Marc Zyngier" <maz@kernel.org>
Message-Id: <03208978-a825-4ae5-b47e-3dd6133ecbf0@app.fastmail.com>
In-Reply-To: <aob-0tByMtlbIaxQ@willie-the-truck>
References: <20260811140132.22778-1-will@kernel.org>
 <20260811140132.22778-7-will@kernel.org>
 <a16ed8a4-28cc-4270-a257-b9268ab9e9ea@app.fastmail.com>
 <aoGGCqMdb8iZvZSM@willie-the-truck> <aob-0tByMtlbIaxQ@willie-the-truck>
Subject: Re: [PATCH 06/12] arm64: assembler: Remove endianness helper macros
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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


On Thu, 20 Aug 2026, at 16:19, Will Deacon wrote:
> On Sun, Aug 16, 2026 at 10:42:40AM +0100, Will Deacon wrote:
>> On Tue, Aug 11, 2026 at 05:04:43PM +0200, Ard Biesheuvel wrote:
>> > On Tue, 11 Aug 2026, at 16:01, Will Deacon wrote:
>> > > diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
>> > > index 87a822e5c4ca..8951ce693552 100644
>> > > --- a/arch/arm64/kernel/head.S
>> > > +++ b/arch/arm64/kernel/head.S
>> > > @@ -138,8 +138,7 @@ SYM_CODE_START_LOCAL(record_mmu_state)
>> > >  	b.ne	0f
>> > >  	mrs	x19, sctlr_el2
>> > >  0:
>> > > -CPU_LE( tbnz	x19, #SCTLR_ELx_EE_SHIFT, 1f	)
>> > > -CPU_BE( tbz	x19, #SCTLR_ELx_EE_SHIFT, 1f	)
>> > > +	tbnz	x19, #SCTLR_ELx_EE_SHIFT, 1f
>> > >  	tst	x19, #SCTLR_ELx_C		// Z := (C == 0)
>> > >  	and	x19, x19, #SCTLR_ELx_M		// isolate M bit
>> > >  	csel	x19, xzr, x19, eq		// clear x19 if Z
>> > 
>> > There is some more code that can be removed here - see
>> > 2ced0f30a426c7301350681f838344d5aea711e3
>> 
>> Good spot, thanks! I'll do some more surgery at -rc1.
>
> Looking at this again, I'm not sure we can remove much here. I think we
> probably still want to force little-endian (i.e. clear the EE bit) if
> we're entered as big-endian. I've changed the following EOR to a BIC
> (see below), but I think that's about all we can do?
>

Well, the only case where we allow an active ID map is when doing EFI
boot, which is guaranteed to be little-endian. Since the kernel is now
also guaranteed to be little-endian, we should be able to simply kick
the CPU in LE mode right at the start, no? And simply ignore the case
of a BE bootloader entering with the MMU and caches enabled?



