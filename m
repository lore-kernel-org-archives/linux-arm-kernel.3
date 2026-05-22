Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF94ACD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 13:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6yvC1N0mVZtsuZtG+L0tsQS32fNOMK+fMHNLzdHkLY=; b=l3tfw/LYy4wrD/+5HzuwGSAamf
	1n6dmsOwmSh92alMJMMdbyEnL/L1h+D2cRDv32CXDmr7dk+5OPvbQ59cgxVDgdrG2hkOg9bZZic+H
	HD61sVRDYFyrV/ginDOlY9RHmeZSWTOsntK0+x2EavPKZWiE6ulrJuc03WaBgsux/V5UZztlYKkoz
	ku6+cdSRTrB8aT/J6pJeQAHWhN1UgfxH+c5H/J5/Fzeb0fdZxpo/dcklI6nQjql4hg4PAN/ZPoiVo
	qZRvzpAf+wStCRxydMtG08GHxoH1kfmtE1P7vidx/HIQfgSASbDA5mWd3CZXGZ/n6rwoOgvf8USpg
	8uUush+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ7L-0000000B0ux-3Pyu;
	Fri, 22 May 2026 13:40:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQQ7D-0000000B0oq-1Xgh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 13:40:40 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M8bXCg3532225
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q6yvC1N0mVZtsuZtG+L0tsQS32fNOMK+fMHNLzdHkLY=; b=iCK2lo5Uo3mqAHZO
	VjRFrMm5+qbBrs0UkiF+o3YL6Ebf/gyIzitwZvAQYYU7XdeJiP7RHwrJi3K+Hk0D
	4KVUMlQcNHJzglET8AKstFTGWMTJavA5JSkhLin+QMKpHwCcm0VTfnvy0r/WNggI
	vqraSPu2nfcokeSERfDRWDvzmurz7uYEFL+uWa+HdaEKz5hmHKs8nJS7hS92zld/
	TkgEogR4LX6P2seaxavVSAMDU9R57BiEJkx7wVSKpcs9dcAeG2hyPTBh3fxHS8PO
	9rhV9HRtbUCsg+TU75lR4szhBaoBe5cg3RiosN9fmglZvA6X1YjNPDMrCSsDI6AI
	jODnwQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea39gw8wf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 13:40:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-516d53eeb8aso22716251cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 06:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779457238; x=1780062038; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q6yvC1N0mVZtsuZtG+L0tsQS32fNOMK+fMHNLzdHkLY=;
        b=R2PmzBDwQV4hNDjzC7AHxujdfjH67cAiS0rJA8de7Yhtcx7oE1AJtj8TkMw96WtiTM
         elekju6+B9OLTmPe02E834ix14Ny0yBEhWsF3gWU2Pas5GAQDLAbj8cPb7Lk4TYqqu9U
         lM/+ui4PLqyE/v0xnYx8nXV54LfMrJbW49UP449ZZFyRveIbo0dUG3s/2LV0QuWqYm93
         IA2B+EkdbBH8+CcvC6TIsoVgczr8Geg4kPPZYSTbApp96XgXCbVv6TwkRGoZeRjtJyoR
         iFAkqMJgXbkWIah+/gDScexb9j+44MYPciDlng91gVFqggCWI4twdXI+9sfRLEVotKco
         3myg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779457238; x=1780062038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q6yvC1N0mVZtsuZtG+L0tsQS32fNOMK+fMHNLzdHkLY=;
        b=sL1MDZG10KH1rG8eLBir2+Tte0KH3LvHV5jsvs/7EbD79KqP/iHD4Ch3pyyzCM4Bkd
         TM5scdchIwi7vPBQFskMSA6fPtl4xClb0rIQjt1Ft2KghULpLJwzL+uh6L12+ENfv351
         45BOf6yMuVGPaysEDiNWiG45EFgiq0p1R0Mr/TtYRtr/Zw350RueYBlwKmeXliVU5MsZ
         HQV3fVUoI2K4TJkdW5regNwcPaMAVJ0FklXTHIXZEhg+rPRDzDxJtWiFrBHx/1ZPaTjL
         Km6sk7i06bnV5YZ7uB9WLY6wKjOwk/BRQ0P4hMACZLlNSDPpG4KnCmh0UdQjOaPXfnMm
         TgmA==
