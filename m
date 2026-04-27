Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98978FF885E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 10:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JtaQpe253eJsHvP5zeIkziv60Cb5TqeInvdoSH2fo4M=; b=ef03aSx6jIanDNh1jUghFHhEum
	za6yL5Lz3oSNHvpl0F1cF7822oAeJCXrPcp0nplUWb30dIOdIsl2dGxOTOfs9v2H3rLpfHsI69Xa7
	Otauw/xujs+9X4hY/kSc/aVF73QZgREutYx2S5sbd9osdxTwZh7KdKSE5DyuLCZENzv+ahYAl8xt+
	faHLW2LBbl9e7dP8s3rPe2MZKOh8AU/rWIa+TtUr9Uad3lgUQexTJrcEUS2/G2erHLj3Qq303gVQV
	iI2RcSDHP2/2vPhz4N8rPapw9aiKiDHj2uaKED9y/PN7w5z1WVTQOVjD9FAydIv3pbtNGHxLQimps
	/Kn0HTWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIzd-0000000GfXg-3F4Z;
	Mon, 27 Apr 2026 10:15:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHIzS-0000000GfSm-3JMR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 10:15:00 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TEL7665693
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:14:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JtaQpe253eJsHvP5zeIkziv60Cb5TqeInvdoSH2fo4M=; b=RRECkOSqyqX8GGjm
	y2XRfUR2gk6fXqHOt2a5IJW0gM9qfBCX+LuyoqXTNyEialK5KPGULx6jKL6alnGW
	JqY++KjXAaX62QygQDBBL36QnktkrWwHkUVeDKSKUV4Do/ftP5yd6cCHcm5dnDH/
	YMXznRpmt1AUFONuQN2e7csoKaaBrmkizOFgNbiAAj88fpkcbEJ8/kPgwQSPKwil
	5wA4gV4HSWj4tFc/tp+fV+Vfb/ZQiuGu6ZsD+w5JpqujvGuh8XaPfbQDPQfV0yn2
	j57QRq8bZT2tQnfQz9RW1KSCsntMmU2SCtxZnE/kc9/VE9eQXn4yYbG3GPb4QhNG
	21GPpw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt30n0w3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 10:14:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50f817c3240so96888251cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 03:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777284897; x=1777889697; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JtaQpe253eJsHvP5zeIkziv60Cb5TqeInvdoSH2fo4M=;
        b=WVMfb9wTQLfUStRVDhyXXJ2iOxDx1c+hMwUTs3g5tLCcG93yOBzP0UcLXcQhTBb3Cu
         JfDq3IajHHsv3AcXWpJDVlByEPiIQMC/eGlZt6Cij4rVVVdydKNmV/UZYnOao12WN+yA
         oIvDcQB8DFI/hjO3EPl9tiMDs3rKY/ZhHKiJ/+YhXd9u8R5qNiyexIT7zbtwr0QUAyzQ
         /Xnu11RHGYpYDIIyGhCF4ZMeNT/cVujaKIVL+XQFx2hCNo0Ut56cNG8vBhvhQHE4e5DT
         r1E5u6ugzA7MMgBb87ITMMqRa8oSL2frdJ45AF+iF0BbGkp93IvXE095Y8pghYMMxcl8
         NRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777284897; x=1777889697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JtaQpe253eJsHvP5zeIkziv60Cb5TqeInvdoSH2fo4M=;
        b=lnJVs58U0rTSty1PuGBF1bUFxMZu097BCIWwFd7ht+9Ezk0NlH1OnZrTTY9bYk+9Mu
         fe6H8y6l4toAZ4vgnnefxsmfj43Hrx9ifvlAWkSb80RP+SlUXcZQcWoeS724isvu5f/w
         jHpJKOOYxYit+DecDbtrI/wyhnLLTE9EtZ5UlUFXG3uKuMciRa0hZ06hhrpBvnb6Si47
         wUfTcwLhpUKnjwxxVJY+dWA+odelZVQUVmyEQoQ1vBTa7UXfOhk5NY3Ttz+fR5QRWOl9
         HzhFzNtmES1z9PyHBcovH7+o6OO1VEpqt9pMnQiPROaTHHn7xkxGuIThikLWKAOANkXS
         eMjw==
