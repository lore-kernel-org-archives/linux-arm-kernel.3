Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D3ACD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=94MEU9aOFWh3av1FWToR/uMqLJdnwEcp9tKREkNbm2E=; b=M4jSbPN6IVk6Pt00wx6DrFuV0C
	l1mg6HXOsjajoALyTJpXcrRfE8R8dk82cTnHVTPtF/VQCmlb9fg7eHV/oaY973yTLfpfW7rA919iP
	lWQ+ICvWpmmOWLAmJB9sMHJ0PPNkSVfAJ7Rjwx5FJWRhJORXFPz6uC6TFYYNxikWeXBPgH7KzySlL
	sk3duYuihQwH/5Me9Bpu5/bPhN3fquahOv7B8cDGdSDpyFqc339BRMUQsnmrsBArX3i/lQSbnngvu
	6/ldpnq897/rKJq7MyYl/vbkaKfh/JpD03VoNHQ8qEeG/L/dwL7liXA4QWOyNRU2seT3Ry4CcgPEe
	aF7FeSLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKKz-00000001c83-1KFf;
	Tue, 19 May 2026 13:18:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKKt-00000001c4S-0n4B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 13:18:16 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J8EFTZ3612437
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	94MEU9aOFWh3av1FWToR/uMqLJdnwEcp9tKREkNbm2E=; b=lDAipbQpmkAng+Eu
	KkGXJ/8nrstxmlovaUnE02drCwjr11UJW4zWjPbS/ZeLkhh5YN1HqmxtU+MeeJ6Q
	NiU/SAOXBkc74TOzwmmQQXrN+jVJ9tnOvx8SXT9JxwNQeIYESJlISWfuYRlaR4TP
	Cl6j7gAuZW7IMVS3bT6lc7GujXKg8eaorbRXJ8JJU4zW1N4IIw6BXHrhfrP6bITh
	/KUfAdzh3gb0GNrhv89X4Bsfhm7OLLcLgSph4hCo0pzjrDpbMZUVxAvOCKSP9mh3
	3IyPODgPDkWX1eZzn2GXJC6FA4lBAjOJflVTPDdiCBk8exg6Lx8J4dzmq+4NHfHa
	Ay+2Ww==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8m64s785-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 13:18:14 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-69d4c069cbbso465697eaf.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 06:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779196693; x=1779801493; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=94MEU9aOFWh3av1FWToR/uMqLJdnwEcp9tKREkNbm2E=;
        b=gjksb17Akd82lthOge1BCiTHcB7/5qmbTowHs/AaZwnUMqWdCzUhvrSsStZWDojtcC
         ZBGZEiD3NBjc0aamXxOaUeVuljOqrCtCHmb4X4CFwz7s3IDL6WSAJFXVifC1zUUN5LBn
         h8cwYvcNoa6wvrJKdsutw6rAlrS9QwbRUcvdCzsLktGDwLZDR1JXOdMDKdZ/vPEj6bEm
         xdhZ53pUzilgAJ4/xha4B0pael1WW7PTt/QxhRndqSzeessGeb5omeGJOqBTgBGetcYz
         +hCQny9tIzPTngC4VDeHpJ7CHunfxyWLYkzvDvrsM0/06FKSmAMEQCkdZ8ubtGluYGMI
         yHVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779196693; x=1779801493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=94MEU9aOFWh3av1FWToR/uMqLJdnwEcp9tKREkNbm2E=;
        b=CY52dfJ8yJdVQk5wv5zGEidUHx+eeYDqxSuUveY2Gu9zgikagWFS+WYAWpqRWa/ie8
         OTpuksuhje9yBft6pxLZJf2Hggdvv6nI/AgZStMBXSioyl3MIrlz/qWgN8HcnaaDh/Df
         ZvQAOUwxHQHH8mzCqT007kGso1I+M4ZnMHetWlFf6aFaUJXNlk8iImrmwAJc7DZp9AhB
         O0LHl+HExHc1zOt+GOFK2kJbtQe4X1E5Xc6kZPkIgDmgy4K0TWPufhOjtrzhzYECf49k
         YiigxsiBQNKGkZ4tjv36X/tuRX/QNR56j36efRm+Snk9lHWrQjj4fseH2iB/fSD2bjnv
         /TNQ==
