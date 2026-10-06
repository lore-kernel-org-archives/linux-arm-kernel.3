Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B95CA5FFE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 02:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKLp1eVCPBTLIMNMhAN09eidw820jig07CuE3MAQgIc=; b=fCWSMK8JckBPJ6Al5Zk9eDJO3A
	JVidW/Lnv5h8pqTzceNc+XKXpDCoFO4Bfo0lRYUF8riwaikCgQWWVt4rxt6QNgpWsfuDdqlROtwEn
	hu50n6+ZoBxKqnTCV+4Nhk3PjhOkRkgFBSPZIFdkR85m/3dbwt+cm0ZxckB9/TfFeXcFX77SN1zJR
	GTGkCbz0ydlenfhyoR9s/gF3BPa733dvyW8tkMuji7CFhB/jCv/sYuCB/+fNVDe3t18Mozqab95hv
	2dsrxBCcsZLLcRqhn6xyu1pfVLHUn4lXgyR/Od2T13g0cAqIJD4KOOOqEEw7q32Lv3Dt4Cb4jO22a
	bp9ZSP2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvJz-0000000HWqd-29Bw;
	Tue, 06 Oct 2026 02:54:27 +0000
Received: from mail.haxxors.com ([85.14.200.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDvJw-0000000HWnb-2EKt;
	Tue, 06 Oct 2026 02:54:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=buechner.me; s=mail;
	t=1791255262; bh=0FklO53WXz7f54itp1hkBvY8/zcxtH4skJdGafJMBT4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mVv0d8ZUbZkXgfEHG2oy5CGwlLFXbbpzd2N2l2bNQEupWfTEHAx2lvn0/5/xlkRXn
	 +CcZzQN/vop8y50Hw+BPxUHjbL0/KOue1dsjEyc90wVqcoMv8DsiA/tnhKy5+65Id9
	 rlMiFhFzmdDl3jF1MZTfRjmowPBWab9rz0h5bmzs=
Received: from localhost (localhost [127.0.0.1])
	by mail.haxxors.com (Postfix) with ESMTP id 7B1CD53105;
	Tue, 06 Oct 2026 04:54:22 +0200 (CEST)
X-Virus-Scanned: Debian amavis at mail.haxxors.com
Received: from mail.haxxors.com ([127.0.0.1])
 by localhost (mail.haxxors.com [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PIj6XKHpFbrk; Tue,  6 Oct 2026 04:54:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=buechner.me; s=mail;
	t=1791255260; bh=0FklO53WXz7f54itp1hkBvY8/zcxtH4skJdGafJMBT4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oLmqOqXTelinS3n35s9bWySXydUzShspuFhfR4+MY+XnSegOn34CeNnod7p6aisro
	 E7uC9khrXaucpgH3qwUWHTr9j6BR1/TOYiXuIt5u0icz8ZOzyUa/VmooyyLeOolNUI
	 3VLKYP3YBvrPeMUiXWkfAoO9mkKZo7LegvV5oJkQ=
Received: from esports.myloc.de (p200300ee8f09a300264bfefffe4ffb4b.dip0.t-ipconnect.de [IPv6:2003:ee:8f09:a300:264b:feff:fe4f:fb4b])
	(Authenticated sender: nils@buechner.me)
	by mail.haxxors.com (Postfix) with ESMTPSA id A680A530C7;
	Tue, 06 Oct 2026 04:54:20 +0200 (CEST)
From: =?UTF-8?q?Nils=20B=C3=BCchner?= <nils@buechner.me>
To: Daniel Lezcano <daniel.lezcano@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Nils=20B=C3=BCchner?= <nils@buechner.me>
Subject: [PATCH 1/2] thermal/drivers/mediatek/auxadc: Register per-sensor thermal zones
Date: Tue,  6 Oct 2026 04:54:09 +0200
Message-ID: <20261006025410.506443-2-nils@buechner.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261006025410.506443-1-nils@buechner.me>
References: <20261006025410.506443-1-nils@buechner.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_195424_850951_9EA134E6 
X-CRM114-Status: GOOD (  18.60  )
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

The driver registers only thermal zone 0, which reports the hottest of
all sensors. The MT8183 devicetree also describes a zone per sensor
(soc, gpu, md1, cpu-little, cpu-big, abb as sensor ids 1-6), and
mtk-svs looks up the "gpu-thermal" zone for its GPU banks. Without it
SVS fails to probe on MT8183:

  SVSB_GPU: cannot get "gpu-thermal" thermal zone
  mtk-svs 1100bc00.svs: error -ENODEV: svs bank resource setup fail

so the SoC never gets its calibrated, lower voltages.

Additionally register every sensor that has a devicetree zone, using
sensor id = sensor number + 1, read from that sensor's own measurement
register. Sensors without a zone are skipped, so SoCs whose devicetrees
only describe zone 0 are unaffected.

Runtime-tested on an Acer Chromebook Spin 311 (MT8183, juniper) with a
7.0-based kernel (the hardware is not set up to boot mainline);
build-tested on mainline with W=1. On the device: all six
sensor zones register and read plausible values (31-34 C idle, close
to the board sensors), and mtk-svs finds gpu-thermal.

The change and this changelog were drafted with an AI coding assistant
during a debugging session on the hardware; they were reviewed and
tested by the submitter.

Assisted-by: Claude Opus 5.5
Signed-off-by: Nils Büchner <nils@buechner.me>
---
 drivers/thermal/mediatek/auxadc_thermal.c | 80 ++++++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
index 9ee2e7283..59c8eaf87 100644
--- a/drivers/thermal/mediatek/auxadc_thermal.c
+++ b/drivers/thermal/mediatek/auxadc_thermal.c
@@ -308,6 +308,13 @@ struct mtk_thermal_bank {
 	int id;
 };
 
+/* A single sensor, exposed as its own thermal zone (DT sensor id = sensor + 1) */
+struct mtk_thermal_sensor {
+	struct mtk_thermal *mt;
+	int bank;
+	int index;
+};
+
 struct mtk_thermal_data {
 	s32 num_banks;
 	s32 num_sensors;
@@ -870,6 +877,77 @@ static const struct thermal_zone_device_ops mtk_thermal_ops = {
 	.get_temp = mtk_read_temp,
 };
 
+static int mtk_read_sensor_temp(struct thermal_zone_device *tz, int *temperature)
+{
+	struct mtk_thermal_sensor *sensor = thermal_zone_device_priv(tz);
+	struct mtk_thermal *mt = sensor->mt;
+	const struct mtk_thermal_data *conf = mt->conf;
+	struct mtk_thermal_bank *bank = &mt->banks[sensor->bank];
+	int temp;
+	u32 raw;
+
+	mtk_thermal_get_bank(bank);
+	raw = readl(mt->thermal_base + conf->msr[sensor->index]);
+	temp = mt->raw_to_mcelsius(mt, conf->bank_data[sensor->bank].sensors[sensor->index],
+				   raw);
+	mtk_thermal_put_bank(bank);
+
+	if (!mtk_thermal_temp_is_valid(temp))
+		return -EAGAIN;
+
+	*temperature = temp;
+
+	return 0;
+}
+
+static const struct thermal_zone_device_ops mtk_thermal_sensor_ops = {
+	.get_temp = mtk_read_sensor_temp,
+};
+
+/*
+ * Zone 0 reports the hottest sensor. Also register every individual sensor
+ * the devicetree describes (sensor id = sensor number + 1): MT8183 SVS looks
+ * up its GPU bank temperature through the "gpu-thermal" zone and cannot
+ * probe without it. Sensors without a devicetree zone are skipped.
+ */
+static int mtk_thermal_register_sensors(struct mtk_thermal *mt)
+{
+	const struct mtk_thermal_data *conf = mt->conf;
+	struct thermal_zone_device *tzdev;
+	struct mtk_thermal_sensor *sensor;
+	int id, b, i;
+
+	for (id = 1; id <= conf->num_sensors; id++) {
+		sensor = NULL;
+		for (b = 0; b < conf->num_banks && !sensor; b++) {
+			for (i = 0; i < conf->bank_data[b].num_sensors; i++) {
+				if (conf->bank_data[b].sensors[i] != id - 1)
+					continue;
+				sensor = devm_kzalloc(mt->dev, sizeof(*sensor), GFP_KERNEL);
+				if (!sensor)
+					return -ENOMEM;
+				sensor->mt = mt;
+				sensor->bank = b;
+				sensor->index = i;
+				break;
+			}
+		}
+		if (!sensor)
+			continue;
+
+		tzdev = devm_thermal_of_zone_register(mt->dev, id, sensor,
+						      &mtk_thermal_sensor_ops);
+		if (IS_ERR(tzdev)) {
+			if (PTR_ERR(tzdev) == -ENODEV)
+				continue;
+			return dev_err_probe(mt->dev, PTR_ERR(tzdev),
+					     "failed to register sensor %d\n", id);
+		}
+	}
+
+	return 0;
+}
+
 static void mtk_thermal_init_bank(struct mtk_thermal *mt, int num,
 				  u32 apmixed_phys_base, u32 auxadc_phys_base,
 				  int ctrl_id)
@@ -1294,7 +1372,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 	if (ret)
 		dev_warn(&pdev->dev, "error in thermal_add_hwmon_sysfs");
 
-	return 0;
+	return mtk_thermal_register_sensors(mt);
 }
 
 static struct platform_driver mtk_thermal_driver = {
-- 
2.53.0


