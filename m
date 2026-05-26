Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5D5CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 13:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vBHLofPVeYPfx1ZGHrhJ7CLmG7Qg01nr7l3iawgtmCw=; b=UMdlIlEvlAgsoeD648lM2cbQzn
	ppT8NwX7Bl6xSxdkY+lrwpY2VSUWJdxeqndzhSToi11CyGqF2m/org7KHQm1d+KUp53wpxVrueYgx
	+A1KjkYmL+/JhOCk4LsU/GxeOg5D29EUyLCVnMEqWl3EGUfT5ZBRZcGlFrxByu0tpmSgiEnTdBdX/
	4B6tZqoJICh57gbdvkzmM4HTsJFtaEC99s6cOh+zSX6BD4eChDhZTdAXNrH5IUEI28ra9LutnkcXL
	qzS3QRPiSeygvSnhTQPsGkcDeLFv3EjZBx+qcpO+cOAbom4SsPqTX5nHgMADKqMvTSaQES0/6fQHG
	yGPfmGMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrZJ-000000020uz-2SyB;
	Tue, 26 May 2026 13:11:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrZA-000000020qW-40MK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 13:11:30 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsiRi3797184
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:11:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vBHLofPVeYPfx1ZGHrhJ7CLmG7Qg01nr7l3iawgtmCw=; b=oUThSWJX0k+LUVnG
	Aeh4v1t1v+5z6edxnBkd5OiNBDuYJZ4F92akANGhGklEtPs21l5JjZZB4oYVymbC
	BdyC/PW5q5sZ79TUk9x2ACWhl9MuzRE19zfP1KHvLB9cZem8/pSOeHmlNt7Kcvcs
	ME5Wb7UvS4OGF+HB9qFIlG7W90xvcZOaJFYg4ucPpN7f1EP0KQRdjhD467BB5Eh0
	gh5rIgrXjdY0eFSzpS16CST1r56k7Tk+MXwihasnMdo7qX6Xj34VJnIfKHsTf5ek
	gZFnb6kkseJySR81w+K0LSbavZo+o6SFnwa+AeF82tfPQe9jLXHAn1t4H8jtRRu4
	ZzZCDQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecpy2mg8f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 13:11:28 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-63146b7289bso23012126137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 06:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779801087; x=1780405887; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vBHLofPVeYPfx1ZGHrhJ7CLmG7Qg01nr7l3iawgtmCw=;
        b=WL+j6lkRCl9nl5oIjcitdwcE6eWXBSieuHsmaT7s5guGlYdLCfDTMK/IdzaHSKMRxt
         aWjzUrPhKc5lwNxHz5H2LPIn8sDiTj9My7CTjBR7DUHuF2ONsE54TGaTIkg8IGUSXy5A
         ov1sjvS4yhv6DMd3eOKYHTWPlkQTVmoh6See1VNcPDwMZrndeFSI8eRABV4nPIBdgw0b
         5zU8hw4RlLKfqUkFKh7jNhtrpRDWICtXPkURCGuELUQNbbMDPWKQ0db/JUwmF3fZGxLp
         0odPY78ebtH4AyvdyQiAEW7u/0WP5IyZ5w1lkO2upQQLJcT5ODrclDANfl0zHRgtw1kV
         0TQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779801087; x=1780405887;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vBHLofPVeYPfx1ZGHrhJ7CLmG7Qg01nr7l3iawgtmCw=;
        b=WQ8eKR6miDGcnKuL3TA2ZEg5v8k4Nin/vkDMc4kDcLOUsPBlCcRcv35tCCPJaYxhUx
         6Xu/bDo401ovFNhsQvPIbd3Qxu/LfplRWhLgi7F1eyPEuI3xD3w2HUSNcgOicy5SQlHS
         m1yBjKxET4QOJW+p1bwLuWKedoXuYBpRjlSdg549m5nz6mdJuhzymHEQ3XwCk4O//lye
         1ggnb0NkeS7+RvRYUrA7IM78FPWMH+f2MzUPuaMaAiB3Hq8zW2a4HJvpGfCTPqIUx1cx
         99bRba95CGXhnxg8qf3ZFhiWYs8kgnO5QfvNOqhBe0A18BV8Nfj0DjUKzxWBW8VAhHcX
         iHpg==
X-Forwarded-Encrypted: i=1; AFNElJ/7Kyut8BffdLVV60v0qgZu7mDAP9C/w+5SjvxS6TPj/Ox8rmHUv9lVwMRxj8DS2lAVWlTcvOGlXyLTkeW+G8H3@lists.infradead.org
X-Gm-Message-State: AOJu0YzSnnQo4Ev5ZSsLFjfLlksy0ZBRgk6WEYOz3eTJPai0Tr5iFq2S
	Zq8Ud3nbPRS13pyIgcCSo5EhDCbg9vq/sVkogoqbHlqyiHJqbrHM9Z5bPdQtds9vrPD/Ohh4CRm
	8pmrkecWJcGpNxYnvvH9JeMJ4pWuvXykkUA9h4EDr3R2vooQK+9bwj81YZ3ODA4eDychQJOdihC
	WSRg==
