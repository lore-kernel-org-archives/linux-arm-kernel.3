Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BAEC43602
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 19:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YE6y7UueLsf6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=; b=cSs1b51AptiTvN8VWT9mgGBxB1
	LicDulEstoOFm4pwfkw000ix2clHG/PNYyRkI/DILkmz7/mw6MBVG5MHjuTrzsAATwXXHrNISUcdX
	XoqoqWBqDgAddIY86ayB6bdbTxU1N4m6MZczgEQInmkRGduW1GfbFP+s0UeY3Rj2Txis90P8rHwQJ
	k+aRgOrObuIy+KHV9xuvZA0Xfq7tiBaKsh3biLQU7VZQo2B0Vqw5lzSgZeO/bBEeanZ65SAUofawN
	KLjpQH4L54CCltNNOVE40zljsK9FrAXStNABPETiW4lh8/0otPfcMKgtbYG8eZl9ODuTdqyg22tTJ
	kGaIEzsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSiE-00000009do9-0AcI;
	Sun, 05 Jul 2026 19:41:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSiC-00000009dmC-1p4L
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 19:41:09 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HhvUD2190406
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 19:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YE6y7UueLsf
	6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=; b=Gu2AUpMPsdWihBeIKFaHZTQdE6w
	3hlEj5FaB6LO25HrrwgnnnhbotR4nd9Z4wSGwf4UfkCGQV/6ByGXzYxc9t77t1UR
	KxydvfiZRzO7LVQt12P9iUwRudBr1BpCa8xRlWA11APsaC65cFh9VkqkdXLfhVEu
	RS7FUpWGXF4DoGxxuONB7a1iHQSW5kUybFXNTGlhVzncQd/ITVBR3Qzh2FEbhv44
	Ssss7TOOyxh8WnUK7ITPBb/1fcoeLek05gTbaYXanK/TXcrfcsX30aor/3gRRzD7
	xH/7V5eC+aAPsHQJS4BlpVVOM2yO5umWhzidCMbdBGwQ6NruQAfsY+kAKHw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6uf8358t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 19:41:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc640dfde3so14091035ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 12:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280465; x=1783885265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YE6y7UueLsf6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=;
        b=eV2IwkeMveZnv844kbPDCw+Exlso4ENegauz+kTAPAIgL5iZg/HmemcZeSTvvwkRBs
         NQsf2hd8naXNAKrxyJQxNrHL6ySG1zL/01dW5v43cdWqcctxqBPL9WdcZf6cyfMhdh1p
         lw035lCtTLAAgFQ1Ho+kJq+LRKrWL7mkbKXpZRAks4QRoIxhTYa+ZTdyNQE/yhtANUUP
         bTUFDLdSHTm4q0osKwLhqWwwSFirti40KOPIxLJrYtH4vvH+pOx7N6ixDtTipNtjdMc1
         reEJO1+7PsqVLks2unNml2SnO4/RGIuqliAA9Tc1e3iV9NWF2tCkW3NBlMBHppRqI8rt
         iEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280465; x=1783885265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YE6y7UueLsf6Wosu2MYgZO8ntkoAFUpog26frL0IVlI=;
        b=oD6NWSjWjy9kdkSgCGeOoLTo6rTQT5R2XS+xAIaRpqWbQ6oU7KM6NfU+b13YZnetbQ
         g2KGGQS8Qtcsf2OktydBpaA7POiNOk8S+6NC0Nquog73GNUN1KTUoY/GT/o8aJbiilJX
         OTGNCcsy37dfV0W7pcN8GbTg1sS3rkdbaNcjQJj58qJxYMS/J3Ff/qN65WQRW/jajNiC
         5Doe82reXqsfI3Lx3zns2ZdxOG59DGxDcwSj2zoFEdYrfiT6+aa5HLreTqO2mxuCgRGQ
         uGqZyMSDUPOu7Heopta6ei/zVNCZLkJSdZ9FGyM8j2KS0xj6VX8ylfLhHIpFaOXNWSiv
         LavQ==
