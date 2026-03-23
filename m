Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C422BF4613C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 15:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j+gmvqmnx6Mc+rqdGbk0x4TnThgU7BC6K13sY2POFME=; b=orfAZwRPQ72yoZMHm6wkubQbdi
	PqV0rPYxzDovLAEys7rTo5/Wr8qYJ4n0jNYh7M2KQJIGgYzENiL0T4G/WriOd/W6w6ELEYzG1Fp8X
	32fmLPZRdaCRB4pCHORKuwEVAK537Jv23xmwdduhjm3EYEEtcr95wZLKarOrOYHib8hicZXmkxRfs
	I7cg0ggU87AXBPhYS3m9EetVzAtStfJoNdUUCSJPGMtHSIHj86HPQly+KpJh1AhcKcs758jlgoI6/
	LEwSjPbxt/78XV+IXJJr3hc1rzzy2W/PvEko3Qn2SgtGTEvyPHvpxsuYjPRls0FTh99UXDGlxe0hq
	yN8EboFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h2P-0000000H0BB-3jSB;
	Mon, 23 Mar 2026 15:17:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h2A-0000000H00x-21YN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 15:17:39 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGTaO2626401
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j+gmvqmnx6Mc+rqdGbk0x4TnThgU7BC6K13sY2POFME=; b=T9R3FVGJeYxH+WDf
	k+wVIYLnBU+nW37JiurvOG2sU9ZbDmmnw1RwdhlJaPnWPoanEe61bGuVlklEXDJG
	m8gugoWN032IjSqcJ83sCvalMeZpUJ4B+VoDjdNY3iahfVR3ofL0X1Pth3Sq83xP
	aY7OD6JXt34TWOEIChgkUidsnTjllSlkVWTsGmhD8VsOz4i9hBHaQLbho8yc8A+d
	eQwEZo++j75JZncb0dPlPLDQ4MqY4k1902BNdgJYugGBA7ROZ7o2KfTRC6zxG3ok
	jwCkPHGMKDf7/+vGJjRvy5Dc8MtP8AxsEPdJ75URA1TcvKkb9KShob21ZC6AqPJX
	KssCQg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc1kaa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:17:37 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-602b00b68fcso157838137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 08:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774279057; x=1774883857; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+gmvqmnx6Mc+rqdGbk0x4TnThgU7BC6K13sY2POFME=;
        b=UQ19jrkljZRlUHM5ikOLdhqvayiWkfm4HzaCrk7h2MfTDOl4cHK66TdIHVxI89alQC
         MunKolKF96iCtCTegmd9wnKk3nQYEyZpa0JRsczfrr0FITpvy1f0xLnj2mJbtZnST3e+
         phO7Hhd7BWGNNXQEsBre4xIP6jRnM/0iv9cVtPXCq445d2I8uFAQR4lK9mWl9/1B+B/1
         dpkQiEim/LTc41bWOJQhGJO44cmueMl1fgFH38Ra2lG+wdiIb5rRp0Lh1lyg6UfIfLk1
         Rxr54SXxx0pJ6MkzoBwSC3EMEJsI37ef5qVYTcsteM2hWBwjWcVpylk9c5ksq1LsEc0B
         PLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279057; x=1774883857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j+gmvqmnx6Mc+rqdGbk0x4TnThgU7BC6K13sY2POFME=;
        b=LBbwln8EqrGykOmrVeSGGcQ7dEzsDx7FDK5Ui8Q1DjkvlfQm+F5MSF/wIthZnkV2GJ
         pVijBBZpPEpxlZ+5cgpKJhufZMNokCD3+YQy8u0o0Q8r3SfHSvqnawSw5TKb4l+Cpzew
         8Heymoqva0pM5YH2HLSbPcHcHN7xMbPw6fSXt4zo/1fJrCr5v6ygJhtpvkD195zAtpDJ
         nRK5Oam+nsb63wGOM0lEUrx5Hxyw4NBKvFNDLGEvwepL4EGDtQnMARHEqd9aS6JhRXfV
         i3Xb7NICIsOHwrBltZ8NFALa8xlp55Z45igK5De11alIDv1gjjfrHeiLRQHdlCPsAfHM
         s7dg==
X-Forwarded-Encrypted: i=1; AJvYcCX0nthXuAWsel8DM1fRkIASpMiVbdawybl4Qu14HGOJLugZtsUqSz6hCB7c51AzCk1FC1o6R4R9S8kLyFaL3TCA@lists.infradead.org
X-Gm-Message-State: AOJu0YzWknYr50BUoJOkhfU0ngY5D6i38UJjsjUxDS7xDOOPL1jnayrX
	gnGvgbK/CQJmpVC4JehmZzXK6zBBuQtc5+wnEEoKKZitQQsdpXezx5J8UALpshoxjSohLBlajbw
	z7iviUghggPWBjhSo7o0ezlnlKy7I6eFQVAN8Euy2i7n5CLfg15I4kXn+wbh3wHeqnCn65oRqFC
	qzCmAsjebieQ==
