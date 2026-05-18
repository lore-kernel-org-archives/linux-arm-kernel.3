Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9940DCD4F49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 15:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/AVztdEnoY6zvg7Qrqh6W0cwGIyomUrRR3N62SXiDU=; b=jaHtKho6jZPTGZ4S/nL5Vwi6SW
	te+F58/bXNhARiNt3f+DrruWJFYIllkbTN476gJYCMjahUaMh1m9s+EYtXZd5rhKy5s0c61lDn0p0
	tkyVSjR0NoqOfAlP7N+1Tn5lcZDl25DKhuF1hlXwsifFDk4JnuICffPhpUbuApulzbBGbi/PVJ3Wo
	fRbsfGqjkTQuIsyc+0sa+ITwAGjnmn38R3NTXl3dQTzbUzx3kdmCOaIY0yxXzT8uMu5X8pu8Z8jGb
	ULsP98S/T+/bA6uDzGQxUE/wmkcj1ISRy5D0zsLuw8+9Abm/8buz/q+Z37MSOrflz2DzZBnIm0KU1
	E9OW/yCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOzq1-0000000G91W-19gl;
	Mon, 18 May 2026 15:25:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOzpz-0000000G90j-0Lgk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 15:25:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C84C443A7
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 15:24:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D989DC2BCC7;
	Mon, 18 May 2026 15:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779117898;
	bh=d1owoRKS9PjeHSHPQ+ZzJFllSUtve+KK+vjX2wSN8ZA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=IUhgtdeVD3rYbgffuIS+Gx/ZbcrXbC9RnqvEGIUAifq3ZZPQ+FIvc8KPxKFenYQJy
	 QsffajzXy6VXND8xtmZlbdRBoqkQL9gi1awYMwzr9+HycIVE4/qq3YeefMf0bys5gy
	 NSHMGJq7dFYgIy54zLpxGq6fNsUsU/dPDEb6tPj9NZDCAFbGYTI6eQ+XRofoIGMJCQ
	 5rmI2Jeb3D63y6xNowkR2r1Pwcn6RgkTpJcrvvPiacY/N49OCXz6BeYca+KWclXHai
	 SH8YAIn0KfbL9Fi+x/HMIncSnz8CUxBucmmfJdgFDzy6RcGGbjLUR5cXd0xABKMP9Q
	 1SfuQGYQIoqcQ==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0EFDAF40073;
	Mon, 18 May 2026 11:24:57 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Mon, 18 May 2026 11:24:57 -0400
X-ME-Sender: <xms:SC8LaiqGn5nJi99q0CMFkxEwseiXUGEPUeoJMan3eYxSQb1jVL0YHg>
    <xme:SC8LarevvLGyaAyHHJoIXR2RhTNL8053PggRNDztCcG6RhAcSKIUC_lItAvZcP1jk
    Z_o-5A9bVWOik4RQaNnjqWw2R18m9YAkDW15SfasCHuSw45uiiUdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeelvddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusehkvghrnhgvlhdrohhrgheqnecuggftrfgrth
    htvghrnhepjeejffetteefteekieejudeguedvgfeffeeitdduieekgeegfeekhfduhfel
    hfevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhguodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdekhedujedtvdeg
    qddvkeejtddtvdeigedqrghrnhgupeepkhgvrhhnvghlrdhorhhgsegrrhhnuggsrdguvg
    dpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshgr
    shgthhgrrdgsihhstghhohhffhesrghrmhdrtghomhdprhgtphhtthhopegthhhlvghroh
    ihsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrgiisehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehtghhlgieskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugi
    dqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghp
    thhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdprh
    gtphhtthhopehiohgrnhgrrdgtihhorhhnvghisehngihprdgtohhmpdhrtghpthhtohep
    lhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:SS8LapblXf3E9TsgE9wk3UDee37gx8mBAXI0Xyqmf4K9GW_SPsq13w>
    <xmx:SS8Lai9lOyq6hqCKUUAQoAl4SR6mCJCZG-GHrAQ4Z87_LwPIL0NjFw>
    <xmx:SS8LavkjpOjCNO3HTR7M9o4AqXGJDqgiRP_rrsXIqEP_BGGZAlF8pw>
    <xmx:SS8Lany8TauTPoYOIALV6aqzfAKM8vXTJHVNmSxnxP-RJWSdVY2_dw>
    <xmx:SS8Lap7YQJOe9gTfbdBKYIX_pSy7PQkeZ0RqeXXn0pJSHaJnYPo6b9kx>
Feedback-ID: i36794607:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E198A182007A; Mon, 18 May 2026 11:24:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AnGEpGJWe5kg
Date: Mon, 18 May 2026 17:24:36 +0200
From: "Arnd Bergmann" <arnd@kernel.org>
To: "Marc Zyngier" <maz@kernel.org>, "Christophe Leroy" <chleroy@kernel.org>
Cc: "Ioana Ciornei" <ioana.ciornei@nxp.com>,
 "Thomas Gleixner" <tglx@kernel.org>,
 "Sascha Bischoff" <sascha.bischoff@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Message-Id: <fae1a8f5-b00f-42b0-9ea0-1b2c05229a27@app.fastmail.com>
In-Reply-To: <86zf1wx0b4.wl-maz@kernel.org>
References: <20260224100936.3752303-1-maz@kernel.org>
 <177209938125.547814.7154250802402503122.b4-ty@kernel.org>
 <87v7cva080.wl-maz@kernel.org>
 <4f34dc22-8dd7-42fb-8c16-4e359faf60d6@kernel.org>
 <86zf1wx0b4.wl-maz@kernel.org>
Subject: Re: [PATCH v2 0/6] fsl-mc: Move over to device MSI infrastructure
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_082459_163417_6EADBF56 
X-CRM114-Status: GOOD (  16.01  )
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

On Mon, May 18, 2026, at 16:24, Marc Zyngier wrote:
> On Mon, 18 May 2026 14:51:48 +0100,
> "Christophe Leroy (CS GROUP)" <chleroy@kernel.org> wrote:
>>
>> > > Do I need to respin it?
>> 
>> No, I'd like to avoid having to rebase again. If you have changes to
>> the series please send followup patches.

Sorry this got held up even longer now. I meant to reply
earlier but dropped the ball on that while sending the merge
window contents.

This was indeed bad timing as the original pull request reached
me only after 7.0 was already out.

> No follow-up patches for that particular series, I just wanted to find
> out whether I could start posting additional changes that do not
> directly involve fsl-mc, but that are prevented by the current state
> of the code (such as trying to move the ITS initialisation much later
> in the boot process).
>
> I'll postpone my changes to 7.3, and keep my fingers crossed for this
> to hit 7.2.

I've merged the soc_fsl-7.1-2 tag into the soc/drivers branch
for 7.2 now. You should be able to base your other changes on top
of f0a2eac6a597 ("platform-msi: Remove stale comment") as a shared
branch.

    Arnd

