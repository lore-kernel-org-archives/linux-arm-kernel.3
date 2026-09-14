Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F37BDC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 09:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P6YrFJjqPcO/aWvqnjXKz6CibEiLizP2yppK2VCHVxw=; b=raAKT684YPGJIIH4LCMFfCVCAD
	O5OfcGYlRPS4Wndcu+5JBksLIEcgLWumDRpNKIGuR1cayOBuks/sZPybZv2WEcFG3mAHxbpgAYTxx
	lLEk8KFsWoOPyjI9JUVWF0iDD+ig4e3dk/Us0OnUYSvLLcXxggX2e3/63VfCHS/TczvdFD7BMirGc
	+lPRCrRudhikg6u//CYdUqnTE/j5xZZIl+I+bN08HPLkJCWCK3HXRNgZWUEBzxsyQ40essWx5XW4i
	1mxC+ofy60VxZYYxLYUuwsSS+90R8AS6sL78kZkjRTYMrCdBLlARZwGqNVz/v7BOo2d2Qie2AtrYB
	OQvIry7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63BK-00000002zmB-1GtW;
	Mon, 14 Sep 2026 09:40:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63BD-00000002ziZ-1zN0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 09:40:57 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9b9jF1305143
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P6YrFJjqPcO/aWvqnjXKz6CibEiLizP2yppK2VCHVxw=; b=Q/um7+Cn+R1ao+ga
	7xi4L/qfLJvSpiT+pss0RfnECg1rYEFA9gwNL4wRsblqWUDaVfSUJ4kah1P4ig1S
	a9j0quqyK/Exma9NccFGCZYAfyjiShQvi6Sbfi7KRdLm+QprEb+MZDtxpaQp9nU9
	KWl6Sr5dCByVkxAMkVvBmsj4oGnmlUolMT6hNoMfYHazBiOPzzoAUc1cd0AGyozD
	pJTxKZGeInnzCuJGFscKXzv0HdCK8YLHAxvcNg89gXkp+k3JAsE175IjbGUJTm9g
	VdhjJ/Wcrf1iOZvq7LFvUP6JuSZpyIW9EgCak/K1JFFmj6ya7T3HEQwiQ9aPCbwt
	s8whZg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex80fn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:40:51 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39dc5d85a9cso1886909a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 02:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378850; x=1789983650; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P6YrFJjqPcO/aWvqnjXKz6CibEiLizP2yppK2VCHVxw=;
        b=h2KF36mkmNHE5tWJigAZyu9TY7BZnb4c+580QHVVc+9XqFDe74kBTJNU4i9GVbqQKO
         leuJDgvrap03iR9RW4knw5HJ6c9V58nFRMslWXL09wOXjMUsFqtZZ+9G8wNVmqlfUD3M
         McudXnL3DNvbfijNB5znVtFQfFuiPpmIPldSG8Mi7Whf1WCGkjDpkTwsfVYK4S+opSBg
         5kSH86A/uZqIBYaP0ZnZl0RW/IZwZikDE2cm4si67/oE9KE4J+I3JlCzw0m92gSWsMnW
         EiyIzx3DeV9decyF8eF+4tsNzD8vrk8lOHvVDMNslaGfTm0r7mm/uEYCNTTz2veNdvok
         XnUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378850; x=1789983650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6YrFJjqPcO/aWvqnjXKz6CibEiLizP2yppK2VCHVxw=;
        b=In8ZUDCyDz/B3b+uzbXD94mkvglMPP7Loqi2fKDSA7X3rPDZjeeDCVU4EIR3BViLg8
         Ybp6GVQjZaNFIScq5XWqwqTxQgboC5CTHj5dRrFG143ColCqx25uK4hnGH1wu2RuVDa+
         wE2tw7RyZli2646pzb+2FL0gQ5tlD6+refPx/pGaLp/5+jV9GCe9Doz40QbBGAVhZzVe
         TmG5+QUv0yiwvM9zc+nNLn0IWlpHjbotCQeNoIYT6wA46QrCx9xQtrXKxtQrlNIDmvUL
         yrddM86IVYqpBws2lyMjiJlzym+6IhfDe160aXbdy4C8h4tWHMqBLBSPtdGr0agr3+76
         wMfQ==