X-Forwarded-Encrypted: i=1; AFNElJ96CqzNju3MWiwTjNVidgLrvJChPOW/qfshNMcgQ4rLx0yC2YfC+W1sev/NpWqfIx/x76UUzu9Fom+DT6XmHa3A@lists.infradead.org
X-Gm-Message-State: AOJu0YwRhEw5uUmF3doh2bihHBO0S+LDthO0sfYs1j7pDxOSBXYn3rdC
	CgT59VcNK7ozQSQQCfLWzIYevjXdMs8O6x1iLJ3taKS2yGr7qqETC+g3NDlHaEyWSwJtQXK/Sms
	gJwRW5LzJcejRlzSGji5lv+Afs7ZyNFwFnVYadBrrbuWD1wqiRyabcalu9tbkK0oihz1dR6dqe4
	/Ddg==
X-Gm-Gg: Acq92OGRyXGI7gCkPhzdbW4/c2qij7F5wqgm+8K8vArnY8ambydTULkxV1FakXEqfHz
	9qQnBtZHBmrOPcAjI9GiPOYWXUsAVqUCkg6LrDd2ZgZ37fag4pDCvgxidm+lTyN1N9sBHX2fPGu
	wmKJgO6sP6joKURHRyjV0gB0YhxPPvrzpVScOY+dWejvz5sqtVH0WGUFUWrbTduwCiaGrN42fQY
	YKgnrfDPH7qC3wSxJsKciGU6Su4OyvwfzFUxc8aOntOT2eOwB7MBFbyDyCjBWc0mYUP0KY+5FXU
	aAxUub0D/fQb/ze2Uz3YlcZhPj+bSp2mYRsk1mOhQ8zlzD0Nw4RrGmd9O/pa1tVOta9XkSOc8A2
	EfBz2YVnu1AZEve3PbZ7ksh9GRMR1Ali8oFycmBBIePbxFmpJS1LSbDqyOAgL
X-Received: by 2002:a05:622a:189d:b0:50e:5cea:a519 with SMTP id d75a77b69052e-516d443c718mr51205801cf.12.1779457237827;
        Fri, 22 May 2026 06:40:37 -0700 (PDT)
X-Received: by 2002:a05:622a:189d:b0:50e:5cea:a519 with SMTP id d75a77b69052e-516d443c718mr51205201cf.12.1779457237308;
        Fri, 22 May 2026 06:40:37 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:2fa:6280:a48f:fb37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454c600esm44912825e9.3.2026.05.22.06.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:40:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:40:02 +0200
