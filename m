Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41143F46139
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 15:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=; b=X3EeWN9pTtPNO0oJ9xkaUDo0cl
	ExWR1z9wKc9KkJ87lLm5dPFkgSEnPS87olvAphR/YLHofOpUN+hLaKrF2wvb+48WPlbjqH36YPOS0
	EkOaj34AVsFsuf4hAfToMRVkO+baCQ5WyZKu8BkLeiRaGxO2SHE6N19SZrFj8pcnm09qSq8YzBaTW
	n3CMKcgfuKMLAdRyEXruiz91jpLzcH4S4zhM3bs5+5UQQIF9NwdbB0lgQtBhVtaIEdr5H8kcumtC+
	7uyPJnOQiiMHJruTyWyogOTefkOOB06qHt2ps2W//6/OMjEohpIuT5NJ4F3ehwoAE8vi2nhW/b04p
	pTfm5shA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h2j-0000000H0Rh-3DO0;
	Mon, 23 Mar 2026 15:18:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h2T-0000000H0Ew-2lwf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 15:17:59 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGY0x021501
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=; b=iMqbd+8jDFG8wUga
	CcAfEqrkXBhSqKa2mXvbxhMVq27SxEF4NFxU0fYhH2zkE9AQ827iCpiT8W0krEvD
	FRKYlEzzZNsyx5yLBaobqqSp38YUrgh11j72wbi6Z99og4kBRRuX0DUGKW1YcgPb
	JEu/rO8tCeQGHkzdusiLa5gX9Feh7n7xE442r/Ocj0P9fnfOaNONqB9qp7GAEy75
	telyxJjfOPRgmo0iAHvDQ0SUZWsKqZMYKESaYdFI1uiiqnQL+/CDel8vXKInCJyA
	IF7+XVgJcr1ObmM4T+odC7PAVgykfDysiktvMlq1FqHahth6YzPFHQyZRWHGeCX4
	YhPyMw==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k311tr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:17:56 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-94ad0d8eff8so38919436241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 08:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774279076; x=1774883876; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=;
        b=hOyO1SZYbRKhBd05Cv0ZGKrGyFQRM5PKJVu5EgNAUs+RqlcQfkEwgzsV63DE7IlaoW
         S96uk5gfVGWPPnzd+ZMBUx27vYT03h1TLKi80qXYCiaZ1WgqL4oXSFqeJ5FMzOBMOIJy
         3ogyFgOg8o0gD9M5GCmh1TnsXVilvW47eavd2yL3EHu21KWDUB0yTrw3gi3rIQuB3jV9
         siYX8uh9fS0lx/0AD/L3SfvtZ5FBzSMtx+BGaF73bskC101KXOP1s/mO/Uyge/5ndAqj
         baWTGjMYx7b4D+7x9UTMOsBELnYy5OyQVE3YjvLJg0TeBHSLBWeEzCd9X/t9GxE20EIY
         4rpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279076; x=1774883876;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bP+u/9sMDsi5B9HZu73nJnAW0uvD7B1160U6L0iNO8E=;
        b=cPNcrBz4G1vnoayjYZioXck5c94gB3M+T7VmoS4Tfc5VFld74SXB5RDS/s4pkYxjdJ
         gjPWWPnjUTc95BeVLZU3R7j1x6uPounBuNUkur+i2L2zvy3MQK+JflphL/X5LGZSetQk
         ylLNtGmt2MQ3A7OAK9uNiIHTzOzmbLj8hqfxY3ZvGE4j/zOYlS0ZYXSkWW1dRl9EvZLq
         DlLAC4JWdknEBgTAuk0QCPc+6D6dQFib9bBJo8Mwb8rmDmGWCQkTysCRNHh7Lp1f+gk3
         yR3ZKsWN3tI6lE8BflIw9xSvHb7Iw3/pvKgIbLsPF5MdGFZ128JcslkiEr3y4IULI+Rr
         DCJw==
X-Forwarded-Encrypted: i=1; AJvYcCWOGhwkeWLGkZJk5qshqCgueSi1KGOZZcwvcXqVgRyqPyGX2JWIGt3z0+UrAgvO8o6kYhXhT/Qp6NAN54mP/GXV@lists.infradead.org
X-Gm-Message-State: AOJu0YzVsggTBa6sxmEN4rsWiN6/v/UXNGShxhJq/vrOiyJN1rO4fOib
	40FToCKZvnap+dOyRE/QWgXtnP0rNUCaHZErgp4ppr63tRejP5i16/kW1AwGwgnnem0LI/kNcWQ
	UkGo/D1jTfkUpLYiBCbuvLuaJNuIJrm/Q5nFJgOg13VexUKRtlWF8W/G1soAjD9BWYj9O8FSHKB
	xMSQ==
