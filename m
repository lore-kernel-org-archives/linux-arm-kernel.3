Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918AFCA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 08:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uKKVEfzej5t7VHzsctsTEaWiZarfFaC8uEMC+XmC0ug=; b=Ct4783wlHFi09DRuj5FZxrwr6l
	gX7AaHuQP5O6V2ZQAvu88RK2LH/78a6efChiha2YGVphovf3B0+CRjNXOzbo9Y7560bE7BtrqwdiI
	dO7oxk05eTXM/b+6+PtVBSaUMbHjHuO3XR+4WRYLBpSW94c67CXhUDMkCqihx2ANXoP3RvQXn60FF
	nsIQf2aAovDVqTkYZ6W8AYT8lKQ7wU3bYbinCtB2fGKfAl3fVSX/yejr+bgousBnvh1G5OtI1RNnG
	gQMRD/aYWPDGGbit1iw0hpNEHJ/h+/ddNA3BK4ZinWZEa4LgtlqwCo/sGaEgj85nD6CTFkrjXwlv5
	AfCnYKKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDHBi-0000000EWEU-2l1n;
	Sun, 04 Oct 2026 08:03:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDHBe-0000000EW7a-42RQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 08:03:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 142291691;
	Sun,  4 Oct 2026 01:03:07 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EDFC73F763;
	Sun,  4 Oct 2026 01:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791100990; bh=w7L8DbnoCEuyvO8JUAes+aM9b0PjMj4j60HnlNcmEQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mJtTWW74I0ZCqmZII5w3+5oB6CmwWHsAtB40mKIgF0PuaGgcenyHSUCmXP4BlcDMT
	 FbrkdXwXTg1ktujFh4jKAn+TgfFNsBLRn0NJ73BBevBFr5eH7i+KUj5fTkjc15kSt1
	 59iY6ZYUWR6bAqWawbiR0O6IL7bQUwS/IxTL41bw=
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
	jonathan.cameron@oss.qualcomm.com,
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
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v13 17/25] firmware: arm_scmi: Add Telemetry debugfs ABI documentation
Date: Sun,  4 Oct 2026 09:00:58 +0100
Message-ID: <20261004080106.3355393-18-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261004080106.3355393-1-cristian.marussi@arm.com>
References: <20261004080106.3355393-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_010311_504164_6D0E1559 
X-CRM114-Status: UNSURE (   9.69  )
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

Add description of the debugfs SCMI Telemetry protocol ABI.

Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
---
v5 --> v6
 - fixed typos
---
 Documentation/ABI/testing/debugfs-scmi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/ABI/testing/debugfs-scmi b/Documentation/ABI/testing/debugfs-scmi
index ee7179ab2edf..edbbe360321d 100644
--- a/Documentation/ABI/testing/debugfs-scmi
+++ b/Documentation/ABI/testing/debugfs-scmi
@@ -68,3 +68,25 @@ Description:	Max number of concurrently allowed in-flight SCMI messages for
 		the currently configured SCMI transport for instance <n> on the
 		RX channels.
 Users:		Debugging, any userspace test suite
+
+What:		/sys/kernel/debug/scmi/<n>/protocols/0x<m>/
+Date:		Nov 2026
+KernelVersion:	7.3
+Contact:	cristian.marussi@arm.com
+Description:	A subdirectory grouping debug entries related to protocol <m>
+		for instance <n>. Each protocol owns and defines the subtree
+		of entries rooted under this directory.
+Users:		Debugging, any userspace test suite
+
+What:		/sys/kernel/debug/scmi/<n>/protocols/0x1B/shmtis/<m>
+Date:		Nov 2026
+KernelVersion:	7.3
+Contact:	cristian.marussi@arm.com
+Description:	A set of RO files exposed by the Telemetry protocol (0x1B) in
+		order to dump the latest snapshot of each SHMTI memory area in
+		binary format: each file is named by its SHMTI id.
+		File is seekable and a seek to position zero on an open file
+		causes the SHMTI snapshot to be refreshed; file timestamps are
+		updated after each snapshot.
+		This directory reports SHMTIs for instance <n>.
+Users:		Debugging, any userspace test suite
-- 
2.54.0


