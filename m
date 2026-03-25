Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C38103A9A9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 11:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VhGHqC2XDynARGpL/uIgYPGZtNXC+dk0e9MA3p7JUHk=; b=fjoI4PeUkzQMpuNMA+SkHy4gKZ
	yO48HVEwTuRFQbmZF7r254RvvF35WZGor2V0oZE3TZ55hbKwp9h75NpSocNKU/vtB5xV5P3a199NW
	/6HuXc3RSy6PD92UAMYihzLE1SOdUpUGMIKjaRKh+3FBcBFogndrqNKH+4Ftrcy+noUSlnFyRzANo
	CHC5HGh0af9rlW3mqSZmi2pnjufz0OmYjP5sKZ6J+FGI9Up6+qLpWZeOyhn30YcH6gMlF9JSme4Uv
	Gm2xTM1uczV7kJ6xk75ad5jC57MVqmW3+c3b8JAes8iGCrBLl5pBknsLROXnZEhrurohnycHDsXwS
	7aCdFpCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5M7U-00000003E5q-2g3D;
	Wed, 25 Mar 2026 11:09:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5M7O-00000003E1Y-02YK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 11:09:47 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PAkEER658605
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 11:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VhGHqC2XDynARGpL/uIgYPGZtNXC+dk0e9MA3p7JUHk=; b=QSLCAAHeqJ/rairq
	W2AtAZldN7c3QxFk9yF70tP94pLAUW2pXBnpdsQKVqgKyF8q7kaRIvRgPvd+b/US
	3OLsC0pZ66M1zeiyfNbWDIHJDKAhjaSVrRJ5mjDyLYPEPuyc26TebrdxPWlfMQVN
	mj7hu+E9Lj6Qg40bB219wN0qc69SKSjLAShY/VoxHO+teX7IS59RzAeDcKgGEpLS
	3MObOD6EqSwJlRoC3qexEzo04zPXC5hojgaLj6TOk1zHIyaprP3NACjNwSHx0HXp
	jkWv/b0pKp+d/Txcp6HI5W8g2Z6A3N3KrWy1Hcqc3LauI8k2DPKKvEWumiHNj6Zc
	IppduA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d489whf29-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 11:09:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7414179cceso3238165a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 04:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774436984; x=1775041784; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VhGHqC2XDynARGpL/uIgYPGZtNXC+dk0e9MA3p7JUHk=;
        b=NFoyE8QA1+ekfmLEnhygDDtpy2JtY8HM26IN8pLTj/eZBXFUh4mMZrNlvvlygrkAAK
         vwNBkDpjDEiQJHszg2PaPziMfcT0aMOUnJonDiy2bddYix5jv1E4dZDjLokiFTQNgASM
         yILYFcxFxX77GpI0FVHL8x/PJ8Yl7etspVTkm1LvHZRoSQ5BE3r+LL49hRxb2SKp/Jaq
         WKws9R5SJtZudzYU1k1OPZj0HnRLhN006zNiKGXKlFI3dMma8GJCZ0U/XwIZ9b3LhSs+
         yGi6ANZdEP3cFVkf+He0SHHhtWP5Fnwm3ONVGMvUpN3kP/uJ6DrQmjX6IxzA3QC+emx6
         dwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774436984; x=1775041784;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VhGHqC2XDynARGpL/uIgYPGZtNXC+dk0e9MA3p7JUHk=;
        b=Wat8rIP5iDsyc/a0qLv2JMSyh1l/Qfrb2gvytfA8YddsDbMn9JjxOmy/KJphepbmFm
         9o4u/6HaodgQkdfLn8rjZnPA+N5pgigT27T8agqU0g8gbZXWI7WcpWJ0eRM/Z1audNCf
         ybes7oHfN8PA/pCMwjh9BFa9tE+7ZfhIErqBxj1zM5tRoCP4g3ccB2va6eM3XR4sPfD/
         w3rqReyp91FQijMnpqPvLE6k8pe1OiXuUDmyUP4OdRe1jgjMr1E6tMH5F6fbuICqMfqD
         gn9HgdMFRiQEno2pO8ai4eUW2z2CPaIa7rNDj/fSZeYMsM6Xut6U4eKMUMk734Sxvj82
         4Rfg==
