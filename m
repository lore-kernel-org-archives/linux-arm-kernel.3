Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785C1C44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=; b=U8P1gcrr5DIsYo2qzHDDAy+ILp
	CGGUiwRspMfL7cvg5BCoMeeI3gqizFFGLECXzmJuLx7pq+qX1GA4W/gtRvX89b0Q8w6bd7Lwv5QuA
	qWoABOkKEE7wnHyJPkZg19gbB0MpgICN6czR/LXRhj9A4JamYcyQtB68LebCFanOb4NTqvVgzXK1j
	zKV4z/SCDVLz+4SL386K1Nl/UUTgB0h4gh5ip/vX09Y1QcBqBdnkHwZSCs+9/jRSiO5oyCfsL8HGa
	1hLvZcYh6XWrkdg8R/g07CcUnYEBiknpJYLTAzoPJSx0JafUhSlXLd2y9Y7D0A5fQV7MMnX72pF+4
	akiuWAPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAbc-00000009X5E-1V0U;
	Tue, 21 Jul 2026 13:33:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAbY-00000009X2h-0Rjd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 13:33:53 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDM4BG1890880
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 13:33:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=; b=SkKaAy6BFf5MvwmL
	31AAkggDMdENr2ZIsqudMVzSFlX0EvTgVNQrRnPbeHsqQrCkP50KMy2jevHxgg0V
	PPG+I28a/BcvYVEWceaOXf26yy534lIcc1t1ddMnXj/KNgoepYsBF/kZV9ubbcNH
	nfUwyY/Me47oFy7XMI7fZk0HaKC3gt5DPC8WGORQ8bHBRbmzv2d1NDQd20SaeX2t
	OpKEfM/iBIYKfgzKrTOMM7/I2cLZWbz10xCNS9I0AXyiMacq32VBPkl6nRMtsclB
	+CIK3GY+0q2W+SiBhfVIUC1Vxn3zYi9DOP551ZwYIVGGay8nWslX/jLHF2EdARn4
	Shm+Qw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bs83vj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 13:33:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a23afcbso99190261cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 06:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640831; x=1785245631; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=;
        b=YhRshe3I640ht+bj3F89gfHR0ZVbErF98OOi39tf6nTmkp9rEXuDPDi6uMi1M+OlcE
         4NrgCTWIBzfXD6bvosuIEEekXyAFJyZikX64JI0uuGZqXKQeHo5G5YC58QR/o1o9AXX1
         ZnO8dWk7An9qZiYXWZ+WIxsBbZymHWlqcLInWB1NdBAoF7VeLshTatMz+xG7OpeHxt/H
         bmsaGVeoqs8Ov9y65EpwPyj+Ln2iHY0Kde4cXjt1WLaA+IikGU0RvDRp2g9YHsmWQkWj
         ohYBhaYbtt7eRYNQl7Cen1ChLDbnE8qgWCRmj2lbPI8hpetnNRiyJqqMuxLf72qOy/XS
         3fUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640831; x=1785245631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=;
        b=Opy2Wk/cWBiX5+qdQHoKRCOeJiIZhCBE3br65o0rMmDGWhaM8T+DLPMqvrIPR/epW9
         HNhadEAOtFwpj7m2sH4gENuDMjjDObPdkr3+mG3ObUGhyOQptoSMcjaaZ54YkeLNTCLn
         NVBszgBUf7nczEyCKXmwHMBvf76BvlcubUaxK0Q5dmJmsVX0hRrbYYKbaOj0jWNccVxl
         8b/C5S0QhhD5NjvD3Pjni9D6F4wHMRLfWvFW+qWR4ka3iwc2l9sssl2kxwfuRqtflXaS
         f+k4WgCvdXkY93/5p03KPKFMy1tLAGpqLhJxV4s8EFzsNze+Gez6hc9B8SZAmfwwfwq7
         e/Bg==
X-Forwarded-Encrypted: i=1; AHgh+Rq7EW8dLD1xKseRfMiAWUM4A8WgD+BpL0v/FFAAhn/g/t95Bfm98LIBG17pBqZmrCiIPF8XXDRREocJGk+f5CVg@lists.infradead.org
X-Gm-Message-State: AOJu0YxMWrFZJhgNg9/QYs6RK+tf2odMJXRwZe4ZrmX2lPVGxFF+00oM
	KiwH8fsURzaIUuVFHwapBZUbostVDwCJxRh2QctgbqGWmpjsmR83f8bxPoyp8smod6JpalNgRp7
	gO0fSVTPo/S7AUV6IjPprFmYW4K1hfsUEOhakVnXtQ6KJesv/ng4m20ArygHILtg9MiUZNgZFpo
	tVeQ==