X-Forwarded-Encrypted: i=1; AFNElJ/YP9RhKOxNNPvp7aj+EWL+bSEcqK7WqDrUNVMNFl2t/vUuCoW39YmLFjfJN+qjK3eBOZS/ds/XAqt9YbNNGiJF@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc4oHbN7CSAg91A+zifoNyiPodO6QLPkV80Pf6qqonhpmxqzap
	TsSy2Lso4fPduwvZOLksJ4timBjNCSZWyB5M63lR9ij4TpNfJ9AJJmsbzfplBFmqNjH389ecK8A
	rkZP2xL52m0JhuqFpiHnVJPbAkowkIXgTselUYSNnaAFStoAvu3q4cb5DdRHGBXNdzhj7pGZL+j
	MJDg==
X-Gm-Gg: Acq92OF8My+KHmQvIGIXg4Is730vV6LBXB703Q8KksH2EdRWN44H6Ddkyxm/N/JaTIg
	Bqp3tj2TEaSBFCY2O9f6Kw5DUVKDxX0BV8ZP+QcA9tKlTr0Zqaqb8D9KQhR2/Rf/K2wVMLwJh8x
	aYArVW6ogfVP9NwZj3gVHpPuauBVruU2fh9GthYBblsSgiQl54oyn2Fi4tTJDSueWawnWcp9a/b
	99SbFEbJOy+abGG7QVFEBdZs4Z+VTudB4s56emwg58CBgKZKSuw+kjvAbkMfvrXHtWoqKnBQe/E
	zC2cMm68waWtkU6YUa4+n1WAQUJCSCj6QjrwNJpyEuLQXmvlTkVmvZOxIo3zmrx3A8uWRKs7B5f
	pzhjyngQclks8Lj4bqeB236BN/Jzhb7Bx/nlMxzlI1dciBkOHs6w=
X-Received: by 2002:a4a:ec43:0:b0:69c:5d2b:4079 with SMTP id 006d021491bc7-69c942a5fcdmr10530458eaf.6.1779196693247;
        Tue, 19 May 2026 06:18:13 -0700 (PDT)
X-Received: by 2002:a4a:ec43:0:b0:69c:5d2b:4079 with SMTP id 006d021491bc7-69c942a5fcdmr10530424eaf.6.1779196692725;
        Tue, 19 May 2026 06:18:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fb6:74e3:3c25:ba2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe7dd22sm143969195e9.7.2026.05.19.06.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 06:18:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 19 May 2026 15:17:44 +0200
Subject: [PATCH v17 02/14] dmaengine: qcom: bam_dma: free interrupt before
 the clock in error path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-qcom-qce-cmd-descr-v17-2-53a595414b79@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2456;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dAO3Z255k2yGXbKKHljWmfMX0+7AVaeyaum6kFL1QWE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDGMCgf4Vg3jkO6YzGQwECnhi4cg2IDvJ0MkJA
 qlIVBYqVvyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagxjAgAKCRAFnS7L/zaE
 wxwyEACRCzcpf1dcbSVhnrdOK6MTf2WN4sYADdEAPSBg7UExvO/UAPlKbl4qWSCdbqI7Sp30dam
 1lBBbBw7SujcVDWQOamidvxiW+AGaNdHUcEO95FhuU78gpd7ByKTUz9+xTJJBisemx1svtYeCiM
 /UamzNbkqavi9AYibWEmWiqLV6NBsyF4Wcj8QSFctG6xl4TXXIl3tU/YElUXqNDEAedNpITQxaq
 BLXyS2cNPubCFvc8IVp50+o1k1MQB49qODiHF7laucTjgmGc2h2PrGBJWY/Sac+ZdEIipgh3DpO
 Te/YSMpogxRkvH0RnfWBJTC21Zt0/8OytQh/sOit4gptvQPsk9dEw6sMp63zV5ugFRHO1HE1kBc
 spfWrUXezLFOhFYBDAQe/N/nva0FOAPCQSpSjXjd8iIogCHEvZTa2VeWsYd4ZTrMDjF71ubzULb
 QpZ21NnUvQdw8tuB1P/TMzsnSYAOmLlQakLkdfbZwgPtLzn390zJOHP1c0JQp1zrkLZCCpa1utL
 zm96A7yhlH/3WgAxb6tAPw0nnTnT63U3tCAuh3Oq6BCq1orm5VsxFbJq+wiI7Tt9ypKCngVCJyQ
 pS12KthdJkXwzGsHqLd5FaTC6o2PhErY/dqeq7lFpreydBX8FFGYQ32CWybUlG9PFI1hqOSwvxg
 K59ziLTDl0U8l5A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDEzMSBTYWx0ZWRfX2kHkAkRCFgbf
 u45OWzJDzorBTz8vqEbQWlPcq7k/9S8oylWJxxWhNqxJnYEWoWRff4dOmtsO+GZj/MlRHWJfdLr
 eZapZruKtpmL8UJxZ6W+OVav1xDUNzDPFODQwEScJyhcpspAetZNiS1fB2c088CpcF2mxE30nHD
 y79US0l9QOveAMvAEVFGrS86GNmg3ipXBNtqkNvMZIOyaQ29xmgGC8PFmrY0XiAPoCQ7LOi8ZzY
 CFueyJfVg9osXuESgmVwZmmA5vwNK5bh8W8j4gQf0kbGjBknmntmEXqWowKmuKdZgJ3KXg35Xhc
 EqjdF6YNV04DKxI7Ywei7cpWVFE8vcw5oVXQX22T8XfdmV9Ed45fOYo9oltSOxSZr+5ivjRJCls
 /QH6GcGK7Ecjc7nV9JqvuP8UJthqcvWtrfLfeyrneCDxc5YLMycTcsdgiEmlBjBhn15Z1lhseKz
 hUtYgWQ6V8JGTrqQTFw==