X-Gm-Gg: ATEYQzw8nuTBt38UGwUMdpzMx8t8lvcNFtsYhR+ncisNbQ9voucyA0CGE4W8dRIQBya
	eXxb1WUwyzOVBJZYHnX+0AUix7thrZj3cGKFYwvQiSKNY2mSOK+/ZIeNqHIj0MfnsEDnR/xdhzR
	NC8HVb76PYtiuimttDjGMppR2kOKEjZuXiyb3/iXxf2wny4AQm515nv36GmIM3jAfBGHIFxog7F
	b5fY1Bie3uF5AdkUq9J1z9Qdw4c7SXA5w4vOsf7eig07qUn/QN6ljHN2A7w9ZXUBX613w16/g0X
	F86QfNt6fTkUQmaeaYmPm9BHEtp8Cv3v4q4Z31kdDJX48LJyteTq3Db09RpJ3Izhzi8LYnww2LV
	rtlJowm2WrmsdXEuRXBzetqf4qsDqP7N4gFhvgztFjiA+jzKwVtMW
X-Received: by 2002:a05:6102:c06:b0:600:d0f:bacf with SMTP id ada2fe7eead31-60295c26f91mr7717447137.11.1774279076023;
        Mon, 23 Mar 2026 08:17:56 -0700 (PDT)
X-Received: by 2002:a05:6102:c06:b0:600:d0f:bacf with SMTP id ada2fe7eead31-60295c26f91mr7717424137.11.1774279075565;
        Mon, 23 Mar 2026 08:17:55 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:f9a0:d7e2:7eb6:79b5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644bd923sm35936993f8f.12.2026.03.23.08.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:17:54 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 16:17:15 +0100
Subject: [PATCH v14 09/12] crypto: qce - Use existing devres APIs in
 devm_qce_dma_request()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-qcom-qce-cmd-descr-v14-9-f323af411274@oss.qualcomm.com>
References: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
In-Reply-To: <20260323-qcom-qce-cmd-descr-v14-0-f323af411274@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2266;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=azGHQ+ypZ4Lhe2NPlFIx77n1JCkKbs9Xx9/yXH7ccEw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpwVmC3BbPHKUcjTHe5TMiO9yZ10QstnZzV0KUR
 6F5bvI+cXWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacFZggAKCRAFnS7L/zaE
 w+PoD/4jky+pkIFkSZLdWX+ThdxlM9RmeODxR2zkQT6LI57HgVk3z9BMCHOQ1Pz+OT/TA9CQ9Pa
 hXgiG0yEC9HzAPG/BRj2TrT9xW2Pd3uWJC/YrJ8K6e7+8StGnr4i4blBASj2JACX+3grCEa87ti
 l8QZyxaI1lf9Y/Bdp+Ir5qD6Lb1h36J5hTJpT/ejECOzGNWczCoEC4WR+gtKErgAcAN9uLw1dF6
 kEi8NeSIepc/u0MZzAg8gnbtpE1xbg6DTk4BaoKY1e3u03BP3+k39hy5byPZsYjR+kYrTIc9BHs
 EJIARINSvQXi5b0xbRSRU2aptScYC6NCtpSWErfUnjQKay6CX0/nL1/9QIoLD2VKNKt67Fud60n
 +9ud9d11eAourrQz8CfxHjzcHdjQiyM6QdY9pUhN7vCZmQUrgoK6n2JuNSgkgeiuH+EtIKdY+Hq
 yLZlRPPr7bAIyoy6jvD8Gm4a960+4mhH9mBmGJLXIGhF0fKxgesM+1MR3rCce6C4nVl5ou37pxu
 y/kX3I0mvNVxEPsUOaBNciWbXxzlo/uUK2EWoBcv8ua1U2pQwiNJpWKSNpeG04FEuim21W60srn
 8XgoXRsMXbYEDQX0KHMLCjwltIhidgKB3zY2dSjwTxl5StlU9tp7jJX4m/MOGFQqqobVMylscmi
 yWsF24FWKBVEPnA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c159a4 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=r78XHnC5kAO70zNBxnsA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExOCBTYWx0ZWRfX4JjSi1knwVaN
 Ndzm5labLPwmsAHfFSkmoPPt1StViB9OQLZlqoDeaSm7DRnXYsj8U/G1H4nDg6JupSAUNwPd70k
 p86Iedw31Zm4oa4IbheIrE/NVO/t1X1g1Tcls7U1YQ30i6Zz8f9/njrlD0iZi3OEQm/e5mRoyuM
 YlIvKhJykbU4Vj6PYo+bKLsZXDiJa8TYsgqplHgOni/VkPy6oTh6CjFNQLM2HriR2AEcL5edQ2H
 id3w0Ej9b0u/WPkruN8g3qhn8MJfA2cbzfIcpuBv9rEz0k2a+/ut6NZ0C2QNoZpbbqQVeWaCJfM
 HxsvTrR+fwoun5f0K/Aezm8iJlKYgndku1GeLebWr9aEAquzDT902EE6SncvOCNkYsg53vAhqvM
 hlMfNJ0mhXRrASQAMqwZE+IhFgAVlxzxRSnB+X44bkwjzOWLwnknYO0h4tm6mqNPJCI2+iG4gEL
 sLE7Fg0CrMs36dUCKaA==
X-Proofpoint-GUID: Y_RcIZ1VVJTq01cIizmGKpVGB8UcUp6F
X-Proofpoint-ORIG-GUID: Y_RcIZ1VVJTq01cIizmGKpVGB8UcUp6F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_081757_899272_BA0BC645 
X-CRM114-Status: GOOD (  15.47  )
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


