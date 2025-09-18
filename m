Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E3FCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 21:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=biPFseast4vi8FXSQfexL8W708PLW3qhVY60Vw3LNDU=; b=qJqa8ZhVks/i5Tryg/XCzOrZxj
	h2eRfrrBKS7vi+HmpNQrp7foPh0tIEqipwePjNHKZokVqcVNEjXBPMynwKUqBHXcwGVD4uTRren/N
	QEkzyNgvCY9vTglXHmTophiaGrEAeVFbtuMn4+EYlZcFkMb86/OUYKvxGbv+/2RvgsnO10A2OgAN1
	nyEgHIa1UTx6naToUNfLHKe7jd5DY79SiAsVHCZTDjpO59TL+Nl+lGZGnk1I7cjfjLzfvzEmXoA2f
	MlHxDdfqia2vp5hdmxBI+wmCh7TTQFOOi3prTsvkG/nAX0ewegvov7Qnqg5SrmYOXd466feROZD6N
	QSNLQNcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLtU-00000001Asn-294i;
	Thu, 18 Sep 2025 21:10:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzLtR-00000001Ar5-37hf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 21:10:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 176B440699;
	Thu, 18 Sep 2025 21:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53681C4CEE7;
	Thu, 18 Sep 2025 21:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758229816;
	bh=j1CTtjGm+jrGFTPTDIMFfFXN9BLb03q1Mg0JiJ+5ylc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=frNq7MEs8uQvQ2H6fiYsY+ZDphflomx42JRFqskCtNqck+vRIZHnG0HeO5e3edclL
	 BbjLsGqD3TmXcp4xuL9pycdqzOrdVFx4Np0+M2273Gclce9P+b56R5M87FkMgeYAyZ
	 WcLAsHPQhGnmSUGpFsB7ekKcI5im9O1ylWtlqw0f1M/BVC9gwDYqKUG7ZIGGepCGsU
	 ycboPC6UDpEfTmLRtfco6Ow3IHqI00tXQru9V1Y40hzuDgfvZF4e4A7j6yzgusDfeX
	 /qW06qAbIZ0wEejIqPywsj8PEc6dlobSOn8sNnOFPbgoRO1KjTDnUx9NTCKYwOHJgd
	 OTMaqzDMlbHuw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Jeremy Linton <jeremy.linton@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	liaochang1@huawei.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: probes: Fix incorrect bl/blr address and register usage
Date: Thu, 18 Sep 2025 22:10:04 +0100
Message-Id: <175822602063.703125.494053900347788765.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250918175424.3483164-1-jeremy.linton@arm.com>
References: <20250918175424.3483164-1-jeremy.linton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_141017_801923_CE2E8A79 
X-CRM114-Status: UNSURE (   7.32  )
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

On Thu, 18 Sep 2025 12:54:24 -0500, Jeremy Linton wrote:
> The pt_regs registers are 64-bit on arm64, and should be u64 when
> manipulated. Correct this so that we aren't truncating the address
> during br/blr sequences.
> 
> 

Applied to arm64 (for-next/uprobes), thanks!

[1/1] arm64: probes: Fix incorrect bl/blr address and register usage
      https://git.kernel.org/arm64/c/ea87c5536aa8

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

