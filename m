Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8348D7497A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qUi2FQ0POg3ZPyPYs1Y5KADOpwaRNzFjWQw8TsUhgY0=; b=HdFD0LQTV8zEj+iI+BTIIIRhMc
	fdOj0AhNzatTlK3NfQ2x8oyNNnKMhk9iR9HTEEiXrOWli22SJ20Mt7dMNn5sOOuzuhCdQ0QtuRykh
	hWEmVFMqC3JHpr6PgeVdjGj87PetssjD3gCki1n7aUXhCf3OxHWFiJP9d0HoHbKp0nHpEhv6jl60B
	2U72D7htWPJraj/8bI8TEYT+X6/23wkXt2i5OSrl0kzH0qlvH9duGKpcoxR7OgaIE0kNoaqqcn4lw
	Of2ZbN/GzteXt02KZyMtuyafrOYppORYkSB9/Js0Pgpptw+V5Xr/3LBurgB1TIwWw6KFZdnebysVw
	KW9i/D+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXPV-0000000A1Ih-44ic;
	Fri, 19 Dec 2025 10:08:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXPS-0000000A1Gn-20uV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:08:31 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cNHo091968
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:08:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qUi2FQ0POg3ZPyPYs1Y5KADOpwaRNzFjWQw8TsUhgY0=; b=jd6Hp6WhE3UlmcHK
	HzTMUChSk2rNI2LyJTgeW9ia1gxsPgjwRQsZdUBKYYc4ZuIHFILrmq/6Hq0ljhbp
	K6oggkqDJK6sVtMjCFmcNzm4+9IxipdU5AIUxt4lh/tZYhs9F5wYUSD/b1MMQC+Y
	FqETxxazPIzaiAJiqaLuCP2vk5Yp5tM/6n9Zx/yAYiz44vvOKNoTcFlpRkin6WWN
	7eN8KLDsoCmRtFfgawveAbpejmtlwaGPtOKJySEosvVmWoE9fQruAGzXSDJXDh6D
	T6ARJhVx4mjp+6eG9iqG+ToAx/O422cEYEU3HYqnOsuvKtzPNCcUG+ZVuqs4AcNH
	VM4xTg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2ea81f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:08:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b8738fb141so622437985a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 02:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138909; x=1766743709; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qUi2FQ0POg3ZPyPYs1Y5KADOpwaRNzFjWQw8TsUhgY0=;
        b=VkeAljBsdr1iCv9RUAniElzSUSzQZSYg8YI09GykfLjx05hvHLc07dz50WQ9ABj+La
         Oz6oqP/ZfeYlyPfdH3EhMWP/ji4t1A6OTeLclxTM1ASYKhEt6rSnKyeK77ucXAHaoly4
         XIGQyEaupOET9Jv6zCeQWWzz9dChOynKGb/MOjVolxVyIfcWKtlVyRR/y03+MevELgDM
         p1NWkohk+hgCODCenG9eYsVYRty7PyC9hrgMn+BMz+/jRsQHiYLWNrGjvjMzQEnxo/Qg
         o9FLKyVM6kPaw7JxnVtmzk9/AxbA/dBQxktD286YUBX+b5/cdMm1brKWCh8DU/XtFWaM
         jsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138909; x=1766743709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qUi2FQ0POg3ZPyPYs1Y5KADOpwaRNzFjWQw8TsUhgY0=;
        b=eS5jrllxBzvQFxUKbwXOPqPHH+pKo7TlFGf8j68+qob1SbRXbg0bjyMIqCIYNdU3l0
         6MLaFQcTApW3nxTc1UktCaluQyamh4f2vqG6lE9zS3EgQYTkfEssapHwYIEfodSF7gB0
         DpFCMo46jKEv9Oj+yGYvOvLZBnZ+USjs/dyFL70uPPfhc4UV5XPJ53a+zSesROxugztO
         eCFSmuUK2Oqr7abnuRtkaD7pfg8buPr8po14MdUfXCrq3lfY6bFhWvKa/l2sviDUYBsw
         /ow2T2RVP/kbfC4sD0oEDwPv9ySNEujBqVxecrZl/plUYXHgI5dxdv1/8AdXDYhbjGHT
         pFlg==