X-Forwarded-Encrypted: i=1; AFNElJ/80co3eCopH7/gNmkHyY/0tOsT9B2bSc9kELhfZJ1ZpPNeUlP4v26Gy3Qpf3JJfBzJGUGgo/GINBqd1/ZBnVj0@lists.infradead.org
X-Gm-Message-State: AOJu0YzWSYPIZUAm1JgMB5GzyKoSdwgBftn8WyoMQz4WdL+6zC/OW5ci
	UxYIahzucW+QCFqEs4Hv3PlV/aOzVBUqYIwTrqDu5bgMzmJJVsmmnYW9QNDO9zfEjh1wTMtSWv1
	aIkCI7rAZpU2SDzdNFFXNDUuu4cBOeM3RZXinf+YVpBO4imKFGWNCGEVGv7kq93I34rvxigG1pv
	zVQgBxV7mJjg==
X-Gm-Gg: AeBDiesvO00NMD4xXAFmXXwoawAno2fer7H9zgruB+d/iTIoWS+nPrV5vsDvoR/x76y
	h5tmdQUIpn73AjJ/FdffCcI0GxrCEtX0iGmiZfpNLE7t6dmJKMaEKTi259r5rs28REQppS2qZEM
	Kq9pWzVO4A7tefq2/EqsNmiGfjh9C9VlE9PSJ/kh2fkZk8AHDoS/v5MkKFN4EJreLmt7Cbck0d/
	4Rp90++6FlQTdf88hq/WoyRuX7UsX80y7Ky8LnfiEUzK4j/mk0NdEUtWB3D9vtZiyQmsIczQskJ
	Y1ekljeiO+2bH+OD5yQ3zWNLeU7+Rf3dkRb/qTc+BZ5vBv8QrjYX8Pe6pN85u8Kmt0UxXdXR1MD
	y+XGCxeqaFdGesEZt0PhgzwCUCt5Ug8qDQ86F7y45QU/A/PoiszxvqIX7ijMBSg==
X-Received: by 2002:a05:622a:241:b0:50d:83d7:686c with SMTP id d75a77b69052e-50e36bd4e7bmr603678181cf.31.1777284897363;
        Mon, 27 Apr 2026 03:14:57 -0700 (PDT)
X-Received: by 2002:a05:622a:241:b0:50d:83d7:686c with SMTP id d75a77b69052e-50e36bd4e7bmr603677961cf.31.1777284896903;
        Mon, 27 Apr 2026 03:14:56 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb74c789sm235103445e9.5.2026.04.27.03.14.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:14:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:14:34 +0200
Subject: [PATCH v2 3/4] ARM: pxa: pxa25x: attach software node to its
 target GPIO controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-pxa-gpio-swnodes-v2-3-86fc24b9e714@oss.qualcomm.com>
