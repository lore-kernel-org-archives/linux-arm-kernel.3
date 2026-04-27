Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C663FF8861
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 09:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=; b=kyq/KSVZ7y97jErVeflHJW9Nr8
	XbDQYV646QrZA063Oymq5Z1JmtFK6lLjL1v89qSoQXtSdQ2gbBGOnYcA8rHPhHt8eC/64/epZUais
	yrEXBZ5MOSKzEQzFDvL7pIZ1uHPp91AYDFni1tJcZIorGx+EP8SRY+FTt8xgLNACVoTXDphMolS56
	/awUvAoV188eQkrb7EF/akTC4Zl3FFJfVM7JH1NvnegNX3ON3sCnXroyLzQ3hFTG+kXRBREWTSehP
	eF1xPMbBwqyqmNU0hZgTOThNu3/Dsr5x1P+lCmWQENEJZzRNrRvofVdRPZpDYvMx4J9PpxS81GlMh
	pKFER/XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHI4n-0000000GYqi-3xQU;
	Mon, 27 Apr 2026 09:16:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHI4d-0000000GYfy-3w7j
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 09:16:17 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TBcF665664
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 09:16:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=; b=hAkSHaoWWrtG42B4
	qbWi7IhY0L/EJi+aJJQEhBlOmJpuYrEFq2v7UgspCa3rKn2rRauf14RwP3HcXLgJ
	LPCWa7OSz9e3v93JswbXQYuPjyYsJujlCisQkfr05tByS+GwfD84idOzopF8Ygtg
	zA5euIYM5qEu0zEwAsr1h+NaBECldmfRF5+8b4fwkU5kPY98uy0eTUoO6urNBoM5
	YH3npYr8JdLdvDPKoSpPIAeLw9pYcJfBRLABnfEx0q1KoEHkhataUNr8n0oYf9V+
	Tvd7T4taaVDq31bKv80OXvXf7AM/2DTc4TYGjG1wWcEahQhly0+u/w/HyJYm97oC
	L3Mflg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n0kwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 09:16:15 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50e5a336b44so127244761cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 02:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777281374; x=1777886174; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=;
        b=Ts2wFNA5JS9m40Uc2lOT33VDeH7kZYGeSgPbr0XQJ+cJUrSZLo8R5S/AaPgRqiLa48
         MizRrDLv22ehBjkxfKbr1POTQRnT8LbxyDagtQaP38o7Q58edv6rRtY22XMmgotAMTlp
         jt5UMNuehE2dxj5lSANvvWJLX6tBUpl8VNRMgSiYMCysjjNwjhTYmJjewg85KAY3+u26
         zhhd7uPsn9iPIaLEA8AsiqJTrdGqETV5xBN1AwbodWGvhIspzFkTXzeqtqYRYmRZ0MNq
         2cCeisWSRblfwQI8+WDYaXOIrfvCIxgOJM43GJSrTuCQJGJPemZe+Jegntw3kINqoRUD
         qR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777281374; x=1777886174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9iGVNuTYeeAltbq14HNN1Bd2g5XTMHQ/MFj6N7hyZ8I=;
        b=T4xptgMXsS3lJ6NzWVvsEj6MJjshbG6ZkgVpBwJ8hRKA+cCsjaCnKSDU6+GBnpWLwx
         DCfoaUV5PfIp3MZWxmmffcCqlJK+1Vbt/jIAgzCzRP8adY78wKhFy05qGNZUoMFCAi+u
         eEMmTjwrljBJ3r7D774cYFYmGOvH28NlyRXziE04RbNRbttLmNXrs2b9wKnQozrjWbY3
         xRXmYHFQFjNvacx/2YNxZZbcD4ItGBrSVUJnIynVbMGElAe5jbg+2fyOVjGYMEVyQWcM
         rTu47twpTMo9Qfc2+I6LvJoMSSgsqefgXCj6mi8Fnblz1heisco5GSpx1g2ad008VWn6
         X8ew==
X-Forwarded-Encrypted: i=1; AFNElJ9+uYnxnoH8GGV3W8zpLAXy53Kd7xDY0BJkofVVRbn3XU79CfotdkdsWB6CunJ6idkjxmWfCw3BvLigscacp4ig@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6/4v8bFqqBhSttfxnL0S9x4o4t2hGWMmkzvIv5npB0njZCbev
	N3De+MNXnGKx0j3NzF4BVOFfpbL9jAtx6HvXNtpydqw8KwTahQOwpNb4HsLNnQxJ6LZRvzOATJE
	GXvE7QWmkCgx6BQIub+BfNEIAfscgMvDZko9wHUbrfkvlkucxkdSjEjWvtKuOT8mmAMGUho0Nue
	6ZCg==
