Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488B6C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 13:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=; b=F4uRjmSj5Oy2aSnf/dZ036uVy/
	tlLIhHtdPH7bhhCBoY+VBgiuwpiRN5gdggZPPjkUUAVLS6oU35TgdkqHC9Wr91ucw9kvh7fphfoWL
	0pJRWTBb/cRDzraztGJhApxMPOkOmJohA7SWW94xoBb6TCQ3fvx+vE1uzXxix79bn5TGyKSHK5y+c
	XSt3XmYbvFApsSke9LZblzgS91daaO6YK2HGQwwjzRsmtDV/6vfQw6N9SKYLgvpEQapvoNJaYn3d4
	XhXyogxfbOhXY5Nlr0n+rkW6TNGELNh1xuu4edXdMaFVUTdPXMn0uuwdA26oQFJu4TcQqwK9h6TYg
	5TMJtH9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAcI-00000009Xlz-2Bi9;
	Tue, 21 Jul 2026 13:34:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmAbq-00000009XH4-2Ecw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 13:34:11 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDLu431890679
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 13:34:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=; b=bNrzb8VOaSdLwG18
	Uf7Lr3urSx+Hph/rhJmXjex0QXi6DfJaoGa5KQJh2A72Kij0zcjOBZIVtmWH6Z1p
	yoqulvx4wCdFe5IG0Y4uENqW0taTKw5YfFFXguylQCPHN708yKvU2QqXBY3c6f03
	CxwKkZ68NB4pEGbEz5M+kIApwc8c14aaNxkuSOH4zgEzfI9lU0InjaalPQGRxE5B
	qCkXtVD7mrO8nRz3oDd/zoHmZMBeWhPQtKfusH3vmKqEghJUwCCSf3y729ycWIwm
	w8wANwDCn4KcrFn4R32REJyugaV2i8Yi7y1fced8GSTkudt4589rmecoX2nQv0FW
	msl9HQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bs83xq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 13:34:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90284139cceso85523206d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 06:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784640849; x=1785245649; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=;
        b=MhDS447goLeRID7YjYon0WWY5EBjb9mhsSbAnOZBZfHMZoZxlKX6Q7/ViFpM0qqJ01
         lfUJFM+KqcAN5kkWUvyguSIYrc7S4s1dQAsIXd9MZEdKEQbO4zzDj1v3PSGH6dOmDmG4
         UY5GRJiBng3uL26osarymMFqI8SKzFVO5E5iTR7iiC/ee1QE8HJFN+Royo+YbuoBIahC
         LvF78sA7cfWLNuZM1cw7GqBIOyLsTbYgJZjOBBzodZvKjFRIhPK012wamIKzEFx7C+/B
         Y5LY2VasUFHdIyClvf9gErvoEn0TIj2ZfBqltFzl5gMy1vAwMc1SRgnyfsroQ0PSRrje
         KT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784640849; x=1785245649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eLuzW4UoyjLIBOHVkT1M1Bap2xQlYADrM6wCNEKkohQ=;
        b=f05v8YfVWoZD4dRizc9maNrjON32tgUR/3PWr6tMM987q9By1FFg9YuQ1jZkAWtRdr
         Xl1Aufqc+jlc6VY/XPtgKX8RmPhDhRyhZ61z+w58i7Doi7GU6neY0R/4ZUwSKc1pjtCa
         WwHD/GO/2T4jntXvXjyXIah3i0SZ635EOSg1a71N6y2a4aZsxsHQFHfW2g0z2UpcSnsM
         4dflr2SDP+yTJ3PLA1cc3vZWs2S/202eubiLVb2feKtBucxMelC6bKcCWzmDLzegLn84
         /I5jSZsqIhNHE/Be3pouX7yYPOzsZCWg7FVZ79ewQNgs7UUV5kZmeP0W0k3d8+fyzuOT
         vSTg==
