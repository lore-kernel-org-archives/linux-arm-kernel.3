Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94ABCD5B154
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 21:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lpvuxggg2hZ1NISeAeILUEGi1GT1MZ/GywcTb68Xrso=; b=UtHLKb7bKngidjz2iF4uR2LL9Z
	jlklITpzmPDDkWHLKCv/mGOnAZQVnI8+IlEH64bCUdLN/espQESS4YrcIwQNBOd2iaOgkgAqvinGT
	X7fv6IHQoPNBWE2d9py8pwlkytAcYJlR2HeBNYLKVIjxGnP6cRLTGVWAkhsqTaUavQFuzvCZGkWSX
	tZwgTyiMjMQT5E3D/bmakRb9IYy485pxa38M8EJC0gMr480S+gf/h0+nVK9qypcZ3nR1KnDF1PEAG
	wcRlppBcv7a9ZF5lwAGVsLRZCNWHkmhvKmwBxCbEFts1Qo+aRa4+RFoDtzCBxoy5tpeNHuNiqykz5
	39KYg5qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5XTU-0000000CMzk-2Jwc;
	Mon, 28 Oct 2024 21:40:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Wvj-0000000CHnH-2xyE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 21:05:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 25CF25C5B0D;
	Mon, 28 Oct 2024 21:04:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3440AC4CEC3;
	Mon, 28 Oct 2024 21:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730149538;
	bh=jSREJ7Vl/o+COTD1EEPwv67TR+VkaOCYrWUpvL9ukks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oBUmn9j9Y+PRaVYQCasQncMKxmL+hWaAtwv+egQ0g6kcZ6hFFjEFIhVHx9CFoAUt3
	 EigaqFyJCHORXAatM5pOdygAa+d80mA3Pdeid45b8co8LnBoUM3DuleeHRb8yRsTgK
	 SZG++pY1owDVpgA3wRxYnsayqJbkPD8IJigeXEEgnWRWUxdRvxbUElMtYoMdJddQcg
	 zuF3h7tgxKpMwMxGPk0Dx9Fs0SgSxoFqs2uUZ3a8ZP2F9JJjUVmJQIylZY/g9TJOaQ
	 omHKQ7BwvoGb8jnYElL0AqhF0K//6gFAICjcXmpOGKfSn+pFa64lslrKkaMAB4FI+o
	 LuolpX99WNJxQ==
Date: Mon, 28 Oct 2024 21:05:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Peter Xu <peterx@redhat.com>, linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Aishwarya TCV <Aishwarya.TCV@arm.com>
Subject: Re: [PATCH hotfix 6.12 v2 4/8] mm: resolve faulty mmap_region()
 error path behaviour
Message-ID: <91d9f81c-b971-4764-8f21-4011023628c0@sirena.org.uk>
References: <6e8deda970b982e1e8ffd876e3cef342c292fbb5.1729715266.git.lorenzo.stoakes@oracle.com>
 <61461dcc-e455-450d-9c01-5465003fc31c@sirena.org.uk>
 <c24a174d-c8f3-4267-87ae-cf77fa587e82@lucifer.local>
 <CAHk-=whD9MrPwPMBgVG16T_u+my8xYtZg2tUGz932HeodVX7Bg@mail.gmail.com>
 <438f50c5-8b8c-444f-ae85-10e5151f3f24@lucifer.local>
 <57mgmdx7wgfwci3yo3ggkmcnm3ujamgkwcccm77ypvmer5tegn@opiq3ceh2uvy>
 <ykzmur56ms7fm4midi6tbncjvcvf7ue4lp7e4orblrmwnefw3e@oa3enlpdrcrr>
 <bea02efe-a695-49e0-b15c-2270a82cadbf@lucifer.local>
 <CAHk-=whpXVBNvd0NJpw9=FGcuTuThwtfcKeM3Ug=Uk6kpChCPA@mail.gmail.com>
 <a1ffccb8-3f53-4486-a250-282ddc7054dd@lucifer.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="30okYTcXzfb7tVuJ"
Content-Disposition: inline
In-Reply-To: <a1ffccb8-3f53-4486-a250-282ddc7054dd@lucifer.local>
X-Cookie: Remember the... the... uhh.....
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_140539_855349_4A1A7848 
X-CRM114-Status: GOOD (  18.63  )
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


--30okYTcXzfb7tVuJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 28, 2024 at 08:43:08PM +0000, Lorenzo Stoakes wrote:

> +/*
> + * We check VMA flag validity early in the mmap() process, however this =
can
> + * cause issues for arm64 when using MTE, which requires that it be used=
 with
> + * shmem and in this instance and only then is VM_MTE_ALLOWED set permit=
ting
> + * this operation.
> + *
> + * To avoid having to tear down a partially complete mapping we do this =
ahead of
> + * time.
> + */
> +static vm_flags_t arch_adjust_flags(struct file *file, vm_flags_t vm_fla=
gs)
> +{
> +	if (!IS_ENABLED(CONFIG_ARM64))
> +		return vm_flags;
> +
> +	if (shmem_file(file))
> +		return vm_flags | VM_MTE_ALLOWED;
> +}

This doesn't build:

mm/mmap.c:1595:1: error: non-void function does not return a value in all c=
ontrol paths [-Werror,-Wreturn-type]
 1595 | }
      | ^

with that corrected:

diff --git a/mm/mmap.c b/mm/mmap.c
index d1ab4301c671..cea051c5fef3 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -1587,11 +1587,10 @@ static unsigned long __mmap_region(struct file *fil=
e, unsigned long addr,
  */
 static vm_flags_t arch_adjust_flags(struct file *file, vm_flags_t vm_flags)
 {
-	if (!IS_ENABLED(CONFIG_ARM64))
-		return vm_flags;
+	if (IS_ENABLED(CONFIG_ARM64) && shmem_file(file))
+		vm_flags |=3D VM_MTE_ALLOWED;
=20
-	if (shmem_file(file))
-		return vm_flags | VM_MTE_ALLOWED;
+	return vm_flags;
 }
=20
 unsigned long mmap_region(struct file *file, unsigned long addr,

the relevant tests all pass for me.

Tested-by: Mark Brown <broonie@kernel.org>

I'd have expected arch_adjust_flags() to be something overridden by the
arch headers (probably like arch_calc_vm_prot_bits() and friends), but
if this is juat a short lived fix it's probably not worth the trouble.

--30okYTcXzfb7tVuJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcf/JwACgkQJNaLcl1U
h9Cc7Af/aNeZKhCpi9WJcdYq9a3seoFWXO0Wh8lqOYlCIQBfxm+Y6ccCbS6kLiGc
f8sGnyhIrPFULEy32UIKW/+4j3V9hrOiSLzqxwZPhFk7jiiXyeUiB2+ysFlwQBQS
oM3cpTjdRGJh0KbskC9tV6oSr7lI2lZDQen5Uca/ZLIY92wT2cJpyXl5967J2T8r
7gH7ft7wtwHPc4BLdaVinER6exeKFc8ulT4DvgkLTEoWIbKY1cvPGSDLKgzp8P/Y
1z591P9PPF/CeSW2pyv40Oz+o0ywyAQAYYpRypIV8ClNn+y1JUd3wGPiNSYQtt7G
j2jMvOVNQ0ArYO32KNoj714a1Uz1ZA==
=pBTn
-----END PGP SIGNATURE-----

--30okYTcXzfb7tVuJ--

