Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEA1CAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5/qLGuVM2rd6S0ixPK5O5j49YfXFWdCdQEKTuuRReM=; b=GnL6L/lKJqPdZa7ah3vJ4IZchn
	PPQcfQ1BtlLsTKr1TUh0hBh1rBhoyQpXokXRpSX3mRyYUMVn1wDdDPF6JKIyL5yIu8JtivKWChiJN
	SLiABiDrc2k5G7Ts2C3SPMPx4LJhhrc5ho26azGH9QVL2yyVNdPx7HclPRcyex6Kj/cu9jCTNjZAz
	1ZStZmeI+ER4lx4KRXEOEEjf2gp+Qb6FOB2d23zk8Es3URzI26xkIRlsp+1VIVe8gcWMyKkb9ni1p
	2kOnwxRjFWubtmTQMk05z6BpWeHOes8AmGZdIUaMJRMkmNGLPVEcBHwzvOJqhF4ZYB018IGr0g7qN
	XvZzu+0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gO7-0000000ASKt-1H1f;
	Mon, 22 Sep 2025 13:15:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gNr-0000000ASBB-2ZO8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:15:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CCBC6601DE;
	Mon, 22 Sep 2025 13:15:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BAB9C4CEF7;
	Mon, 22 Sep 2025 13:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758546910;
	bh=6UJScf8g+nt2Rgo/WhMNYndeCkN5era5i1Ssuuc8Bmo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bKUGZIPSZrtBgtGO5WbFapidt4G76uWte/XT89E1wpX2qlm7y1jq3k3PLnRlodDJI
	 cFjkCdDJHbd+it1QjxQL8psMPCWPyC/72n1ngAXUTUqaYTibHv3xDTGnkxRNPspKD2
	 LLojmEqbJotufScROYmL/BIift6I8T17tdBA9mMBkqTQzxu6iOEqU0ECQb6XAcZTNm
	 Adfj17w8ZOQE7riJKtRDCwGpbd6DsQYZOfTZZ/XxjBGlrc2RKXYOhRKePuOywzeJsk
	 /nsEFgouCqpKVT2y1GVehPQyRlkYMrxdlsUVfJx8spIV10DfwLtOYL4sa0bw683q7D
	 q2uxtFIDrj9wA==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	Can Peng <pengcan@kylinos.cn>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm/syscalls: mark syscall invocation as likely in invoke_syscall
Date: Mon, 22 Sep 2025 14:14:49 +0100
Message-Id: <175854396942.3145289.6573440532585531587.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250919100042.497861-1-pengcan@kylinos.cn>
References: <20250919100042.497861-1-pengcan@kylinos.cn>
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

On Fri, 19 Sep 2025 18:00:42 +0800, Can Peng wrote:
> The invoke_syscall() function is overwhelmingly called for
> valid system call entries. Annotate the main path with likely()
> to help the compiler generate better branch prediction hints,
> reducing CPU pipeline stalls due to mispredictions.
> 
> This is a micro-optimization targeting syscall-heavy workloads.
> 
> [...]

Applied to arm64 (for-next/entry), thanks!

[1/1] arm/syscalls: mark syscall invocation as likely in invoke_syscall
      https://git.kernel.org/arm64/c/da9e5c04be58

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

