Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D1FEA4E29
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TdhhWrCvUxcn/reedG1xQ5srVVcpowXHdjBHgIUwuPY=; b=FO+G6phol3JpSQthqEfj7bsS2V
	sMUcj4DaceDDUJIdCtZ5AMr6YqUI5OR0yiTTZCflVxERokIaC/r3hw5fuiKbdKpUwDCZk/Zs4IOCk
	9z7GwssVL5CuvvB58h5T3FDwsyNCPcmVc7Wvrx1t9GYhpJ6M4reuqfGTq8PO7d3syq+YCICw4mb1v
	2j7PiyYOxX3mr3MITxBKvstCH9V0jrKR8ghx6hfw1+AQHygD0GB/2VRyWrBenqenEF+VThEeaD86P
	McDsbyuj2Sou6sjeHyO7AwP1o1Xdgtdklvme4Y8NNL7FROSJXY4Ek8VMlrmJacrg6sARY7t87E571
	B+vspcPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5ei-0000000DQAN-2LP2;
	Mon, 02 Mar 2026 15:58:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5eg-0000000DQ6b-1APD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:57:59 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622B3gQP3862877
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Mar 2026 15:57:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TdhhWrCvUxcn/reedG1xQ5srVVcpowXHdjBHgIUwuPY=; b=G6Hk2lLCwbfiIWMG
	+YLPOw/kLl9CMV6Wz0zt0sOJ2YhyyElyu5KOetBqgsHaevDsM+PlWJqxNW82VZuq
	KBxy3TyEoN1mvYSWy4K+4BGVcXbHskc4syGpAKUNZlch8MxonuX9x8niL9//gB5C
	xVByOBICpHlvpdkjR7a3Xj+vYh5VdpSho4320wKzaTETAEioT5KM6P5hW6eTtbOq
	Sqx58h7gp7099/V+UMEDLvlotd1qjTsnXtoUE9jPCzsSPVntiCVW7p3mgWNQmX4k
	10zWtVO5JtlcIZZN5xRh6zfFttMq7hEpJf3X1B/U52eo9nIpJSveIQ0SmYgdJn2r
	L3EryQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn9bjgyhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 15:57:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3b0d938dso3912560185a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 07:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772467076; x=1773071876; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TdhhWrCvUxcn/reedG1xQ5srVVcpowXHdjBHgIUwuPY=;
        b=Pfd8owYaLfXisPTcCcjc5F/5MGy2FZD3wvQssywd7EDu3bn8Pbb6Hvqv2CHeE7AEHx
         3mQT4X/IMFicpKxPpi4wz/VpLprOf/oY/TBCiTVVzL85qDoaL0m45eICI+RGrOhz2+Cr
         zzrVrItQmIFWSwpB5pGlrx0EC+3uEjfQYLQj5ph5jfkCA56ioFe1FKajKtavUoOf9V35
         aXZ0rDsPQsPSKlT3jmNiu5lr3NL1LCBYeGgcZeVC9tulX5JqFt8XZ4LkKeIzvWfqWPOX
         SrJ+N+Pt5vofzZLYyLFewILk7v1Me2tFy7TXr4NyatofeXK5vTcvPqnqqjjFXPzhm15+
         Vuxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467076; x=1773071876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TdhhWrCvUxcn/reedG1xQ5srVVcpowXHdjBHgIUwuPY=;
        b=IxOswYf5Iw/Sx4k7VnM13Y9V1gfI5gyFy3IwYr5FToY/rF/46g91dkEXnSzj/T75+/
         Vwto3C38sXn+4ooc3fFd84tU+yY2LDP0EFRsPnrcEWAeUfwOOcNwam3hTUfx9mctmi3G
         GibcPOmuqQHiiNHf5ARTjrKFMdkdADP2Plv/M/ZB3C0SSn4rZgHewiX3CAdsw5PB05B5
         TjXw7Jd3B7B+GaRbwC4gefgIlid+clrewgcUrMbtM3q7/ycPWF1tyArpnICT3nPQhbSG
         QkveqjMEzL1L/Woe71DDzwSzmvkSjX+fxyiGozeLSNl4DlrrdVEOrKqxDDFbN0XEJn8z
         iySw==
X-Forwarded-Encrypted: i=1; AJvYcCWMkonHx15LTQAQwGV9+jTam98gDBu8LDPdFhs3Y3pSA7nwlRpawKZVzPgufYn90eLxAkJvY/K/HruDcqJTuj22@lists.infradead.org
X-Gm-Message-State: AOJu0YwnWuEUvBat3+ClpyeDF3Kdh7sR/FJ4NoexYmJeK823Xlnr7Rfe
	OVgLYcHnZC2ZKgxabHc3ZYSAFtkdswHwS9lmwIyaaS5oYQcio6SRcDl0bGBLrbt5GIW3nVZSfPY
	Itm35FWVFe1gDX6meK1F5Hnbc6PZNH5U98BLDEHUeCMjQWy4cZmRI2TNYqGYK5s0vrPmszzxLXa
	0umg==
