Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C1B105A58D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 12:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6h0QIfIG1FqCPbr/IC9lGC2Dm3QyO7Jeit7XU4Dft9I=; b=INxMdgvrFk4CFLldHCSxSOWWBs
	cVjM8Yra7TC0zje2HuML8evhOmfLY/0y0kJEFtyVloe/WPUGjuhNhQ3vyrnUCppfqezfKQ2HVKPcA
	ZEBfQXQC5xVKCB5HM/KRk6w3c66idV9cC4ouwylj2dAu8ue0lEAiwCFZrF3lGPQx8RspH94B7NIpU
	m0/1qAV/9i7SHHiOxfR8MsuVDTJUMoxAHHrUniMykYtnnK+JehLM/4qJRNwFp4vQls2I3L0TWX/lb
	FT+3OpEox7M/KxcBYDUr72h93YSAr5tc7ugmM31ldWq2QTAKruhkpf6vkLpktylgK7ydICsOqr100
	C16lgkBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0esK-0000000E0S5-2Bdd;
	Thu, 12 Mar 2026 12:10:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0esH-0000000E0Qs-3arP
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 12 Mar 2026 12:10:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6h0QIfIG1FqCPbr/IC9lGC2Dm3QyO7Jeit7XU4Dft9I=; b=V+hCaxRmOqBjs+7oOlGqSobCje
	j8w9TeHzy7jdLsnQHTUL8wJd1kgeOFOSg3qhZ7U4RyNpuf5XY9MpQe81CaZDFXaQwiW3Q+5Gr3sgk
	wX7Me5B8YAnrv3m2uO3xDwwxMrFgWDxdDdNGSaVUgPNlNYcITRMP8t3jpUak67FL0eaFi0yTqO98I
	I1VfIfyeuginfOJsGMEH/LaujzWREgGC1ENi2pKT8PwEn9TAKsI4s0jMpfNYmrSako42UbmUAd7bQ
	tHdUDX/FEgGYZOeZF4ooOZE3+5qrNu/UsccV+8ANdTiRgf/a6XGVyBbS1BzLeRU7nU5VNcgZcUZY6
	8OfxeUJg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0esE-000000015Qe-0hkU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 12:10:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5636A40278;
	Thu, 12 Mar 2026 12:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8DBDC4CEF7;
	Thu, 12 Mar 2026 12:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773317436;
	bh=nQuXQCfJ/SfXG9YfnkL7myftheQ9u5GoCmA3GEgvOX4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kzp5oTipiNOs9fmIBpi1nmmSuQ4uLVNq08LPCSch8yiIeOkyJ8Az9MBCTybE7cm5d
	 AMxfwpohLYKZvdRcwY6FVWNb1PtjdZE3EgpeQC628X0efwh2wRrw0LhWn9yaxAQfpf
	 w6ZUYG6LkLltn75gOmO38N55qeVwus4Wr+Sb10hyo0888DrxKRH5rYKA32g+xfcRRS
	 vWwOBuST+wlsK+dHrf7tH4G3ruupinYIHv4ZCjmtIer0Zb+wbl+bwIETcNIuNLPGvg
	 W1154YFBZI0Xw+DtOH34QkYfcH3Ndv6eraBdM09caT66SnioiGB/fgmwobzxV3sXLI
	 1S2FtYnyjdp3A==
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
Date: Thu, 12 Mar 2026 13:08:48 +0100
Message-ID: <177331711843.39835.18126183139184363231.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260223-fms-anonymous-structs-v1-0-8ee406d3c36c@kernel.org>
References: <20260223-fms-anonymous-structs-v1-0-8ee406d3c36c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_121042_560692_197B0790 
X-CRM114-Status: GOOD (  14.59  )
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

Applied to kbuild/kbuild-next.git (kbuild-next), thanks!

[1/2] kbuild: Consolidate C dialect options
      https://git.kernel.org/kbuild/c/ec4c2827
[2/2] kbuild: Use '-fms-anonymous-structs' if it is available
      https://git.kernel.org/kbuild/c/0d3fccf6

Please look out for regression or issue reports or other follow up
comments, as they may result in the patch/series getting dropped,
reverted or modified (e.g. trailers).

Acks from arch maintainers are still welcome!

Best regards,
-- 
Nicolas


