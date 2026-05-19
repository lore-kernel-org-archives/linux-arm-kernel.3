Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D00CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 13:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KTxY6bvuwok78BPFikR8TBxQkNppH5BYWsbiOq+w0t0=; b=yGni6PwSaEP2P/LODIPkG7vwvw
	vc260w3UvT8IL61aWaqDsQVHUgTD//YhlkGCV+Idwm0tQj2aD5PBipe7byQrxWslctcmDt8V4neHb
	JwjLuKVbXEh8WSHM2Otl/VYS//J1Kl4zwt9UCl/QX/nyzNUEA4ta/cH5rizq6RKNTC1Fbb/wStvxa
	ixIp79SV+7ZrmYnlLfnpbPN5mkyDU6iAhADtg7dokNmkzhWx0p8HfK7nx3iEMttRJU47aduW4+6jA
	k4rU/SkwFFHnNZRZ38MckXjnE9Ffyl7e5LQik0x6ArJzYTXeNN8Sst2p+qeS4buMz+JMfCpXnSUrS
	DwTo4N9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKKz-00000001c8g-2Cxh;
	Tue, 19 May 2026 13:18:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKKw-00000001c6C-2zd4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 13:18:20 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9vEHc1055029
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KTxY6bvuwok78BPFikR8TBxQkNppH5BYWsbiOq+w0t0=; b=LEApzKG3fHIHA4H2
	aGzFbA+OHXQXGDkdrkGvUwVe2233HHhJ29vndUFGXTOV5N7uxvxLnn/8n6v9Q/fu
	Zz+fVh/UfLRHGf6R5qiodZJ7cbpEfCjmTkkjP46ODYK+FM4uCn1P1if7TF9BDGnh
	E5pJOAfF9PUn3ALEJFPVP99ZFhqKiJ+7k0gho5YdboV3RhaYhKo3mJlN6hX0RVcm
	or0Kxurfo0fGrKzs6m40npLkebXHeSRDfmDbEAiccrGmkhYN6awYgwurqKU7LqV0
	LfE5iqHddZNCZH/SEGfE3GdfsV1HZDWmbXGKYfh6rzkWBM2FMAIR6+jxk/EFPzXD
	g6sPjA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8nparrhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:18:17 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-57584c23424so9396220e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 06:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196697; x=1779801497; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTxY6bvuwok78BPFikR8TBxQkNppH5BYWsbiOq+w0t0=;
        b=KSax2FRyttU+0G5b8/EH2GL8VikQKClH8HpTh9QQCufq2MhE4ozSb+sn3V9vq0DubP
         Mi0uSwIWWfK4i65OySMG2fg1hSLJCD74h8UpTr/EvC3ov41OHELTXBev4+KeVLBkMIgV
         J3JhAFPhHnMjFekyrRbiOuKtPD5GG1kkU8kgCVXGCIoT8ORv3AGvoWrGyuZeCpw0m1S6
         2Ib8nCfr4S4chnNxEpsXgN6d2kbFwZpBYMX7s0KSKuSsWw3ET59xMsirtp/nytLI/TUM
         3aXSAU1YJ1tLS3xto974ernzWt5SHY+OYQxryyCZyETwj/yOAFd5sp6wJKeSjI0oFiCh
         Q3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196697; x=1779801497;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KTxY6bvuwok78BPFikR8TBxQkNppH5BYWsbiOq+w0t0=;
        b=OmNhOTb370ZzJnYAqb73hs3TaSGvW/YE+t/D35Cg7YnjAI1/1dzeI5N4JyjyH0xb/Q
         HfV9SCK9Lmo6FYsaYvJcE4QpTIdLaBhZg4dfJrh8T6ccVI2bqMrGi3xNDNtXeoPLQNwh
         +iD+DsA9EuLh6u9Uen8W24nfOfcveee0VKzAJRyw5d44hR8McpFaFIRVQERyb/M5AeqE
         GXW9ixtHtus7I1MHyGnZ8nET+CjB/lCVqo4O9lpg1l/5P7YwpJyguAy6v+0vuBbu1Mv7
         23DC2zC34XHRDcARNF9e60Nxguvi++3/NZ0ZReP/Tp6s57AOAC/PXjAXn0eVHhsx70Wf
         AI5A==
X-Forwarded-Encrypted: i=1; AFNElJ+RhzlSsrtF9AHkx1QlkQZ9LIJOdWSGhC/+KszdO4Lckefc84vc3+S2bf74346Ca1w0npZ1Spwd6WEO+wmy7Csd@lists.infradead.org
X-Gm-Message-State: AOJu0YxbS0B/AkDkC19YlYJXDb9Ar/EWE6lVTwYtV6zPRramGJD5tXz8
	2fcVOvyVqsG4+2Kdc8dvZHRxYMCLxkbtPsALVQLhU44pXQ2ZL3epij1ldUohOrynYjXDVm9qWeD
	LMyGHjfJ6QaizjvX6BVBTFi51uXTZMvPWr1e89CxGvSeY+SsJEbtm//0L6LJFr/Zmb0w+hok0Qq
	dOPA==
