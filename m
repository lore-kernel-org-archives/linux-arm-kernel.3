Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD1CF3D605
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 16:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ae/6ojV0ZpZbHkU5E7QYh4FSNLLYuPkFrmLJzFH6Udg=; b=yx/RePqkAl/7IBVqePAsZX09rj
	PungOfWbCdupGkd/JA5drxzh+zlsgQapbZXSTpxhGYm6hmNXZ8rD3rfUKq5oeSSC7UuMCsus19Jqz
	zBvErGZYUN2EVrYuj+Foh5EZ1QhgoOFH/r2P3kDglfh5eTuyjGg2hmFF+voN/BY7W/WVNvYh7ZBxu
	Tem+Id/1D624iIJPYGu0Rx+hM+z+pjCHvgCK1wP0AitHsSgjxPDZGQZgt9HUFiA21nw7g9J53k1Fz
	lPuq3JuSxzu0e+zepaHNi4HIQj/AFcD/8PhT6NQCiGooMtVvL0HIJBXm0+ec4YkelQdmjuhT5u70s
	cL7/LvYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6t7Z-0000000A9FH-1JgS;
	Sun, 29 Mar 2026 16:36:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6t6e-0000000A8Vv-3Rof
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 16:35:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF8C04456;
	Sun, 29 Mar 2026 09:35:13 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6BEA3F915;
	Sun, 29 Mar 2026 09:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774802119; bh=12M2b0pR7TRv/e5VIWyWPoIDiWGPdvrhSnf79Npz2uA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NjFlSZ18d8dK0Geuov8DbbQftOmWIJwvdJ9O8hfg4VuMaX89zneDtq8zahmAHvsK0
	 XpUrhWJD3BMHtrYmEgAtr30Z3MwOLOUCIgeFwZO0K/OomaVWAzYJBnxob9hHC+IHIM
	 dVjIaimGc+J74eIZwuGfYELWCCCkxTRlt5NdrZog=
From: Cristian Marussi <cristian.marussi@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sudeep.holla@kernel.org,
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
	brauner@kernel.org,
	souvik.chakravarty@arm.com,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v3 20/24] fs/stlmfs: Document alternative topological view
Date: Sun, 29 Mar 2026 17:33:31 +0100
Message-ID: <20260329163337.637393-21-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329163337.637393-1-cristian.marussi@arm.com>
References: <20260329163337.637393-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_093521_072879_3CD676B0 
X-CRM114-Status: UNSURE (   7.88  )
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
v2 --> v3
 - completed FS tree description
 - renamed components to by_components
---
 Documentation/filesystems/stlmfs.rst | 72 ++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/filesystems/stlmfs.rst b/Documentation/filesystems/stlmfs.rst
index e4f07a4f930d..a775da24f320 100644
--- a/Documentation/filesystems/stlmfs.rst
+++ b/Documentation/filesystems/stlmfs.rst
@@ -113,6 +113,7 @@ the following directory structure::
 	|-- all_des_enable
 	|-- all_des_tstamp_enable
 	|-- available_update_intervals_ms
+	|-- components/
 	|-- control
 	|-- current_update_interval_ms
 	|-- de_implementation_version
@@ -203,6 +204,77 @@ values, as in::
 	|-- intervals_discrete
 	`-- tstamp_enable
 
+by_components/
+-----------
+
+An alternative topological view of the des/ directory based on the topology
+relationship information described in des/ ::
+
+	by_components/
+	├── cpu
+	│   ├── 0
+	│   │   ├── celsius
+	│   │   │   └── 0
+	│   │   │       └── 0x00000001[pe_0] -> ../../../../../des/0x00000001
+	│   │   └── cycles
+	│   │       ├── 0
+	│   │       │   └── 0x00001010[] -> ../../../../../des/0x00001010
+	│   │       └── 1
+	│   │           └── 0x00002020[] -> ../../../../../des/0x00002020
+	│   ├── 1
+	│   │   └── celsius
+	│   │       └── 0
+	│   │           └── 0x00000002[pe_1] -> ../../../../../des/0x00000002
+	│   └── 2
+	│       └── celsius
+	│           └── 0
+	│               └── 0x00000003[pe_2] -> ../../../../../des/0x00000003
+	├── interconnnect
+	│   └── 0
+	│       └── hertz
+	│           └── 0
+	│               ├── 0x0000A008[A008_de] -> ../../../../../des/0x0000A008
+	│               └── 0x0000A00B[] -> ../../../../../des/0x0000A00B
+	├── mem_cntrl
+	│   └── 0
+	│      	├── bps
+	│       │   └── 0
+	│       │       └── 0x0000A00A[] -> ../../../../../des/0x0000A00A
+	│       ├── celsius
+	│      	│   └── 0
+	│       │       └── 0x0000A007[DRAM_temp] -> ../../../../../des/0x0000A007
+	│       └── joules
+	│           └── 0
+	│               └── 0x0000A002[DRAM_energy] -> ../../../../../des/0x0000A002
+	├── periph
+	│   ├── 0
+	│   │  	└── messages
+	│   │       └── 0
+	│   │           └── 0x00000016[device_16] -> ../../../../../des/0x00000016
+	│   ├── 1
+	│   │   └── messages
+	│   │       └── 0
+	│   │           └── 0x00000017[device_17] -> ../../../../../des/0x00000017
+	│   └── 2
+	│       └── messages
+	│           └── 0
+	│               └── 0x00000018[device_18] -> ../../../../../des/0x00000018
+	└── unspec
+		└── 0
+		    ├── celsius
+		    │	└── 0
+		    │       └── 0x0000A005[] -> ../../../../../des/0x0000A005
+		    ├── counts
+		    │   └── 0
+		    │       └── 0x0000A00C[] -> ../../../../../des/0x0000A00C
+		    ├── joules
+		    │   └── 0
+		    │       ├── 0x0000A000[SOC_Energy] -> ../../../../../des/0x0000A000
+		    │       └── 0x0000A001[] -> ../../../../../des/0x0000A001
+		    └── state
+			└── 0
+			    └── 0x0000A010[] -> ../../../../../des/0x0000A010
+
 Alternative Binary Interfaces - Special files
 =============================================
 
-- 
2.53.0