X-Gm-Gg: AeBDieudc9rseOCzLFn4rO2scMPwG5ZydsKB35SPM1xjiEd2SE9OG9/Mi/T+qhN6XdD
	igRYFOytAHIUnP3UA38p4KUQ8osAGdBlMRJx9jrYtIgByTEJqRAYe8OGcjzfU0mPIbh6WYouQdN
	P4YYxXEGSI4G9ht2CG5SniIZdrasF/47F6JR1//j4jymTLMINAz+DkLJ9kUlEoM9e305A9wZGAA
	FthfTyRvmpH8WGwf38gxcyTSDi/OKisJM/iyZSJueGarzSAtCwNwIs704oQ3tdnoPQqIvc0ktCO
	5Tds/Uz5HDXpYOHoDF9yZ8CTbhbOk5Z3atSZMRKILAcEvFRodoBd4rMBGaRUFlhykirdAKy7mHv
	21IsIZ2RBBBhqh1UuidRIzaAxr0+OUqBFKVTV7RDsiGONnV+O9XggbGpbMvSXSQ==
X-Received: by 2002:a05:622a:d14:b0:509:5c6f:c0e with SMTP id d75a77b69052e-50e367b52c5mr443364621cf.37.1777281374622;
        Mon, 27 Apr 2026 02:16:14 -0700 (PDT)
X-Received: by 2002:a05:622a:d14:b0:509:5c6f:c0e with SMTP id d75a77b69052e-50e367b52c5mr443363031cf.37.1777281372055;
        Mon, 27 Apr 2026 02:16:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6dbfd4b5sm40559365e9.28.2026.04.27.02.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:16:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 11:15:40 +0200
Subject: [PATCH v16 07/12] crypto: qce - Remove unused ignore_buf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-qcom-qce-cmd-descr-v16-7-945fd1cafbbc@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DfH5Bb+Cx5AadRW9+jaH1GcMtyO0VLpMWlVREcJBr7o=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7ylD7u2M2axLouF1vpw9+ltR0S7tpnfX/9Xf+
 +0QcBWiRtaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae8pQwAKCRAFnS7L/zaE
 w6g+D/0SY9i0K2JU5To3f1gUmDIN2vAiSXf7FHzH5Su/kfdOHiflT8xHNWcRk3kh6l2yplYk1In
 vVrQGhhM5rJNpQlEr0XXq24SW2v18VB0vYp7UGe7tV2fPFon4FQsE5eLGXmbIi5TeeyqilnIAiH
 AaetOOeZW/jQsnwNlLXmBQRD9dNgzi5k+u98QO/ZOes9obW+wYfH7NrIfyBrl0lhE3fbyefQsOZ
 DJg3QteyKYLgaJsFkaLP31wXLtY9j7iX8cwMxHvnY006k4qCo2PP4WCgE1iM2hejLkEpKC0WYuA
 xqhJyI11uFCjoMSyXeO7LtEGMHUHbv11DVVUMsPYelwVBtmwYvjjVAd5t2UgYIS/Ijaujxu0qCq
 MXB8cRR452xACMNZerlKkuvPB7GYj9pZyEj6Nzo84M1Xa6gf94VhNofXnY/eZN0tCmn4WZD6F63
 L0m3B3iQjlxP0cDNuV5CDeDWifbfqHjLIxw5uopNiQ2omBw6WILc988JbPiRNHgRXSmmDSgcMMo
 Xt984kq8d+EBEJLg5oR8YiVIor19i95HmO+ROhLJ6YuiAbj05DaZpscSLZdYUk5xcT4FcPATm9m
 wtf7IV8Zkxnl9XEVd95t+yGterS6ZiW7rpW9FGPnsg1QWzZVFfK3PB6DOCz0pJqMZgRXoM0TgoN
 1i+6K0sCgxTH/zg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA5OCBTYWx0ZWRfX1iskCUc562YD
 F5PU7Jyfp7GUHnM3WlTXl9swZeGuZRED+d2LOl9NnyRFMkkWTMtA9KNKirIKPVZrB5ph5H+FVld
 /naNhgykVwJT+0e4OW8eKilxRsFmUgOGfh5PhCvshNaoejrEA3vKmJLSd56Zuquv9YGXCUc4rOL
 8ua9eayAzAwGbQI6GAfC5RarAkD0pyAHr1rSAZjL6PDpXTjRFgdJtgej3MBQQ/9ouT8LvoLkL1f
 9YE3WHp712QL7fSyOqGopwvMApSZYJK/AZTcIwUu1/yIwLfubspSK4WNgCHENMGPjUfsXum95CI
 XZKkjSsg3ND7hGLDtdH+tL6IPx1774BsSSpy6a3b/6zHDfJEbjlq80+614Ke/WGo4cg1Q600Ge8
 3pVVIkkw6k+U8SO/mGQcvyBJPYHW3LX546qWoiaLiq3MSgJsTzu8X1v/jznmYogrhCL1SN8QA8W
 Oj9iLMU30AlOdbzBdQA==
X-Proofpoint-GUID: 5JrXOXjanDG7V9lh7gGHT-V5mKqV3Fe_
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69ef295f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=tWRRbWwrKX-5tUpmLDIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 5JrXOXjanDG7V9lh7gGHT-V5mKqV3Fe_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_021615_995633_3E3B9EC5 
X-CRM114-Status: GOOD (  18.32  )
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