X-Forwarded-Encrypted: i=1; AJvYcCVrfiUPtFM+tBPfQoppuWJhZzbkM/j1ClYhgFSvaDy7pTdex1J/rQR2xwulMS/VX0LFbXzkKl+kIJ82VkACKIEY@lists.infradead.org
X-Gm-Message-State: AOJu0YwdyV9gJ2T5oz0jC5/Z8Sn8gWgWPnGwjGk3Fq53RBD1mLLqLLwu
	EJyKzMRQsXEYoMkuX+ldMRCevJjtjtRkPCD8ufln/O7u6rvL0vs9D0wphkVbx1CxZHRPmUqJJ5d
	dTjIVLvcewQKfHnqFDoISEZvolaA4E2k6B+PkqFULIEtF1kGOGjr5v2UrvGoSzoA8fKjEa2xBq3
	k4RA==
X-Gm-Gg: ATEYQzxOmC4Cuz/nIfTTnC3dQz3BPzJkffMa22M8SyDPC6S02wB3lJ0qCYa5vVt+Rp+
	Nu47IXG/kB2fr3Nm5LEWlwhlgS3rSAWDv6oo2hx5AfY1hJFBb1zEsYJYO+w0sdDqJOIpfMGkdbA
	oIMNXYc9ldimbYR2UI9TP+yJ+3krIJTLekK7Twu0TuOZGq9bndlkB+X3Xcde/m3bG9Pq6aWiPqI
	kywO45B7ODse5/ZQpGcuTig2ZmDFOUjFnSParWbdBI9mfG7LVQ9T01lFkkX1RL0547ZEe7Vp0TS
	5pPBaVHSO7obd7W6i4zIS3wa0k426dACqz/i7Xq0sPaQ8Ytqg/nw0H3cJDe/PcEqWQzpudQ9UFn
	4KRiNf2mbz4wKUedOriy8SEsK72BcPV6pzwsY0Tu846kLLj9t0yX2747n
X-Received: by 2002:a05:6a00:4fd4:b0:82c:2180:32e1 with SMTP id d2e1a72fcca58-82c6df87d2bmr2941820b3a.30.1774436983600;
        Wed, 25 Mar 2026 04:09:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:4fd4:b0:82c:2180:32e1 with SMTP id d2e1a72fcca58-82c6df87d2bmr2941761b3a.30.1774436982988;
        Wed, 25 Mar 2026 04:09:42 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b040da7besm14615911b3a.49.2026.03.25.04.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:09:42 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 16:38:24 +0530
Subject: [PATCH v11 3/3] of: Respect #{iommu,msi}-cells in maps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-parse_iommu_cells-v11-3-1fefa5c0e82c@oss.qualcomm.com>
References: <20260325-parse_iommu_cells-v11-0-1fefa5c0e82c@oss.qualcomm.com>
In-Reply-To: <20260325-parse_iommu_cells-v11-0-1fefa5c0e82c@oss.qualcomm.com>
To: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774436939; l=11993;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=hhxFww84fiqdRnnSRnrS9vJjSjcq+XxylCTlpd3SMkE=;
 b=Us5vY/aPE5SlHmBokg/zubXLlUcnC104O2IL+pQVmfERbJAGAGDMwtGVFIs7pepIAUzGXYtVz
 BTwRA0K6JNYB0x3hR61JI70vT2yYKvdLkJwexsJ8go6z2MWSSMHveGS
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-GUID: m7VgaldYP_c8lhIeQbPINep4w2t30RKH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3OSBTYWx0ZWRfX8hIgqC95s+TD
 PyrRFtcQwXcAIGTkq/rrZwJ9Q1MSDaqDrepI6Qwtd8zzXg8hYnNgttKM4S+BVIMm8Z4N81tlzaS
 ViBCzlX7DjdyqDM/CwuZXo4Kz4XhgqPQ0kP4umOp2fA8Lt40IIfpEpW72x5ABEJ5knIjLJsPKaJ
 d4loeR7FymPMKMPTUBiyCWlNMND/XOwSywjBn2NflvCNDjAZZbAVJ3hcB1rQaOGPbjsN2cRN9tK
 6b4n0TCjjFYk7xr0hCc8Mz0Av8nkQVyTS0pX9U25JMMHunMXgHQsIMWwp6/+JlSKAoPdM1SXH76
 2YhCq33eLhOEEh3g1y4pFOq7rTsh9dJkX+JLF6iXtOBE7o67SEKN/4Jlz9wHz9QNOa6Z0247YsJ
 RBrm7C6SX8WOoq4l1R7we9zQf//5pPVxI9oMl+LJdn1CbdV0QOpYFzKQ0WiRXYM7iw5+HzZ2aA9
 37ZD9U4AeGvFVuwIpCA==
