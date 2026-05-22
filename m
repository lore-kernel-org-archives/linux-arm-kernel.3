Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D5FCD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBHLofPVeYPfx1ZGHrhJ7CLmG7Qg01nr7l3iawgtmCw=; b=3Q2JHFRYkrNN8MI1vIjEEDlHwp
	p+++cyjEN07arkmUNQyxfgRFe2tmfi8rfo0nkuNaSnIOpzGGGHklNuokzaI+iDRrVFPjQeN9dIiW2
	kUI7UbJlpEeseHtWxI8Ej6gRC6xL6uqoTIK8meNLC3uo356u/RaoVNXFuL2D2aFcHD991k3lJOmkk
	1wSwVirO8WFVrpdq0O4zAb4ppCmctby2l3pvANZTTBDxN9P7rKhvkIMuvsQUn97XJVVrBBZx2e9g3
	9cVHa+IuhnPqsrlyajn5QkUuAoRxat7QhkJ03qKsqYrzBzOGLrzbmYFYEtxgeokyZ0Y0LL4xQ+NLR
	Fsdv1Q0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ75-0000000B0gU-04g6;
	Fri, 22 May 2026 13:40:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ72-0000000B0e2-178k
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:40:29 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9vQgV312987
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vBHLofPVeYPfx1ZGHrhJ7CLmG7Qg01nr7l3iawgtmCw=; b=XP5ZBn20ASOiH0ME
	BjwJ6Td9XM9NGXPdlbLJqZmUz10jT+cxRJ/Gvb/h5g8hKlPAmQoiYVegIGVsEcee
	49HSSa6QDqjWQUX6GhoryHGfxx3werjTtSxAByMfN7xRmyQHJwuI7qbJFwCOqQZQ
	yxOiBgYXqDPeISz5VdEqCM49zAF5umnG8F5JdffOJpaNU7zUKbcdK2DRb0RBwI/V
	nVnO+kPFgaIWXweK9n4YUR5xXA+wMYOvwvAntuk4QdFHx/i3HkKEB8DQkGAUtWra
	eRS6kRjvRDU6pgnX0P275FQSSLYa4t7rC93FvFQ8AuvCSfAUUdHEycIHOiZdZ0HJ
	mbz07Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea883411v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:40:27 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8badccc9194so160086186d6.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779457227; x=1780062027; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vBHLofPVeYPfx1ZGHrhJ7CLmG7Qg01nr7l3iawgtmCw=;
        b=UJU/hPRkYJejZk9OzjEVsJ4N0z87WybX5GgjzVRkR2NwM91GTCtXLkH8dxM5xbOu6I
         HlUB5LOt0VH4S4AkGxKomXlEouRbBBHZBxB8XzD/91PGIZ0EzocInZWzSqXr7s5SRC39
         +lEf2w80lyZRXMWkPoKv7RIdRKvS5B9B9xjGqzAI/n2rC17WYfFfypymwn6HeXrkFsBP
         zxkwKB71wn8e9kGsMX++TofpMHX1DVnD7QLlwGwg5ZdJLS36YBSG5sDoOaDwsP7EAhLw
         UPROhAD6N2QVp2TF9jKK0KcMj/jcJNnb1cU3xGmQgB8i8BLd5pT7gfJNMU0N5mxZNfFN
         Pnog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457227; x=1780062027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vBHLofPVeYPfx1ZGHrhJ7CLmG7Qg01nr7l3iawgtmCw=;
        b=FuKQEqXsl+4Y6sbwHo6n+R8d2U77Bd2y2B2N9MVKg+U5ljUnyE/mVzzOumb4L7xeBA
         DoDncrBSNG4ASOia/4EoR0NLy5IrXdyi2L4Ur4SlLexKHaF9aP9eUw05fD26whvgTAJH
         poqueBF1E900KMwfix87QtOrqKJiZKgKQL/qP1AVjKhH3H4+BS80chZfw4zsfTotiWeD
         6Gk5b/95/KDtlKTADaVO4QEAO6aFh9j7ObalftznWBi21uqjFSbksXrpdqCRvDpbi+dP
         LWDxGgypFwL1uBDw502ZTlqvNaUgML28HoycmHd+jJDgjR+H6+GcTvCAV7DTfLATKh+6
         NH3g==
X-Forwarded-Encrypted: i=1; AFNElJ+AtX8kWp+INmTkdaEnyeNIq/kKqlGuCX4xO7jXNY+VO59Jt2vKmJ+dzva9m9VHxX0UONs255Et4Gam6mAUbO15@lists.infradead.org
X-Gm-Message-State: AOJu0YzahOU29Ie9OG1vsJf+YqwPbrgQGW9Gd2ClNEQv3bINaXvygwQb
	qJ86bLaFEyrk9Qcs1/pxdoogRU5gA1C7ffjSprCFWvr+BAr0BKN3w6Y0ToXMCLl16XNxfnvg0Ar
	91OdRyMSOG0/B9EueuCb39terRlVCEIGMlltIKUtEyp9wpjBnqkMQh/iO7N/u0A8IPoiAUt15oW
	UGbg==
