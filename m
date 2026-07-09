Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31D64C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 11:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aq2hJyGRKLvKkWKfiH1e0X0B/O/ybeudItfJZRFRPuI=; b=YWY1K7lvGrXAF73fUI5VE4d1g/
	kfgdfB5U6Duhxvj+tcrj6xEcmuh2Bg/+97EidP+vkpYBp7QvIrGfsqjjLSf3t+nucxEU6a9j93KJP
	+i30KymVirLm1WddonPhZMfoFf0cBul3EHG76PyQw0ZTM4AWFrUT9iI6ZZRuqba9E21dFjKKfHSAg
	ENCC80GObQ3mTbnFlQ6excpYo4iy1iNav3erQIRXJdAaDXdjc9ssqP6NIDWbZKmNGSvvZw3W2mkQY
	rLMWvEUvt/QjL7yHAHecr/Sv8Lp2ZWRNynS2s6teXoZKsyp2UMmp8DQctuAQosxBAlPB8AQR8NAXw
	tuONWQ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmvX-00000002AJn-3hnx;
	Thu, 09 Jul 2026 11:28:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmvU-00000002AIs-3Yhb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 11:28:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F6D53570;
	Thu,  9 Jul 2026 04:28:12 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 135AE3FE53;
	Thu,  9 Jul 2026 04:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783596496; bh=b/16+LT0bK1iiXr4YXvyPrteGt8wl8xtRhIWB1SvV3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ves2DdBn3M1Qj1o5f6NScbNz8DpkQqjsWCTasnt5qBWiFq/BeUS4FpX0s78D/zCnF
	 y/Rr9GpLv9cHdqhee4mpqDInSiNeo5JndsKim8JurUGQUBztk9xoXyiK0mB/lKz0Rg
	 yPa7JR34lyXodNdyhHTh8ONsbOtJrrbfzUsb8l9M=
Date: Thu, 9 Jul 2026 12:28:10 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Mark Brown <broonie@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v11 00/29] KVM: arm64: Implement support for SME
Message-ID: <ak-Fyvzpj9SkF75j@J2N7QTR9R3>
References: <20260709-kvm-arm64-sme-v11-0-32799f66db9d@kernel.org>
 <CA+EHjTyAxBx4jhGq-Gme5hPi1ZyDAkL2CP_U22ykkQemD1dUhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTyAxBx4jhGq-Gme5hPi1ZyDAkL2CP_U22ykkQemD1dUhg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_042820_963552_B1497BCB 
X-CRM114-Status: GOOD (  11.18  )
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

On Thu, Jul 09, 2026 at 11:26:41AM +0100, Fuad Tabba wrote:
> > base-commit: 4c45e14df2f4e77982ad70d6d8e3fe750edd4c37
> 
> I think this SHA is local to your tree. I can't locate it, and neither
> could Sashiko [1, 2]. 

That's the tagged commit for v7.2.-rc2. See:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4c45e14df2f4e77982ad70d6d8e3fe750edd4c37

I think that neither you nor sashiko have fetched mainline recently.

I have it locally after fetching from Linus's tree, as below.

Mark.

| [mark@lakrids:~/src/linux]% git describe 4c45e14df2f4e77982ad70d6d8e3fe750edd4c37
| v7.2-rc2
| [mark@lakrids:~/src/linux]% git show 4c45e14df2f4e77982ad70d6d8e3fe750edd4c37    
| tag v7.2-rc2
| Tagger:     Linus Torvalds <torvalds@linux-foundation.org>
| TaggerDate: Sun Jul 5 14:44:06 2026 -1000
| 
| Linux 7.2-rc2
| -----BEGIN PGP SIGNATURE-----
| 
| iQFSBAABCgA8FiEEq68RxlopcLEwq+PEeb4+QwBBGIYFAmpK+lYeHHRvcnZhbGRz
| QGxpbnV4LWZvdW5kYXRpb24ub3JnAAoJEHm+PkMAQRiGsv8H/Rn7Hr3Hp8t6au8B
| xQueZThJWjqQ4v8pyLnXF6OomKiDR24OTXMCrFgDkcmZ7RK2ALqowI3tQVwLUTuI
| yUN0qL2z2y+LyTcO0CYf3Lple8KlgLAXYMsv7pGLsOvhS7BW2jW97/bcbpUNxoHb
| eghxqbIEnyRImUbbyg+nW7VVk65RKdPUNkBPXfQ2NMVwe+SDE5Rl+NXNVqDNjGad
| soDTUBrD9yXkWX+4s0myleE62UzzH5nYgGPQeQgYmzWgq7LybH6WBlbQK9D7ODJR
| Cw3LCq1hwZZ2w04Yx+XwMHquGJYHW8L2pj77h95uhzksz8buKnM0AGwBCTC6RMoi
| AyUQvdc=
| =JUWl
| -----END PGP SIGNATURE-----
| 
| commit 8cdeaa50eae8dad34885515f62559ee83e7e8dda (HEAD, tag: v7.2-rc2, kernel-org-tip/locking/debug, kernel-org-stable/master, kernel-org-rw-pm/master, kernel-org-rw-pm/fixes, kernel-org-powerpc/topic/ppc-kvm, kernel-org-powerpc/next-test, kernel-org-powerpc/next, kernel-org-powerpc/fixes-test, kernel-org-powerpc/fixes, google-android-kvm/master)
| Author:     Linus Torvalds <torvalds@linux-foundation.org>
| AuthorDate: Sun Jul 5 14:44:06 2026 -1000
| Commit:     Linus Torvalds <torvalds@linux-foundation.org>
| CommitDate: Sun Jul 5 14:44:06 2026 -1000
| 
|     Linux 7.2-rc2
| 
| diff --git a/Makefile b/Makefile
| index b9c5792c79e01..b4035d3cef266 100644
| --- a/Makefile
| +++ b/Makefile
| @@ -2,7 +2,7 @@
|  VERSION = 7
|  PATCHLEVEL = 2
|  SUBLEVEL = 0
| -EXTRAVERSION = -rc1
| +EXTRAVERSION = -rc2
|  NAME = Baby Opossum Posse
|  
|  # *DOCUMENTATION*


