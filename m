Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C4CBC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 14:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=; b=ovcd+wmQpZQ+rr0UT4s+lB5B3O
	f1tBv9nsVTevzhejlW+qWUG2hhJ1mMQjLbchuk6a6phBdcF+xn2ih3FImCCuO4ARxMSWbSeIs002W
	3vRflehs02oK8LUqdEKbd1dC8b1ccg0Pxf/+AFKmUcE6mMeIJpGLFa9/tnSrwzdIlfuV18ePLGrUi
	DG3RccOCyM/9tnlT7CcN98+QQ0QnpjcblrhzS1vwV55Sz6peYwRnD9/MiGa96vinWBxcWUEu9EqiZ
	OJmBasrnaY6UtCL8lJ/EG1Nt5sc5U5MWc1qBDrVgwBd1fudUB694EI2EaWjy2d+ZFdsQCM4FKU8zg
	/HfrRK0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGIA-00000009Hhb-2JYQ;
	Mon, 13 Jul 2026 13:01:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGI1-00000009HSw-3kNA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 13:01:48 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCEHa81516650
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 13:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=; b=TR2VbwhaedtgsCjR
	Uc6c5F5h++logsbZPYpfV1Fh6PqmawOGcAHQ21iHQezcNdSzQJ/hH4I9NZYrOkqx
	lBLDY34/a6Mqh6J6TYfYnm5Nen5aVfGZURd12dK593ddK0mfSA0h7bDASCFnmosu
	wgZnL8grKitKP5SZYSqwqoJq8K1729eyWuqBzxz3jVAFEXnre0TkWWTyR7m0pTWY
	U5EtcCXUPZXtNmHR2JrUEIvV2wQBvJhkXrdhe5IGPrWD+zqHXj6+Q6M03pA53uqJ
	3PHoHBl9zJgx7ynl8BYeN2NrfjpBZ7+Ix7q+5uw/mgvMSLX2Pd0pIcgpdduXTkbB
	CBTx3Q==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcubss95u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 13:01:40 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6a13b72112dso4281683eaf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 06:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783947700; x=1784552500; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=;
        b=NHgJG2NlD8j4x+J5iJnECJ0CvIaHRAqQ6+Wj2kajpydGR8lovz+NK4sj/e+5jGIcjk
         uUHRZbDMFM/oS0eTknnsA1E5oBlUTXeuPk7PgqIoi0++G1/4YdVTnNyMvsMVFvwkfeb/
         6MLR5PPa/RR8GTDBtjkBHZ5baq1gsrEBaeiEnrFlUaDmt7eklu5x1ZQe2EHb/3qcnB4M
         +EifrcZ1PKbU+axJeKRxc2Tk3qhA/Dv+3Bj9wY4MPMOQ0FpKnOmLkocEiaB1rdodevbT
         C6U7cXe2ykQeq5pE3JqqfgHDqRFh9n5sVeSJa7LPkNoHDolgLE8+PNz0+YLU6hxZCpWl
         1m4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947700; x=1784552500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=;
        b=Wd9m6K4rwPgjb17wH/I2yFN6JffJDd3ha80s5MvHqaeX2PI5uBeYLU1rFbZoHa66hb
         v/Wos/826w98XAPgbrYxUPT/C/BqQpIXxxSPZtbp09UHQqyFrluWwNq5hEQ6eQHRsRhq
         ywz3Sn8zZ0JEkEMuTRfEKWuH/4q6ptwlPByvyru2L8IVde8a2oqR9PMN8LlWup8D2c6l
         vOxGfOJrXisFGoy/WuosC5KyTyQBRd/FSC4gOyLSLXlIEBjwbflQ9/3OUW11HXcs2ALv
         /jVccffV9AHduRPhoSFF0SsDd/sJ+cUcHGcx3jGpmZ4WNsfI0k5/ePURLgd9Fbg+ZHLN
         bBoA==
