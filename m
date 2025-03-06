Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC61C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 07:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hpF4J4X222+6uhyL72FqlNBlM0dBnYI3P9HX9RhEtwI=; b=bzMemF81a6csyE6bMSJKlpCFYb
	UDbyqmz+Jl229sN5A/a2BTU19Ou3pySlza6RI37Dtj8sqQTq7Aa+yo3dNw+TdUxarhjDn6nrYdfLj
	4XX5eRvPVo5duf78mvwLgoGSvrbrkTsVImXjeA/FSTSKYtPOvKK+8oF3t9H0l+IlNDApbof7wAx+o
	svrdCZXYRcBxPEAcHJSzqXhAO2gDqwKIP0Tap/+qxEXECoTJVU5yXi/tSrpqG6ymiXzxebQnXl41F
	9IAAmH9L4+MD8HTGVo7xJwLyb7ou2FAmM/pquzRxlWNbCItLrUlsoJSO/m1xHVeAksEfvR7KDULAf
	KJ8ZBHnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq5NG-0000000AAzB-0DIm;
	Thu, 06 Mar 2025 07:10:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq5Ip-0000000AARM-3yFk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 07:05:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 86091A44A5A;
	Thu,  6 Mar 2025 07:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D93BCC4CEE5;
	Thu,  6 Mar 2025 07:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741244754;
	bh=j9Pdlj4VRjam+HMpMP+9l4d9Wirj4tRY7kQm1QzX/GA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=d4RUG5vUsosy2HxjD2BpjwunUe3VpgVi3MDnecVQ14O4qGQzpJ7xMjImjqp/O6YMR
	 1gunGmUoFe3+TK/CY6Rv6bAcdWdOVT/UNqyJzbHBkMni2ddBGdldK0hopnerpUGLrt
	 swb5vUrRFsOAMXb0xIDuH7TQSJrKX3bQsS/NTN3rM7Iz7zUKySbO93AVF37jM77iyL
	 fHNWiKuHnC2k2NqK+0J4EHwotOqvB94xF5Nx05b1zh+5N+KfAuZfArEMIwdn1Im5gj
	 A3ds4YM587Z9F6Zd5zYVUQbnx1mTDsMgGVhqHVDJPo6J4e5SU8X57ybg3qLSvndhsk
	 GH/YLiGtwN6Sg==
From: William Breathitt Gray <wbg@kernel.org>
Date: Thu, 06 Mar 2025 16:05:43 +0900
Subject: [PATCH 1/2] counter: Introduce the compare component
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250306-introduce-compare-component-v1-1-93993b3dca9c@kernel.org>
References: <20250306-introduce-compare-component-v1-0-93993b3dca9c@kernel.org>
In-Reply-To: <20250306-introduce-compare-component-v1-0-93993b3dca9c@kernel.org>
To: csokas.bence@prolan.hu, Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 William Breathitt Gray <wbg@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2443; i=wbg@kernel.org;
 h=from:subject:message-id; bh=j9Pdlj4VRjam+HMpMP+9l4d9Wirj4tRY7kQm1QzX/GA=;
 b=owGbwMvMwCW21SPs1D4hZW3G02pJDOknPQNeRzyULZCda8dpJf+O/5/XJ6MO+1v2gtO4BWd+f
 fnyl0ZzRykLgxgXg6yYIkuv+dm7Dy6pavx4MX8bzBxWJpAhDFycAjCRE7aMDOe85ra2Xl0imBW9
 7sXHxQkiTzQd/h3s3Sy26sfdXcq9l+cyMrz/fEpeuvqck3wS9+ZYh5buTYaJLgJyvkLnGh9quD9
 z5wQA
X-Developer-Key: i=wbg@kernel.org; a=openpgp;
 fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_230556_126231_C1B76820 
X-CRM114-Status: UNSURE (   9.52  )
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

Compare registers are used in devices to compare a counter channel
against a particular count value (e.g. to check if a threshold has been
reached). A macro COUNTER_COMP_COMPARE() is introduced to facilitate the
creation of compare components as Count extensions.

Signed-off-by: William Breathitt Gray <wbg@kernel.org>
---
 Documentation/ABI/testing/sysfs-bus-counter | 9 +++++++++
 include/linux/counter.h                     | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-counter b/Documentation/ABI/testing/sysfs-bus-counter
index 73ac84c0bca76e013f2534efc40c0f0e8d5fb023..3e8259e56d384225ec6e952b6d5d75208f185736 100644
--- a/Documentation/ABI/testing/sysfs-bus-counter
+++ b/Documentation/ABI/testing/sysfs-bus-counter
@@ -34,6 +34,14 @@ Contact:	linux-iio@vger.kernel.org
 Description:
 		Count data of Count Y represented as a string.
 
+What:		/sys/bus/counter/devices/counterX/countY/compare
+KernelVersion:	6.15
+Contact:	linux-iio@vger.kernel.org
+Description:
+		If the counter device supports compare registers -- registers
+		used to compare counter channels against a particular count --
+		the compare count for channel Y is provided by this attribute.
+
 What:		/sys/bus/counter/devices/counterX/countY/capture
 KernelVersion:	6.1
 Contact:	linux-iio@vger.kernel.org
@@ -301,6 +309,7 @@ Description:
 
 What:		/sys/bus/counter/devices/counterX/cascade_counts_enable_component_id
 What:		/sys/bus/counter/devices/counterX/external_input_phase_clock_select_component_id
+What:		/sys/bus/counter/devices/counterX/countY/compare_component_id
 What:		/sys/bus/counter/devices/counterX/countY/capture_component_id
 What:		/sys/bus/counter/devices/counterX/countY/ceiling_component_id
 What:		/sys/bus/counter/devices/counterX/countY/floor_component_id
diff --git a/include/linux/counter.h b/include/linux/counter.h
index 426b7d58a438d59e5178bc5e76bac82e99737323..f208e867dd0f6995f58cf6a41c67538dad6428d0 100644
--- a/include/linux/counter.h
+++ b/include/linux/counter.h
@@ -580,6 +580,9 @@ struct counter_array {
 #define COUNTER_COMP_CEILING(_read, _write) \
 	COUNTER_COMP_COUNT_U64("ceiling", _read, _write)
 
+#define COUNTER_COMP_COMPARE(_read, _write) \
+	COUNTER_COMP_COUNT_U64("compare", _read, _write)
+
 #define COUNTER_COMP_COUNT_MODE(_read, _write, _available) \
 { \
 	.type = COUNTER_COMP_COUNT_MODE, \

-- 
2.48.1


