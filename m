Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C315C531F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 17:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=; b=FafF0fBiHNT+hUSmBnNcOt8mom
	E66Q5FvUW1NinwxsqNrOnsvDi/yIxI3CJ35tdU6vN+1uoCVn0kL6mPocF2xz5YK0YTUYgN/XozjSt
	2q1+6g0eyeLK2v3xrU0FPfWjGtHoejYeAvcBZls5PMIgshrblzkeD5/Tte0L/lA1PWx1qCGUb0lOz
	GbGRIRCj8bHlSU3Gpve1GlqGknruK15eNgbemg7iK820i1RT103wrbcI/wWxL9XVVUvDUaxl3kd9l
	abfyE3+6apcxr0CjwNLcb4jlmrwO3VmI2yJ2lFK4ce4xRQE2jtsTXtITRg9feFWzKC3d/GAoHBK3E
	uTI3a1rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwvx-0000000Em8D-3cWJ;
	Thu, 23 Jul 2026 17:10:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwve-0000000Ely8-0G1f
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 17:09:51 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvFZu3951106
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:09:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=; b=jbWY6Ab0LtE02a9k
	nzQjefrQYoPi8EB+5t07GosHgPVpg+XeBafY6+2+mZznmiqxx77/3VpDk/4N0Gw3
	KqzBDj8cflM9Yt9uDgGmcUUhjLvlpxYLNK/iDRKtLt4nFoRSFVnDtnxqKn5LVDgu
	6ua/VJNZtouLLm/2zeWe+TzSIKiYFVBRtijqrUrmaCimoC8cZnyKfrUYyTxhovwJ
	wZxp5RuR17twKADvSgyL4qacYziebU7z4tiUPyvHlUMFOL1+W9ocBgwYz+hHh8zN
	LM69bKCDC8R6cDAQy0PiGhnNar7I2bwydhxkit225EcxIwIMGUOC/4I4bUQ81efS
	i8KunQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkjnu9f1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:09:49 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51ebdfceddcso17635121cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 10:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826588; x=1785431388; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=;
        b=H0WN0Dh+YkC8NJyqNu58viwHLn9NttB/++5rrITf7yapri9ziZj1/uHy8VcQ+lTxVd
         0h9kbVQIfao7V7Tix1Bp1WvxMKuAh4Y+7skf77kfH/DHuGpfwFU1O/3lKh7Z/bzxtXmS
         s067NIHB2kVtd8O7njyBAK96syzk5O0E92ADFS21LOkz9prD9VSx2kIiFrr9V/160IpQ
         e3LEfJJAH/LPxgrCwmIOu4f+VMPYc5ji9103GohdOS0707qCjxvhp+Xo3j6xgUJCeQNU
         rtCh+0s8bJQwhVixHtDMpldmc1WzacMxwuUN8W5qjLbVazOJD5gnE9NFGoSudBZQxGhM
         2Nfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826588; x=1785431388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=;
        b=F9Mi6sY1S9B9AU9pQhKevptcGkRZbnOzWmU48M2bzDK4SEiA75lvGgC1GgBVGHLrOr
         r2WIhr85qvAIAYPtY54UpaeAQ5iiPTSYOI+IWBS8+elV5zSpf8U2OFFC809IXLfhDYlS
         xGkFePCkCY1iv4nkF8/Knn5AR5yVAuThFnc46ZwfWwvLwvZ8HIfpxXfw7nVo+JQFlGPR
         rR9NDmE7fsBLmK2jemsMHlkiudd5KmeXkO6Jmf3iVv7V2/1xEtEJKpnGVI57PfWZMVRy
         +wRTwU7xAgaj1ZGBq4onlSt420bUQGFpSzSp2iGHK7t9Ayq+L507+HoQXjHwryg1auvl
         rFPA==
X-Forwarded-Encrypted: i=1; AHgh+RofNrv71IJZXMJHCysybEAx/moAONU9IqoZokdp2F3X9TRx6o4gPAHD/3NcWOLJ8PZIqbtOxKQN6fiVSSyhhE1/@lists.infradead.org
X-Gm-Message-State: AOJu0YzXtJjAd4YMsEaXzNYOQq4cKenvLr+Wi8u4tzrFiHycLlSLLn0E
	S7AnBzJUi7j9r+a+HFtRTupTy3hej5HNQwwJb0aguB0UC90YSXOhvSCLUWxwRTjEq5ji2GDhgXK
	LkUsCYPGe0esJ7+vUXcncbFEUBnrfV2F534n7zoWofnzevggrXjsuiAzXsXRy8Zbn5s11XQDksm
	BFAA==
