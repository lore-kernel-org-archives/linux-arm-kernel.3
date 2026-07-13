Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF36C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 13:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=; b=0WVLz6r07Rni06ibMrOOPobQFP
	ru03m1tfyIRZu8heQykkp2lD6BEkTOXEE9bn95+gNiWEt2N0iBDZJA6f4hCCQ9Msw7BJfHr0frg5F
	Km1yZV0uRSd6HRGebG9DbL2uvk6PkT/JlbBpejue4/fBClYm8UXs8w5+XhV/cSInSpF7Lq5yVcWX+
	nWaPHDFkCPunQ0vup6/SpCEghOBHfR1JfO3TnAP8xMwQwX57V9muLpu397dL0eXOvW3p84aalyLWu
	i976Xik3kAq2+rzCCOJGU46N7yz64GSBkMsPnpxB71GHB49x/ApudTpFdIQ0LnUvzrfP1SY8CGpzY
	SiXSld5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGIJ-00000009HvD-1ibm;
	Mon, 13 Jul 2026 13:01:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGI5-00000009HUp-2WJI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 13:01:55 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCEISG1516772
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 13:01:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=; b=Dr8id1fbqQe0mNys
	bDRxf66KIWEKPjeeJ8XwNjYo/t3irvtChuVaq0aNn/TsugRGyygYjTsdye7NCGZI
	bMaFovRNSLO9jG8rzE6+I0oYU0IbsKamMwKBWXfeb/hYK9OeXhaxJv6+EHCLi8u6
	kxSZZ314+LXRlHtAng+nbCRofqcehn78SgHJoI7FJ9qpuAReKcnJ/jUyhAi2vz+g
	qWjE1qysPOhmjWDwtO+MGkR/F2tCGQbwVabZTcTnV72qOfYcOK5EQi3xOEa1dnL/
	fuV70a/DSTdkpv91VrS2joaMOzdxdh4+QF1QIbAwobQ0nn+Uvdv0Lm+QGdpgjULq
	Lb9uLA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcubss96e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 13:01:44 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6a13b72112dso4281735eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 06:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783947704; x=1784552504; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=;
        b=XXaTUsQ/JhgfGL5gjCHE2n7DNdmceST+wrzhouruitq1VXHyhU1Cxkx06dRH9refPF
         TAMVSeYAvUSC6sBD/0jG/VZ1IoeQ3azQlGD3uH9N3DkDeIw0vP0SblCCCtBDlGdq3nVm
         1ZvXPV2j2luAOK34IX8w9fX8ps2Z1LhYji5Z0yn6xdVA1LGSsHoYBB+R2RDYuC/ejDm/
         x1T9XR6FymjLcf8KjJ3a0QJ9AYfXMV/MFHtXt0bBuaSRTxvvLKadAED/KrvFoMu2lRnk
         e9BYyTtm/Wz5KjCVH12BdST2heqOOC5KBJFOo3PhgNBvweeO8dsL+qRepA7BTRUOdSnY
         NaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947704; x=1784552504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0wSBB0zdvgp8nv5/qOGe9s7Ri2Cp1uCk4+HjNdiilI=;
        b=irkVvavpxDQS4UglT3HBP5YjuwL1m9AbmXF4k2trOvQpnpLS1EddQPIgKmSN9ReW6+
         qyXCoSWcECMHI/cC1FP/dcXxxOj8ctN4t1/b5Pzzdc3FASrvbxSIsySUXOMcia+ljWL4
         RkX9ei9s+m181l54r07w2kVEHVdMDcIHndKzyJEjK3SQg9xYvA5u91xY72qQvdjr1X6I
         Ts7x6KL4ZSIFWeFEf3WXTeSzVzUYWdUGBha0dMrwOsonJQwL5XlmlFIEyd89MY1JNdSt
         OXy3Xr8jIVCTFEgIIJg6OXkyQFFPOKt5JBRjFNFucJCWrKqSGK9/4k90jduk87F4Rduy
         brIw==
X-Forwarded-Encrypted: i=1; AFNElJ9+tFYAWrbePK193WnLQXfbpcZb8Ggp9TBhuGr+dwcI278bDWf/rvgXNuQKLYXQ9UTKhIsas0KglIMP/rMKkjCt@lists.infradead.org
X-Gm-Message-State: AOJu0YxEfcbtZe56qjBH7NMrKQp/CskRD73Gf60Yts/cgRiVUnYrtuID
	gvADX8GBGKNy27F3ry8KOVUYeUs+mlbCg+LQ3Rtz0dTgA2Su9+PaBvrHFb5V2liTVehc6qMd3hV
	NAKDDz9ZatfhDK6zB3+5uVo/Pa2X7G1eQadevFwDp541qmXbN+2Jb5m5hznPZo6BfEcHPvVvHTR
	XDNA==
