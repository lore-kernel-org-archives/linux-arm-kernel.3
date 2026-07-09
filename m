Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC468C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 14:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jKSBYecH+EyGOAeyvpg14uE+/2aOtGsY3OZpO4ezjEQ=; b=gdrRwBtrwCMxVxLp4HO6fdjSe5
	kvfmDIzPwh5tubmSTBCtd8NHrl1iLM4sDZY/ZOybowaWFf9fHFhfWXl/NTXhhiLZsK0Ih0gj99lXQ
	2ddjSw2a2JCiB1sI1f982pkdcuNVp1CZnZNxNa5ta75eadbUpBJh48k/6kUMJ/DDKe/ZncBd6Y4s1
	uIVCKulZR9I4xS8Lx0zG76YdrFDAvvfwndIkEhvYUIm0j/hLT0ykQxvacsJKlumSoPUcJyQGs+kQh
	nvIC6kiV0Mvm2iM6kyf2gBTvx51k+jPTMHi4DzsMJk9pFqgIhBAv/JPmnEjUEf/9mEuK4EJqrVNIw
	6+sY0vQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpv6-00000002nkA-2s8Q;
	Thu, 09 Jul 2026 14:40:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whpv4-00000002njX-1MgI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 14:40:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E39C5152B;
	Thu,  9 Jul 2026 07:39:58 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E73A83F66F;
	Thu,  9 Jul 2026 07:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783608003; bh=52TghAuaTr4O+tB+lgjiiJERJST0JojMUFPR+rQdHNE=;
	h=From:To:Cc:Subject:Date:From;
	b=JAg+IqJMSp0tqZbFfrthAWNrr5+D7zhml+CAzJPxWNRk8gzS1KegMJg5VAf+sJyAA
	 +AEU+J75b3zzIgSBHVbA5eG8YPO+hxCN8Zgl7MKZfuEvEa/zQZ6pC7dJg0KHdN6CiJ
	 zS/tNSOPG/01k1oJozBmhMdI9xWX2y5K1ufU31is=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	mark.rutland@arm.com,
	catalin.marinas@arm.com
Cc: ilkka@os.amperecomputing.com,
	bwicaksono@nvidia.com,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 0/4] perf/arm_cspmu: Miscellaneous improvements
Date: Thu,  9 Jul 2026 15:39:52 +0100
Message-ID: <cover.1783605641.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_074006_489862_BF32B034 
X-CRM114-Status: UNSURE (   7.10  )
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

Hi all,

These are a few quality-of-life improvements for CoreSight PMU that
I've accumulated based on things which have come up in practical usage.
There's no real dependency between any of the individual patches, it
just felt right to send them as a series.

Thanks,
Robin.


Robin Murphy (4):
  ACPI/APMT: Use stable device ID
  perf/arm_cspmu: Improve APMT-based PMU naming
  perf/arm_cspmu: Improve sub-module error reporting
  perf/arm_cspmu: Make IRQ more optional

 drivers/acpi/arm64/apmt.c          |  2 +-
 drivers/perf/arm_cspmu/arm_cspmu.c | 49 ++++++++++++++++++------------
 2 files changed, 31 insertions(+), 20 deletions(-)

-- 
2.54.0.dirty


