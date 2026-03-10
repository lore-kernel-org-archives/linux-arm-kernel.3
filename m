Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C37AEB1070
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 15:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=; b=4pZ+PDfbNWEQIv5sbIezYetu9H
	w1K641SvCOLZf34ledVFDLhpFKbki8w2B/KxGBvMe4LzJa6Xed/1ajdwkEDHR7ExbHwaMvhxoS8cC
	5oH365XEoS9lE694nbKRn4sMfMk4fv/krrNYHBBVfSR4a/5mbFXiFuz4QPWcvic0N/yRkL0xqRLiZ
	rq5hNphBGLqpR1rmmYH4fuibqc3uy+kXt8z+oSJ7QIF8iLo2mWX8gBuPDgypeSQ84nSC05Qmwe8qs
	cVwN33fAvrnI/l92lpgqfinif44W0plww7vhIFLOvlTL3opp6Loe1mjeZl4oQQJLk2cQEVFelew1y
	O03RJcqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzGk-00000009qEm-2ToX;
	Tue, 10 Mar 2026 15:45:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzGa-00000009q2o-3wFH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 15:45:06 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AEF0x91863207
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 15:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=; b=V8oRJsoTrmUec7Cl
	Nhf21RUxYttu5cmPgUVMt2Z8NuESdP7FosY8Xv1NI3BvaTNeZR13EJrBHmJp5iHE
	nX7DCnXrAyWzR3cA+2eeY93q+OeFMmcGMblo/NYI1sDJ5s4EXiqC9JPr6bCXhrJz
	veCIk42z9ki9gbAvw29OsmuIwUdJOmuwP82jU+nC9ZpAy/n7JBvw8CNrliViKd35
	8Mv9hfGxyk6YbTNgKUWOCnYF70ADyMVxd/cORXG9XoE7IiSUVsd1l2yxan1He7LN
	yeM+MWfPx97b8DFwg+FCg4XyHq1kiNzqKEmZe0VLEBx1m7yVx00kNXujyv7chFXF
	QVKRlA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctmw80cg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 15:45:04 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb0595def4so8832585a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 08:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773157503; x=1773762303; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=;
        b=I2TTbf/8y+cTbOYxFO8AEc+OfYcqntP9ogcK/MwlN9Np7o6C9IctuG4txb+g42aokR
         eNunns/TBIZ0aiyI7jI1P1fYzLua1KBin1P/WOZkPfrxaw3vkWheD4XEkzIWAaQmCx05
         EKa53SpummAFgACI/g/mXUkgR2WCqUHJor898h8nx0zeTK6Tp29kehTZzR8n/OBXMUeH
         m22c9hSJ06KG77j6/dDXqm4suJU+VLYFeYE/BvGMZTQQKYAFb3AW5jQd7VC7fT8IaUhw
         hXI4MHfO75FZp0pfaOEU5yCgYBqGmheWCr5/4BbA0byMqXMGNKOC7fqIxnBkfaGDiq6b
         qCqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773157503; x=1773762303;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=;
        b=dHvp0kQjcN6tKTSNJfliUSXKmSVphvDCtaOKLw8LiaT0zEWmQ3mVAnVJ2kXal8t3AA
         tGrgXVcscRkkR7N5qDbgtyapz46EtJTDLnxQ7905Kr/cZwIZeREB0y3nFmGVpjjNK6gR
         JuQ9oleWU7ZVLf+v/9/WyHn/QI0erU0CgVWPhhuluJJgWRgt9rIZ9Bg6OgILvkK0KKkd
         rCf6XqqRd4zPikfKEFP5s43/9M1CriW93wBysGVB5u1ZfIvYUnkOGUNlno6DyLy7Ti6J
         faVB0t5sPzxhoLgeY53lBAFdXmdPwe7CtXvPHIsB8JdDhPVLlrAZZqZI1OReCLK7u7if
         0M0A==
X-Forwarded-Encrypted: i=1; AJvYcCWYPHRrVCRGlRbPXUtdDKtIgAVZcJubrOkeT30/xICkvwiyKb0otYghBY5y9UwHrrMvY9or58wWJb7UfrvSr+mF@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6/gVruoxx//ICOpEJRPsY8Ne3KSwWTHl4DNvxIOAeN3M76Gkz
	Z7cCUS7+2n6cyQfHOHWmbldSr8MQj1zN3z2106eywalzGlyenv6v/m9NMb+pfEh7+uFYL6H5MnE
	NNwPn25PJHSpngCkIDPpNGq4tqHGu6NHVvvxYEqvImIkPRThWccLlcgCoUxRSt2yQUvmCmlQyGR
	Bpgw==
X-Gm-Gg: ATEYQzyUo2tHwRCkwglbaktanaLg0gsy9gyJ/U0Et7HwxibdN+VtnhpNrPlv5g2TWZw
	OtF9FPX9aeJLV0WBLNGNllDyQAJdbFlrdm4HrMIChPxxpr5fyXaGQo2XoamdYWnLvhIC/tPeR9S
	PN0vFm+fplZqD5st5KA0bKLnyvnZxUnetGMMj31uco+w+CZmSJ4KLP6Z4N+slIdFFKTJugPoS5P
	EUYZzbM5NT9Vy/Uc5FGLAk6oYK8300gXXUZ2OzspKmX+1g0Cz1NtAtcPttvuXsvI30vV+JrJKy3
	/wcSa0O789dPeg+e06BjxpGCKxf1EDEhpLT5kG05MMS7UmXvYQqENw45xxaJEohixJViZYgKc4M
	zuGFdLQfpXJ6vTLfchN7HRAtCsDvmfYa87cKyC+Wh+Q9m5y8qiYRC