X-Forwarded-Encrypted: i=1; AFNElJ8Qa5CJjtdpWL1ER93xMPGZ12tfL/0o3UIy2PcrhogTFVdSikFf0uysvZZyrvfXiq5/oGFm7Bq7bUEXhxj3C6Hi@lists.infradead.org
X-Gm-Message-State: AOJu0YxTWsHLCxVFLJ8Bh5Xc8GAFgdKGA8OtVUqhhwjkO9EcZ7qvpEmL
	BdDQiugD5PoCF7zJr7Biwz8HQBIQYcox3hZSd2LxPdVumjIZreISfxYQ62CKTp7PEIaGuiHRBdu
	WSa21CeZVq/XAJMLI5a78jfLUjmgNq8yqGCgvTcbjauO5Y8z8seFGWer09p7OvZN4FY609bBycd
	xGcg==
X-Gm-Gg: AfdE7cnm65C5HG76t6NPMqMXtve5CGgCaNfKZZFIDlTAukr9WVimhro8kYo2UiOZ0MD
	DRn036IRzdwG4WmH6uRlsNmfk6AGbOsvrQM8p2YSKRmjQJ3OGrAoB1M6SYj+Eb+WIbkzEpNeqnx
	xxnIp2hu/jG/ajU0fKXHLAzo4/PoHIv/w+XixJAQmVrfTmaOzpYoM7WkJnMjbTOEzdjUhmxBCKY
	Rlmra5HmUnOPy3t5uaIhaLqtpMYNH3buRKHdCmMcHu89+02MJJI7gj0FZYSkwQ2kWXKXB5qbzKK
	nlsxdYjUjytHq6N3H3mVO5OZItDHER6DMHDHJsxWSXfE5hNvKbSU7XbStSOZoHZTx4Qz5yCStgW
	lGmkDhrBxTo2goeOPtPre37E5aalQgjtj+UWazsTJ
X-Received: by 2002:a05:6820:150f:b0:6a3:74c8:c055 with SMTP id 006d021491bc7-6a39a561d8dmr5636194eaf.11.1783947699754;
        Mon, 13 Jul 2026 06:01:39 -0700 (PDT)
X-Received: by 2002:a05:6820:150f:b0:6a3:74c8:c055 with SMTP id 006d021491bc7-6a39a561d8dmr5636138eaf.11.1783947699138;
        Mon, 13 Jul 2026 06:01:39 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm306129725e9.2.2026.07.13.06.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:01:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:01:05 +0200
Subject: [PATCH v21 04/14] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-qce-cmd-descr-v21-4-bc2583e18475@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4322;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=HGeQqzQf8+DrUa/4bzOvLohFWS/bDVC1MPHUwVaBFAE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOGZvuGUYeChHOLC77HMfiNMIfVnN8AjQan6W
 BeS6asnms6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalThmQAKCRAFnS7L/zaE
 wy1iEACsz3YnAAnaz1k8qigqPCxgYXXpAPo28WK2BGkIxJnWSpkVg114GyWtZa9CVovWwDf2FNY
 5mPXTCu7d/cHhSoqNb2s+vD7NcQBdho/HyhKnh1tIToo54h1FbJ4ViWRQ+R8mflfyoCsz4yobXI
 XgbZFKJdPqtW+e0hYpbBF8nPlzP53vpRNpTu6kM4o3fdPUOtwL+sf4NpDz4J6gHcfxIPdStSGDP
 LF7rY6vs/mxVwPHuxytui86zaLzSz5BxthuE0QUgb9vqkibyJRvqUZpfONM1ZI4FQlN7gZcoaSb
 6RMHbvWs1VNxS27/r/4LwU3hHF3RjudDc55Bj2skAEillw4YHRxBHIXhhTy5KsS/wjO1MoBmhx5
 ttgqK7vp48MohSGVdH4GESxroODaknQWBMuIfeGmqxY9ymjvlPqdnCSxW/K3I2HmefMPPS8hSMe
 1CZIgnVz60PtsyVz55b5kqyE3RIpcDqN6Rn+Rg7jDAiH745nA2r9f8ESiwNJR82qMwwvqiLnjIu
 /dPR4SMJKOqA2wafaxWf4kJLmYWCoawsh8EXqmQ30Rnkv9NVk/6Bk6snCJ4jVo+YpJPEFCotVH/
 Ba80v9XTVKr3TKqVnlD3N/vpR3tp6SRRbPLqjndYlcmwY+P1qCQvBdLJBTR5TiIxFCvS0n6nT3E
 Y1DpNNcWZr2QC2g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Oq9/DS/t c=1 sm=1 tr=0 ts=6a54e1b4 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ioP1PY9e4_dTeLeN8ycA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 5KEl83Q4DGYGN6cXYMRtSNLIsIAoWTAs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX0d7gINw28nzJ
 f+wi6hVxcOidfrOk7sfvjIIBBeIqlveJWWAwRNKW1rOQsCNChNNUlAs6Bn8uuTA4gF6qEy59R5J
 yedJ3a1iJOa5H1QXmCysn3Yja3z434w=
