Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEE6F513E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 21:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xF762MP0D0x0cXFJ11pLhifB9krYSxT1GrxhCZLRMoE=; b=wTIO9YLvO+WnkcRYU21f2JdxS5
	s6ajjSv323eXzcb4YPPZBORJiB4841fNXzpvAoTjNUDqtvm9pzp7q83vfSqHZewnDLsjDp6RSwcG+
	rKp6+sY2WXGrPrPWd+3dVYPtWLU10SO5kqg8DQegaqqhbgnz3L1GSFE4vxKG0xgse4ILsRDklruTk
	D2UsK+jJoXZA65UVU9ybHR+yCZlPgGphUIPGWH2f6WrUqu3Kqv32oXQuQAkJii9MJShn+lLTFp/Lf
	BpRtpYPrVsu5/WPEMbfGHrXRnvcsr5sPR1kC9Y+XIfNck9Y9KKHhaADoHH046YQhxEJ/LiiuA3iq8
	HueC+ymA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGWr-00000002bYn-1Aue;
	Thu, 05 Mar 2026 21:46:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyGWl-00000002bP4-1hAH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 21:46:41 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625KmttP1803366
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Mar 2026 21:46:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xF762MP0D0x0cXFJ11pLhifB9krYSxT1GrxhCZLRMoE=; b=kTDsn66dim843s3x
	bzoXPIj8EMMuopwYjRQyxsAK0/F0JrLLNjwqqwjHiYKYbhwfPNhqEV4WSOKJTCUw
	8oRKJBIWpwqKxNHZ57CpnugwbQWqPa5aSY2ouGRwOTL8lVMY7JpN/Y+1wNYXwsZk
	q/ZtWA4mj04NpXSgvJwO18yHZexy5y1y+Tj+Fzp0aTNXH93IRWMLAetDFFsYR4U2
	Hpbx66OeSEqYiZt20rz+ClqHIZThDHpoZ3Ovg9QCfci4I6W4FyKD5qPoLWMoyLGk
	x0hL5k9uvxjBs8nNVHiSI8VkubHB0rMzXHqth4SYLMXk9Lp7OmDgRmKB3vX5TH+e
	YzxRLQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq9srhtma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 21:46:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70ab7f67fso1088311185a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 13:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772747197; x=1773351997; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xF762MP0D0x0cXFJ11pLhifB9krYSxT1GrxhCZLRMoE=;
        b=J/qaPuwOsUriLkHxXI0cyeklXx3hSrv8/B7EayH6oRS5TIuHAsLtW5TzjN3EcLVGoS
         UbN5IHtFY0nK4vZFu8Fl04eL/A0yQMDdzb3L4hY5rb4b/fQ1VPWx+5UU0PBD0OnHFU9l
         SZdmspff7B5eoYW6amXK3MvdeURunXMUsFW98e5+3dXLv+GNDz7w1JB1V53+oUYXCoM6
         heIfr8p7S7XgbG4p5bvspwpRRSAG0BLauaxTlL3LTsorF6+KqmwBxpvITWSmFLF6muFO
         MnhovbPqiv9Va+wqzFu88RzRG72VCYnSEAbivNf+6yOa89OoLt69V3axFsxBHyMVJ8VX
         H4ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772747197; x=1773351997;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xF762MP0D0x0cXFJ11pLhifB9krYSxT1GrxhCZLRMoE=;
        b=nkSvVG+fHyaSP7osyyUWmo6EyR46fKVUdtPNzZAsil+hUZY4PPrPiYsOmNa8osz9hc
         5wOAXTXH8OIA5J8xWNm5QHDuxrU5eG+RcZCwg0pQBT/1IyWY9ApASuWIJ9JW9zxiQ5UX
         WuYkyOmCaX3RNATMtzlZ+jqc9u8Cw1j/m/aPmmidYp54JweTakJ7IGPNMP0lUQHmmr+V
         vWPmYMEQxVSyLwnZFpkw7IQt4vrPzCU1iUJoCYoLVAB5yipWRSw+yopV7ldlCSNPiM9Q
         r/s0GxFvSmnVIacydqHNK4NDL9iQETIQcKegb6uAWWddw1TVaJNLXnp2CRQbm0qRg6NA
         cnkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb5VDzhSORf9rKh8LCnxP3eZ1okmwu+4SKnz+464Z/pEMX4zT105vDoWnKi8qEn50IKkqw79LcMF6XHTcxy1Dz@lists.infradead.org
