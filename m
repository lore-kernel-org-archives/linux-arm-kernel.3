Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC19F4613D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 15:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=byBhms6klEiQKAIzzwk/0xHdksfuhIUeiAfPpFlaRio=; b=J9XhL5AVkiFSk15Q5DgQ+lpe/k
	uF9QlBt6d1HsMcxBew7uOTnmuFlmDO4Oq9TKM+f/K81Aj1BYIsuUCINOwpV3NqzDTAp/3bap64rtQ
	rMpNfpvxjwWNq0SNxWhAXcZLoZCj+lbOlxTJtCozOAZCj5lsqFWvJvMPAemOu0LuShMpVr10mdjAf
	8cPmxxXt5gFsQ8Bp/9X4+umItG8OmaEzoVuTHbzyihaoxMbePg4EphRPIHk0Qz9QCp1Vz/RNkV31+
	VNBLNOisC3CZOrcUObYnNg69bb5HFAtKipGpkD5+VsRXRosLH4a5+FuUykryWMLpQgIcH72RNYKAZ
	tVdvwVZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h2B-0000000H01r-2Ib4;
	Mon, 23 Mar 2026 15:17:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h28-0000000H008-1C5P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 15:17:37 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGXeV3287882
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:17:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	byBhms6klEiQKAIzzwk/0xHdksfuhIUeiAfPpFlaRio=; b=kGWZT4JSkGl8CjPN
	gazARJCXqib/p/gf/2sz9fTaxkkLYcyyuohN70Ac7u/L33zWfS7gFrkuaQIEp0Tq
	zTBMLbOcgIstE3RzM4N/c0etFHtBN1e5nbRhrmJUMYFAl+dADPEt8+VK1Ns1qvKr
	nKyVk6vCeO50HIkiuyCaQLcr1s0PXq5zYwq/yG2yXG+i2b5UPCZsSnDCZHxWX2fT
	AfCTotJy8suo7HW11YTZ/eijVVW/po9mQB5d6IHhResj+ipR3iCs+kp1qGg+wRV1
	VXubeh+2feMFOzcA94QbyajLykGGCd/x8MlN4AgwBtAQhgspQwV8Dhq24ynfoMPw
	wTSXdQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34k4gv1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:17:35 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-5ffba307845so32385256137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 08:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774279055; x=1774883855; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byBhms6klEiQKAIzzwk/0xHdksfuhIUeiAfPpFlaRio=;
        b=OY1Sp5TaDzyomXzW6eWT3T1FnGqChzwBGIqIOcfwJRhf2502AJLWecf3dCCkRSyIvg
         s513Jzp2LVUoje8Aa2vD0TsDvfFtTJLya4MrpulONj/vMt/Ca6xaiKUdvvaSkaY5lKgQ
         4s5FkOotNRFxZu/z0TMFfYUMKHEfhz/+oI1RGJBQsENgjDx0BecydP6WzuuGzb9eNCAI
         aSzFKouT5AqsoS7/0IaD37V+Szk/zHU1OsSKTCZZASaEg3N3H98qxJmQjA2nbYomWuhZ
         d3MEenGQx3WRpx+T1SWmeD/PByR79ZCsLUhI7ZLdt6GlhKIE60KcNj+nsD3tFZZHExfF
         oJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279055; x=1774883855;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=byBhms6klEiQKAIzzwk/0xHdksfuhIUeiAfPpFlaRio=;
        b=NTsaPVZsd+yTWI8MaLbMqro8uC7WIieM0bfoqXI4qJYwYsY8OK2j75sTk5157X3eMD
         AdPjVuW4SWE2pZDwIZbKxPrTN4RNSQwWzZ13OJUdHObRO3P5uvOJ7vwpb5lQZI4hFFiK
         ydQZ6j8RS/gFUKKwuQynwrJUK/nAaC+Qs1x6NZNwUmAsWW9AKp4WhyXdhWOdsJtmPyb+
         FA9BXp7vNKZT1sS+uxe74NSCilMxZTdY5dJ2A2R0/AU2ui1jzZ2Ou+TjpqA2LTFyeAEZ
         eZeuV18Ofg0ONqUWqP2H+ff6gX8a63QPCC+hARH/TlBGNcogcgQuK2NVGAAfwp813woa
         +ZBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnDI7mklcgTHbnR4CSRgaFLbyIqCRegpGulYlS7HKnq+ulrRAe5+cCPW0At3LWMLoTU8665F/aZy/SM8KxSx+4@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8k7DA0Anieq7NvqrWq7xyXfvBg7+GB7j3Zsa6BPaGRcJVJ92H
	NduI5nrPbsGLZofyzL/YHOLshBxeNJUbHzOxMaqchkvf/RX1xtc7jDbqfvOrED/dXYvyuk0IMol
	qsZ9EAmIeEEk7LmJjSI8Rg76kTaM4T7Nz8Vwm0gcwjdn8WAycTMZARyYIg/xPrhRHcCdti85Sj1
	Gt1w==
