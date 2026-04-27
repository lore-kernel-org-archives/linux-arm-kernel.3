Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A81FF8862
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 09:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=byBhms6klEiQKAIzzwk/0xHdksfuhIUeiAfPpFlaRio=; b=4/eT9dSfMRePJp58Bm+x2RprrL
	yuxWelMwx/VxEVux4GvM4MWA73bAvnaoVYR+feYAeYuyoyX40q1HXG07lXlMt5FWVMJoSMWYjII+l
	tifoeV9KFUwXfOxpFKCHjBevc7g8VS3cuIWOi4rBaTJf6y1/jvRzGKIhyDgZtEhUzOg4YapDxqYdV
	Qme0Oo5RFDXPLwGLO9k94b0Y32PoZbOOy0g87zJkea9RkHWxv5ZieYEDLZSRCFEFZICyrEPqPYUZr
	mvmAbox9cZA16haxfHWY3KlbY/G4Be47KnXqVXVAToKAouAcxryjbpP8IKLo3blreUnT2VBW0obZj
	IIDPJ3ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHI4X-0000000GYc8-19A2;
	Mon, 27 Apr 2026 09:16:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHI4S-0000000GYZC-09dt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 09:16:05 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TMJG3682002
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 09:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	byBhms6klEiQKAIzzwk/0xHdksfuhIUeiAfPpFlaRio=; b=MXiCAtXYIh25F8oq
	fLYcQ9uqAr1YddX4F9BsHVa5lqv6FMBcn3mGhtm37bVAKnRE7ZHI3a3Rp5NhIP7m
	ker7XrzEDOYu+Zq4OwYUzceyG3uLhN83POnqhFb/rroGYM3/+iIBV79NcgyPQGe3
	BuZF9f/Cpoa2QJF6NkAMB5YlD9CR6KHpMLVKDIzMIv/g6b0hPXjLRt7MQLhAl1L0
	cwoc1kopn8QyGOZvJo74vqnBzph4P5Ni/OxVvIP/5BhJFHF5Bmbcw7j5gc9bFcZx
	C2Lp2Rg2w/UwJNv0p+WNQxbOg3w6isVkBa8fo9LH0BtYMK6+rwOv0m+bJsdkpNNf
	pGMNyw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpsgwacj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 09:16:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50f817c3240so95918241cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 02:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777281362; x=1777886162; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byBhms6klEiQKAIzzwk/0xHdksfuhIUeiAfPpFlaRio=;
        b=NJbjMcH74634rbQQCy+pRduYUaSNOp14HsGclGZGI+bnNXVHpIInZQKS8EWdbMMCDs
         UVtMNTCqVdSKACdObbzbPhY02RD3nPwUtB/6UlviG+Hcv4UuI4PpgfpRkSysRFTSJle5
         iK/SzQbSc91wyN+VEx4cHmyyvb+5BaSzwMX+lMqhA3W540T1vyCaBCpB+ZBjhD12Zvza
         I3C2Gi0u7nGHC1FwG5oBSWmeVicvkMs7bxn0I53IUeUkd8G2a4TIyrAJK2xvriQuNSnF
         jxEZNB2jNJKlPPqyAd2QygnhKOgpAcprrhL3HEB5ustvBSzAXCQO8rY6RMBaJNul1ld3
         RdlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777281362; x=1777886162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=byBhms6klEiQKAIzzwk/0xHdksfuhIUeiAfPpFlaRio=;
        b=XR4jMP7eXAg4UyfViaxiu+/zQkk7YeuX1ABM0K+skzrUtIXRJE7bKgOSQXVfkESgPw
         E3uDUlMN1HOd+YNtRRbt9TUSMzR5KUXryPqrLktfy8DsVzlr/vD7pB2UhbmORW+4+fKY
         RAz+IsHJxwWgGRAMoHHoq2M/l2AGKt7Ey62EdHMHR645JNUk3uUiHk73V1A5U80jvUJD
         fk+3nMZ+r/xQhbfeFdUwZI4M/uJa7Dn7/aAzWt0FSh5fwzwEnk/ryKPRjbeRtXPc05u4
         i/gnr8YD7rbJwTH9/Bj1KthQcatCPAThs2HQWZL5rS/IFHkWGWMQzGSXgrNseEIr7DES
         ZiiQ==
X-Forwarded-Encrypted: i=1; AFNElJ/VdCtkZrPAa1QgvalJXIF2BPPPNv2s/hrZLOtzk0dke3kcUfTksF43BefhaKnBWQN3/G48UcCyBvaT/qXERzPy@lists.infradead.org
X-Gm-Message-State: AOJu0YwJDtsIR5wXbl4UVcy1F/ubZ1cC6RrlPlR2+3/D4mqikEW54hTF
	/xc+nRDD3c4/ujLbBO2KeRFFBTbSPFHkPirMW0XyXzbEVa2IZH69Kxbr84KepiWVRy2eUxrGo4Q
	BC4KJ2T2mnKQSCa8zmDpID/j2YEc80X8MShjgQFJEQFSQUGqFjJeTR6AtkIqf6TJyBC+tGCNi2Q
	B1uw==
