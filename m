Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DC9D730A9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 06:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VZzYJ1OPaaFrBOFHgVd+bq+Znm9wwi1PJ8bRY8JaNa4=; b=TZMTWunmDUmd5qm2LsMtmYU5OJ
	23OfkfBejiZH+2o55VkwTkmUhwgoaZnSXVlYgav908g/qT+xhCFIDm5eZGODEeJ+nzR7zUf4YBbD4
	FQVBZEClwvbCQOK1HyHak5SP94X/auBdmMo58c9C27nIRIzxs1wKMMG01nKqIGSgMBcH41eEhUxfN
	aa7sbAkcsAeocnDLpmjkgE6+7uqjf9GsUkKQRlY7kO42aV7rb2UOZINpg920uBhsHWo1Cc1RTphhn
	8bc0a17qVZp2PDW4c54s7GiA04s3uTTySTdjVyyxZF07M3NEG06vRIbPaq7OvaVOGf3jGNNTXgCpo
	gpJbz1ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8YLO-00000001P9i-1iJy;
	Fri, 03 Apr 2026 06:49:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8YLM-00000001P9b-3kbl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 06:49:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E291960008
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Apr 2026 06:49:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71C9FC19424;
	Fri,  3 Apr 2026 06:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775198963;
	bh=EsIjX7BTm3rJrR+xnTUlzZBz1FaVfcjsMT+3BL2b6Tk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=lPU2xYfNVM7mP+/B9dBe/DhMIIc/4yQtOIuWMYy6BsUOG9fxtdUGp8J2TBOlG7q9a
	 A7JhnZe5Xa1n6Wf2amtg0HcXvO+Bj/0aGNHI2Xb615mGjrOyhVZko597VTP05x3tO4
	 tM/uvLb9Tr1MI9tGAiAgcQi3KrWxUpZhy7gzXANam1S2RKBoapBhalCYfYqsGOxxUo
	 8P6mt/DpkhlI2WeuB3wDGnHEYmIfPKVE/QVp3lY1slAFRe3ZQ0dFkMIkUpysfq8X60
	 xaam3N1+COMb2qQTAhJ6zHpvJzz5CD+GFJm3C+iWYXa+WLexLkTdBDeLhJOnWNsGSH
	 oOv/1EF5aOgSg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 66745F4006F;
	Fri,  3 Apr 2026 02:49:22 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Fri, 03 Apr 2026 02:49:22 -0400
X-ME-Sender: <xms:8mLPafDZKbDcCv7rtFg0a1ZRr0tFjiPfSSoflicr1_J9LKwxhsxm0g>
    <xme:8mLPaQU_boBoLNUpgXrLjwHMbsEPmkyJPgljT98SR_M9072DGsABTXVG1tWIxrG8U
    hqvioPBm5g7GL9nHnY6SyLjR0dS17O3PMmfQtEaQctLix_NpB9O3Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcuuehi
    vghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpedvueehiedtvedtleekuddutefgffdtleetfeetveejveejieehfefhjeeijeef
    udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    guodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdehtddtjeelqdef
    fedvudeigeduhedqrghruggspeepkhgvrhhnvghlrdhorhhgseifohhrkhhofhgrrhgurd
    gtohhmpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    peguvghmhigrnhhshhesghhmrghilhdrtghomhdprhgtphhtthhopegvsghighhgvghrsh
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghl
    sehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqtg
    hrhihpthhosehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:8mLPaSFZ-ZwcKrj5bnfF9mbOEhU6b78xY-AAkthe2XKwDhS06fH9tA>
    <xmx:8mLPaYuslSy-uIQ_sgVoXWH7zmXRJ_AtjsFJuhgzSsOumQPv3HSdKQ>
    <xmx:8mLPacU_ECrrWwZyQsF_j8e3dhAQiUuatQSMVTB5dFF2NiQSlfoatA>
    <xmx:8mLPacG35MTpfhkBX9kJjScp0eoGHG-70SsoCJosTbyqooBPoP6tqA>
    <xmx:8mLPaW3NBpxr-O7hmDA7augRB9A6FCItVZi0ZtZdwfxUeFwO-IKB2vYL>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4431D700065; Fri,  3 Apr 2026 02:49:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AfnkVD7BdAFw
Date: Fri, 03 Apr 2026 08:49:04 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Eric Biggers" <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Demian Shulhan" <demyansh@gmail.com>
Message-Id: <9b5affa6-0e04-4256-b740-6ffdad1747b9@app.fastmail.com>
In-Reply-To: <20260402234028.GA2256@sol>
References: <20260330144630.33026-7-ardb@kernel.org>
 <20260401195943.GA2466@quark>
 <dc424b4a-11b5-475f-a53a-987b5813bac5@app.fastmail.com>
 <20260402234028.GA2256@sol>
Subject: Re: [PATCH 0/5] crc64: Tweak intrinsics code and enable it for ARM
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



On Fri, 3 Apr 2026, at 01:40, Eric Biggers wrote:
> On Thu, Apr 02, 2026 at 10:52:17AM +0200, Ard Biesheuvel wrote:
>> 
>> On Wed, 1 Apr 2026, at 21:59, Eric Biggers wrote:
>> > On Mon, Mar 30, 2026 at 04:46:31PM +0200, Ard Biesheuvel wrote:
>> >> Apply some tweaks to the new arm64 crc64 NEON intrinsics code, and wire
>> >> it up for the 32-bit ARM build. Note that true 32-bit ARM CPUs usually
>> >> don't implement the prerequisite 64x64 PMULL instructions, but 32-bit
>> >> kernels are commonly used on 64-bit capable hardware too, which do
>> >> implement the 32-bit versions of the crypto instructions if they are
>> >> implemented for the 64-bit ISA (as per the architecture).
>> >> 
>> >> Cc: Demian Shulhan <demyansh@gmail.com>
>> >> Cc: Eric Biggers <ebiggers@kernel.org>
>> >> 
>> >> Ard Biesheuvel (5):
>> >>   lib/crc: arm64: Drop unnecessary chunking logic from crc64
>> >>   lib/crc: arm64: Use existing macros for kernel-mode FPU cflags
>> >>   ARM: Add a neon-intrinsics.h header like on arm64
>> >>   lib/crc: arm64: Simplify intrinsics implementation
>> >>   lib/crc: arm: Enable arm64's NEON intrinsics implementation of crc64
>> >
>> > I think patches 3 and 4 should be swapped, so it's cleanups first (which
>> > make sense regardless of the 32-bit ARM support) and then the 32-bit ARM
>> > support.
>> >
>> 
>> Ok.
>
> I can also apply patches 1-2 and 4 now if you want.  Let me know if I
> should do that or if a new version is coming.
>

Yes, good idea. I'll take care of the ARM stuff next cycle.