X-Gm-Message-State: AOJu0YzvTgYqNSnesk6mzNK12r7A9ctNRhu92hnoysGw3r6bF7qcGtUJ
	9bDMgC22ra8kbAlRbzRKsFTOKGDrzlIQmtGmOw/ZPj5kw2YyA3YCkUKd3tuyAMKDFzXoOS2RauT
	RkPGYQKWGWE+jywsGP8ZZrArVZOtEjYsHYQEVnjryIltniDJq5HWcfAu1gCBuq4gHeMTaSz/h68
	JqsA==
X-Gm-Gg: ATEYQzxoIpO++ZzpZiDDYPiXmYq6t7UD4OZ0hQuDs+9T6+nFDKY45ruyW17W4PSH5tp
	zIkDMCzzJnEMWUoO2dno02h+DxVjZgHpmV9LYmL0IeTE0t1zK7XxxplyWD+IYdZKipORygzFptv
	1ftC2WRwQlnzGxBfv29Qcr0txQIJUkdzlOY8x85vFgByjbWoXH1ExBw3TeMViCZYgl51EMdJv9r
	rIcGlkvmsDT3wLfSFekd1HzWcS14cl3+ylrZ+p/m0InS26NxcWp/qLlAxLi1RVzt5pvZKRDJ2iA
	7d2pkPsOEFrHPJOx68ho8+lIRukgXMsV66QiPijtb04Ph9kqc0dQGst9jzxSXorYhPxr3u52pBD
	+BAGuhK+W33rHMe7Kxgj6w+AmEY3G0RAmdIVUVAlmH9ty
X-Received: by 2002:a05:620a:4687:b0:8ca:3fb7:2570 with SMTP id af79cd13be357-8cd6d4cc0d0mr1698585a.42.1772747197588;
        Thu, 05 Mar 2026 13:46:37 -0800 (PST)
X-Received: by 2002:a05:620a:4687:b0:8ca:3fb7:2570 with SMTP id af79cd13be357-8cd6d4cc0d0mr1693585a.42.1772747197119;
        Thu, 05 Mar 2026 13:46:37 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a58dasm28571575f8f.27.2026.03.05.13.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:46:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 22:45:48 +0100
Subject: [PATCH v2 09/10] mfd: ezx-pcap: Avoid rescheduling after
 destroying workqueue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-workqueue-devm-v2-9-66a38741c652@oss.qualcomm.com>
References: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
In-Reply-To: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Tobias Schrammm <t.schramm@manjaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, driver-core@lists.linux.dev,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2299;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8HCvYehjmNIH+BlrLf3/jZA0T/6LceXynB2MmBf1YZo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqfmgTLUiHh6rin6gIR8tn/yHPbJ7keLcVF5yZ
 GGBAe1ny7CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaan5oAAKCRDBN2bmhouD
 1+A1D/46IEOXU4c7rCB302yiUbZqrN3J0Box+FRnliJ/p6E8EXiDnmOg4obwzDlEUpFEf7ibEyq
 GYEw9cFAKDrszgDdGRbIFVYHr8RFOirL2Hdrl9Km81dPKqBQLXZQWnvAIKZe4uFGm8rDEiTS3FV
 gXubYix78Obr5LtZTm+Tn3H4VlOmRf/a1n/SAYakf/wp8btHWAgUY7J9nNAMK2Lbwsc4nzYJoHi
 vZbjtyC/9Gclm/CRe1O8vCpyJktvnNgAqHtQ/jojtr4XybHQF965vKIWwvLvoJBrhi2yylmf/EG
 S8CxeogMKobJs6UveopZ0d5TANJ1DRYacznxvzG9KA6g6X2xQKhxgYl480SHuTQMwdI5ygPt58U
 YlxL6+Ij5kO4Fz14qrhXHTZ40edvx0sQflZMFPcB4RVEyHUSnt2upCd3xRWA+BtmXbJ3NVnN7YE
 7JHqzNSdItYNG4lO1wHyEOQRHGJ6KLMq+xqetuC7XXGt+e2iAroOx4ODQ1itWBm9mnLq0brsQkX
 aZkgptRJCcNG6nj6JfVtXI5u3cZGNevrxo+gGHIhTsR2iQROE0tCQbAzduBnKIEtq3Pm4AyCrGB
 GzbjoRK4ad8uW8GvCPBi00G3EXVvoOWPBuOLeQPVp8BuTwkTHYs7DVw1wsrnE0aEKQYge+pTQo1
 a1ws7+4oKjEY6DQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=a/I9NESF c=1 sm=1 tr=0 ts=69a9f9be cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=3MYFky5D01qQmCoSdzEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: pNjPtKActDkhnH6CQ-s9brN7tkpG4Iqt