X-Forwarded-Encrypted: i=1; AKwUvBx9tUQBbAbOWY1k7aQ3FYvv1RUO0bW8CS1Z1hyhbaIHqtjaGv/fZpQfBZlLdnqprxxUMBl7cq/DnK91d7ibkJex@lists.infradead.org
X-Gm-Message-State: AFuF++nZsW8QFlKDi9YwtBCaJDpcE2PY5yU8QV59/Tm91JcZbKY6rHkE
	Pbuz+bSfdnf1dONeYfKMtlzuEqUP0HeG6WI/9trfzYGm24LJvokgwkSo2rsd5HPXeRaDaUEmQ0O
	VyNhrq2Xktcu4TcGB06bKPfLZ6VZr3fLUgo8jfj7sBjLnKMXzdwhJr0IiHgHGc3oBJJ8fKCwf6e
	q/EQ==
X-Gm-Gg: AYBFou2AVzYbQ8crTEBAKLkl3SFTcv2Z5e/dDOCFoUpO2ttXmKqX3Knh9PVx2Ua1ify
	vIwrfMXsKx7IUA4QVMWUK8NpE99KkGBoNkIiRfip1o8yK5UZd+uo2oGDJl3mnSmzpNtHIuecbEk
	EzM65m237XSMxcnuaprZWCjCgC23oFo4qMU/cUxm5OgDIuRoN3LouPqDMrn0m/zP/VG3BYZNd/6
	wniZc1aUzwvoE6WZwmG3b0+neQZSnirv7jP+YlKzFPwS/G9dO3JlUAUIHczouPlLMJT1efRHb3g
	UdTNPS9i4WZHj10kc5kreaMuaM2XjBtKV6+gn8fFCOl+7yj/oEodRfTPFqajrDgvzVe/pzweBwO
	jRj7xYHhpZr9tgqbFGoV2K8uua41F9C7WaXRzJKq3B+hEAjunJd1RHUd0
X-Received: by 2002:a17:90b:2e0e:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39dec056382mr4254869a91.16.1789378850255;
        Mon, 14 Sep 2026 02:40:50 -0700 (PDT)
X-Received: by 2002:a17:90b:2e0e:b0:38e:250b:122f with SMTP id 98e67ed59e1d1-39dec056382mr4254813a91.16.1789378849795;
        Mon, 14 Sep 2026 02:40:49 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:40:49 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:57 +0800
Subject: [PATCH RFC v2 09/10] arm_mpam: Support MSC accessibility
 derivation from RIS nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-9-bf6645bb2f65@oss.qualcomm.com>
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378767; l=6269;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=6aXcuNFRRTDlvGN+TsA+86KnLS6uQ6WRYT0BfzhuKws=;
 b=bBQpLcPvbQkOwg42mxykFwgzeNMrLYkvmlHOl2AGfilHAAgu7ACzGrPmI6ia6F5ZPYIR2VX4z
 GvQ3J7nPV2uDZDl8IQxmBFkTY+MyPGCT0D/Ot5op5knchONGKHD6MT7
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNiBTYWx0ZWRfX8ftF1+L3FUoB
 SbgDrjEaFcODyGm4Cg4lqVoYowqHViSaNayVgPhgKkf/IzXcqZ+4H16U7su27aM8PLaYph+o85Q
 mGeGABWogNTOyNckn8vJ3WZqVCw+m0ScJfKENuekQ4oYx3+o0CLuXsWXSPWAj7hmT8qDSLY0LWJ
 hL1GyswVkaAqQrP9K4uHJiQtSSNc2OID7adP3ZwsYV3TjR2HSva6jpTNcge5OHhTBxnBrXxNr1Y
 DC8cLJ7H1/75M+KNsG1SJNQcsJoEZhF3z+Z0++eZluxDTPY02JvR7dis7oQmznkdc1jTH7Qpiec
 b7sM665EDt/U0CVntzqIbcI2lPcZpR4onVuxWbF4ED+EuYhG2uH/xvxym9nunj+IGm9798A11fd
 vzSdImeTyu/XzcSzBs/ZNK3lvcloXlcgGjLmOumJ5+aPmCpTrVGJNmVCOgpCfkwtuPW/QbldilX
 MZL+Nnz1540AI7VPjgA==
