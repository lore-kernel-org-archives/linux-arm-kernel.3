Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C3AD6AB17
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 23:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mxmevYuZExuilnQrsqNhp7aMgiVMfwHbrkPUgzirIRI=; b=1Co1dmV0NXEY26SbP2DjtDpb31
	7FonZC4iNF5r2kYSrtX9GANCzJGXNuUopaUDOkIfmuR+Yq4+lSgJfHapHEwqF7SxH8t57YbJhW1Om
	7ljWkeID57dNHW3XuvNLoOenGiAf9PE2eWYmxsIpvYCWZvs5J1W6FmEkvp7OnKn8FrGhNUwBsqCIq
	ikcDKPo6wIPeBeg9P11BJL04TdY/xqySsXuaWULRIy/ly5fGkRbvYw+w0+XWd3VtQ/69Cxj1ThNwc
	uiiWVDTFT9xfDVhqFZMIN4ShNSeWFhIMoBSDz6nEDd/D7Q3LkC7gklXk2pu6qM11LDlroKO7jaC6S
	kscQ4Trw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8RFU-00000000vcB-1aPu;
	Thu, 02 Apr 2026 23:14:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8RFR-00000000vbn-1Z0n
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 23:14:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F4DB40BFB
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Apr 2026 23:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1577CC116C6;
	Thu,  2 Apr 2026 23:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775171688;
	bh=/uT9Mce6mkl+PL12SNZSUWwwgCcvkjFSyAR12j7sSvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C2sUW5hBB3EJknLB8XqL/i7dhB1ZN0fIq282kPMiyg9xuxEMCaeIwvwX9jDg6+ZPI
	 YQ6hM9lVUQ2xrEse5SRQhA1OeyVK02zLLvIPjumB5RJ/oVvdm67lshpYllEZ0/eBCQ
	 /ZyYiq7Q0KFPrnDIyVKS6xXhT3dHIV4IhRwPRuLAkgU80PTJVkCcv9XWOfe44QvsMV
	 VX6jWFDhuU9ijYvbDem9w0M3Go2TVvmisc3767xQ8vNvMZg3wPGmrtaKt4iU2QAYmX
	 MwKuJ0PVQwBu8s5t6RYsdZ4BqGhS7LoP+NfC7w8/tqWT6CHlMhKnkOEjiELdi4RG1N
	 AWv7AzScOISBQ==
Date: Thu, 2 Apr 2026 16:14:43 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-crypto@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] lib/crc: arm64: Assume a little-endian kernel
Message-ID: <20260402231443.GF2910@quark>
References: <20260401004431.151432-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260401004431.151432-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_161449_458930_AA3F2E77 
X-CRM114-Status: GOOD (  10.79  )
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

On Tue, Mar 31, 2026 at 05:44:31PM -0700, Eric Biggers wrote:
> Since support for big-endian arm64 kernels was removed, the CPU_LE()
> macro now unconditionally emits the code it is passed, and the CPU_BE()
> macro now unconditionally discards the code it is passed.
> 
> Simplify the assembly code in lib/crc/arm64/ accordingly.
> 
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
> 
> This patch is targeting crc-next

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git/log/?h=crc-next

- Eric

