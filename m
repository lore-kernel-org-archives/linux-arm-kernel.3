Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D31D3943C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+gmvqmnx6Mc+rqdGbk0x4TnThgU7BC6K13sY2POFME=; b=GjC5QyO/64OCMbxHB5TFWbWw38
	0FAMLzn1SrJqhGiq+W2zdmT13mxnxCkfH5WlEg4/ojxy8rhDUEOY2Ht/+UC8Fopt6iyjqb6n7QX3t
	rE+nRXsKUH6T0dR4ZISQb14+erOXkuTUkGKiIrmjvmJbhFp3gWzNLGJprnKxEAkfSBKaV4HQAkIsW
	yLkRzUkREqF+rzhc3eEsk9OwE1cwFCrGwj+AHt5/8e0Ye6KuBtW/V1NGZfFOIy/zFwy3Ob6q/JBQz
	tInHYyA3sPAc6l3pAtxEFSdTXaZpH3B925ImXdLcp3pL65duQFmsQdANVOLHZn95jRGq2wqkc3kPD
	r0NXr46A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JSo-00000000Ny1-1gQ1;
	Thu, 02 Apr 2026 14:56:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JSj-00000000Nul-2k3Y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 14:56:04 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632BAqIh090852
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 14:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j+gmvqmnx6Mc+rqdGbk0x4TnThgU7BC6K13sY2POFME=; b=kNby8qbhSvkAQU+f
	o+viVz24FO74MfkKbVPx/SkcraBCc16GeP3vbVHxU8z/q6XakW/RHBK7BqPBWx3q
	E9OizDUEJXiYXdwma3Os3Xr/839mrb1Ck7ruXevKpd4GyFP8RJQWBtRS8TNaF7lW
	/d5V0QIhFexsODHwb/SK6GPzIjGlFkpDl4eJ+AYxTMl9ZbR97D8o19pWaeyL0jPk
	7XqreCX6TFT7/0gPIhVYDrPWWnGiSrk3zPRoxlgRqdIqf/fNGi9GVvAc6ipUfX+V
	YYWzvW4SqHxpb0FqevNaP4ogvVB09mUic/CToAeIHCJiK2G4NJKImxRqCVVRAA4W
	OmX4TA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9jcua9kr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 14:56:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b802961ecso10789901cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 07:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775141760; x=1775746560; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+gmvqmnx6Mc+rqdGbk0x4TnThgU7BC6K13sY2POFME=;
        b=PUi7rpSoJuS+puRMFL5GO+5m5Fpj97YXytcOFWxepo42pdfuOfMmcQHPeG8jPayS3W
         +N3AZ1KaDCVXJ1ox0Y7wbja+/SzuBbcfFArADk2uXLq29sr9SMDsOtG1quRcjx2+UWM0
         j4vttR/OIiNEzyP0E7kYbvSSzJ/quzjmCh7LtD7vQ0iIa1LAqnLmFC0I7k0UWIlPS4Ll
         3RNcrbkQRgJMbf3j3nGnwRIJ0AVD774piTeKTKCEJENAW3d6Mwri+CEOUlRm3sBip92s
         AwRfnqXe2iPwuGIzsVJU9BIMIZ8D5/1L+2T2G7prW3RM+/yjPqQ0p4gtT42gaYT7trXW
         mjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141760; x=1775746560;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j+gmvqmnx6Mc+rqdGbk0x4TnThgU7BC6K13sY2POFME=;
        b=cO9HGiKDA2V963dlLVD02hBQFn6+Cn3VSrhiOY3QAUqdkGasGg8etMOpsJbrP9sh05
         OdiVnMwBa3x9MdQNx+FqPujXMBLNt0+VcjrCAvSj37iu1sPa8uoGGtcDZHb2r5QiGP7A
         PCtRz84T0NRd0CwJbec54fQiiQ4fcXUyss6UH7XPOD7Wk1eK9mHs1nNfSfxkxxa2Cqh1
         1HDij/QiCa4dzNcGzGueZqRo2AF+Vuqqo9aqAEgWwWx48cneiTIfC9wdMrt1kLmeIvYq
         4nzzZLSo9+Ez7xbLgXtP+4hIxXE0UlfHMwqOZ6uE//xehNuWAws0s0J5mVJN+s2G3iFh
         aQvw==
