Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403DFC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 16:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yksA1f4CIEDmfZUrVzhMhyAFPy3A2If+RJxkkjk66Z0=; b=EqG99w6QELNYfdfgh9FglROa82
	nShpuLq2po2cDC4ecLF2tzhvfCzhEDELcLznTbF6hmcowqXLzBzUTkHFDjZCR/JD6S+FgvoQi6E/O
	NXSlMn8SU0YpOB8OPUubWNH1y3U0qaRonW1IwWpv17G4S0KM9THYh6sciKVNPqgkdjLnEqoPzCpZB
	N9eafWb4QpKsH7a6le22hlnllqyNUYB04kxfElYIUzHfaW3q2kjHrtE1sDIZTfBrv6GnTq+1ex7LJ
	oXGQxRHpijG3M+h4Dnp0hnDmtoyikq94uGODHXFwQXuhVFxOuikudvwRVEhI/v+sHSDEbg89l1dfW
	x0FUlxPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRoT-0000000Dkz7-2qov;
	Fri, 21 Aug 2026 16:09:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRoK-0000000DkwG-3b2d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 16:09:48 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFlwvW3391874
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:09:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yksA1f4CIEDmfZUrVzhMhyAFPy3A2If+RJxkkjk66Z0=; b=Sc6ERiescPJxMtCO
	q20LPtHZHJlYliJPC77R2myg7VPX1FBpmh4j2CABvdp866c6hagoFGYJ4agPu2BL
	vhuH2Qt/fQNe0U845R/0llDR9orG8AhBhR2/xqVZhhig74LdNwj93FIduXHCM7HG
	8cEjrAGJZkHTd3e7Zcc+gNk4sBPCJPg1npfC0byjo2aMc2L1NrkeSLrNu5PWXixF
	SxZJjlTbhBaZhUfTYhzlKA5NBbCS7O+AhY/xXHi0M3sKTzo+aZ4noBrb2HaorCbI
	AZbB6X2JYUhK4UaCQ8etsqNRBLvGhvx7YYsOEgZlGIz1JdKD5xsrToEKl6xTObMo
	hiVlSA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fuhjf7u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:09:40 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b26d8d2498so1883706b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 09:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328579; x=1787933379; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yksA1f4CIEDmfZUrVzhMhyAFPy3A2If+RJxkkjk66Z0=;
        b=CvEqzWNIZUFuvHwW5zhMvkUFsV80GGIGEurF4Q42qNe+/bE1F0JUTaxQN0ef2iWbum
         Ip9zwlsLlp9Kr6CHlmrvPFw/tvN3B7Uh4hJAcLEhRuYSh+BKqOFrcFRLroAHs9NPCZAz
         kxjW6SBZnvOFEpgUmEAG0NKtaOChNU4ENnGcDsv2OYEKNtKkM9JtFmtHzZzsOjNcql+g
         9ekoX4fGRXXKuwq+7MygvP8KdHkX1abhblBMhiA4KjjHUn5mcMSA/h+M+VcgcSKH2TPG
         jLdzl12P+/w7fyLrbcm5G41jZqLnWQhVEFCwJolyxt5MiJuKZ0sA4rAmTAIa4qh9BiaS
         7Syw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328579; x=1787933379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yksA1f4CIEDmfZUrVzhMhyAFPy3A2If+RJxkkjk66Z0=;
        b=CtOjgSGk1DG7JNLsZ6/rrQ5R01Vd2n0PkxY23M9yAqzVZcJT+bfiJ8gwHiq6+Jmja0
         2gNwkFeIUebZJ+UMBMudDbjod51sJ8y6n4YOuruipzfA+4UnAhoeaLpQ9Tx95y5PluPQ
         6B8fAFJvZMbmzhFLJ618Y0E7znmtKznpnSvhlx/mJv/Etuf9+94TIuawmm8H6niDoKZE
         xoGmYepvtHkrcpMXd7Ii7yseYqeD47fbUS5OGcCBXud+wmztTSvh1s0aGequ6yYpp0+3
         UG5m7fxMd6yIYlE5jQaGuEPvhnNvdhnyK58OMu1qXg6NYoY5Zg42EnDdUeCw1z+Yhb1/
         92GQ==
X-Forwarded-Encrypted: i=1; AHgh+RqtjzIYmfePk0nZET0Z1Jsfate0HwJvqwoxOZbkGx96F/VAcGV0w4NUClamS77QQmI4d03Vn/B4oCGR39KtWKnU@lists.infradead.org
X-Gm-Message-State: AOJu0YxvaxC3u9Lmo5F3Qry5N6D3jgwqKbvryEwxWpD5nMY/c0T0SK6K
	gJZe7mKNAU1gRqT9hQ/DN1F/uNuvM9/TX0EFM2gRb53wQdNr3Ri6OLhFFdEiy+LrxRRf78i75mf
	QrhUdXmdg1t8xOgo90173oEGS1wjdzmiSI14eHm1gcRF8gLZ+N6xuEbsgh6tUqH/wB/qzdPEmlw
	CAaw==