X-Gm-Gg: Acq92OGR92WyC1MOM/s9p1SLJDSo5BdrwsuFBvIaUvKVMo546q5KiW19xcVpHcjj5jT
	DGvv/XtYhXwfn41UmNmpf5/ICE1NUq8ozM7gWRPZ4kDZYFhT8gZkpyIi5OOf02Ay0C7bt6D46ax
	Oej7ItcxCGHmoQ5Tq0LGIFECbEJUyA1ZUFTBAgIi/rB7HkRJLUUT9yoA8RyrLeYTt7OOwmISJ6T
	tex3aJFPnELiG4w+pabVGUz/VX0mPNNwgkUsmX7KqaKxep5XWgRyHOUAZZo6kpN3riL6G0KNvVV
	i10/vyTb29p02s6OJuBcihaN7ru2rwqzgL8A++TRWIZoVykrYlOKmDKSObgO35kwi6UY9mClQLl
	+YL4q/CXaZG0auGVKnvVvFf0qZMjOu2HPuJBnkVT1zbsj9AKF/Lo=
X-Received: by 2002:a05:6122:4887:b0:567:4e8a:fb13 with SMTP id 71dfb90a1353d-5760c027aa6mr11882873e0c.8.1779196697221;
        Tue, 19 May 2026 06:18:17 -0700 (PDT)
X-Received: by 2002:a05:6122:4887:b0:567:4e8a:fb13 with SMTP id 71dfb90a1353d-5760c027aa6mr11882786e0c.8.1779196696733;
        Tue, 19 May 2026 06:18:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fb6:74e3:3c25:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm143969195e9.7.2026.05.19.06.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:18:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 19 May 2026 15:17:46 +0200
Subject: [PATCH v17 04/14] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qcom-qce-cmd-descr-v17-4-53a595414b79@oss.qualcomm.com>
References: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
In-Reply-To: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3778;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iFPO6YP5TcnrvsmGE4fDny4roRlsPlprS1Gv/K6BVEo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDGMELDfOj6YPtbfLeG/J9s/3S2gj/RTPnt/RL
 AJCxj4rbS6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagxjBAAKCRAFnS7L/zaE
 w5vVD/46Q+Ag2EwcnNSLnHm3m9c9zNGisel3N3+wvHn3vTnCEfE+3Ckzx/VhbDi99XAI/fMk7hS
 VJLps6FOPZf+L08gm3sg355RbHLEtiMedlSezGPpMAjljRzLaVHoS2E0EgqhEwPyOK7d1XK0ynT
 NfwhGD2KJU7qs0BDZvn6MPk060n7kcbTCucW3HXOnkOzSoHoGWj6+JmMwwFzdeUbK2mJRzahsnA
 pZ3t0L0SlMMnao/Pt3X0jh2wpSppd6BHpwTf9vc8gr2ljVhyM10XmRwbEn6odBbW59niklJFVaf
 CTMf+JWlnfl4sFWv/oprkR+hSVsq+lK3BTZm7rxF0gWev2mQBpRbT1YQ4xFDHqq4FgXx/U2ZKk2
 YFlGJhGub1WfVCucxhon/HQErNKMFPgV6C4gkwo185UHBb6ijVvDXkRC4F00nlVo5wRotmodI5B
 w4NdFvolkovlmcGSPI4T9bUdVaSJfCnUrnzv16us/Hk4wQYCrRAUspDY91WxiLRnuHditFvb38j
 PLt/WD3mdLkzJgeTe0VBlmcvhjWIVMzrQPVuESWe2/RD9ZfzeVL02UIKq+fD9qzhrQ59NCzWekP
 IruTsL+oEaiEbWm5fhfKyydOmZTSe7TXn1MCb7WmdTQfgB0jpdzXz/Py7pSLHgORFryFoce7Va+
 Nwq5cNLnEzNroHw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfXxy8Ay2Yz2XEr
 gWkflcWVn5XZQFcwKR21342mSgds5LzA+K+Y2tTTR9FsYgC/HrON4CHrH2c/X6P95CDpf7p+qgw
 6I7CAtmnYaqrK/8wZIEoNq2zoNFvFJz+UWHjh9vUkENcqH0KvDm24Q2MBwqapfusL0XbQ8HriRT
 az/tOFqiTTXGveMdxVHpWz3Qz4XM+G5YDtA9fHLFHvx8JAO+tgpCguZvRupIKYsCLm7iY3AMXxf
 mdSR+nyBB7wOe3mrqsKt/7vowriLzI4nNxUibeaLLtnDQma1NP+UigXyQk4Zr/z3a3ZTwIyRuYm
 enjPfK0bZoChi3FpSJir5YjDYOML4NlesZm24m15/Yn30ZtVt5pszKzuFsMN8H09gfjZ/ac+nGK
 PspHqoh8FVQt/rZg8/6vPbtWpkSqR45i/53keu+0h04weaNRTOwOOGKU8eosaG3PoCQn/FtSpBw
 N2rvSoWwyMiP5LPFahw==
X-Authority-Analysis: v=2.4 cv=NrjhtcdJ c=1 sm=1 tr=0 ts=6a0c6319 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fb6uNmSZeVr-t7npd3wA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: mE4xDvuU8m4JRRa779SSkOvLQ2IhZQAJ
X-Proofpoint-ORIG-GUID: mE4xDvuU8m4JRRa779SSkOvLQ2IhZQAJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_061819_768108_0E47E977 
X-CRM114-Status: GOOD (  20.04  )
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
index e2f16efcdb55f7465950fb81e22acb451e63ba0c..7f3d1b6dd5d7660d2743dafcc43878e5f7952b8d 100644
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


