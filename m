Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250AFC5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 04:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vi6pmQRSoSSoYX6fDs7+Q3vw4/qRlgra1PI6yFSmRvI=; b=r71w7OXikUicjMIy6Oa7avYXWk
	nMyVcdNusr+mwJse9lPGJoEk665YdDv+NPbYm+OxPKSRdQukF/nKdr/Ixc+7zc2eMQcZ/lU0y4+yS
	iljQomuNFtk+lmdmOLw7kiTEzO8mIuG0luxYm4RAmCJbfeBD+rqRfJAY0i+TdEBDChTdpHsrmQkwj
	IMNwdJDcjgTPIy3zeYzJG//1E2jFxB/8O+PlXJDgCQ3NmNP0GT1lHrp/3WSxu0tnlCfAkG4aLJoAr
	Ko/r1Zo9ArwcY+QN/E9ulcVuRFqVqNe/3WYis4b8N3EGTuOcPn1Y9P/R9PbDFGHcNF8g4qZI5pmK5
	Rotlsspw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuNAN-0000000HMoy-3UFB;
	Thu, 13 Aug 2026 04:35:43 +0000
Received: from mail-pg1-x547.google.com ([2607:f8b0:4864:20::547])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuNAL-0000000HMmm-24Qb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 04:35:42 +0000
Received: by mail-pg1-x547.google.com with SMTP id 41be03b00d2f7-cbee5bab340so1978341a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 21:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786595740; x=1787200540; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vi6pmQRSoSSoYX6fDs7+Q3vw4/qRlgra1PI6yFSmRvI=;
        b=vHe+PubDAaPpkQHvSLlUnZYrsl8iAgvGgZKNUf4a0YutoOHLTzzlg6FR+AiRv4Gpzu
         ACl/v4qP/KKZRSzFdhQtZBWMIaBOqZQnBdyPcFJNL20fTO7052p+YBm9iu5H8QrYBR+C
         DbL0vXu/TNSliJNnzgTsgTTr3WCnjfoJSZZBZ1BgKTE2qD2d7zQaZjeTbZhS7gYtP0Ri
         QgehhWXgMec0pI2SLMGVPSBqTAdVwVIZV5a6SAupvvtjr1Quuik+Q4Ieuq8tijeMeO4P
         1gln263XX1YiVsVBhFu9JL7LlIPeq7vj0rdiTd2+J3nAUuz0scg0LotTNpwL1xMqUGY1
         Q4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786595740; x=1787200540;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vi6pmQRSoSSoYX6fDs7+Q3vw4/qRlgra1PI6yFSmRvI=;
        b=XvH49LrqKBUf02BWGc3Lwnp1xNxRqfK950le3orordt5EeTUB4a6eZ0DLG2kGkJU75
         FjzeAMWkUIJJlO5vsFkdNZFEYvUXxBry2qDfMxW7jbL/ETFBpknYh21vumUzvSxxQ7iX
         0yXfiOnArORUAg6izgi78hCkDvivFC4wRSdINQs8aM5JehVLSr4Dr2lDj/tWBxm6d2Kc
         RdHI5nyabebTB3oIST1HHOLuesyU2XHHRmoNOBQTgLep0toNgMxbkQzUjK+VimDHcIUu
         MSnqo1Hz8eqy/fza1nyQdlSDpWzvTbK6Zl0kLiTzP/a77BbnBnmd9lW3FRl++to7O5Jy
         BPfQ==
X-Gm-Message-State: AOJu0YxwFNHYDDPBe/VMtF3TVJ5eJKX3gfaI5/6jEm2+wiwPi3tC4rQ8
	1/wTEDFv+CnC4OywmGqD2I42S6CD/UmojOH3PebO37Abapeubn1vhzWJtDsPV66iXCEytOPY2mP
	dqqwkkHQmeg==
X-Received: from dlbsi12.prod.google.com ([2002:a05:7022:b88c:b0:13f:9a34:1f84])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6300:408a:b0:3a0:bc61:62e6
 with SMTP id adf61e73a8af0-3cc55062a03mr4398242637.8.1786595740299; Wed, 12
 Aug 2026 21:35:40 -0700 (PDT)
Date: Wed, 12 Aug 2026 21:35:33 -0700
In-Reply-To: <20260813043533.2744442-1-irogers@google.com>
Mime-Version: 1.0
References: <20260812230145.2644281-1-irogers@google.com> <20260813043533.2744442-1-irogers@google.com>
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <20260813043533.2744442-3-irogers@google.com>
Subject: [PATCH v6 2/2] perf: Add Raspberry Pi 5 (BCM2712) AXI PMU support
From: Ian Rogers <irogers@google.com>
To: irogers@google.com, linux-perf-users@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mark.rutland@arm.com, u.kleine-koenig@baylibre.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_213541_548124_8D7F2E79 
X-CRM114-Status: GOOD (  18.41  )
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

