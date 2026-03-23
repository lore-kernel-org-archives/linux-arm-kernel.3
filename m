Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A85EC01B1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XNFnCKRlYseUEtoxCTko5eEC5pQQo7W92i+zQLuCE1k=; b=KbBe8f8rIiz6MUes45pJ/vWPu+
	TXaJS8tvYffAdyPUbxk6ZFF9gtxnmPYhfEzd/xEOKwaA/PqPHzzbO91m02FI3OVXbDuNKh3UoNiPI
	J1eBSkYhiTI9ygUAvGsRfExLMYYLsjhD0INcZZ0HGwmgaTLiImavyYtWmj/qSEveOa8NxUepOWkVM
	+UVkGnnpaGQAqUC9s7eCSCIrwxOogGJgHlI7YZhe3hVib8NMlKZBv23wnBY/NLG7+f3DieKfYzaAs
	OfwZSDCVfS/KrbMkPsyN9Wr2XorlbuXDe+7ZlBL43NVXps6IDkbvxujW6eONfhEG1aKXx5CYxePzI
	5xdJNGkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bvJ-0000000GPK0-1JlG;
	Mon, 23 Mar 2026 09:50:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bvG-0000000GPH9-12w0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 09:50:11 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7taFH1627158
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 09:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XNFnCKRlYseUEtoxCTko5eEC5pQQo7W92i+zQLuCE1k=; b=OM7em+d9dFVzcj10
	BE9dEBV/Ch9Z7m5LogiYs8z2jp+aiRvhNsVZhNDeoU0GolWGLQcXeZ12dQJW8hPr
	WJE0BWMXv/72GzSyFsVRZpfkAE6y7A0ed7F1Dw++MwUCm6fuIosfuc88Bskztva4
	gFMlzKvfYndbVfYJI2tEkaIZ9QRjwP4cUe3Oh69r1NUclcUwVREwaAlAYFarLYpA
	Dbbmw3s/+1N4D1n4OcU2o2czOWY4iHJvKsTZVZ/RPuZ3SOKl99Ureo5UMDCwuZX7
	b+LMbwi1J1cbJEuv7q/lAz+Ml089Ph4P8G9ajUlgB4uG9GiBjWJNc4lRXrVuTTqA
	RDzNtQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc0dhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 09:50:09 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35641c14663so5033342a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 02:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259409; x=1774864209; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNFnCKRlYseUEtoxCTko5eEC5pQQo7W92i+zQLuCE1k=;
        b=hxE3bDGQp4CnzKxs8ePQ9/rEzQjlbGzRr+PY+oTI456RVGOHW5y5u0E87kNi+NNwo5
         ARO28AQ9E5uIFWlXcMxOeP/MH/tPWAMSvQJOwPnSmXDrB4lVasvgiZ/Nwz4MO9YmRJeZ
         zawtv3U9CG2sX73d5P6jAZ5xXwgbmrZr0A87+eFIpDq7hbjc6HPE2bg9TnF4DwLu9GDb
         JDdAlRYcdi5LFHsZZ+yARunlEGquQi+jkQCTzDx3ewHVQF86bYNnQg9idmynG09JB9J6
         9MJrkmyp9jnup4RGBLHYlviy+dX0lop94k/4ho8SRY8CgUxhKtknBiZ3tMS4BZfsa/2X
         Ma8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259409; x=1774864209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XNFnCKRlYseUEtoxCTko5eEC5pQQo7W92i+zQLuCE1k=;
        b=XPokEwt3c3S2W0x8clcDgU9WAXG4MTlUU3oE81zlzWfw4GRTNjWQ/4/+gN08qYjYAl
         tQYItJ7PF5vGtpCX3O+8DB+zJfxSZcPmjLjlPgkQ/rQm0V0Pnmet1Bh2sBxxu28YxIdw
         Uxd+hNDwVhXH4nNpnz8l9cYswEgfM0o0VFSaWvIY7F0AIaAF+R7NCiK9AHRFqKogMxM0
         AVnK7PaXjWJZhRgjbxutPxfJA2NLf4mwkJ3rnq6cRDAKmX5zoTBzyO286pp/Dqn+aFC4
         l8lZwVCM6DJbLqI8acIUVsNRSz2I+DG405a7VYcsRuv08D4cEJoXIADVAgb63CRmEjZg
         sDjA==
X-Forwarded-Encrypted: i=1; AJvYcCXy28w+0zKFY6iQjKfLl6V2IDhChotdXx+fsGtaUDUxk960jIkOuPVN3Vl7n7uxxy5Ryk7+Nn1GqOljBvAooE2g@lists.infradead.org
X-Gm-Message-State: AOJu0Yz++M9K0XOlvtsgg4ZZ2tIW3uOmPqZm4w7/pMtcd/2o6tLhB9HF
	Z56RT5m8Vl0dfCL8YiWb5Xy0eTMCkKrNojD5P/W1Om4CjV2coammEbU6T4JbkFGPgrZFvKNk9vT
	r6UyA4psi++yZPmMCmlT5ALndrWhHCaB1SXEgEyiyD3vf3CrE8N7i0LLysJqXbjTPaA0EKA4hUa
	D3gA==
