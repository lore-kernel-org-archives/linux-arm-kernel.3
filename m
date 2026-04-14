Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6219DF9D0CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 13:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=px5yEBU5FcEbehMk8v4NjrkmJXQht5doE3kzOmaFP0w=; b=gJmSOdRmoxwbSaFtN5RpApDWj0
	KJ5ZB6iRsxF5GdGyHrYF8HRoy9BTJNvJPHO3Pe61vlTs+6H2cS/LUFH/cmHRk8oJEKckapVfUlaAs
	0fjnwEMbCflRSI0FrSqlt60eonnowkeTBoUNK+MOBgZLq6VRAIyFPXV+L86GdNd1HN30bg5K1MH6Q
	bI9rXuLhYEAErE3cZ0tM2QST6RLkbHnL5WHUSVKFC0ahBjRyXHMkx15/3vBULNALIcLiPpjWo7A45
	3Sjw//2VAU9k6LBNpE8XKRQ7gVXAh4YF5YVPQV4id+8bVxKFr7zoc4ls3+X8qtnDvCARPigoMsRrZ
	Tr74FrHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdoJ-0000000HNI0-3RqE;
	Tue, 14 Apr 2026 13:28:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdoH-0000000HNHS-41zK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 13:28:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4B8C4E8A;
	Tue, 14 Apr 2026 06:28:02 -0700 (PDT)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E9DD3F7B4;
	Tue, 14 Apr 2026 06:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776173288; bh=nphOGQjMcH8/vvF1pOblAjkrgf8ijLSmK2j4/Q1BhOc=;
	h=From:To:Cc:Subject:Date:From;
	b=hBL0rjCu9TODGvAPZ+UCQV6rRz0cjV00DSSM2dLKr0K09ZnJbP+RwFWx6oc6o+Y4m
	 QpUgD/geLl+nNolpHv7qrPYNmVYggtj7G7C9zCgiu9xs5Y3yRpInvMTVZLStO8SZYb
	 CB0ujXfqFV0roSQdPnqF70EMKY5dXAQHeQgTEcI0=
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
	Dan Carpenter <error27@gmail.com>,
	James Morse <james.morse@arm.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>,
	lkml <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v1 0/2] arm_mpam: resctrl: mpam resctrl glue code fixes
Date: Tue, 14 Apr 2026 14:27:55 +0100
Message-ID: <20260414132758.196874-1-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_062810_122618_4599683C 
X-CRM114-Status: UNSURE (   7.86  )
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

A couple of minor fixes for the new mpam resctrl glue code. These fix
a sparse warning and and use of an unitialized variable in an
unexpected error case.

Thanks for the bug reports.

Based on arm64 for-next/mpam.
git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/mpam

Ben Horgan (2):
  arm_mpam: resctrl: Fix the check for no monitor components found
  arm_mpam: resctrl: Make resctrl_mon_ctx_waiters static

 drivers/resctrl/mpam_resctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0