X-Forwarded-Encrypted: i=1; AJvYcCVYw/mZoBwFLvAwARN4E2xLAbgiC21R/LLdgAjvh9vYMqjM8XCN0eSt7mYHRU5Bu9oQKYx4+Dz4fsA6bgVXDxNd@lists.infradead.org
X-Gm-Message-State: AOJu0Yx67qCWimQlY3zurdPQfeCgxlmC2XsjnAeaQPjsA9nBUplqf4eG
	TnJ9FVEx1/TVkyfP84Aax2Gry2TXAb3p18P3gYlGcSwpO+5skanZb0TtclUQ3pRMJUW5osq/3uM
	pG129EMmElvDSAhdIex4SnRgPI/0NVqFLuXuyZ8gzv7pa3Z+4eNUpb4FigXC5NvyTONbHydHc9r
	MUqw==
X-Gm-Gg: AY/fxX43TE1q+ulXzrfvcBDIpiDepyLKqDNVudyG2RHsCMx3JBC3Ke/gyCSlOmr76qS
	65m+7V2SS3nvdZ122Q15eBYHOg0eAS3gjnEIUiHeiyofAFc0OSpwqtsg7YCV5/sOA7lM/Y2rKRj
	0rqSyT/M2EF3ChxHiSQCbWhnR0tTulHOxfKfL6tYTAd5daoVwjn+8P1fc9TsK6igFtp+idolYhj
	UCN/1jpbVOmMPScXOAJKjefID9oiL9URShZ+6EvLa3hfTMoWDvmLEWIdFPMA+83bRRtY243cydi
	dHXI/LSWIyWljxDuW6EeMg27E5CRpGVAOEdDB3SZ+aHPj3m3KSEQLslwUz5HyvW2RbEdudEJOKg
	9BbRJoVg6fXFNEh7wmb/TXv7CcVnMBvw79ngitQ==
X-Received: by 2002:a05:622a:2d2:b0:4ed:a2dc:9e51 with SMTP id d75a77b69052e-4f35f43ab71mr92918321cf.21.1766138908673;
        Fri, 19 Dec 2025 02:08:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGz6+WKg+YwIiNzLJ451ZJSOu/OTYaBgWs6+96xyhrnxrwNi9jy/UBoEDUkTvnuMA9bYoq31w==
X-Received: by 2002:a05:622a:2d2:b0:4ed:a2dc:9e51 with SMTP id d75a77b69052e-4f35f43ab71mr92917841cf.21.1766138908079;
        Fri, 19 Dec 2025 02:08:28 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a48:678b:dad2:b2eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm4209571f8f.27.2025.12.19.02.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:08:27 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:07:41 +0100
Subject: [PATCH v10 02/12] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-qcom-qce-cmd-descr-v10-2-ff7e4bf7dad4@oss.qualcomm.com>
References: <20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com>
In-Reply-To: <20251219-qcom-qce-cmd-descr-v10-0-ff7e4bf7dad4@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3724;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Cish+IZ6k1Kr37VBYYJJceEuRFx5HxqYDHdJLoUXgek=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpRSQOb7JCxb2znk7wfYadyLw5C5qwSHaSTqGkw
 scWaM7eeWKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUUkDgAKCRAFnS7L/zaE
 wxigEACO/BiPI5H9SUk7l3COIH8tDoPvMLrMkacXgtDoEIMSBbbc1i/uow7FEymqd1yGaoUEEps
 OMDTt9ckdjaddXCL5bJMdGIyMRIEsNRNpNO49UKik34nYhXVIBpRrimwgphvbjsuzup/iy6oWWk
 KjRjWHxTjFXwkOc9PjE7hhtIpyAD3wxfP3A2Kdvhk68thyhMDJBcYIOWa2w77aAyzrFmlYTIaAF
 eQEjsBTF2kXpI5PdgseGXw3XyFhLxSHGsvt7nr4obsUA7fwe5yMy3yqq3pc7qSIc47z3mN53zV1
 zrZZZQIlv1QGPkzMckoPvWhwZwxRGgomZqAyU273Y0CPz2LRGjGy50ViiwAf7c5JDqOhS0fMYHM
 36Jka4f8DQXhc+51uS6E1fYRgwJSVkiUMUI2PTZokoy+K/15b5PuN/OaLaPmakGPnKCxAox2OVg
 PXAJJDHNrZbbbcuWIRZ4EjRVVUh+dq1GFBc/KQ1ax5JcfEIST1edBMpKDiq9BjdOwTqnTpolYGA
 rD0f/wKILt3VdEmQ5aCBQb0P4Jt3D8j3olhIPIUQ+q8NeLTm6qtmoPOztP8FDWX4AvdZin7altq
 nM9Geg9NGYds3dZWIaqTUXgIeu9wVhrL4b/ZA+wL2dgA93T9vn/idn7PgE+3vEtzhJevIsh9YtG
 Bgmzk3N46I4+NGg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MyBTYWx0ZWRfX/VEj850pFvlJ
 HFTUB3lHByYaO/sB6Wln9gmGIp1eyphLCiLgyvpw7+tvgK8IrUrh+MytPxtiahZYvPoxCVyUAgi
 UxEtNf5EyUNNmbYPshWcXqt5ZxiO8NS8Szhq8Dn1Tik7RQTh5nk9rrPFrKWO/otLZTcQkmfAnLR
 zT0S4W6K+ovm018wAU6+QifmD1Gh2Yv8NQfI+RuR5jFm5XHly9r/QeUFj1f95mEX19PnpTIuErR
 q2rYTeWNTIXltmeZZnJ2d27pCPx+Jrj+XuqyKdBl5zVyyPwnc5kUODibkajMduYBxllrh9JKl65
 wDKo36GWM/Xs8gDvTxlZga59DMq7t7DdD3ruQ/qDGC0H3F+VLqJqEC8agcOBG60iYO3mhRoqb+m
 SrBTKgv2deU02brG3hXU8g36lc++FjebhFYX20N5puKYwEl+V1U1Iic87CX3w9soXSdikk37j59
 ZbwAoluVRvcImCC+jFg==
