Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF4CFD8779
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 14:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJf/VHFbEfrJ7fM8DpDhu22yxXg6EYy+KGz73+G0kyo=; b=BlcCqFdXFBk78qB4BEiaB7xLVn
	1+jGT1cdWxWdwCFl61kYR5y87XbNUwYwn95OVstnP3N7+qJRaQnpJgerGUdyp5lBfnZtTAFMM81uj
	2EXvNLZXsilQQ1WIy5Sdb4kA74tkhipH22YgLg5N1tl0Owd4MhJGmDT44jiH7wTQ0DiZdgN65fwJW
	+5hDz2uWn+7Z+ck9VLc7xMBlc6tRwctoeq86Ykuw+ujUHQQtlmFqp5g1SAaomCR7WI5xO8FR5S9iR
	OZ0oZxl2Gt4X9ODRHqbK2RwNYECwsstK9u974/oboFcDz89hDG8g0JfEZ5enfMScZzK86A1FM3Tyk
	YjHxVwXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V0W-00000006Ul5-1jzP;
	Tue, 17 Mar 2026 14:02:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2V0T-00000006Ujf-3AJq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 14:02:50 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HCGHsK1042729
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 14:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AJf/VHFbEfrJ7fM8DpDhu22yxXg6EYy+KGz73+G0kyo=; b=loVfwRdh1i/4Boke
	JILvkzsLVUSHae2BjxTwFw8yxFJmAzZtTLOmXWCES+jxhFREgnQWVukaS6+nQXB8
	sUZHk99V8NC5Clj+K+PGbU9rs2OL3AjCAQ47MI3deIT2/HFC1ERja+G5hf4AaTzq
	l612DW/N2W+9uKNzHWPdFVc9shdmqmIA4ursWoxzajWwgZWOMtH+25nikUHePg83
	AZo/fdtJEPzuav6FxZsp2kz9M/xF5ZkLZuDim4pyooRZ2IQ1LAgcL4WSAnjrm/ji
	pNIjBSIcSBZ2QlvxpUwS1Z+IDRyoW4zSzJS53T9KiL1qYqabp2IpjgKYrqiOU4fU
	he7VJA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxkuy4a0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 14:02:48 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-60276247301so442747137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 07:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773756168; x=1774360968; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AJf/VHFbEfrJ7fM8DpDhu22yxXg6EYy+KGz73+G0kyo=;
        b=Y8HS11CMymYZayj02x4NKCJXNlEH5SpSJrvSRIiVOIfLwB6ODC6zBvAuL9DROUYADP
         Y74Ve6BhqazspQr6nFbKBXB6dh0tMSH5nDRHCkhHf1M+rL5LnsN21Oa4IISZanzGUj3Z
         X8tu95MsfkBjwf+nzw+ZvBIcih3s7yzvSoRsQ4r8/K0eMwaLiNQ/qw8o9ls5FP1zLRFh
         X0escz5nKOvyVP0FtpkxchoC5Rfvhg6vTsdUcoOhvoqgalWTcKvu87DVlW90iozLfOV8
         XlQ62Mpy9z1YzztSMXsSC4jsKbsKYDEwZRnlOKkV8GqOoW3/RGklm+YfpMpec8E9qQv4
         XxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773756168; x=1774360968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AJf/VHFbEfrJ7fM8DpDhu22yxXg6EYy+KGz73+G0kyo=;
        b=byG8BN74Da1ikj4z7pQhE2c2Zbh9s4qdsIKJJPZ26wVmggFaKuZ5KIT5PDaykTTQ5z
         VZCNMF/cquxd+XcPqjbYKQzg5BBeG3PAmfBJ0WGAQjR2qMOWEq7tREeVYS8R+qt5Zzdx
         4SdLg76lbwcsu5ZBWwtFZICqv+aeU+zoTqdarJU+AIJ9zh47PlAnoh8Yxi7Z9dNmUB7Y
         fRKTH7ij83ezf9NCOEX3OJBYk0jkZuFRSKtbakDqiyadrF316CR8hqWqP9UUzDCU6H+z
         a/hbSZT2oQBbG0ohSkoNgnq9nWlVWyR7yl2SY1+1G7/QIk56G73GOclOgIdMaI0qSuZF
         NluQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNWQyZmmP9fp3QarptJspLq4sm5BawmL9bUS5qa8oVVcafrrTxZw3RcGo0Z+HL3kwXkPtFc6Er0ocK88KEzW9r@lists.infradead.org
X-Gm-Message-State: AOJu0YxvVtPG1tcy+znlFtGQhZBlwQIKDuL8EsJgX1y1anqDUmNcvQ5X
	u+3cmoN7dZXN+p6XP3n+BfI3QH4cy5Jbn0LJjE+DivEBPXuYL8bXqjqPxpKowspmCOERBlkZEBz
	peh2XkP7wfJhKo1R/fb5pqLw0VGEjiFHjore4gQkfTb+KvNg/H69ZfFjQPzBJAaSfvtJP8fv65g
	DpNg==
