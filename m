Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258A1C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 11:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cTWUVDcHy7wDxhZqxbdxUs0tqX0/9IS/N/aTzOzEHCA=; b=qGIP5jiDb2R5u/CgzV2+vxgWfX
	SLn+hlWNKSvW3zfa+qPXDgpL9hmvN54/hbxahjcgEJstqrJnLLi5mzbF2lJZ5JWq3vyua3Qh6zwDg
	MVNjrxTK4XWmzAprWGUXP/fDx73ffNRHDf4khFcLJA3cqAj5iS89g3nB7rHVdNQbi41xqIzYrIHoc
	2x4srrKrFLFQgwRTfKqXLmYWKM9OREnZcKo1GrtSi0r+Q/OUOQYCr3v1ekGk6kIxZdcCu8/qsZ3NM
	qgsBeid4k48Skv7imXdWIi+rjK/T4wSSwXO12980ugYR280gpqKRCtuaN20DGAyyyySOjDqCsjec/
	MC3okzeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOaHv-00000003yYD-1Q2k;
	Mon, 09 Jun 2025 11:03:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZmz-00000003uh1-2MOf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 10:31:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40F6B150C;
	Mon,  9 Jun 2025 03:31:17 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1A33F3F673;
	Mon,  9 Jun 2025 03:31:34 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Forissier?= <jerome.forissier@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH 0/3] firmware: arm_ffa: Fixes for FF-A notification handling
Date: Mon,  9 Jun 2025 11:31:23 +0100
Message-Id: <174946502085.1178371.2142006145857749120.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250528-ffa_notif_fix-v1-0-5ed7bc7f8437@arm.com>
References: <20250528-ffa_notif_fix-v1-0-5ed7bc7f8437@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_033137_667514_95A34DC3 
X-CRM114-Status: UNSURE (   7.87  )
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

On Wed, 28 May 2025 09:49:40 +0100, Sudeep Holla wrote:
> This patch series improves the arm_ffa notification callback handling by
> addressing safety and memory issues. It replaces a mutex with an rwlock
> to prevent sleeping in atomic context, resolving kernel warnings. Memory
> allocation is moved outside the lock to support this transition safely.
> Additionally, a memory leak in the notifier unregistration path is fixed
> by properly freeing the callback node.
> 
> [...]

Applied to sudeep.holla/linux (for-next/ffa/fixes), thanks!

[1/3] firmware: arm_ffa: Fix memory leak by freeing notifier callback node
      https://git.kernel.org/sudeep.holla/c/a833d31ad867
[2/3] firmware: arm_ffa: Move memory allocation outside the mutex locking
      https://git.kernel.org/sudeep.holla/c/27e850c88df0
[3/3] firmware: arm_ffa: Replace mutex with rwlock to avoid sleep in atomic context
      https://git.kernel.org/sudeep.holla/c/9ca7a421229b

--
Regards,
Sudeep


