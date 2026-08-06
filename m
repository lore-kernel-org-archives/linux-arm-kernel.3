Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943E4C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O8Dd86fiBUYQZ0Jxe5FmhYaCKclo4qcPq5WEHvDMQ68=; b=pREkD5NufYTdvQ+ZWnA4YilLg5
	60B+8fGW9SyLg9JspyImDtJFqsYXsrgS59JvNED/qDIg89cCG4c+F3F6Z6/ltGIcmnkE1RK+jn9Lx
	sOzHX16Zd/SlKkMvxXfetKOInhdZjFNmdmQO6vL7JhbfNWkMOXVUjoiwedb31Ve+RJEFQgrb9Ohj0
	6Cd1IWgHQMPPB/W+QRaCoXlapXmXl2LIBqxqlyD+AdsBkY0/P+QXNkYM4yHL5KknfZ9ULQDuQCmzu
	ru3bWtycBDpI6gli1lROZi1jS7R2Fz3/BVCQEFsJAaeagiJOYbY8fJnvdiQEgZ/ebNEXxWOyXcCix
	3qfWoxZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1dZ-00000006KYj-3WT0;
	Thu, 06 Aug 2026 17:12:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1dY-00000006KXv-1rPK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 17:12:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DD10760AB0;
	Thu,  6 Aug 2026 17:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CF5E1F00A3A;
	Thu,  6 Aug 2026 17:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786036327;
	bh=O8Dd86fiBUYQZ0Jxe5FmhYaCKclo4qcPq5WEHvDMQ68=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=L1QAU/7htQBAaseuQYRxTlNW4YrCOsgmc4vLlRkyRm4i//QPUS6SZfGGqgKUs8WDW
	 6kt45LcfPJH7BIWea6be8hXoAfkqBTVac4ThgemBcXa+QyNFM3Okm51SYcOBQfR2KB
	 yylnXUXB/zepHLEA3fRdR+e+zaD9dYxH8k6qBe7TL53cFZz8f/ZKmF96ay3WNFYPO/
	 7K7R1+7SBIPpn5/05aqZkprdP2w2TRTWvVnJhh8Tj4KZeu6NhTH/3avlMy6Nocu8CT
	 YL5XBMlCkvZnXWmaNzWa3u5+kY9AI0P483x4G3HsT1TcEylxfU+MZH/7lg/SsrQVHe
	 rtbbd7FXtFl0A==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	liulhong617@163.com
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liulhong617 <liulhong617@gmail.com>
Subject: Re: [PATCH] arm64: mm: fix accidental linear mapping of no-map reserved memory
Date: Thu,  6 Aug 2026 18:11:41 +0100
Message-ID: <178602241325.427442.8605112911020828131.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260513010255.3764038-1-liulhong617@163.com>
References: <20260513010255.3764038-1-liulhong617@163.com>
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

On Wed, 13 May 2026 09:02:55 +0800, liulhong617@163.com wrote:
> When reserved-memory regions with the "no-map" property are not
> page-aligned, the kernel may accidentally map them into the linear
> mapping, contradicting the no-map semantics.
> 
> The root cause is a mismatch between /proc/iomem's address boundaries
> and the actual page table mapping boundaries:
> 
> [...]

Applied to arm64 (for-next/mm), thanks!

[1/1] arm64: mm: fix accidental linear mapping of no-map reserved memory
      https://git.kernel.org/arm64/c/7ace06a01efa

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

