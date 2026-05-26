Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F5DCD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 17:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JGhusXCA8cVjnObIc87hQxbbtx5nG/WYD8044e7EgZY=; b=Kl2IiYCcrJnHpX0US/wtzme/BG
	n6ThZ48VLsWVMiEvFImCNe/abA37jH8kzGlKLolPK9GsvuCK0t56zMWXgj1oqh8eGPoPTER7SHXLX
	dm+IILNIbM7T/hFmIY8VAaciLsD8JveREJWeDq3m1YYeb0yDifwVMvxDaCvLB3FmyYOZfJUVnD0jy
	sH9Fx/LAnxPQqPiIwR9B9vd0Apx8nEWT617ohzc7uhXrgjwEWbDPHGbo6Dj+7rkJ973xH0IuwbeuN
	dY5v/LmVtceUF6EpQQQc6XHefRvUQ0MMFJ4zfVE6vIgoWnm7lLm3INB7ad2aJLEvOMDAS50Y3ZYcd
	YL1uGfVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvLJ-00000002fxk-1kkn;
	Tue, 26 May 2026 17:13:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRvLF-00000002fvc-3ZFq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 17:13:23 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QH1DFm2995532
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 17:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JGhusXCA8cVjnObIc87hQxbbtx5nG/WYD8044e7EgZY=; b=IKwtnu2xR5XR77AR
	LZH+8SAvGtYzAD5ub90cOb4yAzcUCqzcW8o3ejewmKjWSKw2LrLbTIEDeISx+wUX
	tQmUOCAiQvl8UsZg4i4+3+jSMKOpTtBIWTcBntsfFeE5ThfaOykgEDtadI/HQWf0
	zwqh2bSZFcZZr10b3h2PYfUyovMMp8uZM3bJJ9GErxiGfk2Xt/1W+dP7JxJLPOrd
	593LzzqQq9AEH8ul1RSnVw1ioQDcg6JDbGS2+Km3xOwcd1J1ixkcWEFrljmoHe68
	9Srrj5rIWQ/wB0vZxLzxm4j7tQ1X+dPQ5AUsJtJyIsWiRWUh3FFCNRXADQxVronV
	NIxq7g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edcnnry90-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 17:13:20 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-83f7e7f7457so6824434b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 10:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779815600; x=1780420400; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JGhusXCA8cVjnObIc87hQxbbtx5nG/WYD8044e7EgZY=;
        b=aLazVH6t6NqaUSAMKq8X3eTutM3BY/18yNP4Ar6eW+WOEui1EolQxW18MVgd8eS4VB
         0gxfpozmQCkaslSmD9SuYPqVLl9vhOVvb+DJtMQ+en3vdmIiQ4/s+yZjSnA9fUWqC6S7
         19jR46z6+ilN9A/NCEgtPaAD62RTYYj3PwMl0SqY29gk/dBh2ZVdQhbltqG7JgacpMc9
         MO/Gb1Kv6NbWsvuByWIQ3Mh9PS2FvedqU+YB0jSOX310UKcwIzETiorTlfoyJgqHUi2B
         CXTr5MjL3Y8TrJqbyCHo+mAt2XoWl/Y4crvVrYF1kD7eJHPIqQ/0I5AcynM2BNmONx/g
         Uh9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815600; x=1780420400;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JGhusXCA8cVjnObIc87hQxbbtx5nG/WYD8044e7EgZY=;
        b=AKuKTpVoMAdjOTF2p650MYJBF5DjLuWib03I8TBAk8YnDNt6+DkD/8Kvg2F730Qs8I
         pFLZh1LVkfzc8UtqjRCxiyMr7b1xww6asHlV+kci5xXEB/2whr3kCT9yAscnsAFRfAI1
         wJPevviqw/OA83SgcG1xtIzsz9FqYNGIjpjdQfEkCL8vtuhfTwhTZn58pE35z3rHQPOv
         gNLAUyXihODdF7uT+gkXZRVemuhp9PbAoG4YZLxgnPydrr+Ckcp7EiTUBCD4u9oF9PIV
         FROVw+t0EVs74/FkC6KOl1dilrvc9vWDVrr62DuM4mM02+j4mRXBaz5tWmhnUpHpAdoh
         ZXEw==
