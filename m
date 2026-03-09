Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A261EF36E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 06:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9rea/vjeMUUW3SPeWNeQvX4Qfy/WVzcqQb0NrtwQ8Ck=; b=r7sFbR63yKiSDwqiM6iUfF90Wm
	mP0u3xwlChVKvxH2D3RrZFQUJd6WN/obqdmjbpA1lTYunQh2Wk38W8VJoaEdtNd2y8p79dEBctbj4
	/PuumDkNCzsiQV97SnUBWseXT7q1MCoTNlrgtPrvkThuXUNEWjQxveg2NYysdzaYB0xShOHtQ40Gc
	g8Nhj2mPyLljEE4wgzFDVQMdhNOV+x2EGUby70T6WsIaUR0MLA0ksmAfx1kQhpcRken9Ssr3ioNAw
	NGgPkX7iNYaRFLbLS6vYt3dcMCHqX1ERMuHG8KmzmB/qO2C8aQSXofsVIWUvhkerF69Jz0RO5KK+F
	B3wK8mRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUQf-00000006lJC-3mct;
	Mon, 09 Mar 2026 06:49:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUQd-00000006lHr-0k6w
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 06:49:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 11FFB4411F;
	Mon,  9 Mar 2026 06:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A789C4CEF7;
	Mon,  9 Mar 2026 06:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773038961;
	bh=mBGAy+m59z4WIEXrNU6lVwn2ubiB5FyyhHyt/vKyIwQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SAHCok30el3I22tEqGLE1AsTFRcIxNAv18AGEYQTYGnuLynlmwQV37mqVXirUlEej
	 z4I4v2lMrfd9uGw2WKlMubgUAX/oKqjPAYO0K5hKm6yXr25Y5FotuZ0D/r+YEkSdAM
	 0EZY59yCS3qEnIhTmaI5ofWEtmyWNmIa2iEt45YWJ2h7IDT4in6/Z2FsGx8l0OqNn+
	 gCQVwJ8jSVG5Qv5KjuL62+1sfKbp1nVDoJRB0C79e9WFAazt8pc1FLS/lNZQSYuPVI
	 X+0LuwPPOLpnusHuaR0u/h3HuW/1BocPwfNrtCLot/ti//rWfPsZdw4Rp1z4IzG5jQ
	 8a5GB68SEb+ag==
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kees Cook <kees@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-efi@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH 0/2] kbuild: Switch from '-fms-extensions' to '-fms-anonymous-structs' when available
Date: Mon,  9 Mar 2026 07:49:13 +0100
Message-ID: <177303890212.240716.12941791284325631253.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223-fms-anonymous-structs-v1-0-8ee406d3c36c@kernel.org>
References: <20260223-fms-anonymous-structs-v1-0-8ee406d3c36c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_234923_256532_BF2A1F4F 
X-CRM114-Status: GOOD (  15.89  )
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

On Mon, 23 Feb 2026 12:10:27 -0700, Nathan Chancellor wrote:
> The kernel enabled '-fms-extensions' in commit c4781dc3d1cf ("Kbuild:
> enable -fms-extensions") in 6.19 to gain access to a Microsoft
> (originally Plan 9) extension around including a tagged structure/union
> anonymously in an other structure/union. Since then, Clang 23.0.0
> (current main) has added a flag to enable only that extension, rather
> than all Microsoft extensions, '-fms-anonymous-structs' [1]. Using this
> narrower compiler option would have avoided the build error fixed by
> commit a6773e6932cb ("jfs: Rename _inline to avoid conflict with clang's
> '-fms-extensions'"). While these errors are not expected to be common,
> using the narrower option when available has no drawbacks because the
> kernel only cares about this extension in '-fms-extensions', no others.
> While this could result in build errors for folks using
> '-fms-anonymous-structs' if a developer uses another extension in
> '-fms-extensions' (either intentionally or unintentionally), flagging
> these uses for further scrutiny seems worthwhile.
> 
> [...]

Applied to kbuild/linux.git (kbuild-next-unstable), thanks!

[1/2] kbuild: Consolidate C dialect options
      https://git.kernel.org/kbuild/c/f3fead1c
[2/2] kbuild: Use '-fms-anonymous-structs' if it is available
      https://git.kernel.org/kbuild/c/c14d8386

Acks and review trailers are still welcome!

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers). Patches applied to the
kbuild-next-unstable branch are accepted pending wider testing in
linux-next and any post-commit review; they will generally be moved
to the kbuild-next branch in about a week if no issues are found.

Best regards,
-- 
Nicolas


