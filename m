Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95D0EA4E2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 15:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJf/VHFbEfrJ7fM8DpDhu22yxXg6EYy+KGz73+G0kyo=; b=Fywar0Kj1qt0yu4bNzzVql3FsS
	yE4APnTZu3lXv+nT1ZAP9oStXTxHIaGoglZP8iAwTE+s58MZ2xeWfDYdBBHJ2x5ig4XfQRSVj+vvh
	YFFkaLmHBE83Eg1GwNjH7O203j9AuIyla5fVCmnT2vH3hCWlrIz0g75b0ROK830lYZbcMNXILtBB0
	Ule2+R3aOpStRBzycSVoxgAytOJPSotm2dg2soHjEEBVxoBlJJd+sgYLRcci7Bz2SbqAH1cpLrApG
	51jWB1prhmmwkfDf6OAX8OkX1OYeFR5gTUthyq9s7Ccr/7Vcebf1rGOcq0xgFQ+xBVHCqSKlAnDoE
	HBRlua+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5eo-0000000DQIo-35H8;
	Mon, 02 Mar 2026 15:58:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5em-0000000DQFB-2850
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 02 Mar 2026 15:58:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AJf/VHFbEfrJ7fM8DpDhu22yxXg6EYy+KGz73+G0kyo=; b=cxXsUUJSpnF1ch966e5f3n1Enr
	vycAWL4Rdi2IJwCnY3eV1nTcEQAP10qL7AAvwyqimyTRBT5N01gxFYvdX1dW3Iyymcf95M66y6swu
	r9Y42phwabt0IXdJju44jdh1RgCo6MoKuQsxS5psj+ZPTxOFlL9K10tNKtmkGpktF2t+KnLhDpX7v
	cS68HWLFHluAlwoqBe8NPkUI721dH+0iz4E8nhLvOZ6mxqSWTmZP0m5xq6jpsqmPvwX+KyqMqX6UR
	7j0f1tqxvmRfoFt5B9JqUC/9vLKiQAxuwlMvYKlj3+Wml0sySmXLxNfyqoBt9mVWBOsbFlv8w/Cr4
	f9yCCcdw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5ei-00000000VDm-20Uc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 15:58:03 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622Elp3w2048854
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Mar 2026 15:57:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AJf/VHFbEfrJ7fM8DpDhu22yxXg6EYy+KGz73+G0kyo=; b=pQ1cF/MHYq59woRz
	oPrTjawyd36QiltIrv43pzT61p3G2qkYzR/zqYARzavBpUevniNAZXa1EVozR2PE
	RbUaTpzJdtRHFOP7mHtMmZl9GdOAPUGNnztZJOdUxGIf7ppNfPUR85fQhI6nAoj+
	hfkbZuQG4T3Zhd3V422sOQwPkHm+lkLJRudA8Ar4m8of5apM7xIz6yzQB2vJBhZX
	vBjN5x/zBYjil+QO42LFEWpPtdaurRGUCpecBMuk7EPEg/QD+/NGvvzDErfDwP1b
	lgJ2351XzPs7Uv+UQpq+SIPjiwBGb3Kk22wy3j8vJod/lMMA/RYfgM9B5WTv0Vgg
	bRJXGw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cncmfraka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 15:57:58 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb706313beso551386885a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 07:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772467078; x=1773071878; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AJf/VHFbEfrJ7fM8DpDhu22yxXg6EYy+KGz73+G0kyo=;
        b=ZzsN2v9yVwU1/jIIbX4OzHvjGD/39SV9wBiYTOAPmF6Nbomazn9ummLHqIf/39hxx5
         5wBozCDm48M6bLh850qEPZC9P1nGiidMI4j+4TxfXwShHObv+LFEKsDchbHO34xxzRP3
         D7lO3+6IfJwOYPqJLtBOijwX/3dZXvk/ujL5MHJvOEpIl/ZTW+LJ64666tjW57TV85/D
         12eB20syPo+6PxlE7DSIul3pNxJ5oFVI8V8eV8G9eIBXL0juUoxP66w2L7f/O2ArayKS
         zr8m+tem55sjdJR67YNrhNz+1rKbSBqvr7oIZ0Ym8dOB9RUko2bwbTY+IGfAUhhQv345
         TzXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467078; x=1773071878;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AJf/VHFbEfrJ7fM8DpDhu22yxXg6EYy+KGz73+G0kyo=;
        b=e7WLJOl+TqWIHyFLmsIxPi3FEpujN3BC8pgxBC5dLar2AILTIT7oRwBgRbAJ/DI/nA
         8f3g14bY/gETUXA7aXUtl9953XXPlr96nXY3k1AdhgXdDeWidkTXsNDYfwACzH1V3nx/
         D9p4u5JH7jFwuUCzykm3RUp5Rwau1Y8YOKctQyB6/xOZ/gvo8owy53XCaWmX1o71L+SY
         ClbgxV3mygfnxGvdP5wzR9QzptQVe5NYtwlQ8BBZ+a4qnjsvoghPcoFr/OjXmNStnVHN
         k/GfOLalOzezzOgDM8E03Fz1KXSw1rJbxrXtqfqaMpTI9NTiryceN2/ZX7SApwZp7FqS
         nlYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXspeceHpCMtmp58qrmXwI74HSDdwabXjiCj+zd9bL7V/yILyF/Gl59NGZgJtQkEALXVhFipfsk/MDVPKe9tsav@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0GVrGfRhfz362/4Y2NWF74D3DRFHAPb8tyxX043xuySr6QYhZ
	Kjvd6hiQUBS1sH5VfdTcI1PEKpP9RF52z/G6dmU808LlwmUUd6C1P+T5piL1jLyTQ3F+d/PrDbU
	+Du+F3aGO0x61j5d+ffOdz/zMhZuqtYGPzL5VYNER/gC6JQFTPqNozguToxhTcYRb5sGn/Cm1rL
	1T+Q==
