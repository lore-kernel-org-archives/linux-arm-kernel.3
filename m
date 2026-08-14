Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD86C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dXlEBzajiJxYfo/PgAtKHciD8wbm1lPVA6bGD/VsF2M=; b=dkf3Bb4HSRMeeX4yGlufi/WKOS
	Y7s0lC8mH4ikTRVjCaeKvbZdkPhZRQfvhDhtn+sC0zeU6Hbmq/rMpr4j2vZZKRKS/HkizMgRw5xrG
	i0KcBQDMax0VRxxUxhhuvWpuJ4xkPXm4CXUaGvHcoNhK6CIPXw9i9TkUCawTt4r0uJbdNpPWDE4m0
	2VrIqB+4TSyPI9Pt9hLQ17Lxcd8eTZ9Oj0Ly5X1UsKEmkUXnyzhytabPphZfsctU9OYwMNcgpVIKN
	Ermlpz5ASYKYTUokhDALLKb0KiDd86nekAZPj5XJFgaZJ1CKH/SavLfdz3PnG6NqVtzvwPIrktOol
	e8sjSP7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumP2-00000002A4U-2yFz;
	Fri, 14 Aug 2026 07:32:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumP0-00000002A2l-0jDR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:32:31 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QtQp3615498
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dXlEBzajiJxYfo/PgAtKHciD8wbm1lPVA6bGD/VsF2M=; b=RUyy9rInWyBciczu
	D83Nts2aJ8bcd+uFbYRw88Ee82h4Mmc1YQ3LEpAFFt6Exb8viEB+y71OWiUyyBu6
	yczX+WWLyn7lMFIqGzrBa5n+572VYSlJ+8jPUQTN9vdsxqGtQG2OGEhchTiwQKSS
	pd/YVSYZvGfGUJV2FhqBV4Mk2PoE8mGA5fPFraBXYupkuebaOUQW/6TjfS/zJ3XZ
	oHnjCLvcVNbHwqqakxlquledZ0429PxmB+8S21s1h8pD3j5exzxLk/ETmmpXX5kh
	oVMPXZcHmHs7+Hm6JlTPDKsVZZ3Z1h+ri1Q86B7ls0S4AIpu2jmK2flOXTWvI7bD
	dykCwA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1hgy32mx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:32:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84f0d3ab2f4so505077b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 00:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692748; x=1787297548; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dXlEBzajiJxYfo/PgAtKHciD8wbm1lPVA6bGD/VsF2M=;
        b=LrIvmdcKeelSz5A23FsUOkuORDjTAjYF7Ny9e0/ih2FyJtZDa8hR476GK+ZN1xyFo7
         U3/O0hyGhy8Gj3MFpvURUl9MiWeUM3DVtpC2a7kvxQcBGrmExCcCxYSYCSmnzkY5ZmaZ
         3rVivcAzix99O0yJX4Xqg+EbzFUxnhZg4KczgBcNJmipk0lLdBurplMap8M0fpMjZWd3
         5UZseZuRSEn5LGP0QVNaVsdJ/5mI3Txn2Gi9EEuWMH2IBhEoWQ/VppmVepWCG8xm5KS9
         T261mp7LDyTKgKvGY6Kr1wCJVQW6x96+k912AOSw+vSRFmHw8hIaAW7NL2gyrbffGnkP
         QsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692748; x=1787297548;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dXlEBzajiJxYfo/PgAtKHciD8wbm1lPVA6bGD/VsF2M=;
        b=Vxyk2pX9fzfPr0/UnWSzp/9oqLsvgZ8Tuw46/3cuBY8sU6dYQSnfYgMCYkNQQ3rHma
         H6s4gdOIQo9ouoJXpYgGtxsxj9W/1Hral0kGroQOYPaem7enczkmphdHty1N/HWYR74k
         WJYdRgUiY/wJP3mSk2qaZDzzTZKKxtliH5XVTMDuHf6A0v3qqM5OfQ0Z0T/ybPRXIvkl
         g0gcF6atn06WNJ1feNKMriOt/nPZp7Kz7rdDHGp8+FLAQTWOkdfQpnFMZIfUhEFszUol
         XH1CBPL88xfVFbisMLOQC7NinwzdTbP7i+NmvjMOvXKzdjgngpk+IDomEc0cVT3aDk49
         RzZA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/OPDukI7Biq5UpewrcNBCWVuJ32P1Qla+O0GXFvdELxuqHX15K/wumz06GKWsJbU18WuqlDuU+MEDXAJhbQ1B@lists.infradead.org
X-Gm-Message-State: AOJu0Yyxu7kjRrMrxglIIj84FHi2vA6bzygS39K5cam2oRCwTf9QDYfp
	lBUBvX3I4hH7pKM6YX6/8+J7uClVUv20ZP0GjytqTKvwU/Bu0K5lakZ/eRXtPe+HLHqRWYWfOas
	aiDAxml1Ezi7xWDRQP2tjG+h8HiB0j6B6mANsoNld2o3R3PQSKpdC07oLgehIKYvJY5q/CLgj5c
	KtMw==
X-Gm-Gg: AR+sD13Z9TSc/c4oh84OZt2RxzQ13EZo7jUvOWlx0SIAahOAo3pQ5Z3pQaiwpWOSzHb
	jn4/ZtG7mRR2cRNInzBerefVgiTNTgPn1FRc3f4aBW21RBvDPLGVYb282M0uuncN3ADwAGaDk5R
	RNUL+qBIa4ycxUrcKmKclsS05QVcR083KoSEbPQbuMLsCU6LkWLlEjOzhaheKjt7D2rUFWUaWtM
	lk8ZXXcGfXZZ9suAlBtZ2Aj4otQzUGv18LaCmrAFKvjpXm+tdGD6krXLjay4A8qLyPPpcaaCNvv
	3MMaoyuBjFzXH/QGUxhFHrqj1WKmHVIHJrS5b+/XW9KU+N0FuYM06JSLi3ux1sMI5SiPpM7P2+Z
	6AcyMwisF1TbcNMz3mPwdPrdusEzFiDAj3vHeDF7hl56tBx7L2hwBiPiCwzXPlbO1dwfaIXhyqr
	c1l/KQPMFR2K+eZ9vQ/co23ig=
