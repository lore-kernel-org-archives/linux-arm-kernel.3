Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B427DCD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 13:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4MzlzgFENj0SGuc5BtzYXGLVYZCfinPwBm1XxV5rC6I=; b=FVAuQdz/3cSRVEhAzY7VxyFO5I
	vSa3PvEzvqvPDWlLrO8NSsc3P5RyFyPHjSLJaH/RDoV3zUWsKCR6DRQut2HXzPsW25IGQGSAAhJ1r
	qeVzP8RXIkCmw8hREgFq5nzhHBYSKCPG2p9VDvMM/bkNrtbcYOXMZ6BGWRM5ofTPfaoDX9pw6MRDb
	U+NRLjALS9gysFPqo5APxUiB18yZF+6z/qSchJiiga2cZv58rqc4HQ+AYxFSKLILL+Q/dE9CHEz+F
	nyQ1qJxrvCVmm41wHhKqjBALLCguDpex+i4jL9yTefS1TRAvFas4Ydt+wqe5YhVPrOvVc60N13SdN
	aomH581A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrZJ-000000020vP-3NiW;
	Tue, 26 May 2026 13:11:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrZC-000000020rM-2yDU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 13:11:31 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsX8k1430486
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:11:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4MzlzgFENj0SGuc5BtzYXGLVYZCfinPwBm1XxV5rC6I=; b=EL3VlKhPKpTo8VtD
	DLli+tRTMhesH4IaeOloJm2olJfrT+88J4LsNG0YQgypjCEvqbRrc0MUsrUrvVTM
	LtYFwCY5AlRgSyriX7j2kWsROltLk2sP/Xq1zYwduote8gNdS/EsAe10ksAlNcN5
	KBj8qqx+CtWAEnp2mp225Q/FqX8ybuv6D4m+vqljxdvwJQb2+14bSvg+zScYSSqH
	4ezzgQpbBcCVt2q4dlW6DFNHez3WMXtn8VVTzxZZvitom8KobB/aDWZxA8DrvyqK
	9eUJAIbm00iontObpVKfkfCoLWjhwzhBWOYWFjEyrLNS942DMy7SJnJa4D4b6jno
	6S8Qug==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv52mq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:11:30 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-63302aca17aso4464534137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 06:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779801089; x=1780405889; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4MzlzgFENj0SGuc5BtzYXGLVYZCfinPwBm1XxV5rC6I=;
        b=FYx01PQTRMQyH4VUaJL0eF72R0zdBhsUMbHMvQkoXmh+FN7t+/nnmrmNKF6on055Gb
         q3nN+RvDMNqV5zOqoCNjOyiWoYTu3rZnP9M7JPwQGnL2LzMZQL/Nk5DRiZ7m4+22+Qbw
         GF0jRGuTWfG0twvPZW+YJObo8FFKyA+4jWNUpANDRNwwwWALih9b8scOzp1mkk+7fnQy
         GIxbChCcAm394F0mLlLnvGUxrhHOC7raQDkp1wMAzJJ1huaq/WV4s2yGm6XbpMDbg+ra
         vT1OQ/tHEt+9ogjfkSyxbaPpLGRmz80awbDvfPuJMMG5uyZa4m3j528LdYEuZF/rgjVo
         D5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779801089; x=1780405889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4MzlzgFENj0SGuc5BtzYXGLVYZCfinPwBm1XxV5rC6I=;
        b=LPj1s+M9ewoNWJRB0sOMnOKc4+F37U0M7kcQ3cvS3lUBREDX6oOEZhdEOjzKgOFczu
         FQQHgnuqTQ4XxePL8LEJ7qJIFsGj6l+i+KSe1bsRaG/5q1CqVS8M1GiSGdHjP9vrBzrV
         /r3sQKaI8dpJoDBIPQ10UTXHkt61uwzKEfOji5L9cRDlDVs0HldVVmLBhVmHO36uaR2h
         p2VQuSr/ASJLw0EyEOsw3BHyvzXedIhWgUAOLstbRVU8wuJi3ysGFyZ6A+1Dk2V/YyZJ
         qtssU1neSyQIIHHubApGhHpg+upLZKpuSeNnGKHfl8bkuZ2zv5VVIC5tBwhwi40TyQhu
         WSqA==
X-Forwarded-Encrypted: i=1; AFNElJ+lz9b4SL+XPI5YusOWdGwkvMICbg6/Uc3Eaq8I+/CnaU7M5i9odfeLZ2/dtG1rvnrc/Urywoxj6jxgTbIa4byc@lists.infradead.org
X-Gm-Message-State: AOJu0YwsTvW5LerzV5GbE98UM+PsTRq9aLf7yYI4oArxpVugwcJ5GBcr
	azoiLX0jUiczE1w313eZpOXMDc3ZOTqi76a67zs1tZGE+dZxUMpwQfDgP90diCmzwAJJ5vIPhIV
	4rtr0MY5lKVE+EPUGngkZt//rRip1T2KKUaUQKzZRB0n5cWO4yCF+R+iUDwVOfELgssH2+E58kM
	8lKA==
