Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA53C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 14:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PmURNj4AromvGqUUkaf231R+Nsz2g5wNqedims7By/Q=; b=S7mHrBAAfsIeg5GZ4RYRLtcnPv
	j0cpa3Wt7qNrHCrWer+YYftn2ZKp1JB9GcyGU9kwfTxiMA6Itl6Kd1cW6Nx5ZQI2nO6ziW7p2d4Vd
	fe7oFyDvML4VR1q5vzZF8nI1CJmECE6i6uFSZyB3QDiHPtwd99IIAsZ0IKthP0Yzz564j7ktooT+h
	w5ZFuK0UsuCAAwH5TJvt/+lV3w87uI2OOltlFCnwwVCYmBNdQ2fOI9aVCFVkOGQmT72jJX/aY0qwF
	SyZM80t6KVRUAGDK8PnheC6nXRa7BYAjOroCwAFu77rnKN703o4hg8YbDnZgZyMA/zk10N99XG94O
	cQk+1tiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txoYj-0000000BG8W-108w;
	Thu, 27 Mar 2025 14:50:17 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txoQc-0000000BEll-41HR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 14:41:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1743086515; x=1774622515;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PmURNj4AromvGqUUkaf231R+Nsz2g5wNqedims7By/Q=;
  b=pPLTmwijqlGXJ6B7IzRbHSbK1/0pAc+u9XgOTAbkOnglbX8Euaqo1301
   DHO3URDYjN+D4KceYrDcCDgR5hEake8GLwY8VthAXcDfepmMDOAgLOC6f
   heScJ38XMeP05dLb92HevSnIXGVHKCrdohyVjJDYYr4mwjeiZW0AMjnIr
   3pkO7Vch4aCc8eYueKuU5YfijZqpHypiqzig4ZTY5JZihMb1bXVC7eZVv
   NtwankgVMN+LSP263SH8Rmvu8zCxFJ3gn+LLNqFFICtQ0zoFXZHou82lY
   LExW+VTbEScoQYf3HhrJc6Ybw1o+Ey5NiZAFYoXxykXD+YAUPf5j9d27c
   Q==;
X-CSE-ConnectionGUID: 7SeO/uEpTdWuMLr8Ge5c1Q==
X-CSE-MsgGUID: U1u2AatXQSixSP4Wx5QPvQ==
X-IronPort-AV: E=Sophos;i="6.14,280,1736809200"; 
   d="scan'208";a="43199514"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 27 Mar 2025 15:41:54 +0100
X-CheckPoint: {67E563B1-2D-B1D34AC3-DEA5B19F}
X-MAIL-CPID: 47167665E6C1DFE25C5FAE0BD2BD087A_4
X-Control-Analysis: str=0001.0A006370.67E563B9.007B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 98B7E16C181;
	Thu, 27 Mar 2025 15:41:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1743086509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PmURNj4AromvGqUUkaf231R+Nsz2g5wNqedims7By/Q=;
	b=kLIafZZ3P9GWucNB+Ymky+WT3scBySFXuu5ob3aRKLLT+STtY8xgQJm80C1Ot/J6CHbetI
	rAW0ZF6f2bTfwaAqusie45QyUEHvJRym/xO6YkZo5e7JuB5tBR0IX3AbIV/rdByRxv+bO8
	WT2TEziigg/fPo5qsD+ZLzIoEzFYQjdI8BhfgJzf0pydp8LYVx0ufFOcl9kg9xvirmcujE
	GtBsxQasttP/u9uvzYficYEHDaOXWzA39YsQYaFf8R4lO87fkMtrlnzU0GQMUJPUqH3hLp
	RcHyuRr1EUPZxqmqx52be2UyhcypXHFVOe8brbTvMKETTP0wKcefZb2T2HN2KA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] ARM: dts: ls1021a-tqmals1021a: Add HDMI overlay
Date: Thu, 27 Mar 2025 15:41:09 +0100
Message-ID: <20250327144118.504260-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
References: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_074155_289211_1D07DC88 
X-CRM114-Status: GOOD (  14.05  )
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

This add an overlay for using the RGB-to-HDMI bridge.
Note: As DDC is directly connected to general I2C bus, there might be I2C
address conflicts. Hence not all displays might work.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/ls/Makefile             |  3 ++
 .../ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso | 32 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso

diff --git a/arch/arm/boot/dts/nxp/ls/Makefile b/arch/arm/boot/dts/nxp/ls/Makefile
index 14759331dba24..225a7665b8ad1 100644
--- a/arch/arm/boot/dts/nxp/ls/Makefile
+++ b/arch/arm/boot/dts/nxp/ls/Makefile
@@ -6,3 +6,6 @@ dtb-$(CONFIG_SOC_LS1021A) += \
 	ls1021a-tqmls1021a-mbls1021a.dtb \
 	ls1021a-tsn.dtb \
 	ls1021a-twr.dtb
+
+ls1021a-tqmls1021a-mbls1021a-hdmi-dtbs += ls1021a-tqmls1021a-mbls1021a.dtb ls1021a-tqmls1021a-mbls1021a-hdmi.dtbo
+dtb-$(CONFIG_SOC_LS1021A) += ls1021a-tqmls1021a-mbls1021a-hdmi.dtb
diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso
new file mode 100644
index 0000000000000..e713a2ecbfc25
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
+/*
+ * Copyright 2013-2014 Freescale Semiconductor, Inc.
+ * Copyright 2018-2025 TQ-Systems GmbH <linux@ew.tq-group.com>,
+ * D-82229 Seefeld, Germany.
+ * Author: Alexander Stein
+ */
+
+/dts-v1/;
+/plugin/;
+
+&dcu {
+	status = "okay";
+
+	port {
+		dcu_out: endpoint {
+			remote-endpoint = <&sii9022a_in>;
+		};
+	};
+};
+
+&hdmi_out {
+	status = "okay";
+};
+
+&sii9022a {
+	status = "okay";
+};
+
+&sii9022a_in {
+	remote-endpoint = <&dcu_out>;
+};
-- 
2.43.0