X-Gm-Gg: ATEYQzyDtBD4KIFR1+1+KmIIjkCRi6lDD+ukuwE+YjF3UqhyrUNonyGxwVYlshUYB4Z
	3dv/jFTJ4cVImulIPnAAroQR8O8Q53JYRggUYjMOvGK9XAu2LtZf+NVFFiD6Vu5gcXRU6gFa+Jj
	udmJNYJUqx7XOiQEKkUwfWYjroC2bc+q3CUwWJgwnv4inmlA0inQ8HtAOPGz8SSSF9Kdjah40xP
	Phx3ltO1PUN7tc/HiVKumsLxk3JijO5auTd95OI4Z/ydbrJ21aAZoHXo9Rof+XOMy9GiGwq/mwr
	auYUnZTDSfUcyiUIfPiS+5f0J9RqWdAOamAosD42U7dIkzAEoe0YjgmDzDs6KfJXxW9VyHfKHtA
	YF4LXALs5/6wMD+zd3hGtlhgNxlULXPtH/+a66p88J6TR44S5OTYp
X-Received: by 2002:a05:6102:9d4:b0:601:f3b6:f2ce with SMTP id ada2fe7eead31-602aeb2d448mr5250253137.12.1774279056688;
        Mon, 23 Mar 2026 08:17:36 -0700 (PDT)
X-Received: by 2002:a05:6102:9d4:b0:601:f3b6:f2ce with SMTP id ada2fe7eead31-602aeb2d448mr5250225137.12.1774279056228;
        Mon, 23 Mar 2026 08:17:36 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bd923sm35936993f8f.12.2026.03.23.08.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:17:35 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 16:17:10 +0100
Subject: [PATCH v14 04/12] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom-qce-cmd-descr-v14-4-f323af411274@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1476;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=EVDb1irXK/80h7Y6DY4Kfs/+E6/12M9d/9hBrF4TLTs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwVl9Npd4BfJQE6nZLxYtQvLGIHKZHwz2FunND
 cHrNbKAVnSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacFZfQAKCRAFnS7L/zaE
 w77eD/9bpkNJbRvyTLKxP7HkoX7qTXeuM9tjzrmiWidf56T7Uz/rYooPE0pf0RjcpLgvdT504P6
 9q/LInm16xT6358vUaDwpLlmi7yBxMJkAqdy+orCCAZn35tTPTrDQ+j3QzfssSyw4j+xSZB31IE
 Ej1ulK9sMQcKe4ijDAsxnir0bboum85zrPbtuYLxLUBHdPio4KaJ/T5JITA30MAyoTzfE20BqFp
 nz4GdWkfYqGCE6g+QgJvXQvcQelcvoRPwTTl0pfsEKFzY8j3DsW431Jny1QhR9bad7IIGECL2FH
 TMnKMCN2D3ORNtC7VK6rG4uoTl5XIMh6xG2H5knaDQHX71cy2EvJ+A6raxjrmPDQwbwnfVg/yf1
 JNo0nIpnDqTRWg/nHcHPa8mZo5dPzL4RwocpoToAEoVnzPzPCuL/fBakBo4Woo+IZIolNQZV+ET
 c/b9cpOyFZjsfjCSA91TEzc4K9H1vKJ1cefAIZofu6ALdq2OOOMZi9fYv1gU25LqnbTIhAupVX8
 opfT6v0vKoT6BwyLLc3xjBBEZB24RgdgquU0bL1ivqdzAJMqdVfTwHJMmZT0T6dL6v4bxFaQTT3
 +BhXyJ7fTrJvxeRYckX/j5NWDTB6goe0cNwCvDdg/YdWlVGVxVBB7KH7/8wl10zc0AB44tU0Qg8
 kN7EjEuUz4vb5VQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c15991 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 6tUjozFS2t_G9AoYhLtxyeeppI0tFVFC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExOCBTYWx0ZWRfX/kr3ZiPNGd50
 /d70e/EV3Gc2g/vuDiRIsQFvCH+icyWjsYq1bmQtIAOKhZs2KXnfleapla44hFU8wtSqjaBmP2n
 885BOepWDp5bJ8IJToA6XaFTFRfBX7V5eaxvOcugFe/atZTkUpsb1TJ4IPCNEqYCEUKgBOmjfDU
 Ut9uQL4KYjCvDzco10/ZHoKL3uj8ldZNCrToBauSeV9cycPn5dGjFGnFCGzCZrMC71klGZPEtCv
 2dnB1BjpdbuNV2/0RF6nfRsPxmRQJxdTV5odU1lODqdp7Z0LyWUGfJ49gCD3vw9PE4VjgTZyr5S
 P237sQbVrvwv55zJDijiF5cI9lkywyu+1z6f06b6vVeLSmJGbKZ7nrEjs88fGNlJshAD65mF5HF
 eNgueCqaFs8Zjxpa/4zOyJb/U1IHZ/QXgk8PhDi/Qk4LtMpr6pzPCqJUoOfKSOrR2u9CPiTKzaW
 PcSnWfKN8TD4Buug3/A==
X-Proofpoint-ORIG-GUID: 6tUjozFS2t_G9AoYhLtxyeeppI0tFVFC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_081738_531556_7567BA14 
X-CRM114-Status: GOOD (  15.92  )
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


