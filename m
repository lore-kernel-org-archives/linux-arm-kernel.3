Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E9CCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 16:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOxl/zdlD1oQMHlMMLlIk2Ekl/L4rxG5wV/DxbseP1I=; b=I1pJIJn4pq2wn+sHWCF3Q32+i8
	0z3EcX5/lewwP8zG8/W302xbRf6bq72NjXIx4+aBYhrPuEctUE3N1q4JDPb45GuTHdaQF52kLl7vQ
	0s1QplU7gHqcamj6rC+t7/YD7lQA5I+BwKwXHO4hzRAMx6M5gH92eFwfWg8MWgV0StA+7zSIPVQEP
	Wff7VIFLC3MCsrAwEBYsfTFquS756GbMtq/yLY4dcr3wuQVWFnDHFkX/X2jzFNywD4zKKbIwOTdbe
	qn9MPmNBQqp/Lb3OzZyC+u8x8ORaknCSPXfy8z9riTXOaUCe0SsniBb8ZmNeuewgLKC65+vRIGOyF
	9L1Fmodw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuZmW-00000003Jmy-10g0;
	Fri, 05 Sep 2025 16:59:24 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuWQo-00000001xGC-0pVe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Sep 2025 13:24:47 +0000
X-UUID: ae0311428a5b11f0b29709d653e92f7d-20250905
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:8aa5386c-c9f5-4430-8500-bcee34bb0354,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6493067,CLOUDID:b78993f22d836f36a02cb4d46fb2af39,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: ae0311428a5b11f0b29709d653e92f7d-20250905
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
	(envelope-from <zhangzihuan@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 604134888; Fri, 05 Sep 2025 21:24:41 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 14B58E008FA3;
	Fri,  5 Sep 2025 21:24:41 +0800 (CST)
X-ns-mid: postfix-68BAE498-6193824
Received: from localhost.localdomain (unknown [172.25.120.24])
	by mail.kylinos.cn (NSMail) with ESMTPA id E5F06E008FA4;
	Fri,  5 Sep 2025 21:24:36 +0800 (CST)
From: Zihuan Zhang <zhangzihuan@kylinos.cn>
To: "Rafael J . wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
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
Subject: [PATCH v5 3/6] cpufreq: intel_pstate: Use scope-based cleanup helper
Date: Fri,  5 Sep 2025 21:24:10 +0800
Message-Id: <20250905132413.1376220-4-zhangzihuan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250905132413.1376220-1-zhangzihuan@kylinos.cn>
References: <20250905132413.1376220-1-zhangzihuan@kylinos.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_062446_558608_79EC5AB5 
X-CRM114-Status: GOOD (  12.42  )
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
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
---
 drivers/cpufreq/intel_pstate.c | 59 +++++++++++++++++++---------------
 1 file changed, 33 insertions(+), 26 deletions(-)

diff --git a/drivers/cpufreq/intel_pstate.c b/drivers/cpufreq/intel_pstat=
e.c
index f366d35c5840..0b54e08f9447 100644
--- a/drivers/cpufreq/intel_pstate.c
+++ b/drivers/cpufreq/intel_pstate.c
@@ -1502,9 +1502,8 @@ static void __intel_pstate_update_max_freq(struct c=
pufreq_policy *policy,
=20
 static bool intel_pstate_update_max_freq(struct cpudata *cpudata)
 {
-	struct cpufreq_policy *policy __free(put_cpufreq_policy);
+	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpufreq_cp=
u_get(cpudata->cpu);
=20
-	policy =3D cpufreq_cpu_get(cpudata->cpu);
 	if (!policy)
 		return false;
=20
@@ -1695,41 +1694,49 @@ static ssize_t store_no_turbo(struct kobject *a, =
struct kobj_attribute *b,
 	return count;
 }
=20
-static void update_qos_request(enum freq_qos_req_type type)
+static bool intel_pstate_cpufreq_update_limits(int cpu, enum freq_qos_re=
q_type type)
 {
 	struct freq_qos_request *req;
-	struct cpufreq_policy *policy;
-	int i;
+	unsigned int freq, perf_pct;
+	struct cpudata *data =3D all_cpu_data[cpu];
+	struct cpufreq_policy *policy __free(put_cpufreq_policy) =3D cpufreq_cp=
u_get(cpu);
=20
-	for_each_possible_cpu(i) {
-		struct cpudata *cpu =3D all_cpu_data[i];
-		unsigned int freq, perf_pct;
+	if (!policy)
+		return false;
=20
-		policy =3D cpufreq_cpu_get(i);
-		if (!policy)
-			continue;
+	req =3D policy->driver_data;
=20
-		req =3D policy->driver_data;
-		cpufreq_cpu_put(policy);
+	if (!req)
+		return false;
=20
-		if (!req)
-			continue;
+	if (hwp_active)
+		intel_pstate_get_hwp_cap(data);
=20
-		if (hwp_active)
-			intel_pstate_get_hwp_cap(cpu);
+	if (type =3D=3D FREQ_QOS_MIN) {
+		perf_pct =3D global.min_perf_pct;
+	} else {
+		req++;
+		perf_pct =3D global.max_perf_pct;
+	}
=20
-		if (type =3D=3D FREQ_QOS_MIN) {
-			perf_pct =3D global.min_perf_pct;
-		} else {
-			req++;
-			perf_pct =3D global.max_perf_pct;
-		}
+	freq =3D DIV_ROUND_UP(data->pstate.turbo_freq * perf_pct, 100);
=20
-		freq =3D DIV_ROUND_UP(cpu->pstate.turbo_freq * perf_pct, 100);
+	if (freq_qos_update_request(req, freq) < 0)
+		pr_warn("Failed to update freq constraint: CPU%d\n", cpu);
=20
-		if (freq_qos_update_request(req, freq) < 0)
-			pr_warn("Failed to update freq constraint: CPU%d\n", i);
+	return true;
+}
+
+
+static void update_qos_request(enum freq_qos_req_type type)
+{
+	int i;
+
+	for_each_possible_cpu(i) {
+		if (!intel_pstate_cpufreq_update_limits(i, type))
+			continue;
 	}
+
 }
=20
 static ssize_t store_max_perf_pct(struct kobject *a, struct kobj_attribu=
te *b,
--=20
2.25.1


