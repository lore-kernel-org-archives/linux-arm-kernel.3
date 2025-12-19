Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67483D74970
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=; b=QpeND3CXhBcBvFmT2GXw3RA8g0
	JtMlJqt62phDT30ss5tb85yVtWhnNzIVFsCuEs+iXGWQ95rJ4BFsQNrv2E3vig6nEzaVplwamOc88
	Cib+Wn3Hfujx6dZYYfJfjuta30lN0vbLc2XR9/lzgbzi8A1V/lZJwFN1an6PgjgHWY8iUSNTHWHZQ
	qM8UmP53tfirL01LMZLo8a0R4NF8N9Bac5oSLAcgHg8saoNv6HSPfWGwULxllwM6hMnQbQU3SIRoI
	N5jM+xSHyk2ygJxki9xJWueyXgeETM5nKcbylAwmMyJPqTrgvcH7MRNBPPa+i2M0W/beE4l23Iupr
	YBkGaAgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXPq-0000000A1ct-2KIy;
	Fri, 19 Dec 2025 10:08:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXPc-0000000A1Mw-0Afb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:08:41 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4cKg73976182
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=; b=E7HWsdqftRm/lSe7
	yvpq3qxHbM1aAQMytnVnmhqMduehaTld2RXY6cLi+04dbKmyPxjKDPCBeuONokGM
	r8oqv+PKExm1t/Ovxj7E8f+hDQFAGVNFoUOp8miTIZ3M8TOol5FF3ZFgeFed04AV
	y4n+NYLr4rI60KD1JAE9Rmq+4VVtfPj9Un1Nv2B9Xu7lMM/sEuHYebiDrfwsKmV0
	qHV4lrAayxSzF+e5T8zipIpXmb3ASxHkKV4DFNBDrwvn2gl3XxYcoFdry1HkvopK
	HikT1E2GQfOZJc/h9YyPe1CNudU814aBYCZe9Xn4/0wx4zMEylDetay/uhU6MXVS
	aS0OWA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2fj6a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:08:39 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a3356a310so41175956d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 02:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138918; x=1766743718; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=;
        b=HICknl2LMs7FBjDYIGNsdQr1BT+/XVNWsuQC0MMlNKzK8/pSdd8pbzDc6VsfUv6r0+
         m3EadSNaKHRgu5IcGMrbl8w1IlhylTUQdSTHRx+4bN6GHzq4Y5gpOkmh6NrwdaeWt4jI
         /Xx2jhFrxlxd3FJyutrUZsSw48htiE0miqz6oAFwqBOxiz7Q803jGG22SNPWVLmbrqmB
         8qHDsqvFfrbM6bggcLR181ZRXdtNMfIepqKYyW9563urcHqlFe7tRPOOaslIxBxhGc7H
         sAvyOT2xePGEBlfaiDMDH4A9u+p9121Hy8BawXRspUB0AbIa7Aee6jSbbz01dot+D0T3
         UzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138918; x=1766743718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=;
        b=UB0tM/n/hxnTAInX/xygo58pLqtMECliOYVstSEcnCL70Ph5jQIP8xMssxcYPLFCzm
         mVjWyKbQzXlDS5V1LhIMVhCppyw0+zS24Q7b+mwpjdXee/UZMvlNqmEJdecEUjzNrm3I
         WLwkUVTLwvNNhbIKfzKXp3sVlaZL11ov1eNnWsp3+fPHPDLrdViNB2pX0PQc/H98fI1S
         7DdZqI7BKfXtWf82P1C+ku58aRHGiY3gdGHwGsDau7RDZHMEH0RodNil002vOrgfmHYJ
         HCYrdM1i1+qzOfZmUejNlZlAA7oOn3uZViImGzxVpkdlN+qO2BM1vN+kmtQonM2FSg28
         H51g==
