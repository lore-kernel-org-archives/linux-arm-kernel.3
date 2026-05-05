Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF51FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 12:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWsFFMNfVlraN9koczmb/sKMFEkm65rQ61A6AS0zXkE=; b=h4e6Cn1jigsq2yX8zd139rXB+R
	RhdLSmK2R3cFZNnk6fzoNLs4Vc4qFH6OkaA9hlS8QX8XwLiSUrPjx/QSvWGvNRK/27dHnCmLLDrJd
	ivuQCllRd40J3ljQoARPUf1gb9BHNoSLTp0Mx9+lvUBO9qdiTKuocvxXcALv3p7uZmZLC3wRc4buZ
	q3LY4K5joHQgUnVYkhlO/EMlSIR2U4aR5Q365bLUDoTM+u4S9b4DKKreD4OU8dH6pXfPC2VVZ7965
	jf/3khgLBxANNHkuEVIRPVlfz+Rm5nQCV+f08JYRIpKki3rcO+0BF9mwNjzXqWGW3jlakxNrWSWfs
	IERG0mlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEpi-0000000GAVf-3Ul7;
	Tue, 05 May 2026 12:25:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKEpg-0000000GAV2-3aoH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 12:25:02 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6458DSHS1346374
	for <linux-arm-kernel@lists.infradead.org>; Tue, 5 May 2026 12:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iWsFFMNfVlraN9koczmb/sKMFEkm65rQ61A6AS0zXkE=; b=In5OnYwrOosFvrc4
	229iIEoWGlI9oNLndzcldyoMyZUPv6/qN3n9YXP+e0rgWzFhyO4VdDJ2fc2YxyVY
	oDrnbwG0aYkUhSVXUeuTDfbemwTLxuydv9CCxC4XXqJoCFHuwuqAOuDemHDx7M72
	kb/mKcXyzQxlq9nNyoRauCHctrAYxmmUIgnpTSI5YBnJAsd7yfxbZ3qYmes0jYZx
	5Nxo4K1K1wzgSB7sSXzYom/TXly1FlrBF8wJhzBaNLATiyQBqZq0GC5zPlVldxOL
	AfiP828DFl8hJB3790buiORDsWtSZoh3+E781v0z9diF0bY6H/X4F7Rpc9t8suif
	CzSXUQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx2xc0qf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 12:25:00 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c822bc6ff86so202516a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 05:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777983899; x=1778588699; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iWsFFMNfVlraN9koczmb/sKMFEkm65rQ61A6AS0zXkE=;
        b=HXIXxVW1spPZHT3LCM2yq2/PuhjmatPkm5yU601tlyVY/COZPRffjcMEism/YL7RXn
         KtiC/AUxXMsxsDVY0g6m6nllqXNIIxIp3iqVSzpeHUHOEqL/x2h4iRKYj5OSWrhzJk5A
         KJ7nCh4giTqoUYkrGvj78QUEvFvf++7YwdKpO3SU0oamVAbHpMFYhndKJupNlZU7GXQz
         dfsWZUzwtp6Ckm7sU4EBhFtNrL2s469kSmlhXzICXzxpXwQUCn+G4DeDLydB5kXJqCnB
         yt3clQF846S6/DyV0J6NTZFevwe0bBYJ7GZq5mh4Qm8qHDCfv8jf9g2I9YUA3qv/UHvz
         3N8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983899; x=1778588699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iWsFFMNfVlraN9koczmb/sKMFEkm65rQ61A6AS0zXkE=;
        b=kL4v1RVf8noS3Y/w6BoTQsVWR0fynFXhe7SJKvg+gxI/wss7YK0B+nmCCQZoe55RIL
         Jag3LqLSh+QP6otxLkE+8zV93SbGb4AmWPNFxtTRWz2qfSNrBJdEdQQTzQlWEYQjdspn
         3TH4Xlg8WpS1rVP04LHPU89OX7EsGUZcyhuCOUKMaxP4kv0KZyoEZpXn9xQhbXS47r7S
         SSgbvYhZYJkxhwzdiXsXwE3n3XNduPiE3/2KBTzuwbDmgxUlrfoEOCkXcK4GItJgYpLj
         1HfGpQhMe9pzprXk+gU/KcAOrFpSioQKNCKalq0A8ypBHdbvXuWzzVE0Q3yv0wOdojpz
         ai8A==