X-Authority-Analysis: v=2.4 cv=e/gLiKp/ c=1 sm=1 tr=0 ts=69c3c278 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=klF1l1D6msg2vEcBgDUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: m7VgaldYP_c8lhIeQbPINep4w2t30RKH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0 adultscore=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_040946_195703_51F53BD2 
X-CRM114-Status: GOOD (  30.49  )
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

From: Robin Murphy <robin.murphy@arm.com>

So far our parsing of {iommu,msi}-map properties has always blindly
assumed that the output specifiers will always have exactly 1 cell.
This typically does happen to be the case, but is not actually enforced
(and the PCI msi-map binding even explicitly states support for 0 or 1
cells) - as a result we've now ended up with dodgy DTs out in the field
which depend on this behaviour to map a 1-cell specifier for a 2-cell
provider, despite that being bogus per the bindings themselves.

Since there is some potential use in being able to map at least single
input IDs to multi-cell output specifiers (and properly support 0-cell
outputs as well), add support for properly parsing and using the target
nodes' #cells values, albeit with the unfortunate complication of still
having to work around expectations of the old behaviour too.

Since there are multi-cell output specifiers, the callers of of_map_id()
may need to get the exact cell output value for further processing.
Update of_map_id() to set args_count in the output to reflect the actual
number of output specifier cells.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
---
 drivers/of/base.c  | 155 ++++++++++++++++++++++++++++++++++++++++-------------
 include/linux/of.h |   6 ++-
 2 files changed, 123 insertions(+), 38 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index b3d002015192..7b22e2484e1c 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2096,18 +2096,48 @@ int of_find_last_cache_level(unsigned int cpu)
 	return cache_level;
 }
 
