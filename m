Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE3FCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 08:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXN8U+lu0TOvT7NP9tTGGGw5W2W1/7IB2Iy+LKjXH2U=; b=T48vrwDUSu3s8bmbhUfVisCPxL
	sBoCZpg8z7z3Kv6bSx0dFW7GvbktlXwHifytNsKjeSaLmaMOBQCPhh6xYYFgxEWDzFCoDPkdXtPQN
	OlfNSWaOeUuJ7NdbUOYFoIREmAtAo8xr82q0FhDPBm9r8C9mFkqyS1sMMlSIvQ3qgU8eHxB0TDVA5
	OCrHXXRndU47veJr/5ikhPwz3OY4cav72egnwr2TBPeJaEknDsYHvx0VzStCy1Umeg2oLLFNYY+0J
	ZtlGUaG1P8oL+yCI2kSLlFCMeUewlXdb3oGE8YWMzXzLejTmdLucT2vZMGHxltHo4yNDgG55Qt359
	OFLDFwrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbuF-00000003sqP-1Ph1;
	Wed, 20 May 2026 08:03:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbuD-00000003spN-1xXm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 08:03:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K7cRlo1739337
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:03:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gXN8U+lu0TOvT7NP9tTGGGw5W2W1/7IB2Iy+LKjXH2U=; b=luM+++5cgw90nkNo
	5Zd0jhfTVMw5CDRRadpgCFomLuNTbxIHLp3U6lTjTQCcWznOS5C4xB0FQmcY1ljZ
	OgL3dXMNPmNOcMbfrRnPZQwnHm3KbTosZ6tHrH0IQT6poxwkexxlBTId/cDR/cem
	GEE6UBFCLGcQ5j7zMioKhjmkXcTp0g5D4wwrp9NEsW0wCJKxy5x1584PDOmMjFu9
	johrHH0PgwKI6aix2qxpesOck+IjR/gDowjJUKKXsdtxR/QfKcrc2Pdp8UsfBg8/
	6ZPI0f/UGDNUP2WXxfwRCQMxP4m7AvLTxSblN9cQABYRxslL4HvBKx0xad/ZihTf
	S2ed7g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3qbmvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 08:03:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-366015bca9bso4317773a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 01:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779264231; x=1779869031; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gXN8U+lu0TOvT7NP9tTGGGw5W2W1/7IB2Iy+LKjXH2U=;
        b=G3fqAdriIl5jsZeYovHSQL2ll6MRf/6LYwRkyGmQg9A7Su3vbwXvE/L2Yj4b8/OPXX
         J4EWKHe6xqZE9o+HUnFxA//VorfrO4qd95tCemuJN9ErZX9f6gBDtqOE2UAmF8ZJB5rQ
         A1EsFSyEoRGPfzgQMeLtKy6d19SjG0rYMJuAGlFAjZthzQYksBFm+9p1LHIy8ysuiiCr
         AuCuMErX4Q11wEZlLoTa+074MBtmd/mUeCJuYqWGOaU7zXiK88MRFS9HcDkX8eIKkGK+
         eJSS/G4gW8MTKDWoocdWWA2lHJLwek037DLNdszmqEHpJBfQHDSSycL7HDYa98qlx3/4
         zeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779264231; x=1779869031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gXN8U+lu0TOvT7NP9tTGGGw5W2W1/7IB2Iy+LKjXH2U=;
        b=muKGUPrI3Dv0TQhOfTzodfS9DkYiTDjOcRJUjY2gHAjfYc7VW7zSKJdpp5vSJ0WE84
         2FQZ+xpCEyjnSgYBaUab+xv6GGrOIPNHGMYmcRS8JfP+O1VuVCQ+HN2zyvgM6qQ4AwEP
         Ouya6IpToxvtCkZLkGWRDfJFVF72b2/pMF2PkgArb2zoYXXuigWuTGd9d8EtmCQ6UEU8
         ExEHIUZFwN8CdokzXf8H2+LjnBEfw5c++kv2OnGoosaWMMYvvvgg7BQTuWi2hDX+qU2c
         Cn30lzXMY17OKBFVYJ78zvLGeD/h2a+iZmnBII9s96un+v6FfCcdFYlsqVjaxwLXzMit
         JkWQ==
X-Forwarded-Encrypted: i=1; AFNElJ96tks+tku3BCL6PBMmkrX1v7H1J3BGPNv76I5pKMtwUxoptjJgHAQzHOhazSftDRvlXShfogsIkJe8ZAe+zPpO@lists.infradead.org
X-Gm-Message-State: AOJu0YxviV0QDtj6+6FUSBHARA8b8vLizJ0Ju+8DJGPjMKZhEk9qWXpd
	A2Pb8yf65FoEnhr3TVDaGUXOLWSHd+xIPXr5Rfat1FPcVvI7m7hfHs4HNrFXTjfZ7Eyxacx7CcF
	zBYwojGGa2A08xYeW0ODzxxtmsdEkRDydLybzCoWCfSPb2Ix1bsGYbF5j4na7zsRoEvGzB1120b
	/fwQ==
