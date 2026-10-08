Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0359CA6007
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 06:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4cj17IQX9ex0gxY1gB4xSmsTgXgcoGUQ6ol3KePE94=; b=RvDLTm54cIW3HiXpTKbUHmQgEf
	fjwT2B+Q6611g6+OLQ2vzDyof+MTmXJDBsuhPV3v2yjrxaDj7geCSyPMaFdR2rsv+kWm2WJUlEF92
	ZH7cJsRDAemlKgSG9DrCNymxOiPtJj71j9W6zIJLxcFg7uL8YqapeayTSatakAaJmZX7GLVmjPc8s
	YoB9DRpo5leqAS1JAfpmyOGbq7HtWZjuthb04izR/OGDnwii4VJG1J5CYT0wwQ3Hly6QtnTUUhqLx
	xSIvQTjY+nRN7X2wpZxomi2T00F32fcrQf+5jKMGk7qrJ786ZP8e60wlv54mbo6Q2lI+tb7o9oDZ3
	rNi9EyJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhvM-00000003fI7-3H8g;
	Thu, 08 Oct 2026 06:48:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhvK-00000003fGo-2PEN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 06:48:15 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BTdI928474
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 Oct 2026 06:48:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y4cj17IQX9ex0gxY1gB4xSmsTgXgcoGUQ6ol3KePE94=; b=A91KisAzL9Ic6XEs
	T1O3BK9fJAUCSmhrtkEql5NNbRwhtWpydIAQo/6oo8FMalBBEabWIGoT3k/IQfpI
	pSzzV0gClBEHnrgxDARbRn+Ajz4SF5JJbolRiJ5TE9WJo9BhbRMer/mDMlarl8i6
	DaRyyPBQL+2ls+CrNlQFtnKQGNKIrkwNkj65wY5r4vPzbvLWLi2NNOWLhiEbzPMe
	BLp3zJg1u3X/6aQ3fJPYMG7aKSqe/oWXd6lgJu7s1uDf39238/zVwgRQhKjZxadq
	RE2RKFygOyq4OfgxFp0wDaFK9b74zHTPRYUtDk/A2+WqmaS2fGA3G5ByWfWnU82l
	CHaSDA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2shhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 06:48:13 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e6188d1e51so14640485ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 23:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442093; x=1792046893; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=y4cj17IQX9ex0gxY1gB4xSmsTgXgcoGUQ6ol3KePE94=;
        b=JVoVswFMb88r+FLwFLkPHfdCauyCqkqGtf8T+D6Et/G4lzkiDpvxXhxkZdrrOTAkjj
         WuvE98KsLugzpH2O8NDoBNQCmAsXGtrx2u1Hhy/yHMQS2qtJ1bop9/rDvfX7dyIxKzu+
         CuUvDC9Sz+8tri+bA2sEy4q1EdjaLi92HCiH9uiMHYSqcH73ScQ155LrHAAkhl3SbWwW
         vOX9VviMhaqvPvfDwWxsrKwqOjnWANHDv4+mWZGodKzBcdupQQoKk8PpC+TSRsLuieI/
         TOddTgs1d7C0hslGuo8V1IhmcPVRmJWXB/i8cKQ1JoRFYRa9m42vNFzDYW6WKAgmHJCI
         Oxrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442093; x=1792046893;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y4cj17IQX9ex0gxY1gB4xSmsTgXgcoGUQ6ol3KePE94=;
        b=QsY0BqZcf+UXuLiBOfimwirvG0chUGGVmYecEHVf9VCvex6JpIhGVhLM+IzliVDr1d
         a1SIHAe816gkQmYZNtYiBp52OIAaQQLqbNDL0HJR4gXMPgiJL0jWWUqwL1/wgSOKszWE
         faqG1obx+guRiuBFePKKNiYjWKrgUy2h8/SVK5aVRtBctOC2fvnMyxxzdANOOjvJCgMf
         bQ5RONyUxCIsJ8RkQsvTZfEAoxeqz/Hk6VlvztiuReitDRkkge0tUFvKGmnUuwSAzfXl
         VeUZnaVlpo8KSczM59odrn9e7Mu7SwG2dNEwTm9AMRSeOlTOSh1bZfyRhWy3jaPKUK0/
         VQ1A==
X-Forwarded-Encrypted: i=1; AKwUvBzhvgUFqfD6sbUrvl2JJ3BAYX273MBtd8A5okpet4HdJzej+Lyt9zKbrmdksZqcQt2bCGmqJkK7o5DtG1nHlx6k@lists.infradead.org
X-Gm-Message-State: AFq9FYLFWKKA3lnZHmBBoETcUW18Gyo9cdIxU8OtlPSVUlldbB5KeHjK
	Io2Dw0jxbvkPas2wxffkpPDemOnlA36pVLrR6xIibD+P7L+7RuftfXgcn8A94Mtf2cSvwRi0xrI
	ZPnxrqjZDU7FpBhMzaKe6heMyAPL1KQKRKYttMFxN27kd+3U2pwzGuxBNMZ6KBwFYPjs33YYWJU
	TmAg==