X-Forwarded-Encrypted: i=1; AFNElJ+Wk2NI99IdgnQHpjrZTxrDTGcS+sbdDkgKAIJINu2w2OTZ4TLNBkhgM3xpVNuGbtXjpqS3t09mA0FtsK6N0GDM@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwww6z42Z1JlwsSdthGiPvo/u4SrPxLeLmsWzhwcqtFjjn1YF7
	jMmdObCvVEVabtR8ZvuAubbFm/XS3v5EpM2Wc1pkYUSUsjQkp6R/Z9Ab7a6JMCPUBMB1YfaerWv
	2oaQFUUv6mgvy/1pDhKhqCAg9XbSZbACJSyRj/gi/vlP83p9K0Wo3LRJPFh3O72Y8bRdlrB0lI9
	1RAh6wtJ9pEA==
X-Gm-Gg: AeBDieskdMiyF3y7UCa81z+PF124hTUkrpzun4p2MJ2BYD8YKoQKpX2FpFBK8Xuu+C8
	6RY9C3PDLtzP1uq60qZ+2ceVC4e22CKdpjrDIJ8an28lLfdiwnOBcz9hKw+uMMR5o6mVXYcH7rx
	W+MhvEhaYhrUyjuFdTqLsqPIFL1zZXLZBGRmY+eD0bJUGcSsjRsOX7+1CMhCNLuv3s2FqOtVNYM
	gWevMKy9/CyH6hSESZhuixPG5qAPpMPKR9yGnKX3eX2i1DSdQQyv4o1bib7fNsXzN8+uUrpxx82
	jKin1Hv9oU+4UJ9Q8+hCjhk3qdBLWOHpJYtJ9DHdZYUdOA3MWleRhneAvnEJeRUfoAoFeLy3KE5
	AA3IOrFPhSl4Xqaep0Q/Q8qYHgdFmEAkVAYKnkqVWGwyw95eULbxLVZ6sxSiUDYs=
X-Received: by 2002:a05:6a21:7a91:b0:39c:68ed:9a39 with SMTP id adf61e73a8af0-3a7f1cccc9emr7197140637.6.1777983898881;
        Tue, 05 May 2026 05:24:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a91:b0:39c:68ed:9a39 with SMTP id adf61e73a8af0-3a7f1cccc9emr7197093637.6.1777983898325;
        Tue, 05 May 2026 05:24:58 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbbaac5bsm12597998a12.6.2026.05.05.05.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 05:24:57 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
Date: Tue, 05 May 2026 17:53:45 +0530
Subject: [PATCH 1/8] ras: aest: Fix shared processor node handling and
 error log messages
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260505-aest-devicetree-support-v1-1-d5d6ffacf0a5@oss.qualcomm.com>
References: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
In-Reply-To: <20260505-aest-devicetree-support-v1-0-d5d6ffacf0a5@oss.qualcomm.com>
To: Ruidong Tian <tianruidond@linux.alibaba.com>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, catalin.marinas@arm.com,
        will@kernel.org, lpieralisi@kernel.org, rafael@kernel.org,
        mark.rutland@arm.com, Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-edac@vger.kernel.org,
        Umang Chheda <umang.chheda@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777983885; l=6543;
 i=umang.chheda@oss.qualcomm.com; s=20260328; h=from:subject:message-id;
 bh=VI5F8t3DU2L32PPNZQHlAorz7SO6vTHnNS9mo4ZneVE=;
 b=6faC5/GEh5FwFL2OgPM+ezzK5byXA+KdZ7TJce1TC337AuIA1fKkKcfxOExCMlDv938Fkt0LW
 6jmLHyuiasQDc5iy7BsY6vFF3Lv51LzJ4RKX9eYWynnQF1Ru28y5l3Z
X-Developer-Key: i=umang.chheda@oss.qualcomm.com; a=ed25519;
 pk=3+tjZ+PFFYphz0Vvu4B14pBQSzqcG0jZAQspTaDRQYA=