X-Gm-Gg: AR+sD11/v4jAxkwivpZXCXv9UCOm2BhRVTyoDmPi62nsQLgmaoY9ByZ7Ja0ZmoR5vJd
	iYhJtp2tlDxtkFvEnhrTTbtQGqK/9Cdgx8oa7Cw6gw+/vZG9H6DWWnoFiY9XG3NFzLN752VJHJk
	unsabs8LpCAoGBCmFLz0XpjIOU2KzCudG5WNPE8LKrdnq8Nq1H+UtYXhh3OvWrRjjW3wrHdGM5B
	CUb0r2Ox9C2lnR9KuRoIxajkio19uEpJL8SsN6J7SM1Z6lMzbYfzBSC7wboSD18aWSs9262Ab81
	Qr3I7awLlcc3jLWXKh4xAbjea6goLCoo8EoKg1WYniW5S4wpYlMZaZTSYIIjANN2HM4QItbyGpV
	nxph89nhE52a8zBviaN8qGV5gk0tbsiBZWQcEHjKWVzqq8Y/CSak8wwwku5O2ua8ZNRjvDHPnSp
	yP1EFRwZcwKRMtRTN2ppPfFBE=
X-Received: by 2002:a05:6808:f94:b0:4b1:ba28:5df5 with SMTP id 5614622812f47-4b2ef327908mr7079742b6e.18.1787328579326;
        Fri, 21 Aug 2026 09:09:39 -0700 (PDT)
X-Received: by 2002:a05:6808:f94:b0:4b1:ba28:5df5 with SMTP id 5614622812f47-4b2ef327908mr7079658b6e.18.1787328578881;
        Fri, 21 Aug 2026 09:09:38 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:09:38 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:38:56 +0530
Subject: [PATCH v3 03/15] pmdomain: qcom: rpmhpd: Add power domains for
 Kuno
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-3-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
In-Reply-To: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
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
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=1748;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=tzDqNTEhoFVwtAYNfXTfFhwNi1y+wzNPDmbGPl082TY=;
 b=CxsWXOKtJP6Cvh3tIteifLhUXNDAbb56aoAXVsLa6v3Cfb3Hb+XK4dUrRN7H+p4kVAxUL64uA
 XGzbF+q4je/BNf+gDCsy3Rm4JwOd+U8TlxfPvt0d5PYj3u/qV6owX4L
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-ORIG-GUID: sHvG3Y2ckqFv_G9aNGVOI1Q3anUe9tFM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX4WUMed7xnp1o
 vdtjBVdwDczFBubCidu3LUTNLmTpX6fDU4yQl2m74ThO9blYmaiyKLwVKb4f0PL1njvVed5m4U9
 2M1BCrWyC1J6PoNSzhJnU4wXzeBM0QY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfXyRBFi6dDZU5X
 5WAb8emPykPsQyHxzE1YrD1izLcEWzBGbBCYhinU+YIxRAsPRwikLJW0drCI5TLUbh+PwQFgtLX
 dr8g+rjqnjDJxb+c/J0Kcvz7LsPD5VEZy1/7Hr45VCbwAJv+K96/0K2iHKMl/GB2WuvRgdqQzdB
 4lJ5mY1+NsTfZNTot84uK7PqImNwtRsvNvHwZN7/K3PP9c+2RuMaRXGA4YNnT1kzMHZADSP82rY
 wKzuYR6YolvR14Pv8ZD/hhWuFztH788NgbrJ7DRvqEaS2WAY/tBr5u8vevVDkX4qijH2V0e0Shr
 ZyOof0J5vPH6khJjj6bkfZCaHs7+763bByIiutH6zgMW70eF4Vgq9bMGy2gwM1J3bArYQr5kQzl
 Vw8nHI8UdfdIJivFVIuCjdxDeFkciXf6tHJCqWzq4U9x/aaGnO5xMYqDeEa/PMJS3XBK/rqY4sU
 0ALeNxrrbHILolQ6JYw==
X-Proofpoint-GUID: sHvG3Y2ckqFv_G9aNGVOI1Q3anUe9tFM
X-Authority-Analysis: v=2.4 cv=UtFT8ewB c=1 sm=1 tr=0 ts=6a887844 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=1FmER_HI0FvT1hCPThAA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_090944_146189_0E395B23 
X-CRM114-Status: GOOD (  14.28  )
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

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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


