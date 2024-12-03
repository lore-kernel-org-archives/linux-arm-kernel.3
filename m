Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFAB3E74ACA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 20:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4yhhK3itX+pw1M12m0WDyBs5YnFRKlqnvEkZmtPRuKw=; b=TLn/5KhbUbgE6mT17AqDayhnkc
	Ru9nNxDT5MwIFxpfWmnrWAcioq7Q28VrHgc+HQLX8kZ9U8TE3Wnbpj31u+sjAd4G9cUAMjZhYFo7s
	dAB+opvyxGK03NK+Zp+aWwQxEThGhCBlbpE9+CFatEX5DS6Z9jMTPzH6skm/kBRDDHLr3R+eUT+jw
	O32Wj8beJig+TLk9+KSO4C4Rj0nWAsw/kaGChq0iw6v5BOLS/kL8UCvqZ8RspErFsZaCRSsm8JA88
	UvK3Klsknji6tRzKsX3opwdNUGyHgAx27KouGhtkidVVAiTUeAilry/BoVbcNdzVZJjPcwR7sraO4
	bZA1HeDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIZ64-0000000AZNN-1Chy;
	Tue, 03 Dec 2024 20:02:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIZ51-0000000AYwa-379R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 20:01:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67E7BFEC;
	Tue,  3 Dec 2024 12:01:34 -0800 (PST)
Received: from pluto.guest.local (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D7D5A3F5A1;
	Tue,  3 Dec 2024 12:01:03 -0800 (PST)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	dan.carpenter@linaro.org,
	johan+linaro@kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH 0/2] Add SCMI Vendor module autoload support
Date: Tue,  3 Dec 2024 20:00:36 +0000
Message-ID: <20241203200038.3961090-1-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_120107_827351_359AE3B0 
X-CRM114-Status: UNSURE (   8.08  )
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

Hi,

a tiny series to add the capability to automatically load the proper
vendor protocol module when an SCMI driver tries to use it; while proper
vendor protocol selection is already provided by the SCMI core, automatic
loading of vendor protocols was not.

Lookup is now based on module aliases following the pattern:

	scmi-protocol-0x<PROTO_ID_NN>-<VENDOR_ID>

In [2/2] proper aliases are added to existing i.MX Vendor protocols...
...could not find a better way to build the alias string automagically...

...any advice is welcome in these regards...and any feedback too !

Thanks,
Cristian

Cristian Marussi (2):
  firmware: arm_scmi: Support vendor protocol modules autoloading
  firmware: arm_scmi: Add module aliases to i.MX vendor protocols

 drivers/firmware/arm_scmi/driver.c            | 56 +++++++++++++++----
 .../arm_scmi/vendors/imx/imx-sm-bbm.c         |  5 +-
 .../arm_scmi/vendors/imx/imx-sm-misc.c        |  5 +-
 include/linux/scmi_imx_protocol.h             |  9 +--
 4 files changed, 57 insertions(+), 18 deletions(-)

-- 
2.47.0