X-Forwarded-Encrypted: i=1; AHgh+RrndEzI/cbWLGF7Al8zcHEDNbL8u/1CMAZWj4aO9ULM3MN7P/2/RHl2GYIFSt4z30XZQaHbi99e9a7kJcwvjGt8@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6bBPgdxguMnIUjhpQNbhKeBKaupiLzaCuwoLIVKrjaqul/1jU
	nAo4r2sDKjFgx6AgKh4pmozMMUQfW6RbIW+nk6UjWjunSir8YHdII+HhmB2L90IZRVIxPz0tgjd
	vlxyqrwJyOMZW/9Bxmu2NywyQIeehu/pdd/2t8Mb2jD6q8z5BxXOFj0rlEmg8uYiBUDl7B3LsLK
	6Z3w==
X-Gm-Gg: AfdE7cnaj/QvleF+oOcjoR0SpDYN48ypIut7dN57narsTrkMoYu3geRdt/FA93xgvQr
	vZjkCFgIFh1zdp2OsSu5iygV69n1z8W5Zj23chNffeRuXmEeA5F5fYrnezkB/KxkMqXwAyxyS7W
	K7GcdbJa6XMZA6SOtVRbg8H9XW83LLhp34M0Qb73t2hnPZi1IzHHTKBz7jdGLNrFukFJkxITKGd
	QpnGGfSj7kZk7+CKcHABksgTu3ziIT0d29D+LNcCZupGRvKjcfK0AoPtlOfBTJb98zdT7nD8GDF
	24SXzCsgrPLERyC8T5eH+NAiGy1Mblymu7sug5QWU8jwxMGZaquOvmdE1b8wzs/POZWeGz0FL2x
	FjQbMn6B4aMfBRPAZYiWdM2fDmwp89g==
X-Received: by 2002:a05:622a:180a:b0:517:9407:5c38 with SMTP id d75a77b69052e-51fc12933a8mr214249121cf.24.1784640848999;
        Tue, 21 Jul 2026 06:34:08 -0700 (PDT)
X-Received: by 2002:a05:622a:180a:b0:517:9407:5c38 with SMTP id d75a77b69052e-51fc12933a8mr214248451cf.24.1784640848419;
        Tue, 21 Jul 2026 06:34:08 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9dcf:9ab8:bffb:ec35])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495499d1d4asm237901185e9.2.2026.07.21.06.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 06:34:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 15:33:16 +0200
Subject: [PATCH v23 11/14] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-qcom-qce-cmd-descr-v23-11-1be02deffda9@oss.qualcomm.com>
References: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
In-Reply-To: <20260721-qcom-qce-cmd-descr-v23-0-1be02deffda9@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2502;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9GKLcUmlCf8HlWjhhByBBy4VvPdK7WbPpBpBdYahW+0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqX3UnilkLGADgQanf5CoLM+EtXAFOMj6jWwzBH
 LQYyN3el+mJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal91JwAKCRAFnS7L/zaE
 w67WD/9qMG27fKE1FBdPDfxrHY4ToxuSnX05+cNKbh2lS3GHPkXwmoXy7ylnG5HIMwEtB0/Gtqg
 NME69dDUowuLy5BEd1BbM74oJabRrIhpigkKamMwJC1qpHRaXPMPP54qpbbPNEgt5ZnvY8kG2OX
 MPakkw29VOOvG69FYZqXeHoVnFWoD4MXDCea5HybyWeIhaCQ/J4M4NdQ7Bhwu4kTxTEoLSer4/x
 jjH5mJSW0ESaWTLRFS5KWlnliH5ITFaMbzglzYVZqr6SFZfDawRH5gv5aya7Zu9LPbsm/X0EVWG
 c3Rd9sOkyWu0Wwgq/3IEZ+EVhHPfjPr+VLfrB537yTn6QmQC3z1R4E3q/lI/8iLEEjcFOynG4jF
 er+yArLEIc9JaoOaKYNF4h89OjDic6RX79e6Mp5IvM2wrrnPuCOFLTxEgsKeXo6aWALioo4liI6
 NxUBn7jB9D0/nOHtJluKrmf46rrlt+6d66aw3Tc5s3tsYQ8GLZ74boBGj5pOxPZC4GYydmPgcPr
 TH0w3QSVihaVR1fFs7pjsah4mUngg3sxe+DpafjeVRujWB+TNKTbOOETQwdOr5EYXE85mKgeFCo
 idTcZogpmlSa5p+f1ILe7Pgl1SVHCUpoJcGXuZ5tofk9xtX8Y7hpwCAnqE1YhWw2m33EtWYKP2w
 6QO9I3w5a95ZndQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: pH_u28YjaWQB4ABXJPXpaRo_OtLz3RFq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX0izsHPBtS4Nw
 HUlDXhc4idUhwWaae4VXN24wG1Lgg9VnFpw3sb3/auax8MbMFRzOZBZ4sjGZgwf0swfKhujqhwd
 BpUkmhWInEIcwXKdnbd2XkHsE78FG7S0U2aQTLQw8stfNigwY7LbiiOOpHixkUSAlbfJ0fPdNeg
 bbM5pcqcLGNuxB+xt10ZoNKAw8p7SMDr/bb9FbKyjRritXHCLQrnhwubdvAI6KmpN1r0VHjj9pz
 8+BGKEj/si6QvGDfDvdKkIx76/48W0Fof2FS744wwebHrBPKKi1n9XkzOYJN5FXlfSP5A7TUpof
 o/Cb2Bq4oC/4XU/OsIhbvvtxGP7Xzk/WL+k44KMoAUDtRSMJfqfWwSC6tR7ab346UPOnY5JouEZ
 +Ns6qgSyPWIdwCX6J7LvaEENYkb6ad4SD9l5E5EEhoLKz7ueLYYUo4HFhHFQZCfO53ZyzgtTJcz
 rdJ0AAebEdbW1Jz2qBw==