X-Gm-Gg: Acq92OEsCf9C08vELZQsbPk2rJNpNqk0nFfxs71SCKbi/IfHcxVtcUD7N0DzljnQe+H
	EBoaqj7DkqkHrzmb1Jp2WLoVUgxabiJ7+wYnTyMszzHF6Vv5XNDy/Xr+ym0N3ohdvT/Eh4osXCI
	T9OlXajRPqweK+zehrLVPMJK9VSdshRiAKEOfjEJzzVCDZVuQRkXdiB29n+UYbbAe3MxJ/PZy5d
	Y07h2TfOBYgzyKAH06X/UhjvAzXRtt6PX7uDBnliDcuN723Ym9C+t2qAh/iFI4f0/P2//uKkJX+
	WQa465F93V/3flA3DrCGtH+huIH8YdQzbr1Cz32xNN//2xVNEGKUbYRcxwr568HiyY8kPZ8plFn
	EtnFMcXlRDxX8JcVHu8PVVVjOdT4ppaX/DLRlOE9JA2+SV4CMuJ0gdufH23BvNA==
X-Received: by 2002:a05:6102:3e15:b0:631:2472:e832 with SMTP id ada2fe7eead31-67c7fff41dbmr8318246137.8.1779801089263;
        Tue, 26 May 2026 06:11:29 -0700 (PDT)
X-Received: by 2002:a05:6102:3e15:b0:631:2472:e832 with SMTP id ada2fe7eead31-67c7fff41dbmr8318181137.8.1779801088719;
        Tue, 26 May 2026 06:11:28 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:15ba:1d70:65ea:9578])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e484sm34259426f8f.30.2026.05.26.06.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:11:28 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:10:53 +0200
Subject: [PATCH v19 05/14] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-qcom-qce-cmd-descr-v19-5-08472fdcbf4a@oss.qualcomm.com>
References: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
In-Reply-To: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
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
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1530;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=XWQU2M8GNJi1hTXicUIAjauPbHJI4z5KvicdSabu0NQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFZvsBil2ok+w4T6U//UrDGniLgPdz7SgFTDmi
 XqSwfkI+kCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahWb7AAKCRAFnS7L/zaE
 wy2XEACuFrcK2feOu+lrKAd8U6HtwFQlksXURX5scLbVJhJwrkfs+36Nm1ElbTghc/YDaixxI0t
 qTcdKbkQNAY1Lj0H4hwEMCVdQcclcPofcTtvt94EuA24riGm3o4z/kU0hOi0kMMftMSq02uJlS5
 CxMy9RaV5m4P3e3+OgX7e5ikeGIM/vmLAuo9Fz3pBtsSI+OqRNbhFEYm7XO27Up90UfUl/ul99/
 Qtj137V3CbapUiQUVCVKarbJ9+BvPMQD8xiwv/+4Cefb89tQmWvWFFJVarRYuU0l18ZJio1As/V
 csVRhBEeplMDqc9pbunOnfPUBZITMbOMcfIYv6y3g9VjjPpw8NzYRthGKf/1ygyPKzGHgThLYH4
 GNV/KrIZeZQztPmz0opQ+L11t5SRu3ua+jIs7QwWkcS+YEwMgA0lEfn3mEFGQOe/iqT51Dtbvuc
 GuO8bxp95l8fyY9N5MUaDhG/HE7IqertdXFEqw3Nv5P+RVfmeHwclBS9kJ/t647/Atq9nR4WK0U
 EX3eTxE+sl9lCyID2eYPB8me3Usaix0I2km7PtvZlLFHdCMUqSEMBPDKKcbaE3j6nvYNWAx5ta9
 YuRzKQmNzJvbXRMsNpX4CBReFikdaUvHy2TXG/WIbTVxZybsDRXb3sKfTC5SbDA9qGweBHpS9mD
 QFqiM05R4l5US/A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExMyBTYWx0ZWRfX4JyTT5vWIwN2
 nuwJ9edgRYrufHZhhs5eBO2SleLlazq6qRRZuRYQnpFXcvwjV1tnejbwuPO1h8IIJU3lz5q0ZXp
 Zav243sKMuGA5Sgw0yoMvCfnW9ZPS/MAJsRER8fpx00+6bFb5HY6A4OOc/khU4fb1lQ2hSr5gIO
 bvCdMuKxMneoUKEfeh+8KFDBflCRZeXs/PVNpHUktfwUxWus4MB08j3s+x/tsxCKi+li89lrJgV
 qo3o2Gp8MlZNKigFiWxTMlqWaoHeNRxnZf8sw2DzljSZQXYedzUxYsUvOSzzNz+yLoEk86ZCRjn
 KGJ4S2iUrmchUo9h12arlFNqgKpHL+EdMSHsfz8LzBHLlIDWu3cxIcx++EjZFO+LRaxcGQ83bXc
 xhjjgOEPL8MwL5l5uhOAIu26kneHbBw/YV8xxy9+tJlHl8s34UdLfk6WlbDYzwmc1Btjl/XkVst
 SOK67DdzWocPXvSrrQg==
X-Proofpoint-GUID: 3h42XEPh9x_2M6tsmu7ffjiWdZgX3ksu
X-Proofpoint-ORIG-GUID: 3h42XEPh9x_2M6tsmu7ffjiWdZgX3ksu
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a159c02 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_061130_762867_84E49DE4 
X-CRM114-Status: GOOD (  15.69  )
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
 drivers/dma/qcom/bam_dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 2129ff5261571581a2c086c13dd657dc63e16f90..04fe1d546be73f074c66c4a5712ad65717e10929 100644
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


