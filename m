Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E483D26D6F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 17:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BIbh4jOonP+i1owILFh4tLOnk6hHEXL35ZRJujHsui8=; b=VORYpRGoVQczXX9chbsqQAMsG+
	DRuSwz8nMuh85ItnG3OAcMbX0DFrfZTYBbpUqF2xmi6RPV5bYnnJk8/Zueuc983Q2Wv+itNg59JK8
	a6L1CvxEHgNbHHl81+Zh3agjLOAKtUpn1PYdqz3DLt/LguTH/AgKosaBcR4G13KVpjRmw4KrBtGDg
	9vy16TH/2YMaPyUN22Jp+uYP6etPED53syigC4iviAskAKWFyRDmAVj8Xi9EtSF6raMkcsrTdAkAa
	lR7aCK1cKTxMeJHthcRiB9VNRtiUgbfvnJxHGSvTgXVSHslPXNN8e+Kqgccs3VwyOlDBt/8XP1pMu
	KD4UvE+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGKD-00000002pfr-1fCR;
	Fri, 09 Jan 2026 17:31:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veGKA-00000002pf1-3VEp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 17:30:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 40F08409CA;
	Fri,  9 Jan 2026 17:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ACA4C4CEF1;
	Fri,  9 Jan 2026 17:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767979858;
	bh=qQo5tb5Ob84TKJjFuoYTgcpwOh1utsUrqKQbFrFKeio=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=I3Ryp5NZ5NwQc0jHHpARcB+lImRXw9lebxUEmNyxuLRAokyuias/XXuzcztLz6nL5
	 qPBGfCxYP1UtwXjLxC/A2WowzGUaTVN23Udn3QeRnMJc9jkc0bAkGlw9to5sHajDH4
	 QT50CqGg8I3hvp/c6lo+TDvmTU1vLFVRWrED5PdxuS8oTbVnA53PrexDY0nWEHFmJy
	 EreNyPAa2BMoCAr7tCPq/sJzw0qeaQPTr3mJ+ZJM31WwnzyeF0L5wCCLUlvwqclEU9
	 JTSCNtG6xUX3kTv6HqFAhwDoSCFE7PNxsfzWWSNd7zOtxANEhQWP4k6cihifHNUyfb
	 aDBYANS6RI3yw==
From: Lee Jones <lee@kernel.org>
To: Sven Peter <sven@kernel.org>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20251231-macsmc-mutex_init-v2-1-5818c9dc9b29@jannau.net>
References: <20251231-macsmc-mutex_init-v2-1-5818c9dc9b29@jannau.net>
Subject: Re: (subset) [PATCH v2] mfd: macsmc: Initialize mutex
Message-Id: <176797985608.1888600.13705658897282916904.b4-ty@kernel.org>
Date: Fri, 09 Jan 2026 17:30:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_093058_897719_7EA34144 
X-CRM114-Status: UNSURE (   6.65  )
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

On Wed, 31 Dec 2025 10:42:12 +0100, Janne Grunau wrote:
> Initialize struct apple_smc's mutex in apple_smc_probe(). Using the
> mutex uninitialized surprisingly resulted only in occasional NULL
> pointer dereferences in apple_smc_read() calls from the probe()
> functions of sub devices.
> 
> 

Applied, thanks!

[1/1] mfd: macsmc: Initialize mutex
      commit: 9f7cd8015f588755ada102d400c58ed1ca28a63d

--
Lee Jones [李琼斯]


