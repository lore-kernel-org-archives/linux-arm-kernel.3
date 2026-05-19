Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99275CD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 13:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Gr0t6VI/a0hOXrs496vSrF8FkdFJvUknR0vCq1ph70=; b=gZpTNcZPiER90T8PuDX/icS/Bh
	W9p/QRC8v0J40XbP5LLqTOgbOpe89QrAbWfezTW4KGrd4gd6X2V7ybH1IM2GlNLb9Ig2NCgCzdqYX
	vcIUqpCd7BbFY9No+nBud5fBScK1T9JVrVibvFU7XXM359rXCJqHk6Vk1WWZ70y/USAZGSmWfmdXQ
	ZQi0fFBPar36EUprq/DLZKnlvEPOH86fvd4iWMNJziU7S37VdwKQTyksVA63DZJS+y8KnK+lZz/di
	2HBKn4MoHBRsZm1RlkK8fcgTs8VlZScIk/gg1GBlVfCtMY95PeX4Jzf9x6/mQFqezWvpbuGIw6GBw
	Nm8K/afQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKLB-00000001cJZ-1bMJ;
	Tue, 19 May 2026 13:18:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKKy-00000001c7N-3YWY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 13:18:23 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9vFIJ1055038
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:18:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Gr0t6VI/a0hOXrs496vSrF8FkdFJvUknR0vCq1ph70=; b=JkNp9NOIXoxe9TZv
	FR5IE7jqxMa7D63RJSLPOYEmsJlQ1KK5vGaPhXT8UgrhZPACpSSS25Lxw2J/v3qC
	YMWWFUuiJFTsC2viMmb9jVfnygIF6CLuLzM9R4hzSNaGMx0rWUdwCD1Ozq5TCgcU
	rQU7gfM+VWMtrxE6tb2niuPltB1ueqavLthCyqoVkBzwK/NWvoymU34ncnWBcG5n
	rWXfGSqG5zU/0OOdnbGuAyX1z+PzBXBcQCK3VwNfnQP+b+ZnWnCJ01bfW8LLsItC
	Di8PHpdUJBD3rcp3QTiO68OQCbNR4jUQjljQvmassS+XeHFPOggiF/ch5mjV8hUd
	zKamGA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8nparrje-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:18:19 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4824a871018so3276105b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 06:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196699; x=1779801499; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Gr0t6VI/a0hOXrs496vSrF8FkdFJvUknR0vCq1ph70=;
        b=RnfmbGNzm4WaogWsmFJDXMRqYZ9LW15Y9VJryCJxKv4VSn6n1IA4KEIFqTie0xZ/wD
         spbBSi9DYinoKMpRzFzaCG5WV8gmnalPPz2RNxqm63FdJk7NBkOkoQEN/6qqYwyrFal+
         lJMHyb+czrolxlkVf/TCNwnBA9XPJ0w3P9z17rtLXfN3nMzrzTGYV/oTHjqHH8lxH8E6
         nc6ZTExMgNk5jXAktSyZtkTXlTEKmKuzgKPGIwWq+qYq4qzy/hrOwVzFvSnZ1NpT95P8
         9FraL4kHlYsZIGmWYcAzv8bjvS//K2Y6WjBVEOJqf1a6jf11W1aTmNs0Zc/lL6CCWRRc
         tpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196699; x=1779801499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Gr0t6VI/a0hOXrs496vSrF8FkdFJvUknR0vCq1ph70=;
        b=QeoaMdb2Gi5WkOsXlMsdFj7Rk8LYvB6Taf2EmD2T3voatozGoqb0bi7VcqZb/dXjP9
         RPLU8unBcpWgDgbG4uWulyAWsc4XGhGmeYnHB6IDST5OEanDAVZYBK/LXA8xxKe4RGNv
         nXWJVkM4vfN5ln3OmvnNvbqbhOGQab4zdQSSQAcZDftZ1Fpr76dh6J32+EW8oHIrmT4D
         qV/jDhmj/QeKKb47z81/xlR2rAbTfXQ76a53ASgnbdBqDRw8OG46x1hdsEmJNR5uJico
         2IttMsqHg3TaSlDmQQ/n9M5rHCJG1OYRyfgz7eBcCuImTJWNvWFnpcvc2FmxE6RCnymp
         ryDA==
X-Forwarded-Encrypted: i=1; AFNElJ+SG4p6fF3wLgEjqWWIJ69ex+VgSlgxUorAzOSjs8GJtzyY107EgR7utG+X/o8ASah6YI0EblGuJdZcBwl0XBFb@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0uFHwe9rLqMcStOUQjySubmUEruFOdsVSMIKaxzxB5wd/Pbh8
	WQ1G4/eQZfpX/G/kfxKR1hV5W2p7I7vk2sHhGxhEl01AVckoh7kffN0vIYzwQrJ1YllpZzd6sJ1
	ENz8KylQpYQBnqV1qJcdLuuXTgbcNfinigTqhtQnT11fvoCtAShpQhN9HxYjTs7ZG1gWyf6f+V2
	ShbA==
