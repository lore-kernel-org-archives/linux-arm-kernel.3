Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C49ECC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 13:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MsWDKH/w5P6MtO/VNux/FoMTI22L7P5oBEgCNW8qbYk=; b=Oz7ChMVGBgw+WcDjz9FtbvTVkX
	dxxPWLx82UeaqX43Ku6T0yf1P9TRvqDoP72btV4J5zzXpeG4oqH0Kzf1aWvKSbIfWfulRM1kg19Ir
	DeP6J/g6Dn8VLCnbeU7EDqjX2p6wbNCQmSwi0dZ0AI5+8RqXFv8W2nxtuJKkvboC5hTcLBWlE8mQO
	38LcBO7lnXrgHpsIbnTiqhwjtF5eGN0Qm1w+RiCsn6UMYx5yqMHtAZ2li451fg59lZAScmiiP9Y0M
	4oRuo49STntz1RugJTzKHA4NUHgjwXxihU4ChIRFyN0rRT69AVtNT8E3elf3YfkDJUX+C7p9d9PFm
	JqAqRm2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGJI-00000009J4o-106j;
	Mon, 13 Jul 2026 13:03:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGIY-00000009IKX-2mbo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 13:02:24 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCE0T61210044
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 13:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MsWDKH/w5P6MtO/VNux/FoMTI22L7P5oBEgCNW8qbYk=; b=NMRute2vZku5bVXS
	QiIvvm9xeyBMm/mv+rlCvBNNpOJnef8oU//tA05q5vNoSvGUNyDoVoWq3zayf/CK
	3ETL9z0O6xPQigL1KSvDFL3eSHcGikuV7BYFggUtg/EmVIGsWmQEM1OXkcRF1ume
	GpWWL8fwdDsPbMhEZnhzXqzC5nPGTuYXO1/EOAH9GMxVqowSnwiui4BIRbwz1BHS
	eUnRZKYWDBKPV1vnR2qjg5RhJ8PQ+GSenAxYMvpON1z09vPt1KwjpTdyI9WaDtVd
	qtAQw3oO8PlvylR0t8935vWJNIEuJQTyCo+9fiU0dv23l5ONSnApGHKyVVKEGR9B
	lvu26Q==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcw4qrtgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 13:02:14 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-48f0c5d20c6so5515945b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 06:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783947733; x=1784552533; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MsWDKH/w5P6MtO/VNux/FoMTI22L7P5oBEgCNW8qbYk=;
        b=hKV39MzpOX/hePU8P84cHUwa3nwoIjSS2VIyNlfq6su37DuMJ8D6mvdj8gzhAOchW1
         /iqBYxdk+Fl3aekWfI+MQbMzgGbwPk27UqdpxeZM0VWK4TNA7RffmcOkmP2SF2Dq1lCm
         Oir4OmZazheUmOLtZfGrXHJrCuVnukE3xSqpw/8/UAL3uvFggJPSC03tWydDtr+Zk6bz
         KCpxlhfzfnDxSr1lPuuNnahM9C5r/tHh+JydT6zHHNYG5WGp7gqO4jx9JazULDJUHcWQ
         yP1VSycj2Rx4QHkptW0IpLSBTkjm7LRzEXlKiH1/JJsojGPLxIQjVWnP4c4LFkISaKqE
         6NqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783947733; x=1784552533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MsWDKH/w5P6MtO/VNux/FoMTI22L7P5oBEgCNW8qbYk=;
        b=flF3zobqWyW04XBfd2xYKu6h7aEkwqRN/Bi5KnD+sjc25M9zbwrueWn8cZ8ajGCyqI
         JzoUS2jVQiWRp6vzozcx/Y1sOPItQySoCc7+cSrtstKvCHJEHAI6eL+TX51fPtkElSaO
         YczEvwFaUcvUpqP73Ntj/fToLf364u0zST0NqkoZLS5/MENcrnwBfoRP9BsAGeVxj3ZD
         aXgxFXAuuLQkPz2+Pk1gcn0+6CHZKiES2ZYEIvW6Q3QOTn31HlhmHxZ1tDLrep01IWEn
         C1NT97m2ZZM1isV2tgEFALDX9lodDufDs5bunr97N2osKrf7vj42yW3d+2AkE4evPsvF
         BArw==