X-Gm-Gg: AR+sD12BXd2ubozpGNELzK1+h7j8mHJkzflPsFy7hWE1eP7VbYLWjhUv/MvVeqLPkCK
	lmTYpFqW4UtS1v4I1k9zulzqq3Hy7NB6bTRT/vuqo+Ib+ZxlGxjFZV9Utzsl6zTxHsKsU2Sek6o
	rG0vy/CQZFgmxb5uREtpiTwII6XQydV+udAuI5sSFWHt2qSZNWUm+FyHuI5cDpAyTME4Tjw/M6y
	poR1BPqXLXPNIIPsRwsF8RO5OQJZj46FgC7h86SNOgcPl8zfVCGZA5cxEgphLbJCFHKQqW+uIBt
	jK4wd/LoGVVxENtcbGpdyO9lr7LqtD6lndQ5+53lx5ts++LPn2IjFEciL3gP07iAL0wACxSuf70
	vpSyeYMdSvcxxQNlU0qcG71P9+pyQ
X-Received: by 2002:ac8:59c5:0:b0:51b:ff45:bc82 with SMTP id d75a77b69052e-5283def047fmr38941591cf.54.1784826588187;
        Thu, 23 Jul 2026 10:09:48 -0700 (PDT)
X-Received: by 2002:ac8:59c5:0:b0:51b:ff45:bc82 with SMTP id d75a77b69052e-5283def047fmr38941091cf.54.1784826587612;
        Thu, 23 Jul 2026 10:09:47 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:09:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:09:11 +0200
Subject: [PATCH v24 05/14] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcom-qce-cmd-descr-v24-5-4f87bb4d9938@oss.qualcomm.com>
References: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
In-Reply-To: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqYkrDbgCD7phY3Uv4PgeKzNuMgjyq16Ha9+jE1
 ekzU9LOXVGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamJKwwAKCRAFnS7L/zaE
 w+rHD/9yY8Gd9PEPIebmnnDAMTNO7Rfr0HVIH1hqo3NFdpV50y9bf0qKCMa2PDllweAqWysUlsY
 OM1NNzPNAWSGRNk1un67WeGOdEujiXoEF0mHT5EEvurrs27xlPeK8gO/ycdhD1ITNgYTjcn5wFE
 m28QKupJzTy0gooQsgasLhB08H7e3qiNxMI3TIKAMHSjKe1HoVUUaGDASaeMI+8+KO4zYWwCEk8
 7AalLfGQQG6V5RFZwCRBz9Czy73VQUFYOBljAzaxbEQSESjWcbOS6nMRTWOjAivZ92TBD945u72
 OeRV3Iajr1NzY/pfxj2THL2OSgDY/vLWmHjCNhobH7BB1c4/L6JInUkkPYqrrtYUuH0LMp4dh9A
 rJZyzrldxi7rb0gMcl1JPDwV8u4UXL8m7HPWtmxhL0k7XdFvWAwnu78a/3Iv5Zgy2/wM9MYqXJA
 T/v6H2qhj27EiUL0+t/f8mY4/XoGRbhHK7jxHl0lcpwRguq05Mz4d7QM8KsJL3aL0lO8YFW/kmV
 wapRqisIrziTVCTXzGNgP4LZbJS/fF4ak5vMsydCSF8pSYZJU10KhsvzjmIvyiQ49duNj2dyOh/
 gplxjZCjqgVJI4OUoG2ZXWShjuh6hU1bF5fMds1QxiQyKf69k3ggq/APrjwnAZlZ8VOfw28zdWt
 wYwCJoiKU6E2AAg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: X6HzPqvWFlPjqbnyYKEcl6IQi2brQIyW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX2sK8eVOUOGnN
 YPWKaMMSeDjF7PAioVjFtPrIulew1APh9iqCvJUeW4h7isp06AdWpw9VvL+SJiU1ypWuxz04Wr9
 8ADyAdkE1xkCJc2aB2hkY3rWxidHnUBeDSaAwDy2qLuwRA8wrsBoIr0XOjjklD5ZA2rcLizamoK
 i255ssudtoJ9JasEwebpZS9YmPLfwa1RNoHLbeXguFGbBxEFUl3T5vmNCnJJP+qwyjkOQj3BowG
 5Sn8mYPMGyouj4+0GUryPwwbBZNPaoCccFT1tKzkP4FdusWy28tr94B7qkr4q7rNbK1A0N0c0LY
 V1es1uZAQwOOwV7cm0lQW9Iu52OduV7+rm3sv2v0lff/zzccePHXW2DsbxOQe/ia7qtQZjxEjpX
 +0Y7m8nSz5kYAkuSopG4BT+LNYkH96FGUzY/Y01PGL4/+3yFlhqlktb/Hoo24Gh5tDYFrL6+/hE
 pDvmWZl33Z/7F4sNX6Q==
X-Authority-Analysis: v=2.4 cv=Een4hvmC c=1 sm=1 tr=0 ts=6a624add cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfXwQmpghTify0r
 xHp4MsO68t9eEOzLi/hY9BoislX6sJVp0xkcbiQ7YmukUYCL2YeIg4CqQYiyTaYOaLSQAmPGGzH
 gWG8k1M7+DBKCL34Mnx0wSbbXmRNkYI=
X-Proofpoint-GUID: X6HzPqvWFlPjqbnyYKEcl6IQi2brQIyW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_100950_136860_1FE7F67A 
X-CRM114-Status: GOOD (  15.39  )
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