X-Proofpoint-GUID: 5KEl83Q4DGYGN6cXYMRtSNLIsIAoWTAs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX/3EPdFd8nLNp
 2UBDalscNxR4zUOsbnHukrAdeXiOsnTPV1tfuKJqIm6NBpQYgeupstQAyie2toZWkRUolcwzCnv
 wxbqxdkkR/7VyJBQyzvk4ueF0dSBlUPPZ2WjoN0KUKgYhVMyGL8/9LIT7AD3a0Xbonl4sXLgq9/
 KEGhcSdyGxUouThRvEFIG/kd/9kawiHtDQmTvEbLY1ohwA7fROD2kwNCEuti6tidX2dF8sbMyDf
 E5n5XqaAHJP/EvH6NtiQ4CEFbpwhkPqJdFUJG+XvU1YIMbUdYlyDOyjRM6Q2gfyFuYt3Bv8kz6b
 PaB9W130A9dYy9jGUuVbR2rXznvj2NE45+L+1brKegFl11OVVsGAy4a4IHGCC1PvIuZReSp9iCY
 D9vrdp2ir/W7TrWD86MxFpaYWW7Am2CHRi1y9ZoIA+BE5rb8pnrxhMfupT0Dr20qiNllPV5V0NE
 AeW3SDsXrep0JxaJXnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060144_868515_A722FC57 
X-CRM114-Status: GOOD (  19.21  )
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
 drivers/dma/qcom/bam_dma.c | 34 +++++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index ea3df28e777f99c0532761b6aee6807ab23ab4ca..8ce0fe085c5fea6cc614edd692b5cfd264b94d5a 100644
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
 static const struct reg_offset_data bam_v2_0_reg_info[] = {
 	[BAM_CTRL]		= { 0x0000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x1000, 0x00, 0x00, 0x00 },
@@ -229,6 +245,10 @@ static const struct reg_offset_data bam_v2_0_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0xC820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v2_0_data = {
+	.reg_info = bam_v2_0_reg_info,
+};
+
 /* BAM CTRL */
 #define BAM_SW_RST			BIT(0)
 #define BAM_EN				BIT(1)
@@ -422,7 +442,7 @@ struct bam_device {
 	bool powered_remotely;
 	u32 active_channels;
 
-	const struct reg_offset_data *layout;
+	const struct bam_device_data *dev_data;
 
 	struct clk *bamclk;
 	int irq;
@@ -440,7 +460,7 @@ struct bam_device {
 static inline void __iomem *bam_addr(struct bam_device *bdev, u32 pipe,
 		enum bam_reg reg)
 {
-	const struct reg_offset_data r = bdev->layout[reg];
+	const struct reg_offset_data r = bdev->dev_data->reg_info[reg];
 
 	return bdev->regs + r.base_offset +
 		r.pipe_mult * pipe +
@@ -1234,10 +1254,10 @@ static void bam_channel_init(struct bam_device *bdev, struct bam_chan *bchan,
 }
 
 static const struct of_device_id bam_of_match[] = {
-	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_reg_info },
-	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_reg_info },
-	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_reg_info },
-	{ .compatible = "qcom,bam-v2.0.0", .data = &bam_v2_0_reg_info },
+	{ .compatible = "qcom,bam-v1.3.0", .data = &bam_v1_3_data },
+	{ .compatible = "qcom,bam-v1.4.0", .data = &bam_v1_4_data },
+	{ .compatible = "qcom,bam-v1.7.0", .data = &bam_v1_7_data },
+	{ .compatible = "qcom,bam-v2.0.0", .data = &bam_v2_0_data },
 	{}
 };
 
@@ -1261,7 +1281,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	bdev->layout = match->data;
+	bdev->dev_data = match->data;
 
 	bdev->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bdev->regs))

-- 
2.47.3