X-Gm-Gg: Acq92OG/MuhpmXr8vIBcTGgonkzqQrGxcaKYENXq3rHO2gTJbR9XTeUJfF223NTXfLE
	VTbezcin3qMoAbDrs2YsKAEIcLGJzWc2nOzpJ/bqhRxic3ACf63v7ZrxILJcF4eO/XUalsjzVPa
	xEcU6C4a7HSUmPIM0iPkOR795EVpKN6tDSEPooYNNLHYQ+y38jG4Wi8UL3PcaQiBsQULrWD0+sb
	fHhUI1VL0mR9aDij+FV4g9D/PxialApqHqt0nq8nvsL4LUfF10PAj+UGTW8ArsoZh19VzqLBNA8
	zAc8hOS5u81oBSY+5yzpbocWbhYDP2r0MFEdE2l+LzWHWDaTtd0LTkxq5C4wU0qqMUVu/yfHHe+
	1NqkTAFgnCdH0XH28KgWl6fXh2mZOrj0YUZNmohXJQeyifu10jNB/th5D
X-Received: by 2002:a17:90b:38c9:b0:369:9469:aeba with SMTP id 98e67ed59e1d1-3699469b41cmr11587713a91.1.1779264231313;
        Wed, 20 May 2026 01:03:51 -0700 (PDT)
X-Received: by 2002:a17:90b:38c9:b0:369:9469:aeba with SMTP id 98e67ed59e1d1-3699469b41cmr11587664a91.1.1779264230586;
        Wed, 20 May 2026 01:03:50 -0700 (PDT)
Received: from hu-vjitta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-369517aa6f8sm20889290a91.11.2026.05.20.01.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:03:49 -0700 (PDT)
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Date: Wed, 20 May 2026 13:32:42 +0530
Subject: [PATCH v15 3/3] of: Respect #{iommu,msi}-cells in maps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-parse_iommu_cells-v15-3-b5f99ad4e7e8@oss.qualcomm.com>
References: <20260520-parse_iommu_cells-v15-0-b5f99ad4e7e8@oss.qualcomm.com>
In-Reply-To: <20260520-parse_iommu_cells-v15-0-b5f99ad4e7e8@oss.qualcomm.com>
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779264185; l=12523;
 i=vijayanand.jitta@oss.qualcomm.com; s=20260301; h=from:subject:message-id;
 bh=xwYkAEs+q6jRw+I3dHPltl1MmPPWsBwiOXNPNgKt/0c=;
 b=wcATq9lX5Bq1e8erTyBpni5Dih/s1c6wO9/NnG4qxR1ffvxl+OPEk6rtMC5rr4W4VoKcAWrsQ
 FdmlXhXN/pYDkytoi0wtNZgLMf9D1M6bGdq1x4YOiNvy+TxTUK7PV8y
X-Developer-Key: i=vijayanand.jitta@oss.qualcomm.com; a=ed25519;
 pk=Lpi7Cs3wHe8KZtqvyci7FTOLzsKpEHKGCaPNZw+1zRI=
X-Proofpoint-GUID: s2C4lIScMZu-439K4uHXWZanZroVxrve
X-Authority-Analysis: v=2.4 cv=LcMMLDfi c=1 sm=1 tr=0 ts=6a0d6ae8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=9707C7GnR82a18xSEiYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: s2C4lIScMZu-439K4uHXWZanZroVxrve
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA3NiBTYWx0ZWRfX0oZa49FIuQGQ
 hv1eH5fvysRmBwFn56hWiZzBBA8ncwjp+nVP5G4I1SWt7Dzf3HedNTReQ471M8X7Fu/VCUVtMJI
 B22OMUZH9X/7PsEO8h+MEHFHSyM97HO2YrUOsxUR+CHfvH6qz0qrfJUEMZnE5O867dt6pZSnsd5
 68GFPMol1D2E3Hqll7gxxJqpT760Nyg53qlCFnmmPRECuNUpX5/jLpZWIo37oMOLNOBguLvmpQH
 RlkCiZsd4Hp4tBI0honXkBb5zXI34yJb0ZRwDa7Z9eRfywTcMi7qu/Ir/yvxH/kzDskEqLjFQ2T
 hWg0YZ7WZiPT3rFjDItEY5IKWbqW23FIph0S16dhmbfjTI1qQR3BlsP3D2XvmAlPB/YDbCSFH5d
 1k40p6UjZ4biRVn7gHyHqY8y4VUFT1mQ0IhwtbOG/JtBFdiIrKha0nG9Q6LdL6he34hwn3Vl5cY
 kvUrKNLqPrfqBnn1D7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_010353_642333_FD1C6704 