Expand the Raspberry Pi AXI PMU driver to support Broadcom BCM2712
(Raspberry Pi 5) system monitors, PCIe RP1 Southbridge links, HEVC decoder,
and Cortex-A76 DSU L3 interconnects.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 drivers/perf/rpi_axi_pmu.c | 120 +++++++++++++++++++++++++++++++++++--
 1 file changed, 115 insertions(+), 5 deletions(-)

diff --git a/drivers/perf/rpi_axi_pmu.c b/drivers/perf/rpi_axi_pmu.c
index f7e5520d02eb..4c1b19c6cc2e 100644
--- a/drivers/perf/rpi_axi_pmu.c
+++ b/drivers/perf/rpi_axi_pmu.c
@@ -867,19 +867,45 @@ PMU_EVENT_ATTR_STRING(usb_system_l2_wtrans, rpi_axi_pmu_event_usb_system_l2_wtra
 /* --- RASPBERRY PI 5 (BCM2712) EXPANDED EVENT ALIASES ---------------------- */
 
 /* PCIe 2.0 x4 RP1 Southbridge Link Bus Events & Stall Wait Cycles (bus=6, BCM2712_SB__PCIE_RP1) */
+PMU_EVENT_ATTR_STRING(pcie_rp1_atrans,        rpi_axi_pmu_event_pcie_rp1_atrans,        "monitor=0,bus=6,counter=0");
+PMU_EVENT_ATTR_STRING(pcie_rp1_atwait,        rpi_axi_pmu_event_pcie_rp1_atwait,        "monitor=0,bus=6,counter=1");
+PMU_EVENT_ATTR_STRING(pcie_rp1_wtrans,        rpi_axi_pmu_event_pcie_rp1_wtrans,        "monitor=0,bus=6,counter=2");
+PMU_EVENT_ATTR_STRING(pcie_rp1_wtwait,        rpi_axi_pmu_event_pcie_rp1_wtwait,        "monitor=0,bus=6,counter=3");
+PMU_EVENT_ATTR_STRING(pcie_rp1_rtrans,        rpi_axi_pmu_event_pcie_rp1_rtrans,        "monitor=0,bus=6,counter=4");
+PMU_EVENT_ATTR_STRING(pcie_rp1_rtwait,        rpi_axi_pmu_event_pcie_rp1_rtwait,        "monitor=0,bus=6,counter=5");
 
 /* HEVC (H.265) Hardware Video Decoder Bus Events (bus=7, BCM2712_SB__HEVC_DEC) */
+PMU_EVENT_ATTR_STRING(hevc_dec_atrans,        rpi_axi_pmu_event_hevc_dec_atrans,        "monitor=0,bus=7,counter=0");
+PMU_EVENT_ATTR_STRING(hevc_dec_wtrans,        rpi_axi_pmu_event_hevc_dec_wtrans,        "monitor=0,bus=7,counter=2");
+PMU_EVENT_ATTR_STRING(hevc_dec_rtrans,        rpi_axi_pmu_event_hevc_dec_rtrans,        "monitor=0,bus=7,counter=4");
 
 /* Arm Cortex-A76 DSU L3 Interconnect Bus Events (bus=8, BCM2712_SB__A76_DSU_L3) */
+PMU_EVENT_ATTR_STRING(a76_dsu_l3_atrans,      rpi_axi_pmu_event_a76_dsu_l3_atrans,      "monitor=0,bus=8,counter=0");
+PMU_EVENT_ATTR_STRING(a76_dsu_l3_wtrans,      rpi_axi_pmu_event_a76_dsu_l3_wtrans,      "monitor=0,bus=8,counter=2");
+PMU_EVENT_ATTR_STRING(a76_dsu_l3_rtrans,      rpi_axi_pmu_event_a76_dsu_l3_rtrans,      "monitor=0,bus=8,counter=4");
 
 /* VideoCore VII 3D Graphics Pipeline Bus Events (bus=10, BCM2712_SB__V3D7) */
+PMU_EVENT_ATTR_STRING(v3d7_atrans,            rpi_axi_pmu_event_v3d7_atrans,            "monitor=0,bus=10,counter=0");
+PMU_EVENT_ATTR_STRING(v3d7_wtrans,            rpi_axi_pmu_event_v3d7_wtrans,            "monitor=0,bus=10,counter=2");
+PMU_EVENT_ATTR_STRING(v3d7_rtrans,            rpi_axi_pmu_event_v3d7_rtrans,            "monitor=0,bus=10,counter=4");
 
 /*
  * Quad-Core Arm Cortex-A76 Cores 0-3 I-Cache & D-Cache Filtered Events
  * (bus=14, BCM2712_SB__CPU_L2)
  */
+PMU_EVENT_ATTR_STRING(bcm2712_peripheral_rtrans, rpi_axi_pmu_event_bcm2712_peripheral_rtrans, "monitor=0,bus=12,counter=4");
+PMU_EVENT_ATTR_STRING(bcm2712_peripheral_wtrans, rpi_axi_pmu_event_bcm2712_peripheral_wtrans, "monitor=0,bus=12,counter=2");
+PMU_EVENT_ATTR_STRING(bcm2712_cpu_uc_rtrans,     rpi_axi_pmu_event_bcm2712_cpu_uc_rtrans,     "monitor=0,bus=13,counter=4");
+PMU_EVENT_ATTR_STRING(bcm2712_cpu_uc_wtrans,     rpi_axi_pmu_event_bcm2712_cpu_uc_wtrans,     "monitor=0,bus=13,counter=2");
 
 /* BCM2712 Master ID Filtered Events */
+PMU_EVENT_ATTR_STRING(arm_rtrans,              rpi_axi_pmu_event_arm_rtrans,              "monitor=0,bus=14,counter=4,filter=10");
+PMU_EVENT_ATTR_STRING(arm_wtrans,              rpi_axi_pmu_event_arm_wtrans,              "monitor=0,bus=14,counter=2,filter=10");
+PMU_EVENT_ATTR_STRING(pcie0_rtrans,            rpi_axi_pmu_event_pcie0_rtrans,            "monitor=0,bus=6,counter=4,filter=15");
+PMU_EVENT_ATTR_STRING(pcie0_wtrans,            rpi_axi_pmu_event_pcie0_wtrans,            "monitor=0,bus=6,counter=2,filter=15");
+PMU_EVENT_ATTR_STRING(hvs_filtered_rtrans,     rpi_axi_pmu_event_hvs_filtered_rtrans,     "monitor=0,bus=9,counter=4,filter=22");
+PMU_EVENT_ATTR_STRING(emmc0_rtrans,            rpi_axi_pmu_event_emmc0_rtrans,            "monitor=0,bus=5,counter=4,filter=29");
+PMU_EVENT_ATTR_STRING(emmc0_wtrans,            rpi_axi_pmu_event_emmc0_wtrans,            "monitor=0,bus=5,counter=2,filter=29");
 
 static struct attribute *rpi_axi_pmu_events_attrs[] = {
 	/* System Monitor events */
@@ -1039,11 +1065,37 @@ static struct attribute *rpi_axi_pmu_events_attrs[] = {
 	&rpi_axi_pmu_event_usb_system_l2_wtrans.attr.attr,
 
 	/* RPi 5 (BCM2712) Expanded Event Aliases */
-
-
-
-
-
+	&rpi_axi_pmu_event_pcie_rp1_atrans.attr.attr,
+	&rpi_axi_pmu_event_pcie_rp1_atwait.attr.attr,
+	&rpi_axi_pmu_event_pcie_rp1_wtrans.attr.attr,
+	&rpi_axi_pmu_event_pcie_rp1_wtwait.attr.attr,
+	&rpi_axi_pmu_event_pcie_rp1_rtrans.attr.attr,
+	&rpi_axi_pmu_event_pcie_rp1_rtwait.attr.attr,
+
+	&rpi_axi_pmu_event_hevc_dec_atrans.attr.attr,
+	&rpi_axi_pmu_event_hevc_dec_wtrans.attr.attr,
+	&rpi_axi_pmu_event_hevc_dec_rtrans.attr.attr,
+
+	&rpi_axi_pmu_event_a76_dsu_l3_atrans.attr.attr,
+	&rpi_axi_pmu_event_a76_dsu_l3_wtrans.attr.attr,
+	&rpi_axi_pmu_event_a76_dsu_l3_rtrans.attr.attr,
+
+	&rpi_axi_pmu_event_v3d7_atrans.attr.attr,
+	&rpi_axi_pmu_event_v3d7_wtrans.attr.attr,
+	&rpi_axi_pmu_event_v3d7_rtrans.attr.attr,
+
+	&rpi_axi_pmu_event_bcm2712_peripheral_rtrans.attr.attr,
+	&rpi_axi_pmu_event_bcm2712_peripheral_wtrans.attr.attr,
+	&rpi_axi_pmu_event_bcm2712_cpu_uc_rtrans.attr.attr,
+	&rpi_axi_pmu_event_bcm2712_cpu_uc_wtrans.attr.attr,
+
+	&rpi_axi_pmu_event_arm_rtrans.attr.attr,
+	&rpi_axi_pmu_event_arm_wtrans.attr.attr,
+	&rpi_axi_pmu_event_pcie0_rtrans.attr.attr,
+	&rpi_axi_pmu_event_pcie0_wtrans.attr.attr,
+	&rpi_axi_pmu_event_hvs_filtered_rtrans.attr.attr,
+	&rpi_axi_pmu_event_emmc0_rtrans.attr.attr,
+	&rpi_axi_pmu_event_emmc0_wtrans.attr.attr,
 	NULL,
 };
 
@@ -1059,10 +1111,64 @@ static struct attribute *rpi_axi_pmu_events_attrs[] = {
  *
  * Return: attr->mode (0444) if visible on current SoC, 0 to hide.
  */
+static umode_t rpi_axi_pmu_events_is_visible(struct kobject *kobj,
+					      struct attribute *attr, int unused)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct pmu *pmu = dev_get_drvdata(dev);
+	struct rpi_axi_pmu *rpi_pmu = pmu_to_rpi_axi_pmu(pmu);
+	struct perf_pmu_events_attr *pmu_attr;
+
+	pmu_attr = container_of(attr, struct perf_pmu_events_attr, attr.attr);
+
+	if (rpi_pmu->chip == CHIP_BCM2712) {
+		/*
+		 * On RPi 5 (BCM2712), hide legacy VPU Mailbox IPC events (monitor=1)
+		 * and legacy RPi 1-4 System Monitor aliases
+		 */
+		if (strstr(pmu_attr->event_str, "monitor=1") ||
+		    strstr(attr->name, "cpu0_") ||
+		    strstr(attr->name, "cpu1_") ||
+		    strstr(attr->name, "dma0_") ||
+		    strstr(attr->name, "dma1_") ||
+		    strstr(attr->name, "v3d0_") ||
+		    strstr(attr->name, "v3d1_") ||
+		    strstr(attr->name, "hvs_system") ||
+		    strstr(attr->name, "isp_system") ||
+		    strstr(attr->name, "usb_system") ||
+		    strstr(attr->name, "ccp2tx_") ||
+		    strstr(attr->name, "mphi_") ||
+		    strstr(attr->name, "h264_") ||
+		    strstr(attr->name, "v3d_") ||
+		    (strstr(attr->name, "peripheral_") && !strstr(attr->name, "bcm2712_")) ||
+		    (strstr(attr->name, "cpu_uc_") && !strstr(attr->name, "bcm2712_")) ||
+		    strstr(attr->name, "cpu_l2_") ||
+		    strstr(attr->name, "l2_control_") ||
+		    strstr(attr->name, "system_control_") ||
+		    strstr(attr->name, "direct_control_") ||
+		    strstr(attr->name, "direct_data_"))
+			return 0;
+	} else {
+		/* On RPi 1-4 (BCM2835-BCM2711), hide RPi 5 specific events */
+		if (strstr(attr->name, "pcie_rp1") ||
+		    strstr(attr->name, "a76_") ||
+		    strstr(attr->name, "v3d7_") ||
+		    strstr(attr->name, "hevc_dec") ||
+		    strstr(attr->name, "arm_") ||
+		    strstr(attr->name, "pcie0_") ||
+		    strstr(attr->name, "hvs_filtered") ||
+		    strstr(attr->name, "emmc0_") ||
+		    strstr(attr->name, "bcm2712_"))
+			return 0;
+	}
+
+	return attr->mode;
+}
 
 static const struct attribute_group rpi_axi_pmu_events_group = {
 	.name = "events",
 	.attrs = rpi_axi_pmu_events_attrs,
+	.is_visible = rpi_axi_pmu_events_is_visible,
 };
 
 /**
@@ -1954,6 +2060,10 @@ static const struct of_device_id rpi_axi_pmu_match[] = {
 		.compatible = "brcm,bcm2711-axiperf",
 		.data = (void *)CHIP_BCM2835,
 	},
+	{
+		.compatible = "brcm,bcm2712-axiperf",
+		.data = (void *)CHIP_BCM2712,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, rpi_axi_pmu_match);
-- 
2.55.0.691.gc56d675ccc-goog


