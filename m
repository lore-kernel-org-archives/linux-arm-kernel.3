Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5908DC44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 08:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=; b=zHgopVgmwYY2mThsPUHfzKX6Ne
	Afv14FEgSdpFD1L8pBFzgsDRvWbtnfe8kxEfq+e1lL2SvNL3UpIhz5YUUyUPs8KLF8l0b+yjiKiBN
	YpcN0dV/BlHtirzEwMv693ZLIqLzyKthCo909dYmS3rEk9ZDF/9rUYt+EhZCjSBwxD9wJvyybspUN
	guRAPT4bJHxuj7Ktwt5944/ly0MzfxiFtWKM0VjZJKd6st6balO2WTA3PQMEc4xnFf75J0Od+dXoi
	P7OwZHH3O6U2aRS777m3gQ/wfOK0umLuifhex72giSkl9ULeSjZseOoEl6Ido78AVDv4ATdGzevEi
	mqq+Dvjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke4G-00000001ftx-3Yq0;
	Fri, 17 Jul 2026 08:37:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wke48-00000001fno-17HK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 08:37:05 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6ciLe1093111
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:37:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=; b=j9aVLAajLlQZVooi
	DUGpSa8iC6YOhXTvIPaHqRxhiSMlqRLk0vO/bvmZ/ATTK5jNYPQBH/+QjX7vsVAx
	mIWUip/74VhOVTmxr+ZIi0O4/1yMApOMei7RjjyXyjGskxiSfsDhxwvz1QHUpMwB
	FwULHxHHevdQqnSo2AkQMtX0DmFixGAtuUaMEBBHM61KCiuKXSaUi07/wn/cqhct
	kJXN5ohWNp6q4Wm6NBajFq903x3Vz51q64sDt8z1us0/uFQiqvcel2ZIx0DMZGig
	/PVS4lDRwacAq5fPEHC9fMZEtv7fo9OV5XJouDDd+tX/MqVGm7G5tQONLc47xvSp
	5RqvFw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffe0urrq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 08:37:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-520a00c7a03so28526441cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 01:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784277423; x=1784882223; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=;
        b=JFDROIM3WrT1fchWijf14HL0ie3aKPzPkV988ep3JYez1/f30SIwXfIuSJreiSGMMN
         ks6DvAi70ZbZHlqU4Md+bW0yK4PtnyM8RuI9Qx4JpRyN2oVXhCJ2WhBqVhT2F87dxH1y
         Bv6UpCGWYgHUel/zEbcCDzj4He/woqnSv5ouz7Tuz53Iff1JaMvo8r6vLrYozk/KsHk2
         IZalDEtm08po8MyIJQ0KNvo9rfU9b7OliBoUfIDIP4Rha2XqA9H6Dnhp22PKPi3zMCwD
         YbLYQmu13Ukhby+SMHzwG5dln3kOJFhWmzSrgQZa2NuOuNAY9aFGT8Q/DSEUs5C0JAbR
         PzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277423; x=1784882223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=;
        b=h+mU+PRqSA3Wv67JvHz9ieBrwA1hoWQofNwk4kczdbH7bXkFoALhIJ8MD91Z5RuSEq
         c0e47PevCL5alf0hgSmuTQONWfWDKSN/E2olEuBpKzoKv3a98MAcamLB0rXPRdu1eN7Z
         eF+U3NdtixxNnJAJOjB8zcjB0nUqWaa+7w9zsERUQjxl1B/GzukESOl9qKBVFv0UOvx2
         urLXQCh1rUTPtpM8YsEQflDD9O7qR2sae0zlGDo8Q47h8Vqoxqct9jZlZMCfvO/g/Fsp
         w6T2GjSUJbfSaDXYhpOS0iN1pQgbyxE4UK1p+ExTXGHTu3XvFqngD81Et2zO6SReI0Hb
         ql4A==
X-Forwarded-Encrypted: i=1; AHgh+Rrt61rnXALd6t6LiNg3cCISX+9LlLAUz7YAC9sX9adPBM7SBAS38X8UYI8mSs/12J/xkxaMUod1pA5ykE+qLEo1@lists.infradead.org
X-Gm-Message-State: AOJu0YyH70HwIiP3c2jdV/DYZQfevNi7vtev+pvepSP+i/KnKdq8Bs5o
	vLAqTIel94Ka7qrj3lU0kyfViV8UMK+wadUI2ZnKfpY0C+O8bk/uIb+l/65Wf337uXuY3j5HtgT
	peCm5I2LTN65O09F01Wi4LEeyFEYy7OlIBjtwxKh/xto+L+1seyI89reCpzjwsb6GsVctFpl1e+
	aaQQ==
X-Gm-Gg: AfdE7cnhvGUXED0JAzrVKgyX91HOd3phQNpXR4PTDvU78joM/vphwDbmDkFtNJP7jWd
	ZFOfroHhb5NTSd/JzYqnVjHAHg4BAOn0GrsUPSpOCQF49X924KIad7QPzKB+q0jMiD+3BCEfKQC
	9ed0UukWzKxLDjb5PAvOp5nWcILOwFM4TiuIkkoHaDGssxvePmH+jUd35wwepvV4gFUw4WwE3rK
	eiAC5ZGUC+QhlGjPl4d8ZsWO713T0WfXiphOxBvxqg9pRgt1WWGpLpIVzSDUc6DoH1DNbRFJCc8
	/XZB8R4BtmwLyQoVjQCRrYdtblT2YEPwL4M+4jKKcDIkS+x7S9STnGV/xo4QcCMviwY8YyFwZMX
	C16xPKPZAX9y9h6a88EipG4AlURRdgw==