X-Authority-Analysis: v=2.4 cv=U9eiy+ru c=1 sm=1 tr=0 ts=69f9e19c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=KYcbzuZsfW-uCfy2wYUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: otlvj52-d_McZG4E2VY1dBJeSs_N6Acc
X-Proofpoint-GUID: otlvj52-d_McZG4E2VY1dBJeSs_N6Acc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDExNyBTYWx0ZWRfXzS0G5xN+VRjj
 MtpuQKQ7ma3pX0jg0mueptUf8DySsk5J2Uatlgat1qcUpi5ZSNSpQmRKkEW9b+AVHlzGCKw0G0Q
 zpp0yNzHQM0nhXJNFmHT4MJ4r0mvwaU21zzleVAFfvydcEZ67+6dMgpCF+BWKkyMtNcMXVj/rKA
 hHdAkleZF4wQFiYqO/QzjBhDbWUAJiXvpVVjz7gOTZdiII8GqVARb7J+0w68041pxgukP16OJJ1
 6Xv0KMn9e1lqAsYRIFEjErNvLEX0Ptf4oAaOBGxX27WJXNDzmyktQyzTvXiDB9bzUDpbKRyKxXM
 CaGrD7uUBindVHK9ySj//LqAYOmud/USJ4vb3pkDV3jnLDpCA/YmWWZP+PgL+uZ1lrkpPG+a1Kb
 f3t3400KWTSDVhC7Jg6cPw8ppt6AbmG34rQ3osBR9V6ECKtZswQgzvT5jx+B08m2ZJe5tE7pvUo
 GB7DixTo6Kv7q3kNhrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_052500_929639_1181CCF4 
X-CRM114-Status: GOOD (  24.07  )
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

Two related fixes for processor nodes with ACPI_AEST_PROC_FLAG_SHARED
or ACPI_AEST_PROC_FLAG_GLOBAL set (e.g. cluster L3 cache, DSU):

1. aest_dev_is_oncore() returns true for any PROCESSOR_ERROR_NODE,
   causing shared processor nodes (which use an SPI) to take the
   cpuhp/PPI path.  cpuhp_setup_state() is called instead of
   aest_online_dev(), so aest_config_irq() is never called and the
   hardware IRQ-config register is never programmed.

   Fix aest_dev_is_oncore() to check irq_is_percpu() on the registered
   IRQ.  Only nodes whose FHI or ERI is a per-CPU PPI take the oncore
   path, nodes with an SPI take aest_online_dev().

2. alloc_aest_node_name() uses processor_id for the node name of all
   processor nodes.  Shared/global nodes have processor_id=0 (the
   field is unused when SHARED/GLOBAL is set), so every shared node
   and the per-PE node for CPU 0 both got the name "processor.0",
   making error logs ambiguous.

   For shared/global nodes, build the name as
   "processor.<resource_type>.<device_id>" (e.g. "processor.cache.1")
   so each node has a unique, meaningful identifier.  Per-PE nodes
   keep the original "processor.<mpidr>" form.

   Also add proc_flags to struct aest_event so aest_print() can
   distinguish shared from per-PE nodes and print an appropriate
   message.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
 drivers/ras/aest/aest-core.c | 54 ++++++++++++++++++++++++++++++++++++++++----
 drivers/ras/aest/aest.h      | 15 +++++++++++-
 2 files changed, 64 insertions(+), 5 deletions(-)