X-Forwarded-Encrypted: i=1; AJvYcCWxHVYlkCTpIJ6KUHlFN3tld9lwQXtAaZrHVOatp0TtgzYNJSGR081+0CEWM5Xbt10TnPOHMjtWYfIfCMBJB4xf@lists.infradead.org
X-Gm-Message-State: AOJu0YwScS3ehsLUANTnydAG+fVdVYodGYc+UkpZXYVuNMtiHuCQGKJ/
	UaypXd1f/7TOcvp7JGXFUHWXNKYvWeSfSNtgpYDaqsBqfgP2ckijwPupIvk4eMjZ2qrCvJTaJ0x
	uOtRGRGuI2u+aUdjUbTF/txbtGFPlpA0mb6D1OPRTIuLE+vVnFAGCvOQC5E32nBexdgnouSvrui
	VyJQ==
X-Gm-Gg: ATEYQzw8lXetMzVosvR8O0f9N5QD5LIKFgE3mjJ5ARe9Q3qsleSP8qdTaBY+yx17Bmq
	1xbyC6jAUenJRZGJ0eaLkyvMotuvPtEhCU58/bW6EJMUHwqogFl+Gp+JyGaKFQanOlE2whyOgZk
	zESRjmYp/IAXZddheAEdbuLROJpREDJrcnv2hk3sB7nMSVJp26d1jC0rc88N7uJRg/HcJ64bJ9Y
	y813Lf7zT5t8zrxXhryMqegh30y8gaZ2mP/qnrJDTzfT1am5YHEt2GYs8qP4ow+Sx2f029xH4Zi
	hj8lOLHn/MjOkZ7eTaQKNKD4wViYeVytSKnDxSg/DODrjA606eX3+N3uklnZVMVdaFvEyb7yBia
	34zbXP+f+iWN4sl/lznUaJNvOuRHqRZUmNq7CcArrCOkMP6HnD437
X-Received: by 2002:a05:622a:1482:b0:50b:277d:efc9 with SMTP id d75a77b69052e-50d3bce073bmr112580091cf.39.1775141759840;
        Thu, 02 Apr 2026 07:55:59 -0700 (PDT)
X-Received: by 2002:a05:622a:1482:b0:50b:277d:efc9 with SMTP id d75a77b69052e-50d3bce073bmr112579421cf.39.1775141758845;
        Thu, 02 Apr 2026 07:55:58 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5294sm7234038f8f.35.2026.04.02.07.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:55:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 16:55:15 +0200
