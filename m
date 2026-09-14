Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01730C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 09:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7DvmSimw6MjnY/L40N+LcEDCs6VLUnTtNUZQ4Z7jK70=; b=eo+6w/IB67sI3xu3rRp4gHuoS8
	3vDWUxhmMZMZla/qFEdB3bpu7zG4f0Vt+W7WSI0lvN5f/Pdk1cKTM1EDECoSO3JlDsLy6qG0q5TTk
	0MmmXKTkK/dAanqyjvPriL5erb9DzJSkzx1gqvibWlZzeyhVxAjv2zwFuTKVl49fqEEFQ0nzNmwaO
	TpiU58SzesaC48OAdaS0jlhYK85v3lgP2G6nU0QiQAQvIdPvfej0C+89jbxj5UnjrsMriRsamzr7x
	xtXUbPv4T+18jtQx7VfRCBRMzbAHXwl1oWJYLVfevs/55blFKTm+l0D6+BXywnYUFDDCqCiC+0YY9
	KjN0U/rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63Ad-00000002zLN-2T7q;
	Mon, 14 Sep 2026 09:40:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63AZ-00000002zJK-1o9B
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 09:40:12 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9b9L81305126
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7DvmSimw6MjnY/L40N+LcEDCs6VLUnTtNUZQ4Z7jK70=; b=MswalhPgXrq7Zixl
	19P1QCywTTO7ETPIfcQHUw5E+pkNsUCPGnxHt83C8u5AixNCxAujo9U0EK/S1YqJ
	R9mgDmpFP7C0Lj+6d+q7nOhrPhxkHOGiBDWnnvr2Z2pbYmMYGkk7F6JOYbUYW8rv
	n1wMKRaKP56+G+XOIm4W7Ga2EJ8aWUhZMh90Cj89dGc9PhV9LVF/YTr7NVjpTbuE
	InVUxHn8xHfuUdlDbrTWJVOMVCuETDPjYHnsxTKUTaEjgxQ2VV6RVEHMXew21JXU
	I3n8mzOgseiLsTRSiwTGS5ga1NpqjbNJ9L1wSVHsfoCcVpsdnTxuwLSN4CkuNAg0
	TvelBA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex80c9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 09:40:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so6357154a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 02:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378810; x=1789983610; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7DvmSimw6MjnY/L40N+LcEDCs6VLUnTtNUZQ4Z7jK70=;
        b=jRTMurpMmN8w3qssv2fOLASctfGyeeCgmR+ySY54sqifEdGX+MUjGPcxDIbeacpdxr
         bRlllap87enZckLz506+0NdJWDLJxSecPlDBbfFazxkc3h+yqRWcQmy7tVCLD70uKyIW
         obMWrFeXrpVy7Ot0SCOULom02mtx3Yp9AymYk1YYbbXq6avsGS4JAN3p9PGr+bRSQtYe
         JB4JgPB4ZkUd+L1epxuFk8buyV9S6UHBv0aNTqjaYu3KlVMCi5RNR6vAarjKoDhKQxkk
         1LprSbRvX1SKgntiC35dDPMCp2dI8FKD570wpMeNt7je6l6tlM3qByVtrGNEQcLVDVCx
         c9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378810; x=1789983610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7DvmSimw6MjnY/L40N+LcEDCs6VLUnTtNUZQ4Z7jK70=;
        b=h4MwG8uWiMR8lZb6fMxx1I4vNqg4sy/lowRMJDj+CID20lOxCaSh8EiYExnQQXuihw
         PeA/7PZ+ScOJuySzfv+yqTDW0nYlgvPA4tC4fBQvK+50MqKCpykmmFOmww3RcJRDnKH0
         /0rGQIy2BezEq/1ZrQ0w9wozl+hgBhTNcxZUsLjG/8uOQ1EZM0BGrMPYbRb5roxmNu0B
         XojT1kAy35C0qHt8f017B7L9iW9nNS0r4+uPmK3bTabmm3k1TetWSICIZ41jZCocLOex
         k1mNF43AuUgIXYqjj2wfduPwEH6nHe3LK/NzCQuYyi7Mcg+GRBlVG9lL5XcBDpoXH4Zq
         eK2g==
