Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D15CCCA471
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 09:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TRApfScKaMNneYN1rumahFas/MGOaxbIXEfgPY+Jdgk=; b=Lf6RljEhGm5FGKMO8hSacNERpT
	GqP/+p6R6jLYpkdI9x8wPJorTy7ZVnmiMn0fGSmvUi8675I2ylHEAeGxyc0m2D2PYPwa/wGdju2eT
	893iINj/NsoJ710qzldiVoRwDjjFKLkaIztM3T3TG4Vk1WRHCe9iodaRzJxV5SDgGmAqYXYEefOdp
	sI6Jwq18IghXAht4iluCJ87a2gJBUDhGXVkaRLY8n3EhQfCZOcGNi7MP/uJkDLs2MZ0pTDc0JI+02
	DlrB/O3q4HeHTGVla1ylnQ5883tvx+mKh0TBFbkiG8vdDmFaDOeNbJez85ZM0/nRfDZiSa6wRx3ig
	Vb7HVYyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3tEf-000000079ro-0ms7;
	Wed, 01 Oct 2025 09:34:57 +0000
Received: from mail.wilcox-tech.com ([45.32.83.9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3tEc-000000079Vl-2tjC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 09:34:56 +0000
Received: (qmail 1389 invoked from network); 1 Oct 2025 09:28:15 -0000
Received: from 23.sub-75-224-99.myvzw.com (HELO smtpclient.apple) (AWilcox@Wilcox-Tech.com@75.224.99.23)
  by mail.wilcox-tech.com with ESMTPA; 1 Oct 2025 09:28:15 -0000
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH] arm64: Kconfig: Make CPU_BIG_ENDIAN depend on BROKEN
From: "A. Wilcox" <AWilcox@Wilcox-Tech.com>
In-Reply-To: <20250919184025.15416-1-will@kernel.org>
Date: Wed, 1 Oct 2025 04:29:29 -0500
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Marc Zyngier <maz@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Hanjun Guo <guohanjun@huawei.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Guenter Roeck <linux@roeck-us.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <AB60B7DC-DB63-4DA6-A4EB-B3A1170C7ABC@Wilcox-Tech.com>
References: <20250919184025.15416-1-will@kernel.org>
To: Will Deacon <will@kernel.org>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_023454_751019_FE56034C 
X-CRM114-Status: GOOD (  26.86  )
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

On Sep 19, 2025, at 13:40, Will Deacon <will@kernel.org> wrote:
>=20
> Big-endian arm64 configurations are vanishingly rare, yet we still =
claim
> to support them in Linux despite very limited testing or visible
> interest. Supporting big-endian adds unnecessary burden to reviewers =
and
> contributors which, without any known active users, is hard to =
justify.
> For example, recent work to improve our futex routines and to =
implement
> nested virtualisation support is non-trivially complicated by having =
to
> support both big- and little-endianness.
>=20
> Back in 2019 [1], it was claimed that Huawei were using arm64 =
big-endian
> machines in their telecommunication products but I don't know whether
> that's still the case and certainly haven't seen any patch =
contributions
> to help support or maintain it.
>=20
> Make CPU_BIG_ENDIAN depend on BROKEN as an initial deprecation step
> towards its removal.
>=20
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Hanjun Guo <guohanjun@huawei.com>
> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Link: =
https://lore.kernel.org/linux-arm-kernel/73701e9f-bee1-7ae8-2277-7a3576171=
cd4@huawei.com/ [1]
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>=20
> Cc'ing Guenter as a heads-up in case he needs to turn down his testing
> to avoid this causing a false regression report.
>=20
> Cc'ing Hanjun and Jonathan for clarity on the telecommunication
> situation.
>=20
> arch/arm64/Kconfig | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index e9bbfacc35a6..5ac670d41604 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -1493,7 +1493,7 @@ choice
> config CPU_BIG_ENDIAN
> bool "Build big-endian kernel"
> # =
https://github.com/llvm/llvm-project/commit/1379b150991f70a5782e9a143c2ba5=
308da1161c
> - depends on AS_IS_GNU || AS_VERSION >=3D 150000
> + depends on (AS_IS_GNU || AS_VERSION >=3D 150000) && BROKEN
> help
>  Say Y if you plan on running a kernel with a big-endian userspace.
>=20
> --=20
> 2.51.0.470.ga7dc726c21-goog


Hi Will (and others),

We at Wilcox Technologies Inc. have actually laid out multiple
projects and initiatives based on Linux aarch64_be support.  They
aren't yet ready for public release or consumption, but they are
definitely being actively planned and developed.  One of them is a
full port of a Linux distribution.  There have been successful runs
of Gentoo[1] as well.  The musl libc intends[2] support.

What would need to be done to help keep aarch64_be alive in Linux
while we continue our internal work and finish other projects?
Would standing up a CI builder help any?  Are there existing known
issues?  I've personally been experimenting with aarch64_be since
the early 5.x kernel series and I've never found kernel-level bugs,
only userland ones.  The kernel has been solid.

aarch64_be is quite useful to have as it allows developers to have
access to BE hardware "at home" without needing a S390x or PPC64
system that can cost many thousands of dollars.

If it's simply a matter of waiting for our initiatives to launch
to show actual interest and testing, then I can try to advocate for
those initiatives to be started sooner.

In summary, Linux aarch64_be works well on Raspberry Pi 3, RockPro
64, PINE A64, among other SBCs and SoCs.  We are looking forward
to multiple future developments using it and are willing to help
out where and how we can to ensure it is not removed from the Linux
kernel.

Best,
-Anna


[1]: https://github.com/rorybolt/Gentoo-aarch64_be
[2]: =
https://git.musl-libc.org/cgit/musl/commit/?id=3Ddfc1a37c441fe271dfb19c7de=
62acadc73e255aa


--
Anna Wilcox (she/her)
SW Engineering: C++/Rust, DevOps, POSIX, Py/Ruby
Wilcox Technologies Inc.


