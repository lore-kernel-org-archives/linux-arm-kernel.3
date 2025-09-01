Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36979CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 09:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33ocR1/KWnKamLI2VB5KEQkatsxXrNn5E9NDKwqiK0Q=; b=BxGfPhq+7PBtGh5MKMZLLHCA0f
	eGzHCh+VQ93zOGe8G6oFYTnjLWHLtdpB6OYlbRENZZ3fApY1pZT0yjwqVFHLjXVjXqSl9mTqtU3i9
	6Bc/lu9wuWfXacJk+XKHwykh1LZdKMBRFaLif16Ui3qzqBtduoOe1KEXlqPaINLeF+VohA/8x5qau
	NE9sYaQ5HC/Im8ms02wdPAUD7CAq5OMKPHeK1KD/0FIj95mzsHy2NnoV8zdRYZ51h2ZogZGw7AE5Y
	sWPSUTbXav8SnxoFHjHpF1FK254UoeDpv4uZUfO8q5XrsMKY1MvKYbv3IM7fClTuRudO/RvZSt2VU
	6lA4EqZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut1Ap-0000000BoEQ-0K6d;
	Mon, 01 Sep 2025 09:50:03 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0NO-0000000Bf4g-2xmn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 08:59:00 +0000
X-UUID: e2624004871111f0b29709d653e92f7d-20250901
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:084774f6-4f27-4563-9c15-27e02553a790,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6493067,CLOUDID:bf6960de0fea4d96f52c7ed05c9793fa,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e2624004871111f0b29709d653e92f7d-20250901
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1064011897; Mon, 01 Sep 2025 16:58:53 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id B014EE008FA5;
	Mon,  1 Sep 2025 16:58:52 +0800 (CST)
X-ns-mid: postfix-68B5604C-514101748
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 93864E008FA7;
	Mon,  1 Sep 2025 16:58:43 +0800 (CST)
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
To: "Rafael J . wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Eduardo Valentin <edubezval@gmail.com>,
	Keerthy <j-keerthy@ti.com>
Cc: Ben Horgan <ben.horgan@arm.com>,
	zhenglifeng <zhenglifeng1@huawei.com>,
	Zhang Rui <rui.zhang@intel.com>,
	Len Brown <lenb@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Beata Michalska <beata.michalska@arm.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	linux-pm@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zihuan Zhang <zhangzihuan@kylinos.cn>
Subject: [PATCH v3 11/12] thermal/drivers/ti-soc-thermal: Use scope-based cleanup helper
Date: Mon,  1 Sep 2025 16:57:47 +0800
Message-Id: <20250901085748.36795-12-zhangzihuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250901085748.36795-1-zhangzihuan@kylinos.cn>
References: <20250901085748.36795-1-zhangzihuan@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_015859_071259_3D40A0D7 
X-CRM114-Status: GOOD (  12.62  )
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

Replace the manual cpufreq_cpu_put() with __free(put_cpufreq_policy)
annotation for policy references. This reduces the risk of reference
counting mistakes and aligns the code with the latest kernel style.

No functional change intended.

Signed-off-by: Zihuan Zhang <zhangzihuan@kylinos.cn>
---
 drivers/thermal/ti-soc-thermal/ti-thermal-common.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c b/drivers=
/thermal/ti-soc-thermal/ti-thermal-common.c
index 0cf0826b805a..daea718291a6 100644
--- a/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
+++ b/drivers/thermal/ti-soc-thermal/ti-thermal-common.c
@@ -27,7 +27,6 @@
=20
 /* common data structures */
 struct ti_thermal_data {
-	struct cpufreq_policy *policy;
 	struct thermal_zone_device *ti_thermal;
 	struct thermal_zone_device *pcb_tz;
 	struct thermal_cooling_device *cool_dev;
@@ -218,6 +217,7 @@ int ti_thermal_register_cpu_cooling(struct ti_bandgap=
 *bgp, int id)
 {
 	struct ti_thermal_data *data;
 	struct device_node *np =3D bgp->dev->of_node;
+	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpufreq_cp=
u_get(0);
=20
 	/*
 	 * We are assuming here that if one deploys the zone
@@ -234,8 +234,7 @@ int ti_thermal_register_cpu_cooling(struct ti_bandgap=
 *bgp, int id)
 	if (!data)
 		return -EINVAL;
=20
-	data->policy =3D cpufreq_cpu_get(0);
-	if (!data->policy) {
+	if (!policy) {
 		pr_debug("%s: CPUFreq policy not found\n", __func__);
 		return -EPROBE_DEFER;
 	}
@@ -246,7 +245,6 @@ int ti_thermal_register_cpu_cooling(struct ti_bandgap=
 *bgp, int id)
 		int ret =3D PTR_ERR(data->cool_dev);
 		dev_err(bgp->dev, "Failed to register cpu cooling device %d\n",
 			ret);
-		cpufreq_cpu_put(data->policy);
=20
 		return ret;
 	}
@@ -261,11 +259,8 @@ int ti_thermal_unregister_cpu_cooling(struct ti_band=
gap *bgp, int id)
=20
 	data =3D ti_bandgap_get_sensor_data(bgp, id);
=20
-	if (!IS_ERR_OR_NULL(data)) {
+	if (!IS_ERR_OR_NULL(data))
 		cpufreq_cooling_unregister(data->cool_dev);
-		if (data->policy)
-			cpufreq_cpu_put(data->policy);
-	}
=20
 	return 0;
 }
--=20
2.25.1