+/*
+ * Some DTs have an iommu-map targeting a 2-cell IOMMU node while
+ * specifying only 1 cell. Fortunately they all consist of value '1'
+ * as the 2nd cell entry with the same target, so check for that pattern.
+ *
+ * Example:
+ *	IOMMU node:
+ *		#iommu-cells = <2>;
+ *
+ *	Device node:
+ *		iommu-map = <0x0000 &smmu 0x0000 0x1>,
+ *			    <0x0100 &smmu 0x0100 0x1>;
+ */
+static bool of_check_bad_map(const __be32 *map, int len)
+{
+	__be32 phandle = map[1];
+
+	if (len % 4)
+		return false;
+	for (int i = 0; i < len; i += 4) {
+		if (map[i + 1] != phandle || map[i + 3] != cpu_to_be32(1))
+			return false;
+	}
+	return true;
+}
+
 /**
  * of_map_id - Translate an ID through a downstream mapping.
  * @np: root complex device node.
  * @id: device ID to map.
  * @map_name: property name of the map to use.
+ * @cells_name: property name of target specifier cells.
  * @map_mask_name: optional property name of the mask to use.
  * @filter_np: optional device node to filter matches by, or NULL to match any.
  *	If non-NULL, only map entries targeting this node will be matched.
  * @arg: pointer to a &struct of_phandle_args for the result. On success,
- *	@arg->args[0] will contain the translated ID. If a map entry was
- *	matched, @arg->np will be set to the target node with a reference
- *	held that the caller must release with of_node_put().
+ *	@arg->args_count will be set to the number of output specifier cells
+ *	as defined by @cells_name in the target node, and
+ *	@arg->args[0..args_count-1] will contain the translated output
+ *	specifier values. If a map entry was matched, @arg->np will be set
+ *	to the target node with a reference held that the caller must release
+ *	with of_node_put().
  *
  * Given a device ID, look up the appropriate implementation-defined
  * platform ID and/or the target device which receives transactions on that
@@ -2116,17 +2146,19 @@ int of_find_last_cache_level(unsigned int cpu)
  * Return: 0 on success or a standard error code on failure.
  */
 int of_map_id(const struct device_node *np, u32 id,
-	       const char *map_name, const char *map_mask_name,
+	       const char *map_name, const char *cells_name,
+	       const char *map_mask_name,
 	       const struct device_node *filter_np, struct of_phandle_args *arg)
 {
 	u32 map_mask, masked_id;
-	int map_len;
+	int map_bytes, map_len, offset = 0;
+	bool bad_map = false;
 	const __be32 *map = NULL;
 
 	if (!np || !map_name || !arg)
 		return -EINVAL;
 
-	map = of_get_property(np, map_name, &map_len);
+	map = of_get_property(np, map_name, &map_bytes);
 	if (!map) {
 		if (filter_np)
 			return -ENODEV;
@@ -2136,11 +2168,9 @@ int of_map_id(const struct device_node *np, u32 id,
 		return 0;
 	}
 
-	if (!map_len || map_len % (4 * sizeof(*map))) {
-		pr_err("%pOF: Error: Bad %s length: %d\n", np,
-			map_name, map_len);
-		return -EINVAL;
-	}
+	if (map_bytes % sizeof(*map))
+		goto err_map_len;
+	map_len = map_bytes / sizeof(*map);
 
 	/* The default is to select all bits. */
 	map_mask = 0xffffffff;
@@ -2153,39 +2183,82 @@ int of_map_id(const struct device_node *np, u32 id,
 		of_property_read_u32(np, map_mask_name, &map_mask);
 
 	masked_id = map_mask & id;
-	for ( ; map_len > 0; map_len -= 4 * sizeof(*map), map += 4) {
+
+	while (offset < map_len) {
 		struct device_node *phandle_node;
-		u32 id_base = be32_to_cpup(map + 0);
-		u32 phandle = be32_to_cpup(map + 1);
-		u32 out_base = be32_to_cpup(map + 2);
-		u32 id_len = be32_to_cpup(map + 3);
+		u32 id_base, phandle, id_len, id_off, cells = 0;
+		const __be32 *out_base;
+
+		if (map_len - offset < 2)
+			goto err_map_len;
+
+		id_base = be32_to_cpup(map + offset);
 
 		if (id_base & ~map_mask) {
-			pr_err("%pOF: Invalid %s translation - %s-mask (0x%x) ignores id-base (0x%x)\n",
-				np, map_name, map_name,
-				map_mask, id_base);
+			pr_err("%pOF: Invalid %s translation - %s (0x%x) ignores id-base (0x%x)\n",
+			       np, map_name, map_mask_name, map_mask, id_base);
 			return -EFAULT;
 		}
 
-		if (masked_id < id_base || masked_id >= id_base + id_len)
-			continue;
-
+		phandle = be32_to_cpup(map + offset + 1);
 		phandle_node = of_find_node_by_phandle(phandle);
 		if (!phandle_node)
 			return -ENODEV;
 
+		if (!bad_map && of_property_read_u32(phandle_node, cells_name, &cells)) {
+			pr_err("%pOF: missing %s property\n", phandle_node, cells_name);
+			of_node_put(phandle_node);
+			return -EINVAL;
+		}
+
+		if (map_len - offset < 3 + cells) {
+			of_node_put(phandle_node);
+			goto err_map_len;
+		}
+
+		if (offset == 0 && cells == 2) {
+			bad_map = of_check_bad_map(map, map_len);
+			if (bad_map) {
+				pr_warn_once("%pOF: %s mismatches target %s, assuming extra cell of 0\n",
+					     np, map_name, cells_name);
+				cells = 1;
+			}
+		}
+
+		out_base = map + offset + 2;
+		offset += 3 + cells;
+
+		id_len = be32_to_cpup(map + offset - 1);
+		if (id_len > 1 && cells > 1) {
+			/*
+			 * With 1 output cell we reasonably assume its value
+			 * has a linear relationship to the input; with more,
+			 * we'd need help from the provider to know what to do.
+			 */
+			pr_err("%pOF: Unsupported %s - cannot handle %d-ID range with %d-cell output specifier\n",
+			       np, map_name, id_len, cells);
+			of_node_put(phandle_node);
+			return -EINVAL;
+		}
+		id_off = masked_id - id_base;
+		if (masked_id < id_base || id_off >= id_len) {
+			of_node_put(phandle_node);
+			continue;
+		}
+
 		if (filter_np && filter_np != phandle_node) {
 			of_node_put(phandle_node);
 			continue;
 		}
 
 		arg->np = phandle_node;
-		arg->args[0] = masked_id - id_base + out_base;
-		arg->args_count = 1;
+		for (int i = 0; i < cells; i++)
+			arg->args[i] = id_off + be32_to_cpu(out_base[i]);
+		arg->args_count = cells;
 
 		pr_debug("%pOF: %s, using mask %08x, id-base: %08x, out-base: %08x, length: %08x, id: %08x -> %08x\n",
-			np, map_name, map_mask, id_base, out_base,
-			id_len, id, masked_id - id_base + out_base);
+			np, map_name, map_mask, id_base, be32_to_cpup(out_base),
+			id_len, id, id_off + be32_to_cpup(out_base));
 		return 0;
 	}
 
@@ -2196,6 +2269,10 @@ int of_map_id(const struct device_node *np, u32 id,
 	arg->args[0] = id;
 	arg->args_count = 1;
 	return 0;
+
+err_map_len:
+	pr_err("%pOF: Error: Bad %s length: %d\n", np, map_name, map_bytes);
+	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(of_map_id);
 
@@ -2205,18 +2282,21 @@ EXPORT_SYMBOL_GPL(of_map_id);
  * @id: Requester ID of the device (e.g. PCI RID/BDF or a platform
  *      stream/device ID) used as the lookup key in the iommu-map table.
  * @arg: pointer to a &struct of_phandle_args for the result. On success,
- *	@arg->args[0] contains the translated ID. If a map entry was matched,
- *	@arg->np holds a reference to the target node that the caller must
- *	release with of_node_put().
+ *	@arg->args_count will be set to the number of output specifier cells
+ *	and @arg->args[0..args_count-1] will contain the translated output
+ *	specifier values. If a map entry was matched, @arg->np holds a
+ *	reference to the target node that the caller must release with
+ *	of_node_put().
  *
- * Convenience wrapper around of_map_id() using "iommu-map" and "iommu-map-mask".
+ * Convenience wrapper around of_map_id() using "iommu-map", "#iommu-cells",
+ * and "iommu-map-mask".
  *
  * Return: 0 on success or a standard error code on failure.
  */
 int of_map_iommu_id(const struct device_node *np, u32 id,
 		    struct of_phandle_args *arg)
 {
-	return of_map_id(np, id, "iommu-map", "iommu-map-mask", NULL, arg);
+	return of_map_id(np, id, "iommu-map", "#iommu-cells", "iommu-map-mask", NULL, arg);
 }
 EXPORT_SYMBOL_GPL(of_map_iommu_id);
 
@@ -2229,17 +2309,20 @@ EXPORT_SYMBOL_GPL(of_map_iommu_id);
  *	to match any. If non-NULL, only map entries targeting this node will
  *	be matched.
  * @arg: pointer to a &struct of_phandle_args for the result. On success,
- *	@arg->args[0] contains the translated ID. If a map entry was matched,
- *	@arg->np holds a reference to the target node that the caller must
- *	release with of_node_put().
+ *	@arg->args_count will be set to the number of output specifier cells
+ *	and @arg->args[0..args_count-1] will contain the translated output
+ *	specifier values. If a map entry was matched, @arg->np holds a
+ *	reference to the target node that the caller must release with
+ *	of_node_put().
  *
- * Convenience wrapper around of_map_id() using "msi-map" and "msi-map-mask".
+ * Convenience wrapper around of_map_id() using "msi-map", "#msi-cells",
+ * and "msi-map-mask".
  *
  * Return: 0 on success or a standard error code on failure.
  */
 int of_map_msi_id(const struct device_node *np, u32 id,
 		  const struct device_node *filter_np, struct of_phandle_args *arg)
 {
-	return of_map_id(np, id, "msi-map", "msi-map-mask", filter_np, arg);
+	return of_map_id(np, id, "msi-map", "#msi-cells", "msi-map-mask", filter_np, arg);
 }
 EXPORT_SYMBOL_GPL(of_map_msi_id);
diff --git a/include/linux/of.h b/include/linux/of.h
index 8548cd9eb4f1..51ac8539f2c3 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -462,7 +462,8 @@ const char *of_prop_next_string(const struct property *prop, const char *cur);
 bool of_console_check(const struct device_node *dn, char *name, int index);
 
 int of_map_id(const struct device_node *np, u32 id,
-	       const char *map_name, const char *map_mask_name,
+	       const char *map_name, const char *cells_name,
+	       const char *map_mask_name,
 	       const struct device_node *filter_np, struct of_phandle_args *arg);
 
 int of_map_iommu_id(const struct device_node *np, u32 id,
@@ -934,7 +935,8 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
 }
 
 static inline int of_map_id(const struct device_node *np, u32 id,
-			     const char *map_name, const char *map_mask_name,
+			     const char *map_name, const char *cells_name,
+			     const char *map_mask_name,
 			     const struct device_node *filter_np,
 			     struct of_phandle_args *arg)
 {

-- 
2.34.1


