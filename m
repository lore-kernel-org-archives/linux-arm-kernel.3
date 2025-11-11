Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E27CCFA18
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 20:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNJXJycjxy0/JX6b09+6cIE9rHzuBXpl09syUJZVmGY=; b=bXuPNfX2gKOPnmdxFQqdVj1pao
	+dsfHlZ6xOgFmRn4AQlScjZcSJtj7Qo7wOpkh37jvcFK0EnKfrbNoxW0Pt++MrRSswwmf1cvB8yhF
	S/cic0CFgy4HPg1L/gFfDDAa0l0WtBWrOhaUI8v7Hwcko90h4XRBZOgPNYb17ebbyhBEto8m8pN/R
	jsZr7cZ1AbnZ7ZhQBPjrScq+pU8Hj/ApVCYil1mwEABWGXD24PN6j+C/2a3fgyQvpZNTE2Uedtd5j
	ffavmZxRJt67d97DyejAq02KnwZRFj2mNULJits8/A0c34zqX/rf7TCwiNK2h/5Z1q3cSp1MMBgF1
	/KJTi/IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIunR-00000007j57-1Ynv;
	Tue, 11 Nov 2025 20:16:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIunQ-00000007j50-3Cf8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 20:16:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A3AB660202;
	Tue, 11 Nov 2025 20:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7EB9C116B1;
	Tue, 11 Nov 2025 20:16:52 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Huth <thuth@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v2 0/2] arm64: Replace __ASSEMBLY__ with __ASSEMBLER__ in headers
Date: Tue, 11 Nov 2025 20:16:35 +0000
Message-ID: <176289219516.1641900.16581648877068105161.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251010130116.828465-1-thuth@redhat.com>
References: <20251010130116.828465-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 10 Oct 2025 15:01:14 +0200, Thomas Huth wrote:
> The kernel Makefiles define the __ASSEMBLY__ macro to provide
> a way to use headers in both, assembler and C source code.
> However, all the supported versions of the GCC and Clang compilers
> also define the macro __ASSEMBLER__ automatically already when compiling
> assembler code, so some kernel headers are using __ASSEMBLER__ instead.
> With regards to userspace code, this seems also to be constant source
> of confusion, see for example these links here:
> 
> [...]

Applied to arm64 (for-next/assembler-macro), thanks!

[1/2] arm64: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
      https://git.kernel.org/arm64/c/639f08fc20c9
[2/2] arm64: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers
      https://git.kernel.org/arm64/c/287d163322b7

-- 
Catalin


