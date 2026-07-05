Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F0CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 19:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=keNlL6A8+I5pnaNawbDLPC3Skjo9l1+hFMmFLmQIfDI=; b=HtYWRpj8SgOcyK4yF8PB06poVY
	DZQqMUeY17c/voUrUjQLg5SKtwKn82xYgRSAugayFEzNTC1jX6W8FaVPcndsG7VpvP9n44pFk9LpK
	xzuFX/34PgJcrlGW6cgpPoqtGuAUD9WiVAmdT7FgjB1O/RYU+3dvsS710W2ymNm2WM5oiRZHd2YUP
	fpng9NT7OAyi2rsAH6c6sH08yNX8jOI39Z3D85LLw9kkZ0ybYJ8Hhl9ltDpctPdrm1LOWIFz91IlX
	w0xHSz8pPZCuMebr2NpAs+d/c5t76IaSchbPdYPUqel2g1Vm8iN6UpgwUHEcBkI4yMAMpKsjyUKt1
	UlmChLAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSid-00000009eI8-2ikT;
	Sun, 05 Jul 2026 19:41:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSia-00000009eEQ-0Z1H
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 19:41:34 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665IxLYd2284376
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 19:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	keNlL6A8+I5pnaNawbDLPC3Skjo9l1+hFMmFLmQIfDI=; b=LEH8gBGqre98aZ5S
	R+gXIdM13wWVBKCaHBPzQIy3YO16XtaM2Yeu1rWWcKE8Ahh7phGi5PdgSe6faHYh
	NZ6WuJayU3dm2BjN9bw+VBE+ZM79Gb5/VMy0wrJmVG9PAL4oi/vWr8CCwZvut6LG
	bgx8kYmZdMLIw+hO7G1imKVsWOK46Uaj/pGQFCjPL0CK5llMYjmxUaWFjupRdJAp
	DojiJvRtFxtp1fbC0Y51KdHDxd4iTgLcudGv/2y9joceF7NK21EqPuFhp9vBp/DG
	Mr1h6o1uwl/xqAgXXnlbwqyx/z4fTFXUP1+eeaAFH0RCQyOQiLqKrFrdvXcDdzoo
	l70Dvg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ubgk5df-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 19:41:31 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c89704da8c7so3281143a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 12:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280491; x=1783885291; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=keNlL6A8+I5pnaNawbDLPC3Skjo9l1+hFMmFLmQIfDI=;
        b=kqRF9TElYXkvc/cPcAvQNe4XSBo8MalNXifwPqS9HEjFn4VMscbPeU69+uAT3PHItp
         Ny16l5Z/50r5o3w3y6vv202Vhs+6t5SfQZ/CEEweIUHU49FBvKSpyq9MHcuUE7mLQpts
         HpR5XIw64+3/hAOYskCzeQ7FnpTwbAu47zHl1fr/C968Vx1ssMBQU/K02+2zTHq2iaN7
         FFu+Q5ekKK491/hcuMTw/Tw0NT/Qz5BMg9E5kDULyrPLMzKFxTSRxRZrMNhs9NRv45B1
         o5Vyh/UUVj6CE4dgZmA8/98Kapm2yKnMaChQcDmgxe9iXfZ363FyJYyL0qF9uOwUMjbR
         sqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280491; x=1783885291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=keNlL6A8+I5pnaNawbDLPC3Skjo9l1+hFMmFLmQIfDI=;
        b=KImwfr3AEUt4q66EgjPiL4VR+mvu22j2870BBASiYLD3ElsXEsw5X6QowNpyUoX8rf
         NRbHqHg92q1SqgauFyCutfbrGkGZY8et0UzXZgQsbRnuzkeIF/YZS+bxhH1o3/C1Vt3Z
         VU+iJGmAtqq+mE95EVhdcZjD0EgGGbHnNf9wrm23QiRVnhhCP8vzNRiuE4xulsvZ1Oi5
         Tq2n8vqysBq9xpI3gJ6xXBFwVjEPeQ0xQf+V0J/+6O3NNTptiRrL+bzBiSMQUQRJUde1
         TCnCs6OAJbZdL4KfrBM9HUELF88KwQ+r0RHgC6EeHH/HemXo9H/AzwsSBKiryKQyqnJN
         7A2g==
X-Forwarded-Encrypted: i=1; AHgh+RqgY0DRX/HYlppyYoIEx9t3OaAbUx9tLpzBO/yx04OKUSVzX9TIhM2CNmRF9S1Rz+cdV4enMRjt1pkyLTNPEBx2@lists.infradead.org
X-Gm-Message-State: AOJu0YzwgZvEt0UBNq2vfqqitOWidsMQ0+FxEDN15L8YbrL8iXHSbqhy
	DnEmt/eWqpQRXTtdIRpkHQFce+FlMbPccvzUMMsHJf1Uw7+/EdiSH7kPKTmz6+CcYMI/mE4xzA6
	htVeWDLWdkg3gjLVrD2Dlj7xVbNpTdGMbQnCBixCo+r80CWFL2NVLYWUmhKxfINXku6PGBNpo0C
	Ul+g==
