Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38EFCD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 15:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NH/QJ5g/D/p+sCnxmA8gXXe/fpGTPrQ0n+KfelDkKcE=; b=Fc7mYToxCUnbesGwGsl8k8DG0D
	Tef98PcHwgvwQYLHBswYnNeOUVNbRkyPDW1SY3Jrq49VZbEKCHZf2csfuLCt7Mn9DJk4wNuOlarSS
	68UH4NHSa2lSTi0XPzDHPZU6pCdTVXN7jfqlTinrw8QUk8qMMTF2gKRiXRXay3BbuCwdztGJG3naN
	wYGYDqRGypwVytACQeV9+TQb54cz0vo+sWNOd6SZxMarR+Da4/tLuITG9FOUj5dZhaCoN6B+2LTZR
	g/DsvEgPOu4oLtlrflKCgPcr40k/Afo6jV+3LgsybE8A13qZzt35t1jqiAxwYv8A+D/k/yGTICn+X
	fVDjTgcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNCs-00000006r4P-14k9;
	Fri, 08 May 2026 15:33:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNCo-00000006r2U-2rwv
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 May 2026 15:33:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=NH/QJ5g/D/p+sCnxmA8gXXe/fpGTPrQ0n+KfelDkKcE=; b=YPX9EuBWX73OEnuyfdmFbK8sSe
	IibQCcHlW0WWLuN1D6sD5WkkSobFiIsEKLWFQ0ApTk/8thUHhGv6uOKDQFV5ZSVBGGTxH8Y8/VKxY
	1s3rqZnxN4TACAFZ8CKuuyMidyjDmPuK6mtgfRlkoM5G66HAFR3MEfcooh1V63EqSfv9A2+rQLnCv
	9TN2oVuGo8hZlT6dj9QUlc+jLyp6WgG9xGeodtFh/WDGSctBSo0hT23xbvgucQRP+eNm19k6HcvO4
	iBNZf7RJX6IkDXv8yZArYGYdcZ53FUkEHZPCE4Mbv2/V//ZG8zVt9umWpMRk0S22hMUVdSlTGoGTv
	58zXSt/Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNCk-00000006iG9-1fRp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 15:33:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0DC8359E;
	Fri,  8 May 2026 08:33:22 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 70A453F836;
	Fri,  8 May 2026 08:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778254408; bh=RAyfA1a0+zafxdRlyIeQqEZPVfv3656sUTL19grG05Y=;
	h=From:To:Cc:Subject:Date:From;
	b=IqqBuHvI4b5+qi2n3dGKN8uIazISFHwbiNFDcpQF9KsAUc5e0rXf/LFe/ZFwwFbhB
	 LPaUNOZLqdJMQSPX9uZ2xz6Okcx5mJ4DLMltgwAVRYS3V0JHVP+w+VAloSe3wVzc4Q
	 4fKbwNEwjS171QfPuNUZC9tEQmJAfZlOEZ+zU3eY=
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
Subject: [PATCH v4 00/15] SCMI Clock rates discovery rework
Date: Fri,  8 May 2026 16:32:45 +0100
Message-ID: <20260508153300.2224715-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_163331_557394_1BFFCCFE 
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

Most notably in V3 I had:

 - picked up Geert fixes on V2: these could have been squashed in the
   original series while maintaining proper Geert's authorship but as of
   now I have simply picked them up and changed their order to be near the
   commit they fix

 - dropped the "Harden Clock protocol initialization" patch that caused a
   number of out-of-spec vendor FW to break

Based on v7.1-rc2. 
Tested on ARM/JUNO, RADXA/ROCK5B and an emulated environment.

Any feeback welcome.

Thanks,
Cristian

[1]: https://lore.kernel.org/arm-scmi/aZsX-oplR6fiLBBN@pluto/T/#t
[2]: https://lore.kernel.org/20241203173908.3148794-2-etienne.carriere@foss.st.com
---
v3 -->v4
 - Rebased on v7.1-rc2
 - Removed unused info.rate_discrete [Geert]
 - Made dev_dbg() more meaningful by printing tot_rates [Geert]
 - Fixed build bisectability by renaming properly to iter_response_bound_cleanup()

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
 include/linux/scmi_protocol.h         |  30 +--
 5 files changed, 324 insertions(+), 148 deletions(-)

-- 
2.53.0


