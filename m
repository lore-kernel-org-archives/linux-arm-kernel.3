Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C05C5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 13:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zD3zgeevoRIzapGsmdBgzD2O1ClYtdB1PLKQWNbkPKo=; b=d+ouOEDP5rTlGTVDesVsVXrEdk
	9LOaVkcpAIsJSmplRMeowlUux5j+sPdLFmqvcirUSikC9kSzazBQZle9pYZXDsvJfsoYE7zMTS3AF
	bWI9QHPuP0wOujkhOKbuWcUT22Cd/RMDupAsOi0t1D/Xfbhm3hqEBFB3BKAJxbKKFdK9aMyupbhdf
	7tMFyzypM2/uSwH8IpIuc72NdpE4gE6K3TphEIQCte5zcJQBcsUbicvDQmSQbKHFhuS717FU42AhE
	aLlJfPC7lEM0emHsuaCbjyj/I7Zuw1gqlouRQlQLDYKxKmv8RaSnPptYoxQuBTL3dbdd6jjg/DUyp
	NFEcLxqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3Bm-0000000Bdly-0b7k;
	Thu, 20 Aug 2026 13:52:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx3Bl-0000000Bdlr-0pKs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 13:52:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 91C2F43F51;
	Thu, 20 Aug 2026 13:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB83B1F00A3E;
	Thu, 20 Aug 2026 13:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787233932;
	bh=zD3zgeevoRIzapGsmdBgzD2O1ClYtdB1PLKQWNbkPKo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=V6zQLFSjbRumG/ZzB3vbDdpuLLbThnUSpsktcBfLVAyMvdcHJSH3GxKAsjeEBg/8D
	 LPiYec1o16YRv8a6lP0W5MzGA5ef7hgPfSPcggKG9TvBUooDvUAIfJ2OgFjQkwRar7
	 u568h8PtyZ+7NIfcXHGNTp/ZGVXskBBIfNIpqzWAQ1vEImO0n4ZNki4JQWGfMrUwWv
	 dZmXbbA1TtzNucXDrOV1saOmDMR4aYelK4W4V13CBuc/lCROY+DhzuzFRWxrji2/7J
	 W+wGGPYzeI0tVTeC/0p9sWL7Tgz5MaA7wB9n9bE8kxUHZTiG4Ld266BaznqKuHrB5I
	 DWHJxA1jmp6cw==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 5B3491980052;
	Thu, 20 Aug 2026 09:52:10 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Thu, 20 Aug 2026 09:52:10 -0400
X-ME-Sender: <xms:hwaHairR6o6PXuan12CrPv3SWKHlmsH9FNUQE2oLr9KIEmMxAn_kag>
    <xme:hwaHareeLezG6p_gft7QurnOG-wc8KaWArqS4AKqnaNkEMlrdaF5dF62BDbVOXhJA
    GhMJ8FP2u-KT7z7ykTZxIv9RvGlYOCCdtwyb_1uZU74g7bpFSjoHGGB>
X-ME-Proxy-Cause: dmFkZTFCRl0HBk9vYQsxdiFgcQZaSulDIVtSv1i9/4ktEgUTQZk1cXT59PNxolqKjaIURt
    PrlEIP3DvEkM/OsJiqg/2TmQx1W6mg2nqzi+xe+QbVO2C0pfaxDDdU8nxtnlX400v+r679
    +KSbEyoZ2CTHCsw3vaT+xD2R0btGAzbTpAIC8cyDlHyfu3oci4nNrH1yx/C4Ez8VbyJPCU
    tK+ZfABSogjQ+YVETYj/lNczXQp60Nl3uG5mGPk3Ae7mMpvK5rXHJ7J304V98Un46T+NVz
    wLsplI4V3Pmet6WCRV5l/xTyAFOtP0DKC7nS8IEPYH1yLgHWde0j2/rXJO63BdkpiZmcOP
    TjiKlq7ZT/2FFHDwKSMNno1497GnyXB7fpuSA5XN6eEZAnFpOIQTx7mmi2Ut2c/sJyH1ni
    au/UV0iLua0EDuMjnpqTNeT5EhE0Aw2RrElW7LbAF8PDkKOUq2iTj/g6TMbOIDdfMjZdQq
    HlMWeqNAfrRUoV/kYDR32EJjcyU4kEn3x0Z3+nS6zRVQPHiwAx51yn/LH8qUAeNSNzHt3s
    wG37OoOThOJ2J5Vbt+5r107mVwxdVR0KVjNYNSqIiQpC9REEdN/blPHwk/UNopQGTzTd+K
    iEAULIYJvRG19JFxMNFMvPOPtA6hbkkhCetchodaE+8955qua/+GDetp3Qtg