X-Forwarded-Encrypted: i=1; AHgh+RrGepPdopdadJ19NtnE3M0JyJ+axkhjxYg8Nm5HsIhwO4gADpddPqUUoWb1WVtz9szSZKCc6cS5WMaabXCr34Pm@lists.infradead.org
X-Gm-Message-State: AOJu0YzsNzjhw6i2bi9R9a3rovZCCopIS4XVwSKq3qSm9jj6QntN0bVl
	5V4RjCb2MWQM9Vy1YUoerKWlQKDOdODp+D+MoBE3f8mfUSxS5q3pL7Z64AHBPnsUnX1vPqiXCcN
	Ycup997OSHJY3Ll6wOH8atgHUThBaUh+m6Yl7v4ANjLJhQ1qaK93xD9mWmKdLANT5dgq9VpioxK
	5hvg==
X-Gm-Gg: AfdE7cn7CivOCfAR+f1cpPgyMr4WnZOgKW4XXOBk3s2fjmHJz6oYJxP3vbqMDwb5nIt
	bNHICE/Eyn1nCyh6M9mpcrwd3K1BktMtOPWZyiuBSLDlaGJsuAsWO15QkEjtuyXoWm563/iS1ar
	v7dVPLM2LoORGK9vqpFkRnGTbH9Jowf6APoCoLHmPGFsRhr3MTsTysg46Svj4nU8uk+E5feAkE5
	VD9xPY74v1T5WvGclYEaJA980DSREEmI41eJpXSB2aozLNH3LLXJiMj5Dro/0dLKJCohdJAghxQ
	qXNSkVpIhYUX9LC90CradHA45rCe33VP5CttRGXAmh9Qk/n1RBOAm08Gr6emGtNXpVs8bJi47QX
	eqKONMtbH/cJFy0sTV1m53NT1oZCRanltUXddBw==
X-Received: by 2002:a17:902:f60a:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2cbb9e264d9mr68673595ad.17.1783280465194;
        Sun, 05 Jul 2026 12:41:05 -0700 (PDT)
X-Received: by 2002:a17:902:f60a:b0:2c7:f12d:5d37 with SMTP id d9443c01a7336-2cbb9e264d9mr68673415ad.17.1783280464710;
        Sun, 05 Jul 2026 12:41:04 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:04 -0700 (PDT)
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
Subject: [PATCH 38/42] ASoC: SOF: mediatek: mt8186: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:14 +0530
Message-ID: <20260705194019.2565498-6-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: znCJ9VP9TY4gWWADn4tkDVTyI_u9Cs0Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXyrgMSRgxwzVi
 sCfH15ghshqjSquOLdEbN34N2vsqJcc9+cIbWGQS8A1/keY7lcBFeIrSoin6yOIX1d3iUc5KB6M
 XakcCb9QBJ7wU3Fe3baaITDtSu6y9nQ=
X-Authority-Analysis: v=2.4 cv=Z4Tc2nRA c=1 sm=1 tr=0 ts=6a4ab353 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: znCJ9VP9TY4gWWADn4tkDVTyI_u9Cs0Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX9/2RUZx5Cnqh
 iRNhQmllFQYHkJdvh6t9ZAw+BBDmn9+wgs7hOQp6Plzny52iLreAiSThQ7MXwGJG1scSrBFYWbK
 MzcIMCFqQ4VqE8xiSt6KAQcyoDRMd4wyfyn+JYH0mi/vo7w59l3yOGVjzKZsPibEC9L1qHL85ho
 7ey2+Z9qrdUn6ojSgIc9nQqG9VkcSI6bhrMDqKEIal0qt4EzXfmSqFZAxVfOSod8G4Mvm75MhRx
 b7nTbIfldqKQvZ6O9aE5A0QJiqfLAwTz4uOPw1Q7qfbThZ9OeE7gx3Ob1rmVSdQNromeAn+Ik0b
 VIdzs/BXmDfDWamVdUpaHdw6ZQgz1Ec56wQ3fjzwT5r6jxz+ErzDvyK11XhrdUwBF/vdIso9HLZ
 OgUQ84ts0GE7JIdawZvu0upcfO4llgV4ziADXwTepjNYSuw0jsW06amGCO7tVDfRccqazlOLLOA
 Ncxck31NBam940sDJ5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_124108_470709_03889DB8 
X-CRM114-Status: GOOD (  15.39  )
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
 sound/soc/sof/mediatek/mt8186/mt8186.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index c1bea967737d..a5ccee87e684 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -49,7 +49,7 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 	struct mtk_adsp_chip_info *adsp = data;
 	int ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "of_reserved_mem_device_init failed\n");
 		return ret;
-- 
2.53.0