X-Gm-Gg: ATEYQzw+UuNHGblBW+Bn5QhViwK3In5k52kUf9E3tf+RQ4X11OC2vJed2MFkql3ROvU
	anAYl1DNYkJZlmDA4761uuwxkpkJFMYB+fyubYYMzEDvEDxvYKeKu+qsIGqMmZkZHLCU6v+P+SI
	NHeUkNQ2WBzLqepyDmk8DN+BRbZZjLbGIjXex6+hlZIbhfNOk4HFpdwokxPTtnkSM5WMOnjlr9c
	WP7J5WIHVAeVOteqjageavZRVrbf1svppoN1tybWN8J3p6cWzUBTRQ6283r87/zU+CJjR2VvMkX
	vZl7hTUtIF9UM6Yqa4mscU4i7cOtaT/3nSFBegB//lIWgMz9nV1KnyawaUsKRXW4cNMcGtmdfxI
	XPjMhH5HB4GhsQnEkgX5TvuoYuwQbJSEv7PcV9BGGHSNNLszJtEci
X-Received: by 2002:a05:6102:358e:b0:600:1547:967c with SMTP id ada2fe7eead31-60295f98c4fmr8781917137.16.1774279054722;
        Mon, 23 Mar 2026 08:17:34 -0700 (PDT)
X-Received: by 2002:a05:6102:358e:b0:600:1547:967c with SMTP id ada2fe7eead31-60295f98c4fmr8781883137.16.1774279054168;
        Mon, 23 Mar 2026 08:17:34 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bd923sm35936993f8f.12.2026.03.23.08.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:17:33 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 16:17:09 +0100
Subject: [PATCH v14 03/12] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom-qce-cmd-descr-v14-3-f323af411274@oss.qualcomm.com>
References: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
In-Reply-To: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwVl8OLLyF9aeTIVtzCoOOIE2qZunIfV1911Bz
 KQ+q7C7QHGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacFZfAAKCRAFnS7L/zaE
 w+1pEACjd+dBDsCtr9r99mTt1ag0OpCzQ64m26+B7AxCgmKG9elKjt+uDI7Lbr9X6xXdXa46L2l
 lz75ziRJCVpa06pdDEsdBgXnQogp6mjJv8jTmWNNLB/EU525xl8wDYo2xjomm5JNvwnUT798+d6
 ez+74vB01NIqS9UXW3w0tyIekSY1rYU/PgJ12SMJzs+detLRrLWUiFF740ISEPXnI5sAAolSBBK
 teYABzQBxUx9Ta56CKhdxNvUx2NhKWf/LFwVGlPWZzwvp+W/A9K/FNf+dd7nyc8JjbFtvHS6oVJ
 +LigW54tK5kjgEwBwU047ofr02PvrZY2NFm7xjSPsnuqwJs2i14Bk0RiQfSOSBF+L7I9QnHJOkx
 H30Y+LoC6IFiJko612QZ0s+aaZtdUAhLUb98kstnRiXt+53dzcXXB61/oV1/aM0gt1voH/2qf/j
 DbTX4FfEFQNuqio/1RzhdskCM7sCChm/ka7W5KN3gbc6dU5s1zAc0KThkz9SlaN6py19uqwq1bl
 VbzFq1kW++JjPONNpu0fHcwf8EpWWz8RQqRHC2GqNM88wVj1JCp70YlCmhEeTK0Etqmas/r6aWY
 zLxjZGEqugWdFfFnNlvuKH3V9Yz/Esc3uOnr88fQTDz7ybnDhEiXmBge2582PDx6djW7xYnqjy8
 xTEvcH46kzqM3iA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: Qk_geXEU56KHooTaH5Kh05yDxHLyl362
X-Proofpoint-ORIG-GUID: Qk_geXEU56KHooTaH5Kh05yDxHLyl362
X-Authority-Analysis: v=2.4 cv=c+imgB9l c=1 sm=1 tr=0 ts=69c1598f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fb6uNmSZeVr-t7npd3wA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExOCBTYWx0ZWRfX7MxBI6TGxJvl
 KHK/DPOqj576qTLikgec8cFca5iSdfE3YULKcrjJQO3lmqCqvse8VJ1fu4hX12jj9yPdghUCeaq
 Aj1/aY2487x+e6Oef1ShvyFjL3OFEnkI5kuHx6a7GlEdjepjgTcWmTXMaOHAGzB0dfoopTLiEKW
 dpjxA9ZNfTsFKxFtUaFieiYq9khEwQwHkNssoMlK2mYp6YT9mNrIP+c/tI5mRXwdPdBZLvL53Eb
 zjiI/NZJRbBC+XCSWm9OxIhCKEHJ37tlBp+bNb5GbQgOJ9AOUt5bCxPuTrFrR7/9FDUPCHaontu
 gbBLQDBRFnvlK+IPXATiIh+bvPFti7uYqT+s9X2A+UBD2iwXrp0NNis5kjJ813ItBRN+25fpqmG
 v3q9WRV+OnQKOMRv1XNXHZueK2SS80ljZkaTXZjomm7sRV6zuB9L1tVXxBcSIXuu3RHzvm3DWXt
 E21vgfcMgsyjjG08j6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_081736_334436_C79B19EC 
X-CRM114-Status: GOOD (  19.26  )
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


