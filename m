Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61534C5AD05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 22:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Cc:To:Subject:
	From:MIME-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Quf92lF6C+YF//JgzY89fF9Z54wBSk3iWTnjDRWBm3M=; b=ZzfTw9byUEGfu5XZ7VDrr9mteU
	1kk5HWPpO/wy2vNdE8QI5ylMgyIyzpyyzgV/SLt6sP3u44Y5XyM31xGkVa4xQNBniYJQ4PXU1AI/t
	fzT0lefhKjeWu1bznqu/Jhd1kg78Eb1GR+MNUxtS2wigG0RXi0CDyNfrWi2rLhVF7aegtZ0IpjU/X
	IgW8+N0ZQGCiFqscXGnO3Ceblhf4iwDeNR/2g4lo5TnlsB+vuYgwqUx8Gs741OORbwa2Tq5mQEKLp
	GUVoPWXkKkDr90kxt8m+FeZpX20z6Utkp1gVQ8Pp8GlL90PezaTy6ZYI9fvOa0ThEITC56KgbL8kT
	ID1txUpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsSbw-00000008n9M-2hNX;
	Fri, 07 Aug 2026 22:00:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsSbw-00000008n9F-0VMD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 22:00:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 39484600B1;
	Fri,  7 Aug 2026 22:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55FCD1F000E9;
	Fri,  7 Aug 2026 22:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786140014;
	bh=Quf92lF6C+YF//JgzY89fF9Z54wBSk3iWTnjDRWBm3M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GyYMMaiepK4f/MfevSHCv+CYqEaIQjV+IX7lP77M5foo9CM8BzXbFIm9KASzDfj6G
	 /gsgcLP47M8UO46PHD+iFGpfteimiN4HsimtrngkNaU4k8NdIQl14SXBxcyOsNqbiN
	 3gxSDaejEDpJeHMw9zrOmF1UQwts+VL+jBe4u238eigbfkk472tNKV7lWQEe1oVvBF
	 xobT3XiAPKmCL877riR3r/O/jS/dLa7w9p3N4bftGWVhT+eL3nTsEu70FyA4dovira
	 0WihFrRNV50O/eAn8dp3nH3/ZWlZ/SiZd8Fc2UJG2ane87yqHWhENG1ZQVZSCuwnvL
	 dOfiTZZ1lfQFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64/module: Fix livepatch BTI exceptions with Clang
 21+
To: "Will Deacon" <will@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>
Cc: "Joe Lawrence" <joe.lawrence@redhat.com>, linux-arm-kernel@lists.infradead.org, "Mark
 Rutland" <mark.rutland@arm.com>, linux-kernel@vger.kernel.org, "Miroslav
 Benes" <mbenes@suse.cz>, "Ard Biesheuvel" <ardb@kernel.org>, "Petr Mladek" <pmladek@suse.com>, "Song
 Liu" <song@kernel.org>, live-patching@vger.kernel.org
In-Reply-To: <ed4fe1f95071897859ec7fbe9176246cbd4962bf.1786138806.git.jpoimboe@kernel.org>
References: <ed4fe1f95071897859ec7fbe9176246cbd4962bf.1786138806.git.jpoimboe@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 22:00:13 +0000
Message-Id: <20260807220014.55FCD1F000E9@smtp.kernel.org>
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
Reply-To: sashiko-reviews@lists.linux.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Direct assignment to read-only memory in `module_emit_plt_entry()`=
 and `module_emit_veneer_for_adrp()` causes a Data Abort kernel panic when =
resolving livepatch delayed relocations, and misses instruction cache flush=
ing.
--

--- Patch [1]: [PATCH] arm64/module: Fix livepatch BTI exceptions with Clan=
g 21+ ---
commit b15500d2c41dfd08d4a46e3f6cffc977c910f40a
Author: Josh Poimboeuf <jpoimboe@kernel.org>

arm64/module: Fix livepatch BTI exceptions with Clang 21+

This commit fixes a BTI exception during livepatch module loading by using
RET instead of BR when branching to static functions that lack a BTI landing
pad. It introduces a check for landing pads and adjusts the branch
instruction emitted by get_plt_entry().

> diff --git a/arch/arm64/kernel/module-plts.c b/arch/arm64/kernel/module-p=
lts.c
> index 7afd370da9f48..4249b477daa8b 100644
> --- a/arch/arm64/kernel/module-plts.c
> +++ b/arch/arm64/kernel/module-plts.c

[ ... ]

> @@ -23,14 +26,45 @@ static struct plt_entry __get_adrp_add_pair(u64 dst, =
u64 pc,
>  	return (struct plt_entry){ cpu_to_le32(adrp), cpu_to_le32(add) };
>  }
> =20
> +static bool plt_target_has_landing_pad(u64 dst)
> +{

[Severity: High]
This is a pre-existing issue, but does direct assignment to the PLT memory
region cause a Data Abort when livepatch resolves delayed relocations?

When a target module is loaded after a livepatch is active,
apply_relocate_add() calls module_emit_plt_entry() on the livepatch module.
Because the livepatch module is already in a live state, its .plt section
has been marked read-only via strict_module_rwx().

Looking at module_emit_plt_entry() in arch/arm64/kernel/module-plts.c:

module_emit_plt_entry() {
    ...
    plt[i] =3D get_plt_entry(val, &plt[i]);
    ...
}

And similarly in module_emit_veneer_for_adrp():

module_emit_veneer_for_adrp() {
    ...
    plt[i] =3D __get_adrp_add_pair(val, (u64)&plt[i], rd);
    plt[i].br =3D cpu_to_le32(br);
    ...
}

Since this direct assignment bypasses __text_poke() or aarch64_insn_copy(),
does it trigger a panic due to writing to read-only memory, and also fail
to flush the instruction cache for the newly emitted PLT entry?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/ed4fe1f95071897859e=
c7fbe9176246cbd4962bf.1786138806.git.jpoimboe@kernel.org?part=3D1

