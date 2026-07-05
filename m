Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0CEC44500
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 19:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WZiFjnWLtnNsmK5dA/42zGQp+sVNdR8iWt1Gg293cw0=; b=Ytezv8Fh/mCZ0oHMC/kQnka+Ca
	SPnz0atR8vGlQeV4jB8DvmFSTNaVJ7kys2pADCAqn9jdSPmw4I0RsRZ4OdPbUTd+kT3mFggBlGE2G
	b6n+G8bRcB7QYTdAgIi2VVYKDuyelcOnS2rBNTtzTqZKlwtQIdAQEHyJ/LRICNgOz0419Xx9J/4l2
	hbjksdOXq1YFqQeemewg/eDttwbtMIt0YNUn++1/8u+AKRKerr2AEU9c/Wc5aT0tsZTessKxILtkO
	iWTdZy79U1IKaxzouI7O5uRIA9R4f95Y/9WsnsEhNZjLimgwWC5owuO2yfeQy7lzX4Bz6gublTDF9
	DGlzm0XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSho-00000009dVh-0Lje;
	Sun, 05 Jul 2026 19:40:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgShl-00000009dUh-33Z2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 19:40:42 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hhl0x2271493
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 19:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WZiFjnWLtnN
	smK5dA/42zGQp+sVNdR8iWt1Gg293cw0=; b=BbBSGLsAqnWOATGTpRNCO1gHtgn
	+/zw/8wXZTNlV0J3BkwSreM5wcmTjEIf/OTa3q53G3k+GmVKk2WvAcGb1Ew8Q+8E
	QrpYExNDDivaknI9UzYxo3JTDkbOWqzrVRq+0pWix+SzBwl+OC9alMamMCk86nPx
	bmTcN5MVq2c1dhjwDSCMvlPP+5gNlCOpgfXdThV6SMKQM+0ZTQPkQ4Udmvt+mimB
	/CiyDPPnOPppMy7keT4n98UkPZmn2g6GcpUmf3hrAlfVAqeyUVB9oeO42PhzzgZB
	p0LNoVgtCvusL9jOPJlKPYe4pVrl4XUBs3oqCO5q6awivbcuGKDA559+r1g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qhnkmbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 19:40:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cac01e89e3so27436465ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 12:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280440; x=1783885240; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WZiFjnWLtnNsmK5dA/42zGQp+sVNdR8iWt1Gg293cw0=;
        b=O/ldWzOMRC66c/0+OX538drFQswmPZpHVlQ8HEb81RHsXfyBulMgz2j6G4oyIIoeO9
         AYEnp/t5AG8NlD5MCnKrTY1xWTNo2lQrIeMbNs9kZzfGIoMLn69f9D/MEEhsyknmZklh
         0mgtfiwUcxwK9nbrPIMHxb/m0o9U3TANw5EeP0UwmfrzICN3RT90TCxqvWRYYs/tSIo5
         GOoLuoX+sNdlW5knBfQCqRgloT1yRH/N6b3UCaUzpfFAHpyzzrjtJ8bzDVOV+DMS1PTU
         bDmNxgxIiJj+hHDMNgjSI/k4MJINU+IQgERDb/obn09L/A3Na+iwXwDFrIktz7RdsEML
         UGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280440; x=1783885240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WZiFjnWLtnNsmK5dA/42zGQp+sVNdR8iWt1Gg293cw0=;
        b=gwIrye+YyhiliZC1kCzQ0/GZ66SpdocJGM5mAb8HC1XrB4cRqj2Za+BBXE1EKxNOlL
         9Wo44sFpzIZRxDR1jahcNylil8dewPLlsM/f72kqz08Bf5xwaukHqV15e9v6wZlqGjab
         NYigrw8SExaaFXPXCdOF3if0vQFjAgoM2mfeCy7xRG1EoYetjZORiPfCzFHae7zSVjML
         kex07hfVH4oOrtVAz6ef38ZYCQp0HRAW2UQi83yqNKD+iHo/njIfbCjUn8CrpJhXeb+r
         9w5woB0CqoGqAfdMbmyQqc6mPHz+cVtB9ufJQP3fJ3G1ARlX3Uq3pdyjSmD+Dd3MBWk+
         Uj2w==