Subject: [PATCH v15 04/12] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-qcom-qce-cmd-descr-v15-4-98b5361f7ed7@oss.qualcomm.com>
References: <20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com>
In-Reply-To: <20260402-qcom-qce-cmd-descr-v15-0-98b5361f7ed7@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1476;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=EVDb1irXK/80h7Y6DY4Kfs/+E6/12M9d/9hBrF4TLTs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpzoNu23GADjlJCRDcsn8vhTwpGPYfRCrRUbm3+
 nhopRLKKh+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac6DbgAKCRAFnS7L/zaE
 wwFyD/47lE829UP657get8D7cIgkr4J9w+JyPNijwVv28MDus4Bdqt4RIdyqaJOqlKwEB4799lE
 1SGYs4j0Rml+fB/NqzA+gvStZNWs9yF18pIS2XVjceGrxl7qEAhTcIR1mGV14G9sjDNKUvgIpB+
 2aWfWhdfg5TxTr55fVAcr3XveF9jtdkHr4lU9toHbgQMY77ey6nPrQ+VGhfvacyJvFM7nSDT9o6
 Fqj23lWBB6BzMiEwigVQTPJb9f4AaqvPzMR6lp42BiqnRHCw/vjb9lgwMmaMAUYwkZ9HB+xfow+
 ZQd35vtlLf0cPf2A1zUhM0TvVMrmJGnGtIZqhjKujpSQe6lg8m4CeI2Ex4Z2gWm0jXZm1Q0c9Xs
 35RNOyCcLIuoICyPDYEEDpBivmbPPYwBoGYkua7ZfmyEpR1SU2S6d/6sldD+fVNYBSSkng0SXvM
 QB6FPlF087kfJVMpFGmldX8fqO2K3JoM4ijy8khWpYP9P9AjCHCtTWurfmwI4Wlj0R9P1S9BqU2
 4L4fQOauy8Vik1aRb5gnrCaJWapZnucRrVjf9i9kHm9WC1p21qbELBaUuPODzkfggpVPjB99W1E
 G2n1XMmM1VJYts+EXj6U7NHX9OE17l8u+LY9nXyUNWzmsD8Chv7GKMt3d2FeiDCU5i8zQuW3LIh
 7rc8aAnrvwDUFUw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEzNCBTYWx0ZWRfXzB+j0ya6PRaB
 1kpEzoyBPdf5piTmCA/88CvpLovyiRu0T4MwklObAdKeFTApUPy1d8URe2lhlkcjEpNWP+ZDvHQ
 2N7kQlR03dH5ywrsJLhrcoRC1Bwsm9yzFJgsMe1xgWh8Frhx2LGqoyFe6VeIZUbxf5PwCiHyD92
 hoEp0KPYv0suzXzOnBe+i66MybB4SKFnF6iBB+/+Vu9JR98dqcHfCskMHHLJiJpfNAvO2+KhEd/
 pn7WeWoCQywB8WOA3IPQjOGdtU5V3t9haRnAOmCxdo4vJkFOvzm8ynEsnd0+62u7K43ywkW1sNh
 qmB1B9tPjV1F/FNFTQD0JgM1Bc67thstpLzTe5rpVYiDpT+8umplpPdkH5/8wtzN2JkU5NGZvb5
 QjrzYmBMTLuCbn6IVDe3myQmIYOkWf7CsYLjVeHPjM/pQBjZgeE2Bk5dfvromhr/+fWm3CIRiNA
 iysIKFBt7CtgAhCflLg==
X-Proofpoint-GUID: 0EvGOqpyGR1ZWfxGOWsurKdWMwhOpT-j
X-Authority-Analysis: v=2.4 cv=eYYwvrEH c=1 sm=1 tr=0 ts=69ce8380 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0EvGOqpyGR1ZWfxGOWsurKdWMwhOpT-j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_075601_822585_7FF30BA8 
X-CRM114-Status: GOOD (  15.57  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the device match data with a flag indicating whether the IP
supports the BAM lock/unlock feature. Set it to true on BAM IP versions
1.4.0 and above.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 8f6d03f6c673b57ed13aeca6c8331c71596d077b..83491e7c2f17d8c9d12a1a055baea7e3a0a75a53 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -115,6 +115,7 @@ struct reg_offset_data {
 
 struct bam_device_data {
 	const struct reg_offset_data *reg_info;
+	bool pipe_lock_supported;
 };
 
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
@@ -181,6 +182,7 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 
 static const struct bam_device_data bam_v1_4_data = {
 	.reg_info = bam_v1_4_reg_info,
+	.pipe_lock_supported = true,
 };
 
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
@@ -214,6 +216,7 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 
 static const struct bam_device_data bam_v1_7_data = {
 	.reg_info = bam_v1_7_reg_info,
+	.pipe_lock_supported = true,
 };
 
 /* BAM CTRL */

-- 
2.47.3