X-Gm-Gg: ATEYQzw71efL8FT5AwSBVRxpyAiGWCS6PmmH0QOMzXXXC1pFQYqLMt0UgrUtLtDyUv+
	FYxJuuBnGoHXm/RJxgo29wpJVIt/d2yZSJax6CyrqXatgiSiVvaHZhcMpbDR/CCvFhyhYg4FJfF
	gi5C82XPvxsmgqHrrsqKl/h8fPJOKEL/1r1Yw6mF/BPaJDdiEm1AmnjT7GUa2iJXvisHO55kHoG
	xenqpa4M3eMRGW9Ptz23qojzUptmrFnPHezC85GDFUmTtTLCND5ge2LPM18iK4zc4qtVLpG8va3
	mCYghsi4ld55L8DBd1H+O+cvggF5kLhX6yu89yDTEkOlzvEFBZviErvLTSz4JiqWgadfysiZpFa
	tKVKSW1VEaknpC+a7KeBiiN5N/W3ycppwu37CKdy9sb0p4JWyEOhQ
X-Received: by 2002:a05:620a:404d:b0:8ca:2baa:774 with SMTP id af79cd13be357-8cbc8e82641mr1612983585a.18.1772467078427;
        Mon, 02 Mar 2026 07:57:58 -0800 (PST)
X-Received: by 2002:a05:620a:404d:b0:8ca:2baa:774 with SMTP id af79cd13be357-8cbc8e82641mr1612979485a.18.1772467077944;
        Mon, 02 Mar 2026 07:57:57 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:87af:7e67:1864:389d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b41831easm11282438f8f.12.2026.03.02.07.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:57:57 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 16:57:24 +0100
Subject: [PATCH RFC v11 11/12] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-qcom-qce-cmd-descr-v11-11-4bf1f5db4802@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1425;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gfl+Fn+ISpyM/izQ226zR5pAGJiHs0gWIagW7nCmNI0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBppbNt5bDUkL7J/F9xgZHxua3RHn7yN37DQAd5k
 a81DXZBCUmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaWzbQAKCRAFnS7L/zaE
 w1AsD/0dIvkbcuCLSVavXlzNy2A5vtB4RVHS7Sh8XU1wqW/rudIXRcE6A/tT6zQwwRl9FKk72R4
 LRyW5woC/F8fOtXQbE60wN+nyNhHJqFaQrXGcgvkIdjSeMEPHBP0UGmLQc/DlMK7Myvcmha6NBq
 a7R9i65yQ1O7/TjxzvKbo4c5VsEJosG9sqsIFAyo+cctWRU5+DVpaHS6Watckmbme0qFNGqMumJ
 ZK+SoYfWp7qA+QUakyhPHwWmBJCyojx0QWjNQ8jaXYHBMQvDDGeTv5aXLGbiN/X7cONQ6t+5gok
 bjmeSoRCll96nWdaXevAKoCcIZSlLAZtKNrPRTP2GWc9NskijVbNH/58e7ZJdTtHcrHe2AuqrDX
 5IoxbK++ZYng/eVj0Co2mqvxa7b9p17y2odXkzVfMnvcQiwUd3gp9OHNLvtUjXhwgnH2+9bLInl
 7QeLiTkq+oxQOUFnF2NkQSywZFTVeUuczgyvavqi+GMgYUPijvaprVjCA3R9hLuxKq/Xj99E9i0
 bHNrt3Nd6WdtF2JvBKm+xXlADr7nUv01fx/TDwiXIhzvk/GnJoT/ZfH0BqGi/ktIBdPqgujId+7
 xcRzaDdTjSY+NCHZL0FfykhDxXOXZjG03CXeFld/hXWHgD9mY3CgjRQ8lj2++jdO2J9Q3dLNRSB
 Ddhf8CtiibFMAxA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Br+QAIX5 c=1 sm=1 tr=0 ts=69a5b387 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: a-ml0Eu98WOHxDDyPCOpj-dVxwOGv-Ic
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEzMyBTYWx0ZWRfX/ckTXZjy8BH0
 PQNT5mVVPA2FSCCTw7wCv5KS6Tfy0ljSUOv752rnA6bL6qK32Yqi4YNX2MQO0IlPedWiCSsmSz8
 Z9b/CX9oqRqCtN6JrYEAC7Ia2uhY4VaqXknn4YNz0q7fUB0avfOxCyD/2GSVxdOLbocSWilJh8j
 mdWwz2PfxJnAXOj+1ZuRXThTaCd1j3yuAEyfmLgaSxXLAy3Sakt1cVjnVGCHA3mVPymG/f0Oq2O
 HWMFP6z+qTb1lTj5N51erxmwxQKeB8MnAAQCp+gJuIM0gPn9Vfyh5qchwMgNYXApgcHSwnW51fK
 6GBRaTlPdEs3J79vgStHUtjXY518pGkDC0s6FoCGRVty66LfnvseEz/o2zDkpdShQeGx7oTaq7T
 psJWtyH/otLF/TD2FTBuvHXoSJ6GXBcZHhbrQn4b7zDBPBMc2pyMB4lLED/brz0YDLDH2RddCtk
 9q8+Pl82VWmKb46XY2w==
X-Proofpoint-GUID: a-ml0Eu98WOHxDDyPCOpj-dVxwOGv-Ic
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020133
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_155801_906548_35A795D0 
X-CRM114-Status: GOOD (  16.28  )
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
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 8f6d03f6c673b57ed13aeca6c8331c71596d077b..83491e7c2f17d8c9d12a1a055baea7e3a0a75a53 100644
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