X-Forwarded-Encrypted: i=1; AFNElJ/yG1CAF1upgyzjLJJQ95fX04Pz0XeaeBcDpjPE+9QgYRDVBy0ggcHBJ4a7dJfOka4fo30yeHxUq/pO09lK+Fb3@lists.infradead.org
X-Gm-Message-State: AOJu0YxB5Q75pH5+J8l7N/YdOzbRss0MU+qsPtp4HSGUrUG8Oymy3CGG
	+uvcKpBpN/qoUnfYet4HKEz88viXjTmPz4qb/QSS4Sohao2eWcY8m1DSum3PKl0H9b+FSsShLci
	yFGr9X/SPV/OCPG2kH2Mp2zllEPuNlJU5DoefzZ4PzrGCMRR3DHjdUseKqntLrk0M53n3A54wRL
	cOgA==
X-Gm-Gg: AfdE7cmkWAAlHqDZm+dTIwYt3UL/dBsKWYNkilcciE3cFDtfxm9zFyC9KOmaFxLhFng
	Uo+Toibf35sSumDgDBA3/tMvn+ImvyudCTT86QdvGMS9M9O/Y0LKTzCjP2bxez4X2C9jVhlPq3w
	b1+0y3MeXeuSz/OAy9xqBBXnscZj92pk0Os5Hg2c0t2gmGtSRnHIRKyYDho0M9Q0bfzdP4ZO7Et
	49xCn4byMVhxE1mziXrb3ZG7KRgXQTO5IiYYNuvN4M0K6ai5r53Y9ivZfO/jFOJQwzrIHWZGD8R
	y0TJxgkxJgfkqWUJ0wfJK2iFM7K2eublohrkpPcw2HCPWAsPr2CEzt0xfAXHJoIyp8qvKN6cHJL
	xVNz8Q598E08yp501Xc2rlFP52AjizzL22ikuNdpP
X-Received: by 2002:a05:6820:200d:b0:6a3:94bc:bdcf with SMTP id 006d021491bc7-6a39a72fb8amr5197004eaf.57.1783947732984;
        Mon, 13 Jul 2026 06:02:12 -0700 (PDT)
X-Received: by 2002:a05:6820:200d:b0:6a3:94bc:bdcf with SMTP id 006d021491bc7-6a39a72fb8amr5196960eaf.57.1783947732495;
        Mon, 13 Jul 2026 06:02:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2d97527sm306129725e9.2.2026.07.13.06.02.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 06:02:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:01:15 +0200
Subject: [PATCH v21 14/14] crypto: qce - Communicate the base physical
 address to the dmaengine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-qce-cmd-descr-v21-14-bc2583e18475@oss.qualcomm.com>
References: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-qce-cmd-descr-v21-0-bc2583e18475@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1859;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xewtmBe7Tjse/Oov1uLM7I+VZpNX0SB8ljw+4HhCUeA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVOGhfrH2NKXSF17KSmqZSYmJCy4/yZakaynWt
 vvKhTmcPlCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalThoQAKCRAFnS7L/zaE
 w4OvEAC6nTAxezYrhc+HKbKJEUbU9SmhCNsd6nEk+cW/LBcJ4dP7CB7TvqbWxccqG/JN/L7HKcZ
 BSIWDFlfruG4HGl4gtYo0dE7OeePRr1k+klnQp4lQkg8aPtlC93WmZOAR0xYFfRgKsEJ9VJkjW8
 tNP7UB6Y4uls2OHbjBWziBzTIqB/ooWP1jYM3oS2scHsjnHbx1p00LOdVUta7jH51XAUeKKamfq
 KYeB+s7GkLJ5cVFjlocnjkOuvcalhZbZhfBugjGCzJQ+g+bH7HwAOwqonKJLYtXo5780qe0fed6
 68A2iXZTVurWhhxp+JS1OOZxO+NahMqrzCR2mrLsHwt26rR3qnTfgoak1ZBHtiuy2uKxuOHXj4i
 cgA4nlJxxHJ96b+RLkQ1zKiZoOuN4gXp2Bj3tbkl9+x4Z+BgV1tv+8aJwaJ4OXErmZ/MdemXkAN
 UqTvYK3VKHsq+8I0AN3t6vm0b/+a78X6IpxTSP0B+GLupECFXVO57OeHO9tRI5BC/S2C/+5Tq9+
 O2KGMVfcN1RUAKPYXu4ndc+2tfbpGkk7wqWVf4vUqXP5iqWLIsj3fldX8ZbErizdigVTaTqILbB
 SpZEtBHelPypXOfqmyKM8eQec40XcEesHJlo+o8wYxXoU+WO6deS3cwQKOV649qF+vIVVx9QtTZ
 zhP7w75muXabpzw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX+nrlJuZu3lXY
 S2fO8fsOnqbD4qKLvYo2AEh6kKfshPPs6KfYpWJt3/Jg2gKeb0tp4IpCj8NFwoj4XWSoi5eNwWs
 jiS8GB2fjBOSeJd1JBLbgjaKkTH4tb/o1yH2cIWPwJ1rm91jcOsZtIivOD5U3wn9Bu0+0jjP02L
 UuNa7o60UGGAuOHDf0TzRu1PdybieylJ9PwghQEWOWyt64Np2mGWdCfr06Nd7M1ykinTd43wdyZ
 it3tPpnZz0F7lwbAJWVZpQKaby3xw1qw1csr4DfI/l6txc6SyGh/c49lrJWiB6OZiEGBtp9Sxbb
 5Qd6zPDrRqqDPeNBjsgFkSqQgGG+7OwfajJ49RkpK9LAn2T+3Ez5hxn4nBjqPnv5kGp2lLybD8u
 hmfhXzalv10IyqOJU5LFpXMcFiDVUxafQ5879Zhi3xttxexSN7lsd2+efU/BMlINal9jrSe4kVe
 cVPlMd8kIwmb4i0m2vA==
