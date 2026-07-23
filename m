Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82279C531CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 17:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=; b=MP/M2W8c5OvcJV5zh+TxkRfd7F
	kTr6ecGz1TN3H8O67PLc/wwpmvY3Yfk/4wC8L8JNN4Lf6ZBMAOZBF2L1nLifZYNdpEQdudhxa/AbT
	qxa/I1cR0mHGTvW8j8t3oXNJQWtVgdNos8fEvCGACEUIw+JqD1ifF+YIW/7LJ0dvHUI1R6aIcWhVa
	xKwItmSPLWO6EN9LN5zkROgi1lnW/x1hvLsW9mRsA3B02Ham8D4PWtCL0qeCSViHmdDQR4AzP7jux
	AW8a4dNHnGTAzQHRXhzkaxTlg4f8KHHT/h+CkyONfC6ZZeW+YOdch/RZxNTJSCc7NJ+U6lfOXZHDu
	f8h8BzRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwvx-0000000Em7t-3460;
	Thu, 23 Jul 2026 17:10:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwvb-0000000ElwT-0vem
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 17:09:48 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvgqW020907
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=; b=M3Cyl69cXgWU+3dl
	7bZAy7BvT8ATtm3EmclgD+SEr2bQw8cSOVLhtaJhn7ZSSkX73hw1dOnFW1crM8v6
	HSzMrM0ZOVdDwOA1cewEqzMubBtGJ5VRXHFeQ4XWK9udOO+vobgj1+UwA0d8zRX8
	1XpLlV4R0vPns/pv2z0LPcGynJHMdUfXSvbkET7ky71A0qo517tubAsyBzPKsx9P
	Sb0EnIocFF2dkj/BeCWNvyqWaTm+zMzBtff/RLNuFwF0f1KY5mU30UwfLLKcHR0g
	mdoIqiKel7XyGsl0UJ49GBj+W8wcvMICOwvW3jHmjT4DP3DrrRZlv9zsUUsMUZeE
	3rRtLA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7mbdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:09:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c075c1e25so13466421cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 10:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826586; x=1785431386; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=;
        b=SRwpRyOHt7TYB9RE7100Om+1y1Otj32fg2mLwB+4LamHm+xgCkTUXJSKOY+gf/iCkT
         t8WX/yBz66MgFl0COZamwTbnk/9lJXyScsd3Z2/DsG1ISk3yjjdtlTNRxiBkZ8CoJAWx
         cFZfLHYFJqFohoban4c8cHalFb2ofMkcogXUSJ2a17dr4F4Ckhyepg+2hW7E9kt9M59f
         muWeh+lG5iLTMdchfJKf+LyVkVfRYv36gxE/pnp+m1oNt7mlJamCcxBI338G10ApOc0K
         iBZhZUkugPLOKg7g3vTiNCwUO1+iZBalZuGswEfH2X59TKUnGuiHF3Jw65TpRZEj0j9m
         YXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826586; x=1785431386;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1SQ6fBG0Ah0G+Ee6NE98a2a6c+tVDqglySr17bUd1/A=;
        b=CCFhhUS3yTUCMcCEkaPVz9S59+F1hiEa7xmwXliF95y8/7cIJtiIkvPCfbQarTPRtO
         c7PyDlkWv0k+Jo959Dq/R+XfAwFUfg6MEX8CYBLiWW5TU+szHgcvAeBNSP+VXCbsrXQc
         zREdTmzUP5ddV3Ue7hdhxC9F9ZPXm/Hk7uN6Psd8im9rkMmlsWk0G4B45Il+2QR0iPhG
         NpxkHeJ3g1BnzBDWW8MFVkg7rHYbIE5C3aVGQlajM7LqH2ICR6ylJne7VP+sGwoFBCNm
         s0pzVuS4hK4jqFxXuWmxk/lXE5TcILRfhO03EzpEyc/4q2jXxDLO9U7MkdC8m6rM98Aw
         w8jg==
X-Forwarded-Encrypted: i=1; AHgh+RpRNHcVDl0QU0zyp2T2P6zuFFZGaP/8aaVCYL2MbqmmNk++XMWrcZ+YniAVdnpRTTCuBbDEcSoC0JnAovF1ENpM@lists.infradead.org
X-Gm-Message-State: AOJu0YwpgLLVuFtXTyZ0r/PTrwEAXhGN1qGMe6tFNuhM4eamEn/9iYCw
	air1mUVNCJlQUcBRqciEUUGjCINbUh1lMIXykoXIez4t3xMXeo0MaLcfzZEhNHQgRNRvGp5+Vi7
	te17+Y/4J+KWPfD43pCqF1twizyy+sHgfjCqYSoXvoUya+Ztl4+nISBiRc0ZygKcKM5jG8K6gnF
	47XQ==