X-Authority-Analysis: v=2.4 cv=W+c1lBWk c=1 sm=1 tr=0 ts=6945241d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fb6uNmSZeVr-t7npd3wA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 2BTo2Ra4L_QRbI6Rdh2Hhdek9Q4zLEI_
X-Proofpoint-GUID: 2BTo2Ra4L_QRbI6Rdh2Hhdek9Q4zLEI_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1011 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512190083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_020830_643855_123028D1 
X-CRM114-Status: GOOD (  19.57  )
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
index bcd8de9a9a12621a36b49c31bff96f474468be06..6f78e6b1674a0ff3deef4c3d1892a978555b3807 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -112,6 +112,10 @@ struct reg_offset_data {
 	unsigned int pipe_mult, evnt_mult, ee_mult;
 };
 
+struct bam_device_data {
+	const struct reg_offset_data *reg_info;
+};
+
 static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_CTRL]		= { 0x0F80, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0F84, 0x00, 0x00, 0x00 },
@@ -141,6 +145,10 @@ static const struct reg_offset_data bam_v1_3_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1020, 0x00, 0x40, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_3_data = {
+	.reg_info = bam_v1_3_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_CTRL]		= { 0x0000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x0004, 0x00, 0x00, 0x00 },
@@ -170,6 +178,10 @@ static const struct reg_offset_data bam_v1_4_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x1820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_4_data = {
+	.reg_info = bam_v1_4_reg_info,
+};
+
 static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_CTRL]		= { 0x00000, 0x00, 0x00, 0x00 },
 	[BAM_REVISION]		= { 0x01000, 0x00, 0x00, 0x00 },
@@ -199,6 +211,10 @@ static const struct reg_offset_data bam_v1_7_reg_info[] = {
 	[BAM_P_FIFO_SIZES]	= { 0x13820, 0x00, 0x1000, 0x00 },
 };
 
+static const struct bam_device_data bam_v1_7_data = {
+	.reg_info = bam_v1_7_reg_info,
+};
+
 /* BAM CTRL */
 #define BAM_SW_RST			BIT(0)
 #define BAM_EN				BIT(1)
@@ -392,7 +408,7 @@ struct bam_device {
 	bool powered_remotely;
 	u32 active_channels;
 
-	const struct reg_offset_data *layout;
+	const struct bam_device_data *dev_data;
 
 	struct clk *bamclk;
 	int irq;
@@ -410,7 +426,7 @@ struct bam_device {
 static inline void __iomem *bam_addr(struct bam_device *bdev, u32 pipe,
 		enum bam_reg reg)
 {
-	const struct reg_offset_data r = bdev->layout[reg];
+	const struct reg_offset_data r = bdev->dev_data->reg_info[reg];
 
 	return bdev->regs + r.base_offset +
 		r.pipe_mult * pipe +
@@ -1211,9 +1227,9 @@ static void bam_channel_init(struct bam_device *bdev, struct bam_chan *bchan,
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
 
@@ -1237,7 +1253,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	bdev->layout = match->data;
+	bdev->dev_data = match->data;
 
 	bdev->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(bdev->regs))

-- 
2.47.3


