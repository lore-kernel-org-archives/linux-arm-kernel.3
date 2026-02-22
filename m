Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BC2C636BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Feb 2026 21:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EmvFoagq4laq5CsfLkxqtnL3auTtxR8uqVSGiltKyEI=; b=qyQuSlJGjIMc5eusdCRWNx0RqT
	GwbBk/h8bB+4MLrD5fhNvnuVlynb3ru5riKQERoEd1IlqGxPacUQ5lL26XO2m8tyRyCnguNsWsOQK
	uCPODMd1i9N1wyl/Lwu+IFY8ZF3CVYgu0jtgqhXDxwjtOkOP3HOlOwziQxUdDcu3pFeaaSyKXpRQf
	bDAhpZk4d8kXE6ikGwo7A1ir1w4qWx4ys0zC/qGRuuafACeHGMn+HqqKXwYjX+NNN9nQNQDbIFSEw
	vYX9oTzNy5L9616OdNGm4en9KMJefx5fs6uQZWRRIKQjPeE0P1Tmiv4jfW+54cKv7GRXYLhg1s5he
	lSu3Cmuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuH60-0000000GxgT-4AAp;
	Sun, 22 Feb 2026 21:34:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuH5z-0000000GxgI-2zjs;
	Sun, 22 Feb 2026 21:34:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 899A460121;
	Sun, 22 Feb 2026 21:34:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3118FC116D0;
	Sun, 22 Feb 2026 21:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771796070;
	bh=MoM4gAfGlJ1ngKCroMgt6s8hQQRUOv2GP6lsvWBTYTk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=F3kE5G5YSHiCVZ5mOwWBQ1EmkdZUUxri8FWvUUe1+bPk6Car0R0kut2uvNuYHVkAa
	 g8IvAYcI7E8/6hHCb/jrPziQTKClMwrJ6H0Y/aYHLJyimbtr/frfU8CLViovCDA9UV
	 HIObLbqEucr9FrLIbWX5/hRoPhPnR0+zxQyrVmCTdNaMIGloFGLnnqKAP5W6Ewm6w7
	 I/owa0GiWqAQBaI4TmPdDfE67f10RHZ+BDAgtt/1JTGJALkdfXpJeUzGxFHrjR/KHe
	 NiTE6uiB4kCm6q8SZrGgK2AZmAXo4GAErDwos4utQpdh9gKlK0o0vXjumdP0UVYmSi
	 KhiPc2AZqyPxQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Ryan Roberts <ryan.roberts@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Kees Cook <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mark
 Rutland <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Ard Biesheuvel <ardb@kernel.org>, Jeremy Linton <jeremy.linton@arm.com>,
 David Laight <david.laight.linux@gmail.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 3/3] randomize_kstack: Unify random source across arches
In-Reply-To: <20260119130122.1283821-4-ryan.roberts@arm.com>
References: <20260119130122.1283821-1-ryan.roberts@arm.com>
 <20260119130122.1283821-4-ryan.roberts@arm.com>
Date: Sun, 22 Feb 2026 22:34:26 +0100
Message-ID: <87ecmcwjh9.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, Jan 19 2026 at 13:01, Ryan Roberts wrote:
> I tested an earlier version of this change on x86 bare metal and it
> showed a smaller but still significant improvement. The bare metal
> system wasn't available this time around so testing was done in a VM
> instance. I'm guessing the cost of rdtsc is higher for VMs.

No it's not, unless the hypervisor traps RDTSC, which would be insane as
that would cause massive regressions all over the place.

So guessing is not really helpful if you want to argue performance.

Thanks,

        tglx

