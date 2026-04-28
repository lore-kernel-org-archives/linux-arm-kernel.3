Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3382DFF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 20:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N1J0g1itKSIn55goCYXzUB8ohN6K+nDHaL7xi+3+LV8=; b=js7tW+VeYmObW3gyj0ySZ9U8Ck
	Xq6DiUMg+47hAyNoY07XxLU6/J7ky5rW9e3B5q2/iaq0/A9uymIxjFwwt2txOEsOOe3SoHxtPU7D5
	TwrnJdRHx5YmUXtwgdv+UcQjrxTbd/6jdgE30zK4YuNzvzLte63C9B2ovHNx6a+Au0wDVcLIEpUuY
	nB8rqC7MsDS1aU3U6L2CMNmaX5zfpi5l4HQbxBodsO/jm5pahLNep3xjtDNFQiOcQA21OdyskNxat
	KK9InJa+r/9KALvmgVJy8eY33GQWUztndVvtn25Jgq7cJ+yUb+dKxfUOHpo3ic85bjKdrnmlO+htX
	HYDoIPXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHorm-00000002PMD-0GxB;
	Tue, 28 Apr 2026 20:17:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHora-00000002P6T-0ZiM
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Apr 2026 20:16:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=N1J0g1itKSIn55goCYXzUB8ohN6K+nDHaL7xi+3+LV8=; b=Cx1XAIeYltcB9yE/TPJuPg3ru8
	Y/lPz2jsvVfQqg1MrYunotzQrKedG6StRU91NTw/CC57n9YYC+7+6WX21Dl75mTYtWp8WYy853B7z
	61kcmtRrvIY4kQJe6uYbB385BB7Vao+B5ueA9KwR01bQOIFKJYYVBtg6BuW/SxYFdJvgETtybLh99
	2Cs4HP7zDKYTahZjdbnB6Ah0GZNb80G+szETEkTx/KvNdHjXot5q4eScQ7e25fb119XlQOSB31Y9V
	eYfXxgqadmJCxEqUBC1FEv7asbHHZGYesTFlXyDdPX/Ms87RqqPei8WGlTDrvaO9SlKSxGKwx+0AE
	elXpKQSw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHorD-000000040Yf-1yZ2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 20:16:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9AC3C1C01;
	Tue, 28 Apr 2026 13:16:24 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FE423F763;
	Tue, 28 Apr 2026 13:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777407390; bh=uTKbKl30bgDu2zqJF05DsLcaVd61v3Wew2eLkLzCPkM=;
	h=From:To:Cc:Subject:Date:From;
	b=iSU33CVNona6WtvoAAbVTfZRptHIEUnlrnZLUWFWlEAhFAv+IUHcGFtDgAVmVk/r/
	 Q4BF+GrxQNKJvhIt1yAuTLDlTtN3GRStQvMh8DZDuT9HEERKNoMrwViePFiAg9yl/H
	 gIpWEVqwg7OevKs4WycGRMESLApqu6E/uatmFj30=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: sudeep.holla@arm.com,
	philip.radford@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v3 00/15] SCMI Clock rates discovery rework
Date: Tue, 28 Apr 2026 21:15:07 +0100
Message-ID: <20260428201522.903875-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_211652_288757_4234BA0C 
X-CRM114-Status: GOOD (  14.57  )
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

Hi,

it was a known limitation, in the SCMI Clock protocol support, the lack of
dynamic allocation around per-clock rates discovery: fixed size statically
per-clock rates arrays did not scale and was increasingly a waste of memory
(see [1]).

This series aim at solving this in successive steps:

 - simplify and reduce to the minimum possible the rates data info exposed
   to the SCMI driver by scmi_clock_info
 - move away from static fixed allocation of per-clock rates arrays in
   favour of a completely dynamic runtime allocation: just allocate what
   is needed based on the effectively discovered

This is done in patches 2-6.

A further bigger optimization suggested in a past series [2] by Etienne
would be, whenever allowed by the spec, to limit upfront the number of
queries in order to simply retrieve min and max rate, that are indeed the
only rates needed by the CLK SCMI driver.

The approach proposed in [1] was open coding and duplicating some of the
functionalities already provided by SCMI iterators, though.

Patch 7-14 implement such optimization instead by:

 - reworking core SCMI iterators to support bound enumerations
 - use such new bound iterators to perform the minimum number of queries
   in order to only retrieve min an max rate

As a final result now the rates enumeration triggered by the CLK SCMI
driver, while still allocating for all the existent rates, miminize the
number of SCMI CLK_DESCRIBE_RATE messages needed to obtain min and max.

Finally, patch 15 introduces a new clock protocol operation to be able to
trigger anytime on demand a full enumeration and obtain the full list of
rates when needed, not only min/max: this latter method is really only used
currently by some dowstream SCMI Test driver of mine.

Most notably in this V3 I had:

 - picked up Geert fixes on V2: these could have been squashed in the
   original series while maintaining proper Geert's authorship but as of
   now I have simply picked them up and changed their order to be near the
   commit they fix

 - dropped the "Harden Clock protocol initialization" patch that caused a
   number of out-of-spec vendor FW to break

Based on v7.1-rc1. 
Tested on ARM/JUNO, RADXA/ROCK5B and an emulated environment.

Any feeback welcome.

Thanks,
Cristian

[1]: https://lore.kernel.org/arm-scmi/aZsX-oplR6fiLBBN@pluto/T/#t
[2]: https://lore.kernel.org/20241203173908.3148794-2-etienne.carriere@foss.st.com
---
v2 --> v3
 - Rebased on v7.1-rc1
 - Picked up Geert fixes
 - Dropped patch breaking out-of-spec FW (Harden Clock Protocol init)
 - Collected Reviewed tags

v1 --> v2
 - Rebased on v7.0-rc3
 - Added a Fixes patch to rectify bug in rounding algo
 - Removed useless parenthesis in macros
 - Collected a few Reviewed-by tags
 - Clarified commit message


Cristian Marussi (12):
  clk: scmi: Fix clock rate rounding
  firmware: arm_scmi: Add clock determine_rate operation
  clk: scmi: Use new determine_rate clock operation
  firmware: arm_scmi: Simplify clock rates exposed interface
  clk: scmi: Use new simplified per-clock rate properties
  firmware: arm_scmi: Drop unused clock rate interfaces
  firmware: arm_scmi: Make clock rates allocation dynamic
  firmware: arm_scmi: Harden clock parents discovery
  firmware: arm_scmi: Refactor iterators internal allocation
  firmware: arm_scmi: Add bound iterators support
  firmware: arm_scmi: Use bound iterators to minimize discovered rates
  firmware: arm_scmi: Introduce all_rates_get clock operation

Geert Uytterhoeven (3):
  firmware: arm_scmi: Fix bound iterators returning too many items
  firmware: arm_scmi: Use proper iter_response_bound_cleanup() name
  firmware: arm_scmi: Fix OOB in scmi_clock_describe_rates_get_lazy()

 drivers/clk/clk-scmi.c                |  48 +---
 drivers/firmware/arm_scmi/clock.c     | 301 ++++++++++++++++++++------
 drivers/firmware/arm_scmi/driver.c    |  80 +++++--
 drivers/firmware/arm_scmi/protocols.h |  13 +-
 include/linux/scmi_protocol.h         |  29 ++-
 5 files changed, 324 insertions(+), 147 deletions(-)

-- 
2.53.0