X-Gm-Gg: AYBFou1T1i1WQkjHNuGPukQgoCDUQpTSSZTCNZz9RRIYue79aK34i1xN3iOo4gCepNY
	UnI7//Wzz5eKcHk4ocyg3/8EStd376lIt2ypIzNOW+2sMlueGJfvjyjwxwK77TJU8qReZvX0y7/
	DHAwuSu8uVk9W9VDnik6cz/fm5ergKe1QARInWjj1iSFySJkvYK0Wh2h/pPp4xqykEVQw5G0HGi
	XReoYT7hS/hRWG1aS2OmUSkEzWOaS8aPNqgYOKTkI8uEJynqn83zffEM2/dtnVHUlYpsOvq/s3Q
	kBBqSoAErbzI8nWKLVasHEoj8xgiKfxpniMty2y/pmna7B0IhIAY2IxlPtwAWchXsq4CP+Y+nng
	/pzcPwdPfg0p3YmpLj/2PvOY5O/xkfmqjjZnBlZHMPUM2nPMID5EZnzo=
X-Received: by 2002:a17:90b:4d:b0:3a4:c52e:8126 with SMTP id 98e67ed59e1d1-3a8a1b5f732mr3689934a91.40.1791442093029;
        Wed, 07 Oct 2026 23:48:13 -0700 (PDT)
X-Received: by 2002:a17:90b:4d:b0:3a4:c52e:8126 with SMTP id 98e67ed59e1d1-3a8a1b5f732mr3689923a91.40.1791442092528;
        Wed, 07 Oct 2026 23:48:12 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a254b3sm3313925a91.2.2026.10.07.23.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:48:12 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:41:16 +0800
Subject: [PATCH v3 7/8] arm_mpam: Support MSC accessibility derivation from
 RIS nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpam-resctrl-dt-knp-support-v3-7-35196c2b43bf@oss.qualcomm.com>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
In-Reply-To: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791442026; l=6269;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=GSIRP3BmhQS7xYPGeQGpseQQlGc9u4TA3Qjw1cKATeU=;
 b=pSl8/bn/WvXEY9gArvtq+8Qd8w/Wt21IFdtyi1T8yoyytSv7O7alTH6LoIlk1qgFoHuKki4TF
 6YzLk24JMNMApzvcekAGDjpj5g1Acg1hbG9TYdHhAfXVOWF15GLvzRm
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX83NF05bA8rlW
 SX6rGUvnqrnyWi6VNY0Xdjm078fIF0Lw0HtfSDumUQUJoQS9AB54z6lCIZA9HW6qaYq/OCO/I/F
 mTtZFoHba3X0wu8RdYwUkYDKWaPAFfo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX8nyL4/Wodaic
 yY0B65Pg0D6DcX2G0zqHytnaG/K42eYvy3aWtvaKPpn5BnhlbOVQ4ZYUIhjSr/6leta7c/M0l/q
 /TtgmnUDqNlX0r3BSjJW68XblbS12TlOiEDGhgVK1ewrmzZJEbJRnDEmdqZtFv/Qzyio3EueJPU
 Us9KKWS+eagAWvsmRoRWetuHeGepJ/dnV0vwUahBRc/T4qEiULy9h61mbiXeiIAp7edp3MWIAL+
 ru1I+6WzE3zY6L2GtVXtBJpIl9lx4PzciemvLb1oiCKfFKwOB7VYTKvxgMtL9Niq4Brvm7znjz5
 cC3AJq3Q6nerKa/TkM4bFDjnvHE0ej3sBb5vAqVaIRXK2iTLYEuJiP/FK2YXUzqeYRXm5nrBv9h
 vgCzgN+N0Oce0dHucXVs9Nfee9baCRrF8VwBa8i56RIq+yRupOoT+MhzXyi780ARht/JEWweF5j
 B1IGeIC0C6+BUD4ApFQ==
X-Proofpoint-ORIG-GUID: aTu2lC2iZFqfAa7gPG1ZAVo5lbFCrDNf
X-Proofpoint-GUID: aTu2lC2iZFqfAa7gPG1ZAVo5lbFCrDNf
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac73cae cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=DmVZOekaPyhSFRrspXcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_234814_633989_61F11692 
X-CRM114-Status: GOOD (  27.35  )
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
index 048d32e69f55..80157b819c3d 100644
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


