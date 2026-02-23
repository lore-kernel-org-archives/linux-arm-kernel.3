Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA79FEEC2AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 22:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EAPwTc+8uofmbFcnirZdS9sI1kTzfAVBXIc97mv34OA=; b=awILNk8uTNM3LVh9p1KBpBIrxG
	Y7JiXuJNnwXonL+VR/gc/jlgIprVGpxephUux3lyxSCZDQDlshaqBanxTpY0jCWurtNiyBQ/gsUvA
	wzEC0wogLAdHWaPhmsJggCXXNtiP1TEQGABrYGdsh0R+nZGLtVOMWQrNeEmKMygomk51XcX/aDgte
	6mDWHjLX/WsVKRJ9vfqVbRaQJT/FlBI9S/vtAynxyfbRBL5PP0LgzbuoeaTF89F1haxaomCCXQnhR
	yBMI9qanNvamq0P8zriqpB3NlqeYMF2NTHgZeo4Mu1kWGur19+jU58n0zcB7gpSnWgySS39hMEkhu
	DZIoRyZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuens-000000018cK-1NkW;
	Mon, 23 Feb 2026 22:53:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuenp-000000018b6-3j9z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 22:53:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1267043C9B;
	Mon, 23 Feb 2026 22:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AAC4C116C6;
	Mon, 23 Feb 2026 22:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771887200;
	bh=XGtuTf6Jcf122l6S01HJPRF+WchS/Q65b0NtmqAoVfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZmfHgfUrB8rf7SxS+m7i6Nbm83akA5w9OLDipQGSOaVcHUJGhBGr5JleV+lvbT9Ih
	 ES1jeEYODvs6SIXAPyGAAqikZa4UUtROdKJg27d0BjUclgv47EtSp4h3ptI4rsvsT/
	 A/Q6dW5mmG7a+LrrgsNs234f6ShddcgHYyrsN1srQ7REoeTAP28vUOzECSlNUqNnLH
	 G9qNJfAkWQ76V6BqhrsUIj/wgc43wW4DjMi+HPcfE29HwNkfPdhL31UnAXovXRGfzq
	 1HY/4jllrJt2uUrbR8H93TaAt2kzOEpXk+3SA5YCx8OLMs+sxQjnNO3yfFcXNCeWQl
	 UR0qUMHlXOhng==
Date: Mon, 23 Feb 2026 15:53:11 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Kees Cook <kees@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
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
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
	linux-efi@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 2/2] kbuild: Use '-fms-anonymous-structs' if it is
 available
Message-ID: <20260223225311.GA2462602@ax162>
References: <20260223-fms-anonymous-structs-v1-0-8ee406d3c36c@kernel.org>
 <20260223-fms-anonymous-structs-v1-2-8ee406d3c36c@kernel.org>
 <202602231432.20F3F0CF@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202602231432.20F3F0CF@keescook>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_145321_953558_DF6F936D 
X-CRM114-Status: GOOD (  11.46  )
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

On Mon, Feb 23, 2026 at 02:33:35PM -0800, Kees Cook wrote:
> Series looks good to me. One style question, why go the round-trip with
> Kconfig instead of doing it all with a fallback in the Makefile:
> 
> CC_FLAGS_DIALECT += $(call cc-option,-fms-anonymous-structs,-fms-extensions)

I might be misunderstanding how Kbuild works but
arch/$(SRCARCH)/Makefile may have logic for selecting CROSS_COMPILE,
which can impact the selection of $(CC), so I cannot use cc-option prior
to its inclusion but I need CC_FLAGS_DIALECT to be included before
arch/$(SRCARCH)/Makefile in the main build so that they can be used
within it, which is only possible after Kconfig has run. This is
probably worth more flushing out in the code or a comment since it is
subtle.

Cheers,
Nathan

