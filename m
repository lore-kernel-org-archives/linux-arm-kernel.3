Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F65C83030
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 22:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+pYCoCIh+fYti03jd5EdTchsg2gvbHdTILYRM1KwsRc=; b=Bi/5koA3GlW6tx8IkQAljkhmzU
	buZ1wREZok3gnPA9RUg0huH8j5faBwZMuHz6x9/EL2EbhYFTghzMSB3uwGCH+FXqi7eK9mN/oKgSA
	8l6WprWJJqmXLUrZFUyHWCtKMpY5r/6GcJSG3SsV/4754cje3+3VveEQNvNmvW52JvV3X0raf+iDZ
	sdOMCyhi52MbBrugw4rMhMcyc/6AeQQWrP/d4fJIlkfFXT+w8agDt7sIVKpjRGVyM7Dld7tax9TUH
	RFvApJzfk30O7vgHB9deSt+HX66adjxqW3MTM46cCk8RLGbBkDEcC8VbdhRwNKU9iqpnzdWdo/5++
	42CIMhFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXSUo-0000000Cjl6-0BrV;
	Thu, 03 Jul 2025 22:33:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXPF0-0000000CKpo-40uV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 19:05:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 730C85C6807;
	Thu,  3 Jul 2025 19:05:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D64DC4CEED;
	Thu,  3 Jul 2025 19:04:59 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: ryan.roberts@arm.com,
	will@kernel.org,
	dev.jain@arm.com,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Xavier Xia <xavier.qyxia@gmail.com>
Cc: akpm@linux-foundation.org,
	david@redhat.com,
	gshan@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	willy@infradead.org,
	xavier_qy@163.com,
	ziy@nvidia.com
Subject: Re: [PATCH v7] arm64/mm: Optimize loop to reduce redundant operations of contpte_ptep_get
Date: Thu,  3 Jul 2025 20:04:57 +0100
Message-Id: <175156948681.3519813.8652806937156134172.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250624152549.2647828-1-xavier.qyxia@gmail.com>
References: <20250624152549.2647828-1-xavier.qyxia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_120503_041908_B7387DBE 
X-CRM114-Status: UNSURE (   9.11  )
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

On Tue, 24 Jun 2025 23:25:49 +0800, Xavier Xia wrote:
> This commit optimizes the contpte_ptep_get and contpte_ptep_get_lockless
> function by adding early termination logic. It checks if the dirty and
> young bits of orig_pte are already set and skips redundant bit-setting
> operations during the loop. This reduces unnecessary iterations and
> improves performance.
> 
> In order to verify the optimization performance, a test function has been
> designed. The function's execution time and instruction statistics have
> been traced using perf, and the following are the operation results on a
> certain Qualcomm mobile phone chip:
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64/mm: Optimize loop to reduce redundant operations of contpte_ptep_get
      https://git.kernel.org/arm64/c/093ae7a033cf

-- 
Catalin


