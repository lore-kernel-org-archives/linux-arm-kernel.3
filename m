Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1174C531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 17:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=; b=q42MM6jWSDIMf7Yl5eK+ActJGS
	aM1Cv0L/yYr7+amt4KoQDHlmXGTVGAyoaP7KV5NCF/9G8lQ98N9cqiEGQaNvWYzefS4Lwp+u/wkVv
	OjWnes2r6kHRLd9WxpOvn6kgaHKJqP6BhDiprqtlywIJwBaBXeEPDOp6ii2yxgqDcJV8tsZm2J3U1
	ADaeIYUw+nIy/m+EuHX6JPNLPmSMeIiSVBePw9EI6NoXNurLQYkpCBEkGUK0UnNUotM1i75Oxp6SG
	u1LPNlS8M3h90RVBqS69o+kH2VFkT0uAic3iOBHi/UE8ujmS/OVaWBlRcBUG9xG+6Ieu+2LWl9c8u
	SKvzzfVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwvd-0000000ElxH-1p8v;
	Thu, 23 Jul 2026 17:09:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmwvX-0000000ElvL-0CzK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 17:09:44 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NF4P221323756
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=; b=orvzQi1KLIGbJqyb
	Uet/ZTdsuMVFNnP4RsH0E0ZTynZzpxphJfPAG3ufb0QjeYMyRLXRhTJGbfwAyKhQ
	SHJ97xycouzpcMWkVyR9on52d4S7Rhga+bFoLYvwYtKRjyg5jk+pN+nVrEIgvpZb
	+AetOHg5QQlOxTxkZ6lRAfzU/TLxEkHJv2qxZ2hptOVWcUGMO+2gtrNjMU9ZligW
	FfcjWT3GI4f2hQe22LaG/Hf0TcRRiUPOxLP48n5wbKOitqkQSB639PTk4Kfj/SqZ
	/DSyEMBrlMAbke1rr/aciOAH6cSoWqEgk8qkFlytq5DoKV5rCupDe3rVFFrUDFuE
	A6Gr1w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkn9a0mwj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 17:09:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1e6f602cso15097451cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jul 2026 10:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784826581; x=1785431381; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=;
        b=dKghEXm9BYnkPVanyhGE3KcmCFQDYih+GtuX+oTmB1BaChCwPRgbmOvC1VMVVXvsz9
         vwBfY7873PESTDrHJjo6ghwxSANl5lHBX2Cbq5+HStIRpSBr3GCVwElyOej5tvCj+4Dg
         PPAgCDlHNHZkNhgeBjxlAOwQXF9AgZSVppXIzEvxgPNOCGD0+1eqEVlTUXSlhtoQZDLC
         2Q1SQX7UWsW9oSwfRQUXtSOrbfK4L+U+AkKeZJxYnuhiRhiWBs0Hlf5/sY+mgxecFNgT
         lhtqUJ8a8uacvvt7dFhbN8j1h5EuTfKyk4vOxZVKM+JB0wRzQbHGWOwNa7HvDe/sgQdr
         dVQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826581; x=1785431381;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/Vh6sT+8mC4wwsdE+AaqQfMuc9K2i5dAUjEpzQ2UVhY=;
        b=Jf1JILx7kUuHKXOSu0/nFKhS2Crt/HdNkPk4t22O0smtC5HL4iBKQ/IzqnMgMxXKAd
         FGGqu48Unf4gON567tRDl+o30SC4lgMlBrtwXfSxGUUqN5sdbJuT+VnhQzgo7PHLDGbv
         DKm94PDHZa1EHfvVL2ZYRFmQjbwabvRdTLAKYR1e5S1Na7I35e4gRGVKBYVlINZR0eeQ
         SnmNUnSS32LcBdDxIdoJ67/sVo7nmjaqgukjykddjMmKvxm7g13w1viuFo2mGDsJ81BI
         r5vz0VXx13Q8m4lCiSVh/cdctuRigJ+jFDor1eBzVIAZiJ/cz3nncw0uV/qdb8DLIMNi
         NOdA==
X-Forwarded-Encrypted: i=1; AHgh+RojIlfoZIBO+IQhogb8WN7WgXseL0vLCaf9O2ujqzbOBDRPThH0JXh5SugGqxz1UHVzCpIqcrZQMdm0gOhinXLn@lists.infradead.org
X-Gm-Message-State: AOJu0YwdyXU4pYK/Itx/MpyqiCdNfe4SAbdw8z0G4Z3/WH06hXjAG+A/
	cCtHKKDzQasjO7u+y6S1gbsnvM/7lo2LFKkr9AhJbHDpJQMk7Y+7LOfbIUB4qZ/kXDfSqFhs76O
	yMZjf8GbM2yI20UZCI5BdWeh2D3vogjPyadFxTL4y//+CJmXkNLJ5vjr9e4dq7wytnOPuXegf4Q
	JbCg==