X-Proofpoint-ORIG-GUID: pNjPtKActDkhnH6CQ-s9brN7tkpG4Iqt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE4NSBTYWx0ZWRfX9okCnDa86ULi
 u99RTP//BQGZkM+5XVX4ItZQxtP2gFcwceUEYkuLQonnhJ8Z25NMCGh/rk9vzDAp0zAaDEUPiIj
 PoFx4B7mOpKTVmayFxWlldVYyWe2nDtYhEf9TKaOUO7hnvvBvUX00FYA55EaSWKLFngwEgyCcgA
 MSHUNLXgatPbOezBgkDHs+CpYjTGlEiaOv0hvp5oVbavBln5G7D4KUPUHDl2EmR6buvzN+sOdee
 G2zQYlhiJ1lK7EDMKvluChQZdcZPVPMoQaCuWeS+Wp17tUHVeUn3DTTPhvKkIgYdGN0CSqkpHgZ
 hWrYTCygLfLjkeUWMnAb5VaIx3p4vsocLlJZdrHGCk63F35H5VRAcw8mE48JjcHhpH7EM4pF01k
 J2HzAsPknpB568cpNZYjgvoyUcfb3IjBNaBq2LwSiHX1HLW3+7DxPK+0UKUGNkixj7iqaFYst5H
 E9piMC00Dh7900iEtKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_134639_767335_803CFF6D 
X-CRM114-Status: GOOD (  20.17  )
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

Driver allocates workqueue and then registers additional interrupt
handler with devm interface.  This means that device removal will not
use a reversed order, but first destroy workqueue and then, via devm
release handlers, free the interrupt.

The interrupt handler registered with devm does not directly
use/schedule work items on the workqueue and the remove() function
correctly removes other IRQs handlers, however the code mixing devm and
non-devm interfaces is difficult to analyze and read.

Make the code flow much more obvious by using devm interface for
allocating the workqueue, so it will be freed with the rest of devm
resources.

Change is not equivalent in the workqueue itself: use non-legacy API
which does not set (__WQ_LEGACY | WQ_MEM_RECLAIM).  The workqueue is
used to update device registers, thus there is no point to run it for
memory reclaim.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on devm_xxx() from earlier patches.

Changes in v2:
1. Use devm_alloc_ordered_workqueue(), mention this in commit msg
---
 drivers/mfd/ezx-pcap.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/ezx-pcap.c b/drivers/mfd/ezx-pcap.c
index 8e51c113a320..9a685ff8cd15 100644
--- a/drivers/mfd/ezx-pcap.c
+++ b/drivers/mfd/ezx-pcap.c
@@ -375,8 +375,6 @@ static void ezx_pcap_remove(struct spi_device *spi)
 	/* cleanup irqchip */
 	for (i = pcap->irq_base; i < (pcap->irq_base + PCAP_NIRQS); i++)
 		irq_set_chip_and_handler(i, NULL, NULL);
-
-	destroy_workqueue(pcap->workqueue);
 }
 
 static int ezx_pcap_probe(struct spi_device *spi)
@@ -411,7 +409,7 @@ static int ezx_pcap_probe(struct spi_device *spi)
 
 	/* setup irq */
 	pcap->irq_base = pdata->irq_base;
-	pcap->workqueue = create_singlethread_workqueue("pcapd");
+	pcap->workqueue = devm_alloc_ordered_workqueue(&spi->dev, "pcapd", 0);
 	if (!pcap->workqueue)
 		return -ENOMEM;
 
@@ -463,9 +461,7 @@ static int ezx_pcap_probe(struct spi_device *spi)
 free_irqchip:
 	for (i = pcap->irq_base; i < (pcap->irq_base + PCAP_NIRQS); i++)
 		irq_set_chip_and_handler(i, NULL, NULL);
-/* destroy_workqueue: */
-	destroy_workqueue(pcap->workqueue);
-ret:
+
 	return ret;
 }
 

-- 
2.51.0


