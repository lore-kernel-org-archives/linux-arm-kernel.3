Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6ECDC44500
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 19:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VVldA6NTRnpwPp0U9xX7eE/7+mcCmlhnYAOTkmKf4Os=; b=sCKmsKm9RnLxaQfFw8dhXo+rQi
	P/XAfY4bkx/XJehz4hR0jiJATMF51M4oNBgyaK9nYze0G5ftDF/7sw8UQSTwAxAsgRtMoqp+l7PPx
	gfgOD4wR3fRsvetT/ckCdcJ13+Jp6eHYD6LAvkdXI4mlliS7pci0sXynZRLI0Tf7tSRxWwBXhsAYQ
	ri3AKNU9nAjg0HYBzm8N0PT0EFl8Gz1f/odwqLi2a1vIl4JSkvp9Kggo2PU6rI6DNrFWwacBSiJBH
	g0Y1glkH+Kb6NlxVDTqHwYILbSO/nwFLA2joboWDF8lmC9Gr/xQ8bI/XQtlLCqLUav1N/nESqxBYW
	yd8HE7Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSiQ-00000009e2u-34AP;
	Sun, 05 Jul 2026 19:41:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSiN-00000009dyU-0yQD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 19:41:21 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HhmFe2342812
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 19:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VVldA6NTRnp
	wPp0U9xX7eE/7+mcCmlhnYAOTkmKf4Os=; b=PVhvB4arTRaJVhF2SofLv+u1aVD
	jK8zIqELdsOTMECr0irbXF13Py7AAvUWwCcgloBqNe5sydVgobN3ykdNbR62SDhl
	xSdi8gXykZAYDggG/l29V+pDv8vxNl/8bfs3RsFDtihqoBwh9TvV8ccwG6jurLqz
	hXyA3tzVzG/9j/LFOunKeib03MEp2rrcHiuWykXLV2BW7biJwWZULRxuE/380H/W
	jxvEJrmSgF/oSVLpQz6WOjtRFsfVbrSe0a7iY0325hYiJ5tqlT9bhtEQhpDaeG/2
	q5Zdnz1hGEN80AyPY0gPhol8PR+yZE2CguSboTpYR821bg4icMzfKXPz3+g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3ba36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 19:41:18 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ca5d2474c7so54521655ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 12:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280478; x=1783885278; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVldA6NTRnpwPp0U9xX7eE/7+mcCmlhnYAOTkmKf4Os=;
        b=TJajqnVINmB2U+cFdLH0hPGeUw6cOlYx+HagTTNfEoC/fKG17axPkrb7yfMceOdwCu
         bWbuva7d6wxHzEkJRWsLdF3gWWAXPtdu8sbiSsKu1fURb7jRYDWFtkmgltsuc84k0LMC
         Nnh8C4VDkvuaSb2iNFGl/i5N/HAttcSXKf2QkTdJiqE2o97kPA18RvGVhwhwuHH8KYJY
         TmJa5QrLptZQYlVDteNt7qsJaV1sbwAgNPW6QBK5exk+6/SHDDn5gSdGLwvCy7ZBaMHm
         C2pVyzRDVEZjS76d6URSDPV88tKRP5QflhykbS5JBbhxbazMnIA0jct1TS8WCenUptVj
         7QLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280478; x=1783885278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VVldA6NTRnpwPp0U9xX7eE/7+mcCmlhnYAOTkmKf4Os=;
        b=icn3ZfAPW7A8vrmBzO3imQ3x2enyD2NgYsumIjz7cjfCOFjDK2MYcP6EiEHZeeY/vw
         y/6+chOIxKUF/j2zC0cRbRuB4nNoFuQPeWDk3oD5kw+W9U16FI97TIDSRFGnLRD6Uo4n
         Zwkf2cfJvmD2xnPp9kvWRVtX/kpprTnn79Q6BGYmO+jkr8I5wYvoi0sj/dqcG/nU0oyn
         lNvDHIhMyoOvWkVzhnZ3ujITPlgZ0QKGId8H8g5a+D65lTBjbahEuNpdgVqABeYIxm+I
         HxM20zXfyFAsfV4tVUyZ09xzCAQoDl6eOsNSfdQQLMJBm0JZl4/o3BHPGtwJHYOT9hrs
         q7YQ==