X-Gm-Gg: ATEYQzxvPW6JHHbUpyuXvY+YhE61/QvsJp1PKXFLMrEB69ryo5OBgIIb5kWr6nELHBG
	FhL8Oku8SzTOVt74m5IZLWxqiCE8yTcXELySJ3gkd9WtXOg0vGCeDTd5T32GlAz4RkEFRa229xx
	7awzGFs1sne9fiMIlFrCWz4QRqDWtHXaPvq5yT4fQBmjAFMiu74gmK+7bpcDSVMl0zoKyp76F9c
	Hn0artGdK8nfE69eKDkuwX4N50kdvcu4/HpIwVOMIZ1TGQh82bLCU2RKEcbQHj3pjJ+Dh+MCv0g
	Tb4bGhc01d4JuAOGio384wOg3cQa8ChX7OCaQyFgbHKhOLE/qMgfuUYXC/GiPDFhSPUnBk17IEA
	Be9+Z9oYnVudp7Kz2pAlggNjYT9ExJETMtbG3FVmDhFiywMUgA4HQ99o/Pl3oOJAdUG1GEZ+Wem
	/0v1YDs05B
X-Received: by 2002:a17:90b:510b:b0:35a:1b43:dff1 with SMTP id 98e67ed59e1d1-35bd2bf7926mr9813872a91.12.1774259409073;
        Mon, 23 Mar 2026 02:50:09 -0700 (PDT)
X-Received: by 2002:a17:90b:510b:b0:35a:1b43:dff1 with SMTP id 98e67ed59e1d1-35bd2bf7926mr9813857a91.12.1774259408597;
        Mon, 23 Mar 2026 02:50:08 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a939af0sm6591935a12.16.2026.03.23.02.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:50:08 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 17:49:29 +0800
Subject: [PATCH v16 4/7] coresight: etr: add a new function to retrieve the
 CTCU device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-enable-byte-cntr-for-ctcu-v16-4-7a413d211b8d@oss.qualcomm.com>
References: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
In-Reply-To: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774259384; l=2348;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=QjBBWW3nZNJQ7dW86dG4Ar+IGXRSYDsLrfUfjlg4xNQ=;
 b=/ND2nS44mbInVi4eNYBq/svnHomprXsHoRCmcKSXJZJjvVzmC7pJzBR0bMBaeQMxxQlzQqux1
 UeemwW4IB24AXbcIycNxDxrs8HgNvFJRGYIm+DAEvI3VmliTw9r+tCV
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c10cd1 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=FuIWbRVyn4pKkvqW11oA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: YRZ8tmNSu2ZDT0g-ygUXLLsCbOdQjJzF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NSBTYWx0ZWRfX6pHe/dvYM5UG
 fy48r4noXucjiEkMoqJYLaoSOb4csdqatlxZTk5P7Xj8sfVIBBvtcL147KdpccdHjMSlj1JqTiA
 REY5QOt2VZ/NKYPNIu3uz4ltdA56oTsSFcBdaI5IWDN1ZW7ZWUm2OoMTyCSc52Q9eF3fapkiIb0
 1IRhGp9/dcEqPOFPctqK5WKEIlkAtWMvT8mS5M9nAm5Fu2ilgX8GqzWgy6SY+ciOfJjQmJPkf5j
 oX15445LUq3Gii89TJS/Hi70jnOTwPCvQyOjcpOGD4T5T7O7PAqGZdnnIjpYWNW6xpMHUD8nF5k
 XBneeJF6PXQeQ1MLieG+F1rq9cQm9BehaEbTc05JLawrXZZJgE4jno0ANRcvOI2Ycbsdj+hR6qo
 TiHhgFGpRYTg+hG3xqkkGmI04iHWEtIziVJJUZ6gI9NmRcXjNbtWdCn9402LbG+gZjKWmve5ghZ
 6BNBGR0Qno0rJcpnLpw==
X-Proofpoint-ORIG-GUID: YRZ8tmNSu2ZDT0g-ygUXLLsCbOdQjJzF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_025010_295548_450526E3 
X-CRM114-Status: GOOD (  17.65  )
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

Add tmc_etr_get_ctcu_device function to find the ptr of the
coresight_device of the CTCU device if the CTCU device is connected to
the TMC ETR device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 24 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  1 +
 2 files changed, 25 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 306982e88dbb..d4a99c77dd90 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -865,6 +865,30 @@ tmc_etr_get_catu_device(struct tmc_drvdata *drvdata)
 }
 EXPORT_SYMBOL_GPL(tmc_etr_get_catu_device);
 
+/*
+ * TMC ETR could be connected to a CTCU device, which can provide ATID filter
+ * and byte-cntr service. This is represented by the output port of the TMC
+ * (ETR) connected to the input port of the CTCU.
+ *
+ * Returns	: coresight_device ptr for the CTCU device if a CTCU is found.
+ *		: NULL otherwise.
+ */
+struct coresight_device *
+tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata)
+{
+	struct coresight_device *etr = drvdata->csdev;
+	union coresight_dev_subtype ctcu_subtype = {
+		.helper_subtype = CORESIGHT_DEV_SUBTYPE_HELPER_CTCU
+	};
+
+	if (!IS_ENABLED(CONFIG_CORESIGHT_CTCU))
+		return NULL;
+
+	return coresight_find_output_type(etr->pdata, CORESIGHT_DEV_TYPE_HELPER,
+					  ctcu_subtype);
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_ctcu_device);
+
 static const struct etr_buf_operations *etr_buf_ops[] = {
 	[ETR_MODE_FLAT] = &etr_flat_buf_ops,
 	[ETR_MODE_ETR_SG] = &etr_sg_buf_ops,
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index a14645b04624..fbb015079872 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -470,6 +470,7 @@ static inline uint32_t find_crash_tracedata_crc(struct tmc_drvdata *drvdata,
 }
 
 struct coresight_device *tmc_etr_get_catu_device(struct tmc_drvdata *drvdata);
+struct coresight_device *tmc_etr_get_ctcu_device(struct tmc_drvdata *drvdata);
 
 void tmc_etr_set_catu_ops(const struct etr_buf_operations *catu);
 void tmc_etr_remove_catu_ops(void);

-- 
2.34.1