X-Forwarded-Encrypted: i=1; AFNElJ8LiHTQZn/ZzmU/6CMcypEcOjLS2zij514LNUwJKc+PfO+j1Wc+RHUnRaWJWU6RIxCmYIb3zoqUAWvv8oHI/yD8@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ3f7SOfe0KgAJF+qapRBd9YeXWh5DIMnBBAZAxQcywa6KiVvn
	U3Yl3+OtwNq67rhA7kcpJPsQPpZnEMNUTCcL4jL0N9Ehr9r+x3aLd8rrsFvqT315Wk4LKk7DjmT
	k9+2iIgY2T69Gtn2GbChfg4dVl2k6rDVuHRRJeHkkKHo7xuNNIYxYmDU/n3C4w08IaDchuzSnfZ
	KJ5g==
X-Gm-Gg: Acq92OHgXTxWYZgcRfTlm4e1Irt1SLxY9lBNMngQxxayNvjQSovrUVUwx/qqyb4tpxH
	xi8VA9MCuCEq7dZvZQxMXW5ie9+f/c+JLWM8XpmGWzjzW9IJPUmzfq5EVcza/3gdOxP2U0u5H3K
	RNrGoypyK5QZnhw1NK4fFXM9YU7BJCRb8SiAQgVhNNw5eQAa2K3PaI/ygy7mUXeUq3XFsp51VV0
	1hR25XEIc0aCaQMEfTk5I7/c2wtCgmd+I6sqridaSHVrSmSFRw1ochgdFqX0jqWwKyLgJiS50qr
	Sez32gkUldFK8drDRg0Oms8SNZKCu3WnxWyL4I7gxBcW87Tgz9DNA7uZvDFHLPGe8OPSJVPkguw
	u0MNQD8pyHUs4Rdp0ac6mOah7ZQdUxUQdQxCHy8r23wfCofmIXZBxvYJ2P307L90=
X-Received: by 2002:aa7:8894:0:b0:829:b08f:7353 with SMTP id d2e1a72fcca58-84160bdf1f8mr15090264b3a.7.1779815599626;
        Tue, 26 May 2026 10:13:19 -0700 (PDT)
X-Received: by 2002:aa7:8894:0:b0:829:b08f:7353 with SMTP id d2e1a72fcca58-84160bdf1f8mr15090231b3a.7.1779815599104;
        Tue, 26 May 2026 10:13:19 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84165009761sm15736235b3a.60.2026.05.26.10.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:13:18 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Tue, 26 May 2026 22:42:47 +0530
Subject: [PATCH 3/8] media: qcom: camss: add support for QCM2390 camss
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-shikra-camss-review-v1-3-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Prashant Shrotriya <pshrotri@qti.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: Y1I7_MLbbTv-jyo_uSmq9UgHBocOc7kz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDE0OSBTYWx0ZWRfXzBVEBwL8fUp4
 F1J2OhhfmSXJKOgp8/JkBYwuTWCkw2ObuuMNew+yfc/OyNorcMMqkEDN+dMOjTHV3zSiVvP4jxm
 uRnnBO3sXzkgaeqmNh6/qZLctjhmUmbAaC2PKzwXiWGryc03cNUNpi+IlSodHcQC86ZDI+4j8jD
 XqDG39ZqYMZSxiilttC/plbN9yt9EXvZnMEX79W0bH1/gKe8efify/eSLNbszaGd4u8t5srsPIt
 IHqKXUasPNoLZyEDsf9WC4YEA2bUmBD5zwhuC8F0hkjA1+ha3JIeWc7v5suZruGxuD6PydGXW9g
 AdYaueb8qEEDTT/WhyRxzKVf9vbCRWEFERQVzdM9vFLFiwfu8/70l9dCRLAXFFP53SsOuG/n6zu
 wo+eBNjod+aBBmOOJuws/suHbitJ7yvZRQf6lopTi/bKSkltUQnnC4Hjl4F/JcnqzhhEPuWJxA7
 OeXaXy6Yq8DTCMXlq4Q==
