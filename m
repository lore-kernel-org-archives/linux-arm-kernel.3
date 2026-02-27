Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E5FFEFB5E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 15:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y4YW+pWHi2yjgNZITzBQUpb2SBkGUoIAr8Mx3e3z/nw=; b=JROZckylzQwxPsjYbe/fmvVgg7
	eV1drGGUds6csmCVumlrEQfVKsGGKaYtNoEUCNaQhfheD9FYcWNtdoE/EOYCr+pQKvD6aGaPTfvKh
	YQTnw2odEe7rBoLK2Mdo8Wr45cl8bodP6lUcSZ9aOaZ6MpaTFpqhHmZVwp8sWnie21+y/YicRVCDP
	Bx8vkp/7Uk1DtRbXF/S5rFbiEXLRdU54R3ckIvP9ckuUCYxxf8sjHkASCC0mAG02yDbExacZjir+O
	6OIjjhV+H5NSuAmfa/TABjarxz6dvLQmDpF1kTa/X4bd/H2Zz4sJ9QjEGXHsCKDPsRARP4+OD8EQO
	xdb6O6+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzpx-00000008dlM-1Zxh;
	Fri, 27 Feb 2026 15:33:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzpw-00000008dkr-00I5
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Feb 2026 15:33:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=y4YW+pWHi2yjgNZITzBQUpb2SBkGUoIAr8Mx3e3z/nw=; b=BzIdWqNLDBoQFN3pkh7z1sRHAQ
	c2qlfMZXUzYp296JbBpKZMuVemL1cgoEXh+gfvKxTTDHlOP6MnAwPxJ/SSpY4YPEQthdVc8fsvWd8
	FxM12ag69aWZvi1+L4sX9J7w6QiitmeuP6BXFvgs/vyXPAiS9o5zj8lSUR8ApJbt2XGyZT4ctfF7r
	tzj87d12OmNSQPOezB221onYvuUVL+eFeVX0jk8IUMrayv03rfOdJol0yHo/kwlQAk/ogrO97SzLT
	28q0fekM3knWXesEEE1mUCWm7b+/KNQtiyXJKtKMyZcJp1GomcWPvKru5PT5wLFlfzP0v6CPma9E4
	f0X29wKA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzps-0000000DNgG-1ERT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 15:33:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B55C7339;
	Fri, 27 Feb 2026 07:32:51 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB1203F73B;
	Fri, 27 Feb 2026 07:32:51 -0800 (PST)
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
	dan.carpenter@linaro.org,
	geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 00/11] SCMI Clock rates discovery rework
Date: Fri, 27 Feb 2026 15:32:14 +0000
Message-ID: <20260227153225.2778358-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_153300_799919_D67ADA9D 
X-CRM114-Status: GOOD (  10.88  )
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

This is done in patches 1-6.

A further bigger optimization suggested in a past series [1] by Etienne
would be, whenever allowed by the spec, to limit upfront the number of
queries in order to simply retrieve min and max rate, that are indeed the
only rates needed by the CLK SCMI driver.

The approach proposed in [1] was open coding and duplicating some of the
functionalities already provided by SCMI iterators, though.

Patch 7-10 implement such optimization instead by:

 - reworking core SCMI iterators to support bound enumerations
 - use such new bound iterators to perform the minimum number of queries
   in order to ony retrieve min an max rate

As a final result now the rates enumeration triggered by the CLK SCMI
driver, while still allocating for all the existent rates, miminize the
number of SCMI CLK_DESCRIBE_RATE messages needed to obtain min and max.

Finally, patch 11 introduces a new clock protocol operation to be able to
trigger anytime on demand a full enumeration and obtain the full list of
rates when needed, not only min/max: this latter method is really only used
currently by some dowstream SCMI Test driver of mine.

Based on v7.0-rc1. 

Tested on JUNO and an emulated environment.

Any feeback welcome.

Thanks,
Cristian

[1]: https://lore.kernel.org/arm-scmi/aZsX-oplR6fiLBBN@pluto/T/#t
[2]: https://lore.kernel.org/20241203173908.3148794-2-etienne.carriere@foss.st.com
---

Cristian Marussi (11):
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

 drivers/clk/clk-scmi.c                |  48 +----
 drivers/firmware/arm_scmi/clock.c     | 296 ++++++++++++++++++++------
 drivers/firmware/arm_scmi/driver.c    |  73 +++++--
 drivers/firmware/arm_scmi/protocols.h |  13 +-
 include/linux/scmi_protocol.h         |  29 +--
 5 files changed, 314 insertions(+), 145 deletions(-)

-- 
2.53.0