X-Gm-Gg: AfdE7ckIu4oSO9SzNs86RKJjMr5bcd4V/JpZ7nfwNOXgO3enef7kzV/0BYqWIX7DViC
	EUTzMA/gXMuZQxTHq8NZoJIlJ+rEWsnRzoQw0bgYzzym1ANdgOUzoR0nW8o8OD52y1daBrDFOMr
	HRUgb+ACrsgzTqqjJqutdSG+qttRLQnYVf2csEqre90bqrd/ZfbiaNo8LI+hFAZtBLwYknaVsyk
	ggIB+mwnjUE6o1j2ZG/umrBVyH0YXqRqhiiYpBm6/hXLYNLVCYX2u93eq+hfiM0kLruSAFiLEoJ
	JC9pjm6OPZILZ7S8+BALt9O4ZaQIO5eLD7kuH+UA2bee2eDByHE7aBYox2NElh9XcuX/js4Q0UM
	xpH301B/bhj9Fj2IBMS07QGqo05XU1A==
X-Received: by 2002:a05:622a:15cd:b0:51c:7b12:1208 with SMTP id d75a77b69052e-5213f66b8b9mr181067981cf.86.1784640830600;
        Tue, 21 Jul 2026 06:33:50 -0700 (PDT)
X-Received: by 2002:a05:622a:15cd:b0:51c:7b12:1208 with SMTP id d75a77b69052e-5213f66b8b9mr181067221cf.86.1784640829940;
        Tue, 21 Jul 2026 06:33:49 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.33.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:33:49 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:10 +0200
Subject: [PATCH v23 05/14] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-5-1be02deffda9@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3UiUo/1PbzcbkzvcpLMhdrqFFhhRAk9oqyXd
 8omL3yK9CyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91IgAKCRAFnS7L/zaE
 w8CmD/4kXWevD3HFNqXcnVs7UHVfZ1TCQg5k/DCcmcjzG6RzyH1w4f+ztuqFmtixd1OZiWYssEq
 P3qeTKJ8jkNWr/HjMDlj9uj71EnVKCGuXloOrpoaGwMDWos2zcG5XuW1+felKeiLKWtBBGWcHFK
 guJNm/dcwKUGKG/3UfNYaxVOvztIUiN2QeWTAX861SRbQQOGnOGrspEeCYxhuOOMwAAQDkllrI6
 +DXlpNaA4sIIbjfDkwCEeazVjOTC3LyDuPVIoVdxLvZb8eBlEDT+/yrm46Jzz2S401l5D4HcM9v
 Rweo3bWIltJVesr+9AuaDQQP3YgG8rBFXLx3wORnmCGJDbFN/nhx1vmaiiOnkjxy663/3VSZWiB
 zPaG+lP3p20tM0/TumWw4FRfPNAAzZ5dBwXOPWOHerh1HHuFI4tQ+9mU1rKqR+jgkpy1PVMGRtb
 iKUwiS2CJzVzEXgVZ+W/tmtEuwwO5xQEUy/q63kwkQNPGoG1gpplMceb8i/quCzJvisyEJ/9ctC
 u+ARBbfmzLj7wDZc+eY8Huq6QV6wOci0I5i7Xd/e0utYBtjxZmXxqmoXsh6prinMWTQl3p3KQwq
 kssm/iI/z7CKeQYWpB23NXUN1z4f+FKA31E3taLQF0+rxW5ogTUdi05ndIVjrtDy5p8YVxQU5YC
 a1+5TmH8EWdF03g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: K9kZWC8nzWkzvnjRDLfZfuPQsOFWafqR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX4Y0MT+ZzlhDF
 tXODbEEQ8mOQr86n9Mvt3ggfvzsdJQGbqKrpZPAACFykzJ0C2/BtBgXon+Oa3t0sDQN3e8lFS8K
 PtLTdG3yMjkJh4ArcWLdi05RpHuuDCTXlwF6ys6mKJZl7dI+glQPEJ8rvwINs/VtIJPN2NbOdc4
 VekHNfd73Zr8KOi4T36GfSDuQa7SNrTuLq4/s2dA8NL6WP9X85bmGEhvTFFjw/LP1eRamkkZ/CY
 1nLLRGb5vRzRfbnC+8OjlQcHHsovAdvfPzpWJ1PzFXM2DOcSZAGABnBd69impSUeX9+6VcI0mYd
 MUisu5juY5fNUmBg5kfyS9xvSg1wrt1V9tEMx14aF74fdQXJG35+0o6me1PSGlVJnvMoaJmXcRA
 +lTwVBpFPSc6vn96FxgV/C0BPtHtgmzfvuAtIjZXrow2+1Z4Vu6lTzVWfRMbI715WqcnQlKGJTh
 p2sP0OqgwdowR+FTT/w==
X-Proofpoint-GUID: K9kZWC8nzWkzvnjRDLfZfuPQsOFWafqR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfXwIKm1cU7I9pH
 hHFHxk7z3CexP7itXJjmQhWh2SuDVB6pcmMJHv2TiygiCHZdcSJ1db0kh0tlzsQuU7lsZ+vETTL
 q55V9qtdgq6a80qohauB3+q92D/UGuA=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a5f753f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_063352_153872_317F7275 
X-CRM114-Status: GOOD (  16.30  )
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