X-Authority-Analysis: v=2.4 cv=VPHtWdPX c=1 sm=1 tr=0 ts=6a15d4b0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=-sGFTftWuDZfp9pOwnsA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: Y1I7_MLbbTv-jyo_uSmq9UgHBocOc7kz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_04,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_101322_584576_5597FD08 
X-CRM114-Status: GOOD (  16.53  )
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

From: Prashant Shrotriya <pshrotri@qti.qualcomm.com>

Add CAMSS driver support for Shikra SoC. Add high level
resource definitions for 2 CSIPHY, 2 CSID and 2 VFE instances along
with the interconnect bandwidth votes for AHB, HF and SF MNOC paths.

Signed-off-by: Prashant Shrotriya <pshrotri@qti.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c |  2 ++
 drivers/media/platform/qcom/camss/camss-vfe.c            |  1 +
 drivers/media/platform/qcom/camss/camss.c                | 13 +++++++++++++
 drivers/media/platform/qcom/camss/camss.h                |  1 +
 4 files changed, 17 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index dac8d2ecf79957dc05c5524dc439791ce097c785..62208f5c4f17bd6c9a8fe5613649920e6ee1a1f2 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -1130,6 +1130,7 @@ static bool csiphy_is_gen2(u32 version)
 
 	switch (version) {
 	case CAMSS_2290:
+	case CAMSS_2390:
 	case CAMSS_6150:
 	case CAMSS_6350:
 	case CAMSS_7280:
@@ -1222,6 +1223,7 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
 		break;
 	case CAMSS_2290:
+	case CAMSS_2390:
 	case CAMSS_6150:
 		regs->lane_regs = &lane_regs_qcm2290[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_qcm2290);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 319d191589884777bced456867e5a2a4211a2770..b152f8d48e003d8eeb0cf19ad57419b25cdec087 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -342,6 +342,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 		break;
 	case CAMSS_660:
 	case CAMSS_2290:
+	case CAMSS_2390:
 	case CAMSS_6150:
 	case CAMSS_6350:
 	case CAMSS_7280:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 2123f6388e3d7eafe669efd6b033e22d8eb5cf79..f67ecff53f15bd213dc7736d4e5fe880007d1ee7 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5565,6 +5565,18 @@ static const struct camss_resources qcm2290_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_2290),
 };
 
+static const struct camss_resources qcm2390_resources = {
+	.version = CAMSS_2390,
+	.csiphy_res = csiphy_res_2290,
+	.csid_res = csid_res_2290,
+	.vfe_res = vfe_res_2290,
+	.icc_res = icc_res_2290,
+	.icc_path_num = ARRAY_SIZE(icc_res_2290),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_2290),
+	.csid_num = ARRAY_SIZE(csid_res_2290),
+	.vfe_num = ARRAY_SIZE(vfe_res_2290),
+};
+
 static const struct camss_resources qcs8300_resources = {
 	.version = CAMSS_8300,
 	.pd_name = "top",
@@ -5752,6 +5764,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sdm660-camss", .data = &sdm660_resources },
 	{ .compatible = "qcom,sdm670-camss", .data = &sdm670_resources },
 	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
+	{ .compatible = "qcom,shikra-camss", .data = &qcm2390_resources },
 	{ .compatible = "qcom,sm6150-camss", .data = &sm6150_resources },
 	{ .compatible = "qcom,sm6350-camss", .data = &sm6350_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 93d691c8ac63b2a47dbb234856b627d8911a1851..8ba8a38113dfc15849fa333d05b2c3853f3a7714 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -82,6 +82,7 @@ enum pm_domain {
 enum camss_version {
 	CAMSS_660,
 	CAMSS_2290,
+	CAMSS_2390,
 	CAMSS_6150,
 	CAMSS_6350,
 	CAMSS_7280,

-- 
2.34.1