X-Forwarded-Encrypted: i=1; AKwUvByySUdMEMFpCNVXde7XU/qNfVFBdvRxAeGPpXTWHrfxzKJAxbcC3obgrsNAKOfE7nNQL1R30WatzFxLBsJxBliT@lists.infradead.org
X-Gm-Message-State: AFuF++kaQEwjZWOihHYR0pYdGMjK5HEcgWddykgcPwY0tP1RcEltZZlx
	G0GDOipNiS12unJl7NbXgPNx7GVo3C1q3wizQKQ+jTXN3B5KhC1hL74OzjNWoqzM4xBX0e3f8lU
	1h1AEWtyBp5SwnadxUffBuAQVl7YrkPy40eh/yhadcYjPZZy73ApHV/AtU3rqTPCAGGFu6snad4
	JNUA==
X-Gm-Gg: AYBFou0dchc/4U7f1IKh0bu3yz3y5FyHpjQTys/KKNh2Px8QjSoWDYqBihgRc9/2oOC
	Nv4kfoTwrGaLQjCdfM90c3YPduLouQigncMM/S6l/geUs27UKjJzOUiBoiFHvP8kTKDK32Ob1oY
	0fomrAFZaK7ufn4RRscyszfJKX+ko/j7RTaS3rd2j6QqYs08qjnl17XzV6Y6+PILDQAveRbo5GM
	3f88CyROH6kp9nKd6IsExp4AkhhhYenGImEqVMa2gHAEv6KZuPmzsYFcFPkcy/bagoqFUvmi4/O
	bYNHLnQ6z+/hWpEArqLe1Y+MDVu4TWBiVfM21rTUSO8TUvBPBe7cup/4QVE1dGrYouBm4MWAjVI
	lqFbUCmcpiXbv2AzQW1ZH+8KcgniLwF6s1AN7uOZ4AroKQ7bZvlSG0n4b
X-Received: by 2002:a17:90b:5784:b0:39d:f7dc:61e4 with SMTP id 98e67ed59e1d1-39df7dc6273mr246895a91.9.1789378810118;
        Mon, 14 Sep 2026 02:40:10 -0700 (PDT)
X-Received: by 2002:a17:90b:5784:b0:39d:f7dc:61e4 with SMTP id 98e67ed59e1d1-39df7dc6273mr246764a91.9.1789378809464;
        Mon, 14 Sep 2026 02:40:09 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:40:09 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:52 +0800
Subject: [PATCH RFC v2 04/10] cacheinfo: Expose the code to generate a
 cache-id from a device_node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-4-bf6645bb2f65@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378762; l=2592;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=MXjxI8aXZOve7L6eY3Z0pfsNkIuJWimjX2RUSvdJo0s=;
 b=JQcH8p0AqmKiGfmEXtpcideR+t4riLV9L99EgGdmABEku5BckK3T4ae3bI4+e/TEVktBRzg2Q
 NpvKlDoiqZKC3MJi40P/aObfObcm4D3qRrfHXjEaX4rezR4jLu254fx
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNiBTYWx0ZWRfX92Sf/pIMgkqm
 Rwe9v5nkHvQScPFEgLzPTGCP1sv7mnn+lRJtMYB/d7oLQsaf3XqnX61j+fNZUTk0HR9/SGhUJ78
 nY+ZJxsPS8L4GuQWTyGroO7Z7+WxABmUTLaRPree8nbDCHuPCJeIMnwAkECJsBKG/e38qiWJ8tM
 mPTHRe+Vq+dFYh/2glNZlE8VyluJKwyS9OlNYITlUT9W5UD9oByje4OYwviGs8dmgyvdyr0rMMP
 Tzx2qUWJeYPiKvs1t4G3kIlyxnPnjC4FRIJ3xAisPMuGzBFJE3odjApT/Jfp2jPfmUbuGqhFFtY
 1hZ05ESM38u0QiG1g98fsxXtk9qLbLOMoVIHRcIs2LslY06vLIGxUbXKngzZKgXMKNm0GRylD6V
 j8p1+Rrtyu3Vb3Pl4lQt1lcUBt9Ly4TGb+U0DGH/T5hZRU0shsphEEdSDBagsO+Z7E7RJP84s2C
 Dt/ucbo+ku8bCUGuADA==