diff --git a/drivers/ras/aest/aest-core.c b/drivers/ras/aest/aest-core.c
index 6a2d84b47721..b4f4c975da1d 100644
--- a/drivers/ras/aest/aest-core.c
+++ b/drivers/ras/aest/aest-core.c
@@ -49,7 +49,19 @@ static void aest_print(struct aest_event *event)
 
 	switch (event->type) {
 	case ACPI_AEST_PROCESSOR_ERROR_NODE:
-		pr_err("%s Error from CPU%d\n", pfx_seq, event->id0);
+		/*
+		 * For shared/global nodes (e.g. cluster L3 cache, DSU),
+		 * id0 is the CPU that handled the interrupt — not the error
+		 * source itself.  The node_name already identifies the resource
+		 * (e.g. "processor.cache.1").  Print a distinct message so the
+		 * log is not confused with a per-PE CPU error.
+		 */
+		if (event->proc_flags &
+		    (ACPI_AEST_PROC_FLAG_SHARED | ACPI_AEST_PROC_FLAG_GLOBAL))
+			pr_err("%s Error from shared processor resource (interrupt handled on CPU%d)\n",
+			       pfx_seq, event->id0);
+		else
+			pr_err("%s Error from CPU%d\n", pfx_seq, event->id0);
 		break;
 	case ACPI_AEST_MEMORY_ERROR_NODE:
 		pr_err("%s Error from memory at SRAT proximity domain %#x\n",
@@ -133,6 +145,7 @@ static void init_aest_event(struct aest_event *event,
 				info->processor->processor_id);
 
 		event->id1 = info->processor->resource_type;
+		event->proc_flags = info->processor->flags;
 		break;
 	case ACPI_AEST_MEMORY_ERROR_NODE:
 		event->id0 = info->memory->srat_proximity_domain;
@@ -175,6 +188,7 @@ static int aest_node_gen_pool_add(struct aest_device *adev,
 	if (!event)
 		return -ENOMEM;
 
+	memset(event, 0, sizeof(*event));
 	init_aest_event(event, record, regs);
 	llist_add(&event->llnode, &adev->event_list);
 
@@ -730,9 +744,41 @@ static char *alloc_aest_node_name(struct aest_node *node)
 
 	switch (node->type) {
 	case ACPI_AEST_PROCESSOR_ERROR_NODE:
-		name = devm_kasprintf(node->adev->dev, GFP_KERNEL, "%s.%d",
-				      aest_node_name[node->type],
-				      node->info->processor->processor_id);
+		/*
+		 * Shared/global processor nodes (e.g. cluster L3 cache, DSU)
+		 * have processor_id=0 and use smp_processor_id() at error-log
+		 * time — using processor_id in the name would produce the same
+		 * "processor.0" string for every shared node and every CPU0
+		 * per-PE node, making logs ambiguous.
+		 *
+		 * For shared/global nodes, build the name from the resource
+		 * type and the device id so each node gets a unique, meaningful
+		 * name (e.g. "processor.cache.1", "processor.tlb.2").
+		 *
+		 * For per-PE nodes, keep the original "processor.<mpidr>" form.
+		 */
+		if (node->info->processor->flags &
+		    (ACPI_AEST_PROC_FLAG_SHARED | ACPI_AEST_PROC_FLAG_GLOBAL)) {
+			static const char *const res_name[] = {
+				[ACPI_AEST_CACHE_RESOURCE]   = "cache",
+				[ACPI_AEST_TLB_RESOURCE]     = "tlb",
+				[ACPI_AEST_GENERIC_RESOURCE] = "generic",
+			};
+			u8 rtype = node->info->processor->resource_type;
+			const char *rstr = (rtype < ARRAY_SIZE(res_name) &&
+				res_name[rtype]) ? res_name[rtype] : "unknown";
+
+			name = devm_kasprintf(node->adev->dev, GFP_KERNEL,
+					      "%s.%s.%d",
+					      aest_node_name[node->type],
+					      rstr,
+					      node->adev->id);
+		} else {
+			name = devm_kasprintf(node->adev->dev, GFP_KERNEL,
+					      "%s.%d",
+					      aest_node_name[node->type],
+					      node->info->processor->processor_id);
+		}
 		break;
 	case ACPI_AEST_MEMORY_ERROR_NODE:
 	case ACPI_AEST_SMMU_ERROR_NODE:
diff --git a/drivers/ras/aest/aest.h b/drivers/ras/aest/aest.h
index 9d67d79eb4a2..9704af97fee8 100644
--- a/drivers/ras/aest/aest.h
+++ b/drivers/ras/aest/aest.h
@@ -8,6 +8,7 @@
 #include <linux/acpi_aest.h>
 #include <asm/ras.h>
 #include <linux/debugfs.h>
+#include <linux/irqdesc.h>
 
 #define MAX_GSI_PER_NODE 2
 #define DEFAULT_CE_THRESHOLD 1
@@ -94,6 +95,8 @@ struct aest_event {
 	/* Vendor node	: hardware ID. */
 	char *hid;
 	u32 index;
+	/* Processor node: ACPI_AEST_PROC_FLAG_* bitmask (SHARED/GLOBAL) */
+	u8 proc_flags;
 	u64 ce_threshold;
 	int addressing_mode;
 	struct ras_ext_regs regs;
@@ -387,7 +390,17 @@ static inline void aest_sync(struct aest_node *node)
 
 static inline bool aest_dev_is_oncore(struct aest_device *adev)
 {
-	return adev->type == ACPI_AEST_PROCESSOR_ERROR_NODE;
+	/*
+	 * A processor node is "on-core" (uses PPI + cpuhp) only when its
+	 * interrupt is a per-CPU PPI.  A shared processor node (e.g. cluster
+	 * L3 cache, DSU) uses an SPI and must follow the non-oncore path
+	 * (aest_online_dev) so that aest_config_irq and aest_online_dev are
+	 * called instead of cpuhp_setup_state.
+	 */
+	if (adev->type != ACPI_AEST_PROCESSOR_ERROR_NODE)
+		return false;
+	return irq_is_percpu(adev->irq[ACPI_AEST_NODE_FAULT_HANDLING]) ||
+	       irq_is_percpu(adev->irq[ACPI_AEST_NODE_ERROR_RECOVERY]);
 }
 
 static inline int default_errgsr_mapping(int errgsr_bit)

-- 
2.34.1