X-Proofpoint-GUID: D4W9otppp8_AVzewX_2s7d3hrwiW47LW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNiBTYWx0ZWRfX4OItVg4TC8JO
 puLkiSLa4CRzy8aGbhM0GvijK3hy9I3CGxQPbw+UeTaZmAmm617lGtaJqn1VEG9QVfS1V3lxch0
 frSO3hNq71IMWyeapN8pSy2QeGD/Nt8=
X-Proofpoint-ORIG-GUID: D4W9otppp8_AVzewX_2s7d3hrwiW47LW
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa7c123 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=DmVZOekaPyhSFRrspXcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_024051_539222_EB2D9947 
X-CRM114-Status: GOOD (  27.89  )
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

The DT accessibility derivation only handled MSCs whose parent node is
a cache or memory device. When the MSC is placed under a generic
container (e.g. directly under /soc), the parent gives no affinity hint
and there is no fallback.

Add a per-RIS fallback path for when the parent node is not a
recognised cache or memory device. For each available RIS child node,
affinity is resolved in two steps: first from an explicit 'cpus'
phandle-array on the RIS node, then from the 'arm,mpam-device' phandle.
The final accessibility mask is the union of all RIS masks; if any RIS
fails to resolve, the mask is cleared and the MSC fails to probe rather
than come up with a partial affinity.

Factor the DT-specific logic into mpam_dt_update_msc_accessibility() so
that update_msc_accessibility() dispatches cleanly between ACPI and DT
paths.

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 146 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 131 insertions(+), 15 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 7ef3ed55b066..ede1b157ab57 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2159,6 +2159,136 @@ static int mpam_msc_setup_error_irq(struct mpam_msc *msc)
 	return 0;
 }
 
