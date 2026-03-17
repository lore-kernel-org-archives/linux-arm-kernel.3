Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C92F9FD8770
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=byBhms6klEiQKAIzzwk/0xHdksfuhIUeiAfPpFlaRio=; b=ZRRSO0JVLwmCYTl09A6/TSLrCG
	nHOB3GVeaxBtgRpvfBO4q4WV6btsvJMPYoLFC6a3iZK9C8R1bDMEckarXcAgCrtfyEDi75qCEXptY
	N1aBG481nb9H3V6nCazN30mYFpa5PYCOy7dupdkJ8LaF2JL223tWHTzGpHtsLYfEIDSgSaR46LKc+
	Q/dl/rZOCMe9xG1wlY5ToO3rcCESNuTObWW67kO5tnGxUywU/TTKdrzypCnGkmKs2/Di4SA40N++X
	nBPa0Z70NNucHjkdLuPa4ukWCVj/8Zyy9zFCgSNE+HB2HkrYieFRY2Nfk61JkLUaKGsoJwCUoL9n8
	GcB5qppA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V0W-00000006Ukl-0TeP;
	Tue, 17 Mar 2026 14:02:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V0S-00000006Uit-0dnk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 14:02:49 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H94dIW4023448
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 14:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	byBhms6klEiQKAIzzwk/0xHdksfuhIUeiAfPpFlaRio=; b=U8aURp3L83W9hIQU
	YeimIZTZKiTV7Ab+ZFEGRnCz0QTgNKbhmJ3fG8Aj/EBBPWbGomEj8KTLMKo8/wd7
	B1L/2qEmbDBLbxkaDgI4oPof151d7poQGXRPeSW9NWvZAedd3OXhl6FGoOWxAiB4
	XOYVhUacYPMWJSabS5x0LFeH5TvLF81zaUqKymqZlAzM/H5impkgtq7pz792K7Ix
	cuBwDQFo6rpfWtRG/J0NXyEz5BbUtmVtJLNZ9qVN92tNLYPp6VEgx8KusvqVPw9D
	53VkNfZ+blDdGM+ojiOLSO8P+7Xrmcgph/1rsSB1Y+vLh7HsZMaQGAgwtshAAico
	WUlKZw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxn3fkyy4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 14:02:46 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94ea6fdbd28so64774778241.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 07:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773756166; x=1774360966; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byBhms6klEiQKAIzzwk/0xHdksfuhIUeiAfPpFlaRio=;
        b=F+FfSuAbHm3bZBO2kiAg5HJLhoLrdmRFrA8fizZZr+sg9z9dIcMtCWdmQkLKZs/Sms
         b30RvI6NTNpVXaK6AJYUw1uT5j7t/8ZeB0GvVzEfN+q8MujJEo19rHvFGwfZPsox//tq
         s4ew4oXFcEWLf+Hil7ZSs7E2tULKhcIu0fAYrLNgluti1tWd2vbropwYrP2AFePCEF17
         4UFPMrCENm/2ssSP+4tzRiyxee3PPS7MHlcUduTlP0l9Gl1o1r1FAf1gl2j75cRiovWE
         V66rAwH2ElSLVsSQu+muRwGQb27STMPIewDUiA/6W+wJyR2TA0zxgmC3bWXkSbuTVNDE
         S4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756166; x=1774360966;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=byBhms6klEiQKAIzzwk/0xHdksfuhIUeiAfPpFlaRio=;
        b=nJDnOlucTJrsKzg1KRJHboQQnTN3f3NHtbtSgaWWwfuRuj0T361PNy8JlbO9oVMvQO
         gNNbOd/qPa97P2Aj3RqRaNas/Ryv4L/KtJ80NdhumQK6xsGHLgZpu+CR6u0HC6V2Bgas
         WF3zg/LfjITRPMoiRA+F9FwtRp6EDy5zCmFhQSNf+8gpUiMZwSmQWUaXQaqGqyyBftmL
         8zC5QpCtL5Aci3TjClKXB1uVI7BkVenqDCanhU1vw87k8auV44qn2axXwIC0V6upvs3P
         q4lZQ9qr3cqD4PnkwHxrH186Bz7WCnVqliHdG/agG+h4+To/KtVoyYhjxs3e3+52oIlN
         3Msw==
X-Forwarded-Encrypted: i=1; AJvYcCXI0WAcRXBEJpK+2z7aGJXbWUUzrOJiwubLKd5nV6waeBZIzIVgGI/6HfiRhy+8Ur7EWOXzULSFj8anmJoQzuOY@lists.infradead.org
X-Gm-Message-State: AOJu0YwaRhARQVzWHg0o3csfcdfDTWiNSIlo5xkG4BOFAMp24vVHzwcM
	Ye3aSzS5ErkWBKc5hr/V91TvsHNcUixeruoHBdVtRA0svB+FwRRVa1m+9mcfOmRHacBJ8Zxd/gy
	S5N0BIEPBB8oMvTWSaavD+jb54xIr+k2TSfMdEnhZzEQaoDCtZcKkoEP7QvYAMjztfaKSSjwStL
	7jYv052aeCWQ==
