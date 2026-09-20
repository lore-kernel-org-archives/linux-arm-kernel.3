Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5260C982EC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 09:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uKKVEfzej5t7VHzsctsTEaWiZarfFaC8uEMC+XmC0ug=; b=gxB0wJnMwbLBTCyOrA6UYkdqLE
	cYwn2/bPG6kDr6n+P02uqdnU1B48jV/i9oETUE8z0NcS3xj12ZjCGo0Da8yeGlgcqNFLKjfuT/S10
	cS/3q56TStxWFyBYZieelzZiJTpBABQ1v8TqW2WP3j+mcKGEaE23k+ivmHlWU2+U5Tsh8BQoP6UHD
	aAcGgUpVqVfKDiF0L90fshh+/2ZH5gtXVdf1b4rd/9frbjR2VFA2y76dnRUcSjW6t2OfeTt+kkeqA
	1U7jcNStL2LmLMl5yPuaoxVv6cyak8OUAXtv+qPIZSZbLDcUsc8XkkfqznG7T5YzyAf4nbkNVi+vj
	8zMpgoog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Djo-0000000HA4O-3cPD;
	Sun, 20 Sep 2026 09:21:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Djj-0000000H9yx-1egq
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 20 Sep 2026 09:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uKKVEfzej5t7VHzsctsTEaWiZarfFaC8uEMC+XmC0ug=; b=b3BGLKbaJIu3F0B4/OBbiGgOj+
	iWdxMwr4vczfdwlhOlU4EHUG26MiLJUCpYkBVSFVwTvdwkNPSwUOgDW8b4VFOGc/x2mR8zGCcLcsN
	0xBIMWXnSMoEUTjqqu7GEtWYvm8TRsrF/lLxOXEWu7/LkGPsJtNI+nUbaGAtukfDiSQy6nURfgV4Y
	waYfBbFpuyZPOz1ZHaXDznbp6A+XrpGRUgy6TGZjdFu6aQ4MfsvEzVcRaIOoqGDGAdtO4egiWCcNK
	y1n20Kvu1DNQ6MKWyh4uwd0VnmBjo/7+Yeq2nYSwIcDBizEPLBoMlopzjhUQ+AgiwWlDAB/zmdLGL
	P5IMRqNA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8Djg-0000000BHy9-0p0I
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 09:21:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 695881650;
	Sun, 20 Sep 2026 02:21:19 -0700 (PDT)
Received: from pluto.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 087FE3F59E;
	Sun, 20 Sep 2026 02:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789896082; bh=w7L8DbnoCEuyvO8JUAes+aM9b0PjMj4j60HnlNcmEQg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Edb9sFg1euS2DnDbeahHVBjeguj1hf22L0sqgheDLp/UvgSAvzTh4ETmwIX2srYrR
	 B+Ymw+J4YXNokzIvfQGscclTX8O5b2rmt2kKmr5UTLUlsnsIjcJYWIaVeQqzKseCzr
	 bTljuYb0f+IuhhQfNoEC0qVpkR45zWBxVhldpmKQ=
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
	Cristian Marussi <cristian.marussi@arm.com>
Subject: [PATCH v12 17/25] firmware: arm_scmi: Add Telemetry debugfs ABI documentation
Date: Sun, 20 Sep 2026 10:19:20 +0100
Message-ID: <20260920091928.2014972-18-cristian.marussi@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260920091928.2014972-1-cristian.marussi@arm.com>
References: <20260920091928.2014972-1-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_102124_624517_6AAFD7A7 
X-CRM114-Status: UNSURE (   9.99  )
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