X-Proofpoint-GUID: 8AFoTbjF3JY6MdipPBSV97nNdeaF3ruK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNiBTYWx0ZWRfXy/9iGftuJpCI
 sMn1RMeUTopyQ0GKgvSnr2083YsEx6DR3RBiqoESKgwkLDU5pN3dKcUhr/Q0R3dpc/2wr+MzGMg
 r8OsCwNXe1owgysVm9gcEyyDa/cCemA=
X-Proofpoint-ORIG-GUID: 8AFoTbjF3JY6MdipPBSV97nNdeaF3ruK
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa7c0fa cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NSEGM1D4AEf8_kYA:21 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=YGyWITW8jF7qUHxv7J4A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_024011_492094_92E749C9 
X-CRM114-Status: GOOD (  20.60  )
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

From: James Morse <james.morse@arm.com>

The MPAM driver identifies caches by id for use with resctrl. It
needs to know the cache-id when probe-ing, but the value isn't set
in cacheinfo until device_initcall(). Even after device_initcall(),
the cache-id is only available if at least one CPU associated with
the cache is online.

Instead of making the driver wait, expose the code that generates the
cache-id. The parts of the MPAM driver that run early can use this to
set up the resctrl structures before cacheinfo is ready in
device_initcall().

Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li: fix context conflicts in cacheinfo.c and cacheinfo.h; guard the
  cache_of_calculate_id() declaration with CONFIG_OF to prevent build
  errors when CONFIG_OF is not set ]
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/base/cacheinfo.c  | 17 ++++++++++++-----
 include/linux/cacheinfo.h |  3 +++
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 9f9c72727a05..f75e7f64038b 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -226,8 +226,7 @@ static bool match_cache_node(struct device_node *cpu,
 #define arch_compact_of_hwid(_x)	(_x)
 #endif
 
-static void cache_of_set_id(struct cacheinfo *this_leaf,
-			    struct device_node *cache_node)
+u32 cache_of_calculate_id(struct device_node *cache_node)
 {
 	struct device_node *cpu;
 	u32 min_id = ~0;
@@ -238,15 +237,23 @@ static void cache_of_set_id(struct cacheinfo *this_leaf,
 		id = arch_compact_of_hwid(id);
 		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
 			of_node_put(cpu);
-			return;
+			return ~0;
 		}
 
 		if (match_cache_node(cpu, cache_node))
 			min_id = min(min_id, id);
 	}
 
-	if (min_id != ~0) {
-		this_leaf->id = min_id;
+	return min_id;
+}
+
+static void cache_of_set_id(struct cacheinfo *this_leaf,
+			    struct device_node *cache_node)
+{
+	u32 id = cache_of_calculate_id(cache_node);
+
+	if (id != ~0) {
+		this_leaf->id = id;
 		this_leaf->attributes |= CACHE_ID;
 	}
 }
diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
index fc879ac4cc4f..c33bb3c8bd63 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -113,6 +113,9 @@ int acpi_get_cache_info(unsigned int cpu,
 #endif
 
 const struct attribute_group *cache_get_priv_group(struct cacheinfo *this_leaf);
+#ifdef CONFIG_OF
+u32 cache_of_calculate_id(struct device_node *np);
+#endif
 
 /*
  * Get the cacheinfo structure for the cache associated with @cpu at

-- 
2.34.1