X-Forwarded-Encrypted: i=1; AHgh+RrrRq1UpI7Z7KjBzsJLD8Jb3EBRDa9HiopzwY3JE+9+4KlLSPkOzOW0Za8C14NxojZdVo89XX5tbqo2G1B9dZDK@lists.infradead.org
X-Gm-Message-State: AOJu0YxJwOXiE0SBFoLM7XuGbbqpeUxJ10H/fzb/U/oT4u/rhqfCr5PG
	nF1wa3f2rMyJ2BILFzcvgtyZmLZWvXo8hKGs+hc+ZGs30VZFFyE4fD/NAXeXhnNwkODyI4TaQOs
	Yj59mu0fOqqk80azbRAMqaxGv+XdUhjOMrzlkPS8vvJylzVPkrEWcPv/SIzbRUm149Q+7UdiDiK
	K1dQ==
X-Gm-Gg: AfdE7ckDur3lCSCaZ1+INnL7Ax5+CtrCKWRS0rrntz+xSMhS65NxWXY2JpSXnD3vVVD
	tkSTWYv3M1QQVVyW3BAm1GQa/x2rhoAPBoeRzRakGuqxPZ8KHRkFoRnNBo7y+u6dLrnB5FE9v69
	wo+gOrmkttY09eqRIvTCZStPg99Avv3Acg0NDYrRWoPj0iXMXz7NOpvPlpp/fDV6IItkwGcu+HU
	GRlveBnXy9kzrqCyBiwL7TUe75s6oCJlkU2U9u6QXRdO0aNlhCLF1ieuf5GlZEdphdtrhbz01x6
	SFQYQmbQnFlsERR6gPC7bvw+u4v6DobhzCEDz5wqP7wMKPWZXwjal+nrUIOEMT+1Ia2/juFpA8X
	phKPlIZbV6SGB27AsBjocqTyVznGaIWpl0WarFw==
X-Received: by 2002:a17:902:d591:b0:2bd:5ae4:26d1 with SMTP id d9443c01a7336-2cacb06f287mr116872245ad.17.1783280439588;
        Sun, 05 Jul 2026 12:40:39 -0700 (PDT)
X-Received: by 2002:a17:902:d591:b0:2bd:5ae4:26d1 with SMTP id d9443c01a7336-2cacb06f287mr116871975ad.17.1783280439045;
        Sun, 05 Jul 2026 12:40:39 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:38 -0700 (PDT)
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
Subject: [PATCH 34/42] ASoC: mediatek: mt8173: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:10 +0530
Message-ID: <20260705194019.2565498-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX7oVmCflVUw9W
 7vFz8CFtBuFdArakUVLWL3mjegoDVl675x0uBDrVcSD2acCbaMA9C512nnGqB7b/mrvZJPT5sie
 WInKLFS+lgUsrq1K3i3DgfSjVZUav/s=
X-Proofpoint-ORIG-GUID: rR1Gcox5qsUOJtcFQu1xu_DsjxDHby2S
X-Authority-Analysis: v=2.4 cv=J+yaKgnS c=1 sm=1 tr=0 ts=6a4ab338 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=2-kJ_DxirqQsj2pPc2sA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXznBKmgXDwOm6
 51vIFVk7pkJ9Da4vDQy+CrR3i+OLNeY2Ba3zeHzQFCiF75AMcOz0E9niCU6nN4F4eYSK//WMu0/
 8QMxsMXeT6y9fLCk+Vz+5woZFiH4yeU8R8NX66zb5e39Ig2S4WLUCBLDBugap7PKlwam486rv9N
 QQjS9vCUdtYqCMPsoZNbxanMeNwrH+AiyyvWHhXajn053ygF2WopNkqvQzn9euAPqEzgB1e4Mro
 r/WRlK/WBx9cP6XqvhjlSX7OJ+W65v+GMKWRpeTtNInsVtpJZxRHU+1o4FxGxDK5cuR8+z4ASjn
 JP8SOaajXH8IpfDystF4DXZblek7CKxoU8jPRKZN/SIiPY65tpd+yMTeMOn/8OGQFl70Bm1t65L
 KTCrC0vx4ROoJ2U5+0zFdlBlkfKFiBlRtUtH8R3sXxI68AKYCSPjqWu8csB6GyDWtoRmIqLKUs6
 9rLDLpkTfGKuEqdyPyA==
X-Proofpoint-GUID: rR1Gcox5qsUOJtcFQu1xu_DsjxDHby2S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_124041_887903_CB6BA382 
X-CRM114-Status: GOOD (  15.61  )
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
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index 69cadc91c97f..0424d79bc9b0 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1072,7 +1072,7 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	afe->dev = dev;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_info(dev, "no reserved memory found, pre-allocating buffers instead\n");
 		afe->preallocate_buffers = true;
-- 
2.53.0