X-CRM114-Status: GOOD (  30.63  )
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
 drivers/of/base.c  | 166 +++++++++++++++++++++++++++++++++++++++++------------
 include/linux/of.h |   6 +-
 2 files changed, 134 insertions(+), 38 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index d658c2620135..f436e2676381 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2116,19 +2116,49 @@ int of_find_last_cache_level(unsigned int cpu)
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
  * @filter_np: pointer to an optional filter node, or NULL to allow bypass.
  *	If non-NULL, the map property must exist (-ENODEV if absent). If
  *	*filter_np is also non-NULL, only entries targeting that node match.
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
@@ -2137,11 +2167,13 @@ int of_find_last_cache_level(unsigned int cpu)
  * Return: 0 on success or a standard error code on failure.
  */
 int of_map_id(const struct device_node *np, u32 id,
-	       const char *map_name, const char *map_mask_name,
+	       const char *map_name, const char *cells_name,
+	       const char *map_mask_name,
 	       struct device_node * const *filter_np, struct of_phandle_args *arg)
 {
 	u32 map_mask, masked_id;
-	int map_len;
+	int map_bytes, map_len, offset = 0;
+	bool bad_map = false;
 	const __be32 *map = NULL;
 
 	if (!np || !map_name || !arg)
@@ -2149,7 +2181,7 @@ int of_map_id(const struct device_node *np, u32 id,
 	/* Ensure bypass/no-match success never returns a stale target node. */
 	arg->np = NULL;
 
-	map = of_get_property(np, map_name, &map_len);
+	map = of_get_property(np, map_name, &map_bytes);
 	if (!map) {
 		if (filter_np)
 			return -ENODEV;
@@ -2159,11 +2191,9 @@ int of_map_id(const struct device_node *np, u32 id,
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
@@ -2176,39 +2206,93 @@ int of_map_id(const struct device_node *np, u32 id,
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
 
+		if (bad_map) {
+			cells = 1;
+		} else if (of_property_read_u32(phandle_node, cells_name, &cells)) {
+			pr_err("%pOF: missing %s property\n", phandle_node, cells_name);
+			of_node_put(phandle_node);
+			return -EINVAL;
+		}
+
+		if (cells > MAX_PHANDLE_ARGS) {
+			pr_err("%pOF: %s cell count %d exceeds maximum\n",
+			       phandle_node, cells_name, cells);
+			of_node_put(phandle_node);
+			return -EINVAL;
+		}
+
+		if (offset == 0 && cells == 2) {
+			bad_map = of_check_bad_map(map, map_len);
+			if (bad_map) {
+				pr_warn_once("%pOF: %s has 1-cell entries targeting 2-cell %s, treating as 1-cell output\n",
+					     np, map_name, cells_name);
+				cells = 1;
+			}
+		}
+
+		if (map_len - offset < 3 + cells) {
+			of_node_put(phandle_node);
+			goto err_map_len;
+		}
+
+		out_base = map + offset + 2;
+		offset += 3 + cells;
+
+		id_len = be32_to_cpup(map + offset - 1);
+		id_off = masked_id - id_base;
+		if (masked_id < id_base || id_off >= id_len) {
+			of_node_put(phandle_node);
+			continue;
+		}
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
+
 		if (filter_np && *filter_np && *filter_np != phandle_node) {
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
+			np, map_name, map_mask, id_base,
+			cells ? be32_to_cpup(out_base) : 0,
+			id_len, id,
+			cells ? id_off + be32_to_cpup(out_base) : id_off);
 		return 0;
 	}
 
@@ -2219,6 +2303,10 @@ int of_map_id(const struct device_node *np, u32 id,
 	arg->args[0] = id;
 	arg->args_count = 1;
 	return 0;
+
+err_map_len:
+	pr_err("%pOF: Error: Bad %s length: %d\n", np, map_name, map_bytes);
+	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(of_map_id);
 
@@ -2228,18 +2316,21 @@ EXPORT_SYMBOL_GPL(of_map_id);
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
 
@@ -2252,17 +2343,20 @@ EXPORT_SYMBOL_GPL(of_map_iommu_id);
  *	If non-NULL, the map property must exist (-ENODEV if absent). If
  *	*filter_np is also non-NULL, only entries targeting that node match.
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
 		  struct device_node * const *filter_np, struct of_phandle_args *arg)
 {
-	return of_map_id(np, id, "msi-map", "msi-map-mask", filter_np, arg);
+	return of_map_id(np, id, "msi-map", "#msi-cells", "msi-map-mask", filter_np, arg);
 }
 EXPORT_SYMBOL_GPL(of_map_msi_id);
diff --git a/include/linux/of.h b/include/linux/of.h
index ea50b45d9ff7..374b249766a2 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -465,7 +465,8 @@ const char *of_prop_next_string(const struct property *prop, const char *cur);
 bool of_console_check(const struct device_node *dn, char *name, int index);
 
 int of_map_id(const struct device_node *np, u32 id,
-	       const char *map_name, const char *map_mask_name,
+	       const char *map_name, const char *cells_name,
+	       const char *map_mask_name,
 	       struct device_node * const *filter_np,
 	       struct of_phandle_args *arg);
 
@@ -950,7 +951,8 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
 }
 
 static inline int of_map_id(const struct device_node *np, u32 id,
-			     const char *map_name, const char *map_mask_name,
+			     const char *map_name, const char *cells_name,
+			     const char *map_mask_name,
 			     struct device_node * const *filter_np,
 			     struct of_phandle_args *arg)
 {

-- 
2.34.1