X-Gm-Gg: AfdE7clhZax+PigNYK3we/JoLJHKB1NibMIkVL/iHeBv30nVCJ7H7aANn8cK3ylR2rk
	U9RFyxAqBaPp6eipGOIrVPEhdch8VTE3FkmR6ImO+cbUr6Y6hsCC6zQeDZLsN36Cdxcc0QlHLvq
	NxhgmRfN0VL+tMKx7l2OM1DgluN5GY++ZFBJf+G8jRc/Vwu78723Xz4IwzyoBEZ//8c+dYoqDtx
	me0y35eSUrWIIPQk+0jC3valndCNfljs1vrJQpAprx1v7MM/Gdo1LsDKxVDI4lAXWXa2vPjKXkm
	n9Ivi/YrErH44v2bD7nKFYk1twh4geoiC5bfz5f5hh7U6SXQjbChXFE7aVgB58JnWgkBdDjeJCy
	W5M97tKKLL0S3am/7PwVbcC3YR2cJyIxLeki+4LcZ
X-Received: by 2002:a4a:ee84:0:b0:6a3:80b9:d7aa with SMTP id 006d021491bc7-6a39a6cd4d3mr5189793eaf.34.1783947703022;
        Mon, 13 Jul 2026 06:01:43 -0700 (PDT)
X-Received: by 2002:a4a:ee84:0:b0:6a3:80b9:d7aa with SMTP id 006d021491bc7-6a39a6cd4d3mr5189750eaf.34.1783947702509;
        Mon, 13 Jul 2026 06:01:42 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm306129725e9.2.2026.07.13.06.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:01:40 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:01:06 +0200
Subject: [PATCH v21 05/14] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-qce-cmd-descr-v21-5-bc2583e18475@oss.qualcomm.com>
References: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1807;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8sCOVL39BX2AFiqeGpscXeG1puX7rtAOjEFEhJGJOUQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOGaPsc0Fa7oCOUveANJ60kMxtnneAWu+40XI
 sHiKYzzr1CJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalThmgAKCRAFnS7L/zaE
 wzQ+D/4y8gxcLmowoTwpYu6/hbyBFcOrtC7x5BDbiLFBPjw8I/IW0TFnJ+GNhGJQX0rglPvFUGk
 E7Dt1oHIW+5lFWTJc5kgUdyCRZHTLY4Li23JVCxFj/cf1a1VF6fJC9rWpod3vmr3j0+pF+OFNMn
 boxzJHPB/pcJF+YiFEb2ZKmOG8LSPKhXnjWUTSyJI+D90cfyqLC8T8hTzIaNs7GUmeivuZaEIp8
 ykxseEOkwZ5iV3LDhkInSNXDwoegrdxf8bBiJLMw2aasSx/8DZeVmulN+6EP2bQxmvwKMzIlaVV
 tbFGw8MmR6KCFFROM9Ew7a+aBNcDVklXTs4bwKjMtZuBO4fl96oTLWi685Kdpf4CTuRZMECeU9I
 RQxMk4Tn1+j7gtHSq2QkLcNUPHnSblikm/wl4n2QNgmREo/nTzIFDuiS/7qObgC8SdGmjNIpol4
 DZ6m+yx/THlh/c0RMsfBev3a6ipc0zOXf0MDkqig/XW7SwFIickz0gL2foQAgrrv6bwIZLuI7iu
 p/cwEC0JBQN5OwY6R9R5KlY+Zv2esWxK0LI6V4Q8dm5APmI0vSAaidEczpSkeNQWzhWGDAYOtUp
 CO/n+FNteqnrNMOz+WTd0A3Hvvlkffb6siLl/Zl/hbBDnMRnNBDjRDTQMjUHsXXpwbZX+eHrORQ
 hP8dkSZdbgPBmBw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Oq9/DS/t c=1 sm=1 tr=0 ts=6a54e1b8 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: dJOuyJXqXElXKJxF7Jg5DV2GVqkJr9Gd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfXwy3nsgGo7HlQ
 S42AMbVrX5IEoD/4lDLqWIbMafrFf6VHCML9d3mj2hElZdhcpXcpn0dHL4Y784oFtLmu6Al7RxF
 T/3LaWNbWGr8A48htNZFJqe/L1c37EU=
X-Proofpoint-GUID: dJOuyJXqXElXKJxF7Jg5DV2GVqkJr9Gd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfXxugMZSoecVVJ
 SfumS5kQ+rIh78scZfgXIsncOSZh52WPGSWg+MXda5Jf1bsjstFL6sB8vkCPcrbyKipXjGA9JXj
 +tDUSGJAZ7tiKh/qFll0ZeADWRKdy7F0uR6d42Ek+ZBTih56lkL2XwNzzEhjlTe6yAxAV1nVfkj
 0xaIgTvgjBNfqK+A13tNRHzW1xua+DAwsieQUX6INdnG3svRNnzet3Lyihr3LrVNJ+9S4geXwRp
 5Oj9nNPztIrqJggJkQisWwkHr2CDXhMueXN82MzzH2yOmmJCEA0Sf18NhgTBUWgu7c6YDs6zNIF
 k3eRdGJp2OP95ww9TaxWfLZd+517s+lQfaSjs7RqInaxNaKk/KeH5PDAez2yLYs2kU9Ao2bdgMa
 nEP8HGgQv8Q2efFtBI+SRp98m2cQX9gmfomLSun1Ttz2eEUOKfYTb7F+JpS4kgYQ9YL71Vddmz6
 QwnkT3JKaz+I6V74PwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060145_796589_26681B4C 
X-CRM114-Status: GOOD (  15.74  )
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


