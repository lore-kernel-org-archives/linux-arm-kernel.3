Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF457C5AD44
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 19:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yk6y9M/bGeFdI+KD3ancRHUMLL3xSUPfuJ/GYbMyt38=; b=3+VD2Lr5XJrDDgjsoosmvRSlzf
	iAew8YKanQVZt5tRFoFv3tap+ylA1yJ0MgYfTBP+KnUrmBbQS1Lp/koKpXax8LGfMr7vCtUAPmlG8
	LSaDYP9+HO3BOgiv9GyQMeIzWR6Uc2UpmHmYY8dN1wJN1whtD0t8ppz3x4C8TCmP8TNNfwii3EgRc
	RI0gdnirtCejtw8MGIvhIEBrQzlGAUr8esjE7N/yAjIl2eFXCVl3n8bwPzEcseerlNMaCBq3UHGOG
	157UxR9qI3Wp4GTWqejQbT5oPtGF1KEG3zP/cyRY6eGpbHUea1JpvGaPMC2rzlLZ1gP+lpDmh1UP6
	RMw/7Eew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsmNe-00000009bQN-16dG;
	Sat, 08 Aug 2026 19:06:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsmNa-00000009bPO-3nml
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 19:06:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0A571570;
	Sat,  8 Aug 2026 12:06:39 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D47113F86F;
	Sat,  8 Aug 2026 12:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786216004; bh=bWQb7uwORFSY6GGme2jUY9rEAwIe/vwccDMcGQhyUF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h7oEPS5kDgzhbBPXWRreki5/5cWSLif7La/RI9Kng2Naxx72w2k9M3xBJuYX2QNn5
	 CyUApx5t8mjc5hYVwKtLYiZr0+6ENFLmiHUaNjTR8phAw9WupsGAFW/lipczOqUQL2
	 ryU+lkdZXt3+6jfilhIe5SHMmeoOi7wa91/xBc78=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	d-gole@ti.com,
	jic23@kernel.org,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	david@kernel.org,
	souvik.chakravarty@arm.com,
	leitao@kernel.org,
	kas@kernel.org,
	puranjay@kernel.org,
	usama.arif@linux.dev,
	kernel-team@meta.com,
	Cristian Marussi <cristian.marussi@arm.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v8 01/23] firmware: arm_scmi: Add new SCMIv4.0 error codes definitions
Date: Sat,  8 Aug 2026 20:05:32 +0100
Message-ID: <20260808190554.387949-2-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260808190554.387949-1-cristian.marussi@arm.com>
References: <20260808190554.387949-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_120646_991846_0FFF81F3 
X-CRM114-Status: UNSURE (   9.98  )
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

SCMIv4.0 introduces a couple of new possible protocol error codes: add
the needed definitions and mappings to Linux error values.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v4 --> v5
 - map SCMI_ERR_IN_USE to EBUSY as natural
---
 drivers/firmware/arm_scmi/common.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index b9723c105fc1..d9db4a4d17dc 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -46,6 +46,8 @@ enum scmi_error_codes {
 	SCMI_ERR_GENERIC = -8,	/* Generic Error */
 	SCMI_ERR_HARDWARE = -9,	/* Hardware Error */
 	SCMI_ERR_PROTOCOL = -10,/* Protocol Error */
+	SCMI_ERR_IN_USE = -11,  /* In Use Error */
+	SCMI_ERR_PARTIAL = -12, /* Partial Error */
 };
 
 static const int scmi_linux_errmap[] = {
@@ -61,6 +63,8 @@ static const int scmi_linux_errmap[] = {
 	-EIO,			/* SCMI_ERR_GENERIC */
 	-EREMOTEIO,		/* SCMI_ERR_HARDWARE */
 	-EPROTO,		/* SCMI_ERR_PROTOCOL */
+	-EBUSY,			/* SCMI_ERR_IN_USE */
+	-EINVAL,		/* SCMI_ERR_PARTIAL */
 };
 
 static inline int scmi_to_linux_errno(int errno)
-- 
2.54.0


