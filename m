Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A436D3A67B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 18:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IYzcc7n6IZf1fepFi8ALcq0h2kYNyG09xt9fXTHVsmM=; b=lZ5+cYKiFskczH8/sZUOhq1Se7
	zizh3MXvjql07M85VizUB2sqU0TBVo1E3fcntZ9uKFrMjx0pGXEk8XI0XYWXVtfSPvS/fmvyLtZxu
	Uvdhn1dUJE+caRIop6dF5QKPGVOq7SwKX6mqzT3Thjuxog0osyNPBeg5XRSRMwD8rFUakcWcF5EIF
	Z8+DdYIYe/B6oQtT6qqvAvcLrVojA+4rlc3bOqcsbYfuNTOlapw0mAln6UHApcC22RsQ7J9vg/5qD
	ZBelkgdHzvhvkGZtPQYtZuJjSdkJki7fkIH3Nltl+2EWMqMrW1bs+KaSaei//tWpbWIN9xMRyFkAA
	l3Shw64Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5qyy-0000000FULQ-1LQM;
	Tue, 29 Oct 2024 18:30:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5qxL-0000000FUAs-19hy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 18:28:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5861D5C5DFB;
	Tue, 29 Oct 2024 18:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67BBCC4CEE7;
	Tue, 29 Oct 2024 18:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730226518;
	bh=P8mXAsE98FFqUUr7ZIAanxyWudqifHBH+Nea4jlQZe4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nmsV13xlt+y2FkFVVf2UqvyxqT884Bhj+2WWe/tPzJcQKa23S3w+HvNsa3ujLCR1w
	 e9rXa9pPRdj4mYfH90d+pj3Ew4FJocO2QJbjfVHuLFzwlQDSUMyZ01i6uWJStJwzIV
	 fapeWM5LfkOWBgqgefb05gCpo4hLhPB02/hbQkDeZBt8nIz87YskL5WGxqd4pHP70k
	 zQMA0RY+p7lEKFu69mAzISJxd9UVCyRrpusK6ULHmpDfbLl/ETrzDpgVaO4Vmy8wMP
	 ZVHyB9cla/0yeu/poun3HQq9p8PrlSMClTUe0MEgICLMt4wQkFsFE7lC6cnZYp27O4
	 q28XmsC2Zo0+Q==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Kevin Brodsky <kevin.brodsky@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	akpm@linux-foundation.org,
	anshuman.khandual@arm.com,
	aruna.ramakrishna@oracle.com,
	broonie@kernel.org,
	dave.hansen@linux.intel.com,
	Dave.Martin@arm.com,
	jeffxu@chromium.org,
	joey.gouly@arm.com,
	keith.lucas@oracle.com,
	pierre.langlois@arm.com,
	shuah@kernel.org,
	sroettger@google.com,
	tglx@linutronix.de,
	yury.khrustalev@arm.com,
	linux-kselftest@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v3 0/5] Improve arm64 pkeys handling in signal delivery
Date: Tue, 29 Oct 2024 18:28:30 +0000
Message-Id: <173022469291.1156360.488688243050095907.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241029144539.111155-1-kevin.brodsky@arm.com>
References: <20241029144539.111155-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_112839_384149_AF15BEF0 
X-CRM114-Status: GOOD (  10.90  )
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

On Tue, 29 Oct 2024 14:45:34 +0000, Kevin Brodsky wrote:
> This series is a follow-up to Joey's Permission Overlay Extension (POE)
> series [1] that recently landed on mainline. The goal is to improve the
> way we handle the register that governs which pkeys/POIndex are
> accessible (POR_EL0) during signal delivery. As things stand, we may
> unexpectedly fail to write the signal frame on the stack because POR_EL0
> is not reset before the uaccess operations. See patch 1 for more details
> and the main changes this series brings.
> 
> [...]

Applied first patch to arm64 (for-next/fixes), thanks!

[1/5] arm64: signal: Improve POR_EL0 handling to avoid uaccess failures
      https://git.kernel.org/arm64/c/2e8a1acea859

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

