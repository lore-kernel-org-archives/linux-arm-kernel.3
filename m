Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77090D29FEF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 11:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FR3kKUkUvmfdQvcRS/UYfA8wpcCeraiOSse1M5Q029E=; b=0U+Gae6WfoIQMDj2dNY3ekV4Fw
	X8epvczXf2YsQj89vTj7WDIz9B/hYPI4DkVcs5lBQQzmV2sccFG1LanoeVdfWtzTOqGAtQZyX4OLY
	NxXFXO5ui2dBIQXxCNwyWdY/ag5Ds2SUHG4F8Ke9CqXWOZG+jyTj/Hsw3lapm7FP3c+iKt61ojaVd
	o7PTCxlqZ9XN6MVn9yOOe7dsWyiP9Yg+lpXtZxmpsQRBMqvdRHeGwb1HuUyN88waVZjrZ93G1G+IG
	OLaL7mui8X9mm88J9la8PiMqA7qA5hkvtzRRfBeiXBvFpO3ZILoLfbhnrHN7Wqa5NvqmJ9ozdyfy0
	qVDwfDOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzMN-0000000911U-3jod;
	Wed, 14 Jan 2026 11:48:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzMB-000000090pD-37nh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 11:48:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F9A7497;
	Wed, 14 Jan 2026 03:48:04 -0800 (PST)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A69873F59E;
	Wed, 14 Jan 2026 03:48:07 -0800 (PST)
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Cc: sudeep.holla@arm.com,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	etienne.carriere@st.com,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	dan.carpenter@linaro.org,
	d-gole@ti.com,
	jonathan.cameron@huawei.com,
	elif.topuz@arm.com,
	lukasz.luba@arm.com,
	philip.radford@arm.com,
	souvik.chakravarty@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v2 13/17] fs/stlmfs: Document alternative topological view
Date: Wed, 14 Jan 2026 11:46:17 +0000
Message-ID: <20260114114638.2290765-14-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114114638.2290765-1-cristian.marussi@arm.com>
References: <20260114114638.2290765-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_034812_353153_9D91B980 
X-CRM114-Status: UNSURE (   7.23  )
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

The human readable interface presents an alternative view based on the
discovered topological relations between the DEs.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 Documentation/filesystems/stlmfs.rst | 72 ++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/filesystems/stlmfs.rst b/Documentation/filesystems/stlmfs.rst
index 5c23f7e5f12c..cc9585f77ba5 100644
--- a/Documentation/filesystems/stlmfs.rst
+++ b/Documentation/filesystems/stlmfs.rst
@@ -112,6 +112,7 @@ the following directory structure::
 	|-- all_des_enable
 	|-- all_des_tstamp_enable
 	|-- available_update_intervals_ms
+	|-- components/
 	|-- control
 	|-- current_update_interval_ms
 	|-- de_implementation_version
@@ -202,6 +203,77 @@ values, as in::
 	|-- intervals_discrete
 	`-- tstamp_enable
 
+components/
+-----------
+
+An alternative topological view of the des/ directory based on the topology
+relationship information described in des/ ::
+
+	components/
+	├── cpu
+	│   ├── 0
+	│   │   ├── celsius
+	│   │   │   └── 0
+	│   │   │       └── 0x00000001 -> ../../../../../des/0x00000001
+	│   │   └── cycles
+	│   │       ├── 0
+	│   │       │   └── 0x00001010 -> ../../../../../des/0x00001010
+	│   │       └── 1
+	│   │           └── 0x00002020 -> ../../../../../des/0x00002020
+	│   ├── 1
+	│   │   └── celsius
+	│   │       └── 0
+	│   │           └── 0x00000002 -> ../../../../../des/0x00000002
+	│   └── 2
+	│       └── celsius
+	│           └── 0
+	│               └── 0x00000003 -> ../../../../../des/0x00000003
+	├── interconnnect
+	│   └── 0
+	│       └── hertz
+	│           └── 0
+	│               ├── 0x0000A008 -> ../../../../../des/0x0000A008
+	│               └── 0x0000A00B -> ../../../../../des/0x0000A00B
+	├── mem_cntrl
+	│   └── 0
+	│       ├── bps
+	│       │   └── 0
+	│       │       └── 0x0000A00A -> ../../../../../des/0x0000A00A
+	│       ├── celsius
+	│       │   └── 0
+	│       │       └── 0x0000A007 -> ../../../../../des/0x0000A007
+	│       └── joules
+	│           └── 0
+	│               └── 0x0000A002 -> ../../../../../des/0x0000A002
+	├── periph
+	│   ├── 0
+	│   │   └── messages
+	│   │       └── 0
+	│   │           └── 0x00000016 -> ../../../../../des/0x00000016
+	│   ├── 1
+	│   │  	└── messages
+	│   │       └── 0
+	│   │           └── 0x00000017 -> ../../../../../des/0x00000017
+	│   └── 2
+	│       └── messages
+	│           └── 0
+	│               └── 0x00000018 -> ../../../../../des/0x00000018
+	└── unspec
+	└── 0
+	├── celsius
+	│   └── 0
+	│       └── 0x0000A005 -> ../../../../../des/0x0000A005
+	├── counts
+	│   └── 0
+	│       └── 0x0000A00C -> ../../../../../des/0x0000A00C
+	├── joules
+	│   └── 0
+	│      	├── 0x0000A000 -> ../../../../../des/0x0000A000
+	│       └── 0x0000A001 -> ../../../../../des/0x0000A001
+	└── state
+	└── 0
+	└── 0x0000A010 -> ../../../../../des/0x0000A010
+
 Alternative Binary Interfaces - Special files
 =============================================
 
-- 
2.52.0