X-Gm-Gg: AR+sD125C1W8LOFB8nOOI3TSkGUllzpH7QMHb1gtXT4xWp6vhqlQbMHM2s9+Czt7IZ7
	MotXDs7uWwAm+pvf0+5xZ1ZVs5/FwOvgjsFG8B5BhsLf25Jpyf+y1cP/7rhIbYd0c+maGjlZSd3
	rl//Ym31Z66hTVEoFIpbbg8BaMBR4pnEpkKzneZIbUhW2gZkzVpGy152BPXWPVw5jc2mG9f4ZXF
	wtYO2WWjYcW7qZiM/SgO6zTauvzW00HBVtJlnQMxbc/hVNWEiuxkJ1UYt4KO5s71BWTwM7RGT1M
	Eyc9cstbRe58yieTvPPPvP1tPtPFbFTV1Cm+pGvM6w6TJ+s9k5hazWZ3gXM2BN/y+Grn5/ot/0R
	aCR1oa6XwqdPFk6fPyL2Wp/oY+lb/
X-Received: by 2002:ac8:580d:0:b0:51a:f94e:ce51 with SMTP id d75a77b69052e-5283ded5b72mr32348691cf.50.1784826585692;
        Thu, 23 Jul 2026 10:09:45 -0700 (PDT)
X-Received: by 2002:ac8:580d:0:b0:51a:f94e:ce51 with SMTP id d75a77b69052e-5283ded5b72mr32348161cf.50.1784826584952;
        Thu, 23 Jul 2026 10:09:44 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:09:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:09:10 +0200
Subject: [PATCH v24 04/14] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcom-qce-cmd-descr-v24-4-4f87bb4d9938@oss.qualcomm.com>
References: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
In-Reply-To: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
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
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>,
        Andy Gross <agross@codeaurora.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4322;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=HGeQqzQf8+DrUa/4bzOvLohFWS/bDVC1MPHUwVaBFAE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqYkrCvDnscYF5kUf6Mp/2eDen/yDbwikQKtft1
 KTtqtdDMMiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamJKwgAKCRAFnS7L/zaE
 w6OuD/4zPA74drmfeqhUyo1KEaxXhhhdfBx0+mCETQAaXZVxinzUTtMU+cYKtozIiJYUIMZKNyB
 1ZsCFc/FE+fv1NUvXZ9a4yxkzuvG0Ec//565pchVrOHrPbjOs0yiM3JpMYVVumzriF2lREehVEj
 Ia7f91E5ODhFX6Yccp2hApR/40AM27icIGK9J+2fbozO4SyXtiVPv9aV5sUtVYLfm5tEjvz4Ghc
 yxvd5wJnqscNrNy02SUj4U1doUnv798meLMxu+uHqa/ai9BB70qToYFzK8dlMiLdn8GgDD5KlPA
 8HCHp1pmWtZZjXrVTtYxOvJzUNyeH7aDieBtPxWhUzbwX518OFObCqa2lLcdQSbWDVPUbhsNZUI
 1M9SBkpgVDrCeKWEcMU8baGVJhZq4wTjR11ZveOQZSueF8lwVvJkTqDjlURRM8gxdqaraZFHhQ0
 IA8QA+VGg0Pge0nSFjOaOCrjGwnP4r/ueMLWWXj2oB4Qh4xRtCtDJJhcceohh0Ntz8QerbEIKfw
 0ebYD7qKfqPMJMrvf2Vy9b6xfTY7ScWG/523eJsfdpDYYQB5tMVMFTBBc/CbIA54zGmq760eEoQ
 lywH38YJ2y34AkORmBVzyQQup/qNHWjGED4lBcETXH3GG9ycdgNS8E1y6j0bB34yCPvGQ5DuuMU
 sgMmdCddSoiSchQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: si9CVpvH4WjlTEKz9gu8XkxPiUGUYakV
X-Proofpoint-ORIG-GUID: si9CVpvH4WjlTEKz9gu8XkxPiUGUYakV
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a624ada cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ioP1PY9e4_dTeLeN8ycA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfXwG78qesGjbBv
 7l+Fb7vxNLYm/vepimAYjXHUQx5gw9bnfYIV+2+BW6h/omESWhKBoAYCuGcteHOPJKozAim8a9z
 ss53Mfv6C8xYf1C32xeCEVuxwP/wOmw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX7ty0UEX6q73N
 DhR8UFSqhC5rUg5yqhxU6HARx13xB1A33PSzyGmsrnsDXAnKbPBVpz0xpynNQcBvu/2Dxyyxysw
 m7gw/Y3RalFqLtASRaBdq+SiFg8k+DvDywp8eZTepdULFGeHkcWW1flD1q5/5iJl8TUuMlAv4La
 7fJQBbh6h6gzkzKki5QJVt+LmJ+lSXu+cxh/ckHU2pN8fIeNaRgtMS/083gL5a+0GSfmEbq7dYK
 lzIsGFA8R+nvUy0ETO0Nn2K8aFfn9Z2xLeSjGAV8bZJYWyCAk1W+Do4t7AuZ/1yEWPBkOnLF3C9
 5MG1F/Fw09hpNbxPUAiwP4Iz1lUz4a8X3E0rCGUAwBPXmlD1sCSyqErrBOcSry6fqBE9+mW2M/x
 ofHxqzdMrkBKAIp3LwFIaBMgcSxu89FsHb0rBwaWTB8kiJWXwdJARAS7DhBhokWBptBdzYyP2AQ
 IRgq6Fhu7Gx/oGo5AbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_100947_301710_F109F96A 
X-CRM114-Status: GOOD (  19.30  )
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