X-Proofpoint-GUID: 7saXVU3FBN6fpg4X98_cOZ3Flnh704XM
X-Proofpoint-ORIG-GUID: 7saXVU3FBN6fpg4X98_cOZ3Flnh704XM
X-Authority-Analysis: v=2.4 cv=J8aaKgnS c=1 sm=1 tr=0 ts=6a0c6316 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=c92rfblmAAAA:8
 a=EUspDBNiAAAA:8 a=n8zAjjMAgf0wD31B80cA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_061815_371044_61ABE1F2 
X-CRM114-Status: GOOD (  17.48  )
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
the clock in error path.

Fixes: e7c0fe2a5c84 ("dmaengine: add Qualcomm BAM dma driver")
Closes: https://sashiko.dev/#/patchset/20260427-qcom-qce-cmd-descr-v16-0-945fd1cafbbc%40oss.qualcomm.com?part=2
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/dma/qcom/bam_dma.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 19116295f8325767a0d97a7848077885b118241c..cea44833201d641ce6a657840d354abb443501b5 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1302,8 +1302,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	for (i = 0; i < bdev->num_channels; i++)
 		bam_channel_init(bdev, &bdev->channels[i], i);
 
-	ret = devm_request_irq(bdev->dev, bdev->irq, bam_dma_irq,
-			IRQF_TRIGGER_HIGH, "bam_dma", bdev);
+	ret = request_irq(bdev->irq, bam_dma_irq, IRQF_TRIGGER_HIGH, "bam_dma", bdev);
 	if (ret)
 		goto err_bam_channel_exit;
 
@@ -1336,7 +1335,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	ret = dma_async_device_register(&bdev->common);
 	if (ret) {
 		dev_err(bdev->dev, "failed to register dma async device\n");
-		goto err_bam_channel_exit;
+		goto err_free_irq;
 	}
 
 	ret = of_dma_controller_register(pdev->dev.of_node, bam_dma_xlate,
@@ -1355,6 +1354,8 @@ static int bam_dma_probe(struct platform_device *pdev)
 
 err_unregister_dma:
 	dma_async_device_unregister(&bdev->common);
+err_free_irq:
+	free_irq(bdev->irq, bdev);
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
 		tasklet_kill(&bdev->channels[i].vc.task);
@@ -1379,7 +1380,7 @@ static void bam_dma_remove(struct platform_device *pdev)
 	/* mask all interrupts for this execution environment */
 	writel_relaxed(0, bam_addr(bdev, 0,  BAM_IRQ_SRCS_MSK_EE));
 
-	devm_free_irq(bdev->dev, bdev->irq, bdev);
+	free_irq(bdev->irq, bdev);
 
 	for (i = 0; i < bdev->num_channels; i++) {
 		bam_dma_terminate_all(&bdev->channels[i].vc.chan);

-- 
2.47.3


