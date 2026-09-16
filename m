Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1388C88E5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 10:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWX9XTTIbsH6CkE09cBAkYAuFL80K/bMW6Qsdf7VxgA=; b=oBXb/CkyClWCCreFCsrLxceEm/
	BLLh2UBUTGre9DEXGeQ/tNCsM8tA2EbhF3pVcMF+XuW53JJhNX77WAUSuO+i92YqXF3mvkZZl26aw
	F1+5slFDxhCCOUpbD4ymdAj7tllbmli4JV3gDj6W4c11gJE3FTxHToOCZXPe8FHeUHO/NoNwdWkmJ
	BUAIJgbwF8WYQWdZE2cj/8WDDprOxhwDwpnxFK3bQizwAeambNH/J1Mgojseu/eE9m7dcI2aSQUnD
	4KfAcyzAJLbZoBk3Ty9SL8zsC6pvOnum9IAQg/vxC82XsVTpJuk2rGyA1PeX1AOAZU7tIIx0+yVUp
	g4MpOgzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6meB-00000008wmY-40y6;
	Wed, 16 Sep 2026 10:13:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6meA-00000008wmA-2yxC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 10:13:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EF2596053C;
	Wed, 16 Sep 2026 10:13:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13E2E1F00893;
	Wed, 16 Sep 2026 10:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789553625;
	bh=tWX9XTTIbsH6CkE09cBAkYAuFL80K/bMW6Qsdf7VxgA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=XL0PWXG44WQGiuE+d5v5410XtKkGdRPNMn/8Zvt9F0p4DkYZQXhN+c779oG7yxNFJ
	 4kd2AC9DsART3a/Qzg5sDQ0jhFbx9PuJ76yqP8whSoWNqKhOLky+Xa2mKqAlmGU7t2
	 dqEd8pmaDyFNtR1ZspVa0TzxkcG7HU79bmh9PwVYDp353Fv9QYCXa7azn5ZVxkh8oI
	 ZEGc0LF88FuIWX9QJkk73Jy4umyt2rRg3V5SUAszmiP4cRVlMhreqlQL8YcZr16qqx
	 2ljVrq9FQW7tN1hppXcnH4Y9iDFULtKw0dxkdkElaeEoCYyCFmBZqZVc84r7al2F5h
	 Uiuv7OKTm3lMw==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 3A58D198006B;
	Wed, 16 Sep 2026 06:13:43 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Wed, 16 Sep 2026 06:13:43 -0400
X-ME-Sender: <xms:1WuqauEb7ZIVxkuWchGLCPSFQ0nUEdoJYy7CGw3Dc67gg3jirfR7MA>
    <xme:1WuqaqLY-0JGs5fQ3X5x33fEBKrt-pstD6wogkBUuWh8UN_QMpLGbIQvUwTx8HqSI
    ZqnX75Lnas3qI2SV9lc1tgcyvTYbiSqUPH-n_hQqrXlF7r1_J-TUEc>
X-ME-Proxy-Cause: dmFkZTGmUXuEW/3d4cAi8SqE8L3ARbJy7mmUeFN9ytA9sCvUWqzTSx1wi0ub4wVqQw/XVC
    Gh4Q4SyQjlSHpC/XrKQ56ZrwkIkbS1m7+TA9vt9R8oRidnhDDNeaKFlNUqqyqdyA+143iO
    a926gTui8euD0SvUcbnuekcmNOw/yIdkZpE5t8iYblKVj6qXb2UMtS5v4maiQPyZbNMFOF
    4TF7mNOMiby1sHBFvOiaAorGXiq8uCngDJTmb1mIhCrubcho80qsBoSO+73jFCNnnwelOs
    nTiaETOxp8fQEcxURkd6VU5XngdF/7DA6hvQRpnuYLNCudeoPC0Hxa0V/kWcxG/Tb/24To
    xgWsGbFbjE71zzCuTYZ1XFWPpK8IzNCWc2vnYyD2A1rx1RFnp7uezGSWMQ0OgrCtsDGZXP
    ZcwwqSEDKCu1guOdWvrq45fVgJ7PIGrmOtcwS33Yxf8bAE4prqeL16QqFx3EKAvbkQ8RdK
    M2tnsS8FhAxXSpZ7/QUA/bmnApSDXekqQmTAKO1+rtJkN5fgabN05t4ltJUiSe1uGYYkLL
    EItm5kbQbEAz7a8lIepEhkXnOKzw2iaZLmTt+KDoGOcofCiz7s8Q6LmN3S8IpSpAaXOZyb
    dm16Sn1qxm3u6/MueZiA47FQirjwN6lDb0lPFaSWjbuPb2eSOdSFDiGXT6HQ