X-Gm-Gg: Acq92OEOFRggyYNXwdC6BpHV+8tPzjidZ6DFzEDEKahpz1KIa1moU2ap3npwprX+OTv
	ha83jLP093LTAlnrwhK8GCbfqUIjmvhfFgaOAFsMShuEG0Qf/4QOaAbXDajc/scRYtbKhh01nRd
	q7WeYtc55KLe/szlRqUXeN57vfWBvxyQXepkObATcC7dwGDcoILmRzpspIlog6jJYL/mFFLzi6r
	HJruS763y8KMbgDRCjhF5HLY7YLnD0drXFCI+KZpCdmMSHStgPD3crYrQwaUSXLQkhZh5nugDJi
	xSZeo34F+2qP7tr1l+2IouE0tL9ao+N5Gid/JLCFgGo/3uoF6RdFQBmAHoz0hFpwWmLWME2r1kY
	jxDjyoYV7a6XC2ivfNNbVnpCawhpCtPSHOlz4Rd+Mo1zVeL/fy1Y=
X-Received: by 2002:a05:6102:6447:b0:631:d445:171f with SMTP id ada2fe7eead31-67c92ecb981mr7786990137.15.1779801087363;
        Tue, 26 May 2026 06:11:27 -0700 (PDT)
X-Received: by 2002:a05:6102:6447:b0:631:d445:171f with SMTP id ada2fe7eead31-67c92ecb981mr7786956137.15.1779801086891;
        Tue, 26 May 2026 06:11:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:15ba:1d70:65ea:9578])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5e484sm34259426f8f.30.2026.05.26.06.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:11:26 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:10:52 +0200
Subject: [PATCH v19 04/14] dmaengine: qcom: bam_dma: Extend the driver's
 device match data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-qcom-qce-cmd-descr-v19-4-08472fdcbf4a@oss.qualcomm.com>
References: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
In-Reply-To: <20260526-qcom-qce-cmd-descr-v19-0-08472fdcbf4a@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqFZvrKUL9qIkIN19qHPEpzuE2u/9bNVcl14aWN
 QqSrjVTl+aJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahWb6wAKCRAFnS7L/zaE
 w1dFD/0cVIC3rGapO0PKyqz7apZd6ma5SpNf5q9iP4D70P+gdIIaivnFTjRV5khLy62rL8tKtiD
 X6NA6JDfEdj7cW4AlYdEvmaVdtCs9onD6Ug6szzgaUyAEB/BkAEIaPgPBx/jgNR0dVSDlV1AQ6Q
 SuDIaG3gdJvzEavdwzuKmGJ7U5e1F0RhGPLVsrPrJfGH2WqQ7KvrXIkuzylTvmC8luChR6vsneZ
 RQVwNPOCJJfoDkz35045GwPpd1NTIofdUImh5xGo/eTc7/5LvMApBCEpUDAPuojV2ghp+H3pVpO
 wEIhCPb6SucKoX+0TizqrOnRE/QdIKTdIQ8mP+KqhG64dCXm06jXch1h31lSBkgV9nTnR6qUYOR
 ckgplFhHkXnZFSsDCIi9scdtHZxQa6zQUMKtPMRQSGx9Jw8xJVE2bhJHLzw7HyJKL/aJICPdy1s
 icQMOFwDWGlfP5TSappPtJpouBTbUIIpJSKIgLGuY3pZaxLsRLZv2vnaBqwv0DVqJbR+50lyk0Y
 1RexXxlbo2Uzz21FflwZKCLfQHG7mOvuDYQyzGqDjQOHRjMgvnBAU1R0Te4JyUoHHbtu71fBYRf
 hQ6uiX33ToVBjIr8MOf/OmpSLcpxcQwFUixfMf1Na7lwH6iPLcno4kd6IA6w5J4n2NzOijXI5LT
 bKeFTl3PBHQGIEw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: wEARruWZrSvT8oMX7i_HEZxqaGnl3Ryq
X-Authority-Analysis: v=2.4 cv=ML5QXsZl c=1 sm=1 tr=0 ts=6a159c00 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Fb6uNmSZeVr-t7npd3wA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: wEARruWZrSvT8oMX7i_HEZxqaGnl3Ryq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExNCBTYWx0ZWRfX7zbAlmAw9NTc
 wV3OZa65M1OW6KcQvTQeyN6C/yESN7ol3r7folpmp7/pbqTEQ7cXQH+IrV07wzsli8KlY1dBffB
 IyGUvII4EafvP0e9DxE7BbGawBAY9jE0oi4gsd1B3PVvLr6h5rd71njUOzuhJKSu50+FCxumPwq
 8zb32q5FOSMNBRMiQ/3j/RzS2eEYNTYLHjsP8oXU+fZ+HNltsrAtjdA76Ote72W2aaPydoogcPU
 l5XwZcSfestMJUmu/TPhK5uK+pb8C4pn7tYfLQ1QPQXquttzUCP1h4zqBJJXgV1tCJmjmFQNBMn
 1c7nYCxAKfh/ssAya4CVnKHz+bQ5x+juPoyQjXEUSMnyGo0wfsvtGPcnUyWO0rGLgu8QWD+c70Y
 5HolnvrAKEi/cVd0eirQSLO9XYPDe6lv0E0e0NO6svKRdXb0u/U2HjfeRBmSbLnXS3u6s1TLwuI
 n6LklMHIb3Vy1vhnaqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_061129_226436_1A9CDB52 
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


