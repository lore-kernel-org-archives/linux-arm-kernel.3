Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5C43CA1011
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 16:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uN+WRBXKmvY7R1TJS+ghI4PKdQv6uwuCETWbuYCxeGo=; b=QVTY40iCrCzIbaYJcttKplXCvk
	a8v5fOzeJ427h8K6Sx7dzeBXFA17djUnYDvpQZH1MunyfAZevOax/xQlBwcozV2kay6tI6EzdnOPW
	RrzZZwYL+Xzak8s60NMxxsBPiTdiIOR1M7rtHSCfk0vL+BBOOs/EyulLtvJW9M9wCB+tK8C9ocX7Z
	DmL97wZCH+5YkhcygrVZ8J5LSeJzDv1JYS+UDlWMr0gqpEIbZelNdw/OAEDaTfBX7yDqoQzw+J7/U
	u/3ygUUMInQ/5+SGjpasOZTsFeiCb9ByaSiuoBlZh9tXLaHwgxMNgISjPBTHgmm1kml0FzA2eIysq
	1tfKmy0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utqTa-0000000750M-06tw;
	Wed, 03 Sep 2025 16:36:50 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnNM-00000006Yes-0iVV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:18:13 +0000
X-UUID: 6b6c578888c811f0b29709d653e92f7d-20250903
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:cc21363a-8291-4a3e-bd39-a186506d2f70,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6493067,CLOUDID:63c205d422a11131bd200bea55a50c60,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6b6c578888c811f0b29709d653e92f7d-20250903
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 487574624; Wed, 03 Sep 2025 21:18:02 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 1A8C2E008FA2;
	Wed,  3 Sep 2025 21:18:02 +0800 (CST)
X-ns-mid: postfix-68B84009-9033994
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id 57859E008FA4;
	Wed,  3 Sep 2025 21:17:58 +0800 (CST)
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
Subject: [PATCH v4 02/10] ACPI: processor: thermal: Use scope-based cleanup helper
Date: Wed,  3 Sep 2025 21:17:25 +0800
Message-Id: <20250903131733.57637-3-zhangzihuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
References: <20250903131733.57637-1-zhangzihuan@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_061812_512719_69B9DE05 
X-CRM114-Status: GOOD (  13.22  )
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
 drivers/acpi/processor_thermal.c | 37 ++++++++++++++++++--------------
 1 file changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor_th=
ermal.c
index 1219adb11ab9..5043f17d27b7 100644
--- a/drivers/acpi/processor_thermal.c
+++ b/drivers/acpi/processor_thermal.c
@@ -62,19 +62,14 @@ static int phys_package_first_cpu(int cpu)
 	return 0;
 }
=20
-static int cpu_has_cpufreq(unsigned int cpu)
+static bool cpu_has_cpufreq(unsigned int cpu)
 {
-	struct cpufreq_policy *policy;
+	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpufreq_cp=
u_get(cpu);
=20
 	if (!acpi_processor_cpufreq_init)
 		return 0;
=20
-	policy =3D cpufreq_cpu_get(cpu);
-	if (policy) {
-		cpufreq_cpu_put(policy);
-		return 1;
-	}
-	return 0;
+	return !!policy;
 }
=20
 static int cpufreq_get_max_state(unsigned int cpu)
@@ -93,9 +88,23 @@ static int cpufreq_get_cur_state(unsigned int cpu)
 	return reduction_step(cpu);
 }
=20
+static long long cpufreq_get_max_freq(unsigned int cpu)
+{
+	long long max_freq;
+	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D
+		cpufreq_cpu_get(cpu);
+
+	if (!policy)
+		return -EINVAL;
+
+	max_freq =3D (policy->cpuinfo.max_freq *
+		(100 - reduction_step(cpu) * cpufreq_thermal_reduction_pctg)) / 100;
+
+	return max_freq;
+}
+
 static int cpufreq_set_cur_state(unsigned int cpu, int state)
 {
-	struct cpufreq_policy *policy;
 	struct acpi_processor *pr;
 	unsigned long max_freq;
 	int i, ret;
@@ -120,14 +129,10 @@ static int cpufreq_set_cur_state(unsigned int cpu, =
int state)
 		if (unlikely(!freq_qos_request_active(&pr->thermal_req)))
 			continue;
=20
-		policy =3D cpufreq_cpu_get(i);
-		if (!policy)
-			return -EINVAL;
-
-		max_freq =3D (policy->cpuinfo.max_freq *
-			    (100 - reduction_step(i) * cpufreq_thermal_reduction_pctg)) / 100=
;
+		max_freq =3D cpufreq_get_max_freq(cpu);
=20
-		cpufreq_cpu_put(policy);
+		if (max_freq =3D=3D -EINVAL)
+			return -EINVAL;
=20
 		ret =3D freq_qos_update_request(&pr->thermal_req, max_freq);
 		if (ret < 0) {
--=20
2.25.1