X-Gm-Gg: Acq92OGQq6s5MOQj/Fmhog867vlN4Ub6uUIu3/h8msESnN0cXJzMQIXHjPVwq57WlYT
	5KA4ZLp5WeDTSLxNbK0Akh6DkoH5tNTaESjgvyMqDgmqS3bnrxgT2WK4Cra6O4fFrSFjhA/n51R
	YkvDjMK4lESQroA9ZSUkg3DsuPb8sTXp7iP1VXAuw8xZ859Oh5v+ie3tyFnVpdn+l5PjMxy01OE
	cUJQ4TbJF3aUz28GLxE6jUFpihB+kdOgRKkfXkBvdRP0JL0nvRr/xYxCmWUla9lJUg5KZZq0Jvv
	Ly0ssrwGPfCJv5Cz/8xUhhlpi8avG9sFeKo9q/DEeostdejKuBav2Ifk+Go+DkC1Pgu8sUzxCwC
	5gh7CQmA9MEFyvMk8mwlo9+Z0lyhK5kMUzHzPMrp5wEqBw5RJNQ==
X-Received: by 2002:a05:622a:4892:b0:50b:6b21:2bf7 with SMTP id d75a77b69052e-516d419e624mr52230681cf.0.1779457226640;
        Fri, 22 May 2026 06:40:26 -0700 (PDT)
X-Received: by 2002:a05:622a:4892:b0:50b:6b21:2bf7 with SMTP id d75a77b69052e-516d419e624mr52230111cf.0.1779457226126;
        Fri, 22 May 2026 06:40:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c600esm44912825e9.3.2026.05.22.06.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:40:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:39:57 +0200
Subject: [PATCH v18 04/14] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-qcom-qce-cmd-descr-v18-4-99103926bafc@oss.qualcomm.com>
References: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
In-Reply-To: <20260522-qcom-qce-cmd-descr-v18-0-99103926bafc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3778;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uxRjFVxEhrXgn9P1PbRyStGi6yK9KFcQvfp9JiG64Wo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqEFy1F3/f2c2itAh9Qaq8Q6W2ocaop66yQq4N5
 rk20Afw3+6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahBctQAKCRAFnS7L/zaE
 w0NvD/9g1BWT4Z86O5Ed0CczEU9qQkYOEi0OeK8LwPNkKRZ1jkeHLQQ/NJX5vmz29RA7xzAHJ80
 RBMCF3OtHxg+mn2UiH2QjgmvTdHLG/KtxJ85gFJeYO9ZPn2AL3lNpkl4nYoO1xPHsRyvWr60KNf
 cnJF4diDlxPjNEKj5WovaQz+hIrttw99F3iNUOg0FbQxNskhP5mDSkcLvGGOx0KflMtkjXWVh3I
 jv0QiC6bjn9DIIMk4bdbjOCYyDxnsrrBnHVNFeHPGSYAotWOOS1a8DJqUAi5NSYf68CLn2JNOoX
 /Tq1qh1vdiCTlqQCGWB0nnINUPdNelgQGHhEdRSMBTGQph3Eqqkgk5GQfuvPjLKkmHuKzjmHMJF
 WPmTZzehASqp2/ME9sP10t7LvhmVRqECK0EX9EHCsoNFZ9E5jpcgwSujHoMBjmCsfNS12L06eEX
 hhSdMt9fo0Tj36FjfaupkLVE/kZMZQesr7Jqb8x0hVFgM3BHg8OZfVRZC7kZDwIL7mxvwtMlGW8
 1BSzBJlqTzkmLaEFxD3DSLWFXwdczo8/KcxB/5jB0wouOI/uVDVtTknys4axBWTsn6LWqUXRWI3
 Y9rb6wb3jkmpKiq2YuGphX95fFfI5FhBwX44u2Y3gOrrxQdKchF/uDkUInMtaKyKjr5GU8uVuKQ
 9/g4sFC6zEBYIVQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNiBTYWx0ZWRfX9FQgi6kewN7m
 vkL/iClFr+L4IBStuLTiPb77ga9fkIxA2Yli7zytlIcTGMabGB2XzN5TZvlrXcil2h3UyyoMLg4
 Qd0qf5GGxruJabzSkRNHipNH1juE2yHtD8hnE+6i+7kh0CUgUmCJ8HFmpJiUOh7Jzgv/PV4gGMz
 lQYNynbs8ZKQDendmf8wLK7srVNg2+NM6BKdZsoigZPNdqIRjRlmz7CfMT9gSsKGlOZH3grU0Lj
 8an303XeSuYmxZdav5nD/Cg/LMPh7XvtCPdNNxkMqaIEtCQ8Rea5jBQp7QcaYN2aXp9TsgIZ/gT
 Xf23yr47gdZTfy2QZcxKZz8JHf1s0xlB1iYXo7mAdA31gbshPVAZvDl7HUOqxNvoKH4ggUgFrc+
 5efuL73/Url9WcbMZzePxCXfpJIx9oi7X46ONNVSCPXr2gAlSU6h8WtUxCxmgSLj5maIZJPUXIg
 ffBXKW4/B+eIc9Jvg8g==
X-Proofpoint-GUID: IhwxOTRg1TuGyWt0444cP2bHbKK3ag09
X-Proofpoint-ORIG-GUID: IhwxOTRg1TuGyWt0444cP2bHbKK3ag09
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=6a105ccb cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fb6uNmSZeVr-t7npd3wA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_064028_433338_39F8E785 
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
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 1c62f845ac0b956e311857b93f5b504086662f45..2129ff5261571581a2c086c13dd657dc63e16f90 100644
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