Subject: [PATCH v18 09/14] crypto: qce - Remove unused ignore_buf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-qcom-qce-cmd-descr-v18-9-99103926bafc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=n0Cml8iSZ+MTejAlSL1Cpzw3FwIEirUqeMzFyFiqzq8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqEFy73t7RClzY0R/8YYWO+mVaNF6zAcKbAxXTd
 /hKSx01csiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCahBcuwAKCRAFnS7L/zaE
 wy9LEACDslImbuzNtup9YTuGUbBN7OVti7fpeZJRpKp5U0Y/I732k4RzXG9MFik0daokMSHkKhh
 jA8/uBpQ1ntj7c0AIGuiRMcFXAuqhUPc3uy69Z601sB2qpGfUBuOkioiX16C7JJ7BFngTomc3Bd
 sLmHH5i51inclmd/MvnjOALcpYlgftfEzjcU0OKfhxEA/ygadb2n5bnUd7A+bcJ7MJ6Utl23iQn
 231ZOxR007HN4BtOIUV/ctZI2Xwl7ZL8AFzKdoKHPsIV23gcKZwFWVtrOmQRlHzgVZ2qmnwtw68
 5ftTEg5MpYChmociSl0hS4Xj1ivgkr4Sl6CmlZ3CuSHk9V/sJup+BcsnkS+o9ADfGAl/sLJ4Ovl
 d9D5vd0HQ5WpjeeNMVJ7c06FwzKxjV497x2qE3Spzf6i6enrhVAyADdmv1P71betrLbWQ18vhly
 kUDE7Zl+fxuIQxGf1ArInMCnAE/J5pwOYYkRsmnNG17NQGSyEWEMRtc+VYtYS88sUGqOBV5iXk8
 IGkkIG3u6a38/SkyPO4RLZfnSogs3mFanSvNg+xGHouz7jwljuskcEiw9/sRNHapfgHM1Igdb9h
 hKZ6Tvcsw3FeouwBa4yq79p5fdgJNuCI5L/Br66ncxgUIDxwrEq2sL3XEdisBOLsUSDhDwTeAWe
 dL4mK/25ipWnEvQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Yr8/gYYX c=1 sm=1 tr=0 ts=6a105cd6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tWRRbWwrKX-5tUpmLDIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: BRb-JSiC9_gt3TwgQ5FUiF6YLijOymLm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzNiBTYWx0ZWRfX6iWnPBhcUkot
 ZPY9+Xrs64cBFF0ASljlVakkNj64aYrbJdJL19zZTruaCzc83jEKgaacBapnwsqirrmKjLj8LxN
 S7blzMVjbo+go9RAYtThXd63/rQ2rTJtgYR/GYOCm+Jc+JklZlxK4aetbgaSEBej1i3KAkqcBCh
 Joyj1K+CO/4EY71S3a21c5uOeY8ImasEUa2YnmSGTVlABFFRD7c11aDfezeDxxpSo46sOUObXCI
 9d07gwOKEIZmdgN8vT3YyKQExf47lRUiX+giK6Y/I9cDeczVNWpGzm0AVZtCPQeJXSshxM3QAZo
 sewj3ITFv4yFQsk0xjSPTJcNFGvsschaBJwTfJDpIMkSFjE4KDPwV4qMp1PNp8gLoG8BjnAyNhE
 lADfvwprDHehUBBJZK4yvXk4QenTrdMS0C0EWicVrei+Y4Qof5kJSDkB1/kUpfv+pcg2XahYECn
 R8f23y9CbeW1bq6mkHg==
X-Proofpoint-GUID: BRb-JSiC9_gt3TwgQ5FUiF6YLijOymLm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_064039_423835_EA411AF0 
X-CRM114-Status: GOOD (  17.57  )
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

It's unclear what the purpose of this field is. It has been here since
the initial commit but without any explanation. The driver works fine
without it. We still keep allocating more space in the result buffer, we
just don't need to store its address. While at it: move the
QCE_IGNORE_BUF_SZ definition into dma.c as it's not used outside of this
compilation unit.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 4 ++--
 drivers/crypto/qce/dma.h | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 68cafd4741ad3d91906d39e817fc7873b028d498..08bf3e8ec12433c1a8ee17003f3487e41b7329e4 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -9,6 +9,8 @@
 
 #include "dma.h"
 
+#define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
+
 static void qce_dma_release(void *data)
 {
 	struct qce_dma_data *dma = data;
@@ -41,8 +43,6 @@ int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma)
 		goto error_nomem;
 	}
 
-	dma->ignore_buf = dma->result_buf + QCE_RESULT_BUF_SZ;
-
 	return devm_add_action_or_reset(dev, qce_dma_release, dma);
 
 error_nomem:
diff --git a/drivers/crypto/qce/dma.h b/drivers/crypto/qce/dma.h
index 31629185000e12242fa07c2cc08b95fcbd5d4b8c..fc337c435cd14917bdfb99febcf9119275afdeba 100644
--- a/drivers/crypto/qce/dma.h
+++ b/drivers/crypto/qce/dma.h
@@ -23,7 +23,6 @@ struct qce_result_dump {
 	u32 status2;
 };
 
-#define QCE_IGNORE_BUF_SZ	(2 * QCE_BAM_BURST_SIZE)
 #define QCE_RESULT_BUF_SZ	\
 		ALIGN(sizeof(struct qce_result_dump), QCE_BAM_BURST_SIZE)
 
@@ -31,7 +30,6 @@ struct qce_dma_data {
 	struct dma_chan *txchan;
 	struct dma_chan *rxchan;
 	struct qce_result_dump *result_buf;
-	void *ignore_buf;
 };
 
 int devm_qce_dma_request(struct device *dev, struct qce_dma_data *dma);

-- 
2.47.3


