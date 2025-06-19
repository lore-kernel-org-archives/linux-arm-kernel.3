Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C5FC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 17:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rVey/RwFGP2JwnGNOVZpYMJlGd+/HEApmmf5vTHags4=; b=YIChAiaeLL7CEbDRrwsyiTVTir
	/sBq4Q8sMnmMAf435MvmkIkXTvB1EGRYJCuDAIS5gAsdPbujuzTBIoCkvT025Zm0OfiBBgE8QScEc
	cWkItRJMeu282/Rt3woiigR4j57Ps2CTkwpT9CQH7cQYV2noDrbhJy3weRVabYiuVZzOY8m4ZB6sR
	XfG+cp+lkCr07LQqjcw8K92D1pMOGeVodpNDC4EP8mhEruYn837OEgqz+Hp58mLbGciZvpWWaonGi
	658ah80VEisQVnQu54l9GkGIQG14kot7q5TI3FfN4ECXVhXLg5Iwn9TEoMslboNU3trwpNIIm37ad
	TIPAilxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIeZ-0000000Deho-2YVi;
	Thu, 19 Jun 2025 17:02:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEFl-0000000D1j6-0zzz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 12:20:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DAD9D12FC;
	Thu, 19 Jun 2025 05:20:04 -0700 (PDT)
Received: from oss-apollo7005.oss.cambridge.arm.com (oss-apollo7005.oss.lab.cambridge.arm.com [10.7.15.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3F103F66E;
	Thu, 19 Jun 2025 05:20:23 -0700 (PDT)
From: Philip Radford <philip.radford@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Cc: sudeep.holla@arm.com,
	cristian.marussi@arm.com,
	luke.parkin@arm.com,
	philip.radford@arm.com
Subject: [PATCH 1/4] firmware: arm_scmi: Add debug decrement counter
Date: Thu, 19 Jun 2025 12:20:01 +0000
Message-Id: <20250619122004.3705976-2-philip.radford@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250619122004.3705976-1-philip.radford@arm.com>
References: <20250619122004.3705976-1-philip.radford@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_052025_321515_635D4250 
X-CRM114-Status: UNSURE (   7.54  )
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

Create scmi_dec_count function to decrease any of the Arm SCMI
debug counters

Signed-off-by: Philip Radford <philip.radford@arm.com>
---
 drivers/firmware/arm_scmi/common.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index dab758c5fdea..c6495c4a0e8a 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -314,6 +314,12 @@ static inline void scmi_inc_count(atomic_t *arr, int stat)
 		atomic_inc(&arr[stat]);
 }
 
+static inline void scmi_dec_count(atomic_t *arr, int stat)
+{
+	if (IS_ENABLED(CONFIG_ARM_SCMI_DEBUG_COUNTERS))
+		atomic_dec(&arr[stat]);
+}
+
 enum scmi_bad_msg {
 	MSG_UNEXPECTED = -1,
 	MSG_INVALID = -2,
-- 
2.25.1