References: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com>
In-Reply-To: <20260427-pxa-gpio-swnodes-v2-0-86fc24b9e714@oss.qualcomm.com>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1389;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=VmmO4qp9D9uqRUDY7NNT3+l5X/ukLWsVmoA+H8XHpHk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7zcVF262VXdTwZHMNI8avyuJsAR0h23TRHPFv
 qns6fdj0SKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae83FQAKCRAFnS7L/zaE
 w1iuD/0UEtdioGyNBA7WpCYyMyJt4pvWzpZzpzqmiE3kKSQMybw4T9q15gYIqNwg+m+KZB1L7lw
 qL6LZ2TMB9zpRdt3YOQQ45xHBdUy7CvxqeMhhvb5by2uF9zh9FmLiy0bg02cBIVZQExM/awVIxj
 UbWqEeuXolZw4iGaWaLuCBuUbx/U57b10CitOxktqdhAiz8ia1TWLOkgqIJA6VWrgyEGF7NRRs/
 O74+C07ua/cCtydQ2/e+vnLZ3TrhfEslSrvFNZ+eR5V5W1QtL9u8EhRKK4n7l3ksLKV6fGDNsx8
 P4d+AfcKeW7KmcgyHiHr6vDHN0QMA/xEmFo5dO8giPjkhs/b4fvFi6xOL4kWeExEnYjtdS/2Z1f
 lPQ17rBOzlw2riByT9oX3WGXmdxof7/gPwQNshvPIM4qPsAy6Gn57tXq26nEYhet3PZFx4DTcHa
 gMEEaLJCdN8VDN7qCBQJ+E5nKe48Jl6impJVH0FWavFHpAFMHmMZYptJygKaP8bNHOkqF4StNte
 SEPdZbs1NrhVIDfgeQim/4QpR2jb6rC6560ylfoguCcNrAH+CsmDuwjiFDTxF+5vVQODrUvKs4i
 0PoPUh4hZVUtUClT0CQ0ELo5Rv8/duMyuKb02f2l/DMgZX9lVkOfVn2HBWdQoW4op7V4VTHxK6S
 hTyEMdro0pu+eoA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEwOCBTYWx0ZWRfX4wPPC16RBH/d
 k6UkO0ubsQ+kkjYpCDN3DctY/AsOmyZEqvzGJCiqo5nR9f8f7gkeb86BCYtWGwA22r20zY5Mo3L
 VEdCxi9MkDcAJcoKMsdbvFbzFAr2nyuRLo/dycEaioTpiiKhOE755FLZ6CVrbEZIE4PUtsqnxXG
 jYjjrfL/UyroKXnLSwrBI23zYFQ8Xp8s2h9Ahmd53DWHKxMRwTfPrcYHxNsktE1lB/8spcAG4a3
 tYT1YCGZyS/vMhsi5WU2K0OMG/1GK8DZ4fV4yhqgppwGcYciodRRMYRuEnq7Dx9LBXTfkvXIURi
 cxTtvB/SZCflw+eAvZ231e2qLbh5C9ucbIuIhNA1MFWxfpYtbX2vewfu1IWgKltL8U2AUDlQJak
 du/tXj6r+E4pvSoZZHpHKWec3bvIzW5nScrQgFOqMiF0Xxi9i6lH5Iloon5b4hn4Xjdk0icrzV7
 ogaQW0IAOfRbgLC45nA==
X-Proofpoint-GUID: odatTa0uZ4F4FX5P_BwIjPNlCNBb65x4
X-Authority-Analysis: v=2.4 cv=efANubEH c=1 sm=1 tr=0 ts=69ef3722 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=quDaMypmeenIOiKoCAoA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: odatTa0uZ4F4FX5P_BwIjPNlCNBb65x4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_031458_935691_FE55CFF1 
X-CRM114-Status: GOOD (  19.22  )
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

Software node describing the GPIO controller for the pxa25x platforms is
currently "dangling" - it's not actually attached to the relevant
controller and doesn't allow real fwnode lookup. Attach it once it's
registered as a firmware node before adding the platform device.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-pxa/pxa25x.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mach-pxa/pxa25x.c b/arch/arm/mach-pxa/pxa25x.c
index 70509a5998142ec6b9c484e5f094751eda6db6cd..6875774f2cae1db4798d18c813f445bdc31b15de 100644
--- a/arch/arm/mach-pxa/pxa25x.c
+++ b/arch/arm/mach-pxa/pxa25x.c
@@ -179,7 +179,6 @@ void __init pxa25x_map_io(void)
 }
 
 static struct platform_device *pxa25x_devices[] __initdata = {
-	&pxa25x_device_gpio,
 	&pxa25x_device_udc,
 	&pxa_device_pmu,
 	&pxa_device_i2s,
@@ -240,6 +239,10 @@ static int __init pxa25x_init(void)
 
 		if (!of_have_populated_dt()) {
 			software_node_register(&pxa2xx_gpiochip_node);
+			pxa25x_device_gpio.dev.fwnode = software_node_fwnode(
+								&pxa2xx_gpiochip_node);
+			platform_device_register(&pxa25x_device_gpio);
+
 			pxa2xx_set_dmac_info(&pxa25x_dma_pdata);
 			ret = platform_add_devices(pxa25x_devices,
 						   ARRAY_SIZE(pxa25x_devices));

-- 
2.47.3