X-Gm-Gg: Acq92OHQV4PCHqHozbKR4NgIaDXBYr8IoVXqpFbPNDw1rm3GbQe2bYh978STqgOUcAb
	4Gq+dIUWOCUQcZVvkF8Fz9dqp0pKnAqz3l+9+p/yU8lSDQqMVFgdcEaNKh4vsniyEFm6F77105q
	P2F/C8qoaCR43+PnhFDuDd8O1tY7UXP4biMiBWmTqlxjeSMriTTqkkp7ViHG5hf4CAYXd20jkKM
	35it5yn9KBRagSAGS0Ox1+T1ohmpng7x84O2PpgYa/3f9+Z3f07SVZUhMEeI3ufF7Gjlt9DJx1r
	CORphHumySs5OXZDiSDfSIYdayd3OdwASNpJjkceW4TPQ7XNk1rYcnmOxQEEb6EQcr04xKLvqOj
	SMFRa0PLXj7tzbK0wEuCGPrDU6aU5Q0sgwYoc2cAmB9+s2fLgGeM=
X-Received: by 2002:a05:6808:50a6:b0:479:fe0e:e83e with SMTP id 5614622812f47-482e560891emr13202810b6e.14.1779196699296;
        Tue, 19 May 2026 06:18:19 -0700 (PDT)
X-Received: by 2002:a05:6808:50a6:b0:479:fe0e:e83e with SMTP id 5614622812f47-482e560891emr13202768b6e.14.1779196698704;
        Tue, 19 May 2026 06:18:18 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fb6:74e3:3c25:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm143969195e9.7.2026.05.19.06.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:18:17 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 19 May 2026 15:17:47 +0200
Subject: [PATCH v17 05/14] dmaengine: qcom: bam_dma: Add
 pipe_lock_supported flag support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qcom-qce-cmd-descr-v17-5-53a595414b79@oss.qualcomm.com>
References: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
In-Reply-To: <20260519-qcom-qce-cmd-descr-v17-0-53a595414b79@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1530;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=95UZqYCVoso2D8UWFsBEOl96nt3UOjBik5wfLsq4Ngs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDGMGcHdXbfyHT99vDrDX+RrK/0ep7PuqhyhyR
 nnEczoWRnWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagxjBgAKCRAFnS7L/zaE
 w5ThEACBFJwqWuIBl/1eTJS4fTvqoKnroUsfcrhv/TH82B5fHMnFllZQw2arhmDFjmel7jjoQpK
 va/zXYByx92u2Sb7LeXe2wzPO0wME5W8+6Gf3tS6VXg5ataVwgVFZgIhSpWOmUmaNYrgP/3kLUL
 C11zAAjEILXj9zQF5FhHxRB23NnKCKc98FVffOeegnf9Fy2cdcUmKoupF/Xtdwg0wVFYpr2hL6N
 xwHTe1vHdXkB8HoPtKBNJIdCWCVAWQ+iHo/Zx2Oa1A0L9VSg24WTFSibQ+va2dear/TzawVUS+/
 zA56o0x/goHUsNpR3V/fAgnp/b29N5vK0iuz7YCLMIbwYRUItpHoititqPrYtjNF9Pmr7JeReWC
 NwPitUtpPEd//vpuOQ868vp7DZ9LDyJpvlLG/GWQDtsk2hPWsPjOlf6yrE6gyyWF6KDXQWe65HA
 VaIdaLFWYGus05MtH0nbgCWf3FCZ6g2u9GQ42MqcgWQ3aP8QHAIvUnhBR26ajda7W38YEkr0Z3s
 Ck3zlSsLljlFVvfGM9y7kCywteZcnmrSrHrjGpzQurDS1M68Lx7CKjMl3fWNAjYUXEKWzZoTfUH
 V5HZpfGWQDCgM1XgMKyEEvSOuGc5GIo3m8m7rOu9TFfoRUTWzXDB/NWXppwFWxdevONF3FBjU+F
 rAXrD27c+U7tjxA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfX8c+sJOGZVBu7
 zJ0f6bo68kULZWAc2h19jilkcjMHsEfzWBUFzylCUsveVXHlgPayt/XVctc2ZgkGTLzkUyB4sAE
 LH0xkPHW3NDjfbXC8gSa+bQxfkZMmb0pLnNt7Vm/+4m0SZG0Kbs2n2iIJdYrUSTgQiW2kZxnOtP
 Zxe0Twmsvp/ljaTUHikVmvYwrxWAOfoSmiLwOUbYb/Y9w8Udk1eJZFg5bBaSJrPxkq2kGAXBPmg
 1NGORZN7I7GsWATRGH6/yFTZ0OLHWCFa4HxEuKeETfgVbqL6+lALwowD7BlyuHsoICjDOtriFxr
 O76ApYTVnM7jCINHgf9VbvL8K7gyc/y/0MSznQHTM370y4iMy18ETmZ7lY2SBfNfkv96WMrcCbt
 7Wpn4xzMOebjAKdpwqgyKyJUIHbbGHG0mq0/GMB8vdDLuIrmSmKNbplAglyS2UrmDlYZtRKNIEz
 qBwza0nbk9XVHbHBzPw==
X-Authority-Analysis: v=2.4 cv=NrjhtcdJ c=1 sm=1 tr=0 ts=6a0c631b cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ZSnkYuKn9ZpO9KHknGoA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: PBz2DTQn64cSVgsB1n70VtS77bDGyBZB
X-Proofpoint-ORIG-GUID: PBz2DTQn64cSVgsB1n70VtS77bDGyBZB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_061821_011791_7FBEF415 
X-CRM114-Status: GOOD (  16.46  )
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
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 7f3d1b6dd5d7660d2743dafcc43878e5f7952b8d..30318cf01ee20b7e64a988e8ce1ec04dab55e3c3 100644
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