X-Proofpoint-GUID: pH_u28YjaWQB4ABXJPXpaRo_OtLz3RFq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE0NCBTYWx0ZWRfX97C4nRoNAoTu
 DWmYk9FBeVLbd55LwFSfN3OkfiPsiNxlbk4kN/JrKCUDT9EeYiqegEGmK9OTnwZv/l5aweoyQgG
 vJQEfm3jvKUE1kF1HgOniEmlVE3G3Gk=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a5f7552 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=rzIBUVXPi645tD0pnwUA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_02,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_063410_601938_5F6772C3 
X-CRM114-Status: GOOD (  15.79  )
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
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 37 +++++++++++--------------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index d60efb5c26d88f8b0259b1dccc8724d0f75571c6..26347e9fc078adede712722107e74958538accdf 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -12,49 +12,34 @@
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 
-static void qce_dma_release(void *data)
+static void qce_dma_terminate(void *data)
 {
 	struct qce_dma_data *dma = data;
 
 	dmaengine_terminate_sync(dma->txchan);
 	dmaengine_terminate_sync(dma->rxchan);
-	dma_release_channel(dma->txchan);
-	dma_release_channel(dma->rxchan);
-	kfree(dma->result_buf);
 }
 
 int devm_qce_dma_request(struct qce_device *qce)
 {
 	struct qce_dma_data *dma = &qce->dma;
 	struct device *dev = qce->dev;
-	int ret;
 
-	dma->txchan = dma_request_chan(dev, "tx");
+	dma->result_buf = devm_kmalloc(dev, QCE_RESULT_BUF_SZ + QCE_IGNORE_BUF_SZ, GFP_KERNEL);
+	if (!dma->result_buf)
+		return -ENOMEM;
+
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
-
-	return devm_add_action_or_reset(dev, qce_dma_release, dma);
+	dma->rxchan = devm_dma_request_chan(dev, "rx");
+	if (IS_ERR(dma->rxchan))
+		return dev_err_probe(dev, PTR_ERR(dma->rxchan),
+				     "Failed to get RX DMA channel\n");
 
-error_nomem:
-	dma_release_channel(dma->rxchan);
-error_rx:
-	dma_release_channel(dma->txchan);
-	return ret;
+	return devm_add_action_or_reset(dev, qce_dma_terminate, dma);
 }
 
 struct scatterlist *

-- 
2.47.3


