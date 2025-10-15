Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA25CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 11:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TIFO4yfLHgq5ckjg2uDB2Daft94lZqpaYBGMWJ0nnlQ=; b=31XxSR2fCXVMQJBK4szlwvxkKr
	28GHcPFLn3vjU4PEMrY3bgS1f682q/9rjWy2p6YqKu53wr4tgdS7NHATIGai0jUzfMdVdLyDXDhKa
	eZq3wjRZ2vtYbHtHjZQ8AiTUkf9D/wz3hVBOrCWX+fkNXCJd0wCZ4EKQe6TtctUCaahuX+vIZTfUJ
	+zmEDRu7o+fLUs2lHLVd17QExAKxNtMQiUYR33g/vpvHjpYrzyYaqLp0yf1nMEXGmrJ59j1AyNwzf
	XPo5M8M5yVOoD2WzZZ1j2Au74FwzPw7U6UYlcRw6KH7ttCoV1r8GuMEo7laicZmYyuGSzcTeJpep9
	uZozgxew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v901c-00000001TVL-1Ze3;
	Wed, 15 Oct 2025 11:50:36 +0000
Received: from mout-p-102.mailbox.org ([80.241.56.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v901a-00000001TSE-0H8Z
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 11:50:35 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cmqCG2jmGz9tgD;
	Wed, 15 Oct 2025 13:50:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760529018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TIFO4yfLHgq5ckjg2uDB2Daft94lZqpaYBGMWJ0nnlQ=;
	b=rzOC4DhrKJl8FPRu6EF8M+uSRwJYcWe8B9lcR648jbDpoShgWlkGpLceFB2yW3hJgi808e
	C57hpwm3XEP+Q0CzTk2GbLkJpokbLFOIP3eP58wtnjl5cctD+F/X3mogw5lbh/8xbAM1Zx
	KC3gYGo1v7P5QhgZk0Oe6xM7pkxBq4ArD1KiAK5m3P645liz+Ccqs9DeMX8NZD2obECPfr
	+CPW/vOyD23D7amouR0VnTyi/zQR6XMOBZgUYgV0/V0oqWuUY0nDdgeWQ92CHZMeSbdY2M
	18bSzHddz+HI9l3BPVsiHZOE6oW0U4SZn2Qes+GlaSwyy8qHG4ahcywlLrFxtg==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760529016;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TIFO4yfLHgq5ckjg2uDB2Daft94lZqpaYBGMWJ0nnlQ=;
	b=Vnx4eutGKI+nVuhkVOgTveMI/5X2TGggNzkMGnf/yTcO3kTedqJwZCTur2JgvseoimsTUj
	CuozjKNMDe4ZXlumC7XHFQ5NYYtsUjQylAkzpQSQHPuclwgBwHG9WncpQ0Ht7YEAAZyN7q
	gBpFD5koggaRN4jW9ZkBuVJuAKj5elyzw1FVuMoDSKQv+cbqSMBKYHpuQ0fu7JU/o0CIs3
	dsxipy6P8/UuNPspSe5UqbbbICcQOzXPfzfQpbz4CIByUSEsbHRz8X1vtARXOrhpPNjEtf
	sPUjLbhdfldsvaoPgX1aJq7BpgbmsXOhGWp3HfvJ6zxHbjnmyFGUQjUyhlqDQA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Sudeep Holla <sudeep.holla@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: (scmi) Enable sensors to assure they can be read
Date: Wed, 15 Oct 2025 13:49:28 +0200
Message-ID: <20251015114953.148706-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: qi87ebe64zs1csghmf895uygn83dqjin
X-MBO-RS-ID: a65e4f3a777492cff53
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_045034_244472_101C01E1 
X-CRM114-Status: UNSURE (   8.93  )
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

The SCMI specification states that SENSOR_CONFIG_SET is used to
enable/disable the sensors. The sensors can be disabled by default,
which is the case at least on NXP i.MX95. Explicitly trigger the
SENSOR_CONFIG_SET to enable the sensors, otherwise sensor read may
fail and won't return valid data.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Cristian Marussi <cristian.marussi@arm.com>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Sudeep Holla <sudeep.holla@arm.com>
Cc: arm-scmi@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-hwmon@vger.kernel.org
---
 drivers/hwmon/scmi-hwmon.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/hwmon/scmi-hwmon.c b/drivers/hwmon/scmi-hwmon.c
index 364199b332c0a..eec223d174c07 100644
--- a/drivers/hwmon/scmi-hwmon.c
+++ b/drivers/hwmon/scmi-hwmon.c
@@ -240,6 +240,8 @@ static int scmi_hwmon_probe(struct scmi_device *sdev)
 	const struct hwmon_channel_info **ptr_scmi_ci;
 	const struct scmi_handle *handle = sdev->handle;
 	struct scmi_protocol_handle *ph;
+	u32 sensor_config = FIELD_PREP(SCMI_SENS_CFG_SENSOR_ENABLED_MASK,
+				       SCMI_SENS_CFG_SENSOR_ENABLE);
 
 	if (!handle)
 		return -ENODEV;
@@ -339,6 +341,13 @@ static int scmi_hwmon_probe(struct scmi_device *sdev)
 		if (!sensor)
 			continue;
 
+		ret = sensor_ops->config_set(ph, i, sensor_config);
+		if (ret) {
+			dev_err(dev, "Error enabling sensor %s. err=%d\n",
+				sensor->name, ret);
+			continue;
+		}
+
 		/*
 		 * Warn on any misconfiguration related to thermal zones but
 		 * bail out of probing only on memory errors.
-- 
2.51.0


