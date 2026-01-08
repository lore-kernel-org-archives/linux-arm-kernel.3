Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22924D232C1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 22:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYa0NuG0+WAF/Am4agGKlkPCg7Rii+5qWJnhxcdH5oI=; b=SSzW1FF7FSe6GB9ZsZAlNf13dP
	d4rE13iVaPK0GSgz2n2pw9pwxdaw3dMYxw+ZP4teYXsJrJQBhBwzYCW7Boduqeg7T1Xp6Mu2aKxjQ
	QlKplu55IwqDtG7ji6m9VsGjlMlpaPK50ARqDb1K4EC+Y8gppyJLKbNZMN1O+NmOgMpRFrHC96ovp
	IJfEFXBaMC3tQApyCxeSmIBjseBSEVv7zCAosJ0k/KYbDt9qHT6bC5AFP8mTmD0xvcYr1FE3LbQSm
	h/3oRmBV6sWOLNp8ONCaqab3eH5LewUDrpoj/mPuiDC7CymXFIWq2xQ7HTATjv4yHSbAub8h6Z9HE
	OK2UjpgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdyVz-00000000wpD-20GC;
	Thu, 08 Jan 2026 22:29:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdyVw-00000000wp6-2oEO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 22:29:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B109B60130;
	Thu,  8 Jan 2026 22:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A512EC116C6;
	Thu,  8 Jan 2026 22:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767911395;
	bh=Rw/mLLceo9+Wq7pVKPpVKEevuaEDSUDBh0SspUIhv58=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kbj/mTtbvEbZrElAKU0dA4NUc8mFm1sVo7ByUaDNI+e16sSTs1wpWKWK55gR5rXxn
	 ZCMVCjybD4YWrAYRsW3YDFELC8B+ClZOT7SIgwhaH9g6bqtZ0+UlLP1FQXIx/Pl+4z
	 s57c2iYl3CvsB9eE/02/MHsoBLgg2Mp8HdRPFhmr57u2UK6+PyeaKqDM8QwL9UzEqZ
	 4hluHPJDuiEPkAQjDMEDpnxngU9w62XdHYEM3iYi42SqaJOPca3PkhzrC4yqggBoIi
	 ro3naBoQqxLtJt+hS0ghUski6vG6uHC3/+ASUjbzmmNvVg6McyhSLYDOsJOxAJ4GSc
	 c3+wEPmVpqidA==
From: Will Deacon <will@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Koichi Okuno <fj2767dz@aa.jp.fujitsu.com>,
	Kazuhiro Abe <fj1078ii@aa.jp.fujitsu.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v6] ACPI: AGDI: Add interrupt signaling mode support
Date: Thu,  8 Jan 2026 22:29:45 +0000
Message-ID: <176790957965.1541183.5588102547570547773.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108075636.524722-1-fj1078ii@aa.jp.fujitsu.com>
References: <20260108075636.524722-1-fj1078ii@aa.jp.fujitsu.com>
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

On Thu, 08 Jan 2026 16:56:09 +0900, Kazuhiro Abe wrote:
> AGDI has two types of signaling modes: SDEI and interrupt.
> Currently, the AGDI driver only supports SDEI.
> Therefore, add support for interrupt signaling mode.
> The interrupt vector is retrieved from the AGDI table, and call panic
> function when an interrupt occurs.
> 
> 
> [...]

Applied to arm64 (for-next/acpi), thanks!

[1/1] ACPI: AGDI: Add interrupt signaling mode support
      https://git.kernel.org/arm64/c/f7d5e9e70302

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

