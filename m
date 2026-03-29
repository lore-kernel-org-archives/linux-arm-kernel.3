Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78493F3D60A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 16:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n6Jy0z9Hlj83MEa+ob1ITL+Z5WU2Dt4nB4H5STAlWTk=; b=l+ulG113Vrb1e52zZ/sfCw/2WQ
	/kgK/KJvbCcKNSks/c7Q0vz2ZQMGIjD+vbzbzcF6FlTbvtY9pB20kZYBI5A47rgKdyuDWDy1p0eCB
	ARG317EZKURwfw9KShbJAMyzGz/FLp0T5S7Exj2+6ZG8Z1ZyBUUcAbtuRxOUQcXM8gG/8MewIpKyz
	dxdY3g2LkMM8//OpFDAmr9mduFXQNSOdGCY8snapNWH4s3wYFNy2Hfj/uKvIzO3/2g07ckznxc0A3
	w4K8vz40cen6A4lrnREmO1/w1eTQEc97DK72x1j0iVW+8KQZhrj9H4FSVcuKoRplT5EBITVkotkUn
	lzK3jmeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6t7Y-0000000A9Eg-2SYP;
	Sun, 29 Mar 2026 16:36:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6t6X-0000000A8RU-3y4q
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 16:35:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 460A13627;
	Sun, 29 Mar 2026 09:35:07 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D30A3F915;
	Sun, 29 Mar 2026 09:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774802113; bh=j6MY54MyYB+zVmZUg1iZ0WGTmNxZOXrl4lkzOarnPxo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dgnw3vzbfQpD7QezXT0FmAppsILu5yCoTVTJCMDruHhzoKKn1BX3fqmhKIydh8x6R
	 9OB2UeTXGbyqU1ezFIxSduYJsn5FKwnH8h2tQulBccJAHOFLT7RQXkNvlHyDImRvgH
	 oIvPu0SG1hOL/JMx/U8Msi5eADdO0E9YwYvUFnnI=
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
Subject: [PATCH v3 18/24] fs/stlmfs: Document alternative ioctl based binary interface
Date: Sun, 29 Mar 2026 17:33:29 +0100
Message-ID: <20260329163337.637393-19-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260329163337.637393-1-cristian.marussi@arm.com>
References: <20260329163337.637393-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_093514_038027_17A6C654 
X-CRM114-Status: GOOD (  11.43  )
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

Document the additionally provided special files and their usage in the
context of the alternative binary ioctl-based interface.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
 Documentation/filesystems/stlmfs.rst | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/filesystems/stlmfs.rst b/Documentation/filesystems/stlmfs.rst
index 2b49beb5b960..e4f07a4f930d 100644
--- a/Documentation/filesystems/stlmfs.rst
+++ b/Documentation/filesystems/stlmfs.rst
@@ -113,6 +113,7 @@ the following directory structure::
 	|-- all_des_enable
 	|-- all_des_tstamp_enable
 	|-- available_update_intervals_ms
+	|-- control
 	|-- current_update_interval_ms
 	|-- de_implementation_version
 	|-- des/
@@ -130,6 +131,10 @@ the following directory structure::
 	|-- tlm_enable
 	`-- version
 
+.. Note::
+	The control/ special file can be used to use the alternative
+	binary interface described in include/uapi/linux/scmi.h
+
 Each subdirectory is defined as follows.
 
 des/
@@ -190,6 +195,7 @@ values, as in::
 	scmi_tlm_0/groups/0/
 	|-- available_update_intervals_ms
 	|-- composing_des
+	|-- control
 	|-- current_update_interval_ms
 	|-- des_bulk_read
 	|-- des_single_sample_read
@@ -197,3 +203,21 @@ values, as in::
 	|-- intervals_discrete
 	`-- tstamp_enable
 
+Alternative Binary Interfaces - Special files
+=============================================
+
+Special files are populated across the filesystem so as to implement the support
+of more performant alternative binary interfaces that can be used instead of the
+main human readable ABI.
+
+IOCTLs Interface
+----------------
+
+The ioctl-based interface is detailed in::
+
+	include/uapi/linux/scmi.h
+
+The filesystem provides special files named *control/* to be used with the
+ioctl interface mentioned above: note that the behaviour of some of the ioctls
+is dependent on which *control/* file is used to invoke them (as detailed in the
+UAPI header above).
-- 
2.53.0


