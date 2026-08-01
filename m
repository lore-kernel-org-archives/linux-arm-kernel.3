Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FD7C55173
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 12:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tf5IyffjllS+708odQigshftMMlYY8RnVsHPMtEIX2U=; b=uZXdcsZ0Tgl5fHUvD92U8j4i4Q
	1XU5sE+q22eemG1Qdu6lor0TFHnBZU0t4sAscgY/pyRMIqfyCmNN6Sj3P/DWJxamNW/w+1ad1M0Hg
	i3cSToqTKAgeSueCrIMCpgOylEZbtKfEJocTv42E2B4x108+YnKT0aS8MbgsoD4tz5YoqroXmGfJM
	5EFqfs/pyfwkgLGGQIqsuQ6itKOY1R0S72qbl6mXpQZ7nnx57sjD5QgkDR3dxDfcvBUnvaQaJ4xwD
	Wl+WSzKUmOR6m8a7gECrSL601xxl8WWLtoTs3mbF/ID7XesHWXenEJZXe5AgmTwyqvxVuOPDZ7E7y
	0BCBwLbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq975-0000000Ef4r-3ZLq;
	Sat, 01 Aug 2026 12:46:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq974-0000000Ef4j-1Osz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 01 Aug 2026 12:46:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 143E260A83;
	Sat,  1 Aug 2026 12:46:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 339FA1F00AC4;
	Sat,  1 Aug 2026 12:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785588407;
	bh=tf5IyffjllS+708odQigshftMMlYY8RnVsHPMtEIX2U=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=e2Jw3R2WANz9QjEbAH4ycqZxQxqFOAuMaBJlLUYWtjOf5BlAjRMvv/XDLsZHp2w7E
	 EMpENVh+AWfCDSalkNTNjuLOAOZkJpzeAFbo4WouEhWCTdQse5QShSdrbHOgzelaCc
	 Q6SDdr4VUCwPNlB3TMphDZmGKVDowBGQNCeEK2Pn2O6Ehep3qq7XptTqib46otluua
	 Lq/WCbFQlwVIVw6RUJVOaTOa6rcMfA+gQlXae4XF+Lpa+Bb5QN+/mVeZ1nWQ+Ab/XM
	 FLHnoCeUDHgs19JalLXs9VrTE91eP9V1KkpCtm4jMMvieI3/2dPE89LceJ38SVrwqN
	 RuVmg2WoVnVJQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 25ADDF40076;
	Sat,  1 Aug 2026 08:46:46 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-01.internal (MEProxy); Sat, 01 Aug 2026 08:46:46 -0400
X-ME-Sender: <xms:tuptajN77YWcQ1dxjvoS3jCgZ1LhypwCLgqmgwcIGGaLEUYKoJbCGw>
    <xme:tuptaowaYAtunAeejFyeRzx2yqIqQ5bIf_qJjHiWWNZUtxwDSzVnU91IyGwqPDxEQ
    9BYrG5Ac9XKVMoow7NHvwOB5dYqxES44qag1U-jJ533FhQaWtQWJugP>
X-ME-Proxy-Cause: dmFkZTGa6PLZcs1LpqN4L73CsbcZGDLLhKz/BVsXFGl9g6gfOidm/t37MBGvliBaIf5YQD
    UIRQh3AzdMy/0nj+IGAK8MZE2WO0R5tcQFg3zaTiJI1dlFkXWfUHAXzmQKe/7MllXKOgQV
    w/iie8PhImQcaMFd8v5Ogn9MZV3vgF1O0NoTHI+/hCP9/wahJFHyvvogqeJJ87RE/ASdyi
    nRyt78ZSwJqyoHCanLbq7Fzm2UmMydi1+Z0W1DyHPE0fUa9ibbI+nrdlWU1voRLDb8nlKx
    LEjDyrxBS1FQyu3L7b4gI6moaCnK2RSzC8YBxbMqGdLWOIrfftFwJTJ8gr00s0jzslLvQD
    7LaQVGYT9X+3Jp+dlzCZ2E9zcuDscOhPpB9lW77H6I0EbV/rMunu1tKTOa35db3nX8jwHT
    87bGGLzfzajXtd/qi6VSt5YGckbRP9BJCZpH5BJPjUA/gTu4ZVUoEPr4tvSR7ovS6iZ2ul
    4DIJdqa7rGUnIJ1ld/0ziKxzNGrkN+1/Z/TMnM9vzmvhzagnLFteg98Lf7N7esknqCTSaB
    /nFbS5f5FZArIJlKgnj25RNzO8Z8eo52+heqWD9xp94t93SF21WYC3+j8TRf9jWP8yY0Yg
    /12hawWiRdQr1jppjKmhIjHGmy/b8LjZ+GBbjGeRh/qpIbV2D+cChFwSGImA
