Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C49CC54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 13:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1cuuSDD0L1AIZRN0fV0CPGwiXApLnZufFUbnx7EgrI=; b=zMm8AvGISPPaHMnjPsl+oYsIj3
	CskurG4e/h5QsoRig4l05FlKGk0iE6/6D1Yu3Jf3yA6Djas3aWvzPA+puJryIzD9hrtFQy0Hmetle
	zzMmjAEGT40zLsWOwHxGNKN1M4CXUEehwxPWotcgTpO1Sq+XcCbeXhV2fDj04BdWiVHdMNxQv3faQ
	hZcme8j30SeV7BbGmklLlSpACgK4HxmAkxx4YH1aicDg75EC3NX9XNLcaMjdNvvN9wMBFNrLuVB37
	bkYMFKJ3rmDKfuRx9qpXxWtAKhk1qLF5TtfgNgoBl/quUwvOs2gjAVbVvVefC5fS5tJ4ykpb72PQL
	z8iwerZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM5X4-00000007VqM-0T7d;
	Mon, 02 Jun 2025 13:48:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM5Qd-00000007UvM-1k6l
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 13:42:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C7D1FA50215;
	Mon,  2 Jun 2025 13:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC62EC4CEF0;
	Mon,  2 Jun 2025 13:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748871734;
	bh=jkYyX5QrYNlPQg4LO+RDwsQSbIqgIsVYqXblJxyQ2+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VKy5TlQtkXufd3uJ/05+eDCZ0R5k8Ou7xsC+/Pz653VI2YlS/tRp29CGnD80+w5hL
	 wzYMXkmbBVRu2L1+ikUuYQcXWXjVr83HbEYUHW8N/wMVjOoffiFtRkKfGFFDnoQVZp
	 3xWex2RIq5wqTP0mqMMkYyiyASfp9lzNE4XVLh/cRkOD7gbT1AAGYESmR5JvzexZTS
	 4WRTel7zlNyaBJmPgDhh6i7CWkbVrXJ/6jl7L/Lf8r6TyQdbzQZj0QmZHvhmy+zmNz
	 iNjctu1VWxaNkDHzoAS7ulFokO0JRu/qv8pV0VJrSyp8trW6o1fl/FSEfA3BCPS2WR
	 9heaNnj8/j3eQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Barry Song <baohua@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Ryan Roberts <ryan.roberts@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] arm64/mm: Close theoretical race where stale TLB entry remains valid
Date: Mon,  2 Jun 2025 14:42:04 +0100
Message-Id: <174886573625.2942690.14376639867334964612.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250530152445.2430295-1-ryan.roberts@arm.com>
References: <20250530152445.2430295-1-ryan.roberts@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_064215_515223_6D7A0DBE 
X-CRM114-Status: UNSURE (   9.01  )
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

On Fri, 30 May 2025 16:23:47 +0100, Ryan Roberts wrote:
> Commit 3ea277194daa ("mm, mprotect: flush TLB if potentially racing with
> a parallel reclaim leaving stale TLB entries") describes a race that,
> prior to the commit, could occur between reclaim and operations such as
> mprotect() when using reclaim's tlbbatch mechanism. See that commit for
> details but the summary is:
> 
> """
> Nadav Amit identified a theoritical race between page reclaim and
> mprotect due to TLB flushes being batched outside of the PTL being held.
> 
> [...]

Applied to arm64 (for-next/core), thanks!

[1/1] arm64/mm: Close theoretical race where stale TLB entry remains valid
      https://git.kernel.org/arm64/c/4b634918384c

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