X-Gm-Gg: AR+sD10c3xO7jkocBDZPodMmpmT3oPxdHUOK6/dx3zCu+WpIwIz5d2ViGn+BfIS6VXT
	FzaZzblQQ7G722O3G2hNX+e59s3Ib7bMvfN33V3BsrCMiMUsOPOSEnVPSTxXP6aWj8shg6j5tR4
	a4F+GGAQYHJcP5J3dfqHSPvFZuAQ8/UeNE0JZhCP6nY9ZU0PmHdrztmnHSgEa/+JpYBG7qnoqC6
	l6jAn1B87cI3DnNmDoyPDWH/5BjEzjB6KhBotnfbOkDJbJ9ClJXDxfeZV0FRTw6RurF1xnyXbsF
	dMZbw5OxerS4HhDOB78eIXnM05CNH0YsyQb5fxL9/vXFuUd85LWFIeYeN83Tvhi9KcWmmhx4Zdq
	hHoEbziRle4D6JNEgmUGAEVpRqRUh
X-Received: by 2002:ac8:5fd5:0:b0:51c:c29:d4c7 with SMTP id d75a77b69052e-5283dfc878fmr34791531cf.62.1784826581151;
        Thu, 23 Jul 2026 10:09:41 -0700 (PDT)
X-Received: by 2002:ac8:5fd5:0:b0:51c:c29:d4c7 with SMTP id d75a77b69052e-5283dfc878fmr34790841cf.62.1784826580251;
        Thu, 23 Jul 2026 10:09:40 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:cd9c:212:1357:7832])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a64dsm18472999f8f.1.2026.07.23.10.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:09:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 19:09:08 +0200
Subject: [PATCH v24 02/14] dmaengine: qcom: bam_dma: free interrupt before
 the clock in error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-qcom-qce-cmd-descr-v24-2-4f87bb4d9938@oss.qualcomm.com>
References: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
In-Reply-To: <20260723-qcom-qce-cmd-descr-v24-0-4f87bb4d9938@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2818;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4nbFs/xg8cCMPYrFtHWE96AOtkhXxC7yUgPXEapSLFc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqYkq/WBUoWLjOzExA79z7UMdsm0HF5JKxlXZxt
 tTjR80KQnOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCamJKvwAKCRAFnS7L/zaE
 w31CEAC5obaMMhHtPfFZmXXLzrCNZlzYHp/1Y7abX0djXAm3vL4YOq7s6EXKNbKEGjg9uW7MYbk
 btwotFetGoy6sfEuM5e4PMxHWHiZgWqE1vuWcnnE68ugoHN1nE4L1cOurCeFcjNNpdz+48v7qcA
 ykOLqNuTJNIduqr8zgFTv6oTWswf9y8Z1So7gfh6+IMCsLZCYNipYtJqNKpMNFT/Ai3a/6jgh1N
 B8VwOSgLmfSSvfscDAJhx38ZpZERlZMF4vYFvLmOjA8ann1WjGimov1TbDwbiswXTIiypqRuRsb
 0zXSUTWQ2FN24NVH3vnekWVQVZEC8AwRsq10h0dtkPwFR0ivFZEypRbP3p/TAZJIdpkIeDLWd/S
 gBvVCBGSZkpJzHGGQ0edBPO0P/NO7qYnW/ETpiaeO3URS/Ag1Kv8JWcwboZyGGKO1KKX08OGPU0
 a0uSXrqveSC9S1PVv5WXvSJjGfYf5xNq5W6rTgGc1vwJEJquNWjBTzHSxACzPKu2ushNcna5X31
 Di27HDYFOe2GUpzSpSfyNwgxehROjGBPOFsdozayswtBqfRfOl3g9rrD4vmmJgNmOCp9blU4iZM
 JlSgH1heKvX7U3peoeh1GLQOfef5MY3a2/xlYNvDt6RqeNbczORhD7Q/25BkIkl6TiYUhAXGt2b
 R5JExTs/jzzLuoA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX1bwHoEylGrr+
 IkHjGxbXr5CVm3+Y8xu4IydKBB77VGE1G6GwE9fWvrLIrBfHVvHkMgrqVVz27Y+upefGBBh8nIj
 eaD2NEngdW9ZymMmWHv4bjhJSQwaFoEZIYqKRZUFskk4CQflewzdHKzlYofvWm+gcdPZ+q4NHEx
 lGfsTRHp3c+Eg8aHRt+I1C4OaT1BkxAIuqrvdCPuJCRLrBRPa0LDMj11p8N+nk3SN6QhRUS9huM
 PTavSWa2wqMuBVj6ixCMlwBeocmxmpRQ+mf5kQ5Aeh14QZo8w2a79ulIeutWVw2OOSwLnQ7Z47q
 DD/mHokgENskgpyuynJfXZWS7ucoFR3hsqFQZp2p612PzygFLH2+niHyMP7A7ISlqeyNASoHz4o
 fdhmp0oOYREFWd8TqfOTlyJ37jNhofNc6FLBnWwc10BhOuGnVNDBPoBkKjW+DqHKEVHUDbCf/yh
 XTAlCbvTEzHwHthJo5A==
