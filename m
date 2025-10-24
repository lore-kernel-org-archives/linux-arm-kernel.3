Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB848CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Oct 2025 16:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3wCI5/vEwXg1Dcz96t6+1r9aLoRXMydUOkMBa8DurF8=; b=LV44MBFCs9TKv6sq2VTOYlS1te
	dCzcJGCa7g9xpz724poHUO0pxvUn7k/Ayv67Wi52LdzftEZi3/Pbmy4mwxMpV5/J7S2FbSbl11iXI
	1It69lZzkWcmuFiwqGMeBmL9ij15LAE9JTavWlNWOqHcvieSV+or8ZLHqe23bdc9te+5SyQUp2eDe
	0TZpGSJNz6ll6nP7ds8JQD85+vXu/f9INbG1G8jouXVS6rQtRvEWAYZxxGqRTS8+AEEdpVEt5NPS4
	s4jOKC9xG9SoQidK1xidH2+Pz1wiw3D9AhhoRPe5fi6BmmNoe/Hj+PhChMBVk+GgvBgXgxnW2xaxI
	nwhbJxYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKwS-0000000A1Gu-1tPZ;
	Fri, 24 Oct 2025 16:47:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKwD-0000000A148-1frw
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 24 Oct 2025 16:46:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3wCI5/vEwXg1Dcz96t6+1r9aLoRXMydUOkMBa8DurF8=; b=ivc39lEq+WmHofJYnnf6PsJvj3
	DtB5lXcYGMY8+hjONwPlCUTpY/zbLpUuMsUOscTCrPNLfuyXzpGq59x8vNgJXPEpnjEk7PIH+Jbte
	u/U32/9bDsi0+egPKX1HHMO7OnZl0+IVxG57OT2Dj65wMYvWvYW3mGV1UABvr3fIixRH5V2Z7evOU
	FHrTZHcFzGhLxeHVOu6LB9pCTKwg648DOpe1QAT7EZA2NCC9fIpDLXuge3ztI6iqu0kMnAIUwnYiS
	eTobhhJuuz9KJDj62t2u65WLfSgsOR9G+e2jYXzlkfXZk8Zxux5L2I3kLcUcc/OB8im0B0IQoZ4uE
	QAT7B8+Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCK4V-00000002P7F-3Pr4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Oct 2025 15:51:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBB771E2F;
	Fri, 24 Oct 2025 09:46:34 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01FF63F66E;
	Fri, 24 Oct 2025 09:46:40 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 24 Oct 2025 17:45:58 +0100
Subject: [PATCH v4 10/11] coresight: etm4x: Retain sequencer state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-arm_coresight_power_management_fix-v4-10-690e69ae6977@arm.com>
References: <20251024-arm_coresight_power_management_fix-v4-0-690e69ae6977@arm.com>
In-Reply-To: <20251024-arm_coresight_power_management_fix-v4-0-690e69ae6977@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761324381; l=1017;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=AkNJQz/BR5M0GPYmwWM/YEhWSPNaffT8gKCLhmZx5eQ=;
 b=KDn4CKEpvJAl0kn8EiJjhiYJY17+pVeAqAZfa5t3I6HK6qYt1gsONR44EHX629Hdk1UXZMHrr
 Rwere0me1rhCIoxPTtjhx5K/WrRHePQohrXWUNT1SQJyDtLSezeXKYq
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_165120_085191_DE45747B 
X-CRM114-Status: UNSURE (   8.86  )
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

Retain sequencer state in the disable flow and will be restored in the
enable flow.

As a result, the flow will be reused by CPU suspend and resume in
sequential change.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 4c6236ad241d1a13515160ca478fae839a891e38..71a4fcbca44091d5f441d4bc502b3c5f4fd3c984 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1026,6 +1026,10 @@ static void etm4_disable_hw(struct etmv4_drvdata *drvdata)
 			etm4x_relaxed_read32(csa, TRCCNTVRn(i));
 	}
 
+	/* read back the sequencer state */
+	if (drvdata->nrseqstate)
+		config->seq_state = etm4x_relaxed_read32(csa, TRCSEQSTR);
+
 	coresight_disclaim_device_unlocked(csdev);
 	etm4_cs_lock(drvdata, csa);
 

-- 
2.34.1