X-Received: by 2002:a05:6a21:3401:b0:3c0:b766:751b with SMTP id adf61e73a8af0-3cc71e1b532mr4325570637.14.1786692748125;
        Fri, 14 Aug 2026 00:32:28 -0700 (PDT)
X-Received: by 2002:a05:6a21:3401:b0:3c0:b766:751b with SMTP id adf61e73a8af0-3cc71e1b532mr4325510637.14.1786692747710;
        Fri, 14 Aug 2026 00:32:27 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:32:27 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:34 +0530
Subject: [PATCH v2 03/15] pmdomain: qcom: rpmhpd: Add power domains for
 Kuno
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-3-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692713; l=1687;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=KipaZ7f4mPPcv70WXg+eNoIM2CY2fZVm54MKxlYcJC8=;
 b=IeMzgQyVvcMMtvAxfcExuQ5BmxImJ7KS7ifwcfX8fgmRZDKNbKcdDGODd9Nm/GVl5P3uZaieX
 DJJyOyg9fskB33y4FAgAar4Tgob+7ECF8an3TdKOdsyS7BEsEj/4J85
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfXw8o9BqcYCV2Y
 6ep50GVtShUSsD0n0+BEITKI6nP35YWdnULwOmtoSGkbAIowSSRfPg04I2yIbgXTWMhEIuHsa7Q
 UU51rbTRdSHcfUT36EZlFSnt3A1pajIfDX/HaRpxfW7raVVyHXszHTHM1acaypTRXKqUeQeEYlQ
 TSD2S/b4eMuKOHCNhrv9DATuUpyO9deShmBvi/ZWtAKNVWkf33OF4DFw9GXb4ULntSCyIbw5AaU
 9SqEZ+hdI45giB3fsJFakFSL5+ASNna8p1oeR6pjkpTy3YndufLCcDcZYSmyCivokGTifRBcWeW
 BrAcgMcrds956qkbC4jLPL+gwxISTEwiBpP+3Y0wq0E/7Bz2XVOG1kQFVkSEHMXFAhehG4PVz4A
 AM/Xtl+JRUfa3viCJEvaU8BwTJROQFx7I1yiBMJ8oiMwzQB0pdFdK+xOWh3aNEyTi9/VuNWsmEc
 a5bcBU/M6IdZ03zGl5A==
X-Authority-Analysis: v=2.4 cv=AaSB2XXG c=1 sm=1 tr=0 ts=6a7ec48d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1FmER_HI0FvT1hCPThAA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: zDgwt_mRE3N1GkqeCOHYIDSRYe-Nd1Ko
X-Proofpoint-GUID: zDgwt_mRE3N1GkqeCOHYIDSRYe-Nd1Ko
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfXydnak1hc/GkV
 wQJSLzw08+GB6GZV0b3S3ZjEG1CN5Xl+JvvQh1kVdZwsPZgNWm7n6aJSQ+oh57Tm0bfn7Y2WzzS
 WkIpfQVkCXcsEdxc0NxrEjyUoTZMfzA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1011 priorityscore=1501 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_003230_338154_228C046E 
X-CRM114-Status: GOOD (  14.66  )
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

Add the RPMh power-domain data for the Qualcomm Kuno SoC to enable the
new qcom,kuno-rpmhpd compatible to expose RPMh power domains. Kuno
exposes CX, MX and MXC domains (including always-on variants).

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 drivers/pmdomain/qcom/rpmhpd.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 96e4bd2f5a14..3c7755735dc9 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -685,6 +685,21 @@ static const struct rpmhpd_desc kaanapali_desc = {
 	.num_pds = ARRAY_SIZE(kaanapali_rpmhpds),
 };
 
+/* Kuno RPMH power domains */
+static struct rpmhpd *kuno_rpmhpds[] = {
+	[RPMHPD_CX] = &cx,
+	[RPMHPD_CX_AO] = &cx_ao,
+	[RPMHPD_MX] = &mx,
+	[RPMHPD_MX_AO] = &mx_ao,
+	[RPMHPD_MXC] = &mxc,
+	[RPMHPD_MXC_AO] = &mxc_ao,
+};
+
+static const struct rpmhpd_desc kuno_desc = {
+	.rpmhpds = kuno_rpmhpds,
+	.num_pds = ARRAY_SIZE(kuno_rpmhpds),
+};
+
 /* Hawi RPMH powerdomains */
 static struct rpmhpd *hawi_rpmhpds[] = {
 	[RPMHPD_CX] = &cx,
@@ -889,6 +904,7 @@ static const struct of_device_id rpmhpd_match_table[] = {
 	{ .compatible = "qcom,glymur-rpmhpd", .data = &glymur_desc },
 	{ .compatible = "qcom,hawi-rpmhpd", .data = &hawi_desc },
 	{ .compatible = "qcom,kaanapali-rpmhpd", .data = &kaanapali_desc },
+	{ .compatible = "qcom,kuno-rpmhpd", .data = &kuno_desc },
 	{ .compatible = "qcom,milos-rpmhpd", .data = &milos_desc },
 	{ .compatible = "qcom,nord-rpmhpd", .data = &nord_desc },
 	{ .compatible = "qcom,qcs615-rpmhpd", .data = &qcs615_desc },

-- 
2.43.0


