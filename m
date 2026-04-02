Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D460DCC6B02
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 14:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=byBhms6klEiQKAIzzwk/0xHdksfuhIUeiAfPpFlaRio=; b=l8VOJ174SrqXZORMS6TMoklSCq
	8aeW/xj76Ajdss4o/XnrOEMae/0zCP8Aj1t/lGMhbEZKh8eNhEkgb/MgAHxTEn9Ww+MQqygQjkG2z
	K2ovMyWS3N8z8Or4u0SSKI16pdQ6vROfhO1sSnJmyKyoopIUJkJqSLSSyP23aLaGRkJfaNLTAgAl6
	o7QtchaPRSBKFf9MaKWWoXI6qIT0lBtb3o2idvvefFC81oSKssuTz8LMn79iRO4r/LeEi8L3YuqON
	tQok+z5y7ivl4nLikdDtBOUzZaDrZH8ltSblfAM2XrSSvM5gUTH72ZaAkRWTYeb6da4MEBNo842V0
	rV2mty6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JSo-00000000NxR-0Gwn;
	Thu, 02 Apr 2026 14:56:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JSk-00000000Nvj-44Y4
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 02 Apr 2026 14:56:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=byBhms6klEiQKAIzzwk/0xHdksfuhIUeiAfPpFlaRio=; b=cR+kjBH+sD55gFZ2bnVufUSYGB
	OtZoV4Zi+4DQMg0upSohpVTBDdWPCyY4DalSVOOyIJhhXYKFcDZr9JzyCxFgWbaEtiFMoa0qjuFd7
	AEQFiiE020W1pDfDvggoSYTJiMttW8HeRiMPPBwSohQEmsHy4K/xI9fg27Fv3rhp3TI3EkDvujmvv
	uk9KroDsn9DM3s0HcdOHDsja51DEDmK9aT2a2MLxrXHKGq0N+uLtux2dSju1Wo5Cpyl+E37mlv3KD
	tyNpZlUPhkZMoUltgBMz8eEmxzyjixDfMpD4goIaWgE8xDsDCDk4+AdWLHHGFCBjw5gVubenSCkgd
	2F9DScVw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JSi-00000002jCA-00ho
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 14:56:01 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632CMnYm1128979
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Apr 2026 14:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	byBhms6klEiQKAIzzwk/0xHdksfuhIUeiAfPpFlaRio=; b=DQMlf7vKYW/jASMa
	/hUao1IHVYv/LediAjhecicX7izICAcEHa6f8PGjKTzR8Unw4OgB/mci1PygCNps
	9NDhxzRe0+Vvv5Inke8cRxSG2jK2hDnMhLTDm+jGGqo/nOGFMbV5koReZU1Bahxp
	aDuAc16t/Yle3f4saVm1Vp44qHkRNp0/7/2jbCfWrg5lCG9E77Xweeh8cjYnfyDx
	8uzuc/ZwYShQ7a4Uhy8WCS1VxTIH81ffKVXtOseAeb2oqhsG8wC2g34eWSK9Tn2q
	5nFQEJHj/6Yl8/WvRL7QPLv+exTB32uZH2n+AKNUu7vEiAkPHaAiyago97oQnehZ
	NevROQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96k9cn5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 14:55:58 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b31cff27fso7779661cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 07:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775141758; x=1775746558; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byBhms6klEiQKAIzzwk/0xHdksfuhIUeiAfPpFlaRio=;
        b=cVyyz4tk5mgPD0TSwVY6HW+PxzWS911IqRzjuy6jop3GPGW06vz3S/uAxNXj1KSimv
         UCTUH1zKrYLoyCcLQzbwlrefOVe2bjQFrL6rUUakudmYTuwKaTOyn2w7TF1kctD/NBN7
         lTcaJhP6FRKan2CCP2NJu6yiM2D9KCjj5bPVk4D90UgdX1Njm9bkHtJ3QK2PDjY2K1JE
         xHEBDbLvLstSShMbtPljFNWplUbEl2FthEjllsY3sWbYUpa0f9KL/abIZ9QHaQRM+rvN
         NrqwZOLvpfVUM1Fh42iLyPoDBbT+1cMQ+06pGKpbWauDpJp2WJn0lIfqktIDZkDiDehM
         8y7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775141758; x=1775746558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=byBhms6klEiQKAIzzwk/0xHdksfuhIUeiAfPpFlaRio=;
        b=n/andfUIgQKtKjAM9+s3QuWzC83U6K02Nuq1qZt/rpjgnzgPW4dLswnAVgLQhTqPUu
         rIAaxCOUGe6Iqb2viagFJqHZiM8Uao2vKMHea56W+wa80TYVAxXJ8Qm0c8o+5JGhgHu2
         UWLYlHOslt/Yxd5FscUelB8hmlc+7M+YzDODWndWBZpSyfI6FIATaaa8hd/YVcqliUIc
         2nQ9ryDBsEnSkVIkU0rbGradvJduYoUMt6XO/i6TpA49XOhEdla3SMDpFi77Q5RE6NRr
         C+A34jZ/vcFyUMyCou3T6/X19AlJ/10JyNeL6KpMYInle2Sxn+CcgOqu/p4vZFOTssNb
         SLnA==