X-Gm-Gg: ATEYQzzwlXFayBCKLgNNvtewW2hh17z5+xN9wUMA3jCF7E9MIYqdvbYkkUnAe9zCUcf
	cgA5beFxGYxhGuAcdzyt+Nvb2PBrD11kJ4WvSfkwn7WCwJ2WIgTq3lj08DI1xJaWtYabY9zLYck
	VUPfcc6AimlxSqmVlcEO1MtQFNy1wjYInwGCXlWm7Nq6aXg2hwfRW7y6SO5jc4DDnGN9WKF6wOU
	vMe81CGJi92khlHJY6PyU0In3KCmh2juhnl+Z8nU5Jrd6CJEk0HyMNcUyVfdFQyT7+tZhE3O29G
	upVVHfeW6qdrzsJO37vQrNBnAOebcX7E+uwiO/1ncZAcDlJ5QMjOdcyWBV5vieRsm+nn+yP5H5u
	JcU9Ma+RdTnrDJe5clawg1SVZvlcst9g0Ua+ncFuc18Zwbr+f0ScB
X-Received: by 2002:a05:6102:b13:b0:5fd:ef38:920e with SMTP id ada2fe7eead31-6020e8ff56amr7643380137.29.1773756166088;
        Tue, 17 Mar 2026 07:02:46 -0700 (PDT)
X-Received: by 2002:a05:6102:b13:b0:5fd:ef38:920e with SMTP id ada2fe7eead31-6020e8ff56amr7643322137.29.1773756165543;
        Tue, 17 Mar 2026 07:02:45 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6aa2:dd35:4d6d:8eec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b4938854csm9359709f8f.34.2026.03.17.07.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:02:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 15:02:10 +0100
Subject: [PATCH v13 03/12] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom-qce-cmd-descr-v13-3-0968eb4f8c40@oss.qualcomm.com>
References: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
In-Reply-To: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpuV7y9ZYaNC+PjAwISHvYpwr3lKaHdvpbstczB
 Tdo0FYPbvSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCable8gAKCRAFnS7L/zaE
 w1q8D/0VjMXWHsWGlmxP/k+KCCyjLkVQe9MseoDppXf/VlBtxYqbYrf1DyZOibBBL7Z0kJmvHpS
 iKQ0SoXGoNoXTs+mbAjgpVR0aphVL8nlINjN4sE8H6AyROUWE8PgpuJz63Yd3g9TLgApLg870Fu
 1qWSdlfGh1EoAFL/UWakZBtG8v+8/kS2tC4ToxlXkCQ0VVxYAZVHRPFAoeZM/M/1ZYHlkB0aHeD
 Oyf7bC/rNfHAZD3gmVFHKKOlghBeB0mqjgnX7rfyC4w1Pa0Zjf8b38J5Sz7mIGQkWv++bkcvKpP
 5PwASinwl7+D+9BGwTEA9vKMf1hziTVgqsAkZibB41PpZHnfN4RoRRS/n/A+AukGa3aq9CnJXcq
 K799w9uy9o9NzcjAnXpXa9uOre5XC9koxZK/+KfGjSn+zGR812mVjCn7oKXv5yD1RGoLEMoWMQy
 8gCEIBI1ZwIE0Xa3nWyCGM/EINHD75ppZ04hlKgnqQxIgv8zsysZ4rJTR2fNVhahzPVWd0oykjZ
 UMVP9Jf6VFm4hNzsXmIEffVgYVCkni+1oJ0w7yBaCoK8nkc0x2jbAEniVfzk7CXyyiW20Lw8is0
 UP8urIwUX/nXJ5qA2CZrFhvya0M+cgJgDXKWFP6U7hdTDiilLU3i60wU4pR9ThkuPyI3Miwk9IQ
 BE9VQTT3amshYFg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=C5bkCAP+ c=1 sm=1 tr=0 ts=69b95f06 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fb6uNmSZeVr-t7npd3wA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: v3WHmv6O9Vmxu6PuPVjowpj4gi6j4jjR
X-Proofpoint-ORIG-GUID: v3WHmv6O9Vmxu6PuPVjowpj4gi6j4jjR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyNCBTYWx0ZWRfX1nwk0P+FUct7
 UGOirHOjMVxsqaBzOfJAEJ+YEhPeA9Yc9+pE/8CzZjPiYI/YibMFSukbHUnOzk8JGPqE96bh3Gt
 45JMSJwVBD3YqzCgi50cQZAu4aZ3DnbkHzRl065LWrEzADJ+TLoj2ffA8J0e6Tgg2kJL+rGE2eD
 eYLBTZ/qQ1liezN18eVz+qHas81rzw6cXaccJ2j41dFH4bCegonoTHfhQAaSypieURnQywaxdZN
 BmSVZNvebeX4uUGg53ZrMdvts5707x6bOTLYl3X7BLDbmd6J7Ovx6sos4d4MwW9NmhD6AQ0gqxx
 Qo5ett3YaT5/VHeT7kHkD8cQEgB8ttcuwq87gpe5YoiwpzGo20W5PL8loG51948xntoElCvO7EK
 4Vvc6Vy0toCG3zqDtOCj2FWmukhOghz0CfEE258pd0B/9czOC+yczDCzWQtsF8lCTEeAyKMq7xp
 07wKT4FfgsZohS2NfhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_070248_325446_3334C157 
X-CRM114-Status: GOOD (  18.63  )
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


