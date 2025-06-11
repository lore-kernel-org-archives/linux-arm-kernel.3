Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4938FC71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 18:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xSoyM+Qft+Axu5F/DqsGx7jqLIfYKdW7zNBwNCoIpV8=; b=iQrFVquEQv4jG3oLLg7QTJHx44
	40hlZHVdGwP6iWfr/+mrQqEwiKn8ZRrSG0kl8PDnqBi0yiWCFZeATo+E+hueuk+SKdVYdnPftjPtk
	1A4H9jdtsB6Q3Wrrm9Z7G3iW37ImgodxLraYbHKO+AXq7VadjKaPwHHlMfGiptqlkTR4g3iUqZa/6
	MtlBq0VkIIja9qajmL+Dgi3Tn2AO+O5bBvPdICd0dBV7W56Zj2OzS+Ww2/rahSnv3qrYf7u3YHeQk
	76UooeHdIN/u3y1lTDsyj3M0b/I6o4giZJNCbX8/Dxb2lHlCHo4c1fwbdAWoFmRBDhCYplw/V0kPA
	zGVCGdgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPlC-0000000AoQn-2azj;
	Wed, 11 Jun 2025 18:01:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMgb-0000000A90M-3ooO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 14:44:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AEAC1BCB;
	Wed, 11 Jun 2025 07:43:56 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06CEA3F673;
	Wed, 11 Jun 2025 07:44:14 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 11 Jun 2025 15:44:02 +0100
Subject: [PATCH 2/2] coresight: perf: Use %px for printing pointers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-arm_cs_fix_smatch_warning_v1-v1-2-02a66c69b604@arm.com>
References: <20250611-arm_cs_fix_smatch_warning_v1-v1-0-02a66c69b604@arm.com>
In-Reply-To: <20250611-arm_cs_fix_smatch_warning_v1-v1-0-02a66c69b604@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749653052; l=1814;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=lBPZLbGtBkHipgMzxKfuDSBdSy/HkuRI3t0nGEZtL5Q=;
 b=kDyVNunk9H5Bpg1oEr68xrUwEGo+r70zZE4CGGLrlxGkx6ncz6V6ALciMGDX7tSLQZ9ZQtJkq
 0IIUlsWtc10DfXpqV8/Pk5pz6kunLYRbJ79lTn12uetceF+5C33Ktth
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_074417_996305_82F17134 
X-CRM114-Status: UNSURE (   9.89  )
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

Use "%px" to print a pointer, which is better than casting the pointer
to unsigned long and printing it with the "%lx" specifier.

Note, the printing format will be updated as 64-bit value:

  # cat /sys/devices/cs_etm/sinks/trbe0
  0x000000003744496a

This commit dismisses the following smatch warnings:

  coresight-etm-perf.c:854 etm_perf_sink_name_show() warn: argument 4 to %lx specifier is cast from pointer
  coresight-etm-perf.c:946 etm_perf_cscfg_event_show() warn: argument 4 to %lx specifier is cast from pointer

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index f1551c08ecb20ebd7feab82dbaee3176e6bcc999..f677c08233ba1a28b277674662c6e6db904873dd 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -851,7 +851,7 @@ static ssize_t etm_perf_sink_name_show(struct device *dev,
 	struct dev_ext_attribute *ea;
 
 	ea = container_of(dattr, struct dev_ext_attribute, attr);
-	return scnprintf(buf, PAGE_SIZE, "0x%lx\n", (unsigned long)(ea->var));
+	return scnprintf(buf, PAGE_SIZE, "0x%px\n", ea->var);
 }
 
 static struct dev_ext_attribute *
@@ -943,7 +943,7 @@ static ssize_t etm_perf_cscfg_event_show(struct device *dev,
 	struct dev_ext_attribute *ea;
 
 	ea = container_of(dattr, struct dev_ext_attribute, attr);
-	return scnprintf(buf, PAGE_SIZE, "configid=0x%lx\n", (unsigned long)(ea->var));
+	return scnprintf(buf, PAGE_SIZE, "configid=0x%px\n", ea->var);
 }
 
 int etm_perf_add_symlink_cscfg(struct device *dev, struct cscfg_config_desc *config_desc)

-- 
2.34.1