X-Forwarded-Encrypted: i=1; AJvYcCXTmcd1biZWsP/moBVIrhFmsOFwhOMUY/RPPNEpjAHFx73uX6y0maSw1fgav1BLeLVmPSo8B9+vDf+Ovk3pmOuR@lists.infradead.org
X-Gm-Message-State: AOJu0YwBslab3ew5LoqeWmytTv+SXFHDGjqwb2/7z+l5oN4803hUM3t/
	aXsSzclzYaK8chK5iWz1R/bytMDuXMeyuK/lz37LLNzoefGxjYj/WJrrt/odOQC7I9A4WpDIlKG
	+oi/E/K7itRx+Dcq0YA7fU7Bi5rZNH+0gkHxLOCdfyJIC8tuOTy16PwcOQcIMtAFSVze1CGzg9U
	XjUg==
X-Gm-Gg: ATEYQzy3jPaDzgPmeWYFCAUaSQ6bhKNziAG6SV4Ym3AZcqlVkCkL/q/nq6meUWPpkL7
	Azx/DeVoNSKkwqYhFov16MnDveirbNtK+BadNNVcFRr4J1/ubeI2h2R3fD9cWfaDd4Q5Ddwpngp
	BvCFVxbgs9n9h9dv6Koht6na57JWc34rww1hCaW6q4ORhs6D3QiX6oJknFP0SGjw4gTpbl7ahoA
	UpWgQvIr8Uf5zTPvGcyXCxac7j0AaXrJPGBrS+V9Lc7TdpGwWl/dQH4pcRm85Ik8zlzBLTO8b4O
	wkkbwBFaZ7zx97hU19KoM8S4Al48q1t8hd5CMUcXbtcgQwtw2AMDb7OsugWG+z/zSuwsFQpzoEc
	LF1CUX5u3+zxLha6ERCG3Ve3fs7MUftBMYQUsWEDEbvyScEXll/dC
X-Received: by 2002:ac8:584b:0:b0:50b:4051:2cab with SMTP id d75a77b69052e-50d3bd93571mr91421411cf.58.1775141757715;
        Thu, 02 Apr 2026 07:55:57 -0700 (PDT)
X-Received: by 2002:ac8:584b:0:b0:50b:4051:2cab with SMTP id d75a77b69052e-50d3bd93571mr91420911cf.58.1775141757095;
        Thu, 02 Apr 2026 07:55:57 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4f5294sm7234038f8f.35.2026.04.02.07.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:55:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 16:55:14 +0200
Subject: [PATCH v15 03/12] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-qcom-qce-cmd-descr-v15-3-98b5361f7ed7@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3778;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=RN7fpsHiCZHYCJzNDBLJB3M5MgjeycllWN+nZFNR5GU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpzoNttrOMD5O1TrTM3zWVJLqAviQNXIGYfDsLU
 CrGd8qok0qJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac6DbQAKCRAFnS7L/zaE
 w8roEACMMRfh3TRLFF/S5nKqbwtmE2/WOd/n+9qk8CukMnOw/tPJsJotraNuFZNfuWFTZlvOalH
 Q5Pcgr4AfZuQj6TTlajUMp8KQjFNI+y5eQDREiQoF685WY7ADulpMMb2I6T98ayVoM5shSiBlb/
 FraalmH20R6UXKRchT3RABrIY7s6Ew57Z88q+D3wjtcNQEaxzZjbC2VzrKttL5j635eRTUpKjcH
 NPnKw6Uk1FeZYQMrPq9t00O98ACv3vVWMcxHIaO0tdwLpumyUkE5+fMmwFgYFR6M6a0FbreUDVc
 uf8nFY70XswRTiTjlr62LiSXthcPO1YOTAt5sgPAcMJM9ReAlpPsm4vc8CjkTTWc6T0N3ArmGTJ
 hNtjZT6IIwS5uAPd8V3m8373rxuMiG7FEKFPK4aJwg7IzWUdL6VDJSpprcJtN6NKSpquI0AAmXq
 T1GTVdP3fcK2SDDAkja4DnOTOU/YysvlDwX72VuKYqXABXNAL2abiPcPEnCg7zbd97/Za3oIt7I
 dfRaOyrZ0fLSXpuGWd3sT9yHg/GkjcsWf9xcLPTpNGzYFpZBbnGdOBXsBOSxVzZInTMXoKCOQgC
 pXqDP5n5kg2UVwjJQpwH92gyf1TKA8RKa0w3IV9kpqRLqcLVQEWt3fqQTX+BiFTG7YeWgnOm9mB
 JLINzYGU8FGdnnA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=doLWylg4 c=1 sm=1 tr=0 ts=69ce837e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fb6uNmSZeVr-t7npd3wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: a3kt-QipwnleJyfWPjEh4iwvpHXtQPON