X-ME-Proxy: <xmx:igaHahMw43JxIVWe0GKxkqPSadd7ljZoIVg1sCwoJVz-zxSfsT0v5A>
    <xmx:igaHaljHHgaKgqM8CtFpnNrkpp7TlBsNW3DDuW42HSRClJH7HIJZ6Q>
    <xmx:igaHaviG3p3X52Bspy-edGr16H0rp4TG8VYDyCHJeqd7cdXhQQvyRQ>
    <xmx:igaHakIZocxFctPM5fiJqBO-GWhLKXbZV7dcrMC0iu8q1JkK_OHQHg>
    <xmx:igaHaukauisc9AfpLVRbvphxkmHWYl4Qu9Y_OdTl9VA16zdMR1d0gKDf>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 50AE8F80071; Thu, 20 Aug 2026 09:52:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Thu, 20 Aug 2026 16:50:41 +0300
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Will Deacon" <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Arnd Bergmann" <arnd@arndb.de>, "Eric Biggers" <ebiggers@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Alexei Starovoitov" <ast@kernel.org>, "Oliver Upton" <oupton@kernel.org>,
 "Herbert Xu" <herbert@gondor.apana.org.au>, "Marc Zyngier" <maz@kernel.org>
Message-Id: <207397b0-07f2-467c-8419-3109a506cc7d@app.fastmail.com>
In-Reply-To: <aocFEg5JvsjeMXwj@willie-the-truck>
References: <20260811140132.22778-1-will@kernel.org>
 <20260811140132.22778-7-will@kernel.org>
 <a16ed8a4-28cc-4270-a257-b9268ab9e9ea@app.fastmail.com>
 <aoGGCqMdb8iZvZSM@willie-the-truck> <aob-0tByMtlbIaxQ@willie-the-truck>
 <03208978-a825-4ae5-b47e-3dd6133ecbf0@app.fastmail.com>
 <aocFEg5JvsjeMXwj@willie-the-truck>
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



On Thu, 20 Aug 2026, at 16:45, Will Deacon wrote:
> On Thu, Aug 20, 2026 at 04:27:06PM +0300, Ard Biesheuvel wrote:
>> 
>> On Thu, 20 Aug 2026, at 16:19, Will Deacon wrote:
>> > On Sun, Aug 16, 2026 at 10:42:40AM +0100, Will Deacon wrote:
>> >> On Tue, Aug 11, 2026 at 05:04:43PM +0200, Ard Biesheuvel wrote:
>> >> > On Tue, 11 Aug 2026, at 16:01, Will Deacon wrote:
>> >> > > diff --git a/arch/arm64/kernel/head.S b/arch/arm64/kernel/head.S
>> >> > > index 87a822e5c4ca..8951ce693552 100644
>> >> > > --- a/arch/arm64/kernel/head.S
>> >> > > +++ b/arch/arm64/kernel/head.S
>> >> > > @@ -138,8 +138,7 @@ SYM_CODE_START_LOCAL(record_mmu_state)
>> >> > >  	b.ne	0f
>> >> > >  	mrs	x19, sctlr_el2
>> >> > >  0:
>> >> > > -CPU_LE( tbnz	x19, #SCTLR_ELx_EE_SHIFT, 1f	)
>> >> > > -CPU_BE( tbz	x19, #SCTLR_ELx_EE_SHIFT, 1f	)
>> >> > > +	tbnz	x19, #SCTLR_ELx_EE_SHIFT, 1f
>> >> > >  	tst	x19, #SCTLR_ELx_C		// Z := (C == 0)
>> >> > >  	and	x19, x19, #SCTLR_ELx_M		// isolate M bit
>> >> > >  	csel	x19, xzr, x19, eq		// clear x19 if Z
>> >> > 
>> >> > There is some more code that can be removed here - see
>> >> > 2ced0f30a426c7301350681f838344d5aea711e3
>> >> 
>> >> Good spot, thanks! I'll do some more surgery at -rc1.
>> >
>> > Looking at this again, I'm not sure we can remove much here. I think we
>> > probably still want to force little-endian (i.e. clear the EE bit) if
>> > we're entered as big-endian. I've changed the following EOR to a BIC
>> > (see below), but I think that's about all we can do?
>> >
>> 
>> Well, the only case where we allow an active ID map is when doing EFI
>> boot, which is guaranteed to be little-endian. Since the kernel is now
>> also guaranteed to be little-endian, we should be able to simply kick
>> the CPU in LE mode right at the start, no? And simply ignore the case
>> of a BE bootloader entering with the MMU and caches enabled?
>
> Hmm, so why did we support this in the first place given that EFI is
> guaranteed to be little-endian? Or was that just because we wanted to
> handle the case of a big-endian kernel being loaded by EFI?
>

The original report is here:
https://lore.kernel.org/linux-arm-kernel/Y9FZsBEu8hSVVIA8@dev-arch.thelio-3990X/

So it would probably have been sufficient at the time to just kick
the CPU into LE mode - I don't remember why I added the additional
logic tbh.