X-Gm-Gg: AfdE7cnKHZGcm330P/Vz05uqU7GoLG8cVcJS1kOxc8/uxlLhH9S2prF8ZfmoBr/WSPw
	n20YHQF2tinWwO6oe2Ld7P5aCjNfvdiYVqjme02QsFHP3dkAirny68ce/quqdfnwIyuz6sIR9KM
	O5H2B5JI/ruaqsrqSuO5CgGH4d28LlKtlBHj23ZgA/WHsnkJ5ygsy9MzJ8l3/1nVwn+QI9KlqCY
	nwxOpFNxqTnWQeEwcnsO0zxTU9RAE2LER4COIP+5P9hxJ5Gc3Q9X3SWvMuPNiUFKFYln4Nu/Hdc
	DtEeAvK74uzLtllo77gPOGWHHdKF6E4J1XGrX/OftfRanS9Zr9HY1eA4UBqzVheLrERVTsHiRf8
	wb5l7bnW3jF6iPTm9GaFD2PKjycRx7fm/9S7bLQ==
X-Received: by 2002:a05:6a21:4cc6:b0:3bf:a0e5:99a5 with SMTP id adf61e73a8af0-3c03e509089mr7554472637.47.1783280490841;
        Sun, 05 Jul 2026 12:41:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cc6:b0:3bf:a0e5:99a5 with SMTP id adf61e73a8af0-3c03e509089mr7554455637.47.1783280490326;
        Sun, 05 Jul 2026 12:41:30 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:30 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 42/42] ASoC: sprd: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:18 +0530
Message-ID: <20260705194019.2565498-10-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX3+/ar2hvwbUv
 PPyGXNLaQ8Tl/yMDhVx2nOGXdHQmPjBdNgLU2PEaAxOa69vU6rERxYtez2zqB3Bge/LSvUNqcmj
 GjG0CL9xcAb40gmGZBFpp4MW0myzRtU=
X-Proofpoint-ORIG-GUID: VkIGhWQT82J0Sw2MpbEVA0WL7R4NT4d1
X-Proofpoint-GUID: VkIGhWQT82J0Sw2MpbEVA0WL7R4NT4d1
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a4ab36b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=99hAX-h0IAisWkWT3OgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX8Xc59r5tBC9e
 oZFwauAaAqcYweNEPk36gLYpIiDmi0ZnL+OVGBb+pJDNCI3wNyx2Vk4K3i3tvIImwHKpxWxwG3C
 BFnAbuvJqVmwzVeyIgpk4EIlcXtNa/yTi4a9ptrF//INHs533qm9efeqYP7GhWB4g/DAvXpSKX8
 t12iSO4/E1HcQA60q8QYSK6qH1PqqMLaadC4W4M7chErLqDdwfx14+uNLGGvN/rFpCKOjOLpOJs
 N+c6nHy7KuisoXTBH+lRxcQEgnXIBnMF3ZPMRyia7us/qQVT1Q/cbjqc/8MVbVfqwzSXBSv8qLd
 dBJnZLOS+9HqSwoQWbo/RtXdih+L/uBH8A1K1OQQ8ngY98WUbYv64hm8TR92UoH9dR7ksYba7vU
 iEzPCk1GSyIQmOog26BtNBCZovoY7RuSkgD0OxFfvLuge9gyXi8d9myQW/rs92uhHUOsayC0B1h
 4ZB8qN0YBKw6+U1yJGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_124132_194358_F069325A 
X-CRM114-Status: GOOD (  15.80  )
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

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup — the driver has no remove function. Also drop the
now-unused local variable np.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/sprd/sprd-pcm-dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/sprd/sprd-pcm-dma.c b/sound/soc/sprd/sprd-pcm-dma.c
index cbf5bf82d96e..220f55d475af 100644
--- a/sound/soc/sprd/sprd-pcm-dma.c
+++ b/sound/soc/sprd/sprd-pcm-dma.c
@@ -459,10 +459,9 @@ static const struct snd_soc_component_driver sprd_soc_component = {
 
 static int sprd_soc_platform_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	int ret;
 
-	ret = of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
+	ret = devm_of_reserved_mem_device_init(&pdev->dev);
 	if (ret)
 		dev_warn(&pdev->dev,
 			 "no reserved DMA memory for audio platform device\n");
-- 
2.53.0