X-Gm-Gg: AeBDieu4cvDhQSY9KsCuC5/72OIY7d3LVVrZmRUeuSBpVFgPfdhQr8GAj1ol+4v8Wwr
	QM+D4mONhmi3OJ2gsuE80IQL426l93VnI1IJR/miuUJdGopo+mf/u4sPzByvMuGkWY+I6AHROqs
	h1ZUgsiyN0FWGSbIX9tW6xsjZyAOYhRjRMR1eizHfw74bZanZlT6i7B6BoLoBsVzpt1m+mg8rwp
	4BeLidn/i8flPmZSKiRe9uXftRtdEIxiYTgFWpgKIlJ/fhWC0pjn2jytLIKrDMXQKY4yD/9nz7E
	IQepan3/0sDYQHJC+hEORUZ2aH9ZqjAM47C2FJNR6N3raVyxKkP9R/BwBB8hy7NndA6/8TYXaFK
	QLcwGCgNb0I+y03CxOv8+OOzsNAJU6PRMKleGZSTCpUyB/iZtHjNdL7AMqyd2mg==
X-Received: by 2002:a05:622a:59cf:b0:50d:a8f5:1bf8 with SMTP id d75a77b69052e-50e36bd6471mr637069591cf.37.1777281362526;
        Mon, 27 Apr 2026 02:16:02 -0700 (PDT)
X-Received: by 2002:a05:622a:59cf:b0:50d:a8f5:1bf8 with SMTP id d75a77b69052e-50e36bd6471mr637069111cf.37.1777281362085;
        Mon, 27 Apr 2026 02:16:02 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6dbfd4b5sm40559365e9.28.2026.04.27.02.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:16:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 11:15:36 +0200
Subject: [PATCH v16 03/12] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-qcom-qce-cmd-descr-v16-3-945fd1cafbbc@oss.qualcomm.com>
References: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
In-Reply-To: <20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7yk/qdP472cAnD1YdG6nh/mfOZWhEURamNMSd
 ohy99DpbUCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae8pPwAKCRAFnS7L/zaE
 w60ZD/0aQM2Z7oeH6HyvFKh+qma6g45ChXODJ9GLQ6AbSmbXYsTzNb+FHtmvDbKIwv628ykuvuw
 iyOipbZgjQCsKOXpUaFXugtqHkElVvEAKXP5XZVjaRx3ndOzzGHBGnzM7I1jiQKPcaQ2hWPa96V
 Zgu9hQoge59ZvTMXOLqalfnHXlLJKb8R9GzfgPjTF978BaWW6zWqrqsyncKSbuix27/5AyMPEBL
 nEns9MATzLag+JLyq9D0K7Gvv12teu+KaQfp6L2hVY3leuWsskMHCQWhh2crIrf9QfvSo0dZ+WY
 pY9kge4GzvbPDW9rbcSNBVrvLNN+AQTXToK7yMUBlNp5yPoe1dTNRYZZx+h8z4VUGvVTr7puki+
 VQu1k00rK3Sm1HNcLvHN510KnRNBJFP7pE7PoSZDZm/5BSIK8ZjIConBLi2z4uW/2UIQLD0XJ/I
 vpIymXU0XCrPuoBlF/t9o0uUzgBDO/9eDpFZbw30XUO5vukDlRP7n8lZWoK8s+HxFuh4RUmjdxA
 VOymMqR2SBzV0E1aRVnWXaKkuGjvZbzHp09PSuRTXDUrmOFlthtRVdpekZrdVdv26cyazXPAZZg
 naR3OpL8WbLlNJZkXfYXJ4FjVx6VA2+87axPS0Ax20txyY5mYrjnxy+fbfnPip3hxkOjHtl964P
 PA7bhbhP9hZ0L2A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: uEDrfR-bYOSUHGBarBzfhqLSqQuN0B7S
X-Proofpoint-ORIG-GUID: uEDrfR-bYOSUHGBarBzfhqLSqQuN0B7S
X-Authority-Analysis: v=2.4 cv=Y+fIdBeN c=1 sm=1 tr=0 ts=69ef2953 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fb6uNmSZeVr-t7npd3wA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA5OCBTYWx0ZWRfX9opzNpyhjPrX
 6f5fuWCdsuJ2QTA1yTXoZgrGrrHm9k+frFmUon95AzVcs93ROmfVvYLiGggwkv80MEZMN52YLIz
 G5Oy/F3AtoIlgYphtvU7BQlADqHnfKgZcLVmXpdwh22l/eMZBAwuDw0UpH8p8l1t2ncuC0pVZaG
 ZM0WtxZjcEx6X4ataB2iDiFU1Mp3hNFUZHlLTpdY4KmFr5qmVTIYtQUwTyW4187bxi1lyFmjljt
 jM1ZePWi7vNkc8HRDLHYlRPz7C98aYvaM+FD18aIw4GeDo3jmjPedGrjZSasJcN8gK4pvjLXYF9
 1oiIxY7kv77LUR4y8CCPtktSQcZdqdgzYUpZT9Q993RVojuEm2aHPvH7iAsQJjgFmXlPlHuwhJd
 grfU0sPlDhflLfeqQriV1pOCqTqIl3Dsdyu79dbP3R5Itxle1EqcBEbGWVYvy6IH5AA1xumopB6
 ZPNZm/chgi8QSVsz0Xg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_021604_092441_C3FC5300 
X-CRM114-Status: GOOD (  18.93  )
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