X-Gm-Gg: ATEYQzz0k8JgkjnzNRUYcKL6/t4ZCr0n0EnKctSNLALKCJNIIq70tnlj9zWYt1sgHGk
	S0Utx6Bq9FKF+S3Gtor0IFJwVgnPpnxJCfTWmBP+aBLVUNsqUT/SnmW2JeAjsT0XumWuiRcnIlH
	yX8cybWYI+kaZNxt2C5wPC7W9CM/ES/H085oufRV9lCOY3crbDf8m7Qm9GqNdxah/eUloOjwrPc
	2fv/RsxElgRzvQJ2/PXkoaXQNI0vvuwH18pbrszxJ8YnpMFIMMzZtoEc11I8TN8vOefLx5DCEQd
	EniRbaFp5nlD748gVxzSSInG0BXBOrlUMEWsV+vgpQkKrugrgdD4XKM8wJLVdKZqjPWA+9sT0pB
	IVmSeeXDxYlAcqFsNzE3SkDyHTZ4cNGdXIwHrDSdtY/nw9vsYtl6v
X-Received: by 2002:a05:6102:cd1:b0:5f5:40ab:2d65 with SMTP id ada2fe7eead31-6020e4c7652mr6014767137.22.1773756168189;
        Tue, 17 Mar 2026 07:02:48 -0700 (PDT)
X-Received: by 2002:a05:6102:cd1:b0:5f5:40ab:2d65 with SMTP id ada2fe7eead31-6020e4c7652mr6014711137.22.1773756167698;
        Tue, 17 Mar 2026 07:02:47 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6aa2:dd35:4d6d:8eec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b4938854csm9359709f8f.34.2026.03.17.07.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:02:46 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 15:02:11 +0100
Subject: [PATCH v13 04/12] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-qcom-qce-cmd-descr-v13-4-0968eb4f8c40@oss.qualcomm.com>
References: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
In-Reply-To: <20260317-qcom-qce-cmd-descr-v13-0-0968eb4f8c40@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1425;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gfl+Fn+ISpyM/izQ226zR5pAGJiHs0gWIagW7nCmNI0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpuV7zC1mwn8ggHJQ+ya051XpuSpuUqQakAlBbW
 EbFaeyomTSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCable8wAKCRAFnS7L/zaE
 w0WOD/9z7WuD2HMlS4az2EPaO3BtEOeMdY0s989E4rcqOi8GVYeyjZZuVCEgbixdFdKuCE7ZG//
 wUeoH02qNmzcuJyM576CMaDL3txlad5WizKfRalKpVdO7Pw4WrnSbo88KrocnO4S2+cLHQcX1+S
 AOrGyqz20MKy7ColYQDwkNxGUhG2TZ7DBkapuGsdJnj1iIdcAwx0lN6uVsNVzUsc+yviQrZzvBV
 rx/ibDEM+G6rMudbjkshfEbcvYrqUGPtEjGBPDvJjzb3sxXuTuTPhfzrXmYTFKMdVTOWOzu4Dim
 ufZZDfW5HrMTTVDE+tSdrj2BhKBQZ6atrvAwBT0QwriLzKMzZB544xKTdowHas8ymOQtyGqbW/2
 1XWwqPRphL7Pgnc98JpcIkLYjC8nOYjjry5ana/KbsFYQyQUlhTJVasEPy920tiQOLpo11YZUHY
 am2E6hCgxPir6fVcXkAP8B2GjKvgSinGTZ2r5EP0GtD2oGPelSo1nxL0uYe6GfYUQcrMWX+In9/
 tuD/7wtSi/6LUFG1zRtN9Ne37Cb/5DQzROzgC0bwJq5WdMbJw8AGN+phH6s+x+LFIbyhhUToJ6x
 hLnTkwVPZabyaC0fckn5kQTVbUxAVuJ0eDO4b+4SbHFaTg243/jaGrGb+/vBCYmxZvhV7EguJyu
 09LSShsqq+CfI2w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=69b95f08 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEyNCBTYWx0ZWRfXynmBrQVMCIcf
 nMTfSmRTzIL2rtGsvP+sR/Sy/yM5LS2jrNi+2Yd6k+Jn1ewIFQsLDK0oxwaciXQtTsBHaKoohnJ
 1jpAcDgN8D/5iw3Xa3PQvfMB0aJiqRkeVvMYPSMUggCdfo0Dsi2gZRX8TC2n8kB6xg6bCaxdeFJ
 dpKqMFuyxrj9Sn4fGwwJNGh/m70MfUyRZ/P2ES1u+IZy0lZMBFzlQuQ7OpiVpAeAOVttrFHsSgQ
 DyBwB7j6EE3QfE1bDfqdyLp0n/AmxGgek8v9YYKz5gjpWhxYxd5tNzXWrGPzCWqFEXg+X1DuAEd
 KjXnsADXcDtvpMAcbmAa3JBZv2xFq9bqV01yxOiehP2TvQdQ9rmTUhozTgjStMN2zqIa81TSQEt
 Tfi5l9RF9KMkHJ8vUn5bPn931cScwHSlQTiB0kwfsYz5sIOyVHcRd2Fpg4bQK1yeWM0GxdCZxrL
 49W/ASLVslhPzCfSS3g==
X-Proofpoint-ORIG-GUID: 8sJkTijtjwpUQZtVyvpdicXus84IZJxw
X-Proofpoint-GUID: 8sJkTijtjwpUQZtVyvpdicXus84IZJxw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_070249_919001_65986736 
X-CRM114-Status: GOOD (  15.11  )
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