X-Forwarded-Encrypted: i=1; AJvYcCVGiWLZQrJkS9gfw2XioZUQE3sZow8YikH2/oGBB93wbcpTxE0awv3Wjgq4ZkPd95IoadhZq44yHOVbzhU76BIQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwpxTOinep4KcNRy4iV806h/YCT87V0T7PFOE7biLUZ90Ow9/WB
	Xlz7x+JtLuf4MWmIPpXcOWprnHYS0NOcvv15Kgh5YGVKsSinbaooZlx+u66kjvOUiAPyNW498Ih
	idF2VYSmtLy1/SncnzYqecCZDa4nf3gxZdQnbJZHEB+DIiatjZJ0lsZxUpG/SDaRu+FEG+uo38u
	xPIw==
X-Gm-Gg: AY/fxX5CWbn+AB9KA8UDytSpDBZTpjOFuNCR1ZeKmmwuijDbygedWMQDisJZZchKK2j
	CP+7SkqS9xx4vE1jCeZAZo11s/5tzSw2ItnRtiocALJNsbobmFgq20dgM23ARrLnbdXQAcqBb5q
	fpgTfBAbAW6tECGn70J9XclyyiXekj67Hkt50y/cG/4avnE6vyz8ogprfh0LRRjWjguwTc9ZOlI
	xqyEt7bAOOI4Zb0814L2XuXgdTHRBuY+lrh2pnYhXits3r8KtwynDbTY8BMvcWdweLK0uNU7EEy
	cfCEjR1X4pPOUsyBM7r0g+8bSk/48k0iORx2MvPjEr+iTX1deZSMN/rgShFEco5GIxHdafOwyqM
	r4w5FLBGANWSzxJ83n3/b1gCSF/jRX1VmBaYBBg==
X-Received: by 2002:a05:6214:1315:b0:88a:43bf:b26d with SMTP id 6a1803df08f44-88d82524bf4mr41463946d6.15.1766138918388;
        Fri, 19 Dec 2025 02:08:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7+ng+TMJdIriKO2FCbHPSS/RqLqd/ZtxuW3TLEQgmbTqVki1I3qDta2wpZfmsBufhAKs30Q==
X-Received: by 2002:a05:6214:1315:b0:88a:43bf:b26d with SMTP id 6a1803df08f44-88d82524bf4mr41463686d6.15.1766138917903;
        Fri, 19 Dec 2025 02:08:37 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:a48:678b:dad2:b2eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm4209571f8f.27.2025.12.19.02.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:08:37 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 11:07:47 +0100
Subject: [PATCH v10 08/12] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-qcom-qce-cmd-descr-v10-8-ff7e4bf7dad4@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2266;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=azGHQ+ypZ4Lhe2NPlFIx77n1JCkKbs9Xx9/yXH7ccEw=;
 b=owEBbAKT/ZANAwAKAQWdLsv/NoTDAcsmYgBpRSQUBr0mYDyjQ8uzwnLSY+TxENDs4i7vLTmnZ
 HUSMJTud66JAjIEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUUkFAAKCRAFnS7L/zaE
 w2inD/jp9D6aEn1hR8fcE+ZZwHMWLX1sjWC9MoSYSQoCnooBe45yOVD9RiQE2YITZIlz0MJKtL2
 rrF6TMmpOVYoUU4UFaJA/WtYOdPiv+oDwflFafnix3MBzZNCgRl0kuVrt+v2x6zt5VZTWbew+MF
 PLHYkVkbhEl7q/nZxDmqhnwtoY5dVtWgkPpAZtKP0fFhGgc6ZkS6m0+0tUFQVweFBZ5RdMIiZJS
 ZZk87V8hyPE2IZOhYx8Em8tgIqdSAgBZ/1vBDeNEKeFe7/4fT9u2LQR0eVm3Ew/i6b5g32oUcq+
 NmxOsrskpkyXgwJI0spMwDVrbJY02n5BbiIWGFr8S+qst4il8nsBDfBl7Jt9k5GkR8hPXpq3nNw
 FWHqgJLEME4XPoiUd3UFdY7Zkm5Qo9rQFpbBzt+8DH3F4X/Fn+utnJ6VI7LUiYDekNjVb2n63e4
 HsJihi3ePCFwBhbqan8uhos2Iq7cajqOG/50y8ljAah3e9/2OwqyOzxec2A/J2dD2bJuMJUzMhB
 R1ci+0g2WW5yi63m0+qDHJI8PuTQPvHz9FSND5jHUg1qy2LDJTT5LYx9O4ht7++5sHYExUwe666
 +ODjaRUKU4cSr93JrO5AK0Sx/Tz3IIHL2xsGVHjQ4XssU0qthshPNpshhBAYZU7OacQ86kc+YmT
 nQjZYoeiVGROy
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=NODYOk6g c=1 sm=1 tr=0 ts=69452427 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=r78XHnC5kAO70zNBxnsA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: in_lSJSh_LE5ZlX88Q_os2jzxswypDM0
X-Proofpoint-GUID: in_lSJSh_LE5ZlX88Q_os2jzxswypDM0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MyBTYWx0ZWRfX16tT9Eqy1yF/
 WyJx1hOBUbBUnRPrsvH4nMIlIVQJq7mjpY+zyycwxjGEiQBwCT/jo5VYz+UM2tXtjO80x5/6Wnt
 S6sJatMO2ZhqLKYCltBceQPdAo4ZTcN7KNkWuOMUVDI9HmdP378+++07Qoar6QYvm3v6UAVVir9
 zu6tawmJ+x9TzGzqTiajdSR3v/xlAsEKwbUbGhTsxQ7RGvDOI7+ey2oWlK1zLKwXrUPKO+z0JN6
 29IunCa4v9onRaphQ0RjmGSKO1Rvleh+XaFgewIQe/o68IhkgbwpsNJgA9QYdruvt4ajmMkkoe/
 1doDWphqr0bq93H7o62gLzFr+vf7WolnyFyIBkCHB3vMle6U2P6NxTOVHbbuamepZEjwh1P8E58
 KNlvDBa70RyHFRtNTa/ScB5N9Tnumx1zuvipqy6xwn7CNKpYvfqE5+LP5GjefD7PKYIYkp2teW7
 ezTr7/TYPXWB8+JeKTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_020840_207906_BA65A955 
