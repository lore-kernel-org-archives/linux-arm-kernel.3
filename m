Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC9FC79F99
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 08:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qVqBaro4u6j4vDM7zRBqf26XGAFIlsvWCm284+Ot/Vs=; b=RhAUUnFLiHfrYRB6FpKYg3sM3B
	YTQCSMx2vRkeF6FfSywHB3i5jecC0s8T4IZ/G2fagBZOndAbLz8G1Jee9ynlp/p2S5cZB4/D3rmkx
	pTn7c7ViiWoEkQwlBwKnNm+pZ5uuHFkeSZeeHww9Fgne4oi+xlJHoLiuG9zEgiSvc8gbB0ipbYN4W
	pgPP6OsVPZIgaRMbw4yakryb/dlOYbgYS+6/QckYotc2Lspzyr6a+BLgL89dPxiIWptkvrc227UuC
	27w2e3PXswZNMR3amZ46XW4pyTMp93xuP4TlkaWvuRe1Fy64LQ1j7auDFiIMYb2XTqcdfw+tuNWmx
	L6l20bwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x386K-00000004qBE-07N3;
	Sun, 06 Sep 2026 08:19:44 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x386E-00000004qAg-0mlo
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 08:19:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=qVqBaro4u6j4vDM7zRBqf26XGAFIlsvWCm284+Ot/Vs=; t=1788682778; x=1789892378; 
	b=uIxCGZt9HaZ2hlaAmwk3RXo8jxfwZQYEkT1mAHw4fHM7jLWZz2eZSKstEjtahmnqN6ogG/0l7Lc
	0r1P6owfkbVkm6eRlOaKKXLHN5e1gMqGFKb3wTqFS1C8p3kg5cxQcusbQ+cxERfVewBdut2HpQsca
	+HrCkk7rmEa54CdfcHUK9cojvRjFIvIec5lW5n6pYem5yb6qJ1G3jTEJGH7GReTFrpk+xCZpFNbcG
	VaYkUNS4bwwtXhl+lcFIBpvrbk9gJpustRsh9q4gvST/GM/1NX0lpVnpfirhHKEoEgUYwWPsMPe3v
	HlFNlq6Yo71vnlo/FgepHc2OkvC6C0X5I/lg==;
Date: Sun, 6 Sep 2026 10:19:10 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Borislav Petkov <bp@alien8.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>, Jonathan Corbet
 <corbet@lwn.net>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org,
 linux-doc@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo
 Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>, Dimitri Sivanich
 <dimitri.sivanich@hpe.com>, Mike Travis <mike.travis@hpe.com>, Tony Luck
 <tony.luck@intel.com>, linux-edac@vger.kernel.org, Krzysztof Kozlowski
 <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Tony Lindgren <tony@atomide.com>, Kevin Hilman <khilman@baylibre.com>,
 linux-omap@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 linux-ide@vger.kernel.org, Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Michael Schmitz <schmitzmic@gmail.com>
Subject: Re: [PATCH v2 3/9] docs: kernel-parameters: Drop the edac_report=
 entry
Message-ID: <20260906101910.588d055e@kemnade.info>
In-Reply-To: <20260905185037.GDapxkfbPNUxJgaMH8@fat_crate.local>
References: <20260905094649.41996-1-kmehltretter@gmail.com>
	<20260905094649.41996-4-kmehltretter@gmail.com>
	<20260905151345.GAapwxqT93wPWHF7u4@fat_crate.local>
	<apwzmSr6b0WEkW86@gmail.com>
	<20260905153336.GBapw2UFa7Sdc0ve_A@fat_crate.local>
	<871pb7zn36.fsf@trenco.lwn.net>
	<20260905162742.GCapxC_ra7hJd27LDR@fat_crate.local>
	<apxDtqM8UMN5KNjs@gmail.com>
	<20260905194720.7033b956@kemnade.info>
	<20260905185037.GDapxkfbPNUxJgaMH8@fat_crate.local>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_011938_232778_AE83B2B4 
X-CRM114-Status: GOOD (  18.25  )
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

On Sat, 5 Sep 2026 11:50:37 -0700
Borislav Petkov <bp@alien8.de> wrote:

> On Sat, Sep 05, 2026 at 07:47:20PM +0200, Andreas Kemnade wrote:
> > > That's for "not getting any answers" which is not the case here.  
> 
> No, that's the case ALWAYS. If you spam maintainers with too often
> submissions, you end up achieving the opposite to what you're trying to do.
>
This particular set was sent too fast, I agree, but reading that document again, it
sounds like the summary is being patient with busy people.

Some subsystems even discourage waiting in such cases:
e.g.
https://docs.kernel.org/process/maintainer-netdev.html
"Do not wait too long (weeks) between postings either as it will make it
harder for reviewers to recall all the context."

[...] 
> > But if the main maintainers (which is a bit harder to say in this series) found
> > time to review, than IMHO (also seen from my maintainer perspective), improve
> > as soon as you find time and submit the improved version.  
> 
> If you want an earlier submission, feel free to ask the person.
> 
> In the general case, though, one should do a good testing before submitting
> and all the issues caught after that, one can work in in her/his next version
> locally and perhaps even state so.
> 
Hmm, maybe I was misunderstood. Just to avoid that I accidentially provoke
patch-flooding with my comments:
The next revision should come only after you have finished your homework
(improve according to review comments, tests,...) and any further review
comments are unlikely.

Regards,
Andreas

