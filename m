Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3404EB1070
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 15:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TdhhWrCvUxcn/reedG1xQ5srVVcpowXHdjBHgIUwuPY=; b=usN2BYO505CqFIf4P4uk5DUqFi
	gUC0cwzBIZF+/dDx1eq3deLhb7NHFl4PUMWKSTdv3hsj/8MrWSjdpHYwCNSqAvEAH6psUbge+MnAk
	wslpjF2lqBPsqfofTZvnn6egilQnI++oehN9TmC/0+ss2j82N0PRvBIkWUjgKanx20VXa+Odkob+S
	VEF29buiwqEoooBEQIbXtyKhxUmvukbVufQ+IO9+MHbXtcTlpx0NY/t+BwXQXnOmMknu5QrDBokqf
	yzHCoQy7Olh6PFH9f2SX9ExeGu7+We4Ak4Z+kc1vxt+hP4S3hZ60yyk6r/Id2JB7fD6VzYCJOEGTn
	bmqmsSfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzGT-00000009pw0-3cpx;
	Tue, 10 Mar 2026 15:44:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzGO-00000009ptw-3sVc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 15:44:54 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaj0U789912
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 15:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TdhhWrCvUxcn/reedG1xQ5srVVcpowXHdjBHgIUwuPY=; b=oYYy3y17oSxaar98
	oGDG8PFTvxUWuVDN3Qb2C61Fw16gcQGPq+hy/9TQ8SqWe1tmvv5INlkcyQbrRG74
	0QkOEaxDRLd1AzYgKTw4jKbcI59uy6Nbvnn27f6IsKZJ/5H7MeOxIDczLIPuLuWb
	otDHwnvQeo56SLdkglIR1+84GrtDjBdov6Q+ashzk55P1pbBR/d14imzxBIxIQSt
	EagiQnxMlL0IBBaSFRftI2XQY3/wbKOflqb8n05wBjha+VvOsElfVJ+fxdZHZG8a
	PfSy5WNI+F0YlEjtlsA4fecLiVrMbu7g519RaYR8LPnzjFhCZRNl1jOVkmp8glHa
	1ewelw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1ekvkmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 15:44:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb52a9c0eeso10385121985a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 08:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773157491; x=1773762291; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TdhhWrCvUxcn/reedG1xQ5srVVcpowXHdjBHgIUwuPY=;
        b=XEJ50j6OShxbcvyIUMH0sXxMN/z342X+urfZPJXuEJY9BXDmDcSF5PfgD/YmKK8xWp
         f2TWz9T5EiETlp8ujrv0VA2vhEChF8TtbZAy7jK25ufIkaekFo9vjgqIgV+OAajbkIF7
         HA/j4WVBHtWssx0l2NlQ2bVwj5/ETX+7TrUjBtvHV69ojgvB0w95PeDKtqvhh9gDbsMX
         uJzkBu2o/YU/6jirwPTurg/0crhoTTlNrpLkUDm9i3gIc8pBcGe0EkvED/NNlPE/JfQr
         dA/zquyXg15dnhJK/QoKJD8oEtx3AxNseA8iPM1BKopR4MObSf4awgc3uK3NrMSyp7BM
         7l0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773157491; x=1773762291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TdhhWrCvUxcn/reedG1xQ5srVVcpowXHdjBHgIUwuPY=;
        b=vLiu8DOr/6La6weVsCcViyFkwS/iq+prDvPQNK7iPw03VTGJqZhS9uMWfkYEcJ//64
         dGkgn+Y1Ff2x/9cPU7w2ZordK7aY26fzrs2RcPaq5HhN9GrAuSbp/DRQNruubYFP3uVC
         s8/bfjBd1lMTwzrwjz+FMlXSyLrZyqKP2bxeb+L8e4wKSHo9BB/hL5tvrj2nKX7y2iZm
         ZJ7FI/iBN9UCtY0oEoNVA7awkhZG9wKxM2jUKSqAElIINABtC0VHexTJxoDHdYYj3NTS
         vN9yW1uIU0Xz7jQDkYd3cbBqJZXF1JHbfrllSj5rhenkMhuQ934cb2JGoKDfr3AldmtQ
         B62g==
X-Forwarded-Encrypted: i=1; AJvYcCUNhvwvZb8KfqFGqjYnjeSbWAeA1eSHr8WlZwX6eXQzoem7jykv2W5epQcgn3BWlgvaMrhusoITkhkGOE1wmmj2@lists.infradead.org
X-Gm-Message-State: AOJu0YwUvzafVkKYg1Po/CNIeetL4cH0ptijus4lreZ5oOzLuBcjvICJ
	KiELfHOvuwXQfkQgZTGoQ+vsqWHg7uGDEvxMi/I4DJYCr2y+k6GK4M9BUgzCkP5G/LXgsYJ3klf
	NGoBjPFeUDbRV0I/MsvZwKaGnu2kKYRMZUrsQ2o/QEIL4hXuQPxNTO0b742F3u0aIOpLtWjPbPa
	M8zw==
