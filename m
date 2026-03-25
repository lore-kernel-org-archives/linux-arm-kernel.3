Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA69FEA806
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 04:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27fWtX4e+LV3z70kuuRuZ5e8ys9OszIAeG99fDZYuvA=; b=N9N3aNSovqiJXgqBzp/MNgLd9V
	cRXedIZBZ+iCW9HfTjVEOpTED92TPG1tclfvCvr5uNves97BTl6SQURM43+ci94tMfXFwfoz/Hc4a
	LtAPsoFrs/pGcCNti6e4lL3Z5mTW3aeLNKTLW8paWLA1uLgswU3eAb052aS2V7Uhk/kWUA8vJAyfz
	MP/TujGTaystruO3tsurb1qIDDKEWy/GBHLitZw8sMPcKgfivND3tVnHIEcPYTShwKgknL95chRUE
	EmPGIBVZoE2Ke8VSR0Db/d/QITEj4TiCguLpcup6fp2VzViyaaYKem9cPB53fKeISXOMc+a/N6U3B
	c+z7Pd1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Fdl-00000002fGP-2EbP;
	Wed, 25 Mar 2026 04:14:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Fdk-00000002fGC-2nz2;
	Wed, 25 Mar 2026 04:14:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=27fWtX4e+LV3z70kuuRuZ5e8ys9OszIAeG99fDZYuvA=; b=pFghz8EzegyyVLdw26KGcoes3s
	dz3UmM1HQKq+rvfUtUWDTt00RObY7ZnF5FO3UWdYJfq6ZX/VFRRHIpgfcJLbIkaimSxkZwjgUEFA3
	bbS0TMoLsluXp0B8uU5g0eo/xGTZ+odoMXxR5/k83Es80YZ3tKOG234Vc+dOJbq4NQmwYLyqQSUqm
	ZFzPBzG5+mwYkBEGZwX3AvhGEpqpW2sH67GFIgCdX2zk7QcrBPZQHFsBqd/h/0NgUhlAtSq3JQdWs
	5Z4uEWAesQT4k66Is43485c5dYWv4UT1X337UsoiZxQJgSn6OzDG9Nd3KH4fLqFqhNCTUID4dtVdJ
	EP5mX7YQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Fde-00000005PsG-4Ahe;
	Wed, 25 Mar 2026 04:14:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E09BA44182;
	Wed, 25 Mar 2026 04:14:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3C4AC4CEF7;
	Wed, 25 Mar 2026 04:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774412074;
	bh=DjQNBELJeTo8/+IvhIZ195gGXomNRX+U9eI4gj1CDvQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SRN8ph0pe1XZdbFseT7tE70r/KjEUXruc5OYrwNk9RqqxCpNBz3lKttBmjvyR/V+F
	 LtJrTZ+7anfXtgnic7l5VIoLbzWClqhGy86LYc5jTJ5WiLlspuvWPVcH7tVEo3bTZQ
	 B3/V2PjFQujB3TmjH/YZDXYjGSvefpMLSF6ujW4kNal6dqlrgdyZy3xe5uuN8qioVt
	 C5T8kZxf9GojeAa9XddOx6PZakiiMDHaZ25yl5D3ZSoIxAugmHnvVJo6l2b5/Lv/S0
	 upiARQ+JCWrFKrTEs9313xFN7iKFbUBGQMZ2Z6A7i8ktSdEYDHgVOSA3WjPwRHv5Xc
	 ZaeMKZnXKgm0Q==
From: Kees Cook <kees@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Mark Rutland <mark.rutland@arm.com>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	David Laight <david.laight.linux@gmail.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>
Cc: Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v5 0/2] Fix bugs and performance of kstack offset randomisation
Date: Tue, 24 Mar 2026 21:14:20 -0700
Message-Id: <177441205756.1333400.7749975219620417508.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303150840.3789438-1-ryan.roberts@arm.com>
References: <20260303150840.3789438-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_041439_468182_D7DB68CA 
X-CRM114-Status: GOOD (  12.84  )
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

On Tue, 03 Mar 2026 15:08:37 +0000, Ryan Roberts wrote:
> [Kees; I'm hoping this is now good-to-go via your hardening tree? It would be
> good to get some linux-next testing.]
> 
> Hi All,
> 
> As I reported at [1], kstack offset randomisation suffers from a couple of bugs
> and, on arm64 at least, the performance is poor. This series attempts to fix
> both; patch 1 provides back-portable fixes for the functional bugs. Patch 2
> proposes a performance improvement approach.
> 
> [...]

Sorry for the delay! Applied to for-next/hardening, thanks. :)

[1/2] randomize_kstack: Maintain kstack_offset per task
      https://git.kernel.org/kees/c/37beb4256016
[2/2] randomize_kstack: Unify random source across arches
      https://git.kernel.org/kees/c/a96ef5848cb0

Take care,

-- 
Kees Cook


