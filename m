Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94612C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 18:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JNq+eiseDvCr7zwSusutxtvrW0Dv1v2/ldjNiuYmvvI=; b=OMB1aD17H2UCYXD2eGevp/a/NB
	r9lFPwFrwqy2T8vVzFhwMwNXhO7Phjtuvy4Fi8Pb/jz+csVLGJTlqEjMbUvvLLLu/18BSRfGxCXuo
	2fxuNmvufuNxXego+aLm8b6VeGjDQrNCyx6KdCyYwdthUOmTZ01VxO/eaEfronKlBPkSG2p1ZrwQt
	S0an17NPjq9IoLTvISotJXmf+5fWSuskTiXOlFl46E8oWMpE6bV77GX9oaojuirvzB4PkJ2Rn2Yax
	/AEe9gcvZ9AXkpH68l9k7suIAY4rbkOXJoL2kkqnxvuV0A9dc7vPGeSzVCsW5d8sKkPJ7ckXLA35a
	1m0EXAoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2Ju-00000009HuE-1Lem;
	Wed, 02 Jul 2025 18:36:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX2HZ-00000009HlI-06gQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 18:34:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DE1A7A5323C;
	Wed,  2 Jul 2025 18:34:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A89FC4CEE7;
	Wed,  2 Jul 2025 18:34:06 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	"Luis Claudio R . Goncalves" <lgoncalv@redhat.com>
Subject: Re: [PATCH v5 00/13] arm64: debug: remove hook registration, split exception entry
Date: Wed,  2 Jul 2025 19:34:03 +0100
Message-Id: <175148123654.2930618.13348502908196891051.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250627172038.633423-1-ada.coupriediaz@arm.com>
References: <20250627172038.633423-1-ada.coupriediaz@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_113409_125814_E140D4D1 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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

On Fri, 27 Jun 2025 18:20:25 +0100, Ada Couprie Diaz wrote:
> This is a quick v5 fixing a build issue with `allnoconfig`,
> as the hardware breakpoints handlers are not defined
> if `HAVE_HW_BREAKPOINT` is not set, as raised by Will.
> 
> Original cover below.
> 

Applied to arm64 (for-next/debug-entry), thanks!

[01/13] arm64: debug: clean up single_step_handler logic
        https://git.kernel.org/arm64/c/d661386f958d
[02/13] arm64: refactor aarch32_break_handler()
        https://git.kernel.org/arm64/c/0d04f6f79ecd
[03/13] arm64: debug: call software breakpoint handlers statically
        https://git.kernel.org/arm64/c/108d96a230e5
[04/13] arm64: debug: call step handlers statically
        https://git.kernel.org/arm64/c/0c0ed65dee3f
[05/13] arm64: debug: remove break/step handler registration infrastructure
        https://git.kernel.org/arm64/c/0345b8c88b78
[06/13] arm64: entry: Add entry and exit functions for debug exceptions
        https://git.kernel.org/arm64/c/6aa9da7e8092
[07/13] arm64: debug: split hardware breakpoint exception entry
        https://git.kernel.org/arm64/c/e1ee37a3b93d
[08/13] arm64: debug: refactor reinstall_suspended_bps()
        https://git.kernel.org/arm64/c/6a890a03bf8a
[09/13] arm64: debug: split single stepping exception entry
        https://git.kernel.org/arm64/c/3a506a7b7376
[10/13] arm64: debug: split hardware watchpoint exception entry
        https://git.kernel.org/arm64/c/2a059b2a0c42
[11/13] arm64: debug: split brk64 exception entry
        https://git.kernel.org/arm64/c/f2da15573f23
[12/13] arm64: debug: split bkpt32 exception entry
        https://git.kernel.org/arm64/c/324a381c3561
[13/13] arm64: debug: remove debug exception registration infrastructure
        https://git.kernel.org/arm64/c/bea7b63b2225

-- 
Catalin


