Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258B5E69E81
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 18:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0+xFR+D/tOmF3B3oFt1nZi2HsW3+srQwp8PnoOfVuw=; b=Mgsv65AsaMLJTxEE84sF1N1Zom
	Vex2faH8Pn7NZwFW60ppq5LuSBH2ilHTq0AcpZQqAQV3aeqbessQq5Wi9k0NtysTMp2R9mGX5vTX5
	yHVpHvYenAIYiyuaSKT5UGgsfRR5VnqJTcy68aw9FAD8akW6rEqFlTn5p2bCieUOZwQTd9DQ6J2P1
	xGdCWWsNbnYa+I7bwqeX6K7aHCF0EFRjsM+0SeCvvYsr4fCc0oO2CoR+EaCvhGZmLa52/xIVWT6+T
	J6R2MxZFE7zc5s8iSVR8wJhJJ72G7TvWjAYEwt5Wzw3R8kDflrZZdYriMTfPMUOWUaFCVEsHodupJ
	LPRFSoqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAzJ-000000078ri-0lxB;
	Mon, 02 Dec 2024 18:17:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIAyI-000000078is-1Umd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 18:16:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B3CBD5C60F6;
	Mon,  2 Dec 2024 18:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BB14C4CED1;
	Mon,  2 Dec 2024 18:16:32 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org,
	Yang Shi <yang@os.amperecomputing.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6.13-rc1] arm64: mte: set VM_MTE_ALLOWED for hugetlbfs at correct place
Date: Mon,  2 Dec 2024 18:16:29 +0000
Message-Id: <173316338578.1186434.1700615074381764365.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241119200914.1145249-1-yang@os.amperecomputing.com>
References: <20241119200914.1145249-1-yang@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_101634_438913_A0FE822F 
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

On Tue, 19 Nov 2024 12:09:14 -0800, Yang Shi wrote:
> The commit 5de195060b2e ("mm: resolve faulty mmap_region() error path
> behaviour") moved vm flags validation before fop->mmap for file
> mappings.  But when commit 25c17c4b55de ("hugetlb: arm64: add mte support")
> was rebased on top of it, the hugetlbfs part was missed.  Mmapping
> hugetlbfs file may not have MAP_HUGETLB set.
> 
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] arm64: mte: set VM_MTE_ALLOWED for hugetlbfs at correct place
      https://git.kernel.org/arm64/c/49ccf2c3cafb

-- 
Catalin


