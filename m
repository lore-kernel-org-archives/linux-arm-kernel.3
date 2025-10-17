Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC48CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 17:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pxsLn+E1XLkfKsnFUxzqyyjXTPwS2oCr4T8EqbWCPiU=; b=c7FxXa0rR6/q7r2Jqx4so8EHrF
	XN1KWjcQoaRUASjhbYM64u1fDhcbuMW9Kc5f0zP0sWHoxEjTCqopSW8wumhv1ozMUT0jNcbdpYD+m
	dBf5ZZaJN12ySKNjzfImkYsDvJwqsLVnSoBTdXvI99kPhQqz+lKWYtIZA5IkJaTXKIBJQyw9hpiCV
	uqADWEopzoNW0OeLUpbmOcCf6WqFG/hyt91AP6V4+KxQvNZ8pj+rM1/I47Q7XSLDezo3Z8FP7YwNi
	3fyCmVHZMln5906gNCkXHBHOjaHtJyvlbCkVcLC58lVwon7ShvzIzBQJQgkNUUY/mFm9BII7Px5wU
	Muws642A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9oGz-00000008bAa-2SNB;
	Fri, 17 Oct 2025 17:29:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9oGy-00000008bAP-1ghK
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 17 Oct 2025 17:29:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=pxsLn+E1XLkfKsnFUxzqyyjXTPwS2oCr4T8EqbWCPiU=; b=d4a+yHWMagztosFJ9vr5k4CgTo
	jSTRkcNNR9vPUaTzinfJk/cHC/JI3gV4s/DK1CWKBtRf4XDRl6S59zkfdljJaZ6ED5n4LCtzrQ+zR
	jR7rrWAX4sFgR9PnnUrXxFLt6g9vimQ7mOx8ACsRPMOkawzE9+IdVX8xOoquPzaaGyGbci65ho8He
	ePZLjrQwnQpGY+nZu9T35ANKjraZEkUuOc01lji1RYSuYUL9BITXKRNYctUmdqqtF9MukMuGPEKjc
	XuPQVa6HtzPPTlYxf2KVsKTmzOf8rmMu+2px+TVRs6CDKkX8SGlXEIxQTEPblQxCpgv391xJF1gqI
	MK/bBpUg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9oGp-00000007pHn-3rmg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 17:29:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C3B57458FF;
	Fri, 17 Oct 2025 17:29:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D53C4CEE7;
	Fri, 17 Oct 2025 17:29:32 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-kernel@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Sascha Bischoff <sascha.bischoff@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH v2] arm64/sysreg: Fix GIC CDEOI instruction encoding
Date: Fri, 17 Oct 2025 18:29:20 +0100
Message-ID: <176072211691.2071457.9418354818305517831.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251007102600.879337-1-lpieralisi@kernel.org>
References: <20251007102600.879337-1-lpieralisi@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_182942_488328_4AB85B4C 
X-CRM114-Status: UNSURE (   7.33  )
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

On Tue, 07 Oct 2025 12:26:00 +0200, Lorenzo Pieralisi wrote:
> The GIC CDEOI system instruction requires the Rt field to be set to 0b11111
> otherwise the instruction behaviour becomes CONSTRAINED UNPREDICTABLE.
> 
> Currenly, its usage is encoded as a system register write, with a constant
> 0 value:
> 
> write_sysreg_s(0, GICV5_OP_GIC_CDEOI)
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64/sysreg: Fix GIC CDEOI instruction encoding
      https://git.kernel.org/arm64/c/e9ad390a4812

-- 
Catalin