X-Gm-Gg: ATEYQzy3XJhAURmp+Inb0ojXez93N0gNCQxsJYw50NVFnT/X5N8+dwvAv8vwTWkOH91
	m7oLwTyWCbwjqilQSP3+tcWpkpCGLtzSha/d3fff5XaUYXQcWrhw5RFrMnWCPwiU+nS6OVi4MPJ
	rkTlScLDlX2mzmpvfoh1S5vZAhevmxeRT+5qa0IxiW2XWJGnEchJ9EZNoe5o6w1STK2eS26hQuT
	cG7EkOVNV2hhTuQMaN1Sqy2yeyFgb7tZwyAcKM9FCIqFF6vzo8BkQzeG0bWKU+xfg3nnowgtOi5
	ZIPWe9oYllSj/Xlv2GPb2Qrrc0PCv13ZtQqnutO0ttZfRfCOUTBPLW08+fHo2mNkKqm0ApTY+++
	DKa4dVfpgF8sCVBrr3KMAEAl0VEsPjiMBHRak1QZpHRD5/I0uIvCF
X-Received: by 2002:a05:620a:c0b:b0:8cd:8142:b7e6 with SMTP id af79cd13be357-8cd8142c5d9mr953922385a.26.1773157491459;
        Tue, 10 Mar 2026 08:44:51 -0700 (PDT)
X-Received: by 2002:a05:620a:c0b:b0:8cd:8142:b7e6 with SMTP id af79cd13be357-8cd8142c5d9mr953919085a.26.1773157490964;
        Tue, 10 Mar 2026 08:44:50 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:47e6:5a62:7ef7:9a28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm35991600f8f.6.2026.03.10.08.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:44:50 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 16:44:17 +0100
Subject: [PATCH v12 03/12] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom-qce-cmd-descr-v12-3-398f37f26ef0@oss.qualcomm.com>
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
In-Reply-To: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3724;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/m906drTofLPxOtAkNVHVDE5jDZx6cmoeu2XGgbJbDs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsDxh7N1Y6/LUAB6rgMLQBy2fmGegjB73+f+XS
 H6XeSRAqhyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabA8YQAKCRAFnS7L/zaE
 w39cD/9RqGzG4curV6R3EtnkB/vfAOAeR08inkMvL+GQu7VsjMxlqeMX9YSZ34C9Upm9RsD1AUe
 k2aEYMRTciSiVvt69uB+Cl+UQGdTuilEJYYGC1R8BF82fUZ3zC0Gl9RPqP7fb3W+yEWX/T79V8g
 7PNuTgJArE3aeX0BJAwP+n+ieUFaWxrFHQsS0K5W60blO7wLoi6dxR30oXs/HauH/hk5lYTcK9/
 07NgugUXc/+NCtEBTQqj9/GJlfha/ChE841UGpEderEXy8kImPzUpY0+OgEKcfYajJ/Fb7yJRqJ
 vbAqohB4e+3bzw+Zd4ASagZ32iHInCV3qQBWUWfgKn+Djxhzcnhb4wlw57uJFz4cK9UhynQ80xE
 vGlPXjqKn1aJ0+4imN6USi5O6IEmxW4yaB/aR/+o5TQAUQ4InecZ1MQXlJyGfnutxxxsTV9jKVj
 XhCeOmkVwk7bMojrim+tiBCtgF5rn86bJ6R+6dAjt7KVaaRzqQkwRTEtsFNSgZlbc0cs4M5iHka
 89rk4jkCkz7xtCLDVOYsD9bE317ofSsMSej0LBvRxWygChlJZVGtpMpg/JGMpt1PLKq5oaricR7
 yiu1UcJGSmBZNOYwGTZ2ZMfBsJzyoUQmqfIziE4m2LDTMeqVbpqRiSFXFrdJ3Q+J57Z92Ld+JpZ
 oJUgYOZmN1GG1GQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: mSc-1c-4ndV4osxItXr3dWUdXG4HnQ4R
X-Proofpoint-ORIG-GUID: mSc-1c-4ndV4osxItXr3dWUdXG4HnQ4R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzNyBTYWx0ZWRfX/xpRKShfX/yo
 XUP2q1PhpfH1CuSoN6EITJoJZRaxz1VgkfGCnoIPKBDYTvfNvFwzYGOH72DeEZ7AuGou0Y8q8dx
 HcGeiilFSkxqpqEoQv8Apc4J4UOWHNpXITfbU7MmGqHe/YberzZOhoELdNYNMlkzckOjMMU2asj
 doyobA+pShW3kqm3/TvYhwnWAdrU74+uAbBxvPws8y1QtElQZecCrBiobHPWTZEgGrOxIvhu9au
 cdww+Boe2pNvv8u8LPgttsq6rFbqiKzyWs+CQAWAxG0z7LEQa92R4vI49l/uuJ+8aJb0IqEK4mD
 lIMQZNKH28XXwJnKRYw3rMgq0bz44ezgLBY/Zrw89UkfILpWmgFJMrVUdIZPNJgIItBpk193prk
 bKeEX5/5dUe22hli/w62hPbzS8DY/uj1HawhsqU/oruZ0fAWu+F4GyXBgG+02LqjNkxhSS1TLYh
 XYqyVW0YLO23Uligr3g==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69b03c74 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fb6uNmSZeVr-t7npd3wA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_084452_990743_66CF8246 
X-CRM114-Status: GOOD (  19.42  )
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


