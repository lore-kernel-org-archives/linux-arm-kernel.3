Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A4D7E9D800
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Apr 2026 15:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KOa7E9SeYVSgxJe3PSMUhTmJw4NHo51GkROlV7aC1Io=; b=acQEkdXMhzWCuCHfRTSZdHI9xV
	9bLQNeXq0EOvgQmUI83RB7dEugpg8TCZPr1rPx9Sz/Z7g/pyytk9ms6jMkF2JNX6ti1PAy0xlsQHq
	NfDCORjgFgYi5f4r6RGJtIYo7rb0QvZS6ZuPLUaAGrb8N/ms5Ub8i1DJC0I/E9V7YfZi59Uc4viU5
	6PdvM/zf8f3H1+HnCc2OtaMHgUq8JAJ+Et8vdjSbg7Wge1igexwLG4NoKM42LhucD2T05ooOQ7sDZ
	swVAVi6hoQOn9D9d+iAoy0NFtbVtjuYnbtQcyNwH/60fIg4RGdakVgli16lLGbgWnxEg/JfUj3DFO
	baSxsedw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9P0t-00000004Hk3-17RH;
	Sun, 05 Apr 2026 15:03:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9P0o-00000004Hdm-1rym
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Apr 2026 15:03:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE17226BE;
	Sun,  5 Apr 2026 08:03:35 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06AB53F62B;
	Sun,  5 Apr 2026 08:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775401421; bh=ijkyVnyLERREpgNHTRDtZrI00MQPfNRtZzcFtsjDc7Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=bV9UkAO1nGn619XIEF18DbOk5ynyJPJE1znnlwtjY/m2Q0in+PeacnULN4hh3sXJa
	 t68GmYhHN/Re2gYo/d9idkMnLdOwmgUjKT2E6rRvM53yLzyik3GQ7e4fBaHA8PXjb0
	 9FiHhTqDqbb35iKARJU8n87jM1N1uoADckS2+rf4=
From: Leo Yan <leo.yan@arm.com>
Date: Sun, 05 Apr 2026 16:02:49 +0100
Subject: [PATCH v10 13/20] coresight: Use helpers to fetch first and last
 nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-arm_coresight_path_power_management_improvement-v10-13-13e94754a8be@arm.com>
References: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
In-Reply-To: <20260405-arm_coresight_path_power_management_improvement-v10-0-13e94754a8be@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
 Will Deacon <will@kernel.org>, Yabin Cui <yabinc@google.com>, 
 Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Tamas Petz <tamas.petz@arm.com>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775401378; l=1735;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=ijkyVnyLERREpgNHTRDtZrI00MQPfNRtZzcFtsjDc7Y=;
 b=8Q6nM3cDtW+7Tr+h+jT1JnhNsu7Yz0215ynzAFPh1VaYDBCRDVL6QS+jOJ1Z0QdTYg06RHOGE
 iHBWOyOPFVxC5sbtx3uIM0rt8cNYUKfRyn7uA3TC4J9s+z32qUTdXaY
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_080342_654523_F5473923 
X-CRM114-Status: GOOD (  11.17  )
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

Replace open code with coresight_path_first_node() and
coresight_path_last_node() for fetching the nodes.

Check that the node is not NULL before accessing csdev field.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-core.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 752fe3b4b90fce34c4d245ff994a8afdb8ece463..3d2876d37c5bc371dd5a88640e080f6e52af5294 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -106,11 +106,16 @@ EXPORT_SYMBOL_GPL(coresight_get_percpu_sink);
 static struct coresight_device *coresight_get_source(struct coresight_path *path)
 {
 	struct coresight_device *csdev;
+	struct coresight_node *nd;
 
 	if (!path)
 		return NULL;
 
-	csdev = list_first_entry(&path->path_list, struct coresight_node, link)->csdev;
+	nd = coresight_path_first_node(path);
+	if (!nd)
+		return NULL;
+
+	csdev = nd->csdev;
 	if (!coresight_is_device_source(csdev))
 		return NULL;
 
@@ -644,11 +649,16 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode)
 struct coresight_device *coresight_get_sink(struct coresight_path *path)
 {
 	struct coresight_device *csdev;
+	struct coresight_node *nd;
 
 	if (!path)
 		return NULL;
 
-	csdev = list_last_entry(&path->path_list, struct coresight_node, link)->csdev;
+	nd = coresight_path_last_node(path);
+	if (!nd)
+		return NULL;
+
+	csdev = nd->csdev;
 	if (csdev->type != CORESIGHT_DEV_TYPE_SINK &&
 	    csdev->type != CORESIGHT_DEV_TYPE_LINKSINK)
 		return NULL;

-- 
2.34.1