X-Forwarded-Encrypted: i=1; AHgh+RqQlJRO7yLeJESq2X4+bq1KhmHJn7cNa6zutswGXI7hWxXnUMJby+FCDjCv6ApHaKrucwWycVAAHSOo5m8TgvQh@lists.infradead.org
X-Gm-Message-State: AOJu0YxeiJZII/CrjBM2CrUmsaBbZOSDSJvecJOwGRWJL/6gyHM4l9Dc
	3yUuEsIrYR/vnsX5doFhkGosZ7dVfOfNf4cJ02lqkMiL/Bn4aBSF8jT+2sYBGFb6KGi2asv3pIM
	TH7ehUTmCAl0GWbQdcV4ydLlf9Pt4OuZknOboRYG9RxgrDo+IbdP60Dt7q8eS3rF0XW5G6mCPhs
	47tQ==
X-Gm-Gg: AfdE7cmaXmAycIvXXmJrxpnGLpreE7euxilvFduGwFG8d4gT7KBbfxD/FUofI0n5IeO
	ckCJOzf5NyF+0MZ6PpR6t6mX/Flx7jL+qOzIFHXHpGWnDflm6LbXtoInBICtmG4HpGNleDKI0A2
	6KUhOeWVIVC3AmY/dpKU9Ni9zfDhnXVTyGIcluKgbPaI/2csLyF7T2allqIeL4GjDPtkmTsFL9M
	0hFkFiM8JkRdI0YcnIDZ5GHoYc65WKWxJfsp0f71ikRqnKoFK0Kx1sYhX8T2SRh6Ggkw4tj/nFJ
	C9BZT6+pfnzHXzDosMKNx4/PvNVqEVHmCG8F1eyjpHY/61pzmw3WNBBYuJa8o0qgUohiKz8QvP9
	pk4A7l5AtBzN3MQDnVTOFZJlmAAFdoRyJbU/FCg==
X-Received: by 2002:a17:902:ce12:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2cbb9eba53bmr79826165ad.34.1783280478039;
        Sun, 05 Jul 2026 12:41:18 -0700 (PDT)
X-Received: by 2002:a17:902:ce12:b0:2c9:c46b:1286 with SMTP id d9443c01a7336-2cbb9eba53bmr79825855ad.34.1783280477546;
        Sun, 05 Jul 2026 12:41:17 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:17 -0700 (PDT)
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
Subject: [PATCH 40/42] misc: fastrpc: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:16 +0530
Message-ID: <20260705194019.2565498-8-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX7v2fa7eMZTpJ
 TG8ZTrDauSiqEMDE7/S5MtmoQykAxkZVIES8YwsIZQOm0MGZfNAy2dO9mqXNCIIaLcQadwF+z7M
 dmRTL9hgpsohB4BvAYt/AFQn5C5JNUA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXxHMMu4zpdRPd
 EPUlu67udf2BTCIZD2pA9KCUGnGSFXOeL+Z4IduHHuqYyBOdTPpP8pjONUUlE/Q6V9NGkJ9Vpai
 lPK5qfFYZDiSNXMIAEW3tkcKjE9Szdg92FhfAqAgzMpPMIUy7tubOE6N5voTBFQsjFS8AWzSI8W
 3w6CeEBtvj15H15fR022afpmp8/KOYfIp5fi3iPF9vbW+tseiNS6TNsPhezIUL2p0AEh2bpF5Co
 S+dRqHrCi1telE+0Nx6Z+7Y8vpaipHLgnFimoVuF01IZznHx7lYiWQVbwJ7hnN/krgDLIDKvYoC
 AOiEvhx0aw7dsaCueUQbJkwqRWY9pN2jqeqzvErFOF+uYUKVyXS9spw/jBJEJgEfJakSJzl+kZD
 Wb0cft6Ti5rPH9iP+6FLn72k3c+fPravzof+I4MnDvRg+UeofXr+elgRYWgkZQ0Fvbn2/XM5DoJ
 S//Qox8r/KrsSb1dRJA==
X-Proofpoint-GUID: zgpRdxdUPjaT58MDWz2CsTP1TLb03u68
X-Proofpoint-ORIG-GUID: zgpRdxdUPjaT58MDWz2CsTP1TLb03u68
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4ab35e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=2vM2yDDFhuSsTauGYd8A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_124119_267482_B6DD0F15 
X-CRM114-Status: GOOD (  13.98  )
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
missing of_reserved_mem_device_release() in fastrpc_rpmsg_remove().

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d86e79134c68..c4e05b0db527 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2396,7 +2396,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 		return -EINVAL;
 	}
 
-	if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
+	if (devm_of_reserved_mem_device_init(rdev))
 		dev_info(rdev, "no reserved DMA memory for FASTRPC\n");
 
 	vmcount = of_property_read_variable_u32_array(rdev->of_node,
-- 
2.53.0