X-Received: by 2002:a05:620a:4049:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cd93b759fbmr440041885a.15.1773157503284;
        Tue, 10 Mar 2026 08:45:03 -0700 (PDT)
X-Received: by 2002:a05:620a:4049:b0:8c7:3ff0:d472 with SMTP id af79cd13be357-8cd93b759fbmr440036385a.15.1773157502595;
        Tue, 10 Mar 2026 08:45:02 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:47e6:5a62:7ef7:9a28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d968sm35991600f8f.6.2026.03.10.08.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 08:45:01 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 16:44:23 +0100
Subject: [PATCH v12 09/12] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-qcom-qce-cmd-descr-v12-9-398f37f26ef0@oss.qualcomm.com>
References: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
In-Reply-To: <20260310-qcom-qce-cmd-descr-v12-0-398f37f26ef0@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Udit Tiwari <quic_utiwari@quicinc.com>,
        Daniel Perez-Zoghbi <dperezzo@quicinc.com>,
        Md Sadre Alam <mdalam@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Michal Simek <michal.simek@amd.com>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        brgl@kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2266;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=azGHQ+ypZ4Lhe2NPlFIx77n1JCkKbs9Xx9/yXH7ccEw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpsDxoASiICoA9hleQ5opj9eSOBzzMms4wrV+Dg
 aMURjFNjU+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabA8aAAKCRAFnS7L/zaE
 w0P0D/4/AB/FkYe92/SLONU3+Sd+/cg7ssbvxxZ4YdW6TzgTD5EPbsXwa5V2U8eZptNsSES7W9i
 bOkRPDby+BLPHUq7wSC0wakdBUWSKs8N5Q6CW1vps1Ycdqqygj7KMLNzggMIioK4sGABSYx2owS
 jf1uRNQTx5aKiW/+tNGz/4YVdDR7VMCoPBTucnrazXqWgbiAIuyJKT09gfXxRdY2THAh/fZtcbQ
 kPJBKUNdPH4hbxX9LXCT5OH7ugnMkQ8yTvHbaKSecBSFqP21FlN06d1WBYq53O+4f+4eWcCZ0V0
 7cXs1o24/VQQWflsWPim7hIs7OLhMd/N38BrCEA0FCGp6b7wBmdmq+P8soN2NwTcySK344MIf8M
 /zJlHydGUfxRQmtQL4e6Tb396QmW7oAs8+6wG0MHQ+dakS07vZX2c4bIxYkO4QN54uSvg8KnGIZ
 XEj/1ujU0LOFJxRNL+w9pr8FuwhJn3X8qGPDDtVsz/Fgmv9ToerLZgFIArY5zyTsNQatpA+NoA7
 qbbudbHqRdtuwrKQ3V13NBLhKmQyjGAFD4gVJpDJ9zqijBCrm5+7P5xm1zUKNdAAUFnZyQSndG7
 SjMqnZgClxvoCe+efbb64GpY/S42RZZVmOZ9a9bd9TdS6kdAgnnIIn3OnUrWhbCVgZQhs8C+UPi
 3I+FPzpjDlQMscw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: UoTqyKL0ue73lx6nuNuNTgxtxHPrsFf2
X-Proofpoint-GUID: UoTqyKL0ue73lx6nuNuNTgxtxHPrsFf2
X-Authority-Analysis: v=2.4 cv=PJECOPqC c=1 sm=1 tr=0 ts=69b03c80 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=r78XHnC5kAO70zNBxnsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDEzNyBTYWx0ZWRfXxx6G3OtDjVsz
 aJzrwD1XLHNv4LkTZVpn056OF+qaaYyXsBvjUqffK7ZN24wIc7Xp7cA2h8FveRma4IcVd9KBP0W
 dy0REWR+3VehrGzHeK0/UDI5rWm0mH4d0jLTXE0VU7nmcriK3i6X3OZgCTTM68Jw6jjGVu4Wz5a
 66QhcrB6VQnlyFVu+E6nKes9f9Khe4fU1xIBexr7Ak8xviSBElt72v/H31dzlicogjJs95qMcdN
 LF2phACk0a/ES5itj8G1tp5LxzR5L2oE8liXGrAaSQxlG+qYZPyuvAbijqSX/Ryg4CeIdwB4HNo
 FPq2egmFeG2p/q6rlASqEApB2Z7NPvtkUBiRDyNR8cNSN0fw2oUMEz1t3IQOWCHVw1FzRLzWkhm
 UI7UAnoBgGVdJvQwc+nhkUXq/HhdEtgX55lJTXhIwJiDwzarP1picW7cyT0d6787XZL8Xv8Ha0f
 q3jyWTOphcNsrno3nIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_03,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_084505_011798_A8DD399A 
X-CRM114-Status: GOOD (  15.40  )
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