X-Proofpoint-ORIG-GUID: tpIW-UAbzHVRsH903UTciFtmzuxsJ-6P
X-Proofpoint-GUID: tpIW-UAbzHVRsH903UTciFtmzuxsJ-6P
X-Authority-Analysis: v=2.4 cv=WOdPmHsR c=1 sm=1 tr=0 ts=6a624ad6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=n8zAjjMAgf0wD31B80cA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE2NyBTYWx0ZWRfX08FHNwQVaF9m
 UojTwY35MeG5o14RyC+88FyCk8dGWvhnYfqwZ7cZN1myuZ6StRZRC2SAXeI+Sm3S3Ljje3NhmpJ
 cDx9gJX3nDNdPMnNb/D9ZpwSxXGuY7A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_100943_097666_458E10E5 
X-CRM114-Status: GOOD (  17.74  )
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

The BAM interrupt is requested with a devres helper and so on error it's
freed after probe() returns. We disable the clock before freeing or
masking it so it may still fire and we may end up reading BAM registers
with clock disabled.

Stop using devres for interrupts as we free it in remove() manually
anyway. Add an appropriate label and free the interrupt before disabling
the clock in error path and in remove().

Fixes: e7c0fe2a5c84 ("dmaengine: add Qualcomm BAM dma driver")
Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc%40oss.qualcomm.com?part=2
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 1bb26af0405f3a16f97e0d4b86c945c252d97f57..fc155e0d1870cbb7e099a2c4280f9f8fbdf6cf15 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1332,8 +1332,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	for (i = 0; i < bdev->num_channels; i++)
 		bam_channel_init(bdev, &bdev->channels[i], i);
 
-	ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
-			IRQF_TRIGGER_HIGH, "bam_dma", bdev);
+	ret = request_irq(bdev->irq, bam_dma_irq, IRQF_TRIGGER_HIGH, "bam_dma", bdev);
 	if (ret)
 		goto err_bam_channel_exit;
 
@@ -1366,7 +1365,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	ret = dma_async_device_register(&bdev->common);
 	if (ret) {
 		dev_err(bdev->dev, "failed to register dma async device\n");
-		goto err_bam_channel_exit;
+		goto err_free_irq;
 	}
 
 	ret = of_dma_controller_register(pdev->dev.of_node, bam_dma_xlate,
@@ -1385,6 +1384,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 
 err_unregister_dma:
 	dma_async_device_unregister(&bdev->common);
+err_free_irq:
+	free_irq(bdev->irq, bdev);
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
 		tasklet_kill(&bdev->channels[i].vc.task);
@@ -1401,6 +1402,8 @@ static void bam_dma_remove(struct platform_device *pdev)
 	struct bam_device *bdev = platform_get_drvdata(pdev);
 	u32 i;
 
+	free_irq(bdev->irq, bdev);
+
 	pm_runtime_force_suspend(&pdev->dev);
 
 	of_dma_controller_free(pdev->dev.of_node);
@@ -1409,8 +1412,6 @@ static void bam_dma_remove(struct platform_device *pdev)
 	/* mask all interrupts for this execution environment */
 	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
 
-	devm_free_irq(bdev->dev, bdev->irq, bdev);
-
 	for (i = 0; i < bdev->num_channels; i++) {
 		bam_dma_terminate_all(&bdev->channels[i].vc.chan);
 		tasklet_kill(&bdev->channels[i].vc.task);

-- 
2.47.3


