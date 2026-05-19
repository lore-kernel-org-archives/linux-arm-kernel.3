Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA965CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 13:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6yvC1N0mVZtsuZtG+L0tsQS32fNOMK+fMHNLzdHkLY=; b=dyfFte+29hCWBUuKJhP1O81T3X
	iLoLjY/j3fVbN6hIbLnZi+YHPiscDnYX8sPsl31X4Xx8lmKKWKDuLJDhptn/zcfYKHJ57zxi6mcTg
	fEtKjs9GgnKDBCy05nm7XSY/E7i5OtPnnWBAp7X+SFinX8By61HR+Ni795ZDUguj1ttKEtwENGmGH
	2kUxDMw4hjjaOewPqnnzH8jOB9EFk491ELB3nV91rrSjJUGGIkft/eJP6JoL1rQv8v+yYU9DdR1w1
	RNvRv+GKnY9Yt3g5IWrK+zMuppk6nMpMOYOtmiQPz1Ylm4SdcalME/JLUdBT7BXTsbQsux65DIBRG
	egjV+kYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKLC-00000001cL2-02xf;
	Tue, 19 May 2026 13:18:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKL6-00000001cEZ-1t1U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 13:18:29 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J8EIhd3612464
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q6yvC1N0mVZtsuZtG+L0tsQS32fNOMK+fMHNLzdHkLY=; b=Q1bo/mAo0V1OTNRZ
	wkhuCwIGnnofizJZJrpioab4iHSHE7Eh0n/q8lVgC8wcKvRNINzWiCDHDFkwQI01
	ltoICN1G4mozEHDwZqjAWBvVd0Z8j5u1lwWhM7dtP3IwlLGK6io9vTfeU9gXDXvi
	vqIRVD7R8I+u0HAiiZB1NJS3MdcB14o4nN4OCJY8V3AAaQypz4yLV/NgSeVEgGZY
	zWsqh83pT4utuA9R85hTe+snsOL74KLtWBNZeD7SOZIam04ZRlO8YI+o1E9aBZSt
	s33kvR2Cf23ih/QQhxHnvQ34F/k5GIKb5RYzqcIGAzL+esnLFAgrBCWHjQIJBM5M
	U7Td8Q==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8m64s79r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:18:27 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-57525c1ed46so2452998e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 06:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196707; x=1779801507; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q6yvC1N0mVZtsuZtG+L0tsQS32fNOMK+fMHNLzdHkLY=;
        b=X38Qzu/2u09gWOwQSsU0BDrtKTWUJJVpHkVX1EPyBrFQmwP/Yqo5xiEu1BOQW+2K7V
         XU/ErPu9qNgHHs8P/O3ib1pkFgrb8xDu8IbcI/DZCG/WNWuUnXEf1tseH4/b0HYtBtCt
         7PxcKBeHyroJlj0AQmq8J1UY8vM9+v9b0puKrUvO1fntpG4RDq/6GpKufTioCMPf2qgF
         QuojaocFm+TmFSWRcoNSD3ZgBWxhYZ3JKDERa6lq+uN/kxCnTnoQfO/DbErapsESwUxo
         rKhpP0br83gG5VHoEaZvnVMaq0AUHzlFfM5AB6DCncO1OR1LijLGydZL/4Tn/HT+6YiI
         WU4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196707; x=1779801507;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q6yvC1N0mVZtsuZtG+L0tsQS32fNOMK+fMHNLzdHkLY=;
        b=jZK/neJ5zrj9sFMZw1IbrP2Bh+yTqtnpWdNrfkgHxahIJlGE+jP+0k6iLxTEPGl0EV
         e99ADsG31Rg1X5FfAzrDRhxDVWz72OfIsx2IwWIhocS/J88LXCmSXbsvULIbjnfWRXEq
         krN+d8iRTULKiZCGhNNnHGR2MGV56BvQ5qZvKQZLJK8bevvopzPCT/UM2lpyF3l5PhgA
         qs0DYBKq+l8+fzt2icKMRqYqbyZP8q9QhKbfadscCgiNSUaKVog0y8o2BCeVH8ooFJkF
         G628UbaaCVF5eLd+XQalKwitOZ6fboHdu+Tsxf1IEnj4U0vIQt84baBxKvhTWnYF4sEL
         /kBg==
X-Forwarded-Encrypted: i=1; AFNElJ8NmbBxIuSQsqqG3lbJ4Q7uudxJTJ5ijqp4Tj5hbfrs9h057iKmxVq3/x0V9JNwRnElabOliTk49h3LO/7OXo89@lists.infradead.org
X-Gm-Message-State: AOJu0Yya4+H8tYySzMxwyAsJVHLVUBGqBtA4SRRh/ngGus0ooDqzK3EX
	Ra3ItnbvZMakMzFkhtOBhfws78VMX3kqCfb/RT56GtlXmozLZNLH6e175wWmPpS5caK10bdbDh6
	diFa+Gfytc6ZS4EvyuTvh2jUBuQlmO4LyQEzK1k5MLIk5AmCb2sWxL9t3+hIrSA5cb5sBX0+CLJ
	7X/g==