X-Gm-Gg: ATEYQzyVcUDeQ8SwVRdJBWtXvT+MWWvk8BpfXiN3QoIACX+M6y3jtDtVl6xOecVeiiP
	ehgyKwBOLjencOgTBZmSAwNWioCE6v4iNwAPJ7liAb/971aIGARF+14zFLB+NSB34ZtrXBmrNW9
	o+ezWDB4NbOIOLnSXsNisxZEz+KYtYaM2w8MQg+xk/NQqK2XJeEb37ry2YFGN+3/Xd2mLTRwbVH
	nvdkHGnU17LJaecJU2PK5f3UHTOygZnCIxhDxHHiLEtMsH0SB/AN1z/Ciwd24/zdf3aPkxkOEhQ
	5Y2/EOK0BbQPGUZlzlScB7stn1Qn2zjOHfucFWb9JZzmZFdFzC8ViHkFi7KHB0NFQJ0bfp3xOOc
	r8blxK9j6+pPlljER7KWZCZk0TXOJ9SiBdsqpxBjosrcsmHbXbbf6
X-Received: by 2002:a05:620a:4692:b0:8ca:4392:c20d with SMTP id af79cd13be357-8cbc8f66fb7mr1378647385a.80.1772467076387;
        Mon, 02 Mar 2026 07:57:56 -0800 (PST)
X-Received: by 2002:a05:620a:4692:b0:8ca:4392:c20d with SMTP id af79cd13be357-8cbc8f66fb7mr1378642785a.80.1772467075908;
        Mon, 02 Mar 2026 07:57:55 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:87af:7e67:1864:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b41831easm11282438f8f.12.2026.03.02.07.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:57:55 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 16:57:23 +0100
Subject: [PATCH RFC v11 10/12] dmaengine: qcom: bam_dma: Extend the
 driver's device match data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-qcom-qce-cmd-descr-v11-10-4bf1f5db4802@oss.qualcomm.com>
References: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
In-Reply-To: <20260302-qcom-qce-cmd-descr-v11-0-4bf1f5db4802@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBppbNtbOoFuqUEGNue0WR3gJpP8wb1S3UgLzT/l
 qttk43KdpKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaWzbQAKCRAFnS7L/zaE
 w60XD/wJfk/WDsX90N8SlNoKm/OHcoyRv3ABx4tr9gD6Kmj/R38oUJhVi0r4fdM778ubuxbbH+i
 H80XZAmEJNW6gL13WQZbnlBwATu0u7COqYqmxiDZkfRY7TgcSC63HpDpK3l0G+ji1s9Y61bxlrs
 WC+4AINyndhc5XEvghrZ3Uji4MbqBIKH8XSn9VQdB6IE35R8Af4DH8e/yyOSYdeSBZClpbj9K2Q
 aIcITg+8DmDfdYRI8eicKEw19GZAamC/ZVERCpqJ1cHOOuUIrvG8mWNNu4igEo8xXHRXi6KPM8l
 QcddMM3V0dP3CLHj7qpMUtLJC3bXFfiO2INEeljThG/GKvAdSZyEOItI8aDue02vo1KaJOJpwli
 QbuiNb8LXMuhQOLqxuGXc89Ww31ZvWZe2AVkKiAiRjvqEYJ2jAu3/Y/rQFzo3ys8XQeOjvSVCXT
 a8FOZ57XZD+ZBtQQp34uNOImP2X8yQrkOfCkJ2CoEs6r6cyQPoGljhgloYmssB/yRDqvvXBGIgE
 IQI4+umN+KvMru6URMpISKeWnv1NV+lOiLsJmt+eHx3l4J0wkv4U1pSkifKXxOR2ABNixrVrM+F
 OgsL94XbNrOfOEQCOiyTDir068m3kNG5/BcxeuJxWVff8850YyvXt/MMOs53oYya6JQ1fO8yyMy
 3mUgXRez1anKFcw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Pe7yRyhd c=1 sm=1 tr=0 ts=69a5b385 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fb6uNmSZeVr-t7npd3wA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Qk5ojoA-sEfptjM_EOzDVUubwPZiQruI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzMyBTYWx0ZWRfX6yU2pV0YzInE
 Ww1zd18/oLjxMuDRHNRC8yKRsD+50BiQ4J5pg4LDuveLqWaPTc0zmQIY3Rrs7iP06yBy9OLGnp0
 I234N9tLPeptBdVOuksCsKKgdX2Z4GX+PI0g4QzWM5L0VYbPGTsrjb7pj54idg8+OgxGUat03vf
 aR8CsyIOlE1WUdwIJoVIqxqTY8u0mrxps03h7yFqMBafyhUpcwXFJPVKBHPNAzGzKb2/J8T48LY
 Z8y5qU2uUXqPp9WL0lZpAcZSXBv4Uxr8+l3cXskhSz4a/kg8sHgH0vS9w/BrRpWVqTY9o0n5Y35
 SeqOntIYDVz7FGpJffe+kS4HHvbF4P260mrNm6w6BkCkdWro+j0IR+Xh8upJ5MSZUnXEFgCggqt
 8i/tJyoPbsUzLA0/vq+aeIvsp+3sHSwWxNs3Rjbd/4xtuwmUSVQok11tYqEOWjZWul9jlDozRXO
 20jwL2oEh+HJc/Sv3zQ==
X-Proofpoint-GUID: Qk5ojoA-sEfptjM_EOzDVUubwPZiQruI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_075758_460123_6002D75A 
X-CRM114-Status: GOOD (  19.40  )
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


