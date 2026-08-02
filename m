Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E7FC55162
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 07:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=46jnfdwMlaNGY+WPjRsEyPBfOheE1oNJe3QEnsupnCk=; b=usuzNOtfQhSxRqsHwPrUwAOB3e
	pYSu5SdOcRN8cz2gQYAQxQLL/KomtpSUSImXcnTKVP9r9zPR6RzrGAB6fm1uUnsStIz/rILq+PeON
	ZdG/QVhibllcE9IJigmjQa4Fl43WQcc+L4QgedxxQbdud4AO5r3u82n6yWiQmZmXHL/mlFacxU3Tu
	33CXj46LUDz3hPqP96TDN3eXH8IamLhkN8kcpxUCNwqPHSwFbsv9At1TY1BQyGwBSQ7Do8dCYOICI
	gFzM6JsZPmqsGvQiBIsexb+PrZUVFckoD8XoQO7HjA4pdJ92sVxq1Pnp703NoWxOX+IEUOmq7hAyo
	dNHDKnaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqQoD-0000000FSPC-2SG0;
	Sun, 02 Aug 2026 07:40:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqQoD-0000000FSP5-0Ls1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 07:40:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6CEBE43971;
	Sun,  2 Aug 2026 07:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A61EF1F00AC4;
	Sun,  2 Aug 2026 07:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785656432;
	bh=46jnfdwMlaNGY+WPjRsEyPBfOheE1oNJe3QEnsupnCk=;
	h=From:To:Cc:Subject:Date;
	b=RXe5/6ccLygZW7M8ERjzrGvEej+jrQdq6ny54rod4vAmYz2OQqbcb/EKy0q5fC/v/
	 e17Uvg16pRJrAeyKJ8NhtBIC8s2Rkkip407p/Bp5oJd1Gp1AcgRHoSbLd/HQO7Cvp7
	 SE5fTt6PDfxYsIihDlUBVIs6FP0TQpDgViMCS2hIk1ZhybI1v7cs/tDNm07jBBN201
	 0cVx6iqEqpRvgahrMOIMUF1aHhnrAjWdzUmvNT8gHOMK+8U00SFQDRGfRxzfrzTwYB
	 a9Azh5+Yp4oxVMXGM4gTwyhFB+mnWgFo/QHeep6CojMG+HPRK/EklnyD9jaZTxxn/D
	 JWgEe1I5S0b0Q==
From: "Barry Song (Xiaomi)" <baohua@kernel.org>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	surenb@google.com,
	liam@infradead.org,
	ljs@kernel.org,
	vbabka@kernel.org,
	shakeel.butt@linux.dev,
	david@kernel.org,
	linux-kernel@vger.kernel.org,
	zhanghongru@xiaomi.com,
	willy@infradead.org,
	zhangbo56@xiaomi.com,
	"Barry Song (Xiaomi)" <baohua@kernel.org>
Subject: [RFC PATCH v1 0/2] mm: use VMA lock for kernel faults on user addresses
Date: Sun,  2 Aug 2026 15:40:16 +0800
Message-Id: <20260802074018.73887-1-baohua@kernel.org>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
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

Right now, kernel faults on user addresses, such as those from
copy_from_user() and copy_to_user(), unconditionally fall back
to the mmap_lock path.

This patchset switches them to the per-VMA lock path for three
reasons:

1. These faults are common. On a typical Ubuntu system, hundreds
   of kernel faults on user addresses occur every second in
   python3, apt-esm-hook, package-data-do, teamviewerd, bash,
   scudo, cscope, gnome-shell, systemd, and many other
   applications. Handling these faults under mmap_lock
   unnecessarily increases lock contention.

2. It removes one obstacle to simplifying filemap_fault().
   Matthew has proposed removing the page fault retry path and
   performing I/O while holding locks [1]. Based on that
   approach, Hongru has already reported regressions caused by
   performing I/O under mmap_lock for kernel faults on user
   addresses [2]. This patchset removes that obstacle.

   Another source of I/O under mmap_lock is GUP, which also
   relies on mmap_lock today and has been reported by Hongru to
   exhibit similar regressions [2]. It appears Rik van Riel may
   be addressing this separately [3].

3. The current implementation is inconsistent. Although kernel
   faults on user addresses always fall back to mmap_lock,
   arch/*/mm/fault.c still performs !user_mode checks in the
   per-VMA lock path, making that code effectively dead.

As an RFC, this patchset demonstrates the approach on x86 and
arm64 only. Other architectures will need to be updated as well.

[1] https://lore.kernel.org/linux-mm/20260625195040.2508362-1-willy@infradead.org/
[2] https://lore.kernel.org/linux-mm/20260712132759.2030823-1-zhanghongru@xiaomi.com/
[3] https://lore.kernel.org/linux-mm/20260724222934.1463812-1-riel@surriel.com/

Barry Song (Xiaomi) (2):
  x86/mm: use VMA lock for kernel faults on user addresses
  arm64/mm: use VMA lock for kernel faults on user addresses

 arch/arm64/mm/fault.c | 4 +++-
 arch/x86/mm/fault.c   | 3 ---
 2 files changed, 3 insertions(+), 4 deletions(-)

-- 
2.39.3 (Apple Git-146)


