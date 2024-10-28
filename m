Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4B3D339AF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 18:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qlP5wrW6ke0vGocM1Z3CVT0nh5F9BiAmuKkmtCmLliI=; b=xsOcy8Fyk/PRFy4akzuvMnMXGP
	yg4CZJc9axlfZXFoJI+3+k2MumTvE36wjExNT9xQKynN3teCY9rBKTun1lYdVoLXU3zorX/YAO1eK
	DP/prWvWkD40m5hIbZyZqedZbCUEiWSeK9BYxcNfOaW8oIxZ1Oi3n07bv5lU7S6iimWqhGr67+ejP
	FccMaoiN9S1uqLXJVBkWj8e+HzyS+43n3W1k7MqFiVo/DeYmS6CBiNJ0cXWKSSjtz2FBEnD/O7mPv
	8IBcdqiA6B93YKdN8SCqSQysUULmE26Zt0H9mLP5kOR90huPQrIR0QEb/pMkWt0x6quzBKDXaGAfy
	3as5wKEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5UGH-0000000BmFq-3M4V;
	Mon, 28 Oct 2024 18:14:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5U45-0000000BkBm-1uYM;
	Mon, 28 Oct 2024 18:02:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9606A5C5C6E;
	Mon, 28 Oct 2024 18:01:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8251C4CEC7;
	Mon, 28 Oct 2024 18:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730138524;
	bh=Cqqg0EuRygm2muKmG3Em56D2KQbpxOn57TA3RY3+BS4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gtEcfTSA06walZP4EYky8YvX5+tSLqxGDLXcf9dA0tiJOg6r12ODMxN4IBYDVwhg7
	 /9sHuVvYEUTAUeLgzE/KvgtlkLSdirLw00I5bGlwJ/Cgt7TVO5MVaTO6+UMlpVICeX
	 OxI9y0jpxfslXPNVHEstnt5RNnozHioJPVXd5A12qMAr+Tmg8g+i3JF03owZspBheX
	 5WbgQU4+e5FVES1E30JvzTbHetoei1m463Q75tPDO+KVh/8FHNHcyhbP4oOnAr90BU
	 lHyfVNVrxZxPWRybYPdWzcCypiAkDKEiZjwaR4QWRqEopGgtZU/FsDxoBuXS7+xjxA
	 lBkIk08k8iv+A==
Date: Mon, 28 Oct 2024 18:01:54 +0000
From: Will Deacon <will@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 04/28] arm64: vdso: Drop LBASE_VDSO
Message-ID: <20241028180153.GA3029@willie-the-truck>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
 <20241010-vdso-generic-base-v1-4-b64f0842d512@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241010-vdso-generic-base-v1-4-b64f0842d512@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_110205_570943_5C680D09 
X-CRM114-Status: GOOD (  10.91  )
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

On Thu, Oct 10, 2024 at 09:01:06AM +0200, Thomas Weiﬂschuh wrote:
> This constant is always "0", providing no value and making the logic
> harder to understand.
> Also prepare for a consolidation of the vdso linkerscript logic by
> aligning it with other architectures.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/arm64/include/asm/vdso.h       | 9 +--------
>  arch/arm64/kernel/vdso/vdso.lds.S   | 2 +-
>  arch/arm64/kernel/vdso32/vdso.lds.S | 2 +-
>  3 files changed, 3 insertions(+), 10 deletions(-)

Acked-by: Will Deacon <will@kernel.org>

Will