X-Gm-Gg: Acq92OHLo0Q9XumIHa3tzjVmcUKnCzFzm0AXA04zFUDqiWvOrppgbq5EjjEmQXnFw3V
	NBCEIhsZHiTjOaKWIyQk/UxafGUWasi+xQ+J3ddonwebfpGf/n42NmxH9aO4iI9vz0alnwi0M9g
	QqmR3OToLMIab3wOeWppo3/lUIp1FklX6sWuukspdb582HeiNPKrVt0zPBz6J/z6ZENWVUSQsvU
	eN90hMh80fJLRy4T5jtu7A8IO3x2T93ot8dEIwDxxbncmpAEQ+QSce7qRxwrGp9UP5k66kEjjzG
	SR/tzjbVs5bKjSqZMNrBMPiF6AKOKzYtn3+MKjidsRAYVI1cQmeE/fU0zqozJKNJ4m0rUDib7Ba
	pWU5NmNtZPJZHneCNq5fpKD0/12UcdkTP9T/8QRIRTPTd7oMX2kk=
X-Received: by 2002:a05:6122:3412:b0:575:33d4:d100 with SMTP id 71dfb90a1353d-5760c08e3b6mr11169012e0c.13.1779196706880;
        Tue, 19 May 2026 06:18:26 -0700 (PDT)
X-Received: by 2002:a05:6122:3412:b0:575:33d4:d100 with SMTP id 71dfb90a1353d-5760c08e3b6mr11168957e0c.13.1779196706380;
        Tue, 19 May 2026 06:18:26 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fb6:74e3:3c25:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm143969195e9.7.2026.05.19.06.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:18:25 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 19 May 2026 15:17:51 +0200
Subject: [PATCH v17 09/14] crypto: qce - Remove unused ignore_buf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qcom-qce-cmd-descr-v17-9-53a595414b79@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2066;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=n0Cml8iSZ+MTejAlSL1Cpzw3FwIEirUqeMzFyFiqzq8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDGMKz8dbjF7OBkf/RWRj0NdmRujUn2PqTJYgP
 UoYP+NdutGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagxjCgAKCRAFnS7L/zaE
 wyWLEACxE9gJq++Y2ztjc929ID+NRJzmKorqaatD9rnOJ59HccANwaGyRcQPvF0ibV9BoUDDWQM
 ojjbGC7X0xb50YDrt7VSKGjH1uOXZqQF2s9Mr08oG8RqVUEJo3eSPqB6mfBzxPGcuSskyYcZO3k
 t34wBDR/zLrowQ0x4Qic9MUtQ9MnpQck25lFomtF/kQS4XN0hy/3LqRclILm2tIzXqaBdPB4BnG
 Od9Ziz1vUvLZ9a0bDX5Oc9fxIMatqPNaYwB7TR3GprjBpXFcUWFPtqh8i1ul+c2Zm0sEl1VhQUs
 tL0aDHZvdjknkrDvUuzluoFJ6t2RpYDS0RrQ4qWFSa3pRcY97AuXyxNQeTs5v3HYlW8/W+Bloi6
 zE+jlrOdpNROP8WHGCebpi5xceSwFCfxkkh2nCxbQncvNlvztleUAhA+jZyh4H665uPRyBFu2RZ
 HKwvY/ma7haHOPkQzwpIL7TBz9R6xTUkeCvyNQM7h6rYS1bp+GbMaovSf7+c5xwh1FrCpyGSZXJ
 9rCxX/OEt53EH2y+2ueEXB5FNpmQFTowQxqQ/9ocadalWpyrttveEPrn0pOKK9B2807bqZUevo+
 XfsF26GiHpGDm3OxL0+qpAu01hhLwgzz70FbzH/mOmmQxQd41hgDkrYeNOaIn+W/ciPT+U/d8Ry
 C5bRx2/yDatq8dg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfXzaazqYM+5xGV
 9t14L7U6g6ck2YMP7VhjfqU32LA6Y3xFW5VAb6ouMJO6zTZZrj4T7EveaqYWnXWvur+VDPfWA9q
 iH/XNOIexsx9LUWH6vzP4YMULcVUOsyS9+cjELgNrxkKh41Endi4D3VcXyOfD8w0YRmUzh/XJtS
 Q2o4ajn3+GjYkdfDveglyQDm//auKsM5MT6KCxmvpF5OI/EVxEGlIwDDzVDuws+9Z6CUSHuDYVi
 7FGEblu3q/7gdbiaikxp7I6/q0TGUtw0y1fZmrO4fFRyX4FKjF0xEE7wCoFszVLQPawP4uAftJm
 cskA1AzFZRH/fjhw3QlizgMqwx38mZTk3ytEOCuGBN4PZl2fjNRlixUe3QZyThIV/Nkewxa5Nj6
 9AVrbdqjw4e4jMCfI5zJ6rsSwsV7oJ+JWDgiY45537mSHhhORVghdxjwHgCQIP8OORzzE3k3Don
 IevCa1IwAr15uprdrSw==
X-Proofpoint-GUID: C48NW7H_HZJEiWTj_mTWFLehRF1_ecps
X-Proofpoint-ORIG-GUID: C48NW7H_HZJEiWTj_mTWFLehRF1_ecps
X-Authority-Analysis: v=2.4 cv=J8aaKgnS c=1 sm=1 tr=0 ts=6a0c6323 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tWRRbWwrKX-5tUpmLDIA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_061828_609610_E675F9CC 
X-CRM114-Status: GOOD (  17.91  )
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