+/*
+ * Resolve a RIS to its CPU affinity from its 'cpus' phandle-array.
+ * Returns -ENODEV when 'cpus' is absent (the caller may use another source),
+ * -EINVAL when any phandle is invalid, or 0 on full success.
+ */
+static int get_cpumask_from_ris_cpus(struct device_node *ris_np,
+				     cpumask_t *affinity)
+{
+	int i, cpu_phandle_count;
+
+	cpu_phandle_count = of_count_phandle_with_args(ris_np, "cpus", NULL);
+	if (cpu_phandle_count <= 0)
+		return -ENODEV;
+
+	for (i = 0; i < cpu_phandle_count; i++) {
+		struct device_node *phandle_np __free(device_node) =
+			of_parse_phandle(ris_np, "cpus", i);
+		int cpu, matched = -1;
+
+		if (phandle_np) {
+			for_each_possible_cpu(cpu) {
+				struct device_node *cpu_node __free(device_node) =
+					of_get_cpu_node(cpu, NULL);
+
+				if (phandle_np == cpu_node) {
+					matched = cpu;
+					break;
+				}
+			}
+		}
+
+		if (matched < 0) {
+			pr_warn("MPAM: RIS %pOF cpus[%d] (%pOF) is not a possible CPU\n",
+				ris_np, i, phandle_np);
+			return -EINVAL;
+		}
+
+		cpumask_set_cpu(matched, affinity);
+	}
+
+	return 0;
+}
+
+/*
+ * Resolve a RIS to its CPU affinity from its 'arm,mpam-device' phandle.
+ * Returns -EINVAL when 'arm,mpam-device' is absent or the phandle is invalid.
+ * 0 on full success.
+ */
+static int get_cpumask_from_ris_phandle(struct device_node *ris,
+					cpumask_t *affinity)
+{
+	struct device_node *mpam_device __free(device_node) =
+		of_parse_phandle(ris, "arm,mpam-device", 0);
+
+	if (!mpam_device) {
+		pr_warn("MPAM: RIS %pOF has neither 'cpus' nor 'arm,mpam-device'\n",
+			ris);
+		return -EINVAL;
+	}
+
+	if (of_device_is_compatible(mpam_device, "cache"))
+		return get_cpumask_from_cache(mpam_device, affinity);
+
+	if (of_device_is_compatible(mpam_device, "memory")) {
+		cpumask_or(affinity, affinity, cpu_possible_mask);
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int get_cpumask_from_ris(struct device_node *ris, cpumask_t *affinity)
+{
+	int err;
+
+	err = get_cpumask_from_ris_cpus(ris, affinity);
+	if (err != -ENODEV)
+		return err;
+
+	return get_cpumask_from_ris_phandle(ris, affinity);
+}
+
+/*
+ * Returns -ENODEV when the parent is just a container (not a recognised device),
+ * so the caller falls back to the per-RIS description.
+ */
+static int get_cpumask_from_parent(struct mpam_msc *msc, cpumask_t *affinity)
+{
+	struct device_node *parent __free(device_node) =
+		of_get_parent(msc->pdev->dev.of_node);
+
+	if (parent == of_root) {
+		cpumask_copy(affinity, cpu_possible_mask);
+		return 0;
+	}
+
+	if (of_device_is_compatible(parent, "cache"))
+		return get_cpumask_from_cache(parent, affinity);
+
+	if (of_device_is_compatible(parent, "memory")) {
+		cpumask_copy(affinity, cpu_possible_mask);
+		return 0;
+	}
+
+	return -ENODEV;
+}
+
+/*
+ * An MSC's CPU affinity is described either by its parent node or, when the
+ * parent is just a container, per-RIS inside the MSC. In the per-RIS case the
+ * accessibility is the union of the RIS affinities: every RIS must resolve, so
+ * a single failure clears the mask and stops and the MSC fails to probe rather
+ * than come up with a partial affinity.
+ */
+static void mpam_dt_update_msc_accessibility(struct mpam_msc *msc)
+{
+	cpumask_t *affinity = &msc->accessibility;
+
+	cpumask_clear(affinity);
+
+	if (get_cpumask_from_parent(msc, affinity) == -ENODEV) {
+		for_each_available_child_of_node_scoped(msc->pdev->dev.of_node, ris) {
+			if (get_cpumask_from_ris(ris, affinity)) {
+				cpumask_clear(affinity);
+				break;
+			}
+		}
+	}
+}
+
 /*
  * An MSC can control traffic from a set of CPUs, but may only be accessible
  * from a (hopefully wider) set of CPUs. The common reason for this is power
@@ -2168,8 +2298,6 @@ static int mpam_msc_setup_error_irq(struct mpam_msc *msc)
  */
 static void update_msc_accessibility(struct mpam_msc *msc)
 {
-	struct device *dev = &msc->pdev->dev;
-	struct device_node *parent;
 	u32 affinity_id;
 	int err;
 
@@ -2185,19 +2313,7 @@ static void update_msc_accessibility(struct mpam_msc *msc)
 		return;
 	}
 
-	/* Where an MSC can be accessed from depends on the path to of_node. */
-	parent = of_get_parent(msc->pdev->dev.of_node);
-	if (parent == of_root) {
-		cpumask_copy(&msc->accessibility, cpu_possible_mask);
-	} else {
-		if (of_device_is_compatible(parent, "cache"))
-			get_cpumask_from_cache(parent, &msc->accessibility);
-		else if (of_device_is_compatible(parent, "memory"))
-			cpumask_copy(&msc->accessibility, cpu_possible_mask);
-		else
-			dev_err_once(dev, "Cannot determine accessibility of MSC.\n");
-	}
-	of_node_put(parent);
+	mpam_dt_update_msc_accessibility(msc);
 }
 
 /*

-- 
2.34.1