X-Received: by 2002:a05:622a:4d:b0:51c:cf4:5f94 with SMTP id d75a77b69052e-5213cecc4aamr13176661cf.21.1784277422786;
        Fri, 17 Jul 2026 01:37:02 -0700 (PDT)
X-Received: by 2002:a05:622a:4d:b0:51c:cf4:5f94 with SMTP id d75a77b69052e-5213cecc4aamr13176301cf.21.1784277422414;
        Fri, 17 Jul 2026 01:37:02 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:dc44:5b1b:5396:79d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b893dsm31268205e9.8.2026.07.17.01.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 01:37:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:36:31 +0200
Subject: [PATCH v22 05/14] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-qcom-qce-cmd-descr-v22-5-ff0d18b27246@oss.qualcomm.com>
References: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
In-Reply-To: <20260717-qcom-qce-cmd-descr-v22-0-ff0d18b27246@oss.qualcomm.com>
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
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1807;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8sCOVL39BX2AFiqeGpscXeG1puX7rtAOjEFEhJGJOUQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWemZiYXlJjtNLGq4+ySy7ccYjPOIKJ19llAso
 ExQ+mfEbAWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalnpmQAKCRAFnS7L/zaE
 w//ZD/9e0V58j83h1ywDxEDPaPrjjZLuq2/4RWGO5kSTfH/Ne1B6nPViBLwOsmv/7XzR5dRGZWp
 MdI3uNtgro1ZAris68UkveWoptrSrpHVujRS4utFrk/+DSQAb6yUreIicW1lCiVvjScL0ihN5qn
 eeWX0MyNIgu/vr1eTqbBqaf2g9BQt0RsbbEHMMloPiPTDq1hnLvsFEPv0IaA48utNMXgWVPaeYG
 SRfUx9Y9FYDcPb4iiZJDBwIdm3MPB/x8gCG2PCg9oteUKIAV+tSG0ZOGvvBvfdJQPPnrbjTKaJU
 6/mApnI3INj3DvBk1p5s6kH1Bur2OrrVLUxc5d1siA3idZ+llzlLbmxQzdccMQyVTb0ompSf6sO
 gZtWu8zBS89TtILxZ9LK88ZKhljzJg0fyFbreR+pcDxZwOE/h/imtbh+tUTYCiNiGYS9rRyVCWq
 C6W4cFq6rAH1rBOm0vumliGPYPbhBRXWraEcE0KdwXRls3g1dR75fE4FFqA/e+gXVgT/rhkCspy
 eOckOcmLQKfsxu/uZCiOViPLvTJmSp4UgSpcrmwOnLjzC0jJfva1shM1WSt5fZckAn2BP+YzOhV
 ksy8IwZrKA+DWAsnZ5VFhE4vD4UQBF9fgXlJgLXIEtZ3xkiJhslevoHB1TFfe+dlAKlXVuvQTsy
 7iHJn6tRBfep1Xg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=deWwG3Xe c=1 sm=1 tr=0 ts=6a59e9af cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX/ZMRKcf7JHdo
 bIazfev3KlKs+/LDZ+kb7BvsVdXXFKCJVcsjajnYcz2b9ecgTr/ddwMZVAkYVeKyp+sEE0DqevF
 R24fDD0G6uDSvfxhbOG2LeYHlM88UsKETmIXw4MRy77H9qGiBhZn7s93h/zTKQfUHd3inT5My61
 3YXmdAQ/VMxJcZHtpv0JjXlikOOAH4kLWVqaf7/W7nmLc6oFHUZlUKpLpDFeit/ZOzlgKGPigAA
 3VMdJB0/KdC9tuC6dMQlYUO3KpUw57bGfsjemahd5547TuO3EgX/Imd9oGaR1baR+9xrlHLMqB6
 CuGp6jv7ZVkRv6KNEjhrlRf5bt+Bgo3CfUQz7HpF7KRC/BkZdpFLg/V0Ebf5Lk7iDRI4v99yq2x
 umj1t/BJZKDozrSsOXtFJyqKxAAntYpGag/zFCXpW8mgxCiaz4VRbLhWBYeUhuVIlwLlsSsdqmk
 phLm0k2qCdhsYzqI+xQ==
X-Proofpoint-ORIG-GUID: 8e4saIGUjW15kDXw6HMwsWlnKW68fOEb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX84Lhr6ZQp0vx
 cJoshS0z7xqqm+EfqVcQgTc2a+vBz2s1SNxpvyTBa9ipLD7I8y4xVlLeGrGSzDz7VeVpks3FbdI
 SdkhlXzvljKBdDNhitpcTZLJL6Vxim0=
X-Proofpoint-GUID: 8e4saIGUjW15kDXw6HMwsWlnKW68fOEb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_013704_462513_BAC769B6 
X-CRM114-Status: GOOD (  14.80  )
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
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 8ce0fe085c5fea6cc614edd692b5cfd264b94d5a..f3e713a5259c2c7c24cfdcec094814eb1202971a 100644
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
 
 static const struct reg_offset_data bam_v2_0_reg_info[] = {
@@ -247,6 +250,7 @@ static const struct reg_offset_data bam_v2_0_reg_info[] = {
 
 static const struct bam_device_data bam_v2_0_data = {
 	.reg_info = bam_v2_0_reg_info,
+	.pipe_lock_supported = true,
 };
 
 /* BAM CTRL */

-- 
2.47.3