X-ME-Proxy: <xmx:12uqajyQZjNkFahfPowdOOPii0bUJ9RuWR9Mwl6F0aeAlOCtgz6RIA>
    <xmx:12uqaknBfutezEqnVHZn5GCs5eiGARD6-EukAOgFRigIqlDOXW4DLA>
    <xmx:12uqakmxYQquFjmXSj34HPZEUL_aGh3WlYle-vT8l06iXCD4KQW4_w>
    <xmx:12uqauwwXH3aatReegpugzX8_uk5R74OoXXud1dIkkplWlRgdibTvw>
    <xmx:12uqahpTzQOxXhT9ZhGsQyqxKltqb3ZjdAP-ECNnpTunFWrz0585L135>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 97F7FF80080; Wed, 16 Sep 2026 06:13:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 16 Sep 2026 12:13:21 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Vladimir Murzin" <vladimir.murzin@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, liulhong617 <liulhong617@gmail.com>,
 "Mike Rapoport" <rppt@kernel.org>
Message-Id: <947a1506-dfe4-4906-9673-6a7227946433@app.fastmail.com>
In-Reply-To: <20260908162033.74509-1-vladimir.murzin@arm.com>
References: <20260908162033.74509-1-vladimir.murzin@arm.com>
Subject: Re: [PATCH] arm64: mm: Fix pfn_is_map_memory() misreporting mapped memory
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

(cc Mike)

On Tue, 8 Sep 2026, at 18:20, Vladimir Murzin wrote:
> Commit 7ace06a01efa ("arm64: mm: fix accidental linear mapping of
> no-map reserved memory") removed sub-page no-map regions from the
> linear mapping. However, pfn_is_map_memory() can still report that
> such a region is mapped.
>
> For instance, with 64K pages, say we have
>
> normal:        ...=E2=80=930xa2007fff
> no-map: 0xa2008000=E2=80=930xa200ffff
> normal: 0xa2010000=E2=80=93...
>
> The range 0xa2000000=E2=80=930xa200ffff is not linearly mapped, but
> pfn_is_map_memory(__phys_to_pfn(0xa2008000)) aligns the address to
> page granularity and passes 0xa2000000 to memblock_is_map_memory().
> That address belongs to the preceding normal memblock region, so the
> no-map region is ignored and the function returns true.
>
> Fix that by checking if entire page is subset of memory block.
>
> Fixes: 7ace06a01efa ("arm64: mm: fix accidental linear mapping of=20
> no-map reserved memory")
> Assisted-by: LLM
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/mm/init.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index fbf215ecc7d0..5da80e1e1727 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -172,7 +172,8 @@ int pfn_is_map_memory(unsigned long pfn)
>  	if (PHYS_PFN(addr) !=3D pfn)
>  		return 0;
>=20
> -	return memblock_is_map_memory(addr);
> +	return memblock_is_region_memory(addr, PAGE_SIZE) &&
> +		memblock_is_map_memory(addr);
>  }
>  EXPORT_SYMBOL(pfn_is_map_memory);
>=20

memblock_is_region_memory() only tells you whether the range in
question is covered by a single entry in memblock.memory.regions[].

memblock has other flags, which may or may not be set on sub-page
regions too. So I don't think this is the right solution in the
general case, even if it fixes your example.

Given that the no-map attribute fundamentally only applies to page
granular regions, it would make sense to round those outwards
whenever they are created.

--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1119,6 +1119,10 @@
 int __init_memblock memblock_mark_nomap(phys_addr_t base, phys_addr_t s=
ize)
 {
+       phys_addr_t end =3D PAGE_ALIGN(base + size);
+
+       base &=3D PAGE_MASK;
+       size =3D end - base;
        return memblock_setclr_flag(&memblock.memory, base, size, 1, MEM=
BLOCK_NOMAP);
 }
=20

Note that I recently removed the frivolous use of MEMBLOCK_NOMAP in
__map_mem() so the remaining calls should mostly be true reservations
originating from the boot environment.






