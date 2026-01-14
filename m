Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5708D29FEA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 11:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e57ia0pPBvfOSRYVv1cQPSzKWhy8gR2AkhQxVzEQ8zM=; b=VP6EsD9B6YWIeIckAnE/XaVaon
	Kb4dbrldOAYXZd+0aQRUmyectnpWh0v7glLgzyNNUyfmDot0Yem7v9wr75HEirGeEuF0oAdpY+65S
	pwovF61N67hi2LywkxIXv6ovohSdY0zyCoSxW8P9wZyQr4Sn0j8fawIe3ejQ8vzr8jWM/2C/aNK9v
	G48aHghIZwdc420jmz8Wx/hikQLDE/l/gCOiQtiFyigvnfBippcY1ckvBKET3pDWdtqSesweNBztE
	yfej/YhxjWBrF6jf5EuO+0ju/YpgL9Gu4OKNz6YqQeks51t570O1abxJWpQJR6G+sno+Nke3PF4T9
	U8fHk/Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzMg-000000091K6-3po2;
	Wed, 14 Jan 2026 11:48:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfzMN-000000090la-2qwE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 11:48:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E603497;
	Wed, 14 Jan 2026 03:48:16 -0800 (PST)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 440073F59E;
	Wed, 14 Jan 2026 03:48:19 -0800 (PST)
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
Subject: [PATCH v2 16/17] fs/stlmfs: Document lazy mode and related mount option
Date: Wed, 14 Jan 2026 11:46:20 +0000
Message-ID: <20260114114638.2290765-17-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114114638.2290765-1-cristian.marussi@arm.com>
References: <20260114114638.2290765-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_034823_828530_BAC218C0 
X-CRM114-Status: GOOD (  10.25  )
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

Document optional lazy enumeration behaviour and related mount option.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 Documentation/filesystems/stlmfs.rst | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/stlmfs.rst b/Documentation/filesystems/stlmfs.rst
index cc9585f77ba5..79633cdc71b8 100644
--- a/Documentation/filesystems/stlmfs.rst
+++ b/Documentation/filesystems/stlmfs.rst
@@ -73,8 +73,12 @@ Design
 STLMFS is a pseudo filesystem used to expose ARM SCMI Telemetry data
 discovered dynamically at run-time via SCMI.
 
-Inodes are all dynamically created at mount-time from a dedicated
-kmem_cache based on the gathered available SCMI Telemetry information.
+Normally all of the top level file/inodes are dynamically created at
+mount-time from a dedicated kmem_cache based on the gathered available
+SCMI Telemetry information, but it is possible to enable a lazy enumeration
+and FS population mode that delays SCMI Telemetry resources enumerations
+and related FS population till the moment a user steps into the related FS
+subdirectories: *des/* *groups/* and *components/*.
 
 Since inodes represent the discovered Telemetry entities, which in turn are
 statically defined at the platform level and immutable throughout the same
@@ -104,6 +108,19 @@ The filesystem can be typically mounted with::
 
 	mount -t stlmfs none /sys/fs/arm_telemetry
 
+It is possible to mount it in lazy-mode by using the *lazy* mount option::
+
+	mount -t stlmfs -o lazy none /sys/fs/arm_telemetry
+
+In this latter case, the des/ groups/ and components/ directory will be
+created empty at mount-time and only filled later when 'walked in'.
+
+This allows a user to benefit from a lazy enumeration scheme of the SCMI
+Telemetry resources by delaying such, usually expensive, message exchanges
+to the last possible moment: ideally, even never, if using some of the
+other alternative binary interfaces that does not need any resource
+enumeration at all.
+
 It will proceed to create a top subdirectory for each of the discovered
 SCMI Telemetry instances named as 'tlm_<N>' under which it will create
 the following directory structure::
-- 
2.52.0