X-Authority-Analysis: v=2.4 cv=HJrz0Itv c=1 sm=1 tr=0 ts=6a54e1d6 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=TFgmKHP77OfOvYwKDSoA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: 0VICzaIJwAm5nJgLZRycznDcT1QHuswD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEzNSBTYWx0ZWRfX0AW8fqS+77m4
 mCjlngSQXKV5J5TLUvOy0nu68haSt23Bj6Si9cElanL0e5D67BvnDRvCkGqTmpkfzuwoh9AoF6V
 l6P+kEBBCpRIHg2UgRx6JD8AuhtgyzE=
X-Proofpoint-ORIG-GUID: 0VICzaIJwAm5nJgLZRycznDcT1QHuswD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060214_770864_63DE0A17 
X-CRM114-Status: GOOD (  17.54  )
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

In order to communicate to the BAM DMA engine which address should be
used as a scratchpad for dummy writes related to BAM pipe locking,
fill out and attach the provided metadata struct to the descriptor.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/dma.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/qce/dma.c b/drivers/crypto/qce/dma.c
index 1b43c56503334154be4b8000e5a9330b2005cb64..6410f8dc5bcf517223c768a3e8f87af245076c84 100644
--- a/drivers/crypto/qce/dma.c
+++ b/drivers/crypto/qce/dma.c
@@ -11,6 +11,7 @@
 
 #include "core.h"
 #include "dma.h"
+#include "regs-v5.h"
 
 #define QCE_IGNORE_BUF_SZ		(2 * QCE_BAM_BURST_SIZE)
 #define QCE_BAM_CMD_SGL_SIZE		128
@@ -41,6 +42,10 @@ void qce_clear_bam_transaction(struct qce_device *qce)
 
 int qce_submit_cmd_desc(struct qce_device *qce)
 {
+	struct bam_desc_metadata meta = {
+		.scratchpad_addr = qce->base_phys + REG_VERSION,
+		.direction = DMA_MEM_TO_DEV,
+	};
 	struct qce_desc_info *qce_desc = qce->dma.bam_txn->desc;
 	struct qce_bam_transaction *bam_txn = qce->dma.bam_txn;
 	struct dma_async_tx_descriptor *dma_desc;
@@ -60,15 +65,21 @@ int qce_submit_cmd_desc(struct qce_device *qce)
 		goto err_unmap_sg;
 	}
 
+	ret = dmaengine_desc_attach_metadata(dma_desc, &meta, sizeof(meta));
+	if (ret)
+		goto err_free_desc;
+
 	qce_desc->dma_desc = dma_desc;
 	cookie = dmaengine_submit(qce_desc->dma_desc);
 
 	ret = dma_submit_error(cookie);
 	if (ret)
-		goto err_unmap_sg;
+		goto err_free_desc;
 
 	return 0;
 
+err_free_desc:
+	dmaengine_desc_free(dma_desc);
 err_unmap_sg:
 	dma_unmap_sg(qce->dev, bam_txn->wr_sgl, bam_txn->wr_sgl_cnt, DMA_TO_DEVICE);
 	return ret;

-- 
2.47.3