X-CRM114-Status: GOOD (  14.56  )
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

Switch to devm_kmalloc() and devm_dma_alloc_chan() in
devm_qce_dma_request(). This allows us to drop two labels and shrink the
function.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 39 +++++++++------------------------------
 1 file changed, 9 insertions(+), 30 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index c29b0abe9445381a019e0447d30acfd7319d5c1f..a46264735bb895b6199969e83391383ccbbacc5f 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -12,47 +12,26 @@
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 
-static void qce_dma_release(void *data)
-{
-	struct qce_dma_data *dma = data;
-
-	dma_release_channel(dma->txchan);
-	dma_release_channel(dma->rxchan);
-	kfree(dma->result_buf);
-}
-
 int devm_qce_dma_request(struct qce_device *qce)
 {
 	struct qce_dma_data *dma = &qce->dma;
 	struct device *dev = qce->dev;
-	int ret;
 
-	dma->txchan = dma_request_chan(dev, "tx");
+	dma->txchan = devm_dma_request_chan(dev, "tx");
 	if (IS_ERR(dma->txchan))
 		return dev_err_probe(dev, PTR_ERR(dma->txchan),
 				     "Failed to get TX DMA channel\n");
 
-	dma->rxchan = dma_request_chan(dev, "rx");
-	if (IS_ERR(dma->rxchan)) {
-		ret = dev_err_probe(dev, PTR_ERR(dma->rxchan),
-				    "Failed to get RX DMA channel\n");
-		goto error_rx;
-	}
-
-	dma->result_buf = kmalloc(QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ,
-				  GFP_KERNEL);
-	if (!dma->result_buf) {
-		ret = -ENOMEM;
-		goto error_nomem;
-	}
+	dma->rxchan = devm_dma_request_chan(dev, "rx");
+	if (IS_ERR(dma->rxchan))
+		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
+				     "Failed to get RX DMA channel\n");
 
-	return devm_add_action_or_reset(dev, qce_dma_release, dma);
+	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
+	if (!dma->result_buf)
+		return -ENOMEM;
 
-error_nomem:
-	dma_release_channel(dma->rxchan);
-error_rx:
-	dma_release_channel(dma->txchan);
-	return ret;
+	return 0;
 }
 
 struct scatterlist *

-- 
2.47.3