X-Proofpoint-GUID: a3kt-QipwnleJyfWPjEh4iwvpHXtQPON
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEzNCBTYWx0ZWRfX0HfhoScArkO+
 /KpWrHgs6veMPr463jzazlsN400Mf4Y4dyn4FpuFetPNpRc+GSyXe6hM21tIlXkLvKX4HsTZVwk
 ZQa4nMb8cS5QANmBWK5mC7ArkK/B/27g7czGTaOX2GF3XkxH0NIiKlMRNhF7KqZgU3IdGt/osoj
 rOC7b7lnOK9x6aV794KYYxCJy6BOP6O3722o+4hPgGAOBk0elihQbJumC0lp06pAFlBgdHfqJJQ
 kegbetjwIwSEUuArHy2ZajvkN65qFHM0lOFq678khCKyrdLGBUQ7mflvWAePsy/vCBKq8rFh9Sl
 UTWOAM0Jb3Xxhw18Jq5Bqx2urI/Fu6iEWVibobXiuey1IR9tfQbBnSmvPzR9EDE7jaw3320EQ57
 jLMdGOFmK2BwVmki+MBiqTUuGjsjYs5e4VOTNnCsI1G2tw3ZXGZXXkGq0QuFSW9YoEqLxxqUvoU
 8xk0RAzCUZ9zzTdwVkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_155600_382868_D3AAE9FE 
X-CRM114-Status: GOOD (  18.81  )
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

In preparation for supporting the pipe locking feature flag, extend the
amount of information we can carry in device match data: create a
separate structure and make the register information one of its fields.
This way, in subsequent patches, it will be just a matter of adding a
new field to the device data.

Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index c8601bac555edf1bb4384fd39cb3449ec6e86334..8f6d03f6c673b57ed13aeca6c8331c71596d077b 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -113,6 +113,10 @@ struct reg_offset_data {
 	unsigned int pipe_mult, evnt_mult, ee_mult;
 };
 
+struct bam_device_data {
+	const struct reg_offset_data *reg_info;
+};
+
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_CTRL]		= { 0x0F80, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0F84, 0x00, 0x00, 0x00 },
@@ -142,6 +146,10 @@ static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1020, 0x00, 0x40, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_3_data = {
+	.reg_info = bam_v1_3_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_CTRL]		= { 0x0000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0004, 0x00, 0x00, 0x00 },
@@ -171,6 +179,10 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_4_data = {
+	.reg_info = bam_v1_4_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_CTRL]		= { 0x00000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x01000, 0x00, 0x00, 0x00 },
@@ -200,6 +212,10 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x13820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_7_data = {
+	.reg_info = bam_v1_7_reg_info,
+};
+
 /* BAM CTRL */
 #define BAM_SW_RST			BIT(0)
 #define BAM_EN				BIT(1)
@@ -393,7 +409,7 @@ struct bam_device {
 	bool powered_remotely;
 	u32 active_channels;
 
-	const struct reg_offset_data *layout;
+	const struct bam_device_data *dev_data;
 
 	struct clk *bamclk;
 	int irq;
@@ -411,7 +427,7 @@ struct bam_device {
 static inline void __iomem *bam_addr(struct bam_device *bdev, u32 pipe,
 		enum bam_reg reg)
 {
-	const struct reg_offset_data r = bdev->layout[reg];
+	const struct reg_offset_data r = bdev->dev_data->reg_info[reg];
 
 	return bdev->regs + r.base_offset +
 		r.pipe_mult * pipe +
@@ -1205,9 +1221,9 @@ static void bam_channel_init(struct bam_device *bdev, struct bam_chan *bchan,
 }
 
 static const struct of_device_id bam_of_match[] = {
-	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_reg_info },
-	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_reg_info },
-	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_reg_info },
+	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_data },
+	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_data },
+	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_data },
 	{}
 };
 
@@ -1231,7 +1247,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	bdev->layout = match->data;
+	bdev->dev_data = match->data;
 
 	bdev->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bdev->regs))

-- 
2.47.3


