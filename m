Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32ADDC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 17:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vclk7T6GmyIU5JicA1uJT1eVxb2aSMDclFLVOL/70l8=; b=yT4HmCNtyrJgMaIv+Es+gMGYVa
	B/w/AWtMUmZOOvcZg1ZQVy0BzJGXHRKFWgKN1Nj3yF476y4+Ez7GUS0yhWVJIQqj9WW0hsUdVJV8M
	dY33WC3J+D9ArPsDQgPeniZ874HPewUPf6JCayOl5joGgEUyIxrb7DAfb5bL4suS+rFMD+1idgM91
	HqZzV2FEyGesGxJzfwGn/KafAMd827AJ4jRnZigotpDM2OIRmq4YpKnD1CGI1O845VrEhxJnwDK/x
	Xh/neCEgi4Soecb5cbVP2P5k0ZEUuwARcdeuvGX0fBRb8V98qYpB2zVctPV+9Bic9XAyGU12bbiV8
	R6DdaXJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIox-00000002TmR-3IlS;
	Tue, 04 Aug 2026 17:20:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIou-00000002Tm4-3Ev1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 17:20:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA7361476;
	Tue,  4 Aug 2026 10:20:47 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7BEB3F632;
	Tue,  4 Aug 2026 10:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785864051; bh=sj1EHV03UQltsOhcw1G68IonRj4eOw7609iEBSE4aJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YlDvrxC7mPzWVwVWkIod7BNj7FtOE4DLXcnRAhn/zykfDwWxHtuD8uKeHPQYQCBbX
	 Io9obX8TqjiQiSrRncLa/lg71pMCILoFqCxLIsNZigx1SN1OfPRs8ndyulo9+ZsCBW
	 BMczIWPFzqcUjbAkNp+H24+/fVDJ/Hp7dLN8PKm0=
Date: Tue, 4 Aug 2026 18:20:43 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Bradley Morgan <include@grrlz.net>, will@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC]  [Question] memset.S old code stuff
Message-ID: <anIfa959Zjws1iJz@J2N7QTR9R3>
References: <F8EBC118-3F46-4A47-AD0A-A68E8688938F@grrlz.net>
 <anIMAh8nL5rWS6d9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anIMAh8nL5rWS6d9@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_102052_879565_BF33EEE2 
X-CRM114-Status: GOOD (  14.37  )
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

On Tue, Aug 04, 2026 at 04:57:54PM +0100, Catalin Marinas wrote:
> On Thu, Jul 23, 2026 at 12:17:15AM +0100, Bradley Morgan wrote:
> > Hey folks, sorry for the crazy asm emails, I see that in memset.S in
> > arch/arm64/lib/memset.S, the code is incredibly old code, like 2013 old
> > (heh).
> > 
> > I was wondering if I could say, adapt it from optimized-routines (same
> > treatment as memcpy.S essentially.
> 
> I think Robin attempted until he realised the use of the Q registers in
> the Cortex Strings library, mentioned here:
> 
> https://lore.kernel.org/all/cover.1571073960.git.robin.murphy@arm.com/

We also subsequently looked at moving away from Cortex-strings entirely,
e.g.

  https://lore.kernel.org/linux-arm-kernel/20230314115030.347976-1-mark.rutland@arm.com/

... but there were open questions on the semantics, and no clear path
forwards at the time.

Writing the code isn't the hard part. We need to get wider agreement on
the semantics, test on a variety of platforms, etc.

For now, I think it'd be best to leave as-is, since it's a time sink for
reviewers.

Mark.