X-ME-Proxy: <xmx:tuptas74HbYmwrivJpbEZ3_0Lg90FEoxfQxDOvnTAm2S8j2Io3prWw>
    <xmx:tuptanNzIV71YaVLodrKHiafPehIuTW325jKDTFDiAJa5fIJKo34Vw>
    <xmx:tuptaitJcbBSSH11iwXDgzqsALq4ABAkU7i8ORrmP27OwrQPasNd0A>
    <xmx:tuptaibozDTa_SzfgIOqMvL4twatGW9F_cJM84CA3RhLZlGTANysfw>
    <xmx:tuptasxy4ZgSC-V9f6SCyb-EQTYL_e4zXS93x471gUXbMDwA_VSsb6r3>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0D13A182007E; Sat,  1 Aug 2026 08:46:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Sat, 01 Aug 2026 14:46:25 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Karl Mehltretter" <kmehltretter@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Message-Id: <21e446ee-4082-4a0f-8e73-694e3a569c43@app.fastmail.com>
In-Reply-To: <20260718091600.92021-1-kmehltretter@gmail.com>
References: <20260718091600.92021-1-kmehltretter@gmail.com>
Subject: Re: [PATCH] ARM: smp: set current pointer in assembly before jumping into C
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

Hi Karl,

On Sat, 18 Jul 2026, at 11:16, Karl Mehltretter wrote:
> With CONFIG_KCOV_INSTRUMENT_ALL=y, secondary CPUs fail to come online
> on ARMv6K/ARMv7 SMP:
>
>   CPU1: failed to boot: -38
>
> The compiler inserts a call to __sanitizer_cov_trace_pc() at the entry
> of secondary_start_kernel(), before set_current(task). The KCOV hook
> dereferences current while TPIDRURO is still uninitialized, causing a
> data abort before cpu_init() has installed the exception stacks. The
> secondary CPU consequently never completes startup.
>
> Initialize current in the secondary assembly handoff, as
> __mmap_switched already does for the boot CPU.
>
> Fixes: 50596b7559bf ("ARM: smp: Store current pointer in TPIDRURO 
> register if available")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> Tested on QEMU vexpress-a15 (mainline and v6.12) and
> realview-eb-mpcore with and without CONFIG_KCOV_INSTRUMENT_ALL.
>
> The head-nommu.S change is untested because no currently reachable
> Kconfig combination enables non-MMU SMP.
>
> The redundant set_current(task) is retained to keep the fix minimal.
>

Please drop the call and the entire function: no need to keep around
redundant code.


>  arch/arm/kernel/head-nommu.S | 1 +
>  arch/arm/kernel/head.S       | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/arm/kernel/head-nommu.S b/arch/arm/kernel/head-nommu.S
> index b9d6818f1ee1..f80bbfbd3a6f 100644
> --- a/arch/arm/kernel/head-nommu.S
> +++ b/arch/arm/kernel/head-nommu.S
> @@ -116,6 +116,7 @@ ENTRY(secondary_startup)
>  	ldr	r7, __secondary_data		@ reload r7
>  	ldr	sp, [r7, #12]			@ set up the stack pointer
>  	ldr	r0, [r7, #16]			@ set up task pointer
> +	set_current r0, r1
>  	mov	fp, #0
>  	b	secondary_start_kernel
>  ENDPROC(secondary_startup)
> diff --git a/arch/arm/kernel/head.S b/arch/arm/kernel/head.S
> index f22c50d4bd41..a22403a629ef 100644
> --- a/arch/arm/kernel/head.S
> +++ b/arch/arm/kernel/head.S
> @@ -442,6 +442,7 @@ ENTRY(__secondary_switched)
>  	adr_l	r7, secondary_data + 12		@ get secondary_data.stack
>  	ldr	sp, [r7]
>  	ldr	r0, [r7, #4]			@ get secondary_data.task
> +	set_current r0, r1
>  	mov	fp, #0
>  	b	secondary_start_kernel
>  ENDPROC(__secondary_switched)
> --
> 2.43.0

