Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AFCBD5B16F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 13:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LPVvIKdIA3b0jQwCG/JxcZeYyFRvL+algLD2mQyJZKg=; b=FzLpQoy4yM/ke0sZ110rw+xjs2
	Uoq7MqR3WQhm3m8DBKvy+u1JoIVSvssolElEfKVVZV2seEJOx90XaClPyg1Ocb2tWTh0N+5tCllEx
	mQ6oXFKKZ66+vkJOBSNT+bmzAJ4s2ozWHQ/1a677cp31CSvQ3c60+yNqWnK35tT+qmqBC2hZSWw4e
	wbImLixacTVhOQEeky/jKQ8zGvs7k1X73sNDCDMdnBi7z/ZZNTcws1vf9l/45gBbwNokZyfFm9j1T
	/lNbK62pHC103ou2x6k8Qvr7EKCIjPAtg+GfQ4yPKJayT+pD4LPhGXLsGOW9RPJ003PLh/MjyjraT
	wXImHfYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV8GJ-00000003fMh-1YXI;
	Mon, 15 Dec 2025 13:05:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV8GG-00000003fL1-0UGc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 13:05:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A6B1497;
	Mon, 15 Dec 2025 05:05:00 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.95])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5AA2F3F73B;
	Mon, 15 Dec 2025 05:05:06 -0800 (PST)
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org
Cc: mark.rutland@arm.com,
	suzuki.poulose@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 0/3] perf/arm_dsu: Support newer DSUs
Date: Mon, 15 Dec 2025 13:04:57 +0000
Message-Id: <cover.1765802897.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.39.2.101.g768bb238c484.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_050512_221269_B5D75777 
X-CRM114-Status: UNSURE (   5.78  )
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

DSU-110 and 120 have been out for a while, and although they continue
to share the same basic system register interface, they have subtle
functional changes that require a little attention to support properly.
And while DSUs still aren't widely exposed in current systems, at least
some folks do apparently care.

Sanity-checked on DSU-120 in FPGA, and original DSU on Rockchip RK3566
with TF-A hacked to set ACTLR_EL3.CLUSTERPMUEN.

Cheers,
Robin.


Robin Murphy (3):
  perf/arm_dsu: Support DSU-110
  perf/arm_dsu: Support DSU-120
  perf/arm_dsu: Allow standard cycles events

 drivers/perf/arm_dsu_pmu.c | 37 +++++++++++++++++++++++--------------
 1 file changed, 23 insertions(+), 14 deletions(-)

-- 
2.39.2.101.g768bb238c484.dirty


